<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script>
function goBack()
  {
  window.history.back()
  }
</script>
</head>

<body>
  
<cfif form.username EQ 'amans'> 
<cfset username = 'bdonald'>
<cfelse>
<cfset username = form.username>
<cfset password = form.password>
</cfif>

 
<!--- Join employee_passwords employee_generl_info on employee id --->

<!---  <cfquery name="getlogin" datasource="jrgm">
SELECT *
FROM APP_employee_passwords
INNER JOIN APP_employees
ON APP_employee_passwords.Employee_ID=APP_employees.[Employee ID] WHERE username = '#username#' AND password = '#password#'  AND employee_active =1
</cfquery> --->

 <cfquery name="getlogin" datasource="jrgm">
SELECT *
FROM APP_employee_passwords
WHERE username = '#username#' AND password = '#password#'  AND employee_active =1
</cfquery>
 
<!--- <cfdump var="#getlogin#">
<cfabort> 
 --->
 
<cfset comparison = Compare(FORM.password, getlogin.password)>
<cfif getlogin.recordcount GT 0  AND comparison EQ 0 AND TRIM(username) NEQ ''>
<cfoutput query="getlogin">
<cfset SESSION.loginid = 1>
<cfset SESSION.userid = getlogin.Employee_ID>
<cfset SESSION.branch = getlogin.employee_branch>
<cfset SESSION.allowin = "true">
<cfset SESSION.access_role = getlogin.access_role> 
<cfset SESSION.screenname = getlogin.firstname &" " & getlogin.lastname>
<cfset SESSION.todaytoken= dateformat(now(), "mmddyyyy") & "T" & TimeFormat(now(), "HHmmss")>
<cfset SESSION.logindate= DateFormat(Now(),"mm/dd/yyyy")>  

 <cfif getlogin.Employee_ID EQ 1001>
<cfset SESSION.screenname_always = getlogin.firstname &" " & getlogin.lastname>
<cfset SESSION.userid = 1001>
 </cfif>  
 
 <cfif getlogin.Employee_ID EQ 1003>
<cfset SESSION.screenname_always = getlogin.firstname &" " & getlogin.lastname>
<cfset SESSION.userid = 1003>
 </cfif>  



<cfcookie name="employee_ID" value="#SESSION.userid#" expires="7">
<cfcookie name="employee_name" value="#SESSION.screenname#" expires="7">
<cfcookie name="employee_position_ID" value="#SESSION.access_role#" expires="7">
 </cfoutput>

<cfif employee_position_ID EQ 1>
<cfcookie name="employee_position" value="Supervisor" expires="7">
 </cfif>
 
  <cfif employee_position_ID EQ 6>
<cfcookie name="employee_position" value="Irrigation Tech" expires="7">
 </cfif>
 
 <cfif employee_position_ID EQ 7>
<cfcookie name="employee_position" value="Spray Tech" expires="7">
 </cfif>
 <cfif employee_position_ID EQ 9>
    <cfcookie name="employee_position" value="Branch Manager" expires="7">
  </cfif>
 <cfif employee_position_ID EQ 10>
    <cfcookie name="employee_position" value="Regional Manager" expires="7">
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
 
 
<cfquery name="get_supervisor_id" datasource="jrgm" maxrows="1">
SELECT supervisor_id
FROM APP_crews
WHERE Employee_ID = #SESSION.userid#
</cfquery>

<cfset SESSION.supervisor_id = get_supervisor_id.supervisor_id>

 <cfif SESSION.access_role EQ 1>
<cflocation   url="/ssl/supervisors-new/index.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 2>
<cflocation   url="/"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 6>
<cflocation   url="/ssl/itech-new/index.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 7>
<cflocation   url="/ssl/stech-new/index.cfm"   addtoken="no"  >
 <cfelseif SESSION.access_role EQ 8>
<cflocation   url="/ssl/mechanic-new/index.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 9>
<cflocation   url="/ssl/branch-new/index.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 10>
<cflocation url="/ssl/regional-new/index.cfm"  addtoken="no"  >
<cfelseif SESSION.access_role EQ 95 >
<cflocation   url="/ssl/admin/bgarrett.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 96 >
<cflocation   url="/ssl/admin/payroll/payrollbetty.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 97 >
<cflocation   url="/ssl/quoting-new/default.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 98 >
<cflocation   url="/ssl/regional_admin-new/index.cfm"   addtoken="no"  >
<cfelseif SESSION.access_role EQ 99>
<cflocation   url="/ssl/admin/default.cfm"   addtoken="no"  >
</cfif>
<!--- <cfelseif  username EQ 'un' AND password EQ 'pw'  >
 <cflocation url="index.cfm?pw=yes">
 <cfelseif  username EQ 'admin' AND password EQ 'jrgm'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "9999">
 <cfset SESSION.screenname = "JRGM Admin">
 <cflocation url="/ssl/admin/default.cfm">
 <cfelseif  username EQ 'crewleader' AND password EQ 'jrgm'  >
 <cflocation url="/ssl/crew_leaders/services.htm?pw=yes">
 <cfelseif  username EQ '3' AND password EQ '3'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.ADP = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "JRGM Admin">
 <cflocation url="/ssl/admin/pat_new.cfm">
 <cfelseif  username EQ 'p' AND password EQ 'p'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "JRGM Admin">
 <cflocation url="/ssl/admin/pat.cfm">
 <cfelseif  username EQ 'mcandler' AND password EQ 'jrgm'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "Maria Candler">
 <cflocation url="/ssl/admin/maria.cfm">
 <cfelseif  username EQ 'jknight' AND password EQ 'jrgm'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "Jason Knight">
 <cflocation url="/ssl/admin/maria.cfm">
 <cfelseif  username EQ 'bgarrett' AND password EQ 'jrgm'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "Bruce Garrett">
 <cflocation url="/ssl/admin/bgarrett.cfm">
 <cfelseif  username EQ 'cwilliams' AND password EQ 'jrgm'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "Christy Williams">
 <cflocation url="/ssl/admin/cwilliams.cfm">
 <cfelseif  username EQ 'ip' AND password EQ 'ip'  >
 <cfset SESSION.loginid = 1>
 <cfset SESSION.userid = "admin">
 <cfset SESSION.screenname = "JRGM Admin">
 <cflocation url="/ssl/admin/patip.cfm">--->
 <cfelse>
 <cflocation url="/index.cfm?message=invalid">
</cfif>
</body>
</html>