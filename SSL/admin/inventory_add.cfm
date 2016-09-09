 

<cfparam  name="Session.inventory_status" default=""  >
<cfparam  name="Session.BRANCH_NAME" default=""  >
  <cfparam  name="Session.CATEGORY" default="">
  <cfparam  name="Session.color" default="">
  <cfparam  name="Session.cost" default=""  >
  <cfparam  name="Session.CREW_ASSIGNMENT" default=""  >
  <cfparam  name="Session.EQUIPMENT_ID" default=""  >
<cfparam  name="Session.EQUIPMENT_YEAR" default="">
 
  <cfparam  name="Session.LICENSE_PLATE" default=""  >
  <cfparam  name="Session.MODIFIED_BY" default=""  >
 <cfparam  name="Session.PRODUCT_DESCRIPTION" default=""  >
 <cfparam  name="Session.PRODUCT_NAME" default=""  >
  <cfparam  name="Session.engine_cycle" default=""  >
<cfparam  name="Session.QUANTITY_ON_HAND" default=""  >
 <cfparam  name="Session.QUANTITY_START" default=""  >
<cfparam  name="Session.SERIAL_NUMBER" default=""  >
 <cfparam  name="Session.snow" default=""  >
<cfparam  name="Session.SUPPLIER_COMPANY" default=""  >
  <cfparam  name="Session.TAGS_EXPIRE" default=""  >
 <cfparam  name="Session.DATE_PURCHASED" default=""  >  
