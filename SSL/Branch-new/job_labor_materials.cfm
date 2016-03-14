<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>


<!--- <CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF> --->
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM app_jobs  WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
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
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->


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
        <h1>Job Materials &amp; Labor Detail</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Job Materials &amp; Labor Detail</li>
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
          
          <!-- BEGIN PENDING REPAIR -->
					<div class="portlet">
						<div class="portlet-body">
                        <div class="spacerneg20"></div>
                      <cfoutput query="get_job_info">
      <table class="table table-hover table-light">
                  <tr>
                    <td><h4>#locationname#</h4></td>
                    <td><strong>James River ID:&nbsp; #Job_ID#</strong></td>
                  </tr>
                 
                  <tr>
                  <td><strong>Job Location:&nbsp; #locationname#</strong></td>
                    <td colspan="2"><strong>Address:&nbsp; #jobaddress1# #jobcity#, #jobstate#  #jobzip#</strong></td>
              </tr>
                </table></cfoutput>
                </div></div></div></div>
                 <div class="row">
        <div class="col-md-12">
          
          <!-- BEGIN PENDING REPAIR -->
					<div class="portlet">
						<div class="portlet-body">
   <div class="spacer20"></div>
    <!-- to clear footer -->
 <h4>Job Labor </h4>
  <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 order by  Employee_ID DESC
  </cfquery>
  
 <CFSET mylist ="0">
 <cfloop query="get_job_labor">
 <cfset myList = ListAppend(mylist,ds_id)>
 </cfloop>
 <div class="table-responsive">
   <table class="table table-striped table-hover" id="sample_7">
  <thead> 
 <tr>
   <th>Date</th>
   <th>DSID</th>
   <th>EMP ID</th>
   <th>Emp Name</th>
   <th>SVC ID</th>
   <th><div align="center">Min Worked</div></th>
   <th >CLID</th>
    <th>Crew Leader </th>
   <th><div align="center">Job Clock ID</div></th>
  </tr>
    </thead> 
    <cfquery name="get_employee_info" datasource="jrgm"   >
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
     <tbody>  
 <cfoutput query="get_job_labor"> 
 <tr>
 <td>#dateformat(Service_Time_In, "mm/dd/yyyy")#</td>
 <td><a href="daily_sheet.cfm?dsid=#ds_id#">#ds_id#</a></td>
  <td>#Employee_ID#</td>
   <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
  <td>#get_employee_info2.report_name#</td>
    <td>#Service_ID#</td>
    <td><div align="right"><span style="padding-right:60px;">#Total_Time#</span></div></td>
    <td>#crew_leader# </td>
      <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
  <td>#get_employee_info3.report_name#</td>
    <td><div align="center">#job_clock_id#</div></td>
    </tr>  
	</cfoutput>
      <!--- <cfquery name="get_job_labor_total" datasource="jrgm"  >
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id = '#url.Job_ID#'
   </cfquery> --->
 <!--- <tr>
   <td><strong>Totals</strong></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td><td>&nbsp;</td>
 <cfoutput>  <td><strong>#get_job_labor_total.totaljobtime#</strong></td></cfoutput>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr> --->
    </tbody>
</table>
</div>
<div class="spacer20"></div>

 <h4>Daily Sheets with Missing Service Information</h4>
  <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 order by  Service_Time_In DESC
  </cfquery>
  
 <CFSET mylist ="0">
 <cfloop query="get_job_labor">
 <cfset myList = ListAppend(mylist,ds_id)>
 </cfloop>
 
 <div class="table-responsive">
   <table class="table table-striped table-hover" id="sample_3">
  <thead> 
 <tr>
  <th>Date</th>
  <th>DSID</th>
   <th>EMP ID</th>
   <th>Emp Name</th>
   <th>SVC ID</th>
   <th><div align="center">Min Worked</div></th>
   <th >CLID</th>
    <th>Crew Leader </th>
   <th>Job Clock ID</th>
  </tr>
    </thead>
      <tbody>
     <cfquery name="get_job_labor_missing" datasource="jrgm"  >
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)
 order by  job_Time_In DESC
   </cfquery>
   
   <cfif get_job_labor_missing.recordcount EQ 0>
    <tr>
	<td class="text-danger"> All Service Time is Accounted for</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
 </tr>
 <cfelse>
<cfoutput query="get_job_labor_missing"> 

 <tr>
   <td>#DateFormat(job_Time_In, "mm/dd/yyyy")#</td>
 <td><a href="daily_sheet.cfm?dsid=#ds_id#">#ds_id#</a></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td><div align="right"><span style="padding-right:60px;">#Job_Time_worked#</span></div></td>
   <td>#Crew_Leader_ID# </td>
  <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
  <td>#get_employee_info4.report_name#</td>
    <td> #ID#</td>
 </tr>
</cfoutput>
 </cfif>
    </tbody>
</table>
</div>

<div class="spacer20"></div>


   <h4>Job Materials</h4>
 <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     TOP (2000) ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#url.Job_ID#'
  order by  Service_Date DESC
  </cfquery>
  <div class="table-responsive">
    <table class="table table-striped table-hover" id="sample_2">
    <thead> 
   <tr>
    <th>Date</th>
    <th>DSID</th>
    <th>Job Clock ID</th>
    <th>Item ID</th>
    <th>Quantity Used</th>
    <th>Unit Used</th>
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
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 

<!-- BEGIN FOOTER --> 
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
<script>
jQuery(document).ready(function() { 
    $('table.display').dataTable();      
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script>
</body>
<!-- END BODY -->
</html>