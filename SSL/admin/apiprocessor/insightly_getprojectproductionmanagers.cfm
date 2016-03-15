<cfinclude template="include_authorization.cfm">

<!--- ======= get missing production managers ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT Responsible_User_Employee_ID, [Name FirstLast] as Name_FirstLast FROM app_jobs
    INNER JOIN app_employees ON app_employees.[Employee ID]=app_jobs.Responsible_User_Employee_ID
    GROUP BY Responsible_User_Employee_ID, [Name FirstLast]
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Responsible_User_Employee_ID & '|' & Name_FirstLast>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">