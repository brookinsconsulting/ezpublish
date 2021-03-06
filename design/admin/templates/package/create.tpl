{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div id="package">
<form method="post" action={'package/create'|ezurl}>


{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">
<h1 class="context-title">
    {'Create package'|i18n('design/admin/package')}
</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

    <h2>{'Available wizards'|i18n('design/admin/package')}</h2>
    <p>{'Choose one of the following wizards for creating a package'|i18n('design/admin/package')}</p>

    <div class="optionslist">
    {section var=creator loop=$creator_list}
        <input class="radiobutton" id="{$creator.item.id|wash}" type="radio" name="CreatorItemID" value="{$creator.item.id|wash}" {if $creator.index|eq( 0 )}checked="checked"{/if} />{$creator.item.name|wash}<br />
    {/section}
    </div>

</div>
{* DESIGN: Content END *}</div></div></div>

    <div class="controlbar">
    {* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml">


    <div class="block">
        <input class="button" type="submit" name="CreatePackageButton" value="{'Create package'|i18n('design/admin/package')}" />
    </div>

    {* DESIGN: Control bar END *}</div></div>
    </div>

</form>
</div>
