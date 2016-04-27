<!--- REQUIRED PARAMETERS BELOW TO SET IN .CFM PRIOR TO INCLUDING THIS PAGE --->
<!--- query_name --->
<!--- query_login_username --->
<!--- query_login_password --->

<cfquery name="#query_name#" datasource="#CONFIG_DATABASENAME#">
    SELECT aep.*, ar.name AS access_role_name, ar.description AS access_role_description
    FROM app_employee_passwords aep
    INNER JOIN access_roles ar ON ar.access_role_id=aep.access_role
    WHERE aep.username=<cfqueryparam value="#query_login_username#" CFSQLType="CF_SQL_TEXT">
      AND aep.password=<cfqueryparam value="#query_login_password#" CFSQLType="CF_SQL_TEXT">
      AND aep.employee_active=1
</cfquery>