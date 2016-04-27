<!--- SUPERSEDES ANY NORMAL CONTROLLER COMMAND --->
<cfif IsDefined('URL.logout')>
    <cfif IsDefined('SESSION.userid')>
        <cfset StructDelete(SESSION, 'userid')>
    </cfif>
    <cflocation url='#APPLICATION.basePath#index.cfm?login'>
</cfif>
<cfif IsDefined('URL.help')>
    dump_session = show SESSION struct<br />
    dump_application = show APPLICATION struct<br />
    dump_form = dump_post = show FORM (POST) struct ** add this to the page you want to debug BEFORE submitting the form, then submit the form and it should output POST immediately
    <cfabort>
</cfif>
<cfif IsDefined('URL.dump_session')>
    SESSION variable:<br />
    <cfdump var="#SESSION#">
    <cfabort>
</cfif>
<cfif IsDefined('URL.dump_application')>
    APPLICATION variable:<br />
    <cfdump var="#APPLICATION#">
    <cfabort>
</cfif>
<cfif IsDefined('SESSION.dump_form') AND IsDefined('FORM.formAction')>
    FORM variable:<br />
    <font color="#AA0000">* <b>CAUTION:</b> Reloading this page will re-submit the form *</font><br />
    <cfset StructDelete(SESSION, 'dump_form')>
    <cfdump var="#FORM#">
    <cfabort>
<cfelse>
    <cfif !IsDefined('FORM.formAction') AND (IsDefined('URL.dump_form') OR IsDefined('URL.dump_post'))>
        <cfset SESSION.dump_form = 1>
        <font color="#0000AA">* Now submit the form and it will output POST without submitting anything *</font><br /><br />
    <cfelse>
        <cfset StructDelete(SESSION, 'dump_form')>
    </cfif>
</cfif>
