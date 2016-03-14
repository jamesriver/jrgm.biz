<cfparam name="form.active"  default="1">

 <cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="All">
  <cfparam name="session.yearsearch" default="All">
      <cfparam name="session.inventory_status" default="1">

 <cfif IsDefined("form.submitted")>
 <CFSET session.branchsearch = form.BRANCH_NAME>
  <CFSET session.Categorysearch = form.Category>
 <CFSET session.yearsearch = form.Equipment_year>
 <CFSET session.inventory_status = form.inventory_status>
 </cfif>
 
 
 
 <cfparam name="category" default="">
 <cfparam name="form.show"  default="active">
 <cfparam name="getequipment.crew_assignment_last" default="0">
 
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
<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}

 table.sortable {
	background:#FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable thead {
	padding: 10px;
	background-color: #cde3fc;
	color:#000;
	cursor: default;
	font: bold .8em Arial, Helvetica, sans-serif;
	}
table.sortable thead th {
	padding: 10px;
	background-color: #cde3fc;
	color: 000;
	font: bold 1em Arial, Helvetica, sans-serif;
}

table.sortable tbody tr {
	border: 1px solid #b3d4e5;
	padding: 5px;
	}
	
table.sortable tbody tr.alt {
	background: #ffffff url(../images/tralt-bg.jpg) top left repeat-x;
	}
	
table.sortable tbody tr:hover {
	background: #cde3fc none;
	}
	
