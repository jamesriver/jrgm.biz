<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz employees for API ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [Employee ID] as Employee_ID, First_name, Last_name, Direct_Supervisor_ID, Branch, Position, email FROM dbo.app_employees ae
    WHERE ae.active_record=1
    ORDER BY ae.[Name FirstLast]
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & First_name & '|' & Last_name & '|' & Employee_ID & '|' & Direct_Supervisor_ID & '|' & Branch & '|' & Position & '|' & email>
    <cfset cv++>
</cfloop>
<cfinclude template="include_output.cfm">