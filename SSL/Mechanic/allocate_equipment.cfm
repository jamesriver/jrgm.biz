<cfif IsDefined("form.EquipmentID")>
<cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  crew_assignment_last = #form.EMPLOYEEID#
 WHERE ID=#form.EquipmentID#
</cfquery>
<cfquery name="getequipment_this" datasource="jrgm">
SELECT active ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND ID=#form.EquipmentID#
</cfquery>
<CFSET url.id =form.EquipmentID>
 </cfif>
 
<cfif IsDefined("url.id")>
<cfquery name="getequipment_this" datasource="jrgm">
SELECT active ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND ID=#url.id#
</cfquery>
<cfelse>
<CFSET url.id =form.EquipmentID>
</cfif>

<!--- <cfdump var="#getequipment_this#"> --->


<CFSET crew_assignment_last = #getequipment_this.COMPUTED_COLUMN_14#>

<!--- Get Employee List --->
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1
 ORDER by  Last_name ASC,first_name ASC
</cfquery>

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
</head>
<body>
<div id="outerfull">
<div id="centrecontent"><!--centre content goes here -->
  <div class="centrecontent_inner_pop">  
     <div class="header">Equipment Allocation</div>
     
    <!---  <cfoutput>#get_branch_employees.employee_id#</cfoutput> --->
    <form   method="post" action="allocate_equipment.cfm"   onSubmit="setTimeout('window.close()',1000)">
    <table border="0" cellspacing="0" cellpadding="0" ><tr>
      <td>
       <table border="0" cellspacing="0" cellpadding="0" >
       <tr><td class="statusTD">Equipment ID</td>
       <td class="statusTD_right"><cfoutput>#url.ID#</cfoutput></td></tr>
       <tr><td class="statusTD">Description</td>
       <td class="statusTD_right"><cfoutput>#getequipment_this.product_name#</cfoutput></td></tr>
       </table></td>
       <td><img src="images/clear.gif" width="20" height="1" /></td>
       <td valign="top">
       <table border="0" cellspacing="0" cellpadding="0" >
       <tr>
         <td class="statusTD_right">Assign To</td>
         <td class="statusTD_right"><select name="employeeID" >
           <option   <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>Please Choose</option>
           <option value ="1"  <cfif get_branch_employees.employee_id  EQ 1>selected="selected"</cfif>>Pending</option>
          <option value ="2"   <cfif get_branch_employees.employee_id  EQ 2>selected="selected"</cfif>>Repair</option>
         <option   value ="3"  <cfif get_branch_employees.employee_id  EQ 3>selected="selected"</cfif>>Spare</option>
           <option   value ="4"  <cfif get_branch_employees.employee_id  EQ 4>selected="selected"</cfif>>Inactive</option>
          <cfoutput query="get_branch_employees"> 
          <option value="#employee_id#" 
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option></cfoutput>
            </select></td>
       </tr>
       </table>
       <p><div align="right">
      <cfoutput>  <input type="hidden" name="EquipmentID" id="submit" value="#ID#" /></cfoutput>
    <input type="submit" name="submit" id="submit" value="Submit">
    <button type="button" onClick="javascript:window.close()">Close</button>
       
       </div>
       
       </p></td></tr></table></form><br />
 

<cfquery name="get_branch_employees_now" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE   [Employee ID] =#getequipment_this.COMPUTED_COLUMN_14#
</cfquery>

<!--- <cfdump var="#get_branch_employees_now#"> --->

<table width="700" border="0" cellpadding="0" cellspacing="5" class="clockoutb">
  <tr>
    <td><cfif get_branch_employees_now.recordcount EQ 0>Equipment Is Unassigned 
	<cfelse>Equipment Assigned to <cfoutput>#get_branch_employees_now.fullname#</cfoutput></cfif>&nbsp;</td>
  </tr>
</table>

  </div>  </div>
  <!-- to clear footer -->
</div>

 <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
