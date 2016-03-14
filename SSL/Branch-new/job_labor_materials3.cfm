<cfset todayDate = Now()>
 <cfset todayDate = DateFormat(todayDate,"mm/dd/yyyy")>
 <cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader,branch
 FROM app_jobs WHERE [Job ID]= '#url.Job_ID#'
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
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
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
        <h1>Job Details for <cfoutput>#get_job_info.locationname#</cfoutput></h1><br>
Information is from 1/1/2015
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      to date</div><div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Job Details<i class="fa fa-circle"></i></li>
          <li> <a href="branch_joblist.cfm" style="color: #F40A0A; font-weight: bold; font-size: 14px;">Choose Another Job </a></li>
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
         <cfoutput query="get_job_info">
            <strong><div class="subheader">#locationname#</div>
            <span class="arialfont"> 
            James River ID&##8212;#Job_ID#<br />
            Job Location&##8212;#locationname#<br />
            Address&##8212;#jobaddress1#<br />
            City&##8212;#jobcity#, #jobstate# #jobzip#</strong><br />
          </cfoutput>
          <p> <br>

            <!-- to clear footer --> 
            <span class="dailysheet_header"><strong> Job Labor</strong></span> <br />
            <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'  AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_in < '#todaydate#' 
 order by  Service_Time_In DESC
  </cfquery>
            <CFSET mylist ="0">
            <cfloop query="get_job_labor">
              <cfset myList = ListAppend(mylist,ds_id)>
            </cfloop>
          <cfif get_job_labor.recordcount GT 0>
          <table class="table table-striped table-bordered table-hover sortable" >
            <thead>
              <tr>
                <th align="left">Branch</th>
                <th align="left">Job Name</th>
                <th align="left">Job ID</th>
                <th align="left">Date</th>
                <th align="left">DSID</th>
                <th align="left">Employee ID</th>
                <th align="left">Employee Name</th>
                <th align="left">Service ID</th>
                <th align="left">Time Worked<br />
                  Minutes</th>
                <th align="left">Time Worked<br />
                  Hours</th>
                <th align="left">Labor Cost<br />
                  @ 13.00/hr</th>
                <th align="left">CLID</th>
                <th align="left">Crew Leader Name</th>
                <th align="left">Job Clock ID</th>
              </tr>
            </thead>
            <cfquery name="get_employee_info" datasource="jrgm"   >
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
            <tbody>
              <cfoutput query="get_job_labor">
                <tr>
                  <td>#get_job_info.branch#</td>
                  <td>#get_job_info.locationname#</td>
                  <td>#url.Job_ID#</td>
                  <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
                  <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
                  <td>#Employee_ID#</td>
                  <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
                  <td>#get_employee_info2.report_name#</td>
                  <td>#Service_ID#</td>
                  <td>#Total_Time#</td>
                  <cfset hours = int(Total_Time\60)>
                  <cfset minutes = int(Total_Time mod 60)>
                  <td>#hours#:#NumberFormat(minutes,"09")#</td>
                  <cfset laborcost = 0.21666667*Total_Time>
                  <td>#NumberFormat(laborcost,"999,999.99")#</td>
                  <td>#crew_leader#</td>
                  <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
                  <td>#get_employee_info3.report_name#</td>
                  <td>#job_clock_id#</td>
                </tr>
              </cfoutput>
              <cfquery name="get_job_labor_total" datasource="jrgm"  >
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id = '#url.Job_ID#'  AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_in < '#todaydate#'
   </cfquery>
              <tr>
                <td><strong>Totals</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <cfoutput>
                  <td><strong>#get_job_labor_total.totaljobtime#</strong></td>
                  <cfset hours = int(get_job_labor_total.totaljobtime\60)>
                  <cfset minutes = int(get_job_labor_total.totaljobtime mod 60)>
                  <td><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
                  <cfset laborcost = 0.21666667*get_job_labor_total.totaljobtime>
                  <td><strong>#NumberFormat(laborcost,"999,999.99")#</strong></td>
                </cfoutput>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            <thead>
              <tr>
                <th colspan="14" align="left">Daily Sheets with missing service information</th>
              </tr>
            </thead>
            <cfquery name="get_job_labor_missing" datasource="jrgm"  >
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)    AND job_Time_In  > = '01/01/2015 00:00:00' AND 
  job_Time_out < '#todaydate#' 
 order by  job_Time_In DESC
   </cfquery>
            <cfif  get_job_labor_missing.recordcount EQ 0>
              <tr>
                <td colspan="14" class="arialfont"> All Service Time is Accounted for</td>
              </tr>
              <cfelse>
              <cfoutput query="get_job_labor_missing">
                <tr>
                  <td>#get_job_info.branch#</td>
                  <td>#get_job_info.locationname#</td>
                  <td>#url.Job_ID#</td>
                  <td>#DateFormat(job_Time_In, "mm/dd/yyyy")#</td>
                  <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>#Job_Time_worked#</td>
                  <cfset hours = int(Job_Time_worked\60)>
                  <cfset minutes = int(Job_Time_worked mod 60)>
                  <td>#hours#:#NumberFormat(minutes,"09")#</td>
                  <cfset laborcost = 0.21666667*Job_Time_worked>
                  <td>#NumberFormat(laborcost,"999,999.99")#</td>
                  <td>#Crew_Leader_ID#</td>
       <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
                  <td>#get_employee_info4.report_name#</td>
                  <td>#ID#</td>
                </tr>
              </cfoutput>
             <!--- <cfquery name="get_job_labor_totalM" datasource="jrgm"  >
 SELECT SUM(Job_Time_worked) AS totaljobtime FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)  AND 
  job_Time_out < '#todaydate#' 
   </cfquery>
              <tr>
                <td><strong>Totals</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <cfoutput>
                  <td><strong>#get_job_labor_totalM.totaljobtime#</strong></td>
                  <cfset hours = int(get_job_labor_totalM.totaljobtime\60)>
                  <cfset minutes = int(get_job_labor_totalM.totaljobtime mod 60)>
                  <td><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
                  <cfset laborcost = 0.21666667*get_job_labor_totalM.totaljobtime>
                  <td><strong>#NumberFormat(laborcost,"999,999.99")#</strong></td>
                </cfoutput>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>--->
            </cfif>
          </table>
           <cfelse>
           There are no daily sheets for this job.<br>
