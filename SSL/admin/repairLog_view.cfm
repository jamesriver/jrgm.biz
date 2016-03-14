

<cfquery name="get_repair_log" datasource="jrgm">
SELECT * FROM equipment_repair_log  WHERE ID = #ID#   
</cfquery>
   <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.equipmentid#
 </cfquery>
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
<script src="js/Jquerybvalidator.js" type="text/javascript"></script>
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

<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.alertbox {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#F3F3F3;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#FFFFFF;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:5px 5px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}

.eqbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:32px;
	-moz-border-radius-topleft:32px;
	border-top-left-radius:32px;
	-webkit-border-top-right-radius:32px;
	-moz-border-radius-topright:32px;
	border-top-right-radius:32px;
	-webkit-border-bottom-right-radius:32px;
	-moz-border-radius-bottomright:32px;
	border-bottom-right-radius:32px;
	-webkit-border-bottom-left-radius:32px;
	-moz-border-radius-bottomleft:32px;
	border-bottom-left-radius:32px;
	text-indent:9px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#07482f;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:168px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.eqbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}
.eqbutton:active {
	position:relative;
	top:1px;
}

.performance {
	border-bottom: 1px solid #ded8da;
	background:#FFF;
	color: #000;
	font: normal 14px Arial, Helvetica, sans-serif;
	padding: 5px 5px 5px 5px;
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
      <div class="header">
        Repair Log - ID:<cfoutput>#ID#</cfoutput>  <br /><br />

        <cfoutput query="get_this_equipment">
          <table width="80%" border="0" cellpadding="0" cellspacing="0">
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
              <td class="performance">Initial Diagnosis</td>
              <td class="performance" colspan="3">#initial_diagnosis#</td>
            </tr>
            
      
           </table>
        </cfoutput>
        <div class="spacer10"></div>
           <cfoutput query="get_repair_log">
          <table width="80%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                <td class="performance" colspan="4"><cfif completionDate NEQ ""><strong class="redtype">The repair is completed and Repair Log is Closed. </strong></cfif></td>
              </tr>
            <tr>
                   <td valign="middle" class="performance">Mechanic</td>
                   
            <cfquery name="get_mechanic" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
              WHERE  [Employee ID] =  #get_repair_log.repair_log_user# 
             </cfquery>
                    <td colspan="6" valign="left" class="performance">  #get_mechanic.fullname#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Date accepted as repair</td>
              <td colspan="6" valign="middle" class="performance">#DateFormat(acceptDate, "mm/dd/yyyy")#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Description of repair</td>
              <td colspan="6" valign="middle" class="performance">#repair_description#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Estimated date of completion</td>
              <td colspan="6" valign="middle" class="performance">#DateFormat(estimated_comp_Date, "mm/dd/yyyy")#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Outside repair?</td>
              <td colspan="6" valign="middle" class="performance"><div class="radio">
                  <cfif OUTSIDE_REPAIR EQ 1>Yes<cfelse>No</cfif> 
                 </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">If outside, name of vendor</td>
              <td colspan="6" valign="middle" class="performance">#vendorName#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Labor hours</td>
              <td colspan="6" valign="middle" class="performance">#laborHours#</td>
            </tr>
       <tr>
              <td valign="middle" class="performance">Parts used</td>
              <td colspan="6" valign="middle" class="performance"><cfquery name="get_repair_log_p" datasource="jrgm">
 SELECT    ID, repair_log_id, Equipment_ID, parts1, parts2, parts3, parts4, parts5, parts6, parts7, parts8
FROM         equipment_repair_log_parts    WHERE repair_log_id = #ID#        
</cfquery>
#get_repair_log_p.parts1#, #get_repair_log_p.parts2#, #get_repair_log_p.parts3#, #get_repair_log_p.parts4#, #get_repair_log_p.parts5#, #get_repair_log_p.parts6#, #get_repair_log_p.parts7#, #get_repair_log_p.parts8#
                 </td>
             </tr> 
            <tr>
              <td valign="middle" class="performance">Total labor</td>
              <td colspan="6" valign="middle" class="performance">$
              #totalLabor#</td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Total parts</td>
              <td colspan="6" valign="middle" class="performance">$
             #totalParts# </td>
            </tr>
            <cfif totalLabor EQ "">
              <CFSET totalLabor =0>
            </cfif>
            <cfif totalParts EQ "">
              <CFSET totalParts =0>
            </cfif>
            <CFSET totalCost =  totalLabor+totalParts>
            <tr>
              <td valign="middle" class="performance">Total cost of repair</td>
              <td colspan="6" valign="middle" class="performance">$
                #totalCost# </td>
            </tr>
         
            <tr>
              <td valign="middle" class="performance">Recommend for replacement</td>
              <td colspan="6" valign="middle" class="performance"><div class="radio">
                   <cfif recommend_replace EQ 1>Yes<cfelse>No</cfif> 
                 </div></td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Is repair completed?</td>
              <td valign="middle" class="performance"><cfif completionDate EQ "">No<cfelse>Yes</cfif> 
        </td>
            </tr>
            <tr>
              <td valign="middle" class="performance">Completion date</td>
              <td valign="middle" class="performance">#DateFormat(completionDate, "mm/dd/yyyy")#</td>
            </tr>
           </table>
           </cfoutput><br />
<br />
<br />

     
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