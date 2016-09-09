<cfset SESSION = StructNew()>
<cfset SESSION.userid = 1001>
<cfquery name="get_app_crews_with_more_than_1_entry" datasource="jrgm">
    SELECT employee_id, crew_name FROM app_crews
    GROUP BY employee_id, crew_name
    HAVING COUNT(*)>1
</cfquery>
<cfset employee_ids = ''>
<cfloop query="get_app_crews_with_more_than_1_entry">
    <cfif employee_ids NEQ ''>
        <cfset employee_ids &= ','>
    </cfif>
    <cfset employee_ids &= employee_id>
    <cfoutput>Found #employee_id# #crew_name# with multiple crew entries</cfoutput>
</cfloop>
<cfif employee_ids NEQ ''>
<cfquery name="prune_app_crews_with_more_than_1_entry" datasource="jrgm">
    DELETE FROM app_crews
    WHERE employee_id IN (#employee_ids#)
      AND end_date < GETUTCDATE()
</cfquery>
<cfinclude template="../../scheduler/flatten_app_crews.cfm">
<cfoutput>Pruned successfully</cfoutput>
</cfif>