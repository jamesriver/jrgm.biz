<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Time Sheet data in a uniform format for use with job costing ======= --->
<cfif IsDefined('form.project_id')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT ds_id, Service_ID, Employee_ID, [Name FirstLast] as Name_FirstLast, Total_Time, Service_Time_In FROM dbo.app_job_services_actual_employee ajsae
        INNER JOIN dbo.app_employees ae ON ae.[Employee ID]=ajsae.[Employee_ID]
        <cfif IsDefined('form.project_start_date') AND IsDefined('form.project_end_date') AND IsDefined('form.project_root_id')>
            WHERE ajsae.Job_ID=<cfqueryparam value="#form.project_root_id#" CFSQLType="CF_SQL_TEXT">
              AND ajsae.Service_Time_In>=<cfqueryparam value="#form.project_start_date#" CFSQLType="CF_SQL_TEXT">
              AND ajsae.Service_Time_In<<cfqueryparam value="#form.project_end_date#" CFSQLType="CF_SQL_TEXT">
        <cfelse>
            WHERE ajsae.Job_ID=<cfqueryparam value="#form.project_id#" CFSQLType="CF_SQL_TEXT">
        </cfif>
        ORDER BY ajsae.Service_ID, ajsae.Service_Time_In, ae.[Name FirstLast]
    </cfquery>
    <cfset cv = 0>
    <cfloop query="main_query">
        <cfif cv GT 0>
            <cfset output_str = output_str & multi_delimiter>
        </cfif>
        <cfset output_str = output_str & ds_id & '|' & Service_ID & '|' & Employee_ID & '|' & Name_FirstLast & '|' & Total_Time & '|' & Service_Time_In>
        <cfset cv++>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">