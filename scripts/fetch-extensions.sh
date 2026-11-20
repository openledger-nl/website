#!/bin/sh
# Netlify build step: copies the installers of the newest Margin release (the Latest release of
# openledger-nl/margin, same file names every version) into downloads/, and lists the ones that
# exist in downloads/available.json for the page. The Firefox build is a signed .xpi once Mozilla
# signs it, an unsigned zip until then; the page offers whichever is there.
set -u
base=https://github.com/openledger-nl/margin/releases/latest/download
mkdir -p downloads
list=""
for ext in margin-browser-review margin-github; do
  for kind in firefox.xpi firefox.zip chrome.zip; do
    name="$ext-$kind"
    if curl -fsSL --retry 3 -o "downloads/$name" "$base/$name"; then
      echo "got $name"
      list="$list${list:+,}\"$name\""
    else
      rm -f "downloads/$name"
      echo "no $name"
    fi
  done
done
echo "[$list]" > downloads/available.json
cat downloads/available.json
