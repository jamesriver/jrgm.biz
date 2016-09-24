<!--- DO A CHECK FOR UNIQUE EQUIPMENT ID --->
<cfquery name="do_check" datasource="jrgm">
SELECT  EQUIPMENT_ID FROM equipment
WHERE EQUIPMENT_ID='#form.EQUIPMENT_ID#' 
 </cfquery>
 <cfif  do_check.recordcount GT 0>
 This Equipment ID is already in use. Please choose another.
  <cfabort> 
 </cfif>
<!--- DO A CHECK FOR UNIQUE EQUIPMENT ID ---> 
 
 <cfquery name="add_equipment_insert" datasource="#request.dsn#">
SET NOCOUNT ON INSERT INTO equipment ( CATEGORY,PRODUCT_NAME,PRODUCT_DESCRIPTION,DATE_PURCHASED,last_oil_change_date,EQUIPMENT_YEAR,COST,EQUIPMENT_ID,SERIAL_NUMBER,COLOR,MEASUREMENT,SNOW,INSPECTION_DUE,LICENSE_PLATE,TAGS_EXPIRE,QUANTITY_START,QUANTITY_ON_HAND,mileage_eq, hours_eq ,
ENGINE_CYCLE,BRANCH_NAME<!--- ,CREW_ASSIGNMENT --->,SUPPLIER_COMPANY,inventory_status,oil_change_criteria,hours_mileage,Date_Created, Date_Modified,MODIFIED_BY)   
VALUES 
('#CATEGORY#','#PRODUCT_NAME#','#PRODUCT_DESCRIPTION#',

<cfif DATE_PURCHASED EQ "">
NULL,
 <cfelse>
'#form.DATE_PURCHASED#',
 </cfif>
 
 <cfif last_oil_change_date EQ "">
NULL,
 <cfelse>
'#form.last_oil_change_date#',
 </cfif>


<cfif EQUIPMENT_YEAR EQ "">
NULL,
 <cfelse>
 '#form.EQUIPMENT_YEAR#',
</cfif>'#COST#','#EQUIPMENT_ID#','#SERIAL_NUMBER#','#COLOR#','#MEASUREMENT#','#SNOW#',

<cfif INSPECTION_DUE EQ "">
NULL,
 <cfelse>
'#form.INSPECTION_DUE#',
 </cfif>

 '#LICENSE_PLATE#',

<cfif TAGS_EXPIRE EQ "">
NULL,
 <cfelse>
'#form.TAGS_EXPIRE#',
 </cfif>

 
<cfif QUANTITY_START EQ "">
NULL,
 <cfelse>
'#form.QUANTITY_START#',
 </cfif>
<cfif QUANTITY_ON_HAND EQ "">
NULL,
 <cfelse>
'#form.QUANTITY_ON_HAND#',
 </cfif>
   <cfif mileage_eq EQ "">
NULL,
 <cfelse>
'#form.mileage_eq#',
 </cfif>

<cfif hours_eq EQ "">
NULL,
 <cfelse>
'#form.hours_eq#',
 </cfif> 
  '#ENGINE_CYCLE#','#BRANCH_NAME#'<!--- ,'#CREW_ASSIGNMENT#' --->,'#SUPPLIER_COMPANY#',1, 
 
 <cfif oil_change_criteria EQ "">
NULL,
 <cfelse>
'#form.oil_change_criteria#',
 </cfif> 
 
 
 <cfif  oil_change_criteria EQ 1 or  oil_change_criteria EQ 5>
 '1'
</cfif>
<cfif  oil_change_criteria EQ 2 or  oil_change_criteria EQ 3>
'2'
</cfif>
<cfif  oil_change_criteria EQ '' or  oil_change_criteria EQ 0>
 '0'
</cfif>
<!--- This is where I need to make the change --->
<cfif   oil_change_criteria EQ 4>
 '3'
</cfif>
 , 
 CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'#SESSION.screenname#')
