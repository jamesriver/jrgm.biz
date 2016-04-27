<cfif IsDefined('form.branch')>
    <cfset SESSION.branch = form.branch>
</cfif>

 <cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="All">
<cfparam name="session.yearsearch" default="All">
<cfparam name="session.inventory_status" default="1">
<cfparam name="session.crew_assignment_last" default="All">
 <CFSET session.crew_assignment_last = 0>

 <cfif IsDefined("form.submitted")>
 <CFSET session.branchsearch = session.BRANCH>
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

<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
    <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  <!--- <cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status")  > AND inventory_status ='#form.inventory_status#'</cfif> --->
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 4 > AND inventory_status ='#form.inventory_status#'</cfif>

 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>
 ORDER by  ID ASC
</cfquery>
      <!-- BEGIN PAGE TITLE -->
     
      <div class="page-title">
      <form id="form_branch" method="post">
        <h1>Printable Inventory Sheet -
            <select name="branch"   tabindex="5" onChange="document.getElementById('form_branch').submit()">
                <option value="Corporate" <cfif SESSION.branch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                <option value="Charlottesville" <cfif SESSION.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                <option value="Chesterfield" <cfif SESSION.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                <option value="Newport News" <cfif SESSION.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                <option value="Portsmouth" <cfif SESSION.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                <option value="Richmond" <cfif SESSION.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
            </select>
        </h1>
        </form>
      </div>
       <div class="searchbar">
     <form action="inventory_report_printable.cfm" method="post">
        <table border="0" cellspacing="0" cellpadding="0" align="center" width="95%">
            <tr>
              <td>
        <span>
        <input type="text" name="criteria" class="form-control input-inline input-medium" placeholder="Search" />
        <input type="submit" value="Search" class="btn btn-primary" />
        </span></td>
        <td>
          <table width="100%">
            <tr>
              <td>
               Status:
<select name="inventory_status" class="bs-select form-control" tabindex="5" onchange='this.form.submit()'>  
       <option value="4"  <cfif session.inventory_status EQ '4'> selected="selected"</cfif> >All</option>	 
                <option value="1" <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
                <option value="2" <cfif session.inventory_status EQ '2'> selected="selected"</cfif> >Pending Repair</option>
                <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
             <!---     <option value="5" <cfif session.inventory_status EQ '5'> selected="selected"</cfif> >Completed Repair</option> --->
         </select>
         </td>
         <td>
         Allocation:
         
  <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees  
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last    WHERE branch ='#SESSION.branch#'
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
   <select name="crew_assignment_last" class="bs-select form-control"  tabindex="5" onchange='this.form.submit()'>
      <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
	  <cfoutput query="get_allocations">
   <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
  
  </cfoutput> </select>  </td>
            </tr>
          </table></td></tr></table>
        <input type="hidden"  name="submitted" value="yes"/>
      </form> </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
    
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
          
          <!-- BEGIN ACCORDION PORTLET-->
					<div class="portlet">
						<div class="portlet-body">
                       
 
		<table class="table large">
       <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th>
         <th align="left" class="sorttable_alpha">Equip ID</th>
            <th align="left">Product Name</th>
            <th align="left">Serial #</th>
            <th align="left">Status</th>
            <th align="left">Allocated To</th>
            <th align="center">In Inventory</th>
            <th align="center" width="200">Notes</th>
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
              <td align="left">&nbsp;  
                <cfif inventory_status EQ 1>
                  Active
                  <cfelseif inventory_status EQ 2>
                  Pending Repair
                  <cfelseif inventory_status EQ 3>
                  In Repair
                  <cfelseif inventory_status EQ 0>
                  Inactive
                  <cfelse>Active
                </cfif> 
              </td>
              <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14#
 </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center" nowrap="nowrap">Yes 
              <input type="checkbox" name="checkbox" id="checkbox" />
              <label for="checkbox">&nbsp;   No&nbsp; 
                <input type="checkbox" name="checkbox2" id="checkbox2" />
              </label>
              </td>
              <td align="center">&nbsp;</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
     
																			
							
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