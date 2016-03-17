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
  <cfif employee_position_ID EQ 94>
    <cfcookie name="employee_position" value="Business Development Group" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 95>
    <cfcookie name="employee_position" value="Administrative" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 96>
    <cfcookie name="employee_position" value="Administrative Assistant" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 97>
    <cfcookie name="employee_position" value="Estimator" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 98>
    <cfcookie name="employee_position" value="Regional Admin" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 99>
    <cfcookie name="employee_position" value="Admin" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 10>
    <cfcookie name="employee_position" value="Regional Manager" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 9>
    <cfcookie name="employee_position" value="Branch Manager" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 7>
    <cfcookie name="employee_position" value="STech" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 6>
    <cfcookie name="employee_position" value="ITech" expires="7">
  </cfif>
  <cfif employee_position_ID EQ 1>
    <cfcookie name="employee_position" value="Supervisor" expires="7">
  </cfif>
  <cfcookie name="employee_ID" value="#SESSION.userid#" expires="7">
  <cfcookie name="employee_name" value="#SESSION.screenname#" expires="7">
  <cfcookie name="employee_position_ID" value="#SESSION.access_role#" expires="7">
  <cfcookie name="employee_position" value="Branch Manager" expires="7">
  <!---<cfoutput>#employee_position_ID#</cfoutput> <cfoutput>#getlogin.password#</cfoutput> --->
  <!---  <cfabort>--->
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 99>
    <cflocation url="default.cfm">
  </cfif>
  <!---James exception--->
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 8  AND getlogin.password  EQ  'jrgmjb12' >
    <cflocation url="default.cfm">
  </cfif>
  <!---  bgarrett exception--->
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 8  AND getlogin.username  EQ  'bgarrett' >
    <cflocation url="bgarrett.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 98>
    <cflocation url="../Regional_Admin-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 97>
    <cflocation url="../quoting-new/default.cfm">
  </cfif>
  <!---  bcorfield exception--->
  <!---  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 96 AND getlogin.username  EQ  'bcorfield' >
    <cflocation url="payroll/payrollbetty.cfm">
  </cfif>--->
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 96>
    <cflocation url="payroll/payrollbetty.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 95>
    <cflocation url="bgarrett.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 94>
    <cflocation url="default.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 10>
    <cflocation url="../Regional-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 9>
    <cflocation url="../Branch-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 8>
    <cflocation url="../mechanic-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 7>
    <cflocation url="../stech-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 6>
    <cflocation url="../itech-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'home' AND  employee_position_ID EQ 1>
    <cflocation url="../supervisors-new/index.cfm">
  </cfif>
  <cfif url.schedchoice  EQ 'crews'>
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/scheduler/scheduler-new.html">
    </head>
    </html>
    <cfelse>
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/scheduler/schedulerevents-new.html">
    </head>
    </html>
  </cfif>
</cfif>
