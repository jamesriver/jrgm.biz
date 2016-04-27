<!--- REQUIRED PARAMETERS BELOW TO SET IN .CFM PRIOR TO INCLUDING THIS PAGE --->
<!--- query_name --->
<!--- query_employee_id --->

<cfquery name="#query_name#" datasource="#CONFIG_DATABASENAME#">
    SELECT supervisor_id
    FROM app_crews
    WHERE Employee_ID = <cfqueryparam value="#query_employee_id#" CFSQLType="CF_SQL_TEXT">
</cfquery>