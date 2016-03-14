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



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management Inventory</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/equipment.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad_equipment.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
.bluebutton2 {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background:-moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color:#8299bb;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #3f4b5b;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	text-align: center;
	padding:3px 10px;
	text-decoration:none;
	margin-right: 10px;
	margin-bottom: 10px;
}
.bluebutton2 a {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #496a99), color-stop(1, #8299bb) );
	background:-moz-linear-gradient( center top, #496a99 5%, #8299bb 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#496a99', endColorstr='#8299bb');
	background-color:#496a99;
	text-decoration: none;
}
.bluebutton2 a:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #496a99), color-stop(1, #8299bb) );
	background:-moz-linear-gradient( center top, #496a99 5%, #8299bb 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#496a99', endColorstr='#8299bb');
	background-color:#496a99;
	text-decoration: none;
}.bluebutton2:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Equipment Information</div>
      <div class="spacer20"></div>
      
      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"  width="35%">
          <div class="allocate_equip">
          <div class="job_data_header">Allocation</div>
              <form action="history_allocation.cfm"  name="allocateform" method="post">    
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" nowrap="nowrap" class="alltable">Allocated to:</td>
                <td class="alltable">
                <cfif getequipment_this.Crew_assignment_last  EQ 3> Spare<cfelseif getequipment_this.Crew_assignment_last  EQ 5>Seasonal<cfelseif getequipment_this.Crew_assignment_last  EQ 6>Lost<cfelse>
                  <cfoutput > #get_allocated_employee.fullname#</cfoutput></cfif></td></tr>
               <tr>
                  <td align="left" class="alltable">Reallocate to :</td>
                <td class="alltable"><div class="equip_form">
        <select    name="employeeID"  onchange="this.form.submit();" class="select_element"  >
           <option   selected="selected">Please Choose</option>
           <option   value ="3"  <cfif getequipment_this.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
            <option   value ="5"  <cfif getequipment_this.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
            <option   value ="6"  <cfif getequipment_this.Crew_assignment_last  EQ 6> selected="selected"</cfif>>Lost</option>
          <cfoutput query="get_branch_employees"> 
          <option value="#employee_id#" 
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option></cfoutput>
            </select></div></td>
              </tr>
    <cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
                <input type="hidden"  name="submitted" value="yes"/>    
                        <input type="hidden"  name="assignment" value="yes"/>    
             </table> </form></div>
               <div class="spacer20"></div>
            <div class="job_data_header">Equipment Information</div>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" class="alltable2">DBID</td>
                <td class="alltable2"><cfoutput>#url.ID#</cfoutput></td>
                <td align="left" class="alltable2">Date Created</td>
                <td class="alltable2"><cfoutput>#dateformat(getequipment_this.Date_Created,"mm/dd/yy")# </cfoutput> </td>
              </tr>
                <tr>
                <td align="left" class="alltable2">Branch</td>
                <td colspan="3" class="alltable2"><cfoutput>#getequipment_this.branch_name#</cfoutput></td>
              </tr>
              <tr>
                <td align="left" class="alltable2">Equipment Status</td>
                <td colspan="3" class="alltable2">	<cfif getequipment_this.inventory_status EQ 1>
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
                <td align="left" class="alltable2"  nowrap="nowrap">Initial Diagnosis</td>
                <td colspan="3" class="alltable2"><cfoutput>#getequipment_this.initial_diagnosis#</cfoutput>
               </td>
              </tr>
                 </cfif>
              
               <tr>
                <td align="left" class="alltable2">Equipment ID</td>
                <td colspan="3" class="alltable2"><cfoutput>#getequipment_this.Equipment_ID#</cfoutput></td>
              </tr>
              <tr>
                <td align="left" class="alltable2">Product Name</td>
                <td colspan="3" class="alltable2"><cfoutput>#getequipment_this.Product_name#</cfoutput></td>
              </tr>
              <tr>
                <td align="left" class="alltable2">Description</td>
                <td colspan="3" class="alltable2"><cfoutput>#getequipment_this.Product_description#</cfoutput></td>
              </tr>
          <form action="history_allocation.cfm"  name="allocateform" method="post">    
           <tr>
                <td align="left" class="alltable2">Hours</td>
                <td colspan="3" class="alltable2"> <input name="hours_eq" type="text"   tabindex="5" value="<cfoutput>#getequipment_this.hours_eq#</cfoutput>" size="6" maxlength="6"/>&nbsp;
                  <input name="submit2" type="submit" class="bluebutton2" id="submit2" value="Update Hours" /></td>
              </tr>
                 <cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
            <input type="hidden" name="Hours"  value="yes" />
            </form>
                     <form action="history_allocation.cfm"  name="allocateform" method="post">    
              <tr>
                <td align="left" class="alltable2">Mileage</td>
                <td colspan="3" class="alltable2"> <input name="mileage_eq" type="text"   tabindex="5" value="<cfoutput>#getequipment_this.mileage_eq#</cfoutput>" size="8" maxlength="8"/> <input name="submit3" type="submit" class="bluebutton2"  value="Update Mileage" /></td>
              </tr>
                   <cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
            <input type="hidden" name="Mileage"  value="yes" />
              </form>
            </table>
            <div class="spacer20"></div>
            <div class="headerbutton">Notes</div><div class="bluebuttonRT"><a href="note_addnote.cfm?ID=<cfoutput>#ID#</cfoutput>" class="bluebuttonNR" >Add Notes</a></div>
 <cfquery name="get_this_equipment_notes" datasource="jrgm">
SELECT * FROM equipment_history WHERE equipment_id = #ID#
order by  enter_date DESC, ID DESC
      </cfquery>
       <cfif get_this_equipment_notes.recordcount EQ 0>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <span class="arialfont">No Notes Information</span> </td>
  </tr>
</table>
                 <cfelse>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <cfoutput query="get_this_equipment_notes">   
           <tr>
                <td class="alltable2">#dateformat(enter_date,"mm/dd/yy")# - #equipment_notes#</td>
              </tr></cfoutput>
            </table>
            </cfif></td>
          <td valign="top">
          <div class="equip_rtcol">
           <cfif  NOT IsDefined("url.showrepairloginfo")>
          <a href="history_allocation.cfm?showrepairloginfo=yes&ID=<cfoutput>#ID#</cfoutput>" class="bluebutton">File a Repair Report or Change Status</a>
          </cfif>
            
              <cfif IsDefined("url.showrepairloginfo")>
             <div class="damaged_equip">
           <div class="damaged_header">Repair Information</div>
          <form method="post" action="history_allocation.cfm?equipment_ID=<cfoutput>#ID#</cfoutput>"   >
             
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="alltable">Status :</td>
                    <td class="alltable"><div class="equip_form">
                    <select name="inventory_status" class="select_element"    tabindex="5">
                       <option value="1" <cfif getequipment_this.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                       <option value="2"  <cfif getequipment_this.inventory_status EQ '2'> selected="selected"</cfif>>Pending Repair</option>
                      <option value="3"  <cfif getequipment_this.inventory_status EQ '3'> selected="selected"</cfif>>In Repair</option>
                     <option value="5"  <cfif getequipment_this.inventory_status EQ '5'> selected="selected"</cfif>>Completed Repair</option> 
                  </select></div>
                 </td>
                  </tr>
                  <tr>
                  <td class="alltable" colspan="2">Description:
                    <div class="equip_form"><textarea  name="initial_diagnosis" cols="5" rows="5" class="textarea"> </textarea></div>
                  </td></tr>
                </table>
                <div class="spacer10"></div>
                <input name="submit" type="submit" class="bluebutton" id="submit" value="Submit">
            <cfoutput>  <input type="hidden" name="EquipmentID"  value="#ID#" /></cfoutput>
            <input type="hidden" name="repair"  value="yes" />
             </form></div>
             <div class="spacer20"></div>
              </cfif>
             <div class="job_data_header">Repair Log History</div>
 <cfquery name="get_this_equipment_history_repair" datasource="jrgm">
SELECT * FROM equipment_repair_log WHERE equipment_ID = #ID#   
order by id desc
             </cfquery>
              <cfif get_this_equipment_history_repair.recordcount EQ 0>
                <span class="arialfont">No Repair Log Information</span>
                <cfelse>
            <table border="0" width="100%" cellpadding="0" cellspacing="0" class="sortable">
               <thead>
              <tr>
                <th align="left">ID </th>
                <th align="left">Damage Date</th>
                <th align="left">Final Diagnosis</th>
              </tr>
              </thead>
             <tbody>
            <cfoutput query="get_this_equipment_history_repair">
              <tr >
                <td ><a href="repairLog_view.cfm?ID=#ID#&equipmentid=#url.id#">#ID#</a></td>
                <td>#DateFormat(get_this_equipment_history_repair.acceptdate, "mm/dd/yyyy")#</td>
                <td>#get_this_equipment_history_repair.repair_description#</td>
              </tr></cfoutput>
               </tbody>
            </table>
            </cfif>
                <div class="spacer20"></div>
           <div class="headerbutton">Oil Change History</div><div class="bluebuttonRT"><a href="oil_change_info_equipment.cfm?ID=<cfoutput>#ID#</cfoutput>"  class="bluebuttonNR">Add Oil Change</a></div>
 
       <cfquery name="get_this_equipment_oilchange" datasource="jrgm">
SELECT * FROM equipment_oil_changes WHERE equipment_id = '#getequipment_this.Equipment_ID#' OR equipment_id = '#url.ID#'
order by  oil_change_date DESC
      </cfquery>
      <cfif get_this_equipment_oilchange.recordcount EQ 0><br /><br /><br />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <span class="arialfont">No Oil  Change Information</span> </td>
  </tr>
</table>
         <cfelse>
             <table border="0" width="100%" cellpadding="0" cellspacing="0" class="sortable">
               <thead>
              <tr>
                <th align="left">Oil Change Date</th>
                 <th align="left">Done By</th>
                 <th align="left">Entered By</th>
                <th align="left">Mileage</th>
                <th align="left">Hours</th>
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
     <!---        Inspections --->
     
 <div class="spacer20"></div>
           <div class="headerbutton">Inspection History</div><div class="bluebuttonRT"><a href="inspection_info_equipment.cfm?ID=<cfoutput>#ID#</cfoutput>"  class="bluebuttonNR">Add Inspection</a></div>
 
       <cfquery name="get_this_equipment_inspection" datasource="jrgm">
SELECT * FROM equipment_inspections WHERE equipment_id = '#getequipment_this.Equipment_ID#' OR equipment_id = '#url.ID#'
order by  inspection_date DESC
      </cfquery>
      <cfif get_this_equipment_inspection.recordcount EQ 0><br /><br /><br />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <span class="arialfont">No Inspection Information</span> </td>
  </tr>
</table>
         <cfelse>
             <table border="0" width="100%" cellpadding="0" cellspacing="0" class="sortable">
               <thead>
              <tr>
                <th align="left">Inspection Date</th>
                <th align="left">Entered By</th>
                <th align="left">Mileage</th>
                <th align="left">Hours</th>
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
            <div class="spacer20"></div></div></td>
        </tr>
      </table>
      <p> 
       </p><br />
<br />
<br />
 
    </div>
  </div>
  <!-- end outer div -->
  <div id="clearfooter"></div>
  <!-- to clear footer --> 
</div>
<!-- end outer div --> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script src="js/jquery.pageslide.min.js"></script>
<script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
