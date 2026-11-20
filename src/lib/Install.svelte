<script lang="ts">
	import { onMount } from 'svelte';
	import { MARGIN_RELEASE } from './links';

	// The install box of a Margin extension. The newest installers are in /downloads/ (the Netlify build fetches
	// them from the Latest release, see netlify.toml); without them the buttons lead to the release page.
	// The button for the browser you are in comes first: in Firefox the signed .xpi installs in one click.
	let { ext }: { ext: 'margin-github' | 'margin-browser-review' } = $props();

	let have = $state<string[]>([]);
	let firefox = $state(false);
	let ready = $state(false);

	onMount(async () => {
		firefox = /firefox/i.test(navigator.userAgent);
		try {
			const r = await fetch('/downloads/available.json');
			if (r.ok) have = await r.json();
		} catch {
			// No downloads/ (a local dev server): keep the release page links.
		}
		ready = true;
	});

	const has = (kind: string) => have.includes(`${ext}-${kind}`);
	let xpi = $derived(has('firefox.xpi'));
	let ffZip = $derived(!xpi && has('firefox.zip'));
	let ffHref = $derived(xpi ? `/downloads/${ext}-firefox.xpi` : ffZip ? `/downloads/${ext}-firefox.zip` : MARGIN_RELEASE);
	let crZip = $derived(has('chrome.zip'));
	let crHref = $derived(crZip ? `/downloads/${ext}-chrome.zip` : MARGIN_RELEASE);
</script>

<div class="install" class:is-firefox={firefox}>
	<div class="install-btns">
		<a class="btn go" class:alt={ready && firefox} href={crHref} download={crZip ? '' : undefined}>
			Download for Chrome, Brave, Edge
		</a>
		<a class="btn go ff" class:alt={ready && !firefox} href={ffHref} download={ffZip ? '' : undefined}>
			{ffZip ? 'Download for Firefox' : 'Add to Firefox'}
		</a>
	</div>
	{#if !firefox}
		<ol class="steps">
			<li>Unzip the download into a folder you keep.</li>
			<li>Open <code>chrome://extensions</code> and turn on <b>Developer mode</b>.</li>
			<li>Click <b>Load unpacked</b> and pick that folder.</li>
		</ol>
	{:else if ffZip}
		<ol class="steps">
			<li>Open <code>about:debugging#/runtime/this-firefox</code>.</li>
			<li>
				Click <b>Load Temporary Add-on</b> and pick the downloaded zip. It stays until Firefox closes; a signed version
				that installs for good is on its way.
			</li>
		</ol>
	{/if}
</div>

<style>
	.install {
		margin-top: 12px;
		padding: 10px 12px;
		background: #f6f5ef;
		border: 1px solid #c5c2b2;
		border-radius: 4px;
	}
	.install-btns {
		display: flex;
		flex-wrap: wrap;
		gap: 6px;
	}
	.install-btns .btn {
		margin: 0;
	}
	.is-firefox .ff {
		order: -1;
	}
	.btn.alt {
		font-weight: normal;
	}
	.steps {
		margin: 10px 0 0;
		padding-left: 20px;
		font-size: 12px;
		color: #333;
	}
	.steps li {
		margin: 2px 0;
	}
</style>
