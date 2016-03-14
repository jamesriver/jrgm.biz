<cfif IsDefined('form.inputname') AND IsDefined('form.wklocid') AND IsDefined('form.value')>
    <cfif form.inputname EQ 'renewal_lead' OR form.inputname EQ 'increase_requested' OR form.inputname EQ 'project_status_checkbox' OR form.inputname EQ 'renewal_notes'>
        <cfoutput>#form.inputname# | #form.wklocid# | #form.value#</cfoutput>

        <cfif form.inputname EQ 'project_status_checkbox'>
            <cfquery name="update_app_jobs" datasource="jrgm">
                UPDATE app_jobs
                SET #form.inputname#=<cfqueryparam value="#form.value#"     CFSQLType="CF_SQL_INT">
                WHERE [Wk Loc ID]=<cfqueryparam value="#form.wklocid#"     CFSQLType="CF_SQL_VARCHAR">
            </cfquery>
        <cfelse>
            <cfquery name="update_app_jobs" datasource="jrgm">
                UPDATE app_jobs
                SET #form.inputname#=<cfqueryparam value="#form.value#"     CFSQLType="CF_SQL_VARCHAR">,
                    #form.inputname#_modified=GETUTCDATE()
                WHERE [Wk Loc ID]=<cfqueryparam value="#form.wklocid#"     CFSQLType="CF_SQL_VARCHAR">
            </cfquery>
        </cfif>
    </cfif>
</cfif>