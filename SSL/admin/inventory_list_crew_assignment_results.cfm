<cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="All">
<cfparam name="session.yearsearch" default="All">
<cfparam name="session.inventory_status" default="1">
<cfparam name="session.crew_assignment_last" default="All">
<cfparam name="session.oil_change_criteria" default="All">
<CFSET session.crew_assignment_last = 0>
<cfif IsDefined("form.submitted")>
  <CFSET session.branchsearch = form.BRANCH_NAME>
  <CFSET session.Categorysearch = form.Category>
  <CFSET session.yearsearch = form.Equipment_year>
  <CFSET session.inventory_status = form.inventory_status>
  <CFSET session.oil_change_criteria = form.oil_change_criteria>
  <CFSET session.crew_assignment_last = form.crew_assignment_last>
</cfif>
<cfparam name="category" default="">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
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
<style type="text/css">
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner"> <br />
      <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),Date_Purchased,hours_mileage,oil_change_criteria
  FROM equipment WHERE 0=0 
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> 
<cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif> 

<!---<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> --->
<cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 6 AND form.inventory_status NEQ 4 > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("url.crew_assignment_last") AND url.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#url.crew_assignment_last#'</cfif>
  <cfif IsDefined("form.oil_change_criteria") AND form.oil_change_criteria NEQ "All">  AND  oil_change_criteria = #form.oil_change_criteria# </cfif>
 <cfif IsDefined("url.purchdatesort")> ORDER by  Date_Purchased DESC <cfelse>ORDER by  ID ASC</cfif>
