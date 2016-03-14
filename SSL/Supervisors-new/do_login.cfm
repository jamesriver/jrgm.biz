<cfquery name="getlogin" datasource="jrgm">
SELECT *
FROM APP_employee_passwords
 WHERE Employee_ID =#url.employee_ID#  AND employee_active =1
</cfquery>
<!--- <cfset comparison = Compare(FORM.password, getlogin.password)> --->
<cfif getlogin.recordcount GT 0  >
  <cfoutput query="getlogin">
    <cfset SESSION.loginid = 1>
    <cfset SESSION.userid = getlogin.Employee_ID>
    <cfset SESSION.branch = getlogin.employee_branch>
    <cfset SESSION.allowin = "true">
    <cfset SESSION.access_role = getlogin.access_role>
    <cfset SESSION.screenname = getlogin.firstname &" " & getlogin.lastname>
    <cfset SESSION.todaytoken= dateformat(now(), "mmddyyyy") & "T" & TimeFormat(now(), "HHmmss")>
    <cfset SESSION.logindate= DateFormat(Now(),"mm/dd/yyyy")>
    <cfcookie name="employee_ID" value="#SESSION.userid#" expires="7">
    <cfcookie name="employee_name" value="#SESSION.screenname#" expires="7">
    <cfcookie name="employee_position_ID" value="#SESSION.access_role#" expires="7">
  </cfoutput>
  <cfif employee_position_ID EQ 1>
    <cfcookie name="employee_position" value="Supervisor" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 9>
    <cfcookie name="employee_position" value="Branch Manager" expires="7">
  </cfif>
  <cfcookie name="employee_ID" value="#SESSION.userid#" expires="7">
  <cfcookie name="employee_name" value="#SESSION.screenname#" expires="7">
  <cfcookie name="employee_position_ID" value="#SESSION.access_role#" expires="7">
  <cfcookie name="employee_position" value="Branch Manager" expires="7">
  <cfif url.schedchoice  EQ 'crews'>
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=https://www.jrgm.biz/ssl/scheduler/scheduler-new.html">
    </head>
    </html>
    <cfelse>
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=https://www.jrgm.biz/ssl/scheduler/schedulerevents-new.html">
    </head>
    </html>
  </cfif>
  <!--- <cfif url.schedchoice  EQ 'crews'>
<cflocation   url="https://www.jrgm.biz/ssl/scheduler/scheduler.html"   addtoken="no"  >
<cfelse>
<cflocation   url="https://www.jrgm.biz/ssl/scheduler/schedulerevents.html"   addtoken="no"  >
</cfif> --->
</cfif>
