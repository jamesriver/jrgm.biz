<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = '|'>

<!--- ======= get Biz Job Assignments data in a uniform format for use with job assignment report ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [Wk Loc ID] as Wk_Loc_ID, [Job ID] as Job_ID, last_modified_date, last_modified_date_external FROM dbo.app_jobs
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Wk_Loc_ID & '^' & Job_ID & '^' & last_modified_date & '^' & last_modified_date_external>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">