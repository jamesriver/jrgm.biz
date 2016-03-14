<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader,branch
 FROM app_jobs WHERE [Job ID]= '#url.Job_ID#'
</cfquery>

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
        <img src="images/clear.png" width="100" height="1" /> <a href="select_branch_j3.cfm" class="bluebutton">Choose Another Branch or Job</a></td>
    </tr>
  </tbody>
</table>

<!-- BEGIN PAGE CONTENT -->
<div class="page-content">
  <div class="container-fluid"> <cfoutput query="get_job_info">
      <div class="subheader">#locationname#</div>
      <span class="arialfont"><!--- Job ID&##8212; #ID# <br /> ---> 
      James River ID&##8212;#Job_ID#<br />
      Job Location&##8212;#locationname#<br />
      Address&##8212;#jobaddress1#<br />
      City&##8212;#jobcity#, #jobstate# #jobzip#</span><br />
    </cfoutput>
    <p> 
      <!-- to clear footer --> 
      <span class="dailysheet_header"> Job Labor</span> <br />
      <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 order by  Service_Time_In DESC
  </cfquery>
      <CFSET mylist ="0">
      <cfloop query="get_job_labor">
        <cfset myList = ListAppend(mylist,ds_id)>
      </cfloop>
    
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
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id = '#url.Job_ID#'
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
 FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)
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
        <cfquery name="get_job_labor_totalM" datasource="jrgm"  >
 SELECT SUM(Job_Time_worked) AS totaljobtime FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)
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
        </tr>
      </cfif>
    </table>
    <br />
    <br />
    <span class="dailysheet_header">Job Materials</span> <br />
    <br />
    <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#url.Job_ID#'
  order by  Service_Date DESC
  </cfquery>
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
            <td>#ds_id#</td>
            <td>#Job_clock_ID#</td>
            <td>#Item_ID#</td>
            <td>#Quantity_used#</td>
            <td>#Unit_used#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
    <br />
    <br />
  </div>
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
