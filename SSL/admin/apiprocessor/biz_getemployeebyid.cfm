<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Biz employee for logging into the API /biz portal ======= --->
<cfif IsDefined('form.EmployeeID')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT ae.[Name FirstLast] as Name_FirstLast, ae.[Employee ID], ae.[Position] FROM dbo.app_employees ae
        WHERE ae.[Employee ID]=<cfqueryparam value="#form.EmployeeID#" CFSQLType="CF_SQL_INTEGER">
        AND ae.active_record=1
    </cfquery>
    <!--- should only be 1 result --->
    <cfloop query="main_query">
        <cfset output_str = output_str & Name_FirstLast & '^' & Position>
    </cfloop>
</cfif>
<cfinclude template="include_output.cfm">