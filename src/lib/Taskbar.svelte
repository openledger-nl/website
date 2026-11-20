<script lang="ts">
	import { onMount } from 'svelte';
	import { LEDGER_RELEASE } from './links';

	// The taskbar along the bottom: Download (Ledger), a button per window, and a clock.
	let clock = $state('');

	onMount(() => {
		const tick = () => {
			const d = new Date();
			clock = `${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}`;
		};
		tick();
		const timer = setInterval(tick, 15000);
		return () => clearInterval(timer);
	});
</script>

<nav class="taskbar">
	<a class="dl" href={LEDGER_RELEASE}>Download</a>
	<a class="task" href="#ledger"><img src="/img/ledger-mark.svg" alt="" />Ledger</a>
	<a class="task" href="#margin"><img src="/img/margin-mark.svg" alt="" />Margin</a>
	<div class="tray"><span>{clock}</span></div>
</nav>
