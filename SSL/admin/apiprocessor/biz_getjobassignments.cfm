<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Job Assignments data in a uniform format for use with job assignment report ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [Wk Loc ID] as Wk_Loc_ID, [Job ID] as Job_ID, [Wk Location Name] as Wk_Location_Name, branch, responsible_user_Employee_ID, Crew_Leader_ID, total_project_value, CONVERT(varchar, [project_end_date], 121) AS project_end_date FROM dbo.app_jobs aj
    WHERE aj.Status='IN PROGRESS'
    <cfif IsDefined('form.project_name')>
        <cfif form.project_name NEQ ''>
            AND aj.[Wk Location Name] LIKE '%#form.project_name#%'
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch')>
        <cfif form.branch NEQ ''>
            AND aj.branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.crew_leader')>
        <cfif form.crew_leader NEQ ''>
            AND (aj.[Crew_Leader_ID]=<cfqueryparam value="#form.crew_leader#" CFSQLType="CF_SQL_TEXT">
                OR aj.[responsible_user_Employee_ID]=<cfqueryparam value="#form.crew_leader#" CFSQLType="CF_SQL_TEXT">
            )
        </cfif>
    </cfif>
    ORDER BY aj.branch, aj.[Wk Location Name]
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Wk_Loc_ID & '|' & Job_ID & '|' & Wk_Location_Name & '|' & branch & '|' & responsible_user_Employee_ID & '|' & Crew_Leader_ID & '|' & total_project_value & '|' & project_end_date>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">