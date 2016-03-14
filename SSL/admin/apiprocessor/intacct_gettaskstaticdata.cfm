<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Service Task data in a uniform format for use with labor reports ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT Task_Code, Task_Name, Task_Type, Task_SQL_field_name, Task_start_date, Task_end_date, Task_Department_Code FROM dbo.quote_intacct
    ORDER BY Task_Type DESC, Task_Code
</cfquery>
<!--- only 1 result expected because opportunity_id is unique --->
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Task_Code & '|' & Task_Name & '|' & Task_Type & '|' & Task_SQL_field_name & '|' & Task_start_date & '|' & Task_end_date & '|' & Task_Department_Code & '|'>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">