SELECT @@identity AS newid SET NOCOUNT OFF
  </cfquery>
  
 <CFSET new_ID= #add_equipment_insert.newid#>

 <cfif IsDefined("form.branch_employee_id")>
     <cfquery name="update_eq_table" datasource="jrgm"  >
     UPDATE equipment SET  crew_assignment_last = #form.branch_employee_id#
      WHERE ID=#new_ID#
     </cfquery>

     <cfquery name="update_allocation_history" datasource="jrgm"  >
     INSERT INTO equipment_allocation_history
     (equipment_id, assign_date, employee_id, modified_by_employee_id)
     VALUES
     (#new_ID#, GetUTCDate(), #form.branch_employee_id#, #SESSION.userid#)
     </cfquery>

     <cfset SESSION.lastequipment_branch = form.BRANCH_NAME>
     <cfset SESSION.lastequipment_employee_id = form.branch_employee_id>
 </cfif>

   
<!--- <cfabort> --->
 
 
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
</style>
  
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   
  <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #new_ID#
 </cfquery> 
<cfoutput  query="get_this_equipment">  
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
    <tr>
        <td> <div class="header"> <strong>#PRODUCT_NAME# </strong></div></td>
        <td align="center"><strong> <a href="inventory_add.cfm" class="jobstart">Add Another</a> </strong></td>
        <td align="center" nowrap="nowrap"><strong> <a href="inventory_edit.cfm?ID=#new_ID#" class="jobstop">Edit this Record</a> </strong></td>
    <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Equipment List</a> </strong></td>

      </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center" nowrap="nowrap">&nbsp;</td>
      <td align="center">&nbsp;</td>
    </tr>
  </table>
  
<table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="##F3F3F3" bordercolorlight="White">
 <tbody>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">ID:</span></td>
    <td><strong><span class="dstableno">
      #ID#
      </span></strong></td>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Created:</span></td>
    <td><span class="dstableno">
      #DateFormat(DATE_CREATED, "mm/dd/yyyy")# 
      </span></td>
    <td width="120" align="left" nowrap="nowrap"><span class="dstableno">Category:</span></td>
    <td><span class="dstableno">
      #CATEGORY#
      </span></td>
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
    <td colspan="7"><span class="dstableno">
      #PRODUCT_NAME# 
      </span>    </td>
  </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Description:</span></td>
    <td colspan="7"><strong><span class="dstableno">
      #PRODUCT_DESCRIPTION# 
      </span></strong></td>
  </tr>
    <tr>
 <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Purchased:</span></td>
 <td><strong><span class="dstableno"> #DateFormat(DATE_PURCHASED, "mm/dd/yyyy")#</span></strong></td>
 <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Year:</span></td>
 <td><span class="dstableno"> #equipment_year# </span></td>
 <td width="120" align="left" nowrap="nowrap"><span class="dstableno">Cost:</span></td>
 <td><strong><span class="dstableno"> #cost# </span></strong></td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
    </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Equipment ID</span></td>
    <td><strong><span class="dstableno">
      #EQUIPMENT_ID# 
      </span></strong></td>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Serial Number</span></td>
    <td><span class="dstableno">
      #SERIAL_NUMBER# 
      </span></td>
    <td width="120" nowrap="nowrap">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Color:</span></td>
    <td><strong><span class="dstableno">
      #COLOR# 
      </span></strong></td>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Measurement:</span></td>
    <td><span class="dstableno">
      #MEASUREMENT# 
      </span></td>
    <td width="120" align="left" nowrap="nowrap"><span class="dstableno">Snow:</span></td>
    <td><strong><span class="dstableno"> #Snow# </span></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Inspection Date:</span></td>
    <td><strong><span class="dstableno">
      #DateFormat(INSPECTION_DUE, "mm/dd/yyyy")# 
      </span></strong></td>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">License Plate:</span></td>
    <td><span class="dstableno">
      #LICENSE_PLATE# 
      </span></td>
    <td width="120" align="left" nowrap="nowrap"><span class="dstableno">Tags Expire:</span></td>
    <td><span class="dstableno"> #DateFormat(TAGS_EXPIRE,"mm/dd/yyyy")# </span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap="nowrap"><span class="dstableno">Quantity:</span></td>
    <td><strong><span class="dstableno"> #QUANTITY_START# </span></strong></td>
    <td align="left" nowrap="nowrap"><span class="dstableno">Quantity on Hand:</span></td>
    <td><span class="dstableno"> #QUANTITY_ON_HAND# </span></td>
   <td width="120" align="left" nowrap="nowrap"><span class="dstableno">Last Oil Change Date:</span></td>
    <td><span class="dstableno"> #DateFormat(last_oil_change_date,"mm/dd/yyyy")# </span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
    <td align="left" nowrap="nowrap"><span class="dstableno">Hours:</span></td>
    <td align="left"><strong><span class="dstableno"> #hours_eq# </span></strong></td>
    <td align="left" nowrap="nowrap" ><span class="dstableno">Mileage:</span></td>
    <td align="left"><strong><span class="dstableno"> #mileage_eq# </span></strong></td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Branch Name:</span></td>
    <td><strong><span class="dstableno">
      #BRANCH_NAME# 
      
      </span></strong></td>    <td>&nbsp;</td>    <td>&nbsp;</td>
   <!---  <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Crew Assignment:</span></td>
    <td><span class="dstableno">
      #CREW_ASSIGNMENT# 
      </span></td> --->
    <td width="120" nowrap="nowrap">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap="nowrap"><span class="dstableno">Supplier Company:</span></td>
    <td><span class="dstableno"> #SUPPLIER_COMPANY# </span></td>
   <td align="left" nowrap="nowrap"><span class="dstableno">Engine Cycle:</span></td>
    <td><strong><span class="dstableno">
      <cfif engine_cycle NEQ ''  AND  engine_cycle NEQ 0>
        #engine_cycle# cycle
        <cfelse>
        N/A
        </cfif>
    </span></strong></td>
    <td width="120" nowrap="nowrap">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Date Modified:</span></td>
    <td><strong><span class="dstableno">
      #DateFormat(DATE_MODIFIED, "mm/dd/yyyy")# 
      </span></strong></td>
    <td width="130" align="left" nowrap="nowrap"><span class="dstableno">Modified By:</span></td>
    <td><span class="dstableno">
      #MODIFIED_BY#
      </span></td>
    <td width="120" nowrap="nowrap">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</cfoutput>
<p>&nbsp;</p>


        
  <!-- to clear footer -->
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