<br>

           </cfif>
          <br />
          <span class="dailysheet_header"><strong>Job Materials</strong></span> <br />
          <br />
          <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#url.Job_ID#'  AND Service_Date  > = '12/31/2014' 
  order by  Service_Date DESC
  </cfquery>
    <cfif get_job_materials.recordcount GT 0>
          <table class="table table-striped table-bordered table-hover sortable" >
            <thead>
            <thead>
              <tr>
                <th align="left">Branch</th>
                <th align="left">Job Name</th>
                <th align="left">Job ID</th>
                <th align="left">Date</th>
                <th align="left">DSID</th>
                <th align="left">Job Clock ID</th>
                <th align="left">Item ID</th>
                <th align="left">Quantity Used</th>
                <th align="left">Unit Used</th>
              </tr>
            </thead>
            <tbody>
              <cfoutput query="get_job_materials">
                <tr>
                  <td>#get_job_info.branch#</td>
                  <td>#get_job_info.locationname#</td>
                  <td>#url.Job_ID#</td>
                  <td>#DateFormat(Service_Date, "mm/dd/yyyy")#</td>
                   <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
                  <td>#Job_clock_ID#</td>
                  <td>#Item_ID#</td>
                  <td>#Quantity_used#</td>
                  <td>#Unit_used#</td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
            <cfelse>
           There are no materials on daily sheets for this job.<br>
<br>

           </cfif>
        
        </div>
      </div>
      <!-- END JOB NOTES--> 
    </div>
  </div>
</div>
<!-- END PAGE CONTENT INNER --> 

<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>

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