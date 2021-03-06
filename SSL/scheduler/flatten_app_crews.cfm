<cfquery name="delete_app_crews" datasource="jrgm">
    DELETE FROM app_crews_new
</cfquery>
<cfquery name="reseed_app_crews" datasource="jrgm">
    DBCC CHECKIDENT (app_crews_new, RESEED, 0)
</cfquery>

<cfquery name="get_app_crews" datasource="jrgm">
    SELECT * FROM app_crews
    ORDER BY employee_id, ID DESC
</cfquery>

<cfset last_employee_id = 0>

<cfoutput query="get_app_crews">    
    <cfif last_employee_id NEQ employee_id>
        <cfif last_employee_id GT 0>
            <cftry>
                <cfquery name="insert_app_crews_new" datasource="jrgm">
                    INSERT INTO app_crews_new
                    (crew_name, start_date, end_date, employee_id, crew_leader_id, supervisor_id, employee_branch, Employee_Position_ID, first_name, last_name, active_record, export_id, supervisor, event_length, rec_type)
                    VALUES
                    ('#Replace(last_crew_name, "'", "''", "ALL")#', '2016-01-01 00:00:00.000', '2099-12-31 00:00:00', #last_employee_id#, #last_crew_leader_id#, #last_supervisor_id#, '#last_employee_branch#', '#last_Employee_Position_ID#', '#Replace(first_name, "'", "''", "ALL")#', '#Replace(last_name, "'", "''", "ALL")#', 1, '#last_export_id#', '#last_supervisor#', '#last_event_length#', '#last_rec_type#');
                </cfquery>
                <cfcatch>
                    INSERT INTO app_crews_new
                    (crew_name, start_date, end_date, employee_id, crew_leader_id, supervisor_id, employee_branch, Employee_Position_ID, first_name, last_name, active_record, export_id, supervisor, event_length, rec_type)
                    VALUES
                    ('#Replace(last_crew_name, "'", "''", "ALL")#', '2016-01-01 00:00:00.000', '2099-12-31 00:00:00', #last_employee_id#, #last_crew_leader_id#, #last_supervisor_id#, '#last_employee_branch#', '#last_Employee_Position_ID#', '#Replace(first_name, "'", "''", "ALL")#', '#Replace(last_name, "'", "''", "ALL")#', 1, '#last_export_id#', '#last_supervisor#', '#last_event_length#', '#last_rec_type#');
                </cfcatch>
            </cftry>
        </cfif>
        <cfset last_employee_id = employee_id>
        <cfset last_supervisor_id = 0>
        <cfset last_crew_leader_id = 0>
    </cfif>
    <cfset last_crew_name = get_app_crews.crew_name>
    <cfset last_employee_id = get_app_crews.employee_id>
    <cfset last_employee_branch = get_app_crews.employee_branch>
    <cfset last_Employee_Position_ID = get_app_crews.Employee_Position_ID>
    <cfset last_first_name = get_app_crews.first_name>
    <cfset last_last_name = get_app_crews.last_name>
    <cfset last_export_id = get_app_crews.export_id>
    <cfset last_supervisor = get_app_crews.supervisor>
    <cfset last_event_length = get_app_crews.event_length>
    <cfset last_rec_type = get_app_crews.rec_type>
    <cfif last_supervisor_id EQ 0 AND supervisor_id GT 0>
        <cfset last_supervisor_id = supervisor_id>
    </cfif>
    <cfif last_crew_leader_id EQ 0 AND crew_leader_id GT 0>
        <cfset last_crew_leader_id = crew_leader_id>
    </cfif>
</cfoutput>
<cfquery name="insert_app_crews_new" datasource="jrgm">
    INSERT INTO app_crews_new
    (crew_name, start_date, end_date, employee_id, crew_leader_id, supervisor_id, employee_branch, Employee_Position_ID, first_name, last_name, active_record, export_id, supervisor, event_length, rec_type)
    VALUES
    ('#Replace(last_crew_name, "'", "''", "ALL")#', '2016-01-01 00:00:00.000', '2099-12-31 00:00:00', #last_employee_id#, #last_crew_leader_id#, #last_supervisor_id#, '#last_employee_branch#', #last_Employee_Position_ID#, '#Replace(last_first_name, "'", "''", "ALL")#', '#Replace(last_last_name, "'", "''", "ALL")#', 1, '#last_export_id#', '#last_supervisor#', '#last_event_length#', '#last_rec_type#');
</cfquery>
<cfquery name="drop_app_crews" datasource="jrgm">
    DROP TABLE app_crews
</cfquery>
<cfquery name="insert_app_crews" datasource="jrgm">
    SELECT * INTO app_crews FROM app_crews_new
</cfquery>

<cfquery name="realign_job_statuses" datasource="jrgm">
    UPDATE app_jobs
    SET active_record=0
    WHERE (active_record=1 AND Status!='IN PROGRESS')
</cfquery>
<cfquery name="realign_job_statuses2" datasource="jrgm">
    UPDATE app_jobs
    SET active_record=1
    WHERE (active_record=0 AND Status='IN PROGRESS')
</cfquery>
