[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_INFO_LINKS_LINKS"|oxmultilangassign}]
    <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_LINKS_LINKS"}]</h2>
    [{foreach from=$oView->getLinksList() item=link name=linksList}]
        <h3>
            <span>[{$link->oxlinks__oxinsert->value|date_format:"%d.%m.%Y"}] - </span> <a href="[{$link->oxlinks__oxurl->value }]" >[{$link->oxlinks__oxurl->value}]</a>
        </h3>
        
        <div>[{$link->oxlinks__oxurldesc->value}]</div>
    [{/foreach}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]