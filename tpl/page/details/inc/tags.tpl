[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{if $oView->showTags() && ( $oView->getTagCloudManager() || ( $oxcmp_user && $oDetailsProduct ) ) }]
    [{gn2_oxscript include='js/widgets/oxajax.js'}]
    [{gn2_oxscript include='js/widgets/oxtag.js'}]
    [{gn2_oxscript add="$('p.tagCloud a.tagText').click(oxTag.highTag);"}]
    [{gn2_oxscript add="$('#saveTag').click(oxTag.saveTag);"}]
    [{gn2_oxscript add="$('#cancelTag').click(oxTag.cancelTag);"}]
    [{gn2_oxscript add="$('#editTag').click(oxTag.editTag);"}]
    <p class="tagCloud">
        [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]
        [{if $oCloudManager->getCloudArray()|count < 0}]
            [{oxmultilang ident="PAGE_DETAILS_TAGS_NOTAGS"}]
        [{/if}]
        [{foreach from=$oCloudManager->getCloudArray() item=iCount key=sTagTitle}]
            <a class="tagitem_[{$oCloudManager->getTagSize($sTagTitle)}]" href="[{$oCloudManager->getTagLink($sTagTitle)}]">[{$oCloudManager->getTagTitle($sTagTitle)}]</a>
        [{/foreach}]
    </p>
    [{if $oDetailsProduct && $oView->canChangeTags()}]
      <form action="[{$oViewConf->getSelfActionLink()}]#tags" method="post" id="tagsForm" >
        <div>
          [{$oViewConf->getHiddenSid()}]
          [{$oViewConf->getNavFormParams()}]
          <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
          <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
          <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
          <input type="hidden" name="fnc" value="editTags">
          <button class="submitButton" id="editTag" type="submit" title="[{oxmultilang ident="PAGE_DETAILS_TAGS_EDIT"}]">[{oxmultilang ident="PAGE_DETAILS_TAGS_EDIT"}]</button>
        </div>
      </form>
    [{/if}]
[{/if}]