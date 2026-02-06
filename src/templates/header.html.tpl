<nav class="navbar" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="<{$icms_url}>" aria-label="Home">
				<img src="<{$icms_imageurl}>assets/img/logo.svg" alt="ImpressCMS logo" width="112" height="28">
			</a>
			<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarSite">
				<span aria-hidden="true"></span>
				<span aria-hidden="true"></span>
				<span aria-hidden="true"></span>
			</a>
		</div>
		<div id="navbarSite" class="navbar-menu">
		<{if $xoBlocks.menu_block_left}>
			<div class="navbar-start">
				<{foreach item=block from=$xoBlocks.menu_block_left name=menu}>
					<div class="navbar-item" role="presentation">
						<{$block.content}>
						<span class="visually-hidden"><{$block.caption}></span>
					</div>
					<{/foreach}>
				</div>
		<{else}>
			<div class="navbar-end">
				<{foreach item=block from=$xoBlocks.menu_block_right name=menu}>
					<div class="navbar-item" role="presentation">
						<{$block.content}>
						<span class="visually-hidden"><{$block.caption}></span>
					</div>
					<{/foreach}>
				</div>
		<{/if}>
		</div>
</nav>
