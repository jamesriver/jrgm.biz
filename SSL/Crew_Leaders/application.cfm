 <cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
  SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
<!--- <cfoutput>#Session.userid#</cfoutput> --->
<cfset request.dsn="jrgm" />
<cfparam name="SESSION.loginid" default="0">
<cfparam name="SESSION.job_id" default="9999">
<cfparam name="JOB_ID" default="0">
<cfparam name="SESSION.supervisor_id" default="1829">

  <!--- <cfoutput>#SESSION.USERID#</cfoutput>
  <cfdump var='#cgi#'>
<cfdump var="#SERVER#" />
<cfdump var="#form#" />  
  --->

<!---<cfif NOT IsDefined("SESSION.USERID")>
  <cflocation url="/">
</cfif>
---><cfset todayDate_DS = DateFormat(Now(),"mm/dd/yyyy")>

<!--- See if Session Daily Sheet exists from yesterday- if so logout  --->
<!---<cfif  IsDefined("Session.DS_ID") AND IsDefined("Session.logindate")>
<cfif Session.logindate NEQ todayDate_DS>
<cflocation url="/">
</cfif>
</cfif>


<!--- See if Daily Sheet exists- Issue Session if it does  --->
<cfif NOT IsDefined("Session.DS_ID") OR  Session.DS_ID EQ "">
  <cfquery name="get_max_ds" datasource="jrgm">
     SELECT MAX(ID) AS ds_id FROM APP_DAILY_SHEETS 
     WHERE crew_leader_id =#SESSION.userid# AND ds_date = '#todayDate_DS#'
   </cfquery>
  <cfif get_max_ds.recordcount GT 0>
    <CFSET SESSION.DS_ID=get_max_ds.ds_id>
  </cfif>
</cfif>


<!--- See if there is an active job, if so get info> --->
<cfquery name="get_active_jobs" datasource="jrgm">
SELECT * FROM app_job_clock WHERE Crew_Leader_ID = #SESSION.userid#  AND In_Out_Status =1 
</cfquery>
<cfif get_active_jobs.recordcount GT 0>
  <CFSET active_job_ID =   #get_active_jobs.job_ID#   >
  <CFSET active_job_ID_to_Update =   #get_active_jobs.ID#   >
  <cfquery name="get_this_job" datasource="jrgm">
SELECT [Wk Location Name] AS active_job_name FROM app_jobs WHERE [Job ID] = '#active_job_ID#'  
</cfquery>
</cfif>
--->