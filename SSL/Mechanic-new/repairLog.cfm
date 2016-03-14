<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfset StructDelete(Session,"repair_description")>
<cfset StructDelete(Session,"estimated_comp_Date")>
<cfparam  name="get_repairlog_info.recordcount" default="0"  >
<cfquery name="get_status" datasource="jrgm">
SELECT ID,Product_name,repair_log_ip FROM equipment  WHERE ID = #ID#  AND  repair_log_ip =1 
</cfquery>

<cfif get_status.repair_log_ip EQ 1>
  <cfquery name="get_repairlog_info" datasource="jrgm">
SELECT * FROM equipment_repair_log  WHERE Equipment_ID = #ID#  AND  repair_log_ip =1
</cfquery>
  <cfset Session.acceptDate =  #DateFormat(get_repairlog_info.acceptDate, "mm/dd/yyyy")#  >
  <cfset Session.repair_description = get_repairlog_info.repair_description>
  <cfset Session.estimated_comp_Date = #DateFormat(get_repairlog_info.estimated_comp_Date, "mm/dd/yyyy")#>
  <cfset Session.vendorName  = get_repairlog_info.vendorName >
  <cfset Session.laborHours = get_repairlog_info.laborHours>
  <cfset Session.totalLabor  = get_repairlog_info.totalLabor>
  <cfset Session.totalParts  = get_repairlog_info.totalParts>
  <cfset Session.completionDate  = #DateFormat(get_repairlog_info.completionDate, "mm/dd/yyyy")#>
  <cfset Session.outside_repair  = get_repairlog_info.outside_repair>
  <cfset Session.recommend_replace  = get_repairlog_info.recommend_replace>
  <cfset Session.repair_log_ip  = get_repairlog_info.repair_log_ip>
</cfif>
<cfparam  name="Session.acceptDate" default=""  >
<cfparam  name="Session.repair_description" default="">
<cfparam  name="Session.estimated_comp_Date" default="">
<cfparam  name="Session.vendorName" default=""  >
<cfparam  name="Session.laborHours" default="0"  >
<cfparam  name="Session.totalLabor" default="0"  >
<cfparam  name="Session.totalParts" default="0"  >
<cfparam  name="Session.totalCost" default="0"  >
<cfparam  name="Session.completionDate" default=""  >
<cfparam  name="Session.outside_repair" default="0"  >
<cfparam  name="Session.recommend_replace" default=""  >
<cfparam  name="Session.repair_log_ip" default="1"  >
<cfparam  name="Session.parts1" default="">
<cfparam  name="Session.parts2" default="">
<cfparam  name="Session.parts3" default="">
<cfparam  name="Session.parts4" default="">
<cfparam  name="Session.parts5" default="">
<cfparam  name="Session.parts6" default="">
<cfparam  name="Session.parts7" default="">
<cfparam  name="Session.parts8" default="">

<cfif IsDefined("form.btnSumit")  >
  <cfif form.totalLabor EQ "">
    <CFSET form.totalLabor =0>
  </cfif>
  <cfif form.totalParts EQ "">
    <CFSET form.totalParts =0>
  </cfif>
  <CFSET totalCost =  form.totalLabor+form.totalParts>
  <cfif form.inventory_status EQ "Y">
    <CFSET form.repair_log_ip =0>
  </cfif>
  <cfif form.inventory_status EQ "N">
    <CFSET form.repair_log_ip =1>
  </cfif>
  <cfif form.acceptDate EQ "">
    <CFSET form.acceptDate =#DateFormat(Now(),"mm/dd/yyyy")#>
  </cfif>
  <cfif form.completionDate EQ "">
    <CFSET form.completionDate =#DateFormat(Now(),"mm/dd/yyyy")#>
  </cfif>
  <cfif form.estimated_comp_date EQ "">
    <CFSET form.estimated_comp_date =#DateFormat(Now(),"mm/dd/yyyy")#>
  </cfif>
  
 <cfquery name="get_date_sent_to_mechanic" datasource="jrgm">
SELECT ID,Product_name,repair_log_ip,date_sent_to_mechanic,who_sent_to_mechanic FROM equipment  WHERE ID = #ID#  
</cfquery>

<CFIF  get_date_sent_to_mechanic.who_sent_to_mechanic NEQ "">
 <cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone, Phone_Cell As cellphone FROM APP_employees WHERE [Employee ID]=  #get_date_sent_to_mechanic.who_sent_to_mechanic# 
