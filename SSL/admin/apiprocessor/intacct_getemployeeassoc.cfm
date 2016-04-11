<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz employees ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [Employee ID] as Employee_ID, [Name FirstLast] as Name_FirstLast, aj.responsible_user_Employee_ID FROM dbo.app_employees ae
    LEFT JOIN app_jobs aj ON aj.responsible_user_Employee_ID=ae.[Employee ID]
    WHERE 1=1
    <cfif !IsDefined('form.showall')>
        AND ae.active_record=1
    </cfif>
    GROUP BY ae.[Employee ID], ae.[Name FirstLast], aj.responsible_user_Employee_ID
    ORDER BY ae.[Name FirstLast]
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Employee_ID & '|' & Name_FirstLast & '|' & responsible_user_Employee_ID>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">