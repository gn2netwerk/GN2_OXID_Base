[{if $categories && $oView->getClassName() != 'start' && $oView->getClassName() !="account_noticelist"}]
    <ul class="tree" id="tree">
    [{defun name="tree" categories=$categories}]
        [{assign var="deepLevel" value=$deepLevel+1}]
        [{assign var="oContentCat" value=$oView->getContentCategory() }]
        [{foreach from=$categories item=_cat}]
            [{if $_cat->getIsVisible() }]
                [{* CMS category *}]
                [{if $_cat->getContentCats() && $deepLevel > 1 }]
                    [{foreach from=$_cat->getContentCats() item=_oCont}]
                    <li class="[{if $oContentCat && $oContentCat->getId()==$_oCont->getId() }] active [{else}] end [{/if}]" >
                        <a href="[{$_oCont->getLink()}]">[{$_oCont->oxcontents__oxtitle->value}]</a>
                    </li>
                    [{/foreach}]
                [{/if }]
                [{* subcategories *}]
                <li class="[{if !$oContentCat && $act && $act->getId()==$_cat->getId() }]active[{elseif $_cat->expanded}]exp[{/if}][{if !$_cat->hasVisibleSubCats}] end[{/if}]">
                    <a href="[{$_cat->getLink()}]">[{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($_cat->getNrOfArticles() > 0) }] ([{$_cat->getNrOfArticles()}])[{/if}]</a>
                    [{if $_cat->getSubCats() && $_cat->expanded}]
                        <ul>[{fun name="tree" categories=$_cat->getSubCats() }]</ul>
                    [{/if}]
                </li>
            [{/if}]
        [{/foreach}]
    [{/defun}]
    </ul>     
[{/if}]