</cfquery>

<CFSET employeename = get_employee_info.employeename>
<CFSET cellphone = get_employee_info.cellphone>
<cfelse>
<CFSET employeename = "">
<CFSET cellphone = "">
</CFIF>

<cfif NOT IsDefined("form.update")  >
<cfif form.repair_log_ip EQ 0>
<cfquery name="do_insert" datasource="jrgm">
INSERT INTO equipment_repair_log (Equipment_ID,acceptDate, repair_description,estimated_comp_date,outside_repair,
vendorName, laborHours, totalLabor, totalParts, totalCost, completionDate, recommend_replace ,repair_log_ip,repair_log_user,date_sent_to_mechanic,who_sent_to_mechanic) 
VALUES (#ID#,'#acceptDate#','#repair_description#','#estimated_comp_date#','#outside_repair#',
'#vendorName#', '#laborHours#', '#totalLabor#', '#totalParts#', '#totalCost#','#completionDate#', '#recommend_replace#' ,'#repair_log_ip#',#SESSION.userid# 

<cfif  get_date_sent_to_mechanic.date_sent_to_mechanic NEQ "">
,'#DateFormat(get_date_sent_to_mechanic.date_sent_to_mechanic ,"mm/dd/yyyy")#'
<cfelse>
,NULL
</cfif>

<cfif  get_date_sent_to_mechanic.who_sent_to_mechanic NEQ "">
,#get_date_sent_to_mechanic.who_sent_to_mechanic#
<cfelse>
,NULL
</cfif>
)
</cfquery>
<cfquery name="update_EQ" datasource="jrgm"   >
 UPDATE equipment  SET
 repair_last_completed_date    = '#completionDate#', inventory_status =5
WHERE  ID=  #ID#
 </cfquery>
<cfelse>
 <cfquery name="do_insert" datasource="jrgm">
INSERT INTO equipment_repair_log (Equipment_ID,acceptDate, repair_description,estimated_comp_date,outside_repair,
vendorName, laborHours, totalLabor, totalParts, totalCost, completionDate, recommend_replace ,repair_log_ip,repair_log_user,date_sent_to_mechanic,who_sent_to_mechanic) 
VALUES (#ID#,'#acceptDate#','#repair_description#','#estimated_comp_date#','#outside_repair#',
'#vendorName#', '#laborHours#', '#totalLabor#', '#totalParts#', '#totalCost#',NULL, '#recommend_replace#' ,'#repair_log_ip#',#SESSION.userid#

<cfif  get_date_sent_to_mechanic.date_sent_to_mechanic NEQ "">
 ,'#DateFormat(get_date_sent_to_mechanic.date_sent_to_mechanic ,"mm/dd/yyyy")#'
<cfelse>
,NULL
</cfif>
<cfif  get_date_sent_to_mechanic.who_sent_to_mechanic NEQ "">
,#get_date_sent_to_mechanic.who_sent_to_mechanic#
<cfelse>
,NULL
</cfif>

)
</cfquery>


</cfif>
<cfquery name="get_max" datasource="jrgm">
SELECT MAX(ID) AS maxid FROM equipment_repair_log 
</cfquery>
<CFSET repair_log_id = get_max.maxid>
<cfquery name="do_insert_parts" datasource="jrgm">
INSERT INTO equipment_repair_log_parts (Equipment_ID,repair_log_id,parts1,parts2, parts3,parts4,parts5,
parts6, parts7, parts8) 
VALUES (#ID#,#repair_log_id#,'#parts1#','#parts2#','#parts3#','#parts4#',
'#parts5#', '#parts6#', '#parts7#', '#parts8#')
</cfquery>
</cfif>
<cfif   IsDefined("form.update")  >
<cfif form.repair_log_ip EQ 0>
<cfquery name="do_insert" datasource="jrgm">
UPDATE equipment_repair_log SET 
acceptDate = '#acceptDate#', 
repair_description =  '#repair_description#',
estimated_comp_date ='#estimated_comp_date#',
outside_repair='#outside_repair#',
vendorName='#vendorName#', 
laborHours='#laborHours#', 
totalLabor= '#totalLabor#', 
totalParts='#totalParts#', 
totalCost= '#totalCost#', 
completionDate='#completionDate#', 
 recommend_replace='#recommend_replace#' ,
