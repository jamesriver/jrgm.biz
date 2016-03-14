

 <cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
  


<cfset request.dsn="jrgm" />

<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">

  <cfquery name="supervisorandcrewleaders" datasource="jrgm">
SELECT DISTINCT   Employee_ID FROM app_crews WHERE (Supervisor_ID = #SESSION.userid# OR Employee_ID = #SESSION.userid#)
  OR Supervisor_ID =#SESSION.userid#    AND active_record =1 AND employee_position_id = 2
</cfquery>  

 <!---    <cfdump var="#supervisorandcrewleaders#">   --->
  
  
<CFSET supervisorandcrewleaderslist ="">
<cfloop query="supervisorandcrewleaders">
  <cfset supervisorandcrewleaderslist = ListAppend(supervisorandcrewleaderslist,Employee_ID)>
</cfloop>
 
<!---   <cfoutput>#supervisorandcrewleaderslist#</cfoutput> <cfabort>  --->   