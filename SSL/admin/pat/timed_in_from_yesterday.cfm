<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent"> 
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset todayDate = Now()>
    <cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
    <cfset y = year(now())>
    <cfset m = month(now())>
    <cfset d = day(now())>
    <cfset today_5PM = createDatetime(y,m,d,17,0,0)>
    <cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
    <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
    <cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
    <CFSET outtime = today_5PM>
    <cfset mytime = timeFormat(now(), "hh:mm tt")>
    EMPLOYEES 
    <!---  <cfquery name="time_me_out" datasource="jrgm">
 SELECT * FROM APP_Employee_Payroll_Clock WHERE In_out_status = 1 AND ds_date < '#today_datex#'
 </cfquery>---> 
    
    <!---<cfset todayDate = Now()>
<cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
<cfset mytime = timeFormat(now(), "hh:mm tt")>--->
    <cfset daysago7 = dateadd("d",-7,today_datex)>
    <!---   EMPLOYEES --->
    <cfquery name="time_me_out" datasource="jrgm">
 SELECT * FROM APP_Employee_Payroll_Clock WHERE In_out_status = 1 AND ds_date < '#today_datex#'  AND ds_date > #daysago7#
 </cfquery>
    <cfdump  var="#time_me_out#">
    <br />
    <br />
    <cfif  time_me_out.recordcount GT 0>
      <cfloop query="time_me_out">
        <cfset y = year(time_me_out.ds_date)>
        <cfset m = month(time_me_out.ds_date)>
        <cfset d = day(time_me_out.ds_date)>
        <cfset thatday_5PM = createDatetime(y,m,d,17,0,0)>
        <CFSET outtime = thatday_5PM>
        <cfquery name="time_me_out_update" datasource="jrgm">
 UPDATE APP_Employee_Payroll_Clock 
 SET   Time_Out =  #outtime#
  WHERE ID = #time_me_out.ID#
 </cfquery>
      </cfloop>
    </cfif>
    <!--- <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out) 
      </cfquery>
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out), in_out_status=2
    WHERE time_out IS NOT NULL
     </cfquery>--->
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out)   WHERE ds_date > #daysago7#
      </cfquery>
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out), in_out_status=2
    WHERE time_out IS NOT NULL  AND  ds_date > #daysago7#
     </cfquery>
    <strong>JOBS</strong>
    <cfquery name="time_me_outj" datasource="jrgm">
  SELECT * FROM APP_Job_Clock WHERE In_out_status = 1 AND job_time_in < '#today_datex#'
    </cfquery>
    <cfdump  var="#time_me_outj#">
    <cfif  time_me_outj.recordcount GT 0>
      <cfloop query="time_me_outj">
        <cfset y = year(time_me_outj.Job_Time_In)>
        <cfset m = month(time_me_outj.Job_Time_In)>
        <cfset d = day(time_me_outj.Job_Time_In)>
        <cfset thatday_5PM = createDatetime(y,m,d,17,0,0)>
        <CFSET outtime = thatday_5PM>
        <cfquery name="time_me_out_update" datasource="jrgm">
 UPDATE APP_job_Clock 
 SET   Job_Time_Out =  #outtime#
  WHERE ID = #time_me_outj.ID#
 </cfquery>
      </cfloop>
    </cfif>
    <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2
    WHERE job_time_out IS NOT NULL
     </cfquery>
    Fixed </div>
</div>
<!-- to clear footer --> 
<!--</div>--> 
<!-- end outer div -->
<cfinclude template="../includes/footer.cfm">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
