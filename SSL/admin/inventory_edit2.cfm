<!--- DO A CHECK FOR UNIQUE EQUIPMENT ID --->
<cfquery name="do_check" datasource="jrgm">
SELECT  EQUIPMENT_ID FROM equipment
WHERE EQUIPMENT_ID='#form.EQUIPMENT_ID#' AND  ID <> #Form.ID#   
 </cfquery>
 
 <cfif  do_check.recordcount GT 0>
 This Equipment ID is already in use. Please choose another.
  <cfabort> 
 </cfif>
 

<!--- DO A CHECK FOR UNIQUE EQUIPMENT ID --->

<cfquery name="update_equipment" datasource="jrgm">
UPDATE equipment SET 
BRANCH_NAME='#form.BRANCH_NAME#',
CATEGORY='#form.CATEGORY#',
COLOR='#form.COLOR#',
COST='#form.COST#',
EQUIPMENT_ID='#form.EQUIPMENT_ID#',
<cfif EQUIPMENT_YEAR EQ "">
EQUIPMENT_YEAR=NULL,
<cfelse>
EQUIPMENT_YEAR='#form.EQUIPMENT_YEAR#',
</cfif>
LICENSE_PLATE='#form.LICENSE_PLATE#',
MEASUREMENT='#form.MEASUREMENT#',
MODIFIED_BY='#form.MODIFIED_BY#',
PRODUCT_DESCRIPTION='#form.PRODUCT_DESCRIPTION#',
PRODUCT_NAME='#form.PRODUCT_NAME#',

oil_change_criteria = '#oil_change_criteria#',

<cfif  oil_change_criteria EQ 1 or  oil_change_criteria EQ 5>
hours_mileage = '1'
</cfif>
<cfif  oil_change_criteria EQ 2 or  oil_change_criteria EQ 3>
hours_mileage = '2'
</cfif>
<cfif  oil_change_criteria EQ '' or  oil_change_criteria EQ 0>
hours_mileage = '0'
</cfif>
<!--- This is where I need to make the change --->
<cfif   oil_change_criteria EQ 4>
hours_mileage = '3'
</cfif>
<!--- This is where I need to make the change --->
,
inventory_status='#form.inventory_status#',
<cfif engine_cycle EQ 0>
engine_cycle =NULL,
<cfelse>
engine_cycle =#engine_cycle#,
 </cfif>
 <cfif QUANTITY_ON_HAND EQ "">
QUANTITY_ON_HAND=NULL,
<cfelse>
QUANTITY_ON_HAND='#form.QUANTITY_ON_HAND#',
</cfif>
 
<cfif QUANTITY_START EQ "">
QUANTITY_START =NULL,
<cfelse>
QUANTITY_START='#form.QUANTITY_START#',
</cfif>

SERIAL_NUMBER='#form.SERIAL_NUMBER#',
SNOW='#form.SNOW#',
SUPPLIER_COMPANY='#form.SUPPLIER_COMPANY#',
 
<cfif TAGS_EXPIRE EQ "">
TAGS_EXPIRE=NULL,
<cfelse>
TAGS_EXPIRE='#form.TAGS_EXPIRE#',
</cfif>


<cfif DATE_PURCHASED EQ "">
DATE_PURCHASED =NULL,
<cfelse>
DATE_PURCHASED='#DateFormat(form.DATE_PURCHASED,"mm/dd/yyyy")#',
</cfif>
 
<cfif INSPECTION_DUE EQ "">
INSPECTION_DUE =NULL,
<cfelse>
INSPECTION_DUE='#DateFormat(form.INSPECTION_DUE,"mm/dd/yyyy")#',
</cfif>


<cfif mileage_eq EQ "">
mileage_eq=NULL,
<cfelse>
mileage_eq='#form.mileage_eq#',
</cfif>


<cfif hours_eq EQ "">
hours_eq=NULL,
<cfelse>
hours_eq='#form.hours_eq#',
</cfif>

<cfif last_oil_change_date EQ "">
last_oil_change_date =NULL,
<cfelse>
last_oil_change_date='#DateFormat(form.last_oil_change_date,"mm/dd/yyyy")#',
</cfif>


DATE_MODIFIED='#DateFormat(now(),"mm/dd/yyyy")#'
 WHERE ID =#Form.ID#   
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

