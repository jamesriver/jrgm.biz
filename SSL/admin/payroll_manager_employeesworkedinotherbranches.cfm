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

<!--- GET ALL AFFECTED DAILY SHEET IDS --->
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number_visible#
</cfquery>

<!---cfoutput>
    SELECT ads.id FROM app_employee_payroll_clock aepc
    INNER JOIN app_daily_sheets ads ON ads.id=aepc.ds_id
    JOIN app_employee_branchhistory aebh ON aebh.employee_id=aepc.employee_id AND aebh.asofdate <= aepc.Time_In AND aebh.untildate >= aepc.Time_In
    JOIN app_employee_branchhistory aebh2 ON aebh2.employee_id=ads.supervisor_id AND aebh2.asofdate <= aepc.Time_In AND aebh2.untildate >= aepc.Time_In
    WHERE aepc.Time_In >= '#DateFormat("#app_payroll_periods_C.pay_period_start#", "yyyy-mm-dd")# 00:00:00.000'
      AND aepc.Time_In <= '#DateFormat("#app_payroll_periods_C.pay_period_end#", "yyyy-mm-dd")# 23:59:59.999'
    GROUP BY ads.id
    HAVING COUNT(CASE WHEN aebh.branch != aebh2.branch THEN 1 ELSE NULL END) > 0
    ORDER BY ads.id
</cfoutput--->
<cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT ads.id FROM app_employee_payroll_clock aepc
    INNER JOIN app_daily_sheets ads ON ads.id=aepc.ds_id
    JOIN app_employee_branchhistory aebh ON aebh.employee_id=aepc.employee_id AND aebh.asofdate <= aepc.Time_In AND aebh.untildate >= aepc.Time_In
    JOIN app_employee_branchhistory aebh2 ON aebh2.employee_id=ads.supervisor_id AND aebh2.asofdate <= aepc.Time_In AND aebh2.untildate >= aepc.Time_In
    WHERE aepc.Time_In >= '#DateFormat("#app_payroll_periods_C.pay_period_start#", "yyyy-mm-dd")# 00:00:00.000'
      AND aepc.Time_In <= '#DateFormat("#app_payroll_periods_C.pay_period_end#", "yyyy-mm-dd")# 23:59:59.999'
    GROUP BY ads.id
    HAVING COUNT(CASE WHEN aebh.branch != aebh2.branch THEN 1 ELSE NULL END) > 0
    ORDER BY ads.id
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
          <td class="header">
            <cfoutput>
            Daily Sheets With Employees From Other Branches Report
            </cfoutput>
          </td>
        </tr>
      </table>     
<br />
<cfoutput>
<strong class="arialfontbold">Total Affected Daily Sheets: #get_daily_sheets.recordcount# records<br />
<br />
<span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">Pay Period ###pay_period_number_visible#: #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#-<cfoutput>#DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")#</cfoutput></span>
  <input type="button" value="<< Previous" onClick="window.location='payroll_manager_employeesworkedinotherbranches.cfm?branch=#branch#&pay_period=#(pay_period_number_visible-1)#';">
  <cfif pay_period_number_visible LT pay_period_number>
    <input type="button" value="Next >>" onClick="window.location='payroll_manager_employeesworkedinotherbranches.cfm?branch=#branch#&pay_period=#(pay_period_number_visible+1)#';">
  </cfif>
  </cfoutput>
<br />
<br />
<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td>DSID</td>
        </tr>
        <cfoutput query="get_daily_sheets">
          <tr>
            <td align="center"><a href="../admin/daily_sheet.cfm?dsid=#id#"  target="_blank">#id#</a></td>
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