repair_log_ip= '#repair_log_ip#',
repair_log_user= #SESSION.userid#
WHERE ID = #repair_log_id#
 </cfquery>
 <cfquery name="update_EQ" datasource="jrgm"   >
 UPDATE equipment  SET
 repair_last_completed_date    = '#completionDate#', inventory_status =5
WHERE  ID=  #ID#
 </cfquery>

 <cfelse>
<cfquery name="do_insert" datasource="jrgm">
UPDATE equipment_repair_log SET 
acceptDate = '#acceptDate#', 
repair_description =  '#repair_description#',
estimated_comp_date ='#estimated_comp_date#',
outside_repair='#outside_repair#',
vendorName='#vendorName#', 
laborHours='#laborHours#', 
totalLabor= '#totalLabor#', 
totalParts='#totalParts#', 
totalCost= '#totalCost#', 
recommend_replace='#recommend_replace#' ,
repair_log_ip= '#repair_log_ip#',
repair_log_user= #SESSION.userid#
WHERE ID = #repair_log_id#
 </cfquery>
</cfif>
 
 
<cfquery name="delete_parts" datasource="jrgm">
DELETE  FROM equipment_repair_log_parts WHERE repair_log_id =#REPAIR_LOG_ID#
</cfquery>
    <cfquery name="do_insert_parts" datasource="jrgm">
INSERT INTO equipment_repair_log_parts (Equipment_ID,repair_log_id,parts1,parts2, parts3,parts4,parts5,
parts6, parts7, parts8) 
VALUES (#ID#,#repair_log_id#,'#parts1#','#parts2#','#parts3#','#parts4#',
'#parts5#', '#parts6#', '#parts7#', '#parts8#')
</cfquery>
  </cfif>
  <cfquery name="do_update" datasource="jrgm">
UPDATE equipment SET  repair_log_ip =1 WHERE ID = #ID#
</cfquery>
  <cfif IsDefined("form.recommend_replace")  AND  form.recommend_replace EQ 1>
    <cfmail to="jbatterson@jrgm.com"    FROM="JRGM Alerts"   cc="patrick.hutchinson2@gmail.com" subject="Equipment Recommended for Replacement " type="html">
      <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
   <cfinclude template="footer-include.cfm">

      <br />
      <span class="arialfont">James,<br />
      <br />
      Mechanic #SESSION.screenname# has recommended #get_status.Product_name#- Equipment ID:#ID# for replacement.<br />
      See repair log #get_status.ID# for more information.</span><br />
      <br />
    </cfmail>
  </cfif>
  <cfquery name="get_repairlog_info" datasource="jrgm">
SELECT * FROM equipment_repair_log  WHERE ID = #repair_log_id#
</cfquery>
  <cfset Session.acceptDate =  #DateFormat(get_repairlog_info.acceptDate, "mm/dd/yyyy")#  >
  <cfset Session.repair_description = get_repairlog_info.repair_description>
  <cfset Session.estimated_comp_Date = #DateFormat(get_repairlog_info.estimated_comp_Date, "mm/dd/yyyy")#>
  <cfset Session.vendorName  = get_repairlog_info.vendorName >
   <cfset Session.laborHours = #NumberFormat(get_repairlog_info.laborHours,"9999.99")#>
  <cfset Session.totalLabor  = get_repairlog_info.totalLabor>
  <cfset Session.totalParts  = get_repairlog_info.totalParts>
  <cfset Session.totalCost  = get_repairlog_info.totalCost>
  <cfset Session.completionDate  = #DateFormat(get_repairlog_info.completionDate, "mm/dd/yyyy")#>
  <cfset Session.outside_repair  = get_repairlog_info.outside_repair>
  <cfset Session.recommend_replace  = get_repairlog_info.recommend_replace>
  <cfset Session.repair_log_ip  = get_repairlog_info.repair_log_ip>
  <cfquery name="get_parts" datasource="jrgm">
SELECT * FROM equipment_repair_log_parts  WHERE repair_log_id = #get_repairlog_info.ID#
</cfquery>
  <cfset Session.parts1  = get_parts.parts1 >
  <cfset Session.parts2  = get_parts.parts2 >
  <cfset Session.parts3  = get_parts.parts3 >
  <cfset Session.parts4  = get_parts.parts4 >
  <cfset Session.parts5  = get_parts.parts5 >
  <cfset Session.parts6  = get_parts.parts6>
  <cfset Session.parts7  = get_parts.parts7 >
  <cfset Session.parts8  = get_parts.parts8 >
