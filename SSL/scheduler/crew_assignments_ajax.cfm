<cfif IsDefined('url')>
    <cfset form = url>
</cfif>

<cfif SESSION.access_role EQ 9 OR SESSION.access_role EQ 10 OR SESSION.access_role EQ 94 OR SESSION.access_role EQ 95 OR SESSION.access_role EQ 96 OR SESSION.access_role EQ 98 OR SESSION.access_role EQ 99>
    <cfset user_is_admin = 1>
    <cfset user_access_role = 9>
<cfelseif SESSION.access_role EQ 1> <!---supervisor--->
    <cfset user_is_admin = 0>
    <cfset user_access_role = 1>
<cfelse>
    <cfoutput>#serializejson(ArrayNew(1))#</cfoutput>
    <cfabort>
</cfif>

<cfswitch expression="#form.ajaxAction#">
    <cfcase value="getSupervisorsAndCrewLeaders">
        <cfif user_is_admin EQ 1 AND IsDefined('form.branch')>
            <cfset access_roles = '10,9,2,1'>

            <!--- RETRIEVE APP_CREWS BY BRANCH AND ACCESS_ROLES --->
            <cfquery name="get_app_crews" datasource="jrgm">
                SELECT Employee_Position_ID, crew_name, employee_id, crew_leader_id, supervisor_id FROM app_crews_new
                WHERE employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                AND Employee_Position_ID IN (#access_roles#)
                ORDER BY Employee_Position_ID, crew_name
            </cfquery>
            <cfoutput>#serializejson(get_app_crews)#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="moveCrewLeader">
        <cfif IsDefined('form.crew_leader_id') AND IsDefined('form.supervisor_id')>
            <cfquery name="update_app_crews_new" datasource="jrgm">
                UPDATE app_crews_new
                SET supervisor_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                WHERE employee_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
                AND Employee_Position_ID=2
            </cfquery>
            <cfquery name="update_app_crews" datasource="jrgm">
                UPDATE app_crews
                SET supervisor_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                WHERE employee_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
                AND Employee_Position_ID=2
            </cfquery>
        <cfelse>
            <cfoutput>#serializejson({'error': 'Invalid crew_leader_id or supervisor_id'})#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="getCrewLeadersAndCrewMembers">
        <cfif IsDefined('form.supervisor_id') AND IsDefined('form.branch')>
            <cfset access_roles = '1,0,2,6,7,9,10'>

            <!--- RETRIEVE APP_CREWS BY BRANCH AND ACCESS_ROLES --->
            <cfquery name="get_app_crews" datasource="jrgm">
                SELECT Employee_Position_ID, crew_name, employee_id, crew_leader_id, supervisor_id, employee_branch FROM app_crews_new
                WHERE ((employee_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                       OR supervisor_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                       )
                    OR (employee_branch=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT"> AND Employee_Position_ID IN (0,6,7))
                )
                AND Employee_Position_ID IN (#access_roles#)
                ORDER BY Employee_Position_ID, crew_name
            </cfquery>
            <cfoutput>#serializejson(get_app_crews)#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="moveCrewMember">
        <cfif IsDefined('form.employee_id') AND IsDefined('form.crew_leader_id') AND IsDefined('form.branch')>
            <cfif form.crew_leader_id EQ 0>
                <cfquery name="get_employee" datasource="jrgm">
                    SELECT employee_branch FROM app_crews_new
                    WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
                    AND Employee_Position_ID IN (0,6,7)
                </cfquery>
                <cfif get_employee.employee_branch NEQ ''>
                    <cfquery name="get_supervisor" datasource="jrgm">
                        SELECT employee_id AS supervisor_id FROM app_crews_new
                        WHERE employee_branch=<cfqueryparam value="#get_employee.employee_branch#" CFSQLType="CF_SQL_TEXT">
                        AND Employee_Position_ID=9
                    </cfquery>
                </cfif>
            <cfelse>
                <cfquery name="get_supervisor" datasource="jrgm">
                    SELECT supervisor_id FROM app_crews_new
                    WHERE employee_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
                </cfquery>
            </cfif>
            <cfquery name="update_app_crews_new" datasource="jrgm">
                UPDATE app_crews_new
                SET crew_leader_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
                <cfif get_supervisor.supervisor_id GT 0>
                    , supervisor_id=<cfqueryparam value="#get_supervisor.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                </cfif>
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
                AND Employee_Position_ID IN (0,6,7)
            </cfquery>
            <cfquery name="update_app_crews" datasource="jrgm">
                UPDATE app_crews
                SET crew_leader_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
                <cfif get_supervisor.supervisor_id GT 0>
                    , supervisor_id=<cfqueryparam value="#get_supervisor.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
                </cfif>
                WHERE employee_id=<cfqueryparam value="#form.employee_id#" CFSQLType="CF_SQL_INTEGER">
                AND Employee_Position_ID IN (0,6,7)
            </cfquery>
        <cfelse>
            <cfoutput>#serializejson({'error': 'Invalid employee_id or crew_leader_id'})#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="getCrewMembersFromOtherBranches">
        <cfif IsDefined('form.branch')>
            <cfset access_roles = '0'>

            <!--- RETRIEVE APP_CREWS BY BRANCH AND ACCESS_ROLES --->
            <cfquery name="get_app_crews" datasource="jrgm">
                SELECT Employee_Position_ID, crew_name, employee_id, ae.[Name FirstLast] as crew_leader_name, acn.crew_leader_id, acn.employee_branch FROM app_crews_new acn
                LEFT JOIN app_employees ae ON ae.[Employee ID]=acn.crew_leader_id
                WHERE
                <cfif SESSION.branch EQ 'test'>
                    acn.employee_branch!=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT">
                <cfelse>
                    acn.employee_branch!=<cfqueryparam value="#form.branch#" CFSQLType="CF_SQL_TEXT"> AND acn.employee_branch!='test'
                </cfif>
                AND acn.Employee_Position_ID IN (#access_roles#)
                ORDER BY acn.employee_branch, acn.crew_name
            </cfquery>
            <cfoutput>#serializejson(get_app_crews)#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
    <cfcase value="getCrewMembersFromAllBranches">
        <cfif IsDefined('form.branch')>
            <cfset access_roles = '0,6,7'>

            <!--- RETRIEVE APP_CREWS BY BRANCH AND ACCESS_ROLES --->
            <cfquery name="get_app_crews" datasource="jrgm">
                SELECT Employee_Position_ID, crew_name, employee_id, ae.[Name FirstLast] as crew_leader_name, acn.crew_leader_id, acn.employee_branch FROM app_crews_new acn
                LEFT JOIN app_employees ae ON ae.[Employee ID]=acn.crew_leader_id
                WHERE
                <cfif SESSION.branch EQ 'test'>
                <cfelse>
                    acn.employee_branch!='test' AND
                </cfif>
                acn.Employee_Position_ID IN (#access_roles#)
                ORDER BY acn.employee_branch, acn.crew_name
            </cfquery>
            <cfoutput>#serializejson(get_app_crews)#</cfoutput>
            <cfabort>
        </cfif>
    </cfcase>
</cfswitch>

<cfoutput>#serializejson(ArrayNew(1))#</cfoutput>