<cfparam name="yes_list" default="0">
<cfparam name="no_list" default="0">
<cfparam name="notes_list" default="0">
<cfparam name="session.crew_assignment_last" default="All">
 <CFSET session.crew_assignment_last = 0>

 <CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>

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

<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
     
      <div class="page-title">
        <h1>Equipment Inventory Report</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
    
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-12"> 
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                        <cfquery name="get_report_info" datasource="jrgm"  >     
  SELECT   ID, inventory_date, inventory_branch, inventory_user, inventory_status, inventory_filter
FROM         inventory_report_list  WHERE id= #url.id#
</cfquery>
 <table class="table large" >
  <tr>
    <td>Branch:  <cfoutput>#session.BRANCH#</cfoutput></td>
  <td>Report ID:  <cfoutput> #url.id#</cfoutput></td>
   </tr>
  <tr>
    <td>Date:  <cfoutput>#todayDate#</cfoutput></td>
    <td><cfquery name="get_branch_employees1" datasource="jrgm" >
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_report_info.inventory_user#
 </cfquery>
  Inventory Taker: <cfoutput>#get_branch_employees1.fullname#</cfoutput> </td>
   </tr>
  <tr>
    <td></td>
    <td> <cfif get_report_info.inventory_filter  NEQ "">
   <cfquery name="get_branch_employees" datasource="jrgm" >
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_report_info.inventory_filter #
 </cfquery>
  Filter: <cfoutput>#get_branch_employees.fullname#</cfoutput>
  </cfif></td>
   </tr>
</table>

		<table class="table large">
        <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th> <th align="left" class="sorttable_alpha">Equip ID</th>
            <th align="left">Product Name</th>
            <th align="left">Serial #</th>
            <th align="left">Status</th>
            <th align="left">Allocated To</th>
            <th align="center">In Inventory</th>
            <th align="center" width="200">Notes</th>
          </tr>
        </thead>
        <tbody>
     <cfquery name="get_report_results" datasource="jrgm"  >     
        SELECT     TOP (2000) ID, inventory_report_id, equipment_db_id, equipment_yn, equipment_notes
FROM         inventory_report_results WHERE  inventory_report_id= # url.id#
</cfquery>
          <cfoutput query="get_report_results">
            <tr>
              <td align="center">#ID#</td>
 <cfquery name="get_inventory_info" datasource="jrgm"  >     
   SELECT    *
FROM         equipment  WHERE ID  = #equipment_db_id#
</cfquery>
              <td>#get_inventory_info.Category#</td>
              <td align="left" >&nbsp;  #equipment_db_id#</td>
              <td align="left" >&nbsp;  #get_inventory_info.Product_Name#</td>
              <td align="left">&nbsp;  #get_inventory_info.Serial_Number#</td>
              <td align="left">&nbsp;  
                <cfif get_inventory_info.inventory_status EQ 1>
                  Active
                  <cfelseif  get_inventory_info.inventory_status EQ 2>
                  Pending Repair
                  <cfelseif get_inventory_info.inventory_status EQ 3>
                  In Repair
                  <cfelseif get_inventory_info.inventory_status EQ 0>
                  Inactive
                  <cfelse>Active
                </cfif> 
              </td>
 <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_inventory_info.crew_assignment_last#
 </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center" nowrap="nowrap"> 
              <cfif equipment_yn EQ 1>Yes</cfif> 
            <cfif equipment_yn EQ  0>No</cfif> 
              </td>
              <td align="center">#equipment_notes#
	 </td>
            </tr>     
			</cfoutput>
         </tbody>
      </table>
    
																			
							
						</div>
					</div>
					<!-- END ACCORDION PORTLET-->
          
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 


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
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script>
</body>
<!-- END BODY -->
</html>