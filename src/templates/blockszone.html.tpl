<{if $blocks}>
    <{foreach from=$blocks item=block}>
        <div class="panel">
        <{if $block.title}><div class="panel-heading is-4"><{$block.title}></div><{/if}>
        <div class="panel-block"><{$block.content}></div>
        </div>
    <{/foreach}>
<{/if}>