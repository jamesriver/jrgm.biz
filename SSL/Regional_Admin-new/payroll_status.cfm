<!---<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2 >
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date>
<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >
--->
  
<!---<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylistsupers ="0">
<cfloop query="get_supers">
  <cfset mylistsupers = ListAppend(mylistsupers,Employee_ID)>
</cfloop>--->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
 
<cfset todaydate = now() />

<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.2
Version: 3.6.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
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
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
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
<style type="text/css">
.smalletextred {
	font-size: 12px;
	color: #F00;
}
 
.smalletextgreen {
	font-size: 12px;
	color: green;
}
</style>

<!-- END THEME STYLES -->
</head>
<body>

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="page-title">
        <h1>Payroll Status</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Payroll Status</li>
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
        <div class="col-md-12"> 
        <div class="portlet light ">
        <div class="portlet-body">
        
          <cfloop list="#branchlist2#" index="idx">
            <h1>Payroll Status for <cfoutput>#idx#</cfoutput> Branch</h1>
               <!---   Check Pay Period 1 --->
              <cfquery name="app_payroll_periods1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>
              <CFSET pay_period_end_week1 =  dateadd("d",7,app_payroll_periods1.pay_period_start)>
              <cfquery name="get_employees_with_time_Week1" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#idx#'  
        AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1#)
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week1">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif SESSION.branch EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week1" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1#)
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
                  <cfif  todaydate GT APPLICATION.week1_date_available  AND get_employees_with_time_unapproved_Week1.recordcount GT 0>
                 <span class="smalletextred">You have unapproved Week 1 payroll.</span>
                  <a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>" class="btn btn-primary">Approve week 1 payroll</a>
                  <cfelse>
                  <span class="smalletextgreen">All Week 1 payroll is approved</span>
                </cfif>
             
              <!---   Check Pay Period 2 --->
              <cfquery name="app_payroll_periods2" datasource="jrgm">
 SELECT   pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>
              <CFSET pay_period_end_week2 =  dateadd("d",7,app_payroll_periods2.pay_period_start)>
              <cfquery name="get_employees_with_time_Week2" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#idx#'  
        AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week2">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif idx EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week2" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
              
                 <cfif  todaydate GT APPLICATION.week2_date_available AND get_employees_with_time_unapproved_Week2.recordcount GT 0>
                 <span class="smalletextred">You have unapproved Week 2 payroll.</span>
                  <a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>" class="btn btn-primary">Approve week 2 payroll</a>
                  <cfelse><br>

                <span class="smalletextgreen">All Week 2 payroll is approved</span>
                </cfif>
             </div></div></div></div>
             
       <div class="row">
        <div class="col-md-12"> 
        <div class="portlet light ">
        <div class="portlet-body">       
        
         <cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch = '#IDX#'
 </cfquery>
<CFSET myemployeelist ="0">
<cfloop query="get_all_employee_info">
  <cfset myemployeelist = ListAppend(myemployeelist,Employee_ID)>
</cfloop>
  
  <cfquery name="get_many_hours" datasource="jrgm">
 SELECT employee_ID,ds_date,COUNT(DISTINCT ds_id) AS Count 
 FROM  app_employee_payroll_clock
 WHERE     (ds_date > '#APPLICATION.blockdate#')     AND Employee_ID IN (#myemployeelist#)
 GROUP BY Employee_ID, ds_date
 HAVING   COUNT(DISTINCT ds_id) > 1
 </cfquery>
 <cfif  get_many_hours.recordcount GT 0>
 
<span class="smalletextred">These employees are on more than 1 daily sheet  in 1 day. Please review to make sure that this is correct.</span>
               <table class="table table-striped table-hover">
               <thead>
                <tr>
                  <th> Employee ID</th>
                  <th> Date</th>
                  <th> Employee Name</th>
                   <th> DSID #1</th>
                  <th> DSID #2</th>
                </tr>
                </thead>
                <cfoutput query="get_many_hours">
                <tbody>
                  <tr>
                    <td>#Employee_ID#</td>
                    <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
    <cfquery name="get_many_hours_name"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID = #Employee_ID#
 </cfquery>
                    <td>#get_many_hours_name.employee_name#</td>
                    <!---    <td>#get_many_hours_name.branch#</td> --->
                     <cfquery name="get_ds_id" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,time_out,time_in
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
 </cfquery>
                    <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id.ds_id#"  target="_blank">#get_ds_id.ds_id#</a><br>
#TimeFormat(get_ds_id.time_in, "HH:mm")# - #TimeFormat(get_ds_id.time_out, "HH:mm")#</td>
                    <cfquery name="get_ds_id_other" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,time_out,time_in
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#  AND ds_id <> #get_ds_id.ds_id#
 </cfquery>
                    <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id_other.ds_id#"  target="_blank">#get_ds_id_other.ds_id#</a> <br>
#TimeFormat(get_ds_id_other.time_in, "HH:mm")# - #TimeFormat(get_ds_id_other.time_out, "HH:mm")#</td>
                  </tr>
                  </tbody>
                </cfoutput>
              </table>
              </cfif>
              </cfloop>
            </div>
          </div>
        </div>
      </div>
          </div>
       </div></div>

<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
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
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script> 
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support --> 
<script src="assets/global/plugins/morris/morris.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/index3.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>  
<!-- END PAGE LEVEL SCRIPTS --> 
<script>
jQuery(document).ready(function() {   
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo(theme settings page)
   Index.init(); // init index page
   Tasks.initDashboardWidget(); // init tash dashboard widget
});
</script> 
<!-- END JAVASCRIPTS -->
</div>
</body>
<!-- END BODY -->
</html>