<script lang="ts">
	import CommandPrompt from '$lib/CommandPrompt.svelte';
	import Install from '$lib/Install.svelte';
	import Taskbar from '$lib/Taskbar.svelte';
	import Window from '$lib/Window.svelte';
	import {
		BROWSER_REVIEW_SOURCE,
		LEDGER_RELEASE,
		LEDGER_REPO,
		MARGIN_GITHUB_SOURCE,
		MARGIN_RELEASE,
		MARGIN_REPO,
		MCP_COMMAND,
		ORG
	} from '$lib/links';
</script>

<svelte:head>
	<title>Ledger and Margin</title>
	<meta
		name="description"
		content="Ledger, a desktop app for your threads and deliverables. Margin, browser extensions for reviewing your app with Claude Code and for a cleaner GitHub."
	/>
</svelte:head>

<div class="desktop">
	<Window title="Welcome" icon="/favicon.png" class="welcome">
		<div class="content">
			<div class="icon"><img src="/img/ledger-mark.svg" alt="" /><img src="/img/margin-mark.svg" alt="" /></div>
			<div>
				<h1>Ledger and Margin</h1>
				<p>A desktop app for your own thinking, and browser extensions that get things out of your way.</p>
				<p>Built by us. Source on <a href={ORG}>GitHub</a>.</p>
				<a class="btn" href="#ledger">Ledger</a><a class="btn" href="#margin">Margin</a>
			</div>
		</div>
	</Window>

	<div class="ticker" aria-hidden="true">
		<span
			>*** Ledger 0.8.0 is out for Windows, macOS and Linux *** Margin Browser Review for Chrome and Firefox *** New:
			Margin for GitHub, a GitHub homepage with your own work ***</span
		>
	</div>

	<Window title="Ledger" icon="/img/ledger-mark.svg" id="ledger" menubar>
		<div class="explorer">
			<aside class="pane">
				<div class="group">
					<h4 class="dark">Get Ledger</h4>
					<ul>
						<li><a href={LEDGER_RELEASE}>Download for Windows</a></li>
						<li><a href={LEDGER_RELEASE}>Download for macOS</a></li>
						<li><a href={LEDGER_RELEASE}>Download for Linux</a></li>
					</ul>
				</div>
				<div class="group">
					<h4>Other places</h4>
					<ul>
						<li><a href={LEDGER_REPO}>Source code</a></li>
						<li><a href="{LEDGER_REPO}/releases">All releases</a></li>
						<li><a href="#margin">Margin</a></li>
					</ul>
				</div>
				<div class="group">
					<h4>Details</h4>
					<p>.exe for Windows, .dmg for macOS, .deb, .rpm and .AppImage for Linux.</p>
				</div>
			</aside>
			<div class="content">
				<img class="logo" src="/img/ledger-wordmark-on-light.svg" alt="Ledger" width="170" height="42" />
				<h2>Your thought process, separated from AI.</h2>
				<p class="lead">
					A desktop app for Windows, macOS and Linux. Think in threads, ask for deliverables, give feedback on them and
					plan the work, per project.
				</p>
				<ul class="dots">
					<li><b>Threads</b>: one per topic, a timeline of notes, prompts, feedback and uploads.</li>
					<li><b>Deliverables</b>: edit them in the app, publish fixed versions, give feedback on the whole file or on one passage.</li>
					<li><b>Claude Code</b> runs your prompts, and every version records who made it: you or Claude.</li>
					<li><b>Projects</b> with a board, user stories, templates and the people involved.</li>
					<li><b>Plain files</b>: your vault is a folder of markdown files that also opens in Obsidian.</li>
					<li><b>Sync</b> to a private GitHub repository, optionally encrypted (AES-256-GCM).</li>
				</ul>
				<a class="btn go" href={LEDGER_RELEASE}>Download</a><a class="btn" href={LEDGER_REPO}>Source</a>
			</div>
		</div>
		{#snippet status()}<span>Windows, macOS, Linux</span><span>Version 0.8.0</span>{/snippet}
	</Window>

	<Window title="Margin" icon="/img/margin-mark.svg" id="margin" menubar>
		<div class="explorer">
			<aside class="pane">
				<div class="group">
					<h4 class="dark">Browser Review</h4>
					<ul>
						<li><a href="#browser-review">Install</a></li>
						<li><a href={BROWSER_REVIEW_SOURCE}>Setup and source</a></li>
						<li><a href="{MARGIN_REPO}/releases">All releases</a></li>
					</ul>
				</div>
				<div class="group">
					<h4 class="dark">Margin for GitHub</h4>
					<ul>
						<li><a href="#margin-github">Install</a></li>
						<li><a href={MARGIN_GITHUB_SOURCE}>Source</a></li>
					</ul>
				</div>
				<div class="group">
					<h4>Details</h4>
					<p>Chrome and Firefox. Brave and Edge work too. Free and MIT licensed.</p>
				</div>
			</aside>
			<div class="content">
				<img class="logo" src="/img/margin-wordmark-on-light.svg" alt="Margin" width="145" height="42" />
				<h2>Browser extensions for Chrome and Firefox.</h2>
				<p class="lead">Brave and Edge work too. Free and MIT licensed.</p>

				<h3 id="browser-review">Margin Browser Review</h3>
				<p>Review your own dev app in the browser, and let Claude Code fix it.</p>
				<ul class="dots">
					<li><b>Comment</b> on the page or on one element, <b>remove</b> an element, or <b>edit</b> its text and CSS with a live preview.</li>
					<li>Claude Code reads every comment over MCP, with the selector, HTML, source file and a screenshot, fixes it in your code and marks it ready for review.</li>
					<li>You accept it or reopen it in the browser.</li>
					<li>Runs on localhost and dev domains like <code>*.test</code>. Everything stays on your machine.</li>
				</ul>
				<Install ext="margin-browser-review" />
				<p style="margin:14px 0 0">Then connect Claude Code once (<a href={BROWSER_REVIEW_SOURCE}>setup and source</a>):</p>
				<CommandPrompt command={MCP_COMMAND} />
				<div class="shotwin">
					<div class="titlebar"><span class="t">browser-review.webp</span></div>
					<img
						src="/img/browser-review.webp"
						alt="The Margin Browser Review side panel next to a page, with three threads Claude is working on"
						width="1200"
						height="964"
						loading="lazy"
						decoding="async"
					/>
				</div>

				<h3 id="margin-github">Margin for GitHub</h3>
				<p>A GitHub homepage that shows your own work. No token: it uses the session you're logged in with.</p>
				<ul class="dots">
					<li>Your organizations, the repositories you pushed to last (with the branch), and all your repositories with search, filter and sort.</li>
					<li>GitHub's side menu shows your recent pushes instead of "Top repositories".</li>
					<li>Switches to hide Copilot, banners, sidebar sections and the footer.</li>
				</ul>
				<Install ext="margin-github" />
				<a class="btn" href={MARGIN_GITHUB_SOURCE}>Source</a>
			</div>
		</div>
		{#snippet status()}<span>Chrome, Firefox, Brave, Edge</span><span><a href={MARGIN_RELEASE}>Newest release</a></span>{/snippet}
	</Window>

	<p class="small">Best viewed in any browser. <a href={ORG}>github.com/openledger-nl</a></p>
</div>

<Taskbar />