</cfif>
<cfif IsDefined("url.id")>
  <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
 <CFIF  get_this_equipment.who_sent_to_mechanic NEQ "">
   <cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone, Phone_Cell As cellphone FROM APP_employees WHERE [Employee ID]=  #get_this_equipment.who_sent_to_mechanic#  
</cfquery>

<!---<cfdump var="#get_employee_info#">--->

  <CFSET ID =url.id>
  <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET employeename = "#get_employee_info.employeename#">
 <cfelse>
  <CFSET employeename = "">
  </cfif>
  
   <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET cellphone = "#get_employee_info.cellphone#">
 <cfelse>
  <CFSET cellphone = "">
  </cfif>
  
  <cfelse>
   <CFSET employeename = "">
<CFSET cellphone = "">
   </cfif> 
  
  <cfelseif IsDefined("form.id")>
  <cfquery name="get_this_equipment" datasource="jrgm">
 SELECT * FROM equipment WHERE ID = #form.id#
 </cfquery>
  <CFIF  get_this_equipment.who_sent_to_mechanic NEQ "">
  <cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone, Phone_Cell As cellphone FROM APP_employees WHERE [Employee ID]=  #get_this_equipment.who_sent_to_mechanic#  
</cfquery>
  <CFSET ID =form.id>
  <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET employeename = "#get_employee_info.employeename#">
 <cfelse>
  <CFSET employeename = "">
  </cfif>
    <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET cellphone = "#get_employee_info.cellphone#">
 <cfelse>
  <CFSET cellphone = "">
  </cfif> 
   <cfelse>
   <CFSET employeename = "">
<CFSET cellphone = "">
  
  </cfif>
  <cfelse>
   
   <cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">Z
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone, Phone_Cell As cellphone FROM APP_employees WHERE [Employee ID]=  #get_this_equipment.who_sent_to_mechanic#  
</cfquery>
   <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET employeename = "#get_employee_info.employeename#">
 <cfelse>
  <CFSET employeename = "">
  </cfif>
  
   <cfif  get_this_equipment.who_sent_to_mechanic NEQ "">
 <CFSET cellphone = "#get_employee_info.cellphone#">
 <cfelse>
  <CFSET cellphone = "">
  </cfif>
  
 
</cfif>
<!--- <cfdump var="#Session.repair_description#">--->
 
<!--- <cfabort> --->
<cfparam name="form.show"  default="active">
<cfparam name="getequipment.crew_assignment_last" default="0">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<script src="assets/admin/layout3/scripts/Jquery1.9.1.min.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/Jquerybvalidator.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/jquery.mask.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/JavaScript2.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="assets/admin/layout3/css/styles.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/form.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/bootstrap.css" rel="stylesheet" />
<link href="assets/admin/layout3/css/StyleSheet.css" rel="stylesheet" />
<link href="assets/admin/layout3/css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="assets/admin/layout3/css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.js"></script>
<link href="assets/admin/layout3/css/date.css" rel="stylesheet" />
<script type="text/javascript">
        $(document).ready(function () {
            $('#myform').bValidator();
        });
    </script>
<script type="text/javascript">
        $(function () {
            $("#acceptDate").datepicker();
              $("#estimated_comp_Date").datepicker();//{dateFormat: 'dd-mm-yy'});
            $("#completionDate").datepicker();
        });
    </script>
    <style>
.arialfontred {
	font: italic .7em Arial, Helvetica, sans-serif;
	color: red;
}
 </style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td  align="right"><a href="index.cfm">Home</a></td>
  </tr>
