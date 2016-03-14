<!---<cflock timeout=20 scope="Session" type="Readonly"> 
    <cfoutput> #StructKeyList(Session)# </cfoutput> 
</cflock>

<cfabort>---><!---<cfdump var='#cgi#'>
<cfdump var="#SERVER#" />
<cfdump var="#form#" />--->
<cfquery name="get_approved_quotes" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount, 
 opportunity_field_1 AS q_branch, 
 opportunity_field_18 AS q_start_date ,
 opportunity_field_19 AS q_end_date, 
 stage_id, 
 date_created_utc, 
 bid_currency, 
 bid_type, 
 bid_duration, 
 pipeline_id, 
 opportunity_field_2 AS q_address1, 
 opportunity_field_3 AS q_address2, 
 opportunity_field_4 AS q_city, 
 opportunity_field_5  AS q_address_state, 
 opportunity_field_6 AS q_address_zip, 
 opportunity_field_14 AS q_opportunity_type  ,OPPORTUNITY_status ,DATE_UPDATED_UTC ,
 date_quote_started,
 date_quote_updated, duplicate_quote, opportunity_id_original,
quote_approved,biz_approved_date,RESPONSIBLE_USER_EMPLOYEE_ID AS production_manager_ID
  FROM quote_start WHERE quote_approved =1 
</cfquery>
<!---<br />
<br />
<br />
<br />
<br />
<cfdump var="#get_approved_quotes#">--->

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
        <h1>Project Management-Create New Project&nbsp; </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">Project Management / </li>
          <li class="active">Create New Project </li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <table width="90%" border="0" align="center">
      <tbody>
        <tr>
          <td><p><strong> <span style="color: #F40A0A">This is dynamic info from the quote_start table</span><br />
              This table will be sortable and searchable </strong></p>
            <p><strong>Questions:</strong><br />
              For Project Value I used Bid Amount. Is that correct? <br />
