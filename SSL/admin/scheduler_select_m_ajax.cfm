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
                SELECT aep.employee_id, ae.[Name FirstLast], ar.name, employee_active, username, password, access_role, password_date, ae.[Name FirstLast], ae.branch FROM app_employee_passwords aep
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
            <!---cfoutput>
                UPDATE app_employee_passwords
                SET employee_active=#form.employee_active#
                    , username='#form.username#'
                    , password='#form.password#'
                    , password_date=CASE WHEN '#form.password#' != password THEN GetDate() ELSE password_date END
                    , branch='#form.branch#'
                WHERE employee_id=#form.employee_id#
            </cfoutput>
            <cfabort--->
            <cfquery name="save_employee" datasource="jrgm">
                UPDATE app_employee_passwords
                SET employee_active=<cfqueryparam value="#form.employee_active#" CFSQLType="CF_SQL_INTEGER">
                    , username=<cfqueryparam value="#form.username#" CFSQLType="CF_SQL_TEXT">
                    , password=<cfqueryparam value="#form.password#" CFSQLType="CF_SQL_TEXT">
                    , password_date=CASE WHEN <cfqueryparam value="#form.password#" CFSQLType="CF_SQL_TEXT"> != password THEN GetDate() ELSE password_date END
                    , employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <!--- SAVE BRANCH AND ACTIVE RECORD --->
            <cfquery name="save_employee2" datasource="jrgm">
                UPDATE app_employees
                SET branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                WHERE [Employee ID]=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <cfset bm_id = 0>
            <cfquery name="get_BM_ID" datasource="jrgm">
                SELECT employee_id AS Employee_ID FROM app_employee_passwords
                WHERE employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                AND access_role=9
                AND employee_active=1
            </cfquery>
            <cfif get_BM_ID.recordcount GT 0>
                <cfset bm_id = get_BM_ID.Employee_ID>
            </cfif>

            <cfquery name="save_employee3" datasource="jrgm">
                UPDATE app_crews
                SET supervisor_id=CASE WHEN <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT"> != employee_branch THEN <cfqueryparam value="#bm_id#" CFSQLType="CF_SQL_INTEGER"> ELSE supervisor_id END
                    , employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                    , active_record=<cfqueryparam value="#form.employee_active#" CFSQLType="CF_SQL_INTEGER">
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <cfquery name="save_employee4" datasource="jrgm">
                UPDATE app_crews_new
                SET supervisor_id=CASE WHEN <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT"> != employee_branch THEN <cfqueryparam value="#bm_id#" CFSQLType="CF_SQL_INTEGER"> ELSE supervisor_id END
                    , employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                    , active_record=<cfqueryparam value="#form.employee_active#" CFSQLType="CF_SQL_INTEGER">
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <cfoutput>#serializejson(ArrayNew(1))#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="addEmployee">
        <cfif IsDefined('form.employee_id') AND IsDefined('form.employee_id_new')>
            <!--- FIND EMPLOYEE --->
            <cfquery name="get_employee" datasource="jrgm">
                SELECT *, [Name FirstLast] as full_name, [Employee ID] as employee_id FROM app_employees
                WHERE [Employee ID]=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfif get_employee.recordcount EQ 0>
                <cfoutput>#serializejson({ 'error': 'Invalid Employee ID'})#</cfoutput>
                <cfabort>
            </cfif>

            <!--- PREVENT DUPLICATION --->
            <cfquery name="check_employee" datasource="jrgm">
                SELECT * FROM app_employee_passwords
                WHERE username=<cfqueryparam value="#form.username#" CFSQLType="CF_SQL_TEXT">
                OR employee_id=<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfif check_employee.recordcount NEQ 0>
                <cfoutput>#serializejson({ 'error': 'Duplicate username or Login Employee ID.  If you meant to add this employee to a 2nd branch, please select the new branch first.'})#</cfoutput>
                <cfabort>
            </cfif>


            <!---cfoutput>#serializejson({ 'error': 'All clear.'})#</cfoutput>
            <cfabort--->

            <!--- ADD EMPLOYEE --->
            <!---cfoutput>
                INSERT INTO app_employee_passwords
                (employee_id, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch, email)
                VALUES
                (#form.employee_id_new#
                 , '#form.username#'
                 , '#form.password#'
                 , '#get_employee.full_name#'
                 , #form.access_role#
                 , 1
                 , '#get_employee.first_name#'
                 , '#get_employee.last_name#'
                 , GETDATE()
                 , '#form.branch#'
                 , '#get_employee.email#'
                )
            </cfoutput>
            <cfabort--->
            <cfquery name="add_employee" datasource="jrgm">
                INSERT INTO app_employee_passwords
                (employee_id, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch, email)
                VALUES
                (<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
                 , <cfqueryparam value="#form.username#" CFSQLType="CF_SQL_TEXT">
                 , <cfqueryparam value="#form.password#" CFSQLType="CF_SQL_TEXT">
                 , <cfqueryparam value="#get_employee.full_name#" CFSQLType="CF_SQL_TEXT">
                 , <cfqueryparam value="#form.access_role#" CFSQLType="CF_SQL_TEXT">
                 , 1
                 , <cfqueryparam value="#get_employee.first_name#" CFSQLType="CF_SQL_TEXT">
                 , <cfqueryparam value="#get_employee.last_name#" CFSQLType="CF_SQL_TEXT">
                 , GETDATE()
                 , <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                 , <cfqueryparam value="#get_employee.email#" CFSQLType="CF_SQL_TEXT">
                )
            </cfquery>

            <cfif form.employee_id NEQ form.employee_id_new>
                <cfquery name="add_employee" datasource="jrgm">
                    INSERT INTO app_employees
                    ([Employee ID], [Name FirstLast], First_name, Last_name, Position, Branch, active_record, Middle_name, email)
                    VALUES
                    (<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
                     , <cfqueryparam value="#get_employee.full_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.first_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.last_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.position#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                     , 1
                     , <cfqueryparam value="#get_employee.middle_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.email#" CFSQLType="CF_SQL_TEXT">
                    )
                </cfquery>
            </cfif>

            <!--- UPDATE APP_EMPLOYEES BRANCH --->
            <cfquery name="delete_app_crews_new" datasource="jrgm">
                UPDATE app_employees
                SET branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                WHERE [Employee ID]=<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <!--- ADD TO APP_CREWS --->
            <cfquery name="delete_app_crews_new" datasource="jrgm">
                DELETE FROM app_crews_new
                WHERE employee_id=<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <cfquery name="delete_app_crews_new" datasource="jrgm">
                DELETE FROM app_crews
                WHERE employee_id=<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
            </cfquery>

            <cfif form.access_role EQ 9 OR form.access_role EQ 1 OR form.access_role EQ 2 OR form.access_role EQ 0 OR form.access_role EQ 6 OR form.access_role EQ 7>
                <cfset bm_id = 0>
                <cfquery name="get_BM_ID" datasource="jrgm">
                    SELECT employee_id AS Employee_ID FROM app_employee_passwords
                    WHERE employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                    AND access_role=9
                    AND employee_active=1
                </cfquery>
                <cfif get_BM_ID.recordcount GT 0>
                    <cfset bm_id = get_BM_ID.Employee_ID>
                </cfif>

                <cfquery name="insert_app_crews_new" datasource="jrgm">
                    INSERT INTO app_crews_new
                    (Employee_ID, crew_name, Employee_Branch, Crew_Leader_ID, Employee_Position_ID, First_name, Last_name, start_date, end_date, active_record, supervisor_ID)
                    VALUES
                    (<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
                     , <cfqueryparam value="#get_employee.full_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                     , NULL
                     , <cfqueryparam value="#form.access_role#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.first_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.last_name#" CFSQLType="CF_SQL_TEXT">
                     , '2016-01-01 00:00:00'
                     , '2099-12-31 23:59:59'
                     , 1
                     , <cfqueryparam value="#bm_id#" CFSQLType="CF_SQL_INTEGER">)
                </cfquery>

                <cfquery name="insert_app_crews" datasource="jrgm">
                    INSERT INTO app_crews
                    (Employee_ID, crew_name, Employee_Branch, Crew_Leader_ID, Employee_Position_ID, First_name, Last_name, start_date, end_date, active_record, supervisor_ID)
                    VALUES
                    (<cfqueryparam value="#form.employee_id_new#" CFSQLType="CF_SQL_INTEGER">
                     , <cfqueryparam value="#get_employee.full_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                     , NULL
                     , <cfqueryparam value="#form.access_role#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.first_name#" CFSQLType="CF_SQL_TEXT">
                     , <cfqueryparam value="#get_employee.last_name#" CFSQLType="CF_SQL_TEXT">
                     , '2016-01-01 00:00:00'
                     , '2099-12-31 23:59:59'
                     , 1
                     , <cfqueryparam value="#bm_id#" CFSQLType="CF_SQL_INTEGER">)
                </cfquery>
            </cfif>

            <cfoutput>#serializejson(ArrayNew(1))#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
</cfswitch>

<cfoutput>#serializejson(ArrayNew(1))#</cfoutput>