<cfparam  name="Session.DATE_PURCHASED" default=""  >
 <cfparam  name="Session.INSPECTION_DUE" default=""  >
 <cfparam  name="Session.MEASUREMENT" default=""  >
 <cfparam  name="Session.mileage_eq" default=""  > 
 <cfparam  name="Session.hours_eq" default=""  >
 <cfparam  name="Session.last_oil_change_date" default=""  >
  <cfparam  name="Session.hours_mileage" default=""  >
 

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management Inventory</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
textarea {
	width: 600px;
	padding:10px;
}
.dstableno {
	padding: 8px;
	color: #000;
	font: normal .9em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal 1.0em Arial, Helvetica, sans-serif;
}
li {
	font: normal .9em Arial, Helvetica, sans-serif;
	line-height: 24px;
}
.jobstart {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #449e2d), color-stop(1, #27661f) );
	background:-moz-linear-gradient( center top, #449e2d 5%, #27661f 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#449e2d', endColorstr='#27661f');
	background-color:#449e2d;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #143d0b;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	padding:5px 10px;
	margin-top:4px;
	margin-right: 30px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}.jobstart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #27661f), color-stop(1, #449e2d) );
	background:-moz-linear-gradient( center top, #27661f 5%, #449e2d 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#27661f', endColorstr='#449e2d');
	background-color:#27661f;
}.jobstart:active {
	position:relative;
	top:1px;
}

.jobstop {
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
	padding:5px 10px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}.jobstop:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background:-moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color:#d17e85;
}.jobstop:active {
	position:relative;
	top:1px;
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
}.eqbutton:active {
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
  
 
  
     <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="header">Add New Equipment</div> </td>
            <td>&nbsp;</td>
           <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Equipment List</a> </strong></td>
          </tr>
        </table>
        <br />
      
       <form method="post" action="inventory_add2.cfm">
        <table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="#F3F3F3" bordercolorlight="White">
          <tbody>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Category              </td>
              <td align="left" nowrap="nowrap" class="dstableno"><select name="Category"   tabindex="1">
                 <option value="Aerators" selected="selected" >Aerators</option>
                <option value="Blowers" >Blowers</option>
                <option value="Chainsaws" >Chainsaws</option>
                <option value="Construction Equipment" >Construction Equipment</option>
                <option value="Edgers" >Edgers</option>
                <option value="Leaf Vaccuums" >Leaf Vacuums</option>
                <option value="Misc. Equipment" >Misc. Equipment</option>
                <option value="Mowers" >Mowers</option>
                <option value="Pruners" >Pruners</option>
                <option value="Snow Equipment" >Snow Equipment</option>
                <option value="Spray Equipment" >Spray Equipment</option>
                <option value="Spreaders" >Spreaders</option>
                <option value="Tools" >Tools</option>
                <option value="Trailers" >Trailers</option>
                <option value="Vehicles" >Vehicles</option>
                <option value="Weedeaters" >Weedeaters</option>
                <option value="IT" >IT</option>
              </select></td>
              <td align="right" nowrap="nowrap" class="dstableno">Status</td>
              <td align="left" nowrap="nowrap" class="dstableno">
              <select name="inventory_status" id="inventory_status"   tabindex="2">
                <option value="1"  >Active</option>
                <option value="0" >Inactive</option>
                 <option value="2"  >Pending Repair</option>
                <option value="3" >In Repair</option>
              </select></td>
              <td align="left" nowrap="nowrap" class="dstableno">&nbsp;</td>
              <td align="left" nowrap="nowrap" class="dstableno">&nbsp;</td>
              <td align="left" nowrap="nowrap" class="dstableno">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Product Name</td>
              <td colspan="6"><span class="dstableno">
                    <input name="PRODUCT_NAME" type="text"    tabindex="2"  size="75" maxlength="100"   <cfoutput>value="#Session.PRODUCT_NAME#"</cfoutput>>
                </span> </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Description</td>
              <td colspan="6"><strong><span class="dstableno">
                
                  <input name="PRODUCT_DESCRIPTION" type="text"    tabindex="3" maxlength="120" size="100"  <cfoutput>value="#Session.PRODUCT_DESCRIPTION#"</cfoutput>>
                </span></strong></td>
               
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">* Date Purchased</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED" type="text"    tabindex="4" size="12" maxlength="12"  <cfoutput>value="#Session.DATE_PURCHASED#"</cfoutput>>
&nbsp;                </span></strong><span class="dstableno">(mm/dd/yyyy)</span></td>
              <td align="right" nowrap="nowrap" class="dstableno">Year</td>
              <td class="dstableno">
            
                  <input name="EQUIPMENT_YEAR" type="text"    tabindex="5" size="5" maxlength="5"  <cfoutput>value="#Session.EQUIPMENT_YEAR#"</cfoutput>>
                  &nbsp; (integer)
              </td>
              <td align="right" nowrap="nowrap" class="dstableno">Cost</td>
              <td colspan="2" class="dstableno">
               
                  <input name="COST" type="text"    tabindex="6" maxlength="12"  <cfoutput>value="#Session.COST#"</cfoutput>>
              </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Equipment ID</td>
              <td><strong><span class="dstableno">
                 <input name="EQUIPMENT_ID" type="text"    tabindex="7" maxlength="50"  <cfoutput>value="#Session.EQUIPMENT_ID#"</cfoutput>>
                </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Serial Number</td>
              <td class="dstableno">
              
                 <input name="SERIAL_NUMBER" type="text"    tabindex="9" size="25" maxlength="50" <cfoutput>value="#Session.SERIAL_NUMBER#"</cfoutput>>
              </td>
              <td class="dstableno">&nbsp;&nbsp; </td>
              <td colspan="2" class="dstableno">&nbsp;&nbsp; </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Color</td>
              <td><strong><span class="dstableno">
             
                    <input name="COLOR" type="text"    tabindex="11" maxlength="50"  <cfoutput>value="#Session.COLOR#"</cfoutput>>
                </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Measurement</td>
              <td class="dstableno">
              
                    <input name="MEASUREMENT" type="text"    tabindex="13" maxlength="50"  <cfoutput>value="#Session.MEASUREMENT#"</cfoutput>>
              </td>
              <td align="right" nowrap="nowrap" class="dstableno">Snow</td>
              <td colspan="2"><strong><span class="dstableno">
                <select name="SNOW"   tabindex="14">
                  <option value="Yes" >Yes</option>
                  <option value="No"   selected="selected">No</option>
                </select>
                </span></strong></td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno"  bgcolor="#FFDECE"> <span class="arialfont"> Inspection Date</span></td>
              <td bgcolor="#FFDECE"><strong><span class="dstableno">
               
                 <input name="INSPECTION_DUE" type="text"    tabindex="16" size="12" maxlength="12"  <cfoutput>value="#Session.INSPECTION_DUE#"</cfoutput>>
              </span></strong><span class="dstableno"> (mm/dd/yyyy)</span></td>
              <td align="right" nowrap="nowrap" class="dstableno">License Plate</td>
              <td class="dstableno">
               
                  <input name="LICENSE_PLATE" type="text"    tabindex="18" maxlength="12"  <cfoutput>value="#Session.LICENSE_PLATE#"</cfoutput>>
              </td>
              <td align="right" nowrap="nowrap" class="dstableno">* Tags Expire</td>
              <td colspan="2" class="dstableno">
              
                <input name="TAGS_EXPIRE" type="text"    tabindex="20" size="12" maxlength="12"  <cfoutput>value="#Session.TAGS_EXPIRE#"</cfoutput>>
                &nbsp;  (mm/dd/yyyy)
             
              </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Quantity</td>
              <td><strong><span class="dstableno">
                <input name="QUANTITY_START" type="text"    tabindex="22" size="6" maxlength="6"  <cfoutput>value="#Session.QUANTITY_START#"</cfoutput> />
  &nbsp;</span></strong><span class="dstableno"> (integer)</span></td>
              <td align="right" nowrap="nowrap" class="dstableno">Quantity on Hand</td>
              <td class="dstableno"><input name="QUANTITY_ON_HAND" type="text"    tabindex="24" size="6" maxlength="6"  <cfoutput>value="#Session.QUANTITY_ON_HAND#"</cfoutput> />
              &nbsp; (integer)</td>
              <td align="right" nowrap="nowrap" class="dstableno"  bgcolor="#FFDECE"> * Last Oil Change Date</td>
              <td colspan="2" class="dstableno"  bgcolor="#FFDECE"><input name="last_oil_change_date" type="text"    tabindex="25" size="12" maxlength="12"  <cfoutput>value="#Session.last_oil_change_date#"</cfoutput> />
  &nbsp;  (mm/dd/yyyy)</td>
            </tr>     
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Hours / Mileage / Date</td>
              <td><strong><span class="dstableno">
                <select name="oil_change_criteria"   tabindex="26">
                  <option value="0"   selected="selected">N/A</option>
                  <option value="1">Hours+100 Hours</option>
                     <option value="5">Hours+200 Hours</option>
                  <option value="2">Mileage+5000 Miles</option>
                   <option value="3">Mileage+10000 Miles</option>
                      <option value="4">Date+30 Days</option>
                </select>
              </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Hours</td>
              <td class="dstableno"><input name="hours_eq" type="text"    tabindex="18" size="5" maxlength="5"  <cfoutput>value="#Session.hours_eq#"</cfoutput> /></td>
              <td align="right" nowrap="nowrap" class="dstableno">Mileage</td>
              <td colspan="2"><span class="dstableno">
                <input name="mileage_eq" type="text"    tabindex="18" size="8" maxlength="8"  <cfoutput>value="#Session.mileage_eq#"</cfoutput> />
              </span></td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Branch Name</td>
              <td><strong><span class="dstableno">
                 <select name="BRANCH_NAME"   tabindex="32">
         <option value="Charlottesville"  >Charlottesville</option>
         <option value="Chesterfield">Chesterfield</option>
         <option value="Corporate" selected="selected">Corporate</option>
         <option value="Irrigation">Irrigation</option>
        <option value="Landscape">Landscape</option>
        <option value="Newport News">Newport News</option>
        <option value="Portsmouth">Portsmouth</option>
        <option value="Richmond">Richmond</option>
        <option value="SAUDE">SAUDE</option>
        <option value="Williamsburg">Williamsburg</option>
        </select>
                </span></strong></td>
           <td class="dstableno">&nbsp;</td>   <td class="dstableno">&nbsp;</td>
              <td class="dstableno">&nbsp;</td>
              <td colspan="2" class="dstableno">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Supplier Company</td>
              <td class="dstableno"><input name="SUPPLIER_COMPANY" type="text"    tabindex="40" maxlength="6"  <cfoutput>value="#Session.SUPPLIER_COMPANY#"</cfoutput> /></td>
              <td align="right" nowrap="nowrap" class="dstableno">Engine Cycle</td>
              <td><strong><span class="dstableno">
                <select name="engine_cycle"   tabindex="26">
                  <option value="0"   selected="selected">N/A</option>
                  <option value="2">2 Cycle</option>
                  <option value="4">4 Cycle</option>
                </select>
              </span></strong></td>
              <td class="dstableno">&nbsp;</td>
              <td colspan="2" class="dstableno">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">&nbsp;  </td>
              <td><strong><span class="dstableno"> </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">&nbsp;   </td>
              <td colspan="3" class="dstableno">&nbsp;
              
              </td>
              <td nowrap="nowrap"> <input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
            </tr>
        </table>
       </form>
   <!-- to clear footer --><span class="crewjob_header"><br />
 &nbsp; </span>
    
  </div>
</div>
<!-- end outer div -->
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>