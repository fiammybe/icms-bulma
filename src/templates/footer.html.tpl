<div class="columns">
        <div class="column">
        <div class="content has-text-centered">
            <!-- About -->
            <div class="col-md-3 md-margin-bottom-40">
                <a href="<{$icms_url}>"><img id="logo-footer" class="img-responsive"
                                             src="<{$icms_url}>/themes/unify3/assets/img/logo.svg" alt=""></a>
                <p>ImpressCMS is a multi-language content management system for the web. It is community-built, an open
                    source project and based on the common web technologies of PHP and MySQL.</p>
            </div>
        </div>
		</div>
    <!-- End About -->
    <{if $xoBlocks.footer_news}>

        <div class="column">
            <{includeq file="$theme_name/templates/blockszone.html.tpl" blocks=$xoBlocks.footer_news zoneClass="footerlist"
            }>
        </div>
    <{/if}>
</div>
<{if $xoBlocks.footer_news}>
<div class="content has-text-centered">
    <{$icms_footer}>
</div>
<{/if}>