</table>

      <div class="header">
        <p>Repair Log</p>
        <cfoutput query="get_this_equipment">
          <table width="95%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td class="performance">Product Name</td>
              <td class="performance">#PRODUCT_NAME#</td>
              <td class="performance">Equipment ID</td>
              <td class="performance">#EQUIPMENT_ID#</td>
            </tr>
            <tr>
              <td class="performance">Description</td>
              <td class="performance">#PRODUCT_DESCRIPTION#</td>
              <td class="performance">Branch Name</td>
              <td class="performance">#BRANCH_NAME#</td>
            </tr>
            <tr>
              <td class="performance">Date Purchased</td>
              <td class="performance">#DateFormat(DATE_PURCHASED, "mm/dd/yyyy")#</td>
              <td class="performance">Crew Assignment</td>
              <td class="performance">#Crew_assignment_last#
                <CFIF  get_this_equipment.Crew_assignment_last EQ "">
                  -
                  <cfelse>
                  <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
              WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
             </cfquery>
                  #get_branch_employees_allocated.fullname#
                </CFIF>
              </td>
            </tr>
            <tr>
              <td class="performance">Serial ##</td>
              <td class="performance">#SERIAL_NUMBER#</td>
              <td class="performance">Cost</td>
              <td class="performance">#COST#</td>
            </tr>
               <tr>
                 <td class="performance">Placed into Repair by</td>
                 <td class="performance">#employeename#</td>
                 <td class="performance">Cell Phone</td>
                 <td class="performance">#cellphone#</td>
               </tr>
               <tr>
              <td class="performance">Initial Diagnosis</td>
              <td class="performance" colspan="3">#initial_diagnosis#</td>
            </tr>
            <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ "Y">
    <cfquery name="do_update" datasource="jrgm">
