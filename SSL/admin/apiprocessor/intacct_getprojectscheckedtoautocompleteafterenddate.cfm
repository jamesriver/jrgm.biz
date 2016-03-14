<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter='|'>

<!--- ======= get Biz employees ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [Job ID] as Job_ID, project_status_checkbox FROM dbo.app_jobs WHERE project_status_checkbox=1
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Job_ID & '^' & project_status_checkbox>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">