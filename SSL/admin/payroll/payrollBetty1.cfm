<CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_week1  =  pay_period_week-1>
<CFSET pay_period_end_week  =  pay_period_number>
<cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week#
 </cfquery>
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
<cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
<CFSET pay_period_end_week_plusone =  dateadd("d",1,app_payroll_periods_L.pay_period_end)>
<CFSET pay_period_end_week_plusoneC =  dateadd("d",1,app_payroll_periods_C.pay_period_end)>
<cfquery name="app_payroll_periods_Week1" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_week1#
 </cfquery>
<!--- <cfdump var="#app_payroll_periods_Week1#">--->
<CFSET pay_period_end_week1_plusone =  dateadd("d",1,app_payroll_periods_Week1.pay_period_end)>
<CFSET pay_period_number_for_csv = pay_period_number -1>
<CFSET adp_approval_date_next  =  dateadd("d",2,APPLICATION.pay_period_week2_date)>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet" />
<link href="../assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<!---<link rel="stylesheet" type="text/css" href="../assets/global/plugins/select2/select2.css"/>--->
<!---<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>--->
<!---<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>--->
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="../assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<!---<link href="../assets/global/css/plugins.css" rel="stylesheet" type="text/css" />--->
<link href="../assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="../assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="../assets/admin/layout3/css/custom-pat.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style>
.bigfont {
	padding: 5px;
	background-color: #ffffff;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold .95em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .6em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: bold .9em Arial, Helvetica, sans-serif;
}
.dashboardHeader {
	margin-top: 10px;
	color: #333;
	font: bold 16px Arial, Helvetica, sans-serif;
}
ul.dashboard {
	margin-top: 4px;
	margin-left: -40px;
	margin-right: 2px;
	list-style: none; /* this removes the list marker */
}
ul.dashboard li {
	color: #006fa7;
	font: normal 14px Arial, Helvetica, sans-serif;
	padding: 4px 5px 4px 1px;
}
a {
	color: #006fa7;
	text-decoration: none;
}
a:hover {
	color: #000;
	text-decoration: none;
}
.greenText {
	color: green;
}
.table {
	width: 90%;
	padding-bottom:
}
.panel .panel-body {
	font-size: 14px;
	padding: 5px;
	padding-left: 15px;
	background-color: #DBEBF8
}
.TOPROW {
	font-size: 0.90em;
	font-weight: 600;
}
th {
	text-align: center;
	vertical-align: bottom;
	padding: 10px 5px 4px 5px;
	margin-right: 50px;
}
.th1 {
	text-align: left;
	vertical-align: bottom;
	padding: 10px 5px 4px 5px;
	margin-right: 50px;
}
.td  { padding-bottom: 20px;}

</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="../header-include-betty.cfm">
  <cfinclude template="../header-menu-betty.cfm">
</div>
<cfoutput>
  <div class="panel panel-info"> 
    <!---<div class="panel-heading">
	</div>--->
    <div class="panel-body"> <strong>Today's Date : #DateFormat("#theDate#", "mmmm dd,yyyy")# &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next  Payroll Approval Date for ADP : Monday #DateFormat("#adp_approval_date_next#",  "mmmm dd,yyyy")# </strong></div>
    <div class="panel-body"> Current Payroll Period ##<strong>#pay_period_number# </strong>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Current Payroll Period Dates <strong>#DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")# - #DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")# </strong>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <br />
      Current Payroll Week&nbsp; ##<strong>#pay_period_week#</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Current Payroll Week Dates&nbsp; <strong>#DateFormat("#app_payroll_periods_W.pay_period_start#", "mm/dd/yyyy")# - #DateFormat("#app_payroll_periods_W.pay_period_end#", "mm/dd/yyyy")#</strong></div>
  </div>
