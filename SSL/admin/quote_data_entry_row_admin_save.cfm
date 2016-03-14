<cfif IsDefined('form.id') AND IsDefined('form.field') AND IsDefined('form.value')>
    <cfquery name="update_app_jobs" datasource="jrgm">
        UPDATE quote_data_entry_row
        SET #form.field#=<cfqueryparam value="#form.value#"     CFSQLType="CF_SQL_VARCHAR">
        WHERE ID=<cfqueryparam value="#form.id#"     CFSQLType="CF_SQL_INT">
    </cfquery>
</cfif>