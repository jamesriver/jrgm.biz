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
<cfset branch = ''>
<cfif IsDefined('url.branch')>
    <cfif url.branch NEQ 'All'>
        <cfset branch = url.branch>
    </cfif>
</cfif>

<!--- BRANCHES --->
<cfset branches = ArrayNew(1)>
<cfset ArrayAppend(branches, 'All')>
<cfquery name="get_branches" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
  SELECT * FROM branches
  WHERE branch_visible_to_payroll=1
  ORDER BY branch_name
</cfquery>
<cfloop query="get_branches">
    <cfset ArrayAppend(branches, branch_name)>
</cfloop>
<cfset ArrayAppend(branches, 'Corporate')>

<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number_visible#
</cfquery>

<cfquery name="get_all_employees" datasource="jrgm">
SELECT     [Employee ID] AS employee_id, branch,[Name FirstLast] AS empname
FROM         app_employees
 </cfquery>

<!--- CALCULATE DEAD TIME BY BRANCH, tricky because dead time has no job or date or daily sheet associated with it--->
<cfset current_dead_time = 0>
<cfquery name="get_current_dead_time_start_id" datasource="jrgm">
    SELECT TOP 1 ajsae.ID FROM app_job_services_actual_employee ajsae
    INNER JOIN app_employee_branchhistory aebh ON aebh.employee_id=ajsae.employee_id
    WHERE Service_Time_In >= '#DateFormat(app_payroll_periods_C.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000'
</cfquery>
<cfif get_current_dead_time_start_id.recordcount GT 0>
    <cfquery name="get_current_dead_time_end_id" datasource="jrgm">
        SELECT TOP 1 ajsae.ID FROM app_job_services_actual_employee ajsae
        INNER JOIN app_employee_branchhistory aebh ON aebh.employee_id=ajsae.employee_id
        WHERE Service_Time_In >= '#DateFormat(app_payroll_periods_C.pay_period_end, 'yyyy-mm-dd')# 00:00:00.000'
    </cfquery>

    <cfquery name="get_all_app_job_services_actual_employee" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
        SELECT * FROM app_job_services_actual_employee ajsae
        INNER JOIN app_employee_branchhistory aebh ON aebh.employee_id=ajsae.employee_id
        WHERE Job_ID IS NULL
        AND Total_Time > 0
        AND ajsae.ID>#get_current_dead_time_start_id.ID#
        <cfif get_current_dead_time_end_id.recordcount GT 0>AND ajsae.ID<=#get_current_dead_time_end_id.ID#</cfif>
        <cfif branch NEQ ''>AND aebh.branch='#branch#'</cfif>
    </cfquery>
    <cfquery name="sum_all_app_job_services_actual_employee" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
        SELECT SUM(Total_Time) as sum FROM app_job_services_actual_employee ajsae
        INNER JOIN app_employee_branchhistory aebh ON aebh.employee_id=ajsae.employee_id
        WHERE Job_ID IS NULL
        AND Total_Time > 0
        AND ajsae.ID>#get_current_dead_time_start_id.ID#
        <cfif branch NEQ ''>AND aebh.branch='#branch#'</cfif>
    </cfquery>
</cfif>

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
          <td class="header">
              <cfoutput>
              Dead Time Report:
              <select onChange="window.location='payroll_manager_deadtime.cfm?branch='+this.value+'&pay_period=#pay_period_number_visible#';">
                  <cfloop from="1" to="#arrayLen(branches)#" index="i">
                      <cfset branch_name = branches[i]>
                      <option value="#branch_name#"<cfif branch_name EQ branch> selected</cfif>>#branch_name#</option>
                  </cfloop>
              </select>
              </cfoutput>
          </td>
        </tr>
      </table>     
<br />
<cfoutput>
<cfif get_current_dead_time_start_id.recordcount EQ 0 OR sum_all_app_job_services_actual_employee.sum EQ ''>
    No dead time found for this branch during this pay period.
<cfelse>
    <strong class="arialfontbold">DEAD TIME (no associated Job ID)<b>: #get_all_app_job_services_actual_employee.recordcount# records<br />
    Total Hours: #sum_all_app_job_services_actual_employee.sum/60#, Average Hours Per Entry: #(sum_all_app_job_services_actual_employee.sum/60/get_all_app_job_services_actual_employee.recordcount)#
</cfif>
<br />
<br />
<span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">Pay Period ###pay_period_number_visible#: #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#-<cfoutput>#DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")#</cfoutput></span>
  <input type="button" value="<< Previous" onClick="window.location='payroll_manager_deadtime.cfm?branch=#branch#&pay_period=#(pay_period_number_visible-1)#';">
  <cfif pay_period_number_visible LT pay_period_number>
    <input type="button" value="Next >>" onClick="window.location='payroll_manager_deadtime.cfm?branch=#branch#&pay_period=#(pay_period_number_visible+1)#';">
  </cfif>
</cfoutput>
<br />
<br />
<cfif get_current_dead_time_start_id.recordcount EQ 0 OR sum_all_app_job_services_actual_employee.sum EQ ''>
  <cfabort>
</cfif>

<!---span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">No Dates or Daily Sheets are associated with these entries
<br />
<br /--->

<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td><strong>ID</strong></td>
          <td><strong>Employee ID</strong></td>
          <td><strong>   Name</strong></td>
          <td><strong>Branch</strong></td>
          <!---td align="center"><strong>Date</strong></td>
          <td align="center"><strong>DS <br />
          Time Ins</strong></td--->
          <td><strong>DS <br />
          Minutes </strong></td>
          <!---td align="center"><strong>DSID</strong></td--->
        </tr>
        <cfoutput query="get_all_app_job_services_actual_employee">
          <tr>
            <td>#ID#</td>
            <td>#Employee_ID#</td>
 <cfquery name="get_many_hours_name" dbtype="query" >
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <!---td align="center">#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
            <td align="center">#totalids#</td--->
            <td>#Total_Time#</td>
            <!---td align="center"><a href="../admin/daily_sheet.cfm?dsid=#ds_id#"  target="_blank">#ds_id#</a></td--->
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
