#!/bin/sh
# Netlify build step: copies the newest Margin extension builds from the rolling releases of
# openledger-nl/margin (browser-review-latest, margin-github-latest) into downloads/, and lists
# the ones that exist in downloads/available.json for the page. A missing file (no signed .xpi
# yet, say) is left out; the page then offers what is there.
set -u
base=https://github.com/openledger-nl/margin/releases/download
mkdir -p downloads
list=""
for ext in browser-review margin-github; do
  for kind in chrome.zip firefox.zip firefox.xpi; do
    name="$ext-$kind"
    if curl -fsSL --retry 3 -o "downloads/$name" "$base/$ext-latest/$name"; then
      echo "got $name"
      list="$list${list:+,}\"$name\""
    else
      rm -f "downloads/$name"
      echo "no $name yet"
    fi
  done
done
echo "[$list]" > downloads/available.json
cat downloads/available.json
