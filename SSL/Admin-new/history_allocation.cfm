<CFSET todaydate =  DateFormat(now(), "mm/dd/yyyy")>
<!---  <cfparam  name="Session.mileage_eq" default=""  > 
 <cfparam  name="Session.hours_eq" default=""  > --->

<cfif IsDefined("form.repair")>
  <cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  initial_diagnosis = '#form.initial_diagnosis#' , inventory_status =#form.inventory_status#
<cfif form.inventory_status EQ 3>,date_sent_to_mechanic ='#todaydate#'</cfif>
 WHERE ID=#form.EquipmentID#
</cfquery>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq, Date_Created, BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST,initial_diagnosis
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
  <CFSET url.id =form.EquipmentID>
</cfif>
<cfif IsDefined("form.EquipmentID")  AND NOT  IsDefined("form.repair")  AND IsDefined("form.assignment")>
  <cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  crew_assignment_last = #form.EMPLOYEEID# 
 WHERE ID=#form.EquipmentID#
</cfquery>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq, Date_Created, BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
  <CFSET url.id =form.EquipmentID>
</cfif>
<cfif IsDefined("form.EquipmentID")  AND NOT  IsDefined("form.repair")  AND IsDefined("form.hours_eq")>
  <cfif  form.hours_eq EQ "">
    <CFSET form.hours_eq =0>
  </cfif>
  <cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  hours_eq = #form.hours_eq# 
 WHERE ID=#form.EquipmentID#
</cfquery>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq, Date_Created, BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
  <CFSET url.id =form.EquipmentID>
</cfif>
<cfif IsDefined("form.EquipmentID")  AND NOT  IsDefined("form.repair")  AND IsDefined("form.mileage_eq")>
  <cfif  form.mileage_eq EQ "">
    <CFSET form.mileage_eq =0>
  </cfif>
  <cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  mileage_eq = #form.mileage_eq# 
 WHERE ID=#form.EquipmentID#
</cfquery>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq, Date_Created, BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
  <CFSET url.id =form.EquipmentID>
</cfif>
<cfif IsDefined("url.id")>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq, Date_Created,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST,initial_diagnosis
  FROM equipment WHERE 0=0 AND ID=#url.id#
</cfquery>
  <cfelse>
  <CFSET url.id =form.EquipmentID>
</cfif>
<CFSET crew_assignment_last = #getequipment_this.COMPUTED_COLUMN_15#>

<!--- Get Employee List --->
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<cfquery name="get_allocated_employee" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1 AND     [Employee ID]  = #crew_assignment_last#
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<!DOCTYPE html>
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
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
</head>
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
        <h1>Equipment Information</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="inventory_list.cfm">Equipment</a><i class="fa fa-circle"></i> </li>
        <li class="active"> Equipment Information</li>
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
			<div class="portlet">
				<div class="portlet-body">
					
					
					<div class="row">
						<div class="col-md-5">
							<div class="portlet box blue-madison">
						<div class="portlet-title">
                          <div class="caption">Allocation</div>
