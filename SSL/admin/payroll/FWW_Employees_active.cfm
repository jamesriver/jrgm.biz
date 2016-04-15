<!---<cfoutput>#APPLICATION.pay_period_number_current_calendar#</cfoutput> --->

<!---<cfset todayDate1 = Now()>
 <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
  <CFPARAM name="random" default="0">
<cfquery name="get_payroll_block_info" datasource="jrgm" maxrows="1">
SELECT * FROM payroll_block 
ORDER by ID DESC
</cfquery>
<cfoutput query="get_payroll_block_info">
  <CFSET block_date ='#block_date#'>
  <CFSET pay_period_week1 =#pay_period_week1#>
  <CFSET pay_period_week2 =#pay_period_week2#>
  <CFSET pay_period_number =#pay_period_number#>
  <CFSET week1_date_available ='#week1_date_available#'>
  <CFSET week2_date_available ='#week2_date_available#'>
  <CFSET pay_period_week1_date ='#pay_period_week1_date#'>
  <CFSET pay_period_week2_date ='#pay_period_week2_date#'>
  <!--- Set prior variables--->
  <CFSET block_date_prior = dateadd("d",-14,block_date)>
  <CFSET pay_period_week1_prior =#pay_period_week1#-2>
  <CFSET pay_period_week2_prior =#pay_period_week2#-2>
  <CFSET pay_period_number_prior =#pay_period_number#-1>
  <CFSET week1_date_available_prior=  dateadd("d",-14,week1_date_available)>
  <CFSET week2_date_available_prior =  dateadd("d",-14,week2_date_available)>
  <CFSET pay_period_week1_date_prior =  dateadd("d",-14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_prior  = dateadd("d",-14,pay_period_week2_date)>
  
  <!--- Set next variables--->
  <CFSET block_date_next = dateadd("d",14,block_date)>
  <CFSET pay_period_week1_next =#pay_period_week1#+2>
  <CFSET pay_period_week2_next =#pay_period_week2#+2>
  <CFSET pay_period_number_next =#pay_period_number#+1>
  <CFSET week1_date_available_next=  dateadd("d",14,week1_date_available)>
  <CFSET week2_date_available_next =  dateadd("d",14,week2_date_available)>
  <CFSET pay_period_week1_date_next =  dateadd("d",14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_next  = dateadd("d",14,pay_period_week2_date)>
</cfoutput>
 
<cfoutput query="get_payroll_block_info">
  <CFSET block_date ='#block_date#'>
  <CFSET pay_period_week1 =#pay_period_week1#>
  <CFSET pay_period_week2 =#pay_period_week2#>
  <CFSET pay_period_number =#pay_period_number#>
  <CFSET week1_date_available ='#week1_date_available#'>
  <CFSET week2_date_available ='#week2_date_available#'>
  <CFSET pay_period_week1_date ='#pay_period_week1_date#'>
  <CFSET pay_period_week2_date ='#pay_period_week2_date#'>
  <!--- Set prior variables--->
  <CFSET block_date_prior = dateadd("d",-14,block_date)>
  <CFSET pay_period_week1_prior =#pay_period_week1#-2>
  <CFSET pay_period_week2_prior =#pay_period_week2#-2>
  <CFSET pay_period_number_prior =#pay_period_number#-1>
  <CFSET week1_date_available_prior=  dateadd("d",-14,week1_date_available)>
  <CFSET week2_date_available_prior =  dateadd("d",-14,week2_date_available)>
  <CFSET pay_period_week1_date_prior =  dateadd("d",-14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_prior  = dateadd("d",-14,pay_period_week2_date)>
  
  <!--- Set next variables--->
  <CFSET block_date_next = dateadd("d",14,block_date)>
  <CFSET pay_period_week1_next =#pay_period_week1#+2>
  <CFSET pay_period_week2_next =#pay_period_week2#+2>
  <CFSET pay_period_number_next =#pay_period_number#+1>
  <CFSET week1_date_available_next=  dateadd("d",14,week1_date_available)>
  <CFSET week2_date_available_next =  dateadd("d",14,week2_date_available)>
  <CFSET pay_period_week1_date_next =  dateadd("d",14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_next  = dateadd("d",14,pay_period_week2_date)>
</cfoutput>
<CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_week1  =  pay_period_week-1>
<CFSET pay_period_end_week  =  pay_period_number>
<cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #APPLICATION.pay_period_number_current_calendar#
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
<CFSET next_adp_block_date  =  dateadd("d",14,APPLICATION.blockdate)>
<CFSET prior_adp_block_date  =  dateadd("d",-14,APPLICATION.blockdate)>
<cfset somedate = todayDate>
<cfset today = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
--->
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
<link href="../assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
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
	color: #000;
	font: bold 18px Arial, Helvetica, sans-serif;
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
 
.panel .panel-body {
	font-size: 14px;
	padding: 5px;
	padding-left: 15px;
	background-color: #DBEBF8
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
 
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:12px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
 
<script   src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
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
<div class="panel-body">
<cfquery name="get_FWW_employees" datasource="jrgm" >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE    FWW =1 AND active_record =1
 ORDER by  Last_name ASC,first_name ASC
  </cfquery>
<table  border="0" cellpadding="2" cellspacing="0"  >
  <cfoutput>
    <tr class="job_data">
      <td><H2 style="color: ##333333; font-weight: 600;" > FWW Employees Active - #get_FWW_employees.recordcount# Records </H2></td>
    </tr>
  </cfoutput>
</table>
<br />
 
<table width="100%" border="0">
  <tbody>
    <tr>
      <td width="50">&nbsp;</td>
      <td>
      <table    class="gridtable sortable" >
  <tbody>
    <tr>
      <td><strong>First Name</strong></td>
      <td><strong>Last Name</strong></td>
      <td><strong>File #</strong></td>
      <td><strong>Branch</strong></td>
    </tr>
    <cfoutput query="get_FWW_employees">
      <tr>
        <td height="25" nowrap="nowrap">#first_name#</td>
        <td height="25" nowrap="nowrap">#last_name#</td>
        <td height="25">#Employee_ID#</td>
        <td height="25">#branch#</td>
      </tr>
    </cfoutput>
  </tbody>
</table>
</td>
</tr>
</tbody>
</table>
<br />
<br />
<br />

<!-- end outer div -->
<cfinclude template="../footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
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
