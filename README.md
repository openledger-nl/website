# website

[![Netlify Status](https://api.netlify.com/api/v1/badges/6a279166-98b2-4c4a-b6c2-69e5b3878928/deploy-status)](https://app.netlify.com/projects/open-ledger/deploys)

The one-page site for Ledger and Margin, in SvelteKit, prerendered to static files.

```sh
npm install
sh scripts/fetch-extensions.sh   # optional: the newest installers, for the install buttons
npm run dev      # http://localhost:5173
npm run check    # svelte-check
npm run build    # build/
```

Netlify first fetches the newest Margin installers from the
[Latest release](https://github.com/openledger-nl/margin/releases/latest) into `static/downloads/`
(`scripts/fetch-extensions.sh`), then builds it (`netlify.toml`). Margin's CI triggers a new build after every release.
