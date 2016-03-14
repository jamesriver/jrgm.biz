 <cfparam name="message" default="">

<!--- <CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<CFSET DS_DATE_START_Begin=  dateadd("d",-365,todaydate_DS)>
 <cfparam name="DS_DATE_START" default="DS_DATE_START_Begin"> --->
 
 
<cfset Now_Time = Now()>

<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_7PM = createDatetime(y,m,d,19,0,0)>
 <cfset timenow = Now()>
 
 <cfif IsDefined("form.empid")>
  <CFSET Employee_ID= form.empid>
  <cfelseif IsDefined("url.empid")>
  <CFSET Employee_ID= url.empid>
</cfif>

<cfif IsDefined("form.branch")>
  <CFSET branch= form.branch>
  <cfelseif IsDefined("url.branch")>
  <CFSET branch= url.branch>
</cfif>

<cfif IsDefined("form.DS_DATE_START") AND form.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= form.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelseif IsDefined("url.DS_DATE_START") AND url.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= url.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelse>
<CFSET DS_DATE_START= todaydate_DS>
<CFSET DS_DATE_START =  dateadd("d",365,DS_DATE_START)>
 </cfif>

<cfif IsDefined("form.DS_DATE_END")  AND form.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= form.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
<cfelseif IsDefined("url.DS_DATE_END") AND url.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= url.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",0,DS_DATE_END)>
<cfelse>
<CFSET DS_DATE_END = todaydate_DS>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
 </cfif>

  <cfquery name="get_all_branch_ds" datasource="jrgm"     >
 SELECT ID, branch_code
FROM         app_daily_sheets<!---  WHERE branch_code = 70 --->
 </cfquery>
 
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
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<script>
function goBack() {
    window.history.back();
}
</script>
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
        <h1>Employee Payroll Detail</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
         <li> <a href="payroll_main.cfm">Payroll</a><i class="fa fa-circle"></i> </li>
        <li class="active">Employee Payroll Detail</li>
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
    <h4>Employee Payroll Detail for&nbsp;
 <cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name# &nbsp;&nbsp;
 Branch : #get_employees_name.branch#  &nbsp;&nbsp;   Employee ID : #empid# </cfoutput></h4></div>
  <div class="col-md-2">
          <button onclick="goBack()" class="btn btn-primary">Get another report</button></div></div>
          
          <div class="row">
					  <div class="col-md-8">
        <div class="spacer40"></div>
    <form action="payroll_view_employee_detail_all_select_dates.cfm" method="post">
   <table class="table large">
        <tr>
          <td><strong > Start Date</strong></td>
         <td>
         <input type="text" id="datepicker" name="ds_date_start" class="form-control form-control-inline input-medium date-picker"  <cfif IsDefined("form.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"</cfif> <cfif IsDefined("url.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"</cfif>/> 
            </td> 
              <td><strong> End Date</strong></td>
          <td><input type="text" id="datepicker2" name="ds_date_end" class="form-control form-control-inline input-medium date-picker"  <cfif IsDefined("form.ds_date_end") >value="<cfoutput>#DateFormat(form.ds_date_end, "mm/dd/yyyy")#</cfoutput>"</cfif><cfif IsDefined("url.ds_date_end") >value="<cfoutput>#DateFormat(url.ds_date_end, "mm/dd/yyyy")#</cfoutput>"</cfif>/> </td>
          <td class="statusTD_right"> </td>
              <td class="statusTD_right">
 <input type="hidden" name="empid"  <cfoutput> value="#empid#"</cfoutput> /> 
  <input type="hidden" name="branch"  <cfoutput> value="#branch#"</cfoutput> /> 
<input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" /></td>
            </tr>
        </table> 
       </form>
        <cfif   timenow GT today_7PM>
       <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
  GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date desc ,ds_id desc
        </cfquery>
       <cfelse>
 <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date desc ,ds_id desc
        </cfquery>
        </cfif>
     <table class="table table-striped table-hover">
    <thead> 
         <tr>
         <th>Day</th>
          <th><div align="center">Date</div></th> 
          <th>DSID</th>
          <th>Minutes<br />Worked</th>
          <th><div align="right">Time<br />Worked</div></th>
           <th><div align="center">Branch</div></th>
          </tr>
        </thead>
        <tbody>
        <cfoutput query="get_employee_time_by_day">
          <tr>
           <td>#DateFormat(ds_date, "dddd")#</td>
            <td><div align="center">#DateFormat(ds_date, "mm/dd/yyyy")#</div></td> 
            <td><a href="daily_sheet.cfm?dsid=#ds_id#">#ds_id#</a></td>
             <td>#sumdailytime#</td>
            <cfset hours = int(sumdailytime\60)>
            <cfset minutes = int(sumdailytime mod 60)>
            <td><div align="right">#hours#:#NumberFormat(minutes,"09")#</div></td>
            
  <cfquery name="get_branch_id"   dbtype="query">
SELECT  branch_code FROM get_all_branch_ds
WHERE  ID = #ds_id#
 </cfquery>
               <td><div align="center">#get_branch_id.branch_code#</div></td>
          </tr>  
		  </cfoutput>
               <tr>
           <td colspan="3"><div align="right"><strong class="text-success">Pay Period Totals</strong></div></td>
            <cfif   timenow GT today_7PM>
              <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#      AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
              <cfelse>
              <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
            </cfif>
             <td>
             <cfoutput query="get_employee_time_sum">
             <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td><div align="right"><strong class="text-success">#hourssum#:#NumberFormat(minutessum,"09")#</strong></div></td>
         </cfoutput></td>
          </tr>  
         </tbody>
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
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {  
 		
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