<CFSET next = (#Form.ID#+1)>

 <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #form.id#
 </cfquery>
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
	padding: 4px;
	color: #000;
	font: normal .8em Arial, Helvetica, sans-serif;
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
}
.jobstart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #27661f), color-stop(1, #449e2d) );
	background:-moz-linear-gradient( center top, #27661f 5%, #449e2d 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#27661f', endColorstr='#449e2d');
	background-color:#27661f;
}
.jobstart:active {
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
}
.jobstop:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background:-moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color:#d17e85;
}
.jobstop:active {
	position:relative;
	top:1px;
}
.dstableno1 {	padding: 8px;
	color: #000;
	font: normal .8em Arial, Helvetica, sans-serif;
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
   
    <cfoutput  query="get_this_equipment">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td><div class="header"> <strong>#PRODUCT_NAME# </strong></div></td>
          <td align="center" nowrap="nowrap"><strong> <a href="inventory_edit.cfm?ID=#form.id#" class="jobstop">Edit this Record</a> </strong></td>
             <td align="center" nowrap="nowrap"><strong> <a href="inventory_edit.cfm?ID=#next#" class="jobstop">Edit Next Record</a> </strong></td>
            <td align="center"><strong> <a href="allocate_equipment.cfm?" onclick="javascript:void window.open('allocate_equipment.cfm?ID=#ID#&branch=#get_this_equipment.BRANCH_NAME#','1384819222444','width=800,height=350,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,right=100,top=10');return false;" class="jobstart">Allocate this Equipment</a> </strong></td>
          <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to EQ. List</a> </strong></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" nowrap="nowrap">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
        </tr>
      </table>
      <table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="##F3F3F3" bordercolorlight="White">
        <tbody>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">ID:</span></td>
            <td><strong><span class="dstableno"> #ID# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Created:</span></td>
            <td><strong><span class="dstableno"> #DateFormat(DATE_CREATED, "mm/dd/yyyy")# </span></strong></td>
            <td width="150" align="left" nowrap="nowrap"><span class="dstableno">Category:</span></td>
            <td align="left"><strong><span class="dstableno"> #CATEGORY# </span></strong></td>
            <td align="right" nowrap="nowrap"><span class="dstableno">Status:</span></td>
            <td align="left" nowrap="nowrap"><span class="dstableno">  
			<cfif inventory_status EQ 1>
                Active
                <cfelseif inventory_status EQ 2>
				Pending Repair
                <cfelseif inventory_status EQ 3>
				In Repair
                <cfelseif inventory_status EQ 0>
				Inactive
            <cfelseif inventory_status EQ 5>
				Completed Repair
				<cfelse>Active
                </cfif> </span></td>
          </tr>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Product Name:</span></td>
            <td colspan="7"><strong><span class="dstableno"> #PRODUCT_NAME# </span> </strong></td>
          </tr>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Description:</span></td>
            <td colspan="7"><strong><span class="dstableno"> #PRODUCT_DESCRIPTION# </span></strong></td>
          </tr>
          
            
            <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Purchased:</span></td>
            <td><strong><span class="dstableno"> #DateFormat(DATE_PURCHASED, "mm/dd/yyyy")#</span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Year:</span></td>
            <td><strong><span class="dstableno"> #equipment_year# </span></strong></td>
            <td width="150" align="left" nowrap="nowrap"><span class="dstableno">Cost:</span></td>
            <td width="150" colspan="3" align="left"><strong><span class="dstableno"> #cost# </span></strong></td>
          </tr>
          
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Equipment ID</span></td>
            <td><strong><span class="dstableno"> #EQUIPMENT_ID# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Serial Number</span></td>
            <td colspan="5"><strong><span class="dstableno"> #SERIAL_NUMBER# </span></strong></td>
          </tr>
        
          
          
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Color:</span></td>
            <td><strong><span class="dstableno"> #COLOR# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Alt. ID:</span></td>
            <td><strong><span class="dstableno"> #MEASUREMENT# </span></strong></td>
            <td width="150" align="left" nowrap="nowrap"><span class="dstableno">Snow:</span></td>
            <td width="150" colspan="3" align="left"><strong><span class="dstableno"> #Snow# </span></strong></td>
          </tr>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Inspection Date:</span></td>
            <td><strong><span class="dstableno"> #DateFormat(INSPECTION_DUE, "mm/dd/yyyy")# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">License Plate:</span></td>
            <td><strong><span class="dstableno"> #LICENSE_PLATE# </span></strong></td>
            <td width="150" align="left" nowrap="nowrap"><span class="dstableno">Tags Expire:</span></td>
            <td width="150" colspan="3" align="left"><strong><span class="dstableno">#DateFormat(TAGS_EXPIRE,"mm/dd/yyyy")# </span></strong></td>
          </tr>
          <tr>
            <td align="left" nowrap="nowrap"><span class="dstableno">Quantity:</span></td>
            <td><strong><span class="dstableno"> #QUANTITY_START# </span></strong></td>
            <td align="left" nowrap="nowrap"><span class="dstableno">Quantity on Hand:</span></td>
            <td><strong><span class="dstableno"> #QUANTITY_ON_HAND# </span></strong></td>
            <td width="150" align="left" nowrap="nowrap"><span class="dstableno">Last Oil Change Date:</span></td>
            <td width="150" colspan="3" align="left"><strong><span class="dstableno">#DateFormat(last_oil_change_date,"mm/dd/yyyy")# </span></strong></td>
          </tr>
          <tr>
               <td align="left" nowrap="nowrap"><span class="dstableno">Hours / Mileage / Date:</span></td>
    <td><strong><span class="dstableno">
    <cfif oil_change_criteria EQ 0>
                N/A
                <cfelseif oil_change_criteria EQ 1>
			Hours+100
                <cfelseif oil_change_criteria EQ 2>
				Mileage+5000
                <cfelseif oil_change_criteria EQ 3>
				Mileage+10000
                    <cfelseif oil_change_criteria EQ 4>
				Date+30 Days
                <cfelseif oil_change_criteria EQ 5>
			Hours+200
 				<cfelse>
                N/A
                </cfif>&nbsp;&nbsp;(#hours_mileage#)
                
    </span></strong></td>
            <td align="left" nowrap="nowrap" class="dstableno">Hours:</td>
            <td align="left"><strong><span class="dstableno">
            #hours_eq# 
            </span></strong></td>
            <td width="150" align="left" nowrap="nowrap" class="dstableno">Mileage:</td>
            <td width="150" colspan="3" align="left"><strong><span class="dstableno">
              #mileage_eq# 
            </span></strong></td>
            </tr>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Branch Name:</span></td>
            <td><strong><span class="dstableno"> #BRANCH_NAME# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Crew Assignment:</span></td>
            
               <CFIF  get_this_equipment.Crew_assignment_last EQ "">  
               <td  class="dstableno"> -</td><cfelse> 
                <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
        SELECT  [Name FirstLast] AS fullname  FROM APP_employees
        WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
         </cfquery>
         <td  class="dstableno">#get_branch_employees_allocated.fullname# </td>
              </CFIF>
        
            <td width="150" nowrap="nowrap">&nbsp;</td>
            <td width="150" colspan="3" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" nowrap="nowrap"><span class="dstableno">Supplier Company:</span></td>
            <td><strong><span class="dstableno"> #SUPPLIER_COMPANY# </span></strong></td>
            <td align="left" nowrap="nowrap"><span class="dstableno">Engine Cycle:</span></td>
      <td><strong><span class="dstableno">
      <cfif engine_cycle NEQ ''  AND  engine_cycle NEQ 0>
        #engine_cycle# cycle
        <cfelse>
        N/A
        </cfif>
    </span></strong></td>
            <td width="150" nowrap="nowrap">&nbsp;</td>
            <td width="150" colspan="3" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Modified:</span></td>
            <td><strong><span class="dstableno"> #DateFormat(DATE_MODIFIED, "mm/dd/yyyy")# </span></strong></td>
            <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Modified By:</span></td>
            <td><strong><span class="dstableno"> #MODIFIED_BY# </span></strong></td>
            <td width="150" nowrap="nowrap">&nbsp;</td>
            <td width="150" colspan="3" align="left">&nbsp;</td>
          </tr>
      </tbody>
      </table>
    </cfoutput>
    <p>&nbsp;</p>
    <!-- to clear footer -->
  </div>
</div></div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
