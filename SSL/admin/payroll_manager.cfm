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
<cfquery name="get_all_payroll" datasource="jrgm"  >
SELECT     *
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')  AND  (ds_date < '#APPLICATION.pay_period_week2_date#')  <!---AND ds_date <> '#todaydate#'
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
.redarial {
	padding-top: 20px;
	font: normal Arial, Helvetica, sans-serif;
	color: red;
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
      <strong class="lgaddress"> Employees on Multiple Daily Sheets</strong><br />
      <cfquery name="get_many_hours" datasource="jrgm">
 SELECT employee_ID,ds_date,COUNT(DISTINCT ds_id) AS Count ,SUM(time_worked) AS sumtimeworked
 FROM  app_employee_payroll_clock
 WHERE     (ds_date > '#APPLICATION.blockdate#')    AND  (ds_date < '#APPLICATION.pay_period_week2_date#')
 GROUP BY Employee_ID, ds_date
 HAVING   COUNT(DISTINCT ds_id) > 1
 ORDER by employee_ID,ds_date
      </cfquery>
      <!--- <cfabort> --->
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
        <tr height="40">
          <td>Employee ID</td>
          <td>Date</td>
          <td>Name</td>
          <td>Branch</td>
          <td>Daily Minutes</td>
          <td>DS1</td>
          <td>DS2</td>
        </tr>
        <cfoutput query="get_many_hours">
          <tr>
            <td>#Employee_ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <cfquery name="get_many_hours_name"  dbtype="query">
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td>#sumtimeworked#</td>
            <cfquery name="get_many_hours_DSD"  dbtype="query">
SELECT    ds_id, Time_In, Time_Out
FROM         get_all_payroll
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
</cfquery>
            <td><a href="../admin/daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#"  target="_blank">#get_many_hours_DSD.ds_id#</a><br />
              #TimeFormat(get_many_hours_DSD.time_in, "HH:mm:ss")# - #TimeFormat(get_many_hours_DSD.time_out, "HH:mm:ss")#
              <CFSET thisone = #get_many_hours_DSD.ds_id#>
              <CFSET thisoneamtime = #get_many_hours_DSD.Time_In#>
              <CFSET thisonepmtime = #get_many_hours_DSD.Time_Out#></td>
   <cfquery name="get_many_hours_DSD2" datasource="jrgm">
SELECT     ds_id, Time_In, Time_Out
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#  AND ds_ID <> #thisone#
</cfquery>
            <CFSET nextoneamtime = #get_many_hours_DSD2.Time_In#>
            <CFSET nextonepmtime = #get_many_hours_DSD2.Time_Out#>
            <td><a href="../admin/daily_sheet.cfm?dsid=#get_many_hours_DSD2.ds_id#"  target="_blank">#get_many_hours_DSD2.ds_id# <br />
 

              <cfif  (nextoneamtime LT thisonepmtime)  OR   (nextonepmtime LT thisonepmtime) >
                <span class="redarial">#TimeFormat(get_many_hours_DSD2.time_in, "HH:mm:ss")# - #TimeFormat(get_many_hours_DSD2.time_out, "HH:mm:ss")#</span>
                <cfelse>
                #TimeFormat(get_many_hours_DSD2.time_in, "HH:mm:ss")# - #TimeFormat(get_many_hours_DSD2.time_out, "HH:mm:ss")#
              </cfif></a></td>
              
          </tr>
        </cfoutput>
      </table>
      <br>
      <strong class="lgaddress">Employees with more than 2 Time Ins per Day </strong>
      <cfquery name="get_many_dsids" datasource="jrgm">
SELECT     Employee_ID, ds_date, COUNT(ds_ID) AS totalids
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')  AND  (ds_date < '#APPLICATION.pay_period_week2_date#')
GROUP BY Employee_ID, ds_id,ds_date
HAVING   COUNT(ds_ID) > 2
ORDER BY totalids DESC
</cfquery>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
        <tr height="40">
          <td>Employee ID</td>
          <td>Date</td>
          <td>Name</td>
          <td>Branch</td>
          <td>Daily Time Ins</td>
          <td>Daily Sheet</td>
        </tr>
        <cfoutput query="get_many_dsids">
          <tr>
            <td>#Employee_ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <cfquery name="get_many_hours_name"  dbtype="query">
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td>#totalids#</td>
            <!---<cfquery name="get_many_hours_DSD" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>--->
            <cfquery name="get_many_hours_DSD"  dbtype="query">
SELECT    ds_id, Time_In, Time_Out
FROM         get_all_payroll
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
</cfquery>
            <td><a href="../admin/daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#"  target="_blank">#get_many_hours_DSD.ds_id#</a></td>
          </tr>
        </cfoutput>
      </table>
      <br>
      <cfquery name="get_one_dsids" datasource="jrgm"  >
SELECT     Employee_ID, ds_date,ds_id, COUNT(ds_ID) AS totalids,SUM(time_worked) AS sumtimeworked
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')  AND  (ds_date < '#APPLICATION.pay_period_week2_date#')  AND ds_date <> '#todaydate#'
GROUP BY Employee_ID, ds_id,ds_date
HAVING   COUNT(ds_ID) =1
ORDER BY Employee_ID,ds_date ASC  
</cfquery>
      <strong class="lgaddress">Employees with only 1 time in per Day - <cfoutput>#get_one_dsids.recordcount# </cfoutput> Records</strong>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
        <tr height="40">
          <td>Employee ID</td>
          <td>Date</td>
          <td>Name</td>
          <td>Branch</td>
          <td>Daily Sheet Time Ins</td>
           <td>Daily Sheet Minutes </td>
          <td>Daily Sheet</td>
        </tr>
        <cfoutput query="get_one_dsids">
          <tr>
            <td>#Employee_ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <cfquery name="get_many_hours_name" dbtype="query">
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td>#totalids#</td>
              <td>#sumtimeworked#</td>
 <!---<cfquery name="get_many_hours_DSD"  dbtype="query">
SELECT    ds_id, Time_In, Time_Out
FROM         get_all_payroll
WHERE    ds_date ='#DateFormat(ds_date, 'yyyy-mm-dd')#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
</cfquery>--->
            <td><a href="../admin/daily_sheet.cfm?dsid=#ds_id#"  target="_blank">#ds_id#</a></td>
            
          </tr>
        </cfoutput>
      </table>
      <br>
      <br>
      <strong class="lgaddress">Employees with more than 13 Hours Per Day on ALL Daily Sheets</strong>
      <cfquery name="get_many_hours" datasource="jrgm">
SELECT     Employee_ID, ds_date, SUM(time_worked) AS sumtimeworked
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')   AND  (ds_date < '#APPLICATION.pay_period_week2_date#')
GROUP BY Employee_ID, ds_date
HAVING   SUM(time_worked)> 1440
ORDER BY sumtimeworked DESC
</cfquery>
      
      <!---  <table width="100%" border="1" cellspacing="0" cellpadding="0"> --->
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
        <tr height="40">
          <td>Employee ID</td>
          <td>Date</td>
          <td>Name</td>
          <td>Branch</td>
          <td>Daily Minutes</td>
          <td>DS1</td>
          <td>DS2</td>
        </tr>
        <cfoutput query="get_many_hours">
          <tr>
            <td>#Employee_ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <cfquery name="get_many_hours_name" dbtype="query">
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td>#sumtimeworked#</td>

            <cfquery name="get_many_hours_DSD"  dbtype="query">
SELECT    ds_id, Time_In, Time_Out
FROM         get_all_payroll
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
</cfquery>
            <cfloop query="get_many_hours_DSD" >
              <td><a href="../admin/daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#"  target="_blank">#get_many_hours_DSD.ds_id#</a>&nbsp;</td>
            </cfloop>
          </tr>
        </cfoutput>
      </table>
      <br>
      <strong class="lgaddress">Employees with Negative Time Segments</strong>
      <cfquery name="get_negative_hours" datasource="jrgm">
SELECT     Employee_ID, ds_date,  time_worked AS sumtimeworked
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')   AND  (ds_date < '#APPLICATION.pay_period_week2_date#')
AND time_worked < 1
ORDER BY time_worked  ASC
</cfquery>
      
      <!---  <table width="100%" border="1" cellspacing="0" cellpadding="0"> --->
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
        <tr height="40">
          <td>Employee ID</td>
          <td>Date</td>
          <td>Name</td>
          <td>Branch</td>
          <td>Daily Minutes</td>
          <td>DS1</td>
          <!---  <td>DS2</td> ---> 
        </tr>
        <cfoutput query="get_negative_hours">
          <tr>
            <td>#Employee_ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <cfquery name="get_many_hours_name" dbtype="query">
SELECT    employee_id, branch,  empname
FROM         get_all_employees
WHERE   employee_id = #Employee_ID#
 </cfquery>
            <td>#get_many_hours_name.empname#</td>
            <td>#get_many_hours_name.branch#</td>
            <td>#sumtimeworked#</td>
            <cfquery name="get_many_hours_DSD" datasource="jrgm" >
SELECT     ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>
            <!---   <cfloop query="get_many_hours_DSD" > --->
            <td><a href="../admin/daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#"  target="_blank">#get_many_hours_DSD.ds_id#</a>&nbsp;</td>
            <!--- </cfloop> ---> 
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
