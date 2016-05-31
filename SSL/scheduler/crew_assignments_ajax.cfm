<cfif IsDefined('url')>
    <cfset form = url>
</cfif>

<cfif IsDefined('form.ajaxAction')>
    <cfif form.ajaxAction EQ 'initializeCrews'>
        <cfif IsDefined('form.branch') AND IsDefined('form.access_role')>
            <!--- MAKE SURE LOGGED IN USER HAS CORRECT PERMISSION TO GET THIS INFO --->
            <cfset access_roles = ''>
            <cfif form.access_role EQ 9 OR form.access_role EQ 10 OR form.access_role EQ 94 OR form.access_role EQ 95 OR form.access_role EQ 96 OR form.access_role EQ 98 OR form.access_role EQ 99>
                <cfset access_roles = '9,2,1'>
            <cfelseif form.access_role EQ 1> <!---supervisor--->
                <cfset access_roles = '1,0,6,7'>
            </cfif>
            <cfif access_roles NEQ ''>
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
        </cfif>
    </cfif>
<cfelseif form.ajaxAction EQ 'moveCrewLeader'>
    <cfif IsDefined('form.crew_leader_id') AND IsDefined('form.supervisor_id')>
        <cfquery name="update_app_crews_new" datasource="jrgm">
            UPDATE app_crews_new
            SET supervisor_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
            WHERE employee_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
            AND Employee_Position_ID=1
        </cfquery>
        <cfquery name="update_app_crews" datasource="jrgm">
            UPDATE app_crews
            SET supervisor_id=<cfqueryparam value="#form.supervisor_id#" CFSQLType="CF_SQL_INTEGER">
            WHERE employee_id=<cfqueryparam value="#form.crew_leader_id#" CFSQLType="CF_SQL_INTEGER">
            AND Employee_Position_ID=1
        </cfquery>
    <cfelse>
        <cfoutput>#serializejson({'error': 'Invalid crew_leader_id or supervisor_id'})#</cfoutput>
        <cfabort>
    </cfif>
</cfif>
<cfoutput>#serializejson(ArrayNew(1))#</cfoutput>