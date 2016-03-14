
<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>

<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >

<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >

 
<CFSET PAY_PERIOD_NUMBER_PRIOR  =  pay_period_number-1>
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
 
  <cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #PAY_PERIOD_NUMBER_PRIOR#
 </cfquery>
 
 

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>

<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<div class="page-container-fluid">
  <div class="page-head">
    <div class="container-fluid">
      <div class="page-title">
        <h1>Payroll</h1>
      </div>
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i></li>
          <li class="active">Payroll</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="page-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="table-responsive">
            <cfloop list="#branchlist2#" index="idx">
              <h4>Payroll for <cfoutput>#idx#</cfoutput> Branch</h4>
              <table class="table large">
                <tbody>
                  <cfif todaydate GT APPLICATION.week1_date_available>
                    <tr>
                      <td><a href="payroll_view_employee_detail_1week.cfm?branch=<cfoutput>#idx#</cfoutput>&pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>">Approve Weekly Payroll Week 1</a></td>
                      <td>Week Ending <cfoutput>#pay_period_week1_date#</cfoutput></td>
                      <td>&nbsp;</td>
                    </tr>
                  </cfif>
                  <cfif todaydate GT APPLICATION.week2_date_available>
                    <tr>
                      <td><a href="payroll_view_employee_detail_1week.cfm?branch=<cfoutput>#idx#</cfoutput>&pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>">Approve Weekly Payroll Week 2</a></td>
                      <td>Week Ending <cfoutput>#pay_period_week2_date#</cfoutput></td>
                      <td>&nbsp;</td>
                    </tr>
                  </cfif>
                  <tr>
                    <td><a href="payroll_view_employee_detail_2week.cfm?branch=<cfoutput>#idx#</cfoutput>&pay_period_number=<cfoutput>#pay_period_number#</cfoutput>">View Current Payroll Period</a></td>
                    <td>Pay Period <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_end, "mm/dd/yyyy")#</cfoutput></td>
                    <td>2 Week Period</td>
                  </tr>
                  <tr>
                    <td><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#PAY_PERIOD_NUMBER_PRIOR#&branch=#idx#</cfoutput>">View Prior Payroll Period</a></td>
                    <td>Pay Period <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_end, "mm/dd/yyyy")#</cfoutput></td>
                    <td>2 Week Period</td>
                  </tr>
                  <tr>
                    <td><a href="payroll_view_branch_detail_all_select_dates.cfm?branch=<cfoutput>#idx#</cfoutput>">Branch Payroll Detail by Date</a></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </cfloop>
          </div>
          <div class="table-responsive">
            <h4>Other Payroll</h4>
            <table class="table large">
              <tbody>
                <tr>
                  <td><a href="pto_add.cfm">Add PTO Time</a></td>
                </tr>
                <tr>
                  <td><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<cfinclude template="footer-include.cfm">
<div class="scroll-to-top"> <i class="icon-arrow-up"></i></div>
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {    
  
    // initiate layout and plugins
    Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
    // button state demo
   
});
</script>
</body>
</html>