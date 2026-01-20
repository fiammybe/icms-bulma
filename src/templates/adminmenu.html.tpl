<ul class="menu-list" role="tree">

<{foreach item=item from=$navitems}>
    <{if ($systemadm || $item.id != 'opsystem') && ($item.id != 'news' || $show_impresscms_menu)}>
        <{if $modulesadm || $item.id != 'modules'}>

            <p class="menu-label"><{$item.text}></p>

            <{foreach item=sub from=$item.menu}>

                <{* ---------- Build slug for second-level ---------- *}>
                <{assign var=sub_slug value=$sub.title|lower|replace:" ":"_"|regex_replace:"/[^a-z0-9_]/":""}>
                <{assign var=sub_base value=$sub.dir|default:$sub_slug}>
                <{assign var=level_id value=$item.id|cat:"-"|cat:$sub_base}>

                <{* ---------- CONTROL PANEL HOME (no collapsible) ---------- *}>
                <{if $item.id == 'cphome'}>
                    <li role="treeitem">
                        <a 
                            href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"
                            role="treeitem"
                        >
                            <{$sub.title}>
                        </a>
                    </li>

                <{* ---------- NEWS (no collapsible, external) ---------- *}>
                <{elseif $item.id == 'news' && $show_impresscms_menu}>
                    <li role="treeitem">
                        <a 
                            rel="external"
                            href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"
                            role="treeitem"
                        >
                            <{$sub.title}>
                        </a>
                    </li>

                <{* ---------- GENERIC SECTIONS (opsystem, modules, others) ---------- *}>
                <{else}>

                    <{if $sub.hassubs}>

                        <li role="treeitem" aria-haspopup="true">
                            <a 
                                @click.prevent="open = (open === '<{$level_id}>' ? null : '<{$level_id}>')"
                                :aria-expanded="open === '<{$level_id}>' ? 'true' : 'false'"
                                aria-controls="submenu-<{$level_id}>"
                                role="button"
                            >
                                <{$sub.title}>
                            </a>

                            <ul 
                                id="submenu-<{$level_id}>" 
                                role="group"
                                x-show="open === '<{$level_id}>'" 
                                x-collapse
                            >
                                <{foreach item=subitem from=$sub.subs}>

                                    <{* ---------- Third level ---------- *}>
                                    <li role="treeitem">
                                        <a 
                                            <{if $subitem.link == $current_url}>class="is-active"<{/if}>
                                            href="<{$subitem.link}>"
                                            role="treeitem"
                                        >
                                            <{$subitem.title}>
                                        </a>

                                        <{if $subitem.hassubs}>
                                            <ul role="group">
                                                <{foreach item=subsubitem from=$subitem.subs}>
                                                    <li role="treeitem">
                                                        <a 
                                                            <{if $subsubitem.link == $current_url}>class="is-active"<{/if}>
                                                            href="<{$subsubitem.link}>"
                                                            role="treeitem"
                                                        >
                                                            <{$subsubitem.title}>
                                                        </a>
                                                    </li>
                                                <{/foreach}>
