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
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
</head>
<body id="fixed-footer">

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 


<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Payroll</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">Payroll</li>
      </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
   <div class="page-content">
		<div class="container-fluid">
				
					<div class="row">
					  <div class="col-md-12">
                        <div class="table-responsive">
						 <table class="table large" >
                         <thead>
								<tr>
									<th>
										 Approve / View
									</th>
									<th>
										 Pay Period
									</th>
								</tr>
								</thead>
  <tbody>
 <cfif todaydate GT APPLICATION.week1_date_available>       
            <tr>
    <td nowrap="nowrap"><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>">Approve Weekly Payroll Week 1</a></td>
    <td nowrap="nowrap">Week Ending <cfoutput>#pay_period_week1_date# </cfoutput></td>
  </tr>
  </cfif>
<cfif todaydate GT APPLICATION.week2_date_available>
  <tr>
          <td nowrap="nowrap"><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>">Approve Weekly Payroll Week 2</a></td>
          <td nowrap="nowrap">Week Ending <cfoutput>#pay_period_week2_date#</cfoutput></td>
        </tr> 
 </cfif>       
        <tr>
           <td nowrap="nowrap"><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#pay_period_number#</cfoutput>">View Current Payroll Period</a></td>
           <td nowrap="nowrap">Pay Period <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_end, "mm/dd/yyyy")#</cfoutput> &nbsp;&nbsp;&nbsp; &nbsp;  (2 Week Period)</td>
        </tr>
        <tr>
            <td nowrap="nowrap"><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#PAY_PERIOD_NUMBER_PRIOR#</cfoutput>">View Prior Payroll Period</a></td>
            <td nowrap="nowrap">Pay Period <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_end, "mm/dd/yyyy")#</cfoutput> &nbsp;&nbsp; &nbsp;&nbsp;(2 Week Period)</td>
        </tr>
       
        </tbody>
      </table></div>
       <div class="table-responsive">
						 <table class="table large" >
                         <thead>
								<tr>
									<th>
										 Other Payroll
									</th>	
								</tr>
								</thead>
  <tbody>           <tr>
          <td nowrap="nowrap"> <a href="pto_add.cfm">Add PTO Time</a></td>
          </tr>
    <tr>
      <td nowrap="nowrap"><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></td>
    </tr>
        </tbody>
      </table></div>
					
						
		</div>
	  </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
  
    // initiate layout and plugins
    Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
    // button state demo
    $('.demo-loading-btn')
      .click(function () {
        var btn = $(this)
        btn.button('loading')
        setTimeout(function () {
          btn.button('reset')
        }, 3000)
    });
});
</script>
</body>
<!-- END BODY -->
</html>