<nav class="navbar" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="<{$icms_url}>">
				<img src="<{$icms_imageurl}>assets/img/logo.svg" alt="ImpressCMS logo" width="112" height="28">
			</a>

			<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarSite">
				<span aria-hidden="true"></span>
				<span aria-hidden="true"></span>
				<span aria-hidden="true"></span>
			</a>
		</div>

	<div id="navbarSite" class="navbar-menu">
		<{if $xoBlocks.menu_block}>
		<div class="navbar-start">
			<{foreach item=block from=$xoBlocks.menu_block name=block}>
			<{$block.content}>
			<{/foreach}>
		</div>
		<{/if}>
		<{if $xoBlocks.topbar}>
			<div class="navbar-end">
		<{foreach item=block from=$xoBlocks.topbar name=block}>
				<{$block.content}>
		<{/foreach}>
			</div>
		<{/if}>
	</div>
</nav>
