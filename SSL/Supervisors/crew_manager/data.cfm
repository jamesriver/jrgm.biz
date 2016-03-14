 

<cfinclude template="config.cfm">
 
<cfset scheduler = createObject("component",request.dhtmlxConnectors["scheduler"]).init(request.dhtmlxConnectors["datasource"],"MSSQL")>

<cfset scheduler.render_sql("SELECT * FROM app_crews WHERE crew_leader_id IN (#supervisorandcrewleaderslist#) AND active_record=1","ID","start_date,end_date,crew_name,employee_id,export_id,employee_branch,Employee_Position_ID,rec_type,supervisor_id,event_length,first_name,last_name,active_record,crew_leader_id")>

 