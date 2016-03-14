<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Labor data in a uniform format for use with job costing ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT ajsae.Job_ID, ajsae.Service_ID, ajsae.Employee_ID, ajsae.Total_Time, ajsae.Service_Time_In, ajsae.ds_id, aj.[Wk Location Name] as Wk_Location_Name, aj.branch, aj.responsible_user_Employee_ID FROM dbo.app_job_services_actual_employee ajsae
    INNER JOIN dbo.app_jobs aj ON aj.[Job ID]=ajsae.[Job_ID]
    WHERE 1=1
    <cfif IsDefined('form.start_date') AND IsDefined('form.end_date')>
        <cfif form.start_date NEQ '' AND form.end_date NEQ ''>
            AND ajsae.Service_Time_In>=<cfqueryparam value="#form.start_date#" CFSQLType="CF_SQL_TEXT">
            AND ajsae.Service_Time_In<<cfqueryparam value="#form.end_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.production_manager')>
        <cfif form.production_manager NEQ ''>
            AND aj.responsible_user_Employee_ID=<cfqueryparam value="#form.production_manager#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.employee')>
        <cfif form.employee NEQ ''>
            AND ajsae.Employee_ID=<cfqueryparam value="#form.employee#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch')>
        <cfif form.branch NEQ ''>
            AND aj.branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    ORDER BY ajsae.Service_ID, ajsae.Service_Time_In
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Service_Time_In & '|' & Job_ID & '|' & Service_ID & '|' & Employee_ID & '|' & Total_Time & '|' & Service_Time_In & '|' & Wk_Location_Name & '|' & branch & '|' & responsible_user_Employee_ID & '|' & ds_id>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">