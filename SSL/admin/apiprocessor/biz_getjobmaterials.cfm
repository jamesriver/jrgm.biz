<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Labor data in a uniform format for use with job costing ======= --->
<cfset project_ids = ''>
<cfset projectassoc = StructNew()>
<cfquery name="project_query" datasource="jrgm">
    SELECT [Job ID] as Job_ID, [Wk Location Name] as Wk_Location_Name, branch, responsible_user_Employee_ID FROM app_jobs
    WHERE 1=1
    <cfif IsDefined('form.project_name')>
        <cfif form.project_name NEQ ''>
            AND [Wk Location Name] LIKE '%#form.project_name#%'
        </cfif>
    </cfif>
    <cfif IsDefined('form.production_manager')>
        <cfif form.production_manager NEQ ''>
            AND responsible_user_Employee_ID=<cfqueryparam value="#form.production_manager#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch')>
        <cfif form.branch NEQ ''>
            AND branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
</cfquery>
<cfset cv = 0>
<cfloop query="project_query">
    <cfif cv GT 0>
        <cfset project_ids = project_ids & ','>
    </cfif>
    <cfset project_ids = project_ids & "'" & Job_ID & "'">
    <!---cfset projectassoc[Job_ID] = [Wk_Location_name, branch, responsible_user_Employee_ID]--->
    <cfset cv++>
</cfloop>

<cfquery name="main_query" datasource="jrgm">
    SELECT <cfif !IsDefined('form.csv')>TOP 2500 </cfif> * FROM (
        SELECT ajma.Job_ID, ajma.Item_ID, ajma.crew_leader, ajma.Quantity_used, ajma.Service_Date, ajma.ds_id, aj.branch, aj.[Wk Location Name] FROM dbo.app_job_materials_actual ajma
        INNER JOIN app_jobs aj ON aj.[Job ID]=ajma.Job_ID
        WHERE 1=1
        <cfif IsDefined('project_ids')>
            AND ajma.Job_ID IN (#PreserveSingleQuotes(project_ids)#)
        </cfif>
        <cfif IsDefined('form.start_date') AND IsDefined('form.end_date')>
            <cfif form.start_date NEQ '' AND form.end_date NEQ ''>
                AND ajma.Service_Date>=<cfqueryparam value="#form.start_date#" CFSQLType="CF_SQL_TEXT">
                AND ajma.Service_Date<<cfqueryparam value="#form.end_date#" CFSQLType="CF_SQL_TEXT">
            </cfif>
        </cfif>
        <cfif IsDefined('form.employee')>
            <cfif form.employee NEQ ''>
                AND ajma.crew_leader=<cfqueryparam value="#form.employee#" CFSQLType="CF_SQL_TEXT">
            </cfif>
        </cfif>
    ) SubQueryAlias
    ORDER BY branch, [Wk Location Name], Service_Date, Item_ID
    <cfif IsDefined('form.limitstart')>
        OFFSET <cfqueryparam value="#form.limitstart#" CFSQLType="CF_SQL_INTEGER"> ROWS
        FETCH NEXT 2500 ROWS ONLY;
    </cfif>
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <!---cfset output_str = output_str & Service_Date & '|' & Job_ID & '|' & Item_ID & '|' & crew_leader & '|' & Quantity_used & '|' & Service_Date & '|' & projectassoc[Job_ID][1] & '|' & projectassoc[Job_ID][2] & '|' & projectassoc[Job_ID][3] & '|' & ds_id--->
    <cfset output_str = output_str & Service_Date & '|' & Job_ID & '|' & Item_ID & '|' & crew_leader & '|' & Quantity_used & '|' & Service_Date & '|' & ds_id>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">