<CFSET allchecked ='Yes'>
<cfquery name="get_employees" datasource="jrgm">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone FROM app_employees WHERE Direct_Supervisor_ID = #SESSION.userid#  AND active_record =1
</cfquery>
<CFSET mylist ="">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<!--------------- See if employees are ALL in or are ALL out --->
<cfquery name="get_employee_all_in" datasource="jrgm" maxrows="#get_employees.recordcount#">
SELECT * FROM app_employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
<cfquery name="get_employee_all_out" datasource="jrgm"  maxrows="#get_employees.recordcount#">
SELECT * FROM app_employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =2
ORDER by ID DESC
</cfquery>
<cfif get_employee_all_out.recordcount EQ get_employee_all_in.recordcount>
  <CFSET allchecked ='Yes'>
  <cfelse>
  <CFSET allchecked ='No'>
</cfif>
<cfif  get_employee_all_in.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
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
SELECT * FROM app_jobs WHERE   Crew_Leader_ID = #Session.userid# AND active_record =1
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="subheader"> Proposal Maker</div>
     
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
