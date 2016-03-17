<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= force Biz Projects to sync to Insightly/Intacct ======= --->
<cfif structKeyExists(form, 'ids')>
    <cfset ids = form['ids'] & ''>
    <!---cfoutput>
        UPDATE app_jobs
        SET last_modified_date_external=GETUTCDATE()
        WHERE [Wk Loc ID] IN (#PreserveSingleQuotes(ids)#)
    </cfoutput>
    <cfabort--->
    <cfquery name="update_query" datasource="jrgm">
        UPDATE app_jobs
        SET last_modified_date_external=GETUTCDATE()
        WHERE [Wk Loc ID] IN (#PreserveSingleQuotes(ids)#)
    </cfquery>
    <cfset output_str = output_str & ids>
</cfif>

<cfinclude template="include_output.cfm">