</cfquery>
      <div class="header">
        <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" >
          <cfoutput>#form.BRANCH_NAME#</cfoutput>
          <cfelse>
         
        </cfif>
        <cfquery name="get_employees_name" datasource="jrgm">
        SELECT  [Employee ID] AS empid, first_name ,  last_name,branch , [Name FirstLast] AS fullname   FROM 
        app_employees WHERE [Employee ID] = #url.crew_assignment_last#
        </cfquery>
        <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" >
          <cfoutput>#form.BRANCH_NAME#</cfoutput>
          <cfelse>
           
        </cfif>
        Equipment List - 
        <cfif IsDefined("url.crew_assignment_last") >
          <cfoutput>#get_employees_name.fullname#</cfoutput>
        </cfif>
        <span class="record-count"><cfoutput>#getequipment.recordcount#</cfoutput> Records&nbsp; &nbsp;
        (
        <cfif session.inventory_status EQ '4'>
          All Equipment-Not Including Inactive
        </cfif>
        <cfif session.inventory_status EQ '1'>
          Active Equipment
        </cfif>
        <cfif session.inventory_status EQ '0'>
          All Equipment
        </cfif>
        <cfif session.inventory_status EQ '2'>
          Equipment Pending Repair
        </cfif>
        <cfif session.inventory_status EQ '5'>
          Equipment Completed Repair
        </cfif>
        <cfif session.inventory_status EQ '3'>
          Equipment In Repair
        </cfif>
        )
        
        &nbsp; &nbsp;&nbsp; &nbsp;
        <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" >
          Year : <cfoutput>#form.Equipment_year#</cfoutput > &nbsp; &nbsp;&nbsp; &nbsp;
        </cfif>
        <cfif IsDefined("form.oil_change_criteria") AND form.oil_change_criteria NEQ "All" >
          Oil Change Criteria:
          <cfif session.oil_change_criteria EQ '0'>
            N/A
          </cfif>
          <cfif session.oil_change_criteria EQ '1'>
            Hours+100 Hours
          </cfif>
          <cfif session.oil_change_criteria EQ '5' >
            Hours+200 Hours
          </cfif>
          <cfif session.oil_change_criteria EQ '2' >
            Mileage+5000 Miles
          </cfif>
          <cfif session.oil_change_criteria EQ '3' >
            Mileage+10000 Miles
          </cfif>
          <cfif session.oil_change_criteria EQ '4' >
            Date+30 Days
          </cfif>
          <!--- <cfoutput>(#form.oil_change_criteria#)</cfoutput --->
        </cfif>
        </span> <img src="images/clear.gif" width="275" height="1" />
        <div class="bluebuttonRT"><a href="inventory_add.cfm"  class="bluebuttonNR">Add New Equipment</a></div>
      </div>
      <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"   >
        <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th>
            <th align="left" class="sorttable_alpha">Equip<br />
              ID</th>
            <th align="left">Product<br />
              Name</th>
            <cfif (IsDefined("form.CATEGORY") AND form.category EQ 'Vehicles') OR (IsDefined("form.CATEGORY") AND form.category EQ 'Trailers')>
              <th align="left">License<br />
                Plate</th>
            </cfif>
            <th align="left" class="sorttable_alpha">Serial<br />
              Number</th>
            <th align="center">Year</th>
            <th align="center" sorttable_customkey="mm/dd/yyyy"><a href="inventory_list.cfm?purchdatesort=yes">Purch Date</a></th>
            <th align="center">Oil Change Criteria</th>
            <th align="center">Hours</th>
            <th align="left">Mileage</th>
            <th align="left">Branch</th>
            <th   align="left">Status</th>
            <th align="left">Allocate</th>
            <th align="left">Allocated To</th>
            <th align="center">Repair Notes</th>
            <th   align="left">History/<br />
              Inspection/<br />
              Oil Change</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="getequipment">
            <tr>
              <td align="center"><a href="inventory_edit.cfm?ID=#ID#">#ID#</a></td>
              <td>#Category#</td>
              <td align="left" >#Equipment_ID#</td>
              <td align="left" ><a href="inventory_edit.cfm?ID=#ID#">#Product_Name#</a></td>
              <cfif (IsDefined("form.CATEGORY") AND form.category EQ 'Vehicles') OR (IsDefined("form.CATEGORY") AND form.category EQ 'Trailers')>
                <td align="left">#License_Plate#</td>
              </cfif>
              <td align="left">#Serial_Number#</td>
              <td align="center">#Equipment_Year#</td>
              <td  align="right">#DateFormat(Date_Purchased,"mm/dd/yyyy")#</td>
              <td  align="center"><cfif oil_change_criteria EQ 0>
                  N/A
                  <cfelseif oil_change_criteria EQ 1>
                  Hrs +100
                  <cfelseif oil_change_criteria EQ 5>
                  Hrs +200
                  <cfelseif oil_change_criteria EQ 2>
                  Miles+5000
                  <cfelseif oil_change_criteria EQ 3>
                  Miles+10000
                  <cfelseif oil_change_criteria EQ 4>
                  Date+30 Days
                  <cfelse>
                  N/A
                </cfif>
                &nbsp;</td>
              <td align="left" nowrap="nowrap">#hours_eq#</td>
              <td  align="left">#mileage_eq#</td>
              <cfif getequipment.BRANCH_NAME EQ 'Newport News'>
                <CFSET branchnew = "NEWP" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Charlottesville'>
                <CFSET branchnew = "CHAR" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Williamsburg'>
                <CFSET branchnew = "WMBG" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Richmond'>
                <CFSET branchnew = "RICH" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Portsmouth'>
                <CFSET branchnew = "PORT" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Chesterfield'>
                <CFSET branchnew = "CHES" >
                <cfelseif getequipment.BRANCH_NAME EQ 'Corporate'>
                <CFSET branchnew = "CORP" >
                <cfelse>
                <CFSET branchnew = #Left(getequipment.BRANCH_NAME,4)# >
              </cfif>
              <td align="left" nowrap="nowrap">#branchnew#</td>
              <td align="left"><cfif inventory_status EQ 1>
                  Active
                  <cfelseif inventory_status EQ 2>
                  Pending Repair
                  <cfelseif inventory_status EQ 3>
                  In Repair
                  <cfelseif inventory_status EQ 0>
                  Inactive
                  <cfelseif inventory_status EQ 5>
                  Completed Repair
                  <cfelse>
                  Active
                </cfif></td>
              <td align="left"><a href="allocate_equipment.cfm?" onclick="javascript:void window.open('allocate_equipment.cfm?ID=#ID#&branch=#getequipment.BRANCH_NAME#','1384819222444','width=600,height=500,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,right=0,top=10');return false;">Allocate</a></td>
              <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14# 
      </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center"><a href="note_addnote.cfm?ID=#ID#" class="addnote" onclick="javascript:void window.open('note_addnote.cfm?ID=#ID#','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
              <td align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
    </div>
  </div>
  <!-- to clear footer --> 
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> 

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
