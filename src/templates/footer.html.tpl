<div class="columns">
    <div class="column is-4">
        <div class="content has-text-centered">
            <!-- About -->
                <a href="<{$icms_url}>"><img id="logo-footer" class="img-responsive"
                                             src="<{$icms_url}>/themes/bulma/assets/img/logo.svg" alt=""></a>
        </div>
    </div>
    <!-- End About -->
    <{if $xoBlocks.footer_news}>
        <div class="column is-4">
            <{includeq file="$theme_name/templates/blockszone.html.tpl" blocks=$xoBlocks.footer_news zoneClass="footerlist"}>
        </div>
    <{/if}>
</div>
<div class="content has-text-centered">
    <p><{$icms_footer}></p>
    <p><a href="https://bulma.io">
            <img
                    src="https://bulma.io/assets/images/made-with-bulma--semiblack.png"
                    alt="Made with Bulma"
                    width="128"
                    height="24">
        </a>
    </p>

</div>
