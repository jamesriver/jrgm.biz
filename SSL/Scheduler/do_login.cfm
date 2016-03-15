<cfquery name="getlogin" datasource="jrgm">
SELECT *
FROM APP_employee_passwords
 WHERE Employee_ID =#SESSION.userid#  AND employee_active =1
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
 
 
 
 
 
  <cfif url.schedchoice  EQ 'home' AND employee_position_ID EQ 9 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/branch-new/default.cfm">
    </head>
    </html>
   </cfif>
   
     <cfif url.schedchoice  EQ 'payroll' AND employee_position_ID EQ 9 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/branch-new/payroll_main.cfm">
    </head>
    </html>
   </cfif>
   
     <cfif url.schedchoice  EQ 'dailysheet' AND employee_position_ID EQ 9 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/branch-new/dailysheet_select.cfm">
    </head>
    </html>
   </cfif>
   
     <cfif url.schedchoice  EQ 'inventory' AND employee_position_ID EQ 9 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/branch-new/inventory_list.cfm">
    </head>
    </html>
   </cfif>
   
    <cfif url.schedchoice  EQ 'directory' AND employee_position_ID EQ 9 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/branch-new/directory.cfm">
    </head>
    </html>
   </cfif>
   
   
   
     <cfif url.schedchoice  EQ 'home' AND employee_position_ID EQ 1 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/supervisors-new/default.cfm">
    </head>
    </html>
   </cfif>
   
     <cfif url.schedchoice  EQ 'payroll' AND employee_position_ID EQ 1 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/supervisors-new/payroll_main.cfm">
    </head>
    </html>
   </cfif>
   
     <cfif url.schedchoice  EQ 'dailysheet' AND employee_position_ID EQ 1 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/supervisors-new/dailysheet_select.cfm">
    </head>
    </html>
   </cfif>
   
      <cfif url.schedchoice  EQ 'inventory' AND employee_position_ID EQ 1 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/supervisors-new/inventory_list.cfm">
    </head>
    </html>
   </cfif>
   
    <cfif url.schedchoice  EQ 'directory' AND employee_position_ID EQ 1 >
    <html>
    <head>
    <META HTTP-EQUIV="Refresh" CONTENT="1;URL=/ssl/supervisors-new/directory.cfm">
    </head>
    </html>
   </cfif>
  
  
</cfif>
