<script lang="ts">
	// A command in a Command Prompt window, with a Copy button.
	let { command }: { command: string } = $props();

	let copied = $state(false);

	async function copy() {
		await navigator.clipboard.writeText(command);
		copied = true;
		setTimeout(() => (copied = false), 1500);
	}
</script>

<div class="cmdwin">
	<div class="titlebar"><span class="t">Command Prompt</span></div>
	<div class="cmd">
		<code>{command}</code>
		<button class="btn" type="button" onclick={copy}>{copied ? 'Copied' : 'Copy'}</button>
	</div>
</div>
