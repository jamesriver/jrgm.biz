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
        <h1>JRGM Branch Directory</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="directory.cfm">Directory</a><i class="fa fa-circle"></i> </li>
          <li class="active"> JRGM Materials</li>
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
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
							<div class="panel-group accordion" id="accordion1">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">
										<cfoutput>#SESSION.branch#</cfoutput> Branch Employees </a>
										</h4>
									</div>
									<div id="collapse_1" class="panel-collapse in">
										<div class="panel-body">
                                         <div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="sample_1">
							<thead>
								<tr>
									
									
									<th align="left">Last Name</th>
                                    <th align="left">First Name</th>
                                    <th align="left">Emp ID</th>
									<th align="left">Position</th>
									<th align="left">Branch</th>
									<th align="left"> Work Cell Phone</th>
									
									<th align="left"> Personal Cell Phone</th>
									
									<th align="left">Home Phone</th>
									<th align="left">Email</th>
								</tr>
							</thead>
							<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position, [Ph Cell] AS cellphonep, [Employee ID] As employee_id,email, [Ph Home] AS homephone, Phone_Cell  AS cellphonew FROM APP_employees
 WHERE branch = '#SESSION.branch#'  AND    active_record = 1
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
							<tbody>
								<cfoutput query="get_branch_employees"> 
									<tr>
										
										
										<td>#last_name#</td>
                                        <td>#first_name#</td>
                                        <td>#employee_id#</td>
										<td>#Position#</td>
										 <td>#branch#</td>
										<td>#cellphonew#</td>
										
										<td>#cellphonep#</td>
										
										<td>#homephone#</td>
										<td><a href="mailto:#email#">#email#</a></td> 
									</tr>
								</cfoutput>
							</tbody>
							</table></div>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_3">
										<cfoutput>#SESSION.branch#</cfoutput> Branch Jobs </a>
										</h4>
									</div>
									<div id="collapse_3" class="panel-collapse collapse">
										<div class="panel-body">
                                         <div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="sample_3">
												<thead>
													<tr>
														
														<th align="left">Job Name</th>
                                                        <th align="left">Job ID</th>
														<th align="left">Address</th>
														<th align="left">City</th>
														<th align="left">State</th>
														<th align="left">Notes</th>
													</tr>
												</thead>
												<cfquery name="get_branch_jobs" datasource="jrgm"     >
												SELECT ID, [Job ID] as jobid, [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
												FROM APP_jobs  
												WHERE branch = '#SESSION.branch#'  AND    active_record = 1
												ORDER by  locationname ASC
												</cfquery>
												<tbody>
													<cfoutput query="get_branch_jobs"> 
													<tr>
													
													<td>#locationname#</td>
                                                    <td>#jobid#</td>
													<td>#jobaddress1#</td>
													<td>#jobcity#</td>
													<td>VA</td>
													<td><a href="job_details.cfm?work_date=#todayDate#&job_id=#get_branch_jobs.jobid#">Notes</a></td>
													</tr>
													</cfoutput>
												</tbody>
											</table></div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_4">
										JRGM Materials </a>
										</h4>
									</div>
									<div id="collapse_4" class="panel-collapse collapse">
										<div class="panel-body">
                                         <div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="sample_3">
												<thead>
													<tr>
														<th align="left">Item ID</th>
														<th align="left">Item Description</th>
													</tr>
												</thead>
													<cfquery name="get_materials" datasource="jrgm"  >
													SELECT   Item_ID, Item_grouping, Item_description 
													FROM         app_materials_list
													ORDER by  Item_ID ASC
													</cfquery>
												<tbody>
													<cfoutput query="get_materials"> 
													<tr>
														<td>#Item_ID#</td>
														<td>#Item_description#</td>
													</tr>
													</cfoutput>
												</tbody>
											</table></div>
										</div>
									</div>
								</div>
								
							</div>
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

<!-- BEGIN FOOTER --> 
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