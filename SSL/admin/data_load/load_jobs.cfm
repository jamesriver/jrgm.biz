<cfabort><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Load Events</title>
</head>
<body>

<!--- 
<!------------- Get last job in app_jobs ------------------------>
<cfquery name="get_last_job_app_jobs" datasource="JRGM" maxrows="1">
 SELECT [Wk Location Name] AS lastjob,ID  FROM app_jobs 
 ORDER by ID DESC
 </cfquery>
 <CFSET lastjob = get_last_job_app_jobs.lastjob>
  <CFSET lastjob_app_jobs_ID = get_last_job_app_jobs.ID>
 <!---------------- Get Last ID from Jobs _test ------------------->
 <cfquery name="get_last_job_id_in_app_jobs_test" datasource="JRGM">
 SELECT ID  FROM app_jobs_test  WHERE [Wk Location Name] ='#lastjob#'
 </cfquery>
 <cfif get_last_job_id_in_app_jobs_test.recordcount EQ 0>
 No New Job Records to Add -Check Script
 <cfabort>
 </cfif>
 <CFSET lastjob_id = get_last_job_id_in_app_jobs_test.ID> --->
<!------------- Get New Jobs from Jobs_test -------------------->
   <cfquery name="get_new_jobs" datasource="JRGM">
 SELECT  [Job ID] AS jobid, [Wk Loc ID] AS wklocid, [Wk Location Name] AS WkLocationName, [Service Address] AS ServiceAddress , [Service Address2] AS ServiceAddres2, [Service City] AS ServiceCity, [Service State] AS ServiceState, [Service Zip] AS ServiceZip, [Acct Mgr] AS AcctMgr, [Crew Leader] AS CrewLeader, 
 [Service Day] AS ServiceDay, last_modified_date, export_date, active_record, export_id, Crew_Leader_ID, Supervisor_ID, branch, Status   FROM app_jobs_test  WHERE ID > 1843<!--- #lastjob_id# --->
 </cfquery>
 <cfoutput>#get_new_jobs.recordcount#</cfoutput> new jobs
 
 <cfif get_new_jobs.recordcount EQ 0>
 <br>
No New Job Records to Add
 <cfabort>
 </cfif>
<!-----------------Insert new jobs into app_jobs---------------------->
<!--- <cfloop query="get_new_jobs">
 <cfquery name="insert_into_app_jobs" datasource="JRGM">
 INSERT INTO APP_jobs 
 ([Job ID], [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],  [Crew Leader], 
  last_modified_date, export_date, active_record, Supervisor_ID, branch, Status) 
 VALUES 
 ('#get_new_jobs.jobid#','#get_new_jobs.wklocid#','#get_new_jobs.WkLocationName#', 
 '#get_new_jobs.ServiceAddress#',
 '#get_new_jobs.ServiceAddres2#',
 '#get_new_jobs.ServiceCity#',
 '#get_new_jobs.ServiceState#',
 '#get_new_jobs.ServiceZip#',
NULL,
 <cfqueryparam cfsqltype="cf_sql_date" value="#get_new_jobs.last_modified_date#">,
<cfqueryparam cfsqltype="cf_sql_date" value="#get_new_jobs.export_date#">  ,
 '#get_new_jobs.active_record#',
NULL,
  '#get_new_jobs.branch#',
  '#get_new_jobs.Status#' ) 
 </cfquery>
     </cfloop> --->
    
 <!---   Insert new jobs into app_events --->
<cfquery name="get_addressess" datasource="JRGM"   >
 SELECT DISTINCT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,
  Location = STUFF(
      COALESCE(', ' + RTRIM([Service Address]),'')  
    + COALESCE(', ' + RTRIM([Service Address2]),'')  
    + COALESCE(', ' + RTRIM([Service City]), '') 
    + COALESCE(', ' + RTRIM([Service State]), '') 
    + COALESCE(', ' + RTRIM([Service Zip]),  '')
    , 1, 2, '')
  FROM app_jobs WHERE ID > <!--- #lastjob_app_jobs_ID#  --->3477
 </cfquery>
 <cfloop query="get_addressess" >
<cfquery name="insert_into_app_events" datasource="JRGM">
 INSERT INTO APP_events 
 (Job_ID,event_name, branch,event_location,start_date,end_date,active_record) 
 VALUES 
 ('#get_addressess.job_id#','#get_addressess.work_location_name#','#get_addressess.branch#','#get_addressess.Location#' ,'2014-06-01 00:00:00','2015-06-01 00:00:00',1 ) 
</cfquery>
  </cfloop>
 <cfabort>

</body>
</html>
