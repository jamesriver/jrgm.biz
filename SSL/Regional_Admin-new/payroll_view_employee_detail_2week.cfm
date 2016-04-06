 <CFIF IsDefined("url.pay_period_number")>
  <cfset pay_period_number = #url.pay_period_number#>
  <cfelse>
  <cfset pay_period_number= #pay_period_number#>
</CFIF>
 
<cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET MIDPLUS1_DATE =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 <CFSET pay_period_endPLUS1_DATE =  dateadd("d",1,pay_period_end)>
 
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
      <cfoutput query="app_payroll_periods"> 
      <div class="page-title">
        <h1><cfoutput>#url.branch#</cfoutput> Branch Payroll  - Period #DateFormat("#begin_date#", "mm/dd/yyyy")#-
     #DateFormat("#pay_period_end#", "mm/dd/yyyy")#</h1> </div></cfoutput>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="payroll_main.cfm">Payroll</a><i class="fa fa-circle"></i> </li>
        <li class="active">Current Payroll Period</li>
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
			<cfquery name="get_employees_with_time" datasource="jrgm"      >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#URL.branch#'  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
		ORDER by APP_employees.last_name
 </cfquery>
 
 <cfif get_employees_with_time.recordcount EQ 0>
  <br />
There are no employees with time for ths period. 
 <cfabort>
 
 </cfif>
 					
					
					<div class="row">
					  <div class="col-md-12">
                        <div class="table-responsive">
        <table class="table table-striped table-hover" >
         <thead> 
          <tr>
          <th>Name</td>
           <th><div align="center">ID</div></td>
          <th><div align="center">Day 1</div></th>
          <th><div align="center">Day 2</div></th>
          <th><div align="center">Day 3</div></th>
          <th><div align="center">Day 4</div></th>
          <th><div align="center">Day 5</div></th>
          <th><div align="center">Day 6</div></th>
          <th><div align="center">Day 7</div></th>
          <th><div align="center">Day 8</div></th>
          <th><div align="center">Day 9</div></th>
          <th><div align="center">Day 10</div></th>
          <th><div align="center">Day 11</div></th>
          <th><div align="center">Day 12</div></th>
          <th><div align="center">Day 13</div></th>
          <th><div align="center">Day 14</div></th>
          <th>&nbsp;</th>
          <th>&nbsp;</th>
          <th>&nbsp;</th>
        </tr>
     </thead>
         <cfoutput>
         <tbody> 
          <tr>
            <td></td>   <td></td>
            <td><div align="center"><span class="datesm">#DateFormat("#begin_date#", "ddd mm/dd/yyyy")#</span></div></td>
            <CFSET current_date = '#begin_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <CFSET current_date = '#current_date#' +1>
            <td><div align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></div></td>
            <td width="75"  class="warning" ><div align="center"><span class="datesm">Total</span></div></td>
            <td width="75" class="warning" ><div align="center"><span class="datesm">Week 1</span></div></td>
            <td width="75" class="warning" ><div align="center"><span class="datesm">Week 2</span></div></td>
          </tr>
        </cfoutput>
       
 
 
  <CFSET mylist ="">
<cfloop query="get_employees_with_time">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
 
  <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
	SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#mylist#) AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
 AND in_out_status =2
  </cfquery> 
        <cfparam name="current_date" default="1">
        <cfloop query="get_employees_with_time" >
          <tr> <cfoutput>
              <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#&pay_period_number=#pay_period_number#&branch=<cfoutput>#url.branch#</cfoutput>">#get_employees_with_time.first_name# #get_employees_with_time.last_name# </a></td>
                <td nowrap="nowrap"><div align="center"> #get_employees_with_time.Employee_ID#</div></td>
            </cfoutput>
             <CFSET employee_total = 0>
            <cfloop from="#begin_date#" to="#end_Date#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
            <CFSET idate = #DateFormat("#i#", "mm/dd/yyyy")#>
              <cfquery name="get_employee_time_by_day"  dbtype="query">
				SELECT Employee_ID, SUM(time_worked) As sumdailytime, in_out_status,ds_date 
				 FROM get_all_employee_time_for_period
				 WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND ds_date = '#DateFormat(i, "mm/dd/yyyy")#'
				  AND in_out_status =2
 				GROUP by Employee_ID, ds_date, in_out_status
				 ORDER by ds_date DESC 
				</cfquery>
              <cfif  get_employee_time_by_day.recordcount EQ 0>
                <td><div align="center">-</div></td>
                <cfelse>
                <cfoutput query="get_employee_time_by_day" >
                  <cfset hours = int(sumdailytime\60)>
                  <cfset minutes = int(sumdailytime mod 60)>
                  <cfset employee_total = sumdailytime +employee_total>
                  <cfif (get_employee_time_by_day.ds_date EQ i) >
                    <td><div align="center">#hours#:#NumberFormat(minutes,"09")#</div></td>
                  </cfif>
                 </cfoutput>
              </cfif>
            </cfloop>
            <cfoutput>
              <cfset hourst = int(employee_total\60)>
              <cfset minutest = int(employee_total mod 60)>
               <td class="warning" ><div align="center">#hourst#:#NumberFormat(minutest,"09")#</div></td>
            </cfoutput> 
              <cfquery name="get_employee_time_sum_w1" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
				app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > #begin_date#    
          		  AND app_employee_payroll_clock.Time_Out < #midplus1_date# AND in_out_status =2  GROUP by Employee_ID
      		   </cfquery >
           <cfif  get_employee_time_sum_w1.recordcount EQ 0>
             <td class="warning"><div align="center">-</div></td>
                <cfelse>
          <cfoutput query="get_employee_time_sum_w1"> 
		  <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
           <td class="warning"><div align="center">#hourssum#:#NumberFormat(minutessum,"09")#</div></td></cfoutput>
           </cfif>
             <cfquery name="get_employee_time_sum_w2" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
			app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > #midplus1_date#  AND app_employee_payroll_clock.Time_Out <  								            #pay_period_endPLUS1_DATE#  AND in_out_status =2 GROUP by Employee_ID
         </cfquery >
           <cfif  get_employee_time_sum_w2.recordcount EQ 0>
             <td class="warning"><div align="center">-</div></td>
                <cfelse>
          <cfoutput query="get_employee_time_sum_w2"> 
		  <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td class="warning"><div align="center">#hourssum#:#NumberFormat(minutessum,"09")#</div></td></cfoutput>
            </cfif>
             </tr>
        </cfloop>
         </tbody> 
      </table>
				</div>	
						
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