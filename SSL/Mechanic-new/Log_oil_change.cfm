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
<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees 
</cfquery>
<cfquery name="get_all_equipment_info" datasource="jrgm"  >
SELECT  ID, Branch_name, Category, Product_description, Product_name,   
                      Equipment_ID, Inspection_Due,     Serial_number,  Tags_expire, 
                      Equipment_Year, engine_cycle, Crew_assignment_last,    hours_mileage, mileage_eq, hours_eq, 
                      oil_change_date_due, oil_change_hours_due, oil_change_mileage_due, last_oil_change_date, last_oil_change_hours, last_oil_change_miles, 
                      last_oil_change_employee_id 
 FROM equipment  WHERE  branch_name IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>
<CFSET mylist ="0">
<cfloop query="get_all_equipment_info">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>

 <cfquery name="get_oil_changes" datasource="jrgm">
SELECT      ID, equipment_id, oil_change_date, last_oil_change_employee_id, last_oil_change_mileage, last_oil_change_hours, enter_date, entered_by
FROM         equipment_oil_changes   WHERE equipment_id IN (#mylist#)
ORDER BY  oil_change_date DESC
</cfquery>

<!DOCTYPE html>

<!--[if IE 8]> <html> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]>
<html lang="en">

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
        <h1>Oil Change Log - <cfoutput>#get_oil_changes.recordcount#</cfoutput> Oil Changes </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="inventory_list.cfm">Equipment</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Oil Change Log</li>
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
           <!-- BEGIN EXAMPLE TABLE PORTLET-->
          <div class="portlet">
            <div class="portlet-body">
               <table class="table table-striped table-bordered table-hover" id="sample_3"  width="90%">
                <thead>
                  <tr>
                <!---    <th align="left">ID</th>--->
                    <th align="left">Oil Change Date</th>
                    <th align="left">Branch</th>
                    <th align="left">DBID</th>
                    <th align="left">Equipment ID</th>
                    <th align="left">Category</th>
                    <th align="left">Oil Change By</th>
                    <!---  <th align="left">Hours/Miles</th>--->
                  </tr>
                </thead>
                <tbody>
                  <cfoutput  query="get_oil_changes"  >
                    <cfif last_oil_change_employee_id  EQ 0>
                      <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #entered_by# 
 </cfquery>
                      <cfelse>
                      <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #last_oil_change_employee_id# 
 </cfquery>
                    </cfif>
                    <tr>
                     <!--- <td>#ID#</td>--->
                      <td nowrap="nowrap">#dateformat(oil_change_date,"mm/dd/yy")#</td>
                      <td align="left">#get_branch_employees_cache.branch#</td>
                      <td>#equipment_id#</td>
                      <cfquery name="get_equipment_info_cache"   dbtype="query">
SELECT   Equipment_ID , Category FROM get_all_equipment_info
WHERE  ID =  #Equipment_ID#
 </cfquery>
                       <td><a href="history_allocation.cfm?ID=#equipment_id#">#get_equipment_info_cache.equipment_id#</a></td>
                      <td>#get_equipment_info_cache.Category#</td>
                      <td align="left">#get_branch_employees_cache.fullname#</td>
                      <!--- <cfif  get_equipment_info_cache.Category EQ  'Vehicles'>
              <td align="left">#dateformat(oil_change_date,"mm/dd/yy")#</td>
              <cfelse>
              <td align="left">#last_oil_change_hours#</td>
              </cfif>--->
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
            </div>
          </div>
          <!-- END EXAMPLE TABLE PORTLET--> 
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
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --><script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
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