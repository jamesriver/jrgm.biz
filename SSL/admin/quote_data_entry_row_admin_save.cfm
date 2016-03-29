<cfif IsDefined('form.id') AND IsDefined('form.field') AND IsDefined('form.value')>
    <cfquery name="update_app_jobs" datasource="jrgm">
        UPDATE quote_data_entry_row
        SET #form.field#='#Replace(form.value, "'", "''", "ALL")#'
        WHERE ID=<cfqueryparam value="#form.id#"     CFSQLType="CF_SQL_INT">
    </cfquery>
    <cfoutput>
        UPDATE quote_data_entry_row
        SET #form.field#='#Replace(form.value, "'", "''", "ALL")#'
        WHERE ID=#form.id#
    </cfoutput>
</cfif>