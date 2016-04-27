<cfif IsDefined('form.branch')>
    <cfset SESSION.branch = form.branch>
</cfif>
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
        <h1>Equipment Inventory List</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="inventory_list.cfm">Equipment</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Equipment Inventory List</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">

    <div class="row">
       <div class="col-md-7">
            <form id="form_branch" method="post">
            Switch to view a different branch:
                <select name="branch"   tabindex="5" onChange="document.getElementById('form_branch').submit()">
                    <option value="Corporate" <cfif SESSION.branch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                    <option value="Charlottesville" <cfif SESSION.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <option value="Chesterfield" <cfif SESSION.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <option value="Newport News" <cfif SESSION.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth" <cfif SESSION.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond" <cfif SESSION.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                </select>
            </form>
            </br ><br />
        </div>
      </div>
      
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-7"> 
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                         <cfquery name="get_einventories" datasource="jrgm">
SELECT      ID, inventory_date, inventory_branch, inventory_user, inventory_status, inventory_filter
FROM         inventory_report_list  WHERE  inventory_branch ='#SESSION.branch#'
AND inventory_status IS NOT NULL
</cfquery>
		<table class="table table-striped table-hover" id="sample_5">
   <thead>
          <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Branch</th>
                <th>Filter</th>
            <th>Inventory Taker</th>
             <th>View</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput  query="get_einventories"  >
            <tr>
              <td>#id#</td>
              <td nowrap="nowrap">#dateformat(inventory_date,"mm/dd/yy")#</td>
              <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #inventory_user# 
 </cfquery>
              <td>#get_branch_employees_cache.branch#</td>
<cfif get_einventories.inventory_filter EQ "">             
  
               <td>All</td>
              <cfelse> 
                <cfquery name="get_branch_employees_cache2"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #inventory_filter#   
 </cfquery>
     <td>#get_branch_employees_cache2.fullname#</td>              
               </cfif>
  <cfquery name="get_branch_employees_cache3"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #inventory_user# 
 </cfquery>      
                  <td>#get_branch_employees_cache3.fullname#</td>
               <td><a href="inventory_report_printable_eversion1_output.cfm?ID=#ID#" target="_blank" >View</a></td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
    
																			
							
						</div>
					</div>
					<!-- END ACCORDION PORTLET-->
          
        </div>
        <div class="col-md-1"> 
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                       
                        
                        
                        </div></div></div>
        
        <div class="col-md-4"> 
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                       
                        <p><a href="inventory_report_printable.cfm" target="_blank" class="btn btn-primary">
										    Start an Equipment Inventory Report</a>&nbsp;&nbsp;<em>(Printable) </em></p>
						<p><a href="inventory_report_printable_eversion1.cfm" target="_blank" class="btn btn-primary">
						  Start an Equipment Inventory Report</a>&nbsp;&nbsp;<em>(Electronic)</em></p>
                        
                        </div></div></div>
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
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
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