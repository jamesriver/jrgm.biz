 

<cfquery name="get_all_jobs" datasource="jrgm"  >
SELECT [Job ID] AS projectid, <!---[Wk Loc ID] as projectid, --->[Wk Location Name] AS job_name, [Service Address] as project_address, [Service Address2], [Service City] as project_city, [Service State], [Service Zip],      active_record,  branch,total_project_value,  project_start_date,  project_end_date, responsible_user_Employee_ID
FROM app_jobs_new
WHERE 0=0 <!---branch =  '#url.BRANCH_NAME#'   --->
 ORDER by  job_name ASC
</cfquery>

<!--- ================== Get list of employees for the production manager display =================== --->
<cfset employees = StructNew()>
<cfquery name="get_employees" datasource="jrgm">
SELECT  [Employee ID] as employee_id, [Name FirstLast] AS CL_Name FROM app_employees WHERE active_record=1 AND [Employee ID]<9999 ORDER BY [First_name]
</cfquery>
<cfloop query="get_employees">
    <cfset employees[get_employees.employee_id] = get_employees.CL_Name & ' - ' & get_employees.employee_id>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>James River Grounds Management</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
.table   {
	margin-left: 10px;
	margin-bottom: 20px;
	width: 95%;
}

.table. thead > tr > th  {
	padding: 5px 6px;
	font-size: 12px;
	font-weight: 600;
	color: #00472e;
}

.table. tbody > tr > td  {
	padding: 5px 6px;
	font-size: 12px;
}
</style>
</head>
<body >
<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Project List </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">JRGM Project List</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
      <table class="table table-striped table-bordered table-hover" id="sample_1">
        <thead>
          <tr>
            <th nowrap="nowrap"><div align="left">Project ID</div></th>
            <th><div align="left">Project Name</div></th>
            <th><div align="left">Branch</div></th>
            <th  nowrap="nowrap"><div align="left">Project Status</div></th>
           <!--- <th><div align="left">Project Address</div></th>--->
            <th  nowrap="nowrap"><div align="left">Production Manager</div></th>
            <th nowrap="nowrap">Start Date</th>
            <th nowrap="nowrap">End Date</th>
            <th nowrap="nowrap"><div align="left">Project Value</div></th>
            <th ><div align="left">Edit Project</div></th>
         <!---    <th ><div align="left">Renew Project</div></th>--->
          </tr>
        </thead>
        <tbody>
          <cfoutput  query="get_all_jobs">
          <cfset production_manager_name = '-'>
          <cfif get_all_jobs.responsible_user_Employee_ID GT 0>
              <cfset production_manager_name = employees[get_all_jobs.responsible_user_Employee_ID]>
          </cfif>
            <tr>
              <td nowrap="nowrap">#projectid#</td>
              <td><a href="project_Edit_Project_Information.cfm?ProjectID=#projectid#">#job_name#</a></td>
              <cfif  branch EQ 'Richmond' >
                <CFSET branchnew = "RIC" >
                <cfelseif  branch EQ 'Portstmouth' >
                <CFSET branchnew = "POR" >
                <cfelseif  branch EQ 'Portsmouth' >
                <CFSET branchnew = "POR" >
                <cfelseif  branch EQ 'Charlottesville' >
                <CFSET branchnew = "CVL" >
                <cfelseif  branch EQ 'Williamsburg' >
                <CFSET branchnew = "WMB" >
                <cfelseif  branch EQ 'Chesterfield' >
                <CFSET branchnew = "CHE" >
                <cfelseif branch EQ 'Newport News' >
                <CFSET branchnew = "NEW" >
                <cfelse>
                <CFSET branchnew = "" >
              </cfif>
              <td><div align="left">#branchnew#</div></td>
              <cfif   active_record EQ 1>
                <CFSET status ='Active'>
                <cfelseif   active_record EQ 0>
                <CFSET status ='Inactive'>
                <cfelse>
                <CFSET status =''>
              </cfif>
              <td><div align="left">#status#</div></td>
            <!---  <td><div align="left">#project_address#</div></td>--->
              <td><div align="center">
                #production_manager_name#
              </div></td>
              <td>#DateFormat(project_start_date, "mm/dd/yyyy")#</td>
              <td>#DateFormat(project_end_date, "mm/dd/yyyy")#</td>
              <td><div align="right">#total_project_value#</div></td>
              <td  align="center"><a class="btn btn-success btn-sm" href="project_Edit_Project_Information.cfm?ProjectID=#ProjectID#">Edit </a></td>
            
          <!---  <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/biz/?EmployeeID=9999&action=renew_project&JobID=#ProjectID#">Renew </a></td> --->
              <!---http://api.jrgm.com/test.php?convert_job_id={ pass in dbo.app_jobs.[Job ID] ---> 
            </tr>
          </cfoutput>
        </tbody>
      </table>
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
