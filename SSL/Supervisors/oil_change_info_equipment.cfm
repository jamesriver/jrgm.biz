 <cfif IsDefined("form.EquipmentID")>
 <CFSET EquipmentID =form.EquipmentID>
 </cfif>
 
 <cfif IsDefined("url.ID")>
 <CFSET EquipmentID =url.ID>
 </cfif>
 
 <cfif IsDefined("form.submit")>
<cfquery name="insert_eq_table" datasource="jrgm"  >
INSERT INTO equipment_oil_changes (EQUIPMENT_ID,enter_date, last_oil_change_employee_id,oil_change_date,
last_oil_change_mileage,LAST_OIL_CHANGE_HOURS,entered_by)   
VALUES 
('#form.EquipmentID#',CURRENT_TIMESTAMP,'#EMPLOYEEID#', '#form.oil_change_date#',
'#form.LAST_OIL_CHANGE_MILEAGE#',   '#form.LAST_OIL_CHANGE_HOURS#','#SESSION.userid#')
  </cfquery>
  
  <!--- <cfif IsDefined("form.EquipmentID")  AND NOT  IsDefined("form.repair")  AND IsDefined("form.hours_eq")> --->
 <cfif  form.LAST_OIL_CHANGE_HOURS EQ "">
 <CFSET form.LAST_OIL_CHANGE_HOURS =0>
  </cfif>

  <cfif  form.LAST_OIL_CHANGE_MILEAGE EQ "">
 <CFSET form.LAST_OIL_CHANGE_MILEAGE =0>
 </cfif>

<cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  last_oil_change_hours = #form.LAST_OIL_CHANGE_HOURS# , last_oil_change_miles = #form.LAST_OIL_CHANGE_MILEAGE# ,last_oil_change_date ='#form.oil_change_date#'
 WHERE ID=#form.EquipmentID#
</cfquery> 
  <cflocation url="history_allocation.cfm?ID=#form.EquipmentID#">
   </cfif> 
<cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#EquipmentID#
</cfquery>
 <!---  <cfdump   var="#getequipment_this#">  
 ---> <CFSET crew_assignment_last = #getequipment_this.COMPUTED_COLUMN_14#>  
 
<cfif IsDefined("url.id")>
<cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#url.id#
</cfquery>
<cfelse>
<CFSET url.id =form.EquipmentID>
</cfif>

 

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
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />

<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>

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
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm"><br />
  <div class="centrecontent_inner_pop">  <br />
<br />
<br />
<br />

     <div class="header">Enter Oil Change Information</div>
     <form   class="css_form"  method="post" action="oil_change_info_equipment.cfm"  >
    <table border="0" cellspacing="0" cellpadding="0" ><tr>
   
       <td><img src="images/clear.gif" width="20" height="1" /></td>
       <td valign="top">
       <table border="0" cellspacing="0" cellpadding="0" >
         <tr>
           <td class="statusTD_right"><strong>Equipment ID :</strong></td>
           <td class="statusTD_right"><cfoutput>#url.ID#</cfoutput></td>
         </tr>
         <tr>
           <td class="statusTD_right"><strong>Description :</strong></td>
           <td class="statusTD_right"><cfoutput>#getequipment_this.product_name#</cfoutput></td>
         </tr>
         <tr>
           <td class="statusTD_right"><strong>Date Oil Changed:</strong></td>
           <td class="statusTD_right"><input type="text" id="datepicker" name="oil_change_date" />
            </td>
         </tr>
       <tr>
         <td class="statusTD_right"><strong>Oil Changed By:</strong></td>
         <td class="statusTD_right">
           <select name="employeeID" >
               <option   selected="selected" value="0" >Please Choose</option>
             <cfoutput query="get_branch_employees"> 
               <option value="#employee_id#" 
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option></cfoutput>
             </select>
           </td>
       </tr>
       <tr>
         <td class="statusTD_right"><strong>Hours:</strong></td>
         <td class="statusTD_right"><input name="last_oil_change_hours" type="text" size="8" maxlength="8" /></td>
       </tr>
       <tr>
         <td class="statusTD_right"><strong>Mileage:</strong></td>
         <td class="statusTD_right"><input name="last_oil_change_mileage" type="text" size="10" maxlength="10" /></td>
       </tr>
       </table>
        <div align="right">
      <cfoutput>  <input type="hidden" name="EquipmentID" id="submit" value="#ID#" /></cfoutput>
    <input name="submit" type="submit" class="bluebutton" id="submit" value="Submit">
     
        </div>
         </td></tr></table></form> 
   <br />
  </div>  </div>
  <!-- to clear footer -->
</div>
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
