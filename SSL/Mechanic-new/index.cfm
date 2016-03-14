 
<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>



<cfset Session.acceptDate =  "">
 <cfset Session.repair_description ="" > 
 <cfset Session.estimated_comp_Date = "" > 
 <cfset Session.vendorName  = "" > 
 <cfset Session.laborHours = "0" > 
 <cfset Session.totalLabor  ="0" > 
 <cfset Session.totalParts  =  "0" > 
  <cfset Session.completionDate  = "" > 
  <cfset Session.repair_log_ip  = "1" > 
  
 <cfset Session.parts1  = "" >
 <cfset Session.parts2   = "" >
 <cfset Session.parts3   = "" >
 <cfset Session.parts4   = "" >
 <cfset Session.parts5   = "" >
 <cfset Session.parts6   = "" >
 <cfset Session.parts7   = "" >
 <cfset Session.parts8   = "" >
 

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
<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" class="init">

$(document).ready(function() {
	$('table.display').dataTable();
} );

	</script>
<!-- END THEME STYLES -->
</head>
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
     <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="page-title">
        <h1>Dashboard <small><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></small></h1>
      </div> 
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Dashboard </li>
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
     <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3  AND BRANCH_NAME IN   (#PreserveSingleQuotes(branchlist)#) 
 </cfquery>
   <h4>Equipment Currently in Repair for <cfoutput> #branchlistalt#</cfoutput> - <small><cfoutput>#get_this_equipment_in_repair.recordcount#</cfoutput> items</small></h4> 
            
             <div class="table-responsive">
             <table class="table table-striped table-hover" id="sample_2">
                <thead>
                  <tr>
                  <th>Date Sent <br />to Mechanic</th>
                    <th>ID</th>
       
   <th>Category</th>
   <th >EQID</th> 
   <th>Product Name</th> 
   <th>Serial Number</th>  
   <th>Year</th>
    <th>Branch</th>
    <th>Status</th>
    <th>Allocated To</th>
  <th>Repair Log</th> 
     <th>Notes</th>
     <th>Repair History</th>
                  </tr>
                </thead>
                 <tbody>  
  <cfoutput query="get_this_equipment_in_repair">
   <tr>
   <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
    <td>#ID#<!--- <a href="inventory_edit.cfm?ID=#ID#">#ID#</a> ---></td>
    
    <td>#Category#</td>
    <td >#Equipment_ID#</td>
  <td ><a href="inventory_view.cfm?ID=#ID#">#Product_Name#</a></td>
   <td>#Serial_Number#</td>    
     <td>#Equipment_Year#</td>
    <cfif get_this_equipment_in_repair.BRANCH_NAME EQ 'Newport News'>
      <CFSET branchnew = "NEWP" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Charlottesville'>
      <CFSET branchnew = "CHAR" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Williamsburg'>
      <CFSET branchnew = "WMBG" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Richmond'>
      <CFSET branchnew = "RICH" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Portsmouth'>  
      <CFSET branchnew = "PORT" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Chesterfield'> 
      <CFSET branchnew = "CHES" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Corporate'> 
      <CFSET branchnew = "CORP" >
      <cfelse>
      <CFSET branchnew = #Left(get_this_equipment_in_repair.BRANCH_NAME,4)# >
    </cfif>
    <td nowrap="nowrap">#branchnew#</td>
    <td><cfif inventory_status EQ 1>
                Active
                <cfelseif inventory_status EQ 2>
				Pending Repair
                <cfelseif inventory_status EQ 3>
				In Repair
                <cfelseif inventory_status EQ 0>
				Inactive
                   <cfelseif inventory_status EQ 5>
			Completed Repair
				<cfelse>Active
                </cfif>
      </td>
  
  <cfif  get_this_equipment_in_repair.Crew_assignment_last  EQ "">
         <td>Unallocated</td> 
            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 3>
                  <td>Spare</td> 
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 4>
                  <td>Inactive</td> 
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 5>
                  <td>Seasonal</td>
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 6>
                  <td>Lost</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td>#get_branch_employees_cache.fullname#</td>
                        </cfif> 
  <cfif repair_log_ip EQ 1> 
  <td><a href="repairLog.cfm?ID=#get_this_equipment_in_repair.ID#"   >Open Log</a></td>
 <cfelse>
 <td><a href="repairLog.cfm?ID=#get_this_equipment_in_repair.ID#"  >Start New Log</a></td>
 </cfif>
      <td align="center"><a href="note_addnote.cfm?ID=#ID#"><i class="fa fa-plus"></i></a></td> 
      <td><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td>
   </tr>
  </cfoutput></tbody>
</table> </div>
<div class="spacer40"></div>
     <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="50">
SELECT * FROM equipment WHERE     repair_last_completed_date IS NOT NULL
AND    Branch_name  IN   (#PreserveSingleQuotes(branchlist)#)
ORDER by repair_last_completed_date DESC
 </cfquery>
 
   <h4>Equipment Recently Repaired for <cfoutput> #branchlistalt# </cfoutput> - <small><cfoutput>#get_this_equipment_in_repair_recent.recordcount#</cfoutput> items</small> (Showing Last 50)</h4>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="sample_2">
 <thead> 
<tr> 
<th>Date Sent <br />
    to Mechanic</th>
   <th>ID</th> 
       
   <th>Category</th>
   <th>EQID</th> 
   <th>Product Name</th> 
   <th>Serial Number</th>  
   <th>Year</th>
    <th>Branch</th>
    <th>Status</th>
    <th>Allocated To</th>
  <th>Repair Log</th> 
     <th>Notes</th>
     <th>Repair History</th>
      </tr> 
</thead> 
      <tbody>  
  <cfoutput query="get_this_equipment_in_repair_recent">
   <tr>
    <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
    <td>#ID#<!--- <a href="inventory_edit.cfm?ID=#ID#">#ID#</a> ---></td>
 
    <td>#Category#</td>
    <td >#Equipment_ID#</td>
  <td ><a href="inventory_view.cfm?ID=#ID#">#Product_Name#</a></td>
   <td>#Serial_Number#</td>    
     <td>#Equipment_Year#</td>
    <cfif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Newport News'>
      <CFSET branchnew = "NEWP" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Charlottesville'>
      <CFSET branchnew = "CHAR" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Williamsburg'>
      <CFSET branchnew = "WMBG" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Richmond'>
      <CFSET branchnew = "RICH" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Portsmouth'>  
      <CFSET branchnew = "PORT" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Chesterfield'> 
      <CFSET branchnew = "CHES" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Corporate'> 
      <CFSET branchnew = "CORP" >
      <cfelse>
      <CFSET branchnew = #Left(get_this_equipment_in_repair_recent.BRANCH_NAME,4)# >
    </cfif>
    <td nowrap="nowrap">#branchnew#</td>
    <td><cfif inventory_status EQ 1>
                Active
                <cfelseif inventory_status EQ 2>
				Pending Repair
                <cfelseif inventory_status EQ 3>
				In Repair
                <cfelseif inventory_status EQ 0>
				Inactive
			      <cfelseif inventory_status EQ 5>
			Completed Repair
				<cfelse>Active
                </cfif>
      </td>
         <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
         <td>Unallocated</td> 
             <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                  <td>Spare</td> 
                    <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                  <td>Inactive</td> 
                   <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                  <td>Seasonal</td> 
                     <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                  <td>Lost</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td>#get_branch_employees_cache.fullname#</td>
                      </cfif>

<cfquery name="get_accept_date2"    datasource="jrgm"  maxrows="1" >
SELECT   ID,acceptdate  FROM equipment_repair_log
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                       <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td> 
                             <td align="center"><a href="note_addnote.cfm?ID=#ID#"><i class="fa fa-plus"></i></a></td> 
      <td><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td>
   </tr>
  </cfoutput></tbody>
</table> </div>

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