</div>
                        <div class="portlet-body form"> 
                                <!-- BEGIN FORM-->
                                <form action="history_allocation.cfm"  name="allocateform" class="form-horizontal form-row-seperated" method="post">
                            <div class="form-body">
                                    <div class="form-group">
                                <label class="control-label col-md-3">Allocated to:</label>
                                <div class="col-md-8">
                                        <label class="control-label">
                                    <cfif getequipment_this.Crew_assignment_last  EQ 3>
                                            Spare
                                            <cfelseif getequipment_this.Crew_assignment_last  EQ 5>
                                            Seasonal
                                            <cfelseif getequipment_this.Crew_assignment_last  EQ 6>
                                            Lost
                                            <cfelse>
                                            <cfoutput > #get_allocated_employee.fullname#</cfoutput>
                                          </cfif>
                                  </label>
                                      </div>
                              </div>
                                    <div class="form-group">
                                <label class="control-label col-md-3">Reallocate to:</label>
                                <div class="col-md-8">
                                        <select    name="employeeID"  onchange="this.form.submit();" class="bs-select form-control"  >
                                    <option   selected="selected">Please Choose</option>
                                    <option   value ="3"  <cfif getequipment_this.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
                                    <option   value ="5"  <cfif getequipment_this.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
                                    <option   value ="6"  <cfif getequipment_this.Crew_assignment_last  EQ 6> selected="selected"</cfif>>Lost</option>
                                    <cfoutput query="get_branch_employees">
                                            <option value="#employee_id#"
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option>
                                          </cfoutput>
                                  </select>
                                        <cfoutput>
                                    <input type="hidden" name="EquipmentID"  value="#ID#" />
                                  </cfoutput>
                                        <input type="hidden"  name="submitted" value="yes"/>
                                        <input type="hidden"  name="assignment" value="yes"/>
                                      </div>
                              </div>
                                  </div>
                          </form>
                                <!-- END FORM--> </div>
					</div>
					<!-- END UNORDERED LISTS PORTLET-->
                    <!-- BEGIN EQUIPMENT INFORMATION-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Equipment Information</div>
						</div>
						<div class="portlet-body">
                      
                <table class="table large" >
             <tbody>
             <tr>
                <td>DBID</td>
                <td><cfoutput>#url.ID#</cfoutput></td>
                <td >Date Created</td>
                <td><cfoutput>#dateformat(getequipment_this.Date_Created,"mm/dd/yy")# </cfoutput> </td>
              </tr>
                <tr>
                <td>Branch</td>
                <td colspan="3"><cfoutput>#getequipment_this.branch_name#</cfoutput></td>
              </tr>
              <tr>
                <td >Equipment Status</td>
                <td colspan="3">	<cfif getequipment_this.inventory_status EQ 1>
                Active
                <cfelseif  getequipment_this.inventory_status EQ 2>
				Pending Repair
                <cfelseif  getequipment_this.inventory_status EQ 3>
				In Repair
                <cfelseif  getequipment_this.inventory_status EQ 0>
				Inactive
                  <cfelseif  getequipment_this.inventory_status EQ 5>
				Completed Repair
				<cfelse>Active
                </cfif> </td>
              </tr>
              <cfif  getequipment_this.inventory_status EQ 2>   
               <tr>
                <td  nowrap="nowrap">Initial Diagnosis</td>
                <td colspan="3"><cfoutput>#getequipment_this.initial_diagnosis#</cfoutput>
               </td>
              </tr>
                 </cfif>
              
               <tr>
                <td>Equipment ID</td>
                <td colspan="3"><cfoutput>#getequipment_this.Equipment_ID#</cfoutput></td>
              </tr>
              <tr>
                <td>Product Name</td>
                <td colspan="3"><cfoutput>#getequipment_this.Product_name#</cfoutput></td>
              </tr>
              <tr>
                <td>Description</td>
                <td colspan="3"><cfoutput>#getequipment_this.Product_description#</cfoutput></td>
              </tr>
          <form action="history_allocation.cfm"  name="allocateform" method="post">    
         <cfif getequipment_this.category NEQ 'Vehicles'>  <tr>
                <td>Hours</td>
                <td colspan="3"> <input name="hours_eq" type="text" class="form-control input-inline input-small" placeholder="Enter hours" tabindex="5" value="<cfoutput>#getequipment_this.hours_eq#</cfoutput>" size="4" maxlength="6"/>&nbsp;
                  <input name="submit2" type="submit" class="btn blue-madison" id="submit2" value="Update Hours" /></td>
              </tr>
                 <cfoutput>  <input type="hidden" name="EquipmentID" class="form-control"  value="#ID#" /></cfoutput>
            <input type="hidden" name="Hours"  value="yes" />
            </form>
            </cfif>
                     <form action="history_allocation.cfm"  name="allocateform" method="post">    
              <tr>
                <td>Mileage</td>
                <td colspan="3"> <input name="mileage_eq" type="text" class="form-control input-inline input-small"  placeholder="Enter mileage"  tabindex="5" value="<cfoutput>#getequipment_this.mileage_eq#</cfoutput>" size="2" maxlength="8"/> <input name="submit3" type="submit" class="btn blue-madison"  value="Update Mileage" /></td>
              </tr>
                   <cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
            <input type="hidden" name="Mileage"  value="yes" />
              </form>
            </table>
						</div>
					</div>
					<!-- END EQUIPMENT INFORMATION-->
                    
                    <!-- BEGIN NOTES PORTLET-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Notes</div>
                            <div class="actions"> <a href="note_addnote.cfm?ID=<cfoutput>#ID#</cfoutput>" class="btn btn-circle btn-default"> Add Notes </a> </div>
						</div>
						<div class="portlet-body">
                        <cfquery name="get_this_equipment_notes" datasource="jrgm">