table.sortable tbody td {
	padding: 10px;
	font: normal .85em Arial, Helvetica, sans-serif;
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
	@charset "UTF-8";
/* CSS Document */
form{
	margin:0 auto;
}
.search { 
    background-color: #F8FAF9;
	padding:7px 155px 9px 10px;
	margin:3px; 
}
input[type=text]{
	color:#333;
}

.spacerw { width: 40px;}

.record-count {
	padding-left: 10px;
	padding-bottom: 10px;
	font: 22px Arial, Helvetica, sans-serif;
	color: #c9742b;	
}

.search-td {
	padding: 10px;
	font: normal .75em Arial, Helvetica, sans-serif;
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
    <form action="inventory_list.cfm" method="post">
     <span><input type="text" name="criteria" class="search square" placeholder="Search..."><input type="submit" value="Search Equipment"></span>
     
   <div class="search">
   <table border="0" cellspacing="0" cellpadding="0"> 
  
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
         <cfif  SESSION.regionname  EQ 'Western'> <option value="Charlottesville" <cfif session.branchsearch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option></cfif>
          <cfif  SESSION.regionname  EQ 'Western'> <option value="Chesterfield" <cfif session.branchsearch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option></cfif>
            <cfif  SESSION.regionname  EQ 'Eastern'>  <option value="Newport News" <cfif session.branchsearch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option></cfif>
          <cfif  SESSION.regionname  EQ 'Eastern'>   <option value="Portsmouth" <cfif session.branchsearch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option></cfif>
          <cfif  SESSION.regionname  EQ 'Western'> <option value="Richmond" <cfif session.branchsearch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option></cfif>
           <cfif  SESSION.regionname  EQ 'Eastern'>   <option value="Williamsburg" <cfif session.branchsearch EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option></cfif>
        </select>
      &nbsp; &nbsp;&nbsp; &nbsp; Year:
      <select name="Equipment_year" onchange='this.form.submit()'>  
         <option value="All"  <cfif session.yearsearch EQ 'All'> selected="selected"</cfif>>All</option>
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
        <option value="2000">2000</option>
        <option value="1999">1999</option>
        <option value="1998">1998</option>
        <option value="1997">1997</option>
        <option value="1996">1996</option>
        <option value="1995">1995</option>
        <option value="1994">1994</option>
        <option value="1993">1993</option>
        <option value="1992">1992</option>
        <option value="1991">1991</option>
        <option value="1990">1990</option>
        <option value="1989">1989</option>
</select>
  &nbsp; &nbsp;&nbsp; &nbsp; Status:
       <select name="inventory_status"   tabindex="5" onchange='this.form.submit()'>  
          <option value="4"  <cfif session.inventory_status EQ '4'> selected="selected"</cfif> >All-Inactive</option>	
                <option value="1" <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
             <option value="5"  <cfif session.inventory_status EQ '5'> selected="selected"</cfif> >Completed Repair</option>	
                <option value="2" <cfif session.inventory_status EQ '2'> selected="selected"</cfif> >Pending Repair</option>
                <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
         </select> </td>
    </tr>
   </table>
      <input type="hidden"  name="submitted" value="yes"/>
</form>
   
 <!--- <cfoutput>#branchlist#</cfoutput> --->
<cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND BRANCH_NAME IN (#PreserveSingleQuotes(branchlist)#) 
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif> <cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<!--- <cfif IsDefined("form.inventory_status") AND form.inventory_status LT 4 > AND inventory_status ='#form.inventory_status#'</cfif> --->
 <cfif IsDefined("form.inventory_status") AND form.inventory_status LT 6 AND  form.inventory_status NEQ 4   >  AND inventory_status ='#form.inventory_status#'</cfif>
ORDER by  ID ASC
</cfquery>
      <div class="spacer20"></div>
     <div class="header"><cfoutput>#regionname#</cfoutput> Region Inventory List-<cfoutput>#getequipment.recordcount#</cfoutput> Records&nbsp; &nbsp;
 	          (<cfif session.inventory_status EQ '4'>All Equipment-Not Including Inactive</cfif>	
             <cfif session.inventory_status EQ '1'>Active Equipment</cfif>	
                 <cfif session.inventory_status EQ '0'>Inactive Equipment</cfif>	
               <cfif session.inventory_status EQ '2'>Equipment Pending Repair</cfif>	
               <cfif session.inventory_status EQ '3'>Equipment In Repair</cfif>
            <cfif session.inventory_status EQ '5'>Equipment Completed Repair</cfif>)</div>
 
 <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
   <tr>
     <th align="center">ID</th>
     <th align="left">Category</th>
     <th align="left" class="sorttable_alpha">Equip<br />
       ID</th>
     <th align="left">Product Name</th>
     <th align="left" class="sorttable_alpha">Serial Number</th>
     <th align="center">Year</th>
     <th align="center">Mileage/<br />
       Hours</th>
     <th align="left">Branch</th>
     <th align="left">Status</th>
     <th align="left" nowrap="nowrap">History &amp; Allocate<br />
       Oil Change &amp; Inspection</th>
   <th align="center">Repair</th> 
     <th align="left">Allocated To</th>
     <th align="center"> Compl. Date</th>
     <th align="center">Repair Notes</th>
   </tr> 
 </thead> 
  
     <tbody>  
  <cfoutput query="getequipment">
   <tr>
    <td align="center">#ID#</td>
    <td>#Category#</td>
    <td align="left" >#Equipment_ID#</td>
<td align="left" >#Product_Name#</td>
    <td align="left">#Serial_Number#</td>    

    <td align="center">#Equipment_Year#</td>
    <td  align="right">
 <cfif engine_cycle EQ 2>
  #mileage_eq#&nbsp; 
  <cfelseif engine_cycle EQ 4>
  #hours_eq#&nbsp; 
  <cfelse>
  &nbsp; 
  </cfif>
   </td>
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
                </cfif> </td>
   <td align="center"> <a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">Allocate</a></td>
              <td align="left"> <a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">Repair</a></td>
  <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14# 
 </cfquery>

  <td align="left">#get_branch_employees_cache.fullname#</td>
    <td align="center">&nbsp;</td>
    <td align="center"><a href="note_addnote.cfm?ID=#ID#&branch=#BRANCH_NAME#" class="addnote">+</a></td>
   </tr>
  </cfoutput></tbody>
</table>
      <br />
      <br />
    </div>
  </div>
  <!-- to clear footer -->
</div>
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
