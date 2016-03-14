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
    <div class="centrecontent_inner">
      <div class="search">
        <form action="inventory_list.cfm" method="post">
          <table width="100%" border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor= "#6a9182"  bordercolorlight="White">
            <tr>
              <td bgcolor="#F2F7F5"><input type="text" name="criteria" class="search square" placeholder="Search...">
                <input type="submit" value="Search Equipment"></td>
            </tr>
            <tr>
              <td class="search-td">Category :
                <select name="Category"   tabindex="5" onchange='this.form.submit()'>
                  <option value="All" <cfif session.categorysearch EQ 'All'> selected="selected"</cfif>>All</option>
                  <option value="Aerators"  <cfif session.categorysearch EQ 'Aerators'> selected="selected"</cfif>>Aerators</option>
                  <option value="Blowers"  <cfif session.categorysearch EQ 'Blowers'> selected="selected"</cfif>>Blowers</option>
                  <option value="Chainsaws"  <cfif session.categorysearch EQ 'Chainsaws'> selected="selected"</cfif>>Chainsaws</option>
                  <option value="Construction Equipment"  <cfif session.categorysearch EQ 'Construction Equipment'> selected="selected"</cfif>>Construction Equipment</option>
                  <option value="Edgers"  <cfif session.categorysearch EQ 'Edgers'> selected="selected"</cfif>>Edgers</option>
                  <option value="Leaf Vaccuums"  <cfif session.categorysearch EQ 'Leaf Vacuums'> selected="selected"</cfif>>Leaf Vacuums</option>
                  <option value="Misc. Equipment"  <cfif session.categorysearch EQ 'Misc. Equipment'> selected="selected"</cfif>>Misc. Equipment</option>
                  <option value="Mowers"  <cfif session.categorysearch EQ 'Mowers'> selected="selected"</cfif>>Mowers</option>
                  <option value="Pruners"  <cfif session.categorysearch EQ 'Pruners'> selected="selected"</cfif>> Pruners</option>
                  <option value="Snow Equipment"  <cfif session.categorysearch EQ 'Snow Equipment'> selected="selected"</cfif>> Snow Equipment</option>
                  <option value="Spray Equipment"  <cfif session.categorysearch EQ 'Spray Equipment'> selected="selected"</cfif>>Spray Equipment</option>
                  <option value="Spreaders"  <cfif session.categorysearch EQ 'Spreaders'> selected="selected"</cfif>>Spreaders</option>
                  <option value="Tools"  <cfif session.categorysearch EQ 'Tools'> selected="selected"</cfif>>Tools</option>
                  <option value="Trailers"  <cfif session.categorysearch EQ 'Trailers'> selected="selected"</cfif>>Trailers</option>
                  <option value="Vehicles"  <cfif session.categorysearch EQ 'Vehicles'> selected="selected"</cfif>>Vehicles</option>
                  <option value="Weedeaters"  <cfif session.categorysearch EQ 'Weedeaters'> selected="selected"</cfif>>Weedeaters</option>
                </select>
                &nbsp; &nbsp;&nbsp; &nbsp; Branch:
                <select name="BRANCH_NAME"   tabindex="5" onchange='this.form.submit()'>
                  <option value="All"   <cfif session.branchsearch EQ 'All'> selected="selected"</cfif>>All</option>
                  <option value="Charlottesville" <cfif session.branchsearch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                  <option value="Chesterfield" <cfif session.branchsearch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                  <option value="Corporate" <cfif session.branchsearch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                  <option value="Irrigation" <cfif session.branchsearch EQ 'Irrigation'> selected="selected"</cfif>>Irrigation</option>
                  <option value="Landscape" <cfif session.branchsearch EQ 'Landscape'> selected="selected"</cfif>>Landscape</option>
                  <option value="Newport News" <cfif session.branchsearch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                  <option value="Portsmouth" <cfif session.branchsearch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                  <option value="Richmond" <cfif session.branchsearch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                  <option value="SAUDE" <cfif session.branchsearch EQ 'SAUDE'> selected="selected"</cfif>>SAUDE</option>
                  <option value="Williamsburg" <cfif session.branchsearch EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
                </select>
                &nbsp; &nbsp;&nbsp; &nbsp; Year:
                <select name="Equipment_year" onchange='this.form.submit()'>
                  <option value="All"  <cfif session.yearsearch EQ 'All'> selected="selected"</cfif>>All</option>
                  <option value="2016"  <cfif session.yearsearch EQ '2016'> selected="selected"</cfif>>2016</option>
                  <option value="2015"  <cfif session.yearsearch EQ '2015'> selected="selected"</cfif>>2015</option>
                  <option value="2014"  <cfif session.yearsearch EQ '2014'> selected="selected"</cfif>>2014</option>
                  <option value="2013"  <cfif session.yearsearch EQ '2013'> selected="selected"</cfif>>2013</option>
                  <option value="2012"  <cfif session.yearsearch EQ '2012'> selected="selected"</cfif>>2012</option>
                  <option value="2011"  <cfif session.yearsearch EQ '2011'> selected="selected"</cfif>>2011</option>
                  <option value="2010"  <cfif session.yearsearch EQ '2010'> selected="selected"</cfif>>2010</option>
                  <option value="2009"  <cfif session.yearsearch EQ '2009'> selected="selected"</cfif>>2009</option>
                  <option value="2008"  <cfif session.yearsearch EQ '2008'> selected="selected"</cfif>>2008</option>
                  <option value="2007"  <cfif session.yearsearch EQ '2007'> selected="selected"</cfif>>2007</option>
                  <option value="2006"  <cfif session.yearsearch EQ '2006'> selected="selected"</cfif>>2006</option>
                  <option value="2005"  <cfif session.yearsearch EQ '2005'> selected="selected"</cfif>>2005</option>
                  <option value="2004"  <cfif session.yearsearch EQ '2004'> selected="selected"</cfif>>2004</option>
                  <option value="2003"  <cfif session.yearsearch EQ '2003'> selected="selected"</cfif>>2003</option>
                  <option value="2002"  <cfif session.yearsearch EQ '2002'> selected="selected"</cfif>>2002</option>
                  <option value="2001"  <cfif session.yearsearch EQ '2001'> selected="selected"</cfif>>2001</option>
                  <option value="2000"  <cfif session.yearsearch EQ '2000'> selected="selected"</cfif>>2000</option>
                  <option value="1999"  <cfif session.yearsearch EQ '1999'> selected="selected"</cfif>>1999</option>
                  <option value="1998"  <cfif session.yearsearch EQ '1998'> selected="selected"</cfif>>1998</option>
                  <option value="1997"  <cfif session.yearsearch EQ '1997'> selected="selected"</cfif>>1997</option>
                  <option value="1996"  <cfif session.yearsearch EQ '1996'> selected="selected"</cfif>>1996</option>
                  <option value="1995"  <cfif session.yearsearch EQ '1995'> selected="selected"</cfif>>1995</option>
                  <option value="1994"  <cfif session.yearsearch EQ '1994'> selected="selected"</cfif>>1994</option>
                </select>
                &nbsp; &nbsp;&nbsp; &nbsp; <br />
                <br />
                Status:
                <select name="inventory_status"   tabindex="5" onchange='this.form.submit()'>
                  <option value="4"  <cfif session.inventory_status EQ '4'> selected="selected"</cfif> >All-Inactive</option>
                  <option value="1" <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                  <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
                  <option value="2" <cfif session.inventory_status EQ '2'> selected="selected"</cfif> >Pending Repair</option>
                  <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
                  <option value="5" <cfif session.inventory_status EQ '5'> selected="selected"</cfif> >Completed Repair</option>
                </select>
                &nbsp; &nbsp;&nbsp; &nbsp; Allocation:
                <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
                <select name="crew_assignment_last"   tabindex="5" onchange='this.form.submit()'>
                  <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
                  <cfoutput query="get_allocations">
                    <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
                  </cfoutput>
                </select>
                &nbsp; &nbsp;&nbsp; &nbsp; Oil Change Criteria:
                <select name="oil_change_criteria"   tabindex="6" onchange='this.form.submit()'>
                  <option value="All" <cfif session.oil_change_criteria EQ 'All'> selected="selected"</cfif>>All</option>
                  <option value="0"  <cfif  session.oil_change_criteria EQ ''> selected="selected"</cfif>>N/A</option>
                  <option value="0"  <cfif session.oil_change_criteria EQ '0'> selected="selected"</cfif>>N/A</option>
                  <option value="1"  <cfif session.oil_change_criteria EQ '1'> selected="selected"</cfif>>Hours+100 Hours</option>
                  <option value="5"   <cfif session.oil_change_criteria EQ '5' > selected="selected"</cfif>>Hours+200 Hours</option>
                  <option value="2"   <cfif session.oil_change_criteria EQ '2' > selected="selected"</cfif>>Mileage+5000 Miles</option>
                  <option value="3"   <cfif session.oil_change_criteria EQ '3' > selected="selected"</cfif>>Mileage+10000 Miles</option>
                  <option value="4"   <cfif session.oil_change_criteria EQ '4' > selected="selected"</cfif>>Date+30 Days</option>
                </select></td>
            </tr>
          </table>
          <input type="hidden"  name="submitted" value="yes"/>
        </form>
      </div>
      <br />
      <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),Date_Purchased,hours_mileage,oil_change_criteria
  FROM equipment WHERE 0=0 
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> 
<cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif> 

<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> 
<cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 6 AND form.inventory_status NEQ 4 > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>
  <cfif IsDefined("form.oil_change_criteria") AND form.oil_change_criteria NEQ "All">  AND  oil_change_criteria = #form.oil_change_criteria# </cfif>
 <cfif IsDefined("url.purchdatesort")> ORDER by  Date_Purchased DESC <cfelse>ORDER by  ID ASC</cfif>
</cfquery>
      <div class="header">
        <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" >
          <cfoutput>#form.BRANCH_NAME#</cfoutput>
          <cfelse>
          JRGM
        </cfif>
        Equipment List
        <cfif IsDefined("form.category") AND form.category NEQ "All" >
          <cfoutput>(#form.category#)</cfoutput>
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
          Inactive Equipment
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
      <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
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
