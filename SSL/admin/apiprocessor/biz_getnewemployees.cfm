<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz employees for Biz reports ======= --->
<cfif IsDefined('form.hire_date')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT [Employee ID] as Employee_ID, [Name FirstLast] as Name_FirstLast, email, employee_hire_date FROM dbo.app_employees ae
        WHERE ae.active_record=1
        AND employee_hire_date='#hire_date#'
        ORDER BY ae.[Name FirstLast]
    </cfquery>
    <cfset cv = 0>
    <cfloop query="main_query">
        <cfif cv GT 0>
            <cfset output_str = output_str & multi_delimiter>
        </cfif>
        <cfset output_str = output_str & Employee_ID & "|" & Name_FirstLast & "|" & email & "|" & employee_hire_date>
        <cfset cv++>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">