SELECT * FROM equipment_history WHERE equipment_id = #ID#
order by  enter_date DESC, ID DESC
      </cfquery>
       <cfif get_this_equipment_notes.recordcount EQ 0>
       <p>No Notes Information</span> </p>
                 <cfelse>
                <table class="table large" >
							
             <tbody>
          <cfoutput query="get_this_equipment_notes">   
           <tr>
                <td >#dateformat(enter_date,"mm/dd/yy")# - #equipment_notes#</td>
              </tr></cfoutput>
            </table>
            </cfif>
						</div>
					</div>
					<!-- END NOTES-->
						</div>
						<div class="col-md-7">
                        <cfif  NOT IsDefined("url.showrepairloginfo")>
          <a class="btn blue-madison" href="history_allocation.cfm?showrepairloginfo=yes&ID=<cfoutput>#ID#</cfoutput>">File a Repair Report or Change Status</a><BR><br>
          </cfif>
          <cfif IsDefined("url.showrepairloginfo")>
          <form method="post" action="history_allocation.cfm?equipment_ID=<cfoutput>#ID#</cfoutput>"   >
          <div class="panel panel-warning">
			<div class="panel-heading">
										<h3 class="panel-title"><strong>Repair Information</strong></h3>
									</div>
			<div class="panel-body">
			<table class="table large" >
                  <tr>
                    <td>Status :</td>
                    <td>
                    <select name="inventory_status" class="bs-select form-control"    tabindex="5">
                       <option value="1" <cfif getequipment_this.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                       <option value="2"  <cfif getequipment_this.inventory_status EQ '2'> selected="selected"</cfif>>Pending Repair</option>
                      <option value="3"  <cfif getequipment_this.inventory_status EQ '3'> selected="selected"</cfif>>In Repair</option>
                     <option value="5"  <cfif getequipment_this.inventory_status EQ '5'> selected="selected"</cfif>>Completed Repair</option> 
                  </select>
                 </td>
                  </tr>
                  <tr>
                  <td colspan="2">Description:
                    <textarea  name="initial_diagnosis" cols="5" rows="5" class="form-control"> </textarea>
                  </td></tr>
                  <tr>
                  <td colspan="2"><div align="right"><input name="submit" type="submit" class="btn blue-madison" id="submit" value="Submit"><cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
            <input type="hidden" name="repair"  value="yes" /></div>
                  </td></tr>
                </table>			 
           
             </div></div></form>
              </cfif>
								
							<!-- BEGIN Repair Log History PORTLET-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Repair Log History</div>
						</div>
						<div class="portlet-body">
                        <cfquery name="get_this_equipment_history_repair" datasource="jrgm">
SELECT * FROM equipment_repair_log WHERE equipment_ID = #ID#   
order by id desc
             </cfquery>
              <cfif get_this_equipment_history_repair.recordcount EQ 0>
                <p>No Repair Log Information</p>
                <cfelse>
                <table class="table large" >
							<thead>
              <tr>
                <th>ID </th>
                <th >Damage Date</th>
                <th>Final Diagnosis</th>
              </tr>
              </thead>
             <tbody>
            <cfoutput query="get_this_equipment_history_repair">
              <tr>
                <td ><a href="repairLog_view.cfm?ID=#ID#&equipmentid=#url.id#">#ID#</a></td>
                <td>#DateFormat(get_this_equipment_history_repair.acceptdate, "mm/dd/yyyy")#</td>
                <td>#get_this_equipment_history_repair.repair_description#</td>
              </tr></cfoutput>
               </tbody>
            </table>
            </cfif>
						</div>
					</div>
					<!-- END REPAIR LOG HISTORY-->
                    	<!-- BEGIN OIL CHANGE History PORTLET-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Oil Change History</div>
                            <div class="actions"> <a href="oil_change_info_equipment.cfm?ID=<cfoutput>#ID#</cfoutput>" class="btn btn-circle btn-default"> Add Oil Change </a> </div>
						</div>
						<div class="portlet-body">
                         <cfquery name="get_this_equipment_oilchange" datasource="jrgm">
