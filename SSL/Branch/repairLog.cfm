  <cfparam  name="Session.acceptDate" default=""  >
  <cfparam  name="Session.repair_description" default="">
  <cfparam  name="Session.estimated_comp_Date" default="">
  <cfparam  name="Session.vendorName" default=""  >
  <cfparam  name="Session.laborHours" default=""  >
  <cfparam  name="Session.totalLabor" default=""  >
  <cfparam  name="Session.totalParts" default=""  >
  <cfparam  name="Session.totalCost" default=""  >
  <cfparam  name="Session.completionDate" default=""  >
  
  <cfif IsDefined("form.btnSumit")>
 <cfquery name="do_insert" datasource="jrgm">
INSERT INTO equipment_repair_log (Equipment_ID,acceptDate, repair_description,estimated_comp_date,outside_repair,
vendorName, laborHours, totalLabor, totalParts, totalCost, completionDate, recommend_replace) 
VALUES (#ID#,'#acceptDate#','#repair_description#','#estimated_comp_date#','#outside_repair#',
'#vendorName#', '#laborHours#', '#totalLabor#', '#totalParts#', '#totalCost#', '#completionDate#', '#recommend_replace#')
</cfquery>
<cfquery name="get_max" datasource="jrgm">
SELECT MAX(ID) AS maxid FROM equipment_repair_log 
</cfquery>
<CFSET repair_log_id = get_max.maxid>

<cfquery name="do_update" datasource="jrgm">
UPDATE equipment SET  repair_log_ip =1 WHERE ID = #ID#
</cfquery>


<cfquery name="get_repairlog_info" datasource="jrgm">
SELECT * FROM equipment_repair_log  WHERE ID = #repair_log_id#
</cfquery>

 <cfset Session.acceptDate =  #DateFormat(get_repairlog_info.acceptDate, "mm/dd/yyyy")#  > 
 <cfset Session.repair_description = get_repairlog_info.repair_description>
 <cfset Session.estimated_comp_Date = #DateFormat(get_repairlog_info.estimated_comp_Date, "mm/dd/yyyy")#> 
 <cfset Session.vendorName  = get_repairlog_info.vendorName >
 <cfset Session.laborHours = get_repairlog_info.laborHours>
 <cfset Session.totalLabor  = get_repairlog_info.totalLabor>
 <cfset Session.totalParts  = get_repairlog_info.totalParts>
 <cfset Session.totalCost  = get_repairlog_info.totalCost>
 <cfset Session.completionDate  = #DateFormat(get_repairlog_info.completionDate, "mm/dd/yyyy")#> 
 
</cfif>




 <cfif IsDefined("url.id")>
 <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
 <CFSET ID =url.id>
 <cfelseif IsDefined("form.id")>
 <cfquery name="get_this_equipment" datasource="jrgm">
 SELECT * FROM equipment WHERE ID = #form.id#
 </cfquery>
 <CFSET ID =form.id>
 
 
 </cfif>
 
<!---  <cfdump var="#get_this_equipment#">
 
 <cfabort> --->

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
<script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.mask.js" type="text/javascript"></script>
<script src="js/JavaScript2.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/form.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/StyleSheet.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.js"></script>
<link href="css/date.css" rel="stylesheet" />
<script type="text/javascript">
        $(document).ready(function () {
            $('#myform').bValidator();
        });
    </script>