For Project ID I used  OPPORTUNITY_ID from Insightly. Is that correct?<br />
What goes in the  Project Status column?            </p></td>
        </tr>
      </tbody>
    </table>
    <br />
    <div class="container-fluid">
      <table class="table table-striped table-hover" >
        <!---id="sample_5"--->
        <thead>
          <tr>
          <tr>
            <th><div align="left">Project ID</div></th>
            <th><div align="left">Project Name</div></th>
            <th><div align="left">Branch</div></th>
            <th><div align="center">Start Date</div></th>
            <th><div align="center">End Date</div></th>
            <th><div align="left">Production Manager</div></th>
            <th><div align="right">Project Value</div></th>
           <!--- <th><div align="left">&nbsp; </div></th>--->
            <!---<th><div align="left">Project Status</div></th>--->
           <!--- <th><div align="left">Hold Billing</div></th>--->
            <th><div align="left"></div></th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="get_approved_quotes">
            <tr>
              <td>#OPPORTUNITY_ID#</td>
              <td><a href="project_View_Project_Information.cfm?z=#OPPORTUNITY_NAME#">#OPPORTUNITY_NAME#</a></td>
              <cfif  Q_BRANCH EQ 'Richmond' >
                <CFSET branchnew = "RIC" >
                <cfelseif  Q_BRANCH EQ 'Portstmouth' >
                <CFSET branchnew = "POR" >
                <cfelseif  Q_BRANCH EQ 'Portsmouth' >
                <CFSET branchnew = "POR" >
                <cfelseif  Q_BRANCH EQ 'Charlottesville' >
                <CFSET branchnew = "CVL" >
                <cfelseif  Q_BRANCH EQ 'Williamsburg' >
                <CFSET branchnew = "WMB" >
                <cfelseif  Q_BRANCH EQ 'Chesterfield' >
                <CFSET branchnew = "CHE" >
                <cfelseif Q_BRANCH EQ 'Newport News' >
                <CFSET branchnew = "NEW" >
                <cfelse>
                <CFSET branchnew = "" >
              </cfif>
              <td align="left">#branchnew#</td>
              <td><div align="center">#dateformat(Q_START_DATE,"mm/dd/yy")#</div></td>
              <td><div align="center">#dateformat(Q_END_DATE,"mm/dd/yy")#</div></td>
              <cfquery name="get_PM_info" datasource="jrgm">
    SELECT      [Employee ID], [Name FirstLast] AS PM_Name, First_name, Last_name, Position,   Branch FROM app_employees  WHERE  [Employee ID] =#production_manager_ID#
    </cfquery>
              <td><!---#production_manager_ID#--->#get_PM_info.PM_Name#</td>
              <td><div align="right">#NumberFormat(BID_AMOUNT,"9,999,999.99")#</div></td>
             <!---  <td>&nbsp; </td>--->
          <!---    <td><div align="left">?</div></td>--->
             <!--- <td><div align="left">?</div></td>--->
              <td align="center"><a class="btn btn-success btn-sm" href=" http://api.jrgm.com/biz/?EmployeeID=9999&action=create_project&quote_id=336">Create Project</a></td>
            </tr>
          </cfoutput>
 
        </tbody>
      </table>
      <br />

      <!---  <table class="table table-striped table-hover" >
        <!---id="sample_5"--->
        <thead>
          <tr>
            <th><div align="left">Project ID</div></th>
            <th><div align="left">Project Name</div></th>
            <th><div align="left">Branch</div></th>
            <th><div align="center">Start Date</div></th>
            <th><div align="center">End Date</div></th>
            <th><div align="left">Production Manage</div></th>
            <th><div align="right">Project Value</div></th>
            <th><div align="left">Project Status</div></th>
            <th><div align="center">Hold Billing</div></th>
            <th><div align="left"></div></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>12345</td>
            <td><a href="project-Manage_Project_Information.cfm?z=Founders Bridge Golf Villas">Founders Bridge Golf Villas</a></td>
            <td><div align="left">Chesterfield</div></td>
            <td><div align="center">10/01/15</div></td>
            <td><div align="center">10/31/15</div></td>
            <td>Miguel Maldonado</td>
            <td><div align="right">$125,000</div></td>
            <td><div align="center">Active</div></td>
            <td><div align="center">NA</div></td>
            <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=create_project&quote_id=377">Create Project</a></td>
          </tr>
          <tr>
            <td>54321</td>
            <td><a href="project-Manage_Project_Information.cfm?z=Chesterfield Towne Center">Chesterfield Towne Center</a></td>
            <td><div align="left">Chesterfield</div></td>
            <td><div align="center">09/15/15</div></td>
            <td><div align="center">10/15/15</div></td>
            <td>William Swiney</td>
            <td><div align="right">$125,000</div></td>
            <td><div align="center">Active</div></td>
            <td><div align="center">NA</div></td>
            <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=create_project&quote_id=377">Create Project</a></td>
          </tr>
          <tr>
            <td>98765</td>
            <td><a href="project-Manage_Project_Information.cfm?z=Birkdale Community Assoc">Birkdale Community Assoc</a></td>
            <td><div align="left">Chesterfield</div></td>
            <td><div align="center">08/31/15</div></td>
            <td><div align="center">10/15/15</div></td>
            <td>Rogelio Almoite</td>
            <td><div align="right">$75,000</div></td>
            <td><div align="center">Active</div></td>
            <td><div align="center">NA</div></td>
            <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=create_project&quote_id=377">Create Project</a></td>
          </tr>
          <tr>
            <td>56789</td>
            <td><a href="project-Manage_Project_Information.cfm?z=Shoppes at Bellgrade">Shoppes at Bellgrade</a></td>
            <td><div align="left">Chesterfield</div></td>
            <td><div align="center">10/01/15</div></td>
            <td><div align="center">10/31/15</div></td>
            <td>William Swiney</td>
            <td><div align="right">$50,000</div></td>
            <td><div align="center">Active</div></td>
            <td><div align="center">NA</div></td>
            <td><a class="btn btn-success btn-sm" href="http://api.jrgm.com/staging/biz/?EmployeeID=9999&action=create_project&quote_id=377">Create Project</a></td>
          </tr>
        </tbody>
      </table>---> 
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
