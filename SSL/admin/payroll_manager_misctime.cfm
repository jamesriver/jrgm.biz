<CFIF IsDefined("url.work_date")>
  <cfset todayDate1 = #url.work_date#>
  <cfset todaydate =#DateFormat("#todayDate1#", "yyyy-mm-dd")#>
  <cfelse>
  <cfset todayDate1 = Now()>
  <cfset todaydate =#DateFormat("#todayDate1#", "yyyy-mm-dd")#>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset pay_period_number_visible = pay_period_number>
<cfif IsDefined('url.pay_period')>
    <cfset pay_period_number_visible = url.pay_period>
</cfif>

<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number_visible#
</cfquery>

<cfquery name="get_all_employees" datasource="jrgm">
SELECT     [Employee ID] AS employee_id, branch,[Name FirstLast] AS empname
FROM         app_employees
 </cfquery>
<cfquery name="get_all_app_job_services_actual_employee" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
SELECT * FROM app_job_services_actual_employee
WHERE Job_ID IN ('MISC-IRR-1','J3033-1014','J3031-1014','J3025-1014','J3027-1014','J3018-1014','MISC-IRR-2','MISC-IRR-3','MISC-IRR-4','MISC-IRR-5')
  AND (Service_Time_In >= '#DateFormat("#app_payroll_periods_C.pay_period_start#", "yyyy-mm-dd")# 00:00:00.000')  AND  (Service_Time_In < '#DateFormat("#app_payroll_periods_C.pay_period_end#", "yyyy-mm-dd")# 00:00:00.000')
  AND Total_Time > 0
  ORDER BY Service_Time_In DESC
</cfquery>
<cfquery name="sum_all_app_job_services_actual_employee" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
SELECT SUM(Total_Time) as sum FROM app_job_services_actual_employee
WHERE Job_ID IN ('MISC-IRR-1','J3033-1014','J3031-1014','J3025-1014','J3027-1014','J3018-1014','MISC-IRR-2','MISC-IRR-3','MISC-IRR-4','MISC-IRR-5')
  AND (Service_Time_In >= '#DateFormat("#app_payroll_periods_C.pay_period_start#", "yyyy-mm-dd")# 00:00:00.000')  AND  (Service_Time_In < '#DateFormat("#app_payroll_periods_C.pay_period_end#", "yyyy-mm-dd")# 00:00:00.000')
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: normal 1.2em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 20px;
	font: normal Arial, Helvetica, sans-serif;
	color: red;
}
td {
  padding-right: 10px;
  padding-left: 10px;
}
 
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Miscellaneous Job Time Report</td>
        </tr>
      </table>     
<br />
<cfoutput>
<strong class="arialfontbold">Employee Labor records performed against Misc Jobs: #get_all_app_job_services_actual_employee.recordcount# records<br />
Total Hours: #sum_all_app_job_services_actual_employee.sum/60#, Average Hours Per Entry: #(sum_all_app_job_services_actual_employee.sum/60/get_all_app_job_services_actual_employee.recordcount)#<br />
<br />
<span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">Pay Period ###pay_period_number_visible#: #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#-<cfoutput>#DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")#</cfoutput></span>
  <input type="button" value="<< Previous" onClick="window.location='payroll_manager_misctime.cfm?pay_period=#(pay_period_number_visible-1)#';">
  <cfif pay_period_number_visible LT pay_period_number>
    <input type="button" value="Next >>" onClick="window.location='payroll_manager_misctime.cfm?pay_period=#(pay_period_number_visible+1)#';">
  </cfif>
  </cfoutput>
<br />
<br />
<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td><strong>Employee ID</strong></td>
          <td><strong>   Name</strong></td>
          <td><strong>Branch</strong></td>
          <td align="center"><strong>Date</strong></td>
          <!---td align="center"><strong>DS <br />
          Time Ins</strong></td--->
          <td><strong>DS <br />
          Minutes </strong></td>
          <td align="center"><strong>DSID</strong></td>
        </tr>
        <cfoutput query="get_all_app_job_services_actual_employee">
          <tr>
            <td>#Employee_ID#</td>
 <cfquery name="get_many_hours_name" dbtype="query" >
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td align="center">#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
            <!---td align="center">#totalids#</td--->
            <td>#Total_Time#</td>
            <td align="center"><a href="../admin/daily_sheet.cfm?dsid=#ds_id#"  target="_blank">#ds_id#</a></td>
          </tr>
        </cfoutput>
      </table>
      <br>
      <br />
      <br />
      <br />
      <br />
      <br />
    </div>
    <!--Html--> 
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div --> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
