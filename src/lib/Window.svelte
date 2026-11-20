<script lang="ts">
	import type { Snippet } from 'svelte';

	// A desktop window: title bar with the three buttons, an optional menu bar, the content and a status bar.
	let {
		title,
		icon,
		id,
		class: cls = '',
		menubar = false,
		status,
		children
	}: {
		title: string;
		icon: string;
		id?: string;
		class?: string;
		menubar?: boolean;
		status?: Snippet;
		children: Snippet;
	} = $props();

	const menus = ['File', 'Edit', 'View', 'Favorites', 'Tools', 'Help'];
</script>

<div class="win {cls}" {id}>
	<div class="titlebar">
		<img src={icon} alt="" />
		<span class="t">{title}</span>
		<span class="ctl" aria-hidden="true"><span>_</span><span>&#9633;</span><span class="x">&times;</span></span>
	</div>
	{#if menubar}
		<div class="menubar" aria-hidden="true">
			{#each menus as m (m)}<span><u>{m[0]}</u>{m.slice(1)}</span>{/each}
		</div>
	{/if}
	{@render children()}
	{#if status}<div class="statusbar">{@render status()}</div>{/if}
</div>
