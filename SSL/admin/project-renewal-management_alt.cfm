<cfquery name="get_project_info" datasource="jrgm"  <!---maxrows="200"--->>
SELECT       ID, [Job ID] AS ProjectID, [Wk Loc ID], [Wk Location Name] AS projectname, [Service Address], 
                       active_record, branch, Responsible_User_Employee_ID, Supervisor_ID, Spray_Tech_ID, Irrigation_Tech_ID, Status, irrigation, 
                      sales_contact_Employee_ID, billing_contact_name, billing_contact_phone, billing_contact_email_address, billing_address, billing_address2, billing_city, 
                      billing_state, billing_zip, project_start_date, project_end_date, total_project_value, irrigation_services_included, department, date_last_modified, last_modified_by, 
                      OLD_JOB_ID, [Acct Mgr], [Crew Leader], export_id, last_modified_date
FROM         app_jobs  WHERE status ='IN PROGRESS'
order by project_end_date ASC
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
        <h1>Renewal Management List </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">Renewal Management List</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <table width="90%" border="0"  align="center">
      <tbody>
        <tr>
          <td><p><strong>This data will come from the app_jobs once the changes from app_new table are in place.<br />
              This is dynamic data from the app_jobs table<br />
              This table will be sortable and searchable </strong><br />
            </p>
            <p><strong>Ben : The Renew Project link takes user to the http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=renew_project&JobID=JobID</strong></p>
            <p><strong>The notes will link to a screen where user can enter notes.</strong><br />
              <br />
              Production Manager info will come from the Responsible_User_Employee_ID field.</p>
<p>Showing only projects that have a status of &quot;In Progress&quot;</p></td>
        </tr>
      </tbody>
    </table>
    <br />
    <div class="container-fluid">
      <!---<table class="table table-striped table-hover" id="sample_5">--->
     <!--- <table class="table table-striped table-hover" id="sample_3">--->
        <!---id="sample_5"--->
        
        <table class="table table-striped table-bordered table-hover" id="sample_1">

        <thead>
          <tr>
            <th><div align="left">Project ID</div></th>
            <th><div align="left">Project Name</div></th>
            <th><div align="left">Branch</div></th>
            <th><div align="center">Start Date</div></th>
            <th><div align="center">End Date</div></th>
            <th><div align="left">Production Manager</div></th>
            <th><div align="right">Project Value</div></th>
            <th><div align="left">Project Status</div></th>
            <th><div align="left">Renewal Lead</div></th>
            <th><div align="center">% <br />
                Increase <br />
                Requested</div></th>
            <th><div align="center">Hold <br />
                Billing</div></th>
            <th ><div align="center">Notes</div></th>
            <th ><div align="left"></div></th>
          </tr>
        </thead>
        <tbody>
          <cfoutput  query="get_project_info">
            <tr>
              <td>#ProjectID#</td>
              <td><a href="project-Manage_Project_Information.cfm?z=#projectname#">#LEFT(projectname,30)#</a></td>
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
              <td><div align="center">#dateformat(project_start_date,"mm/dd/yy")#</div></td>
              <td><div align="center">#dateformat(project_end_date,"mm/dd/yy")#</div></td>
              <td><div align="center">-</div></td>
              <td><div align="right">#total_project_value#</div></td>
              <td><div align="center">#status#</div></td>
              <td><div align="center">?</div></td>
              <td><div align="center">?</div></td>
              <td><div align="center">?</div></td>
              <td><div align="center">Notes</div></td>
              <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=renew_project&JobID=#ProjectID#">Renew Project</a></td>
              <!---http://api.jrgm.com/test.php?convert_job_id={ pass in dbo.app_jobs.[Job ID] ---> 
            </tr>
            <!---    <tr>
              <td>54321</td>
              <td><a href="project-Manage_Project_Information.cfm?z=CHE Towne Center">CHE Towne Center</a></td>
              <td><div align="left">CHE</div></td>
              <td><div align="center">09/15/15</div></td>
              <td><div align="center">10/15/15</div></td>
              <td>William Swiney</td>
              <td><div align="right">$125,000</div></td>
              <td><div align="center">Active</div></td>
              <td>John Smith</td>
              <td><div align="center">25</div></td>
              <td><div align="center">NA</div></td>
              <td><div align="center">Notes</div></td>
              <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=renew_project&JobID=J0553-1214">Renew Project</a></td>
            </tr>
            <tr>
              <td>98765</td>
              <td><a href="project-Manage_Project_Information.cfm?z=Birkdale Community Assoc">Birkdale Community Assoc</a></td>
              <td><div align="left">CHE</div></td>
              <td><div align="center">08/31/15</div></td>
              <td><div align="center">10/15/15</div></td>
              <td>Rogelio Almoite</td>
              <td><div align="right">$75,000</div></td>
              <td><div align="center">Active</div></td>
              <td>John Smith</td>
              <td><div align="center">25</div></td>
              <td><div align="center">NA</div></td>
              <td><div align="center">Notes</div></td>
              <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=renew_project&JobID=J0553-1214">Renew Project</a></td>
            </tr>
            <tr>
              <td>56789</td>
              <td><a href="project-Manage_Project_Information.cfm?z=Shoppes at Bellgrade">Shoppes at Bellgrade</a></td>
              <td><div align="left">CHE</div></td>
              <td><div align="center">10/01/15</div></td>
              <td><div align="center">10/31/15</div></td>
              <td>William Swiney</td>
              <td><div align="right">$50,000</div></td>
              <td><div align="center">Active</div></td>
              <td>John Smith</td>
              <td><div align="center">25</div></td>
              <td><div align="center">NA</div></td>
              <td><div align="center">Notes</div></td>
              <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=renew_project&JobID=J0553-1214">Renew Project</a></td>
            </tr>---> 
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
