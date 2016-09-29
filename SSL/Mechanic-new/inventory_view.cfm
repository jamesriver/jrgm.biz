<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE <!--- (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) --->Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.2
Version: 3.6.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
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
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
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
<body>

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
 <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm"> 
</div>
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
        <div class="row margin-top-20">
     <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
      <cfoutput  query="get_this_equipment">
      <div class="page-title">
        <h1>#PRODUCT_NAME#</h1>
      </div> 
      
       <!---  <div class="col-md-3"><a href="javascript:history.back()" class="btn btn-primary"> Back to Inventory List</a></div> --->
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Inventory </li>
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
    
            
             <div class="table-responsive">
            
               <form method="post" action="inventory_edit2.cfm">
 <table class="table table-striped table-hover" id="sample_3">
           <thead>
            <tr>
              <th >ID</th>
              <th> #ID# </th>
              <th>Date Created</th>
              <th>#DateFormat(DATE_CREATED, "mm/dd/yyyy")#</th>
              <th >Category</th>
              <th colspan="2">#Category#</th>
           </tr></thead>
           <tbody>
            <tr>
              <td nowrap="nowrap">Product Name</td>
              <td> #PRODUCT_NAME#</td>
             <td nowrap="nowrap">Status</td>
                
              <td><cfif inventory_status EQ 1>Active </cfif>
				 <cfif inventory_status EQ 0>Inactive</cfif>
				 <cfif inventory_status EQ 2>Pending Repair</cfif> 
				 <cfif inventory_status EQ 3>In Repair</cfif> </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Description</td>
              <td colspan="5"> #PRODUCT_DESCRIPTION#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Date Purchased</td>
              <td>#DateFormat(DATE_PURCHASED, "mm/dd/yyyy")# </td>
              <td nowrap="nowrap">Year</td>
              <td>#EQUIPMENT_YEAR#</td>
              <td nowrap="nowrap">Cost</td>
              <td>#COST# </td>
            </tr>
            <tr>
              <td nowrap="nowrap">Equipment ID</td>
              <td>#EQUIPMENT_ID#</td>
              <td nowrap="nowrap">Serial Number</td>
              <td>#SERIAL_NUMBER#</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Color</td>
              <td>#COLOR#</td>
              <td nowrap="nowrap">Alt. ID</td>
              <td>#MEASUREMENT#</td>
              <td nowrap="nowrap">Snow</td>
              <td>#snow#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Inspection Date</td>
              <td>#DateFormat(INSPECTION_DUE, "mm/dd/yyyy")#</td>
              <td nowrap="nowrap">License Plate</td>
              <td>#LICENSE_PLATE#</td>
              <td nowrap="nowrap">Tags Expire</td>
              <td>#DateFormat(TAGS_EXPIRE, "mm/dd/yyyy")# </td>
            </tr>
            <tr>
              <td nowrap="nowrap">Quantity</td>
              <td>#QUANTITY_START#</td>
              <td nowrap="nowrap">Quantity on Hand</td>
              <td>#QUANTITY_ON_HAND# </td>
              <td nowrap="nowrap">Engine Cycle</td>
              <td>#engine_cycle#
                <cfif engine_cycle NEQ ''>
                  cycle
                </cfif>
              </td>
            </tr>
            <tr>
              <td nowrap="nowrap">Branch Name</td>
              <td>#BRANCH_NAME#</td>
              <td nowrap="nowrap">Crew Assignment</td>
              
               
            <td>
			<CFIF  get_this_equipment.Crew_assignment_last EQ ""> -
            <cfelse>
              <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
            WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
           </cfquery>
              #get_branch_employees_allocated.fullname#
              </CFIF>
            </td>
            <td> Last Oil Change Date </td>
            <td>#DateFormat(last_oil_change_date, "mm/dd/yyyy")#</td></tr>
            <tr>
              <td nowrap="nowrap">Supplier Company</td>
              <td>#SUPPLIER_COMPANY#</td>
              <td nowrap="nowrap">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Date Modified </td>
              <td>#DateFormat(DATE_MODIFIED, "mm/dd/yyyy")#</td>
              <td nowrap="nowrap">Modified By</td>
              <td>#MODIFIED_BY# </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
        </tbody>
        </table>
      </cfoutput> </div>

              </div></div>
           
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
</div>
</div>

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
<script src="assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {       
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
   TableAdvanced.init();
});
</script>




</body>
<!-- END BODY -->
</html>