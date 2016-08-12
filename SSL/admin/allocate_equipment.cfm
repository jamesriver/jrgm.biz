<cfif IsDefined("form.EMPLOYEEID") AND form.EMPLOYEEID EQ 'Please Choose'> 

<cflocation url="allocate_equipment.cfm?ID=#EQUIPMENTID#&branch=#url.branch#">
</cfif>

<cfif IsDefined("form.EquipmentID")>
<cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  crew_assignment_last = #form.EMPLOYEEID#
 WHERE ID=#form.EquipmentID#
</cfquery>
<cfquery name="update_allocation_history" datasource="jrgm"  >
INSERT INTO equipment_allocation_history
(equipment_id, assign_date, employee_id, modified_by_employee_id)
VALUES
(#form.EquipmentID#, GetUTCDate(), #form.EMPLOYEEID#, #SESSION.userid#)
</cfquery>

<cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
<CFSET url.id =form.EquipmentID>
 </cfif>
 
<cfif IsDefined("url.id")>
<cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#url.id#
</cfquery>
<cfelse>
<CFSET url.id =form.EquipmentID>
</cfif>

<!--- <cfdump var="#getequipment_this#"> --->


<CFSET crew_assignment_last = #getequipment_this.COMPUTED_COLUMN_14#>

<!--- Get Employee List --->
<cfquery name="get_all_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#url.branch#'  AND    active_record = 1
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<cfset employees = StructNew()>
<cfloop query="get_all_employees">
    <cfset StructInsert(employees, employee_id, fullname)>
</cfloop>
<cfset StructInsert(employees, '', '')>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />

<style>
.clockoutb {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#b92723;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	padding:10px 31px;
	margin-top:40px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}.clockoutb:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background:-moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color:#d17e85;
}.clockoutb:active {
	position:relative;
	top:1px;
}
</style>


</head>
<body onblur="self.focus();"> 
<div id="outerfull">
<div id="centrecontent"><!--centre content goes here -->
  <div class="centrecontent_inner_pop">  
     <div class="header">Equipment Allocation</div>
    <!---  <cfoutput>#get_branch_employees.employee_id#</cfoutput> --->
    <form   method="post" action="allocate_equipment.cfm?branch=<cfoutput>#url.BRANCH#</cfoutput>"   onSubmit="setTimeout('window.close()',1000)">
    <table border="0" cellspacing="0" cellpadding="0" >
  
       <td><img src="images/clear.gif" width="20" height="1" /></td>
       <td valign="top">
       <table border="0" cellspacing="0" cellpadding="0" >
         <tr>
           <td class="statusTD_right" align="right"><strong>Equipment ID :<br />
           </strong></td>
           <td class="statusTD_right" ><cfoutput>#url.ID#</cfoutput></td>
         </tr>
         <tr>
           <td class="statusTD_right" align="right"><strong>Description :<br />
           </strong></td>
           <td class="statusTD_right"><cfoutput>#getequipment_this.product_name#</cfoutput></td>
         </tr>
         <tr>
           <td class="statusTD_right" align="right"><strong>Branch :</strong></td>
           <td class="statusTD_right"><cfoutput>#url.branch#</cfoutput></td>
         </tr>
       <tr>
         <td class="statusTD_right" align="right"><strong>Status :</strong></td>
         <td class="statusTD_right">
		 <cfif getequipment_this.inventory_status EQ 1>
                Active
                <cfelseif getequipment_this.inventory_status EQ 2>
				Pending Repair
                <cfelseif getequipment_this.inventory_status EQ 3>
				In Repair
                <cfelseif getequipment_this.inventory_status EQ 0>
				Inactive
                     <cfelseif getequipment_this.inventory_status EQ 5>
				Completed Repair
				<cfelse>Active
                </cfif></td>
       </tr>
       <tr>
         <td class="statusTD_right"><strong>Assign To :</strong></td>
         <td class="statusTD_right">
         <select name="employeeID" >
           <option   selected="selected">Please Choose</option>
           <option   value ="3"  <cfif getequipment_this.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
           <option   value ="5"  <cfif getequipment_this.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
           <option   value ="6"  <cfif getequipment_this.Crew_assignment_last  EQ 6> selected="selected"</cfif>>Lost</option>
          <cfoutput query="get_branch_employees"> 
          <option value="#employee_id#" 
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option></cfoutput>
            </select></td>
       </tr>
       </table><br />
       <div align="right"><cfoutput>  <input type="hidden" name="EquipmentID" id="submit" value="#ID#" /></cfoutput>
    <input type="submit" name="submit" id="submit" value="Submit">
    <button type="button" onClick="javascript:window.close()">Close</button>
        </div>
      </td></tr></table></form>

 <cfquery name="get_allocation_history" datasource="jrgm"  >
SELECT * FROM equipment_allocation_history
WHERE   equipment_id=#url.id#
ORDER BY assign_date DESC
</cfquery>

<br />
Allocation History
      <hr />
<cfoutput query="get_allocation_history">
    #DateFormat(assign_date, 'mm/dd/yyyy')# - #employees[employee_id]#
    <cftry>
        <cfif employees[modified_by_employee_id] NEQ ''>
            (assigned by #employees[modified_by_employee_id]#)
        </cfif>
        <cfcatch></cfcatch>
    </cftry>
    <br />
</cfoutput>
  <!-- to clear footer -->
</div>

 <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
