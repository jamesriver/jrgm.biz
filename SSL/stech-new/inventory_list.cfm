<cfparam name="form.show"  default="active">
<cfparam name="form.active"  default="1">
<cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="#Session.branch#">
<cfparam name="session.yearsearch" default="All">
<cfparam name="session.activeinactive" default="1">
 <cfparam name="session.inventory_status" default="1">
  <CFSET session.crew_assignment_last = 0>
  
<cfif IsDefined("form.submitted")>
  <CFSET session.branchsearch = #Session.branch#>
  <CFSET session.Categorysearch = form.Category>
  <CFSET session.yearsearch = form.Equipment_year>
     <CFSET session.inventory_status = form.inventory_status>
     <CFSET session.crew_assignment_last = form.crew_assignment_last>
</cfif>
<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
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
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->


<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
       <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif>
 <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 6 AND    form.inventory_status NEQ 4   > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>

ORDER by  ID ASC
</cfquery>
      <div class="page-title">
        <h1><cfoutput>#Session.branch#</cfoutput> Equipment List-<cfoutput>#getequipment.recordcount#</cfoutput> Records&nbsp; &nbsp;
 	          (<cfif session.inventory_status EQ '4'>All Equipment-Not Including Inactive</cfif>	
             <cfif session.inventory_status EQ '1'>Active Equipment</cfif>	
                 <cfif session.inventory_status EQ '0'>Inactive Equipment</cfif>	
                <cfif session.inventory_status EQ '2'>Equipment Pending Repair</cfif>	
               <cfif session.inventory_status EQ '3'>Equipment In Repair</cfif>
               <cfif session.inventory_status EQ '5'>Equipment Completed Repair</cfif>	)
	  </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Equipment</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-12"> 
        <form action="inventory_list.cfm" method="post"> 
    <table class="table large" >
    <tbody>
  <tr>
    <td colspan="4">
      <input type="text" name="criteria" class="form-control input-inline input-medium" placeholder="Search">&nbsp;&nbsp;
      <input type="submit" value="Search Equipment" class="btn btn-primary">
     
       </td>
    </tr>
      <tr>
    <td nowrap="nowrap">Category:&nbsp;&nbsp;<select name="Category" class="bs-select form-control input-small"  tabindex="5" onchange='this.form.submit()'>  
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
        </select></td>
     
      <td><label class="control-label">Year:</label>
      <select name="Equipment_year" class="bs-select form-control input-small" onchange='this.form.submit()'>  
         <option value="All"  <cfif session.yearsearch EQ 'All'> selected="selected"</cfif>>All</option>
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
 </select></td>
  <td>Status:
       <select name="inventory_status" class="bs-select form-control input-small"  tabindex="5" onchange='this.form.submit()'>  
          <option value="4"  <cfif session.inventory_status EQ '4'> selected="selected"</cfif> >All-Inactive</option>	
                <option value="1" <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
                    <option value="5"  <cfif session.inventory_status EQ '5'> selected="selected"</cfif> >Completed Repair</option>	
                <option value="2" <cfif session.inventory_status EQ '2'> selected="selected"</cfif> >Pending Repair</option>
                <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
         </select></td> 
         
               <td>Allocation:
         
  <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name,Branch
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   
WHERE    APP_employees.Branch = '#session.branch#'
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
   <select name="crew_assignment_last"  class="bs-select form-control input-small" tabindex="5" onchange='this.form.submit()'>
      <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
        <option   value ="3"  <cfif session.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
           <option   value ="5"  <cfif session.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
           <option   value ="6"  <cfif session.Crew_assignment_last  EQ 6> selected="selected"</cfif>>Lost</option>
	  <cfoutput query="get_allocations">
   <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
  
  </cfoutput> </select> 
         </td>
    </tr>
    </tbody>
   </table>
      <input type="hidden"  name="submitted" value="yes"/>
</form>
 
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                        <div class="table-responsive">
		<table class="table table-striped table-hover" id="sample_5">
   <thead> 
  <tr>
            <th>ID</th>
            <th>Category</th>
            <th>EQID</th>
            <th>Product<br>Name</th>
            <th>Serial #</th>
            <th>Year</th>
            <th><div align="center">Mileage/<br>Hours</div></th>
            <th>Branch</th>
            <th>Status</th>
            <th>Oil Change</th>
          <!---  <th>Repair</th>--->
            <th>Allocate<br>To</th>
            <th>Compl.<br>Date</th>
            <th><div align="center">Repair<br>Notes</div></th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="getequipment">
            <tr>
              <td>#ID#
            </td>
              <td nowrap="nowrap">#Category#</td>
              <td>#Equipment_ID#
           </td>
              <td>#Product_Name#</td>
              <td>#Serial_Number#</td>
              <td>#Equipment_Year#</td>
              <td><div align="center"><cfif engine_cycle EQ 2>
                  #mileage_eq#&nbsp;
                  <cfelseif engine_cycle EQ 4>
                  #hours_eq#&nbsp;
                  <cfelse>
                  &nbsp;
                </cfif></div>
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
              <td nowrap="nowrap">#branchnew#</td>
                <td>
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
               <td><a href="history_allocation.cfm?ID=#ID#">Oil Change</a></td>
          <!---    <td><a href="history_allocation.cfm?ID=#ID#">Repair</a></td>--->
              <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14#
 </cfquery>
              <td>#get_branch_employees_cache.fullname#</td>
              <td>&nbsp;</td>
           <td><div align="center"><a href="note_addnote.cfm?ID=#ID#"><i class="fa fa-plus"></i></a></div></td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      </div>
						</div>
					</div>
					<!-- END ACCORDION PORTLET-->
          
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 

<!-- BEGIN FOOTER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --> 
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]--> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {       
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script>
</body>
<!-- END BODY -->
</html>