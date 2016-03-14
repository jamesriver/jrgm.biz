 
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<CFSET begindate_DS =  '01/01/2014'>

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM app_jobs_all  WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
<!--- <cfdump var="#get_job_info#"> --->



<cfif IsDefined("form.DS_DATE_START") AND form.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= form.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelseif IsDefined("url.DS_DATE_START") AND url.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= url.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelse>
<CFSET DS_DATE_START= begindate_DS>
<!---<CFSET DS_DATE_START =  dateadd("d",365,DS_DATE_START)>--->
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

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<!-- END THEME STYLES -->
</head>
<body>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->

 
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
 <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm"> 
</div>
    <!-- END HEADER SECTION --> 

  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
        <h1>Job Materials &amp; Labor Detail</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Job Materials &amp; Labor Detail</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <div class="page-content">
    <div class="container-fluid">
    	<div class="row">
		<div class="col-md-8">
        
      
  <form action="job_labor_materials.cfm?Job_id=<cfoutput>#url.job_id#</cfoutput>" method="post">
   <table class="table large">
        <tr>
          <td nowrap="nowrap"><strong>Start Date</strong></td>
         <td >
         <input class="form-control form-control-inline input-medium date-picker"  type="text" name="ds_date_start"   
		 <cfif IsDefined("form.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"<cfelseif IsDefined("url.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>">
         <cfelse>value="01/01/2014"</cfif>/> 
            </td> 
              <td nowrap="nowrap"><strong> End Date</strong></td>
          <td><input type="text" name="ds_date_end" class="form-control form-control-inline input-medium date-picker" 
		  <cfif IsDefined("form.ds_date_end") >value="<cfoutput>#DateFormat(form.ds_date_end, "mm/dd/yyyy")#</cfoutput>"
		  <cfelseif IsDefined("url.ds_date_end") >value="<cfoutput>#DateFormat(url.ds_date_end, "mm/dd/yyyy")#</cfoutput>">
          
              <cfelse>value="<cfoutput>#DateFormat(todaydate_DS, "mm/dd/yyyy")#</cfoutput>"</cfif>/> 
              </td>   
          <td> </td>
              <td>
 <input type="hidden" name="Job_ID"  <cfoutput> value="#Job_ID#"</cfoutput> /> 
<!---  <input type="hidden" name="branch"  <cfoutput> value="#branch#"</cfoutput> /> --->
<input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" /></td>
            </tr>
        </table> 
       </form> 
        <cfoutput query="get_job_info">
        <h4>#locationname#</h4>
       <table class="table" >
            <tbody>
            <tr>
              <td><strong>James River ID: #Job_ID#</strong></td>
              <td><strong>Address: #jobaddress1# #jobcity#, #jobstate#  #jobzip#</strong></td>
            </tr>
            <tr>
              <td nowrap="nowrap"><strong>Job Location: #locationname#</strong></td>
              <td nowrap="nowrap" >&nbsp;</td>
            </tr>
            
          </table>
         </cfoutput>
       </div>
       <div class="col-md-4">
       <div align="center"><a href="select_branch_j.cfm" class="btn btn-primary">Choose Another Branch or Job</a></div>
       </div>
       </div>
       
       <div class="row">
		<div class="col-md-12">
   
    <!-- to clear footer -->
    <h4>Job Labor</h4>
  <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 
  <cfif IsDefined("DS_DATE_START")>AND Service_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Time_In< #DS_DATE_END#</cfif>
 order by  Service_Time_In DESC
  </cfquery>
  
 <CFSET mylist ="0">
 <cfloop query="get_job_labor">
 <cfset myList = ListAppend(mylist,ds_id)>
 </cfloop>
<table class="table table-striped table-hover" id="sample_3">
  <thead> 
 <tr>
   <th align="left">Date</th>
   <th align="left">DSID</th>
   <th align="left">Employee ID</th>
   <th align="left">Employee Name</th>
   <th align="left">Service ID</th>
   <th align="left">Time Worked<br />Minutes</th>
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
 <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
 <td><!---<a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">--->#ds_id#<!---</a>---></td>
  <td>#Employee_ID#</td>
   <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
  <td>#get_employee_info2.report_name#</td>
    <td>#Service_ID#</td>
    <td>#Total_Time#</td>
    <td>#crew_leader# </td>
      <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
  <td>#get_employee_info3.report_name#</td>
    <td> #job_clock_id#</td>
    </tr>  
	</cfoutput>
      <cfquery name="get_job_labor_total" datasource="jrgm"  >
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id = '#url.Job_ID#'
   <cfif IsDefined("DS_DATE_START")>AND Service_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Time_In < #DS_DATE_END#</cfif>
   </cfquery>
  
 <thead>
 <tr>
   <th colspan="4" align="left">Daily Sheets with missing service information</th>
   <th>&nbsp;</th>
   <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  </tr>
    </thead> 

 
  <cfquery name="get_job_labor_missing" datasource="jrgm"  >
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)
   <cfif IsDefined("DS_DATE_START")>AND job_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND job_Time_Out < #DS_DATE_END#</cfif>
 order by  job_Time_In DESC
   </cfquery>
   
   <cfif  get_job_labor_missing.recordcount EQ 0>
    <tr>
   <td colspan="9" class="text-danger"> All Service Time is Accounted for</td>
 </tr>
 <cfelse>
<cfoutput query="get_job_labor_missing">
 <tr>
   <td>#DateFormat(job_Time_In, "mm/dd/yyyy")#</td>
 <td><!---<a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">--->#ds_id#<!---</a>---></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
    <td>#Job_Time_worked#</td>
      <td>#Crew_Leader_ID# </td>
      <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
  <td>#get_employee_info4.report_name#</td>
    <td> #ID#</td>
 </tr></cfoutput>
 </cfif>

    </tbody>
</table>
<div class="spacer20"></div>
   <h4>Job Materials</h4>
 <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     TOP (2000) ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#url.Job_ID#'
    <cfif IsDefined("DS_DATE_START")>AND Service_Date > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Date < #DS_DATE_END#</cfif>
  order by  Service_Date DESC
  </cfquery>
   <table class="table table-striped table-bordered table-hover" id="sample_2">
    <thead> 
   <tr>
    <th align="left">Date</th>
    <th align="left">DSID</th>
    <th align="left">Job Clock ID</th>
    <th align="left">Item ID</th>
    <th align="left">Quantity Used</th>
    <th align="left">Unit Used</th>
    </tr>
  </thead>  <tbody>  
   <cfoutput query="get_job_materials"> 
   <tr>
     <td>#DateFormat(Service_Date, "mm/dd/yyyy")#</td>
     <td>#ds_id#</td>
    <td>#Job_clock_ID#</td>
    <td>#Item_ID#</td>
    <td>#Quantity_used#</td>
    <td>#Unit_used#</td>
    </tr>
  </cfoutput>
   </tbody>
</table>


</div>
    
     
     </div>
    <!--Html-->
    </div> 
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
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>

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
</body>
<!-- END BODY -->
</html>