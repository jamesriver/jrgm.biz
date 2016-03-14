<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter='|'>

<!--- ======= get Biz Labor data in a uniform format for use with job costing ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT Service_Date, [Wk Location Name] as Wk_Location_Name, Job_ID, branch, Item_ID, Quantity_used, ds_id FROM app_job_materials_actual ajma
    INNER JOIN app_jobs aj ON aj.[Job ID]=ajma.Job_ID
    WHERE Item_ID IN ('Salt (bags)', 'Calcium Chloride (bags)', 'Sand (lbs)')
    <cfif IsDefined('form.start_date')>
        <cfif form.start_date NEQ ''>
            AND Service_Date>=<cfqueryparam value="#form.start_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.end_date')>
        <cfif form.end_date NEQ ''>
            AND Service_Date<=<cfqueryparam value="#form.end_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch')>
        <cfif form.branch NEQ ''>
            AND branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    ORDER BY branch, [Wk Location Name], Service_Date, Item_ID, Quantity_used
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Service_Date & '^' & Wk_Location_Name & '^' & Job_ID & '^' & branch & '^' & Item_ID & '^' & Quantity_used & '^' & ds_id>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">