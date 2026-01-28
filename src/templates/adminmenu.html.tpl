<{* ------------------------------------------------------------- *}
<{*  Detect which section should be open based on current URL     *}
<{* ------------------------------------------------------------- *}>

<{assign var=openLevel2_default value=''}>
<{assign var=openLevel3_default value=''}>

<ul class="menu-list" role="tree"
    x-data="{ openLevel2: null, openLevel3: null }"
    x-init="
        openLevel2 = '<{$openLevel2_default}>' || null;
        openLevel3 = '<{$openLevel3_default}>' || null;
    "
>

    <{foreach item=item from=$navitems}>
    <{if ($systemadm || $item.id != 'opsystem') && ($item.id != 'news' || $show_impresscms_menu)}>
    <{if $modulesadm || $item.id != 'modules'}>

    <p class="menu-label"><{$item.text}></p>

    <{foreach item=sub from=$item.menu}>

    <{* ---------- Build unique slug for level‑2 ---------- *}>
    <{assign var=sub_slug value=$sub.title|lower|replace:" ":"_"|regex_replace:"/[^a-z0-9_]/":""}>
    <{assign var=level2_id value=$item.id|cat:"-"|cat:$sub_slug}>

    <{* ---------- CONTROL PANEL HOME ---------- *}>
    <{if $item.id == 'cphome'}>
    <li role="treeitem">
        <a href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"
           role="treeitem">
            <{$sub.title}>
        </a>
    </li>

    <{* ---------- NEWS ---------- *}>
    <{elseif $item.id == 'news' && $show_impresscms_menu}>
    <li role="treeitem">
        <a rel="external"
           href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"
           role="treeitem">
            <{$sub.title}>
        </a>
    </li>

    <{* ---------- GENERIC SECTIONS ---------- *}>
    <{else}>

    <{if $sub.hassubs}>

    <li role="treeitem" aria-haspopup="true">

        <a
                @click.prevent="openLevel2 = (openLevel2 === '<{$level2_id}>' ? null : '<{$level2_id}>')"
                :aria-expanded="openLevel2 === '<{$level2_id}>' ? 'true' : 'false'"
                aria-controls="submenu-<{$level2_id}>"
                role="button"
                class="has-chevron"
        >
            <span><{$sub.title}></span>

            <svg class="chevron"
                 :class="{ 'rotate': openLevel2 === '<{$level2_id}>' }"
                 width="12" height="12" viewBox="0 0 24 24" aria-hidden="true">
                <path d="M8 4l8 8-8 8"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"/>
            </svg>
        </a>

        <ul id="submenu-<{$level2_id}>"
            role="group"
            x-show="openLevel2 === '<{$level2_id}>'"
            x-collapse>

            <{foreach item=subitem from=$sub.subs}>

            <{* ---------- Build unique slug for level‑3 ---------- *}>
            <{assign var=subitem_slug value=$subitem.title|lower|replace:" ":"_"|regex_replace:"/[^a-z0-9_]/":""}>
            <{assign var=level3_id value=$level2_id|cat:"-"|cat:$subitem_slug}>

            <li role="treeitem">

                <{if $subitem.hassubs}>

                <a
                        @click.prevent="openLevel3 = (openLevel3 === '<{$level3_id}>' ? null : '<{$level3_id}>')"
                        :aria-expanded="openLevel3 === '<{$level3_id}>' ? 'true' : 'false'"
                        aria-controls="submenu-<{$level3_id}>"
                        role="button"
                        class="has-chevron"
                >
                    <span><{$subitem.title}></span>

                    <svg class="chevron"
                         :class="{ 'rotate': openLevel3 === '<{$level3_id}>' }"
                         width="12" height="12" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M8 4l8 8-8 8"
                              fill="none"
                              stroke="currentColor"
                              stroke-width="2"
                              stroke-linecap="round"
                              stroke-linejoin="round"/>
                    </svg>
                </a>

                <ul id="submenu-<{$level3_id}>"
                    role="group"
                    x-show="openLevel3 === '<{$level3_id}>'"
                    x-collapse>

                    <{foreach item=subsubitem from=$subitem.subs}>

                    <li role="treeitem">
                        <a href="<{$subsubitem.link}>"
                           role="treeitem"
                        <{if $subsubitem.link == $current_url}>class="is-active"<{/if}>>
                        <{$subsubitem.title}>
                        </a>
                    </li>

                    <{* Auto-open logic for level‑4 *}>
                    <{if $subsubitem.link == $current_url}>
                    <{assign var=openLevel2_default value=$level2_id}>
                    <{assign var=openLevel3_default value=$level3_id}>
                    <{/if}>

                    <{/foreach}>
                </ul>

                <{else}>

            <a href="<{$subitem.link}>"
               role="treeitem"
                <{if $subitem.link == $current_url}>class="is-active"<{/if}>>
                <{$subitem.title}>
                </a>

                <{* Auto-open logic for level‑3 *}>
                <{if $subitem.link == $current_url}>
                <{assign var=openLevel2_default value=$level2_id}>
                <{/if}>

                <{/if}>

            </li>

            <{/foreach}>
        </ul>
    </li>

    <{else}>

    <li role="treeitem">
        <a href="<{if $sub.absolute==1}><{$sub.link}><{else}><{$icms_url}>/modules/<{$sub.dir}>/<{$sub.link}><{/if}>"
           role="treeitem"
        <{if $sub.link == $current_url}>class="is-active"<{/if}>>
        <{$sub.title}>
        </a>

        <{* Auto-open logic for direct level‑2 links *}>
        <{if $sub.link == $current_url}>
        <{assign var=openLevel2_default value=$level2_id}>
        <{/if}>
    </li>

    <{/if}>
    <{/if}>

    <{/foreach}>

    <{/if}>
    <{/if}>
    <{/foreach}>

</ul>
