<!---<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2 >
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date>
<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >--->
<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch IN (#PreserveSingleQuotes(branchlist)#) 
 </cfquery>
<CFSET myemployeelist ="0">
<cfloop query="get_all_employee_info">
  <cfset myemployeelist = ListAppend(myemployeelist,Employee_ID)>
</cfloop>
<cfquery name="get_all_equipment_repair_log_info"    datasource="jrgm"   >
SELECT   ID,acceptdate,Equipment_ID,completionDate  FROM equipment_repair_log
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
 
<cfset todaydate = now() />
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
        <h1>Equipment Status</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Equipment</li>
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
          
          <!-- BEGIN PENDING REPAIR -->
					<div class="portlet">
						<div class="portlet-body">
                        <cfquery name="get_this_equipment_in_repair_pending" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 2  AND BRANCH_NAME IN (#PreserveSingleQuotes(branchlist)#) 
 </cfquery>
              <h4>Pending Repair</h4>
		
       <cfif get_this_equipment_in_repair_pending.recordcount EQ  0 >
                  There is no equipment pending repair
                  <cfelse>
                  <div class="table-responsive">
                 <table class="table table-striped table-hover" id="sample_3">
                    <thead>
                      <tr>
                      <th>Branch</th>
                       <th><div align="center">Date<br>Given to<br>Mechanic</div></th>
                          <th><div align="center">Date<br>Repair<br>Log Started</div></th>
                          <th><div align="center">Date<br>Repair<br>Completed</div></th>
                          <th><div align="center">Date<br>Pended<br>Repair</div></th>
                          <th>Repair<br>Log ID</th>
                          <th>Category</th>
                          <th>EQID</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th><div align="center">History</div></th>
                          <th><div align="center">Change</div></th>

                      </tr>
                    </thead>
                    <cfoutput query="get_this_equipment_in_repair_pending">
                      <tr>
                       <cfif BRANCH_NAME EQ 'Richmond' >
                          <CFSET branchnew = "RIC" >
                          <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                          <CFSET branchnew = "POR" >
                          <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                          <CFSET branchnew = "CVL" >
                          <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                          <CFSET branchnew = "WMB" >
                          <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                          <CFSET branchnew = "CHE" >
                          <cfelseif BRANCH_NAME EQ 'Newport News' >
                          <CFSET branchnew = "NEW" >
                          <cfelse>
                          <CFSET branchcode =00>
                        </cfif>
                        <td>#branchnew#</td>
                       <td><div align="center">NA</div></td>
                       <td><div align="center">NA</div></td>
                       <td><div align="center">NA</div></td>
                        <td><div align="center">#dateformat(pended_repair_date,"mm/dd/yy")#</div></td>
                        <td><div align="center">NA</div></td>
                        <td>#Category#</td>
                        <td>#Equipment_ID#</td>
                        <td>#Product_name#</td>
                        <cfif  get_this_equipment_in_repair_pending.Crew_assignment_last  EQ "">
                          <td>Unallocated</td>
                          <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 3>
                          <td>Spare</td>
                          <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 4>
                          <td>Inactive</td>
                          <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 5>
                          <td>Seasonal</td>
                          <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 6>
                          <td>Lost</td>
                          <cfelse>
                          <cfquery name="get_branch_employees_cache"   dbtype="query"  cachedWithin="#createTimeSpan( 0, 0, 0, 0 )#">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                          <td>#get_branch_employees_cache.employee_name#</td>
                        </cfif>
                        <td><div align="center"><a href= "history_allocation.cfm?ID=#ID#">History</a></div></td>
                        <td><div align="center">NA</div></td>
                      </tr>
                    </cfoutput>
                  </table>
                  </div>
                </cfif>

						</div>
					</div>
					<!-- END PEMDING REPAIR-->
                    <div class="spacer40"></div>
          <!-- BEGIN CURRENTLY IN REPAIR -->
					<div class="portlet">
						<div class="portlet-body">
                             <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3  AND
BRANCH_NAME IN (#PreserveSingleQuotes(branchlist)#) 
ORDER by ID DESC
 </cfquery>
   <h4>Currently in Repair</h4>
                  <!---  <cfdump var="#get_this_equipment_in_repair#"> --->
                  <cfif get_this_equipment_in_repair.recordcount EQ 0 >
                    There is no equipment currently in repair
                    <cfelse>
                    <div class="table-responsive">
                    <table class="table table-striped table-hover" id="sample_2">
                      <thead>
                        <tr>
                        <th>Branch</th>
                          <th><div align="center">Date<br>Given to<br>Mechanic</div></th>
                          <th><div align="center">Date<br>Repair<br>Log Started</div></th>
                          <th><div align="center">Date<br>Repair<br>Completed</div></th>
                          <th><div align="center">Date<br>Pended<br>Repair</div></th>
                          <th>Repair<br>Log ID</th>
                          <th>Category</th>
                          <th>EQID</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th><div align="center">History</div></th>
                          <th><div align="center">Change</div></th>
                        </tr>
                      </thead>
                      <tbody>
                      <cfoutput query="get_this_equipment_in_repair">
                         <cfif BRANCH_NAME EQ 'Richmond' >
                          <CFSET branchnew = "RIC" >
                          <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                          <CFSET branchnew = "POR" >
                          <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                          <CFSET branchnew = "CVL" >
                          <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                          <CFSET branchnew = "WMB" >
                          <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                          <CFSET branchnew = "CHE" >
                          <cfelseif BRANCH_NAME EQ 'Newport News' >
                          <CFSET branchnew = "NEW" >
                          <cfelse>
                          <CFSET branchcode =00>
                        </cfif>
                        <td>#branchnew#</td>
                          <td><div align="center">#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</div></td>
                          <cfquery name="get_accept_date"        dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #get_this_equipment_in_repair.ID#  AND   completionDate IS NULL
 ORDER by ID DESC
 </cfquery>
                          <cfif  get_accept_date.recordcount EQ 0>
                            <td><div align="center">Not Started</div></td>
                            <cfelse>
                            <td><div align="center">#dateformat(get_accept_date.acceptdate,"mm/dd/yy")#</div></td>
                          </cfif>
                             <td><div align="center">NA</div></td>
							<td><div align="center">NA</div></td>
                            <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&amp;equipmentid=#ID#"  target="_blank">#ID#</a></td>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
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
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><div align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></div></td>
                          <td><div align="center">NA</div></td>
                        </tr>
                      </cfoutput>
                        </tbody>
                      
                    </table>
                    </div>
                  </cfif>
						</div>
					</div>
					<!-- END CURRENTLY IN REPAIR-->
                    <div class="spacer40"></div>
                    
                    
                     <!--   RECENTLY COMPLETED REPAIRS  -->
                     <div class="portlet">
						<div class="portlet-body">
                  <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" >
SELECT * FROM equipment WHERE   inventory_status = 5
AND    BRANCH_NAME IN (#PreserveSingleQuotes(branchlist)#) 
ORDER by repair_last_completed_date DESC
 </cfquery>
 <h4>Recently Completed Repairs with Status "Completed Repair"   <span class="message">These Need a Status Change</span></h4>
                  <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                    There is no equipment with recently completed repairs that needs a status change.
                    <cfelse>
                    <div class="table-responsive">
                   <table class="table table-striped table-hover" id="sample_7">
                    <thead>
                        <tr>
                        <th>Branch</th>
                          <th><div align="center">Date<br>Given to<br>Mechanic</div></th>
                          <th><div align="center">Date<br>Repair<br>Log Started</div></th>
                          <th><div align="center">Date<br>Repair<br>Completed</div></th>
                          <th><div align="center">Date<br>Pended<br>Repair</div></th>
                          <th>Repair<br>Log ID</th>
                          <th>Category</th>
                          <th>EQID</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th><div align="center">History</div></th>
                          <th><div align="center">Change</div></th>
                        </tr>
                      </thead>
                      <tbody>
                        <cfoutput query="get_this_equipment_in_repair_recent">
                          <tr>
                           <cfif BRANCH_NAME EQ 'Richmond' >
                          <CFSET branchnew = "RIC" >
                          <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                          <CFSET branchnew = "POR" >
                          <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                          <CFSET branchnew = "CVL" >
                          <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                          <CFSET branchnew = "WMB" >
                          <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                          <CFSET branchnew = "CHE" >
                          <cfelseif BRANCH_NAME EQ 'Newport News' >
                          <CFSET branchnew = "NEW" >
                          <cfelse>
                          <CFSET branchcode =00>
                        </cfif>
                        <td>#branchnew#</td>
                            <td><div align="center">#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</div></td>
                            <td><div align="center">NA</div></td>
                            <td><div align="center">#dateformat(repair_last_completed_date,"mm/dd/yy")#</div></td>
                            <td><div align="center">NA</div></td>
                            <cfquery name="get_accept_date2"       dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                            <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&amp;equipmentid=#ID#">#ID#</a></td>
                            <td>#Category#</td>
                            <td>#Equipment_ID#</td>
                            <td>#Product_name#</td>
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
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                              <td>#get_branch_employees_cache.employee_name#</td>
                            </cfif>
                            <td><div align="center">&mdash;</div></td>
                            <td><div align="center"><a href="history_allocation.cfm?ID=#ID#">Change Status</a></div></td>
                          </tr>
                        </cfoutput>
                      </tbody>
                    </table>
                    </div>
                  </cfif>
                  
                  </div>
					</div>
                    <!--   END RECENTLY COMPLETED REPAIRS  -->
                    
                    
                    
                    <div class="spacer40"></div>
                  
                   <!--  RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  -->
                   <div class="portlet">
						<div class="portlet-body">
                    <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="20">
SELECT * FROM equipment WHERE   inventory_status = 1  AND repair_last_completed_date IS NOT NULL
AND    BRANCH_NAME IN (#PreserveSingleQuotes(branchlist)#) 
ORDER by repair_last_completed_date DESC
 </cfquery>
              <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                There is no equipment with recently completed repairs
                <cfelse>  <h4>Recently Completed Repairs with Status "Active" (Showing last 20) <span class="message">These Do Not Need a Status Change</span> </h4>
                  <div class="table-responsive">
                    <table class="table table-striped table-hover" id="sample_6">
                      <thead>
                        <tr>
                        <th>Branch</th>
                          <th><div align="center">Date<br>Given to<br>Mechanic</div></th>
                          <th><div align="center">Date<br>Repair<br>Log Started</div></th>
                          <th><div align="center">Date<br>Repair<br>Completed</div></th>
                          <th><div align="center">Date<br>Pended<br>Repair</div></th>
                          <th>Repair<br>Log ID</th>
                          <th>Category</th>
                          <th>EQID</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th><div align="center">History</div></th>
                          <th><div align="center">Change</div></th>
                        </tr>
                      </thead>
                      <tbody>
                    <cfoutput query="get_this_equipment_in_repair_recent">
                      <tr>
                      <cfif BRANCH_NAME EQ 'Richmond' >
                          <CFSET branchnew = "RIC" >
                          <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                          <CFSET branchnew = "POR" >
                          <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                          <CFSET branchnew = "CVL" >
                          <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                          <CFSET branchnew = "WMB" >
                          <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                          <CFSET branchnew = "CHE" >
                          <cfelseif BRANCH_NAME EQ 'Newport News' >
                          <CFSET branchnew = "NEW" >
                          <cfelse>
                          <CFSET branchcode =00>
                        </cfif>
                        <td>#branchnew#</td>
                       <td><div align="center">#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</div></td>
                       <td><div align="center">NA</div></td>
                       <td><div align="center">#dateformat(repair_last_completed_date,"mm/dd/yy")#</div></td>
                       <td><div align="center">NA</div></td>
                        <cfquery name="get_accept_date2" dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                        <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td>
                        <td>#Category#</td>
                        <td>#Equipment_ID#</td>
                        <td>#Product_name#</td>
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
                          <cfquery name="get_branch_employees_cache" dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                          <td>#get_branch_employees_cache.employee_name#</td>
                        </cfif>
                        <td><div align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></div></td>
                        <td><div align="center">&mdash;</div></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
                </div>
                              </cfif>
                              </div></div>
                               <!--  END RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  -->
                  
          
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