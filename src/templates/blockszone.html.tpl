<{if $blocks}>
<div class="container">
    <{foreach from=$blocks item=block}>
        <div class="block">
        <{if $block.title}><div class="subtitle is-4"><{$block.title}></div><{/if}>
        <div class="content"><{$block.content}></div>
        </div>
    <{/foreach}>
</div>
<{/if}>