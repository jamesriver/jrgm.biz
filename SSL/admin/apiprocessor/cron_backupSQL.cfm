<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= create 8 1-hour backups of the most important tables that I've been using ======= --->
<cfif IsDefined('form.timestamp_new') AND IsDefined('form.timestamp_old')>
    <cfset table_names = ["app_jobs", "quote_start", "quote_main", "quote_services", "quote_materials", "quote_services_dimensions", "quote_services_admin", "quote_data_entry_headers", "quote_data_entry_row", "quote_notes", "app_employees", "app_employee_passwords", "app_crews", "app_events"]>
    <cfloop from="1" to="#arrayLen(table_names)#" index="i">
        <cfif IsDefined('url.test')>
            <cfoutput>
                SELECT * INTO #table_names[i]#_#timestamp_new# FROM #table_names[i]#<br />
            </cfoutput>
            <cfoutput>
                IF OBJECT_ID('#table_names[i]#_#timestamp_old#', 'U') IS NOT NULL DROP TABLE #table_names[i]#_#timestamp_old#<br />
            </cfoutput>
        <cfelse>
            <cfquery name="main_query" datasource="jrgm">
                SELECT * INTO #table_names[i]#_#timestamp_new# FROM #table_names[i]#
            </cfquery>
            <cfquery name="main_query" datasource="jrgm">
                IF OBJECT_ID('#table_names[i]#_#timestamp_old#', 'U') IS NOT NULL DROP TABLE #table_names[i]#_#timestamp_old#
            </cfquery>
        </cfif>
    </cfloop>
</cfif>
<!---cfinclude template="include_output.cfm"--->