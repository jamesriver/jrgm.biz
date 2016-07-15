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

<!--- CALCULATE DEAD TIME --->
<cfset total_dead_time = 0>
<cfquery name="get_current_dead_time" datasource="jrgm">
    SELECT ads.id, COUNT(CASE WHEN aepc.ds_id IS NOT NULL THEN 1 ELSE NULL END) as count_payroll,  COUNT(CASE WHEN ajsae.ds_id IS NOT NULL THEN 1 ELSE NULL END) as count_job, SUM(time_worked) as sum_time_worked, aebh.branch, ae.[Name FirstLast] as production_manager_name, ae2.[Name FirstLast] as crew_leader_name FROM app_daily_sheets ads
    INNER JOIN app_employee_payroll_clock aepc ON aepc.ds_id=ads.id
    INNER JOIN app_employees ae ON ae.[Employee ID]=ads.supervisor_id
    INNER JOIN app_employee_branchhistory aebh ON aebh.employee_id=ae.[Employee ID]
    JOIN app_employees ae2 ON ae2.[Employee ID]=ads.crew_leader_id
    LEFT JOIN app_job_services_actual_employee ajsae ON ajsae.ds_id=aepc.ds_id
    WHERE ads.ds_date < CONVERT(Date, GetDate(), 121)
      AND aepc.Time_In >= '#DateFormat(app_payroll_periods_C.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000'
      AND aepc.Time_In <= '#DateFormat(app_payroll_periods_C.pay_period_end, 'yyyy-mm-dd')# 00:00:00.000'
      <cfif branch EQ ''>AND aebh.branch != 'test'<cfelse>AND aebh.branch='#branch#'</cfif>
    GROUP BY ads.id, aebh.branch, ae.[Name FirstLast], ae2.[Name FirstLast]
    HAVING COUNT(CASE WHEN ajsae.ds_id IS NOT NULL THEN 1 ELSE NULL END)=0
    ORDER BY ads.id DESC
</cfquery>
<cfloop query="get_current_dead_time">
    <cftry>
        <cfset total_dead_time += sum_time_worked>
        <cfcatch></cfcatch>
    </cftry>
</cfloop>


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
<cfif get_current_dead_time.recordcount EQ 0 OR total_dead_time EQ ''>
    No dead time found for this branch during this pay period.
<cfelse>
    <strong class="arialfontbold">DEAD TIME (no Jobs worked even though payroll time has been logged)<b>: #get_current_dead_time.recordcount# records<br />
    Total Hours: #total_dead_time/60#, Average Hours Per Entry: #(total_dead_time/60/get_current_dead_time.recordcount)#
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
<cfif get_current_dead_time.recordcount EQ 0 OR total_dead_time EQ ''>
  <cfabort>
</cfif>

<!---span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">No Dates or Daily Sheets are associated with these entries
<br />
<br /--->

<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td><strong>ID</strong></td>
          <td>Branch</td>
          <td>Production Manager</td>
          <td>Supervisor/Crew Leader</td>
          <td><strong>#<br />
          Time Ins </strong></td>
          <td><strong>DS <br />
          Minutes </strong></td>
        </tr>
        <cfoutput query="get_current_dead_time">
          <tr>
            <td><a href="../admin/daily_sheet.cfm?dsid=#ID#"  target="_blank">#ID#</a></td>
            <td>#branch#</td>
            <td>#production_manager_name#</td>
            <td>#crew_leader_name#</td>
            <td>#count_payroll#</td>
            <td>#sum_time_worked#</td>
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
