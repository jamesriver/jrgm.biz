<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
html {
	position: relative;
	min-height: 100%;
}
body {
	margin: 0 0 100px; /* bottom = footer height */
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 100px;
	width: 100%;
}
li. {
	font:  20px Arial, Helvetica, sans-serif;
}
.bigger {
font:13px "Arial",san-serif;
}
</style>-->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="header"> Administrative </div>
   <cfif SESSION.userid EQ 1001  OR SESSION.userid EQ 9991>  <p><a href="maria.cfm" class="bluebutton">Maria Dashboard</a>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <a href="scheduler_select_m.cfm" class="bluebutton">Maria Access</a></p></cfif>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="subheader">Reports</div>
<div class="dashboardHeader">Payroll Reports</div>
      <ul class="dashboard">
        <li><a href="payroll_report_daily.cfm">Daily Employee Payroll Report</a></li>
        <li><a href="payroll/select_branch.cfm"> Employee Payroll Detail by Date Report</a></li>
        <li><a href="payroll/select_branch_all_employees.cfm">Branch Payroll Detail by Dates Report</a></li>
      </ul>
      <div class="dashboardHeader">Jobs &amp; Materials Reports</div>
         <ul class="dashboard">
        <li><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
      </ul>
     <div class="dashboardHeader">Daily Sheet Reports</div>
        <ul class="dashboard">
       <li><a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a></li>
       <li><a href="report_signout_questions_hours.cfm">Daily Sheet Sign Out Question Hours</a></li>
       <li><a href="report_signout_questions_injury.cfm">Daily Sheet Sign Out Question Injury</a></li>
     </ul>
    <div class="dashboardHeader">Misc</div>
        <ul class="dashboard">
       <li><a href="view_ALL_notes_pic.cfm">Notes List</a>     </li>
       <li><a href="branch_listing.cfm">Branch Personnel Listing</a></li>
     </ul>
    
    </td>
    <td valign="top"><div class="subheader">Payroll</div>
    <div class="dashboardHeader">Ben</div>
           <ul class="dashboard">
          <li><a href="https://www.jrgm.biz/ssl/admin/payroll/payrollbetty.cfm">Ben Payroll Screen</a></li>
          <li><a href="payroll/payroll_unapproved.cfm">Unapproved Payroll</a></li>
          <li><a href="dailysheet_add.cfm">Add a Daily Sheet</a></li>
          <li><a href="payroll/pto_add.cfm">Add PTO Time</a></li>
          <li><a href="payroll/pto_payroll_view_employee_detail.cfm">View PTO Report</a></li>
          <li><a href="payroll_report_employees_multiple_ID_betty.cfm">Employees Working in 2 Branches</a>          </li>
        </ul>
      </td>
        <td valign="top"><div class="subheader">Forms</div>
       <div class="dashboardHeader">Incident</div>
            <ul class="dashboard">
            <li><a href="http://jrgm.biz/forms/irlist.cfm">Incident Report List</a></li>
            <li><a href="../../forms/IncidentReport.php" target="_blank">Start  a new Incident Report</a></li>
          </ul>
         <div class="dashboardHeader">Injury</div>
            <ul class="dashboard">
            <li><a href="http://jrgm.biz/forms/injurylist.php">Injury Report List</a>&nbsp; &nbsp;&nbsp; </li>
            <li><a href="../../forms/injury.php" target="_blank"> Start  a new Injury Report</a></li>
          </ul>
         </td>
      </tr>
</table>
  
    
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