UPDATE equipment SET  repair_log_ip =0, inventory_status =5  WHERE ID = #ID#
</cfquery>
              <tr>
                <td class="performance" colspan="4">The repair is completed and Repair Log is closed. Go to <a href="index.cfm">home</a> screen.</td>
              </tr>
              <cfabort>
            </cfif>
          </table>
        </cfoutput>
        <div class="spacer40"></div>
        <form method="post" action="repairLog.cfm">
          <table width="95%" border="0" cellpadding="0" cellspacing="0">
            
            <tr>
              <td valign="middle" class="performance">Date accepted as repair</td>
              <td colspan="6" valign="middle" class="performance"><input name="acceptDate" type="text" id="acceptDate"  <cfoutput>value="#Session.acceptDate#"</cfoutput>/>
              &nbsp; &nbsp; <span class="arialfontred">(mm/dd/yyyy)</span></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Description of repair</td>
              <td colspan="6" valign="middle" class="performance"><textarea name="repair_description" id="repair_description" cols="60" rows="5"><cfoutput>#Session.repair_description#</cfoutput></textarea></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Estimated date of completion</td>
              <td colspan="6" valign="middle" class="performance"><input type="text" name="estimated_comp_Date" id="estimated_comp_Date" size="24" <cfoutput>value="#Session.estimated_comp_Date#"</cfoutput>/>
              &nbsp; &nbsp; <span class="arialfontred">(mm/dd/yyyy)</span></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Outside repair?</td>
              <td colspan="6" valign="middle" class="performance"><div class="radio">
                  <input id="outside_Y" type="radio" name="outside_repair" value="1"   <cfif Session.OUTSIDE_REPAIR EQ 1>checked="checked"</cfif>/>
                  <label for="outside_Y">Yes</label>
                  <input id="outside_N" type="radio" name="outside_repair" value="0"  <cfif Session.OUTSIDE_REPAIR NEQ 1>checked="checked"</cfif>/>
                  <label for="outside_N">No</label>
                </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">If outside, name of vendor</td>
              <td colspan="6" valign="middle" class="performance"><input name="vendorName" type="text" id="vendorName" size="24" <cfoutput>value="#Session.vendorName#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Labor hours</td>
              <td colspan="6" valign="middle" class="performance"><input name="laborHours" type="text" id="laborHours"  size="24" <cfoutput>value="#NumberFormat(Session.laborHours,"9999.99")#"</cfoutput>/></td> 
            </tr>
            <tr>
              <td valign="middle" class="performance">Parts used</td>
              <td colspan="6" valign="middle" class="performance"><div id="itemRows">
                  <input type="text" name="parts1"  <cfoutput>value="#Session.parts1#"</cfoutput>/>
                  <input type="text" name="parts2" <cfoutput>value="#Session.parts2#"</cfoutput>/>
                  <input type="text" name="parts3" <cfoutput>value="#Session.parts3#"</cfoutput>/>
                  <input type="text" name="parts4" <cfoutput>value="#Session.parts4#"</cfoutput>/>
                </div>
                <br />
                <div id="itemRows">
                  <input type="text" name="parts5" <cfoutput>value="#Session.parts5#"</cfoutput>/>
                  <input type="text" name="parts6" <cfoutput>value="#Session.parts6#"</cfoutput>/>
                  <input type="text" name="parts7" <cfoutput>value="#Session.parts7#"</cfoutput>/>
                  <input type="text" name="parts8" <cfoutput>value="#Session.parts8#"</cfoutput>/>
                </div></td>
              <!--- <input onclick="addRow(this.form);" type="button" value="Add another part" /> --->
            </tr>
            <tr>
              <td valign="middle" class="performance">Total labor</td>
              <td colspan="6" valign="middle" class="performance">$
                <input name="totalLabor" type="text" id="totalLabor"  size="24" <cfoutput>value="#Session.totalLabor#"</cfoutput>/>
                &nbsp;<span class="arialfontred"> (Please do not use commas)</span></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Total parts</td>
              <td colspan="6" valign="middle" class="performance">$
                <input name="totalParts" type="text" id="totalParts" size="24" <cfoutput>value="#Session.totalParts#"</cfoutput>/>   &nbsp;<span class="arialfontred"> (Please do not use commas)</span></td>
            </tr>
            <cfif Session.totalLabor EQ "">
              <CFSET Session.totalLabor =0>
            </cfif>
            <cfif Session.totalParts EQ "">
              <CFSET Session.totalParts =0>
            </cfif>
            <CFSET Session.totalCost =  Session.totalLabor+Session.totalParts>
            <tr>
              <td valign="middle" class="performance">Total cost of repair</td>
              <td colspan="6" valign="middle" class="performance"  nowrap="nowrap">$
                <input name="totalCost" type="text" id="totalCost"  size="24" <cfoutput>value="#Session.totalCost#"</cfoutput>/>
                &nbsp; &nbsp;<span class="arialfontred">(This field is auto-calculated, you do not need to enter this amount)</span></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Completion date</td>
              <td colspan="6" valign="middle" class="performance"><input type="text" name="completionDate" id="completionDate" size="24" <cfoutput>value="#Session.completionDate#"</cfoutput>/>
              &nbsp;<span class="arialfontred"> (Only Enter a Date Here When the Repair is Completed)</span></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Recommend for replacement</td>
              <td colspan="6" valign="middle" class="performance"><div class="radio">
                  <input id="recommend_Y" type="radio" name="recommend_replace" value="1"   <cfif Session.recommend_replace EQ 1>checked="checked"</cfif>/>
                  <label for="recommend_Y">Yes</label>
                  <input id="recommend_N" type="radio" name="recommend_replace" value="0"    <cfif Session.recommend_replace NEQ 1>checked="checked"</cfif>/>
                  <label for="recommend_N">No</label>
                </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Is repair completed?</td>
              <td valign="middle" class="performance"><div class="radio">
                  <input id="repair_Y" type="radio" name="inventory_status"  value="Y"  <cfif Session.repair_log_ip EQ 0>checked="checked"</cfif>/>
                  <label for="repair_Y">Yes</label>
                  <input id="repair_N" type="radio" name="inventory_status"  value="N"  <cfif Session.repair_log_ip NEQ 0>checked="checked"</cfif>/>
                  <label for="repair_N">No</label>
              </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">&nbsp;</td>
              <td colspan="6" valign="middle" class="performance"><div align="right">
                  <cfif IsDefined("form.btnSumit")    >
                    <input type="hidden" value="1"  name="update"/>
                    <cfoutput>
                      <input type="hidden" value="#repair_log_id#"  name="repair_log_id"/>
                    </cfoutput>
                  </cfif>
                  <cfif get_repairlog_info.recordcount GT 0 AND  NOT IsDefined("form.btnSumit")   >
                    <input type="hidden" value="1"  name="update"/>
                    <cfoutput>
                      <input type="hidden" value="#get_repairlog_info.ID#"  name="repair_log_id"/>
                    </cfoutput>
                  </cfif>
                  <cfoutput>
                    <input type="hidden" value="#ID#"  name="ID"/>
                  </cfoutput>
                  <input type="submit" value="Submit"  name="btnSumit"/>
                </div></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script type="text/javascript">
var rowNum = 0;
function addRow(frm) {
	rowNum ++;
	var row = '<p id="rowNum'+rowNum+'"><input type="text" name="name[]" value="'+frm.parts.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
	jQuery('#itemRows').append(row);
	frm.parts.value = '';
}

function removeRow(rnum) {
	jQuery('#rowNum'+rnum).remove();
}
</script>
</body>
</html>