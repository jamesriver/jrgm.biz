<cfset todayDate = Now()>
<CFSET date2015 = '02/28/2015'>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!---<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />--->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style type="text/css">
.greenText {
	color: green;
}
</style>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">

<!--centre content goes here -->
<div class="centrecontent_inner">
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<div class="header"> Payroll</div>
<cfquery name="get_all_employee_time_for_period_late" datasource="jrgm" >
SELECT ID, Employee_ID,  time_worked, in_out_status,ds_date ,ds_id
 FROM app_employee_payroll_clock
 WHERE app_employee_payroll_clock.Time_IN >  '#date2015#'  AND app_employee_payroll_clock.Time_Out < '#APPLICATION.blockdate#'
 <!---AND in_out_status =2---> AND payroll_approved IS NULL AND Employee_ID < 100000  AND  ID NOT  IN ( 302552, 302571,302574, 302575)
  </cfquery>
<!---<cfdump  var="#get_all_employee_time_for_period_late#">--->
<cfif get_all_employee_time_for_period_late.recordcount GT 0>
 <cfmail from="benchanviolin@gmail.com" to="benchanviolin@gmail.com" subject="Late Payroll" type="html">
    <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
    <span class="arialfont">Late Payroll has just synced to the server. Please review.</span><br />
    <br />
    <table   border="1"  cellpadding="5"  cellspacing="0" class="arialfont">
      <tbody>
        <tr>
        <td>ID</td>
          <td>DS_DATE</td>
          <td>DS_ID</td>
          <td>EMPLOYEE_ID</td>
          <td>TIME_WORKED</td>
        </tr>
        <cfloop query="get_all_employee_time_for_period_late">
          <tr>
           <td>#ID#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
            <td>#DS_ID#</td>
            <td>#EMPLOYEE_ID#</td>
            <td>#TIME_WORKED#</td>
          <tr> 
        </cfloop>
      </tbody>
    </table>
 </cfmail> 
</cfif>
<cfabort>
</body>
</html>
<!---Remember this only runs from 8-8--->