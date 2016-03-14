<cfsetting requesttimeout="3600">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
  <cfset todaydate =#DateFormat("#todayDate#", "mm/dd/yyyy")#>
</CFIF>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>James River Grounds Management</title>
<meta http-equiv="X-UA-Compaftible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets2/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets2/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets2/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets2/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets2/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets2/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.redtype {
	color: #F00;
}
table.sortable7 {
	background: #FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable7 thead {
	padding: 10px;
	background-color: #cde3fc;
	color: #000;
	cursor: default;
	font: bold .9em Arial, Helvetica, sans-serif;
}
table.sortable7 thead th {
	padding: 10px;
	background-color: #cde3fc;
	color: 000;
	font: bold 1em Arial, Helvetica, sans-serif;
}
table.sortable7 tbody tr {
	border: 1px solid #b3d4e5;
	padding: 5px;
}
table.sortable7 tbody tr.alt {
	background: #ffffff url(../images/tralt-bg.jpg) top left repeat-x;
}
table.sortable7 tbody tr:hover {
	background: #cde3fc none;
}
table.sortable7 tbody td {
	padding: 10px;
	font: normal .95em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable7 tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable7 tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
.red {
	color: #F40A0A;
}
</style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body >
<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>
<table width="90%" border="0">
  <tbody>
    <tr>
      <td>&nbsp;</td>
      <td align="right"><br />
        <img src="images/clear.png" width="100" height="1" /> <a href="select_branch_j4.cfm" class="bluebutton">Choose Another Branch </a></td>
    </tr>
  </tbody>
</table>
<cfquery name="get_all_jobs_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid,branch FROM app_jobs  
</cfquery>
 <cfquery name="get_all_job_labor" datasource="jrgm"   cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE   service_time_in  > = '01/01/2015 00:00:00' AND   service_time_out IS NOT NULL  AND service_time_out < '#todayDate#' order by  Service_Time_In DESC
  </cfquery>
   <cfquery name="get_employee_info" datasource="jrgm"   cachedwithin="#createTimespan(0,8,0,0)#">
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
<!-- BEGIN PAGE CONTENT -->
<div class="page-content">
  <div class="container-fluid">
 <cfquery name="get_branch_jobs"  dbtype="query" <!--- maxrows="200"--->>
SELECT  JOBID, jobname, branch
 FROM get_all_jobs_info WHERE branch='#url.branch_name#'
 order by jobname
</cfquery> 
<p> 
      <!-- to clear footer --> 
      <span class="dailysheet_header"> Job Labor <cfoutput>#url.branch_name#</cfoutput> Branch</span><br />
      Showing Job Labor Information for 2015 - 
       <cfoutput>#get_branch_jobs.recordcount#</cfoutput> Jobs<br />
     
    
      <CFSET branchjobslist ="">
      <cfloop query="get_branch_jobs">
        <cfset branchjobslist = ListAppend(branchjobslist,JOBID)>
      </cfloop>
      <!--- <cfoutput> #branchjobslist#</cfoutput> ---> 
      
      <!---<cfabort>---> 
      <!--- <cfloop list="branchjobslist" index="#idx#">--->
      
    <table class="table table-striped table-bordered sortable" >
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
            @ 11.50/hr</th>
          <th align="left">CLID</th>
          <th align="left">Crew Leader Name</th>
          <th align="left">Job Clock ID</th>
        </tr>
      </thead>
      <CFLOOP INDEX="ListElement"
LIST="#branchjobslist#"
DELIMITERS=",">
        <cfquery name="get_job_labor"   dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  get_all_job_labor   WHERE job_id = '#ListElement#'  <!--- AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_out IS NOT NULL--->  order by  Service_Time_In DESC
  </cfquery>
       <!--- <CFSET mylist ="0">
        <cfloop query="get_job_labor">
          <cfset myList = ListAppend(mylist,ds_id)>
        </cfloop>--->
        <tbody>
          <cfoutput query="get_job_labor">
            <tr>
              <td>#url.BRANCH_NAME#</td>
   <cfquery name="get_branch_job_name"  dbtype="query">
SELECT  JOBID,  jobname 
 FROM get_branch_jobs WHERE JOBID = '#ListElement#'
</cfquery>
              <td align="left">#get_branch_job_name.jobname#</td>
              <td>#ListElement#</td>
              <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
              <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
              <td>#Employee_ID#</td>
      <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
              <td align="left">#get_employee_info2.report_name#</td>
              <td>#Service_ID#</td>
              <td>#Total_Time#</td>
              <cfset hours = int(Total_Time\60)>
              <cfset minutes = int(Total_Time mod 60)>
              <td>#hours#:#NumberFormat(minutes,"09")#</td>
              <cfset laborcost = .19166666*Total_Time>
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
           <cfquery name="get_job_labor2"    datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT     ds_id
 FROM  app_job_services_actual_employee
   WHERE job_id = '#ListElement#' <!--- AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_out IS NOT NULL--->  
  </cfquery>
        <CFSET mylist ="0">
        <cfloop query="get_job_labor2">
          <cfset myList = ListAppend(mylist,ds_id)>
        </cfloop>
          <cfquery name="get_job_labor_missing"  datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id =   '#ListElement#' AND ds_id NOT IN  (#myList#)  AND   job_Time_In  > = '01/01/2015 00:00:00' AND job_time_out IS NOT NULL
 order by  job_Time_In DESC
   </cfquery>
          <cfif  get_job_labor_missing.recordcount EQ 0>
            <!---<tr>
              <td colspan="14" class="arialfont"> All Service Time is Accounted for</td>
            </tr>--->
            <cfelse>
           <!--- <tr>
              <th colspan="14" align="left">Daily Sheets with missing service information  <!----<cfoutput>#myList#</cfoutput>---></th>
            </tr>--->
            <cfoutput query="get_job_labor_missing">
              <tr>
                <td><strong>#url.BRANCH_NAME#</strong></td>
                <cfquery name="get_branch_job_name"  dbtype="query">
SELECT  JOBID,  jobname 
 FROM get_branch_jobs WHERE JOBID = '#ListElement#'
</cfquery>
                <td align="left"><strong>#get_branch_job_name.jobname#</strong></td>
                <td><strong>#ListElement#</strong></td>
                <td><strong>#DateFormat(job_Time_In, "mm/dd/yyyy")#</strong></td>
                <td><strong><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></strong></td>
                <td  align="left"><strong>No Information</strong></td>
                <td><strong>No Information</strong></td>
                <td><strong>No Information</strong></td>
                <td><strong>#Job_Time_worked#</strong></td>
                <cfset hours = int(Job_Time_worked\60)>
                <cfset minutes = int(Job_Time_worked mod 60)>
                <td><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
                <cfset laborcost = .19166666*Job_Time_worked>
                <td><strong>#NumberFormat(laborcost,"999,999.99")#</strong></td>
                <td><strong>#Crew_Leader_ID#</strong></td>
                <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
                <td><strong>#get_employee_info4.report_name#</strong></td>
                <td><strong>#ID#</strong></td>
              </tr>
            </cfoutput>
          </cfif>
            <CFSET mylist ="0">
      </cfloop>
    </table>
    <br />
    <br />
    <br />
    <br />
  </div> </div>
</div>
</div>
</div>
</div>
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/table-advanced.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script> 
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
</html>
