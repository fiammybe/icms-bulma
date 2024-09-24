<{assign var=current_url value=https://`$current_page`}>
<aside class="menu">
	<{foreach item=item from=$navitems}>
	<{if ($systemadm || $item.id != 'opsystem') && ($item.id != 'news' || $show_impresscms_menu)}>
	<{if $modulesadm || $item.id != 'modules'}>
	<p class="menu-label"><{$item.text}></p>
		<{foreach item=sub from=$item.menu}>
	<ul class="menu-list">

	<{if $item.id == 'cphome'}>
			<li><a href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"><{$sub.title}></a></li>
			<{elseif $item.id == 'opsystem'}>
			<li><a <{if $sub.link == $current_url}>class="is-active" <{/if}> href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"><{$sub.title}></a>
				<{if $sub.hassubs}>
				<ul id="hassubs">
					<{foreach item=subitem from=$sub.subs}>
					<li><a <{if $subitem.link == $current_url}>class="is-active" <{/if}>href="<{$subitem.link}>"><{$subitem.title}></a>
						<{if $subitem.hassubs}>
						<ul>
							<{foreach item=subsubitem from=$subitem.subs}>
							<li><a  <{if $subsubitem.link == $current_url}>class="is-active" <{/if}>href="<{$subsubitem.link}>"><{$subsubitem.title}></a></li>
							<{/foreach}>
						</ul>
						<{/if}>
					</li>
					<{/foreach}>
				</ul>
				<{/if}>
			</li>
			<{elseif $item.id == 'modules'}>
			<li><a  <{if $sub.link == $current_url}>class="is-active" <{/if}>href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"><{$sub.title}></a>
				<{if $sub.hassubs}>
				<ul>
					<{foreach item=subitem from=$sub.subs}>
					<li><a href="<{$subitem.link}>"><{$subitem.title}></a></li>
					<{/foreach}>
				</ul>
				<{/if}>
			</li>
			<{elseif $item.id == 'news' && $show_impresscms_menu}>
			<li><a rel="external" href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"><{$sub.title}></a></li>
			<{/if}>
			<{/foreach}>

		</ul>
	</li>
	<{/if}>
	<{/if}>
	<{/foreach}>
</aside>