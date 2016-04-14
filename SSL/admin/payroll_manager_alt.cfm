<CFIF IsDefined("url.work_date")>
  <cfset todayDate1 = #url.work_date#>
  <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
  <cfelse>
  <cfset todayDate1 = Now()>
  <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfquery name="get_all_employees" datasource="jrgm">
SELECT     [Employee ID] AS employee_id, branch,[Name FirstLast] AS empname
FROM         app_employees
 </cfquery>
<cfquery name="get_all_payroll" datasource="jrgm" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
SELECT     *
FROM         app_employee_payroll_clock
WHERE     (ds_date > '12/31/2015')  AND  (ds_date < '#todaydate#') AND time_worked IS NOT NULL <!---AND ds_date <> '#todaydate#'
GROUP BY Employee_ID, ds_id,ds_date
HAVING   COUNT(ds_ID) =1
ORDER BY Employee_ID,ds_date ASC  --->
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
          <td class="header">Payroll Manager</td>
        </tr>
      </table>
      <cfquery name="get_one_dsids"  dbtype="query">
SELECT     Employee_ID, ds_date, ds_ID,COUNT(ds_ID) AS totalids,SUM(time_worked) AS sumtimeworked
FROM        get_all_payroll
<!---WHERE     (ds_date > '#APPLICATION.blockdate#')  AND  (ds_date < '#APPLICATION.pay_period_week2_date#')  AND ds_date <> '#todaydate#'--->
GROUP BY Employee_ID, ds_id,ds_date
HAVING   COUNT(ds_ID) =1
ORDER BY Employee_ID,ds_date ASC  
</cfquery>

<!---<cfdump var="#get_one_dsids#">--->
<CFSET all_payroll_records = #get_all_payroll.recordcount#>
<CFSET all_payroll_records_err = #get_one_dsids.recordcount#>
<CFSET all_payroll_records_err_rate = #all_payroll_records#/#all_payroll_records_err#>
<br />
<strong class="arialfontbold">Employees with only 1 time in per day, per daily sheet- <cfoutput>#get_one_dsids.recordcount#</cfoutput> records<br />
<cfoutput>#NumberFormat(all_payroll_records_err_rate,"999.9")#</cfoutput>% of all <cfoutput>#all_payroll_records# payroll records</cfoutput></strong><br />
<br />
<span style="font-family: Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-style: italic;">Pay Period 01/01/2016-<cfoutput>#DateFormat("#yesterday#", "mm/dd/yyyy")#</cfoutput></span><br />
  <br />

<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td><strong>Employee ID</strong></td>
          <td><strong>   Name</strong></td>
          <td><strong>Branch</strong></td>
          <td align="center"><strong>Date</strong></td>
          <td align="center"><strong>DS <br />
          Time Ins</strong></td>
          <td><strong>DS <br />
          Minutes </strong></td>
          <td align="center"><strong>DSID</strong></td>
        </tr>
        <cfoutput query="get_one_dsids">
          <tr>
            <td>#Employee_ID#</td>
 <cfquery name="get_many_hours_name" dbtype="query" >
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td align="center">#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <td align="center">#totalids#</td>
            <td>#sumtimeworked#</td>
            <!---<cfquery name="get_many_hours_DSD"  dbtype="query">
SELECT    ds_id, Time_In, Time_Out
FROM         get_all_payroll
WHERE    ds_date ='#DateFormat(ds_date, 'yyyy-mm-dd')#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
</cfquery>--->
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
