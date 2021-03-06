{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form method="post" action={concat('/setup/templatecreate',$template)|ezurl}>
<h1>{"Create new template override for"|i18n("design/standard/setup")} {$template}</h1>

{if eq($error,'permission_denied')}
<div class="error">
<h2>{"Could not create template, permission denied."|i18n("design/standard/setup")}</h2>
</div>
{/if}

{if eq($error,'invalid_name')}
<div class="error">
<h2>{"Invalid name. You can only use the characters a-z, numbers and _."|i18n("design/standard/setup")}</h2>
</div>
{/if}

<p>
{"Template will be placed in"|i18n("design/standard/setup")} design/{$site_design}/override/templates/
</p>

<div class="objectheader">
<h2>{"Template name"|i18n("design/standard/setup")}</h2>
</div>

<div class="object">
<input type="text" name="TemplateName" value="{$template_name}" />.tpl
</div>


{switch match=$template_type}
{case match='node_view'}
<div class="objectheader">
<h2>{"Override keys"|i18n("design/standard/setup")}</h2>
</div>

<div class="object">
<table>
<tr>
    <td>
    <p>
    {"Class"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <select name="Match[class_identifier]">
        <option value="-1">{"Any"|i18n("design/standard/setup")}</option>
        {section name=Class loop=fetch('content', 'can_instantiate_class_list')}
        <option value="{fetch( content, class, hash( class_id, $Class:item.id ) ).identifier}">{$Class:item.name}</option>
        {/section}
    </select>
    </td>
</tr>
<tr>
    <td>
    <p>
    {"Section"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <select name="Match[section]">
        <option value="-1">{"Any"|i18n("design/standard/setup")}</option>        
        {section name=Section loop=fetch( 'content', 'section_list' )}
            <option value="{$:item.id}">{$:item.name}</option>        
        {/section}        
    </select>
    </td>
</tr>
<tr>
    <td>
    <p>
    {"Node"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <input type="text" size="5" value="" name="Match[node]" />
    </td>
</tr>
</table>
</div>


<div class="objectheader">
<h2>{"Base template on"|i18n("design/standard/setup")}</h2>
</div>
<div class="object">

<input type="radio" name="TemplateContent" value="EmptyFile" checked="checked"/>{"Empty file"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="DefaultCopy" />{"Copy of default template"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="ContainerTemplate" />{"Container ( with children )"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="ViewTemplate" />{"View ( without children )"|i18n("design/standard/setup")}<br />
</div>

{/case}
{case match='object_view'}
<div class="objectheader">
<h2>{"Override keys"|i18n("design/standard/setup")}</h2>
</div>

<div class="object">
<table>
<tr>
    <td>
    <p>
    {"Class"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <select name="Match[class_identifier]">
        <option value="-1">{"Any"|i18n("design/standard/setup")}</option>
        {section name=Class loop=fetch('content', 'can_instantiate_class_list')}
        <option value="{fetch( content, class, hash( class_id, $Class:item.id ) ).identifier}">{$Class:item.name}</option>
        {/section}
    </select>
    </td>
</tr>
<tr>
    <td>
    <p>
    {"Section"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <select name="Match[section]">
        <option value="-1">{"Any"|i18n("design/standard/setup")}</option>
        {section name=Section loop=fetch( 'content', 'section_list' )}
            <option value="{$:item.id}">{$:item.name}</option>        
        {/section}        
    </select>
    </td>
</tr>
<tr>
    <td>
    <p>
    {"Object"|i18n("design/standard/setup")}
    </p>
    </td>
    <td>
    <input type="text" size="5" value="" name="Match[object]" />
    </td>
</tr>
</table>
</div>


<div class="objectheader">
<h2>{"Base template on"|i18n("design/standard/setup")}</h2>
</div>
<div class="object">

<input type="radio" name="TemplateContent" value="EmptyFile" checked="checked"/>{"Empty file"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="DefaultCopy" />{"Copy of default template"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="ContainerTemplate" />{"Container ( with children )"|i18n("design/standard/setup")}<br />
<input type="radio" name="TemplateContent" value="ViewTemplate" />{"View ( without children )"|i18n("design/standard/setup")}<br />
</div>

{/case}
{case match='pagelayout'}
    <div class="objectheader">
    <h2>{"Base template on"|i18n("design/standard/setup")}</h2>
    </div>
    <div class="object">
    <input type="radio" name="TemplateContent" value="EmptyFile" checked="checked"/>{"Empty file"|i18n("design/standard/setup")}<br />
    <input type="radio" name="TemplateContent" value="DefaultCopy" />{"Copy of default template"|i18n("design/standard/setup")}<br />
    </div>
{/case}
{case}
    <div class="objectheader">
    <h2>{"Base template on"|i18n("design/standard/setup")}</h2>
    </div>
    <div class="object">
    <input type="radio" name="TemplateContent" value="EmptyFile" checked="checked"/>{"Empty file"|i18n("design/standard/setup")}<br />
    <input type="radio" name="TemplateContent" value="DefaultCopy" />{"Copy of default template"|i18n("design/standard/setup")}<br />
    </div>
{/case}
{/switch}

<div class="buttonblock">
<input class="button" type="submit" value="{"Create"|i18n("design/standard/setup")}" name="CreateOverrideButton" />
</div>

</form>