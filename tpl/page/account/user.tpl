[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="BILLING_SHIPPING_SETTINGS"|oxmultilangassign }]
<h2 class="pageHead accountHead">[{$template_title}]</h2>
[{include file="form/user.tpl"}]
[{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
	[{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]