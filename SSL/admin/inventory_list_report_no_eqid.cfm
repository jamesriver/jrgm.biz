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
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
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
table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
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
      <cfquery name="getNO_EQID" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),Date_Purchased,hours_mileage
  FROM equipment  
WHERE Equipment_ID = ''
  </cfquery>
      <div class="header">Equipment List - NO Equipment ID Numbers-<cfoutput>#getNO_EQID.recordcount#</cfoutput> Records</div>
    <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="center">ID</th> 
   <th align="left">Category</th>
   <th align="left" class="sorttable_alpha">Equip<br />
     ID</th> 
   <th align="left">Product<br />Name</th> 
   <cfif (IsDefined("form.CATEGORY") AND form.category EQ 'Vehicles') OR (IsDefined("form.CATEGORY") AND form.category EQ 'Trailers')>
    <th align="left">License<br />Plate</th> 
   </cfif>
   <th align="left" class="sorttable_alpha">Serial<br />Number</th>  
   <th align="center">Year</th>
  <th align="center" sorttable_customkey="mm/dd/yyyy">Purch Date</th>
<!---   <th align="center">H/M</th>
   <th align="center">Hours</th>
   <th align="left">Mileage</th> --->
    <th align="left">Branch</th>
    <th   align="left">Status</th> 
        <th align="left">Allocated To</th>
   <!---  <th align="left">Allocate</th>
    <th align="left">Allocated To</th>
     <th align="center">Repair Notes</th> 
   <th   align="left">History</th> --->
    </tr> 
</thead> 
      <tbody>  
  <cfoutput query="getNO_EQID">
   <tr>
    <td align="center"> #ID#</td>
    <td>#Category#</td>
    <td align="left" >#Equipment_ID#</td>
<td align="left" > #Product_Name# </td>
  <cfif (IsDefined("form.CATEGORY") AND form.category EQ 'Vehicles') OR (IsDefined("form.CATEGORY") AND form.category EQ 'Trailers')>
    <td align="left">#License_Plate#</td> 
   </cfif>
    <td align="left">#Serial_Number#</td>    
     <td align="center">#Equipment_Year#</td>
    <td  align="right">#DateFormat(Date_Purchased,"mm/dd/yyyy")#</td>
   
     <cfif getNO_EQID.BRANCH_NAME EQ 'Newport News'>
          <CFSET branchnew = "NEWP" >
          <cfelseif getNO_EQID.BRANCH_NAME EQ 'Charlottesville'>
          <CFSET branchnew = "CHAR" >
           <cfelseif getNO_EQID.BRANCH_NAME EQ 'Williamsburg'>
          <CFSET branchnew = "WMBG" >
          <cfelseif getNO_EQID.BRANCH_NAME EQ 'Richmond'>
          <CFSET branchnew = "RICH" >
           <cfelseif getNO_EQID.BRANCH_NAME EQ 'Portsmouth'>  
          <CFSET branchnew = "PORT" >
            <cfelseif getNO_EQID.BRANCH_NAME EQ 'Chesterfield'> 
          <CFSET branchnew = "CHES" >
           <cfelseif getNO_EQID.BRANCH_NAME EQ 'Corporate'> 
          <CFSET branchnew = "CORP" >
          <cfelse>
         <CFSET branchnew = #Left(getNO_EQID.BRANCH_NAME,4)# >
         </cfif>
    <td align="left" nowrap="nowrap">#branchnew#</td>
    <td align="left">
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
                </cfif> 
  </td>
      <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14# 
      </cfquery>
        <td align="left">#get_branch_employees_cache.fullname#</td>
<!---   <td align="left"><a href="allocate_equipment.cfm?" onclick="javascript:void window.open('allocate_equipment.cfm?ID=#ID#&branch=#getNO_EQID.BRANCH_NAME#','1384819222444','width=600,height=500,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,right=0,top=10');return false;">Allocate</a></td>
      <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14# 
      </cfquery>
        <td align="left">#get_branch_employees_cache.fullname#</td>
        <td align="center"><a href="note_addnote.cfm?ID=#ID#" class="addnote" onclick="javascript:void window.open('note_addnote.cfm?ID=#ID#','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>  --->
<!---    <td align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></td>
 --->        </tr>
  </cfoutput>
  
  </tbody>
</table><br />
<br />

    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