</cfoutput>
<table class="table table-striped table-bordered" >
  <tr class="TOPROW">
    <th  class="th1" align="left"><br />
      <br />
      <br />
      <br />
     &nbsp;&nbsp;&nbsp; Branch</th>
    <th><br />
      Approved?<br />
      <cfoutput>Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center">DOWNLOAD <br />
      Approved CSV<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center" nowrap="nowrap">DOWNLOAD <br />
      Unnapproved CSV<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center">VIEW <br />
      Approved CSV<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center"  nowrap="nowrap">VIEW<br />
      Unnapproved CSV<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center"><br />
      <br />
      VIEW<br />
      by<br />
      Employee</th>
    <th align="center">VIEW <br />
      Current<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center">VIEW <br />
      Prior<br />
      <cfoutput> Pay Period<br />
        #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
        #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
    <th align="center"><br />
      <br />
      VIEW <br />
      Employee <br />
      Dates</th>
    <th align="center"><br />
      Pay Week<br />
      Approved<br />
      <cfoutput>#DateFormat("#app_payroll_periods_Week1.pay_period_start#", "mm/dd/yyyy")#- <br />
        #DateFormat("#app_payroll_periods_Week1.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
  </tr>
  <tbody style="font-size: 24px">
    <tr>
      <td  align="left" height="50">Charlottesville </td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Charlottesville'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm" >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a>
        </cfif></td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20" alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20" alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv_view.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv_view.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><a href="payroll_view_employee.cfm?branch=Charlottesville">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Charlottesville">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Charlottesville">View</a></td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Charlottesville'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0  AND get_employees_with_time.recordcount GT 0 >
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Charlottesville&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
        </cfif></td>
    </tr>
    <tr>
       <td  align="left" height="50">Chesterfield</td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Chesterfield'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm" >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
        </cfif></td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv_view.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv_view.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><a href="payroll_view_employee.cfm?branch=Chesterfield">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Chesterfield">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Chesterfield">View</a></td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Chesterfield'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0   AND get_employees_with_time.recordcount GT 0 >
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Chesterfield&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
        </cfif></td>
    </tr>
    <tr>
       <td  align="left" height="50">Newport News</td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Newport News'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
        </cfif></td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv_view.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv_view.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><a href="payroll_view_employee.cfm?branch=Newport News">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Newport News">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Newport News">View</a></td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Newport News'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0  AND get_employees_with_time.recordcount GT 0 >
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Newport News&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
        </cfif></td>
    </tr>
    <tr>
       <td  align="left" height="50">Portsmouth</td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Portsmouth'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <!---   <cfdump var="#get_all_employee_time_for_period#"> --->
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
        </cfif></td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv_view.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv_view.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><a href="payroll_view_employee.cfm?branch=Portsmouth">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Portsmouth">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Portsmouth">View</a></td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Portsmouth'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
      <!--- <cfdump var="#get_employees_with_time#"> --->
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0  AND get_employees_with_time.recordcount GT 0 >
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Portsmouth&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
        </cfif></td>
    </tr>
    <tr>
       <td  align="left" height="50">Richmond</td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Richmond'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
        </cfif></td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
        </cfif>
        &nbsp;</td>
      <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
          <a href="REG_payroll_csv_view.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
          <a href="REG_payroll_csv_view.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
        </cfif>
        &nbsp;</td>
      <td align="center" ><a href="payroll_view_employee.cfm?branch=Richmond">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Richmond">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Richmond">View</a></td>
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Richmond'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="0">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0   AND get_employees_with_time.recordcount GT 0 >
          <span class="greenText">Approved</span>
          <cfelse>
          <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Richmond&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
        </cfif></td>
    </tr>
    <tr>
      <td colspan="2" nowrap="nowrap" >ALL FWW Employees (Approved & Unapproved)</td>
      <td align="center"><a href="FWW_payroll_csv.cfm?pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>&nbsp;</td>
      <td align="center" >&nbsp;</td>
      <td align="center" >&nbsp;</td>
      <td align="center" >&nbsp;</td>
      <td align="center" >&nbsp;</td>
      <td align="center"><a href="payroll_view_employee_detail_2week_FWW.cfm">View</a></td>
      <td align="center"><a href="payroll_view_employee_detail_2week_FWW.cfm?pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
      <td colspan="2" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" nowrap="nowrap"  height="35">PTO Hours</td>
      <td colspan="5" align="center">&nbsp;</td>
      <td align="center"><a href="pto_payroll_view_employee_detail.cfm">View</a></td>
      <td colspan="3" align="center">&nbsp;</td>
    </tr>
    <!--- <<tr class="dailysheet_header">
        <td colspan="11" nowrap="nowrap" ><strong>Payroll Tasks & Reports</strong></td>
      </tr>
tr>
        <td colspan="2" nowrap="nowrap" ><p><a href="pto_add.cfm">Add PTO Time</a></p>
        <p><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></p>
        <p><a href="select_branch.cfm">View Employee Payroll by Date Report</a></p>
        <p><a href="select_branch_all_employees.cfm">View Branch Employee Payroll by Dates</a></p>
        <p><a href="../payroll_report_employees_multiple_ID_betty.cfm">Employees Working in 2 Branches</a></p>
        <p><a href="../payroll_manager.cfm">Employees on more than 1 Daily Sheet</a></p></td>
        <td align="center">&nbsp;</td>
        <td align="center" >&nbsp;</td>
        <td align="center" >&nbsp;</td>
        <td align="center" >&nbsp;</td>
        <td align="center" ></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>--->
  </tbody>
</table>
<br />
<br />
<br />
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="../footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --> 
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]--> 
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="../assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="../assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="../assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="../assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="../assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
<!-- END BODY -->
</html>
