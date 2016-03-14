<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Labor data in a uniform format for use with job costing ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT ajma.Job_ID, ajma.Item_ID, ajma.crew_leader, ajma.Quantity_used, ajma.Service_Date, ajma.ds_id, aj.[Wk Location Name] as Wk_Location_Name, aj.branch, aj.responsible_user_Employee_ID FROM dbo.app_job_materials_actual ajma
    INNER JOIN dbo.app_jobs aj ON aj.[Job ID]=ajma.[Job_ID]
    WHERE 1=1
    <cfif IsDefined('form.start_date') AND IsDefined('form.end_date')>
        <cfif form.start_date NEQ '' AND form.end_date NEQ ''>
            AND ajma.Service_Date>=<cfqueryparam value="#form.start_date#" CFSQLType="CF_SQL_TEXT">
            AND ajma.Service_Date<<cfqueryparam value="#form.end_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.production_manager')>
        <cfif form.production_manager NEQ ''>
            AND aj.responsible_user_Employee_ID=<cfqueryparam value="#form.production_manager#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.employee')>
        <cfif form.employee NEQ ''>
            AND ajma.crew_leader=<cfqueryparam value="#form.employee#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch')>
        <cfif form.branch NEQ ''>
            AND aj.branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    ORDER BY ajma.Item_ID, ajma.Service_Date
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Service_Date & '|' & Job_ID & '|' & Item_ID & '|' & crew_leader & '|' & Quantity_used & '|' & Service_Date & '|' & Wk_Location_Name & '|' & branch & '|' & responsible_user_Employee_ID & '|' & ds_id>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">