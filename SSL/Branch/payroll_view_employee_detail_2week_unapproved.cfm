 <CFIF IsDefined("url.pay_period_week")>
  <cfset pay_period_week = #url.pay_period_week#>
  <cfelse>
  <cfset pay_period_week= #pay_period_week#>
</CFIF>
 
<cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #url.pay_period_week#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET MIDPLUS1_DATE =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 <CFSET pay_period_endPLUS1_DATE =  dateadd("d",1,pay_period_end)>
  <CFSET pay_period_end_week_plusone =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 
 
 <CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_L  =  pay_period_week-1>
 
 
  <cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_L#
 </cfquery>  
 
 
 <cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
 
  <cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
 
 
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset Now_Time = Now()>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<CFSET begin_date = '#pay_period_start#'>
<CFSET end_date = '#pay_period_end#'>
<cfset end_date_plus1 = dateadd("d",1,end_date)>
<cfparam name="employee_total" default="0">
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<LINK rel="stylesheet" type"text/css" href="css/print.css" media="print">
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="JavaScript"></script>
    <style>

	table.sortable tbody .yellowalt {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #FFFFE8;
	border: 1px solid #c0c0c0;
	border-top: none;
	}
	
	table.sortable tbody .yellowalt:hover {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #cde3fc;
	border: 1px solid #c0c0c0;
	border-top: none;
	}
	
	table.sortable tbody .yellowaltrt {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #FFFFE8;
	border: 1px solid #c0c0c0;
	border-top: none;
	border-right: none;
	}
	
	table.sortable tbody .yellowaltrt:hover {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #cde3fc;
	border: 1px solid #c0c0c0;
	border-top: none;
	border-right: none;
	}
	
	.datesm {
		font: bold 12px Arial, Helvetica, sans-serif;
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
      <table width="100%"  border="0" cellpadding="2" cellspacing="0">
 <cfoutput query="app_payroll_periods"> <tr class="job_data">
    <td><strong>Payroll Period #DateFormat("#begin_date#", "mm/dd/yyyy")#-
     #DateFormat("#pay_period_end#", "mm/dd/yyyy")#</strong></td>
    </tr>
  </cfoutput>
 
</table>

 <cfquery name="get_employees_with_time" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#SESSION.branch#'  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
		ORDER by APP_employees.last_name
 </cfquery>
 
 <cfif get_employees_with_time.recordcount EQ 0>
  <br />
There are no employees with time for ths period. 
 <cfabort>
  </cfif>
   <table   border="0" cellspacing="0" cellpadding="2" class="sortable" >
  <tr>
    <td>Employee ID</td>
    <td>First Name</td>
  <td>Last Name</td>
    <td>DS Date</td>
    <td>DSID</td>
      <td>Approve Payroll</td>
   </tr>
   <CFSET mylist ="">
<cfloop query="get_employees_with_time">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
   <cfquery name="get_employees_with_time_unapproved" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE  
         (app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)  AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
 <cfoutput query="get_employees_with_time_unapproved">
  <tr>
    <td>#Employee_ID#</td>
    <td>#first_name#</td>
    <td>#last_name#</td>
   <td>#DateFormat(ds_date, "mmmm dd, yyyy")#</td>
<td>#ds_id#</td>
<td><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=#url.pay_period_week#">Approve Payroll</a></td>
  </tr>
  </cfoutput>
</table>

    <br />
 
      <p>&nbsp;</p>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
 