SELECT * FROM equipment_oil_changes WHERE equipment_id = '#getequipment_this.Equipment_ID#' OR equipment_id = '#url.ID#'
order by  oil_change_date DESC
      </cfquery>
      <cfif get_this_equipment_oilchange.recordcount EQ 0>
      <p>No Oil  Change Information</p>
      <cfelse>
                <table class="table large" >
							<thead>
               <tr>
                <th >Oil Change Date</th>
                 <th>Done By</th>
                 <th>Entered By</th>
                <th>Mileage</th>
                <th>Hours</th>
              </tr>
              </thead>
             <tbody>
          <cfoutput query="get_this_equipment_oilchange">    
            <tr >
                <td>#dateformat(get_this_equipment_oilchange.oil_change_date,"mm/dd/yy")#</td>
  <cfquery name="get_branch_employees_oc" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_this_equipment_oilchange.last_oil_change_employee_id#
 </cfquery>
                
                <td>#get_branch_employees_oc.fullname#</td>
                      <cfquery name="get_branch_employees_ocenter" datasource="jrgm" >
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  '#get_this_equipment_oilchange.entered_by#'
 </cfquery>
                
                <td>#get_branch_employees_ocenter.fullname#</td>
                <td>#get_this_equipment_oilchange.last_oil_change_mileage#</td>
                <td>#get_this_equipment_oilchange.last_oil_change_hours#</td>
              </tr>
          </cfoutput>
               </tbody>
            </table>
            </cfif>
						</div>
					</div>
					<!-- END OIL CHANGE HISTORY-->
                    	<!-- BEGIN INSPECTION History PORTLET-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Inspection History</div>
                            <div class="actions"> <a href="inspection_info_equipment.cfm?ID=<cfoutput>#ID#</cfoutput>" class="btn btn-circle btn-default"> Add Inspection </a> </div>
						</div>
						<div class="portlet-body">
                       <cfquery name="get_this_equipment_inspection" datasource="jrgm">
SELECT * FROM equipment_inspections WHERE equipment_id = '#getequipment_this.Equipment_ID#' OR equipment_id = '#url.ID#'
order by  inspection_date DESC
      </cfquery>
      <cfif get_this_equipment_inspection.recordcount EQ 0>
      <p>No Inspection Information</p>
      <cfelse>
                <table class="table large" >
							<thead>
              <tr>
                <th>Inspection Date</th>
                <th >Entered By</th>
                <th >Mileage</th>
                <th >Hours</th>
                </tr>
              </thead>
             <tbody>
          <cfoutput query="get_this_equipment_inspection">    
            <tr >
                <td>#dateformat(get_this_equipment_inspection.inspection_date,"mm/dd/yy")#</td>
  <cfquery name="get_branch_employees_inspect" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_this_equipment_inspection.entered_by#
 </cfquery>
                
                <td>#get_branch_employees_inspect.fullname#</td>
                <td>#get_this_equipment_inspection.inspection_mileage#</td>
                <td>#get_this_equipment_inspection.inspection_hours#</td>
              </tr>
          </cfoutput>
               </tbody>
            </table>
            </cfif>
						</div>
					</div>
					<!-- END INSPECTION HISTORY-->
             <cfif getequipment_this.category EQ 'Vehicles'>         
                       	<!-- BEGIN  Mileage History PORTLET-->
					<div class="portlet box blue-madison">
						<div class="portlet-title">
							<div class="caption">Mileage History From Inspection Reports</div>
                            <div class="actions">  </div>
						</div>
						<div class="portlet-body">
   <cfquery name="get_this_equipment_Miles" datasource="jrgm">
SELECT  Inspection_ID, Crew_LeaderID, Inspection_Date,Current_Mileage FROM app_Inspection_Master
WHERE Vehicle_Number =   '#getequipment_this.Equipment_ID#'    AND Inspection_Type  ='Morning'
order by  inspection_date DESC
      </cfquery>
  
      <cfif get_this_equipment_Miles.recordcount EQ 0>
      <p>No Mileage Information</p>
      <cfelse>
                <table class="table large" >
							<thead>
              <tr>
                <th>Inspection Date</th>
          <!---      <th >Entered By</th>--->
                <th >Mileage</th>
          
                </tr>
              </thead>
             <tbody>
          <cfoutput query="get_this_equipment_Miles">    
            <tr >
                <td>#dateformat(get_this_equipment_Miles.inspection_date,"mm/dd/yy")#</td>
  <!---<cfquery name="get_branch_employees_inspect" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_this_equipment_inspection.entered_by#
 </cfquery>
                
                <td>#get_branch_employees_inspect.fullname#</td>--->
                <td>#get_this_equipment_Miles.Current_Mileage#</td>
              
              </tr>
          </cfoutput>
               </tbody>
            </table>
            </cfif>
						</div>
					</div>
                    </cfif>
					<!-- END INSPECTION HISTORY-->
					</div>
			  </div>
				<!-- END PAGE CONTENT INNER -->
		</div>
	  </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
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
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {       
    // initiate layout and plugins
    Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
    // button state demo
    $('.demo-loading-btn')
      .click(function () {
        var btn = $(this)
        btn.button('loading')
        setTimeout(function () {
          btn.button('reset')
        }, 3000)
    });
});
</script>
</body>
<!-- END BODY -->
</html>