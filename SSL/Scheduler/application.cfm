

 <cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
   SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
  


<cfset request.dsn="jrgm" />

<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">

<!--- <CFSET SESSION.userid =1829>
<CFSET SESSION.Employee_ID =1829> --->

<cfquery name="supervisorandcrewleaders" datasource="jrgm">
SELECT employee_id AS  Employee_ID FROM app_crews WHERE (supervisor_id = #SESSION.userid# OR employee_id = #SESSION.userid#)  AND Employee_Position_ID IN (1,2)
</cfquery>

   
  
  
<CFSET supervisorandcrewleaderslist ="">
<cfloop query="supervisorandcrewleaders">
  <cfset supervisorandcrewleaderslist = ListAppend(supervisorandcrewleaderslist,Employee_ID)>
</cfloop>
<!---  
 
 <cfdump var="#supervisorandcrewleaders#">

 <cfoutput>#supervisorandcrewleaderslist#</cfoutput>  ---> 