<script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#estimatedDate").datepicker();//{dateFormat: 'dd-mm-yy'});
            $("#completionDate").datepicker();
            $('#Phone_number').mask('(999) 999-9999');

        });
    </script>

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">
        <p>Repair Log</p> 
     <cfoutput query="get_this_equipment">  
      <table width="95%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="performance">Product Name</td>
            <td class="performance"> #PRODUCT_NAME#</td>
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
			 <CFIF  get_this_equipment.Crew_assignment_last EQ ""> -
            <cfelse>
              <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
              WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
             </cfquery>
              #get_branch_employees_allocated.fullname#
              </CFIF> </td>
          </tr>
          <tr>
            <td class="performance">Serial ##</td>
            <td class="performance">#SERIAL_NUMBER#</td>
            <td class="performance">Cost</td>
            <td class="performance">#COST#</td>
          </tr>
        </table></cfoutput>
        <div class="spacer40"></div>
        <form method="post" action="repairLog.cfm">
          <table width="95%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="middle" class="performance">In repair?</td>
                 <td valign="middle" class="performance"><div class="radio">
                 
                  <input id="repair_Y" type="radio" name="inventory_status"  value="Y" />
                  <label for="repair_Y">Yes</label>
                  <input id="repair_N" type="radio" name="inventory_status"  value="N" />
                  <label for="repair_N">No</label>
                </div></td>
              </tr>
            <tr>
              <td valign="middle" class="performance">Date accepted as repair</td>
              <td colspan="6" valign="middle" class="performance"><input name="acceptDate" type="text" id="acceptDate"  <cfoutput>value="#Session.acceptDate#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Description of repair</td>
              <td colspan="6" valign="middle" class="performance">
            <!---     <textarea name="repair_description" cols="50" rows="8"><cfoutput>#get_accounts_detail.notes#</cfoutput></textarea> --->
              <textarea name="repair_description" id="repair_description" cols="75" rows="5"><cfoutput>#Session.repair_description#</cfoutput></textarea></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Estimated date of completion</td>
              <td colspan="6" valign="middle" class="performance"><input type="text" name="estimated_comp_Date" id="estimated_comp_Date" size="24" <cfoutput>value="#Session.estimated_comp_Date#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Outside repair?</td>
              <td colspan="6" valign="middle" class="performance">
              
              <div class="radio">
                  <input id="outside_Y" type="radio" name="outside_repair" value="1" />
                  <label for="outside_Y">Yes</label>
                  <input id="outside_N" type="radio" name="outside_repair" value="0"  checked="checked" />
                  <label for="outside_N">No</label>
                </div>
               </td>
            </tr>
            <tr>
              <td valign="middle" class="performance">If outside, name of vendor</td>
              <td colspan="6" valign="middle" class="performance"><input name="vendorName" type="text" id="vendorName" size="24" <cfoutput>value="#Session.vendorName#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Labor hours</td>
              <td colspan="6" valign="middle" class="performance"><input name="laborHours" type="text" id="laborHours"  size="24" <cfoutput>value="#Session.laborHours#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Parts used</td>
              <td colspan="6" valign="middle" class="performance">
                <div id="itemRows">
                  <input type="text" name="partsUsed" />
                  <input onclick="addRow(this.form);" type="button" value="Add another part" />
                </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Total labor</td>
              <td colspan="6" valign="middle" class="performance">$
                <input name="totalLabor" type="text" id="totalLabor"  size="24" <cfoutput>value="#Session.totalLabor#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Total parts</td>
              <td colspan="6" valign="middle" class="performance">$
                <input name="totalParts" type="text" id="totalParts" size="24" <cfoutput>value="#Session.totalParts#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Total cost of repair</td>
              <td colspan="6" valign="middle" class="performance">$
                <input name="totalCost" type="text" id="totalCost"  size="24" <cfoutput>value="#Session.totalCost#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Completion date</td>
              <td colspan="6" valign="middle" class="performance"><input type="text" name="completionDate" id="completionDate" size="24" <cfoutput>value="#Session.completionDate#"</cfoutput>/></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Recommend for replacement</td>
              <td colspan="6" valign="middle" class="performance">
              
              
              <div class="radio">
                  <input id="recommend_Y" type="radio" name="recommend_replace" value="1" />
                  <label for="recommend_Y">Yes</label>
                  <input id="recommend_N" type="radio" name="recommend_replace" value="0"  checked="checked" />
                  <label for="recommend_N">No</label>
                </div>
             </td>
            </tr>
            <tr>
              <td valign="middle" class="performance">&nbsp;</td>
              <td colspan="6" valign="middle" class="performance"><div align="right">
              <cfoutput>   <input type="hidden" value="#ID#"  name="ID"/></cfoutput>
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

<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 

<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script> 
<script type="text/javascript">
var rowNum = 0;
function addRow(frm) {
	rowNum ++;
	var row = '<p id="rowNum'+rowNum+'"><input type="text" name="name[]" value="'+frm.partsUsed.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
	jQuery('#itemRows').append(row);
	frm.partsUsed.value = '';
}

function removeRow(rnum) {
	jQuery('#rowNum'+rnum).remove();
}
</script>
</body>
</html>
