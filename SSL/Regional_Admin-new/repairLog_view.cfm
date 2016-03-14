

<cfquery name="get_repair_log" datasource="jrgm">
SELECT * FROM equipment_repair_log  WHERE ID = #ID#   
</cfquery>
   <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.equipmentid#
 </cfquery>
  <cfparam name="getequipment.crew_assignment_last" default="0">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
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
       <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif>
 <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 6 AND    form.inventory_status NEQ 4   > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>

ORDER by  ID ASC
</cfquery>
      <div class="page-title">
        <h1> Repair Log - ID:<cfoutput>#ID#</cfoutput></h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="inventory_list.cfm">Equipment</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Repair Log</li>
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
        <div class="col-md-12"> 
					<div class="portlet">
						<div class="portlet-body">
                        <cfoutput query="get_this_equipment">
		<table class="table table-striped table-hover">
        <tbody>
          <tr>
              <td>Product Name</td>
              <td>#PRODUCT_NAME#</td>
              <td>Equipment ID</td>
              <td>#EQUIPMENT_ID#</td>
            </tr>
            <tr>
              <td>Description</td>
              <td>#PRODUCT_DESCRIPTION#</td>
              <td>Branch Name</td>
              <td>#BRANCH_NAME#</td>
            </tr>
            <tr>
              <td>Date Purchased</td>
              <td>#DateFormat(DATE_PURCHASED, "mm/dd/yyyy")#</td>
              <td>Crew Assignment</td>
              <td>#Crew_assignment_last#
                <CFIF  get_this_equipment.Crew_assignment_last EQ "">
                  -
                  <cfelse>
                  <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
              WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
             </cfquery>
                  #get_branch_employees_allocated.fullname#
                </CFIF>
              </td>
            </tr>
            <tr>
              <td>Serial ##</td>
              <td>#SERIAL_NUMBER#</td>
              <td>Cost</td>
              <td>#COST#</td>
            </tr>
               <tr>
              <td>Initial Diagnosis</td>
              <td colspan="3">#initial_diagnosis#</td>
            </tr>
           </table>
        </cfoutput>	
         <div class="spacer20"></div>
           <cfoutput query="get_repair_log">
        <table class="table table-striped table-hover">
        <tbody>
                 <tr>
                <td colspan="4"><cfif completionDate NEQ ""><strong class="text-danger">The repair is completed and Repair Log is Closed. </strong></cfif></td>
              </tr>
         
            <tr>
              <td>Date accepted as repair</td>
              <td colspan="6">#DateFormat(acceptDate, "mm/dd/yyyy")#</td>
            </tr>
            <tr>
              <td>Description of repair</td>
              <td colspan="6">#repair_description#</td>
            </tr>
            <tr>
              <td>Estimated date of completion</td>
              <td colspan="6">#DateFormat(estimated_comp_Date, "mm/dd/yyyy")#</td>
            </tr>
            <tr>
              <td>Outside repair?</td>
              <td colspan="6">
                  <cfif OUTSIDE_REPAIR EQ 1>Yes<cfelse>No</cfif> 
                 </td>
            </tr>
            <tr>
              <td>If outside, name of vendor</td>
              <td colspan="6">#vendorName#</td>
            </tr>
            <tr>
              <td>Labor hours</td>
              <td colspan="6">#laborHours#</td>
            </tr>
       <tr>
              <td>Parts used</td>
              <td colspan="6"> 
<cfquery name="get_repair_log_p" datasource="jrgm">
 SELECT    ID, repair_log_id, Equipment_ID, parts1, parts2, parts3, parts4, parts5, parts6, parts7, parts8
FROM         equipment_repair_log_parts    WHERE repair_log_id = #ID#        
</cfquery>
#get_repair_log_p.parts1#, #get_repair_log_p.parts2#, #get_repair_log_p.parts3#, #get_repair_log_p.parts4#, #get_repair_log_p.parts5#, #get_repair_log_p.parts6#, #get_repair_log_p.parts7#, #get_repair_log_p.parts8#
       </td>
             </tr> 
            <tr>
              <td>Total labor</td>
              <td colspan="6">$
              #totalLabor#</td>
            </tr>
            <tr>
              <td>Total parts</td>
              <td colspan="6">$
             #totalParts# </td>
            </tr>
            <cfif totalLabor EQ "">
              <CFSET totalLabor =0>
            </cfif>
            <cfif totalParts EQ "">
              <CFSET totalParts =0>
            </cfif>
            <CFSET totalCost =  totalLabor+totalParts>
            <tr>
              <td>Total cost of repair</td>
              <td colspan="6">$
                #totalCost# </td>
            </tr>
           
            <tr>
              <td>Recommend for replacement</td>
              <td colspan="6">
                   <cfif recommend_replace EQ 1>Yes<cfelse>No</cfif> 
                </td>
            </tr>
            <tr>
              <td>Is repair completed?</td>
              <td><cfif completionDate EQ "">No<cfelse>Yes</cfif> 
        </td>
            </tr>
             <tr>
              <td>Completion date</td>
              <td colspan="6">#DateFormat(completionDate, "mm/dd/yyyy")#</td>
            </tr>
            </tbody>
           </table></cfoutput>														
					  </div>
					</div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> 
<i class="icon-arrow-up"></i> </div>

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