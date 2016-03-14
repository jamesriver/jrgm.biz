<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Time Sheet data in a uniform format for use with job costing ======= --->
<cfif IsDefined('form.project_id')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT ds_id, Item_ID, Service_Date, Quantity_used FROM dbo.app_job_materials_actual jma
        <cfif IsDefined('form.project_start_date') AND IsDefined('form.project_end_date') AND IsDefined('form.project_root_id')>
            WHERE jma.Job_ID=<cfqueryparam value="#form.project_root_id#" CFSQLType="CF_SQL_TEXT">
              AND jma.Service_Date>=<cfqueryparam value="#form.project_start_date#" CFSQLType="CF_SQL_TEXT">
              AND jma.Service_Date<<cfqueryparam value="#form.project_end_date#" CFSQLType="CF_SQL_TEXT">
        <cfelse>
            WHERE jma.Job_ID=<cfqueryparam value="#form.project_id#" CFSQLType="CF_SQL_TEXT">
        </cfif>
        ORDER BY Service_Date, Item_ID
    </cfquery>
    <cfset cv = 0>
    <cfloop query="main_query">
        <cfif cv GT 0>
            <cfset output_str = output_str & multi_delimiter>
        </cfif>
        <cfset output_str = output_str & ds_id & '|' & Item_ID & '|' & Service_Date & '|' & Quantity_used>
        <cfset cv++>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">