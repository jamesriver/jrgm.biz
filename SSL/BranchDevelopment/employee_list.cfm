<cfquery name="get_employees_CL" datasource="jrgm">
SELECT * FROM employee_general_info WHERE Access_Role = 'Crew Leader' AND Direct_Supervisor_ID = #SESSION.userid# AND active_record =1
</cfquery>
<CFSET mylist ="">
<cfloop query="get_employees_CL">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<!--- <cfdump var="#get_employees#"> --->
<CFIF IsDefined("url.date")>
  <cfset todayDate = #url.date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>

<cfif todayDate_dow EQ 2>
  <CFSET todayDate_dow_v = "Mon">
  <cfelseif   todayDate_dow EQ 3>
  <CFSET todayDate_dow_v = "Tues">
  <cfelseif   todayDate_dow EQ 4>
  <CFSET todayDate_dow_v = "Wed">
  <cfelseif   todayDate_dow EQ 5>
  <CFSET todayDate_dow_v = "Thur">
  <cfelseif   todayDate_dow EQ 6>
  <CFSET todayDate_dow_v = "Fri">
  <cfelseif   todayDate_dow EQ 7>
  <CFSET todayDate_dow_v = "Sat">
  <cfelseif   todayDate_dow EQ 1>
  <CFSET todayDate_dow_v = "Sun">
</cfif>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM job_general_info WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid# AND active_record =1 
ORDER by Work_Loc_Name
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="outer">
<div id="left">
  <div class="topbarl">
    <div class="leftcolh"> </div>
  </div>
  <ul class="nav">
    <!---    <li><a href="../Crew_Leaders/job_list.cfm">The Bexley Association</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Union First Market Bank - Genito</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Property #5912 Harbour Pointe</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Victorian Square</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Rosemont Homeowner's Association</a></li> --->
  </ul>
</div>
<div id="centrecontent">
<div class="topbarr">
  <div align="right"><a href="../Crew_Leaders/forms.cfm" class="formsb">Forms</a></div>
</div>
<!--centre content goes here -->
<div class="centrecontent_inner">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="header">Supervisors</td>
      <td align="right" class="header"><table border="0" cellspacing="0" cellpadding="0">
          <!---  <tr>
              <td><a href="../Crew_Leaders/default.cfm"><img src="../Crew_Leaders/images/minus.gif" width="36" height="36" /></a></td>
              <td class="date">Friday, February 15, 2013</td>
              <td><a href="../Crew_Leaders/default.cfm"><img src="../Crew_Leaders/images/plus.gif" width="36" height="36" /></a></td>
            </tr> --->
        </table></td>
    </tr>
  </table>
  <blockquote>
  <ul>
    <cfoutput query="get_employees_CL">
      <li><a href="edit_timesheet.cfm?Employee_ID=#Employee_ID#">#Employee_Name#</a></li>
    </cfoutput>
  </ul>
  <br />
  <br />
  </p>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="includes/footer.cfm">
</body>
</html>
