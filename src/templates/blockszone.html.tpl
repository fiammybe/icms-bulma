<{if $blocks}>
    <{foreach from=$blocks item=block}>
        <div class="block">
        <{if $block.title}><div class="panel-heading is-4"><{$block.title}></div><{/if}>
        <div class="content"><{$block.content}></div>
        </div>
    <{/foreach}>
<{/if}>