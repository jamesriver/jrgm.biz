   <cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  *
 FROM app_pay_periods WHERE pay_period_number = #url.pay_period_number#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET MIDPLUS1_DATE =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 


<cfparam name="message" default="">

 <cfif IsDefined("form.ds_id")><CFSET Session.mydsidlist = #form.ds_id#></cfif>
   
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
<cfset today_7PM = createDatetime(y,m,d,19,0,0)>
 <cfset timenow = Now()>

 <cfset somedate = todayDate>
 <cfset yesterday = dateadd("d",-1,somedate)>
 <cfset tomorrow = dateadd("d",1,somedate)>

 <cfif IsDefined("form.empid")>
  <CFSET Employee_ID= form.empid>
  <cfelseif IsDefined("url.empid")>
  <CFSET Employee_ID= url.empid>
</cfif>

 

 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name,branch    FROM 
app_employees WHERE [Employee ID] = #empid#
 </cfquery>
 

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
<body>

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
        <h1>Payroll Detail, starting <cfoutput>#DateFormat("#pay_period_start#", "mm/dd/yyyy")#</cfoutput></h1>  </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="payroll_main.cfm">Payroll</a><i class="fa fa-circle"></i> </li>
        <li class="active">Payroll Detail</li>
      </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
   <div class="page-content">
		<div class="container-fluid">	
			<!-- BEGIN PAGE CONTENT INNER -->				
					<div class="row">
					  <div class="col-md-8">
                       <h2><cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name#, #get_employees_name.branch#  &nbsp;&nbsp;   Employee ID : #empid# </cfoutput></h2></div>
                       <div class="col-md-4">
     <a href="payroll_view_employee_detail_2week.cfm" class="btn btn-primary">Back to List</a>
     <div class="spacer40"></div></div>
     <div class="row">
					  <div class="col-md-12">
        <table class="table large" >
 <thead> 
        <tr>
          <th>Pay Period Totals</th>
          <th>Hours</th>
         
        </tr>
        </thead>
        <tbody>
         <cfif   timenow GT today_7PM>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000'   AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         
         <cfelse>
        <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' AND    ds_date < '#todaydate_DS#' AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         </cfif>
        <cfoutput query="get_employee_time_sum">
          <tr>
          <td>Regular</td>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td>#hourssum#:#NumberFormat(minutessum,"09")#</td>
           </tr>
        </cfoutput>
        </tbody>
      </table>
       
		<cfif   timenow GT today_7PM>
       <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000'  AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
      
      <cfelse>
 <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000'  AND    ds_date < '#todaydate_DS#' AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
        </cfif>
      <table class="table table-striped table-hover" >
    <thead> 
         <tr>
         <th>Day</th>
          <th>Date</th> 
          <th>DSID</th>
          <th>Time<br />Worked</th>
          <th>Time<br />Worked  </th>
          </tr>
        </thead>
        <tbody>
        <cfoutput query="get_employee_time_by_day">
          <tr>
           <td>#DateFormat(ds_date, "dddd")#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td> 
            <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a> </td>
              <td>#sumdailytime#</td>
            <cfset hours = int(sumdailytime\60)>
            <cfset minutes = int(sumdailytime mod 60)>
            <td>#hours#:#NumberFormat(minutes,"09")#</td>
      <cfquery name="is_already_approved" datasource="jrgm">
      SELECT  payroll_approved
       FROM app_employee_payroll_clock
     WHERE Employee_ID =#empid#  AND ds_id = #ds_id#
         </cfquery>
         </tr>  
		  </cfoutput>
        
        </tbody>
      </table>
        
      
      <table class="table table-striped table-hover" >
  <tr>
    <td> <cfoutput>#message#</cfoutput> </td>
  </tr>
</table>			
						
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