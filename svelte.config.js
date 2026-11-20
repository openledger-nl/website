import adapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
export default {
	kit: {
		// Every page is prerendered to plain HTML in build/.
		adapter: adapter()
	}
};
