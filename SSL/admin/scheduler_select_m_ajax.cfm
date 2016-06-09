<cfset is_admin = 0>
<cfif SESSION.userid EQ 1001 OR SESSION.userid EQ 1003 OR SESSION.userid EQ 1870>
    <cfset is_admin = 1>
</cfif>
<cfif is_admin EQ 0>
    <cfoutput>#serializejson({'error': 'Unauthorized'})#</cfoutput>
    <cfabort>
</cfif>

<cfif IsDefined('url')>
    <cfset form = url>
</cfif>

<cfswitch expression="#form.ajaxAction#">
    <cfcase value="getEmployee">
        <cfif IsDefined('form.employee_id')>
            <!--- RETRIEVE EMPLOYEE --->
            <cfquery name="get_employee" datasource="jrgm">
                SELECT aep.employee_id, ae.[Name FirstLast], ar.name, employee_active, username, password, access_role, password_date, ae.[Name FirstLast] FROM app_employee_passwords aep
                LEFT JOIN app_crews_new acn ON acn.employee_id=aep.employee_id
                INNER JOIN access_roles ar ON ar.access_role_id=aep.access_role
                LEFT JOIN app_employees ae ON ae.[Employee ID]=aep.employee_id
                WHERE ae.[Employee ID]=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfoutput>#serializejson(get_employee)#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="saveEmployee">
        <cfif IsDefined('form.employee_id')>
            <!--- SAVE EMPLOYEE --->
            <cfquery name="save_employee" datasource="jrgm">
                UPDATE app_employee_passwords
                SET employee_active=<cfqueryparam value="#form.employee_active#" CFSQLType="CF_SQL_INTEGER">,
                    username=<cfqueryparam value="#form.username#" CFSQLType="CF_SQL_TEXT">,
                    password=<cfqueryparam value="#form.password#" CFSQLType="CF_SQL_TEXT">,
                    password_date=GetDate()
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfoutput>#serializejson(ArrayNew(1))#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
</cfswitch>

<cfoutput>#serializejson(ArrayNew(1))#</cfoutput>