<cfif IsDefined('form.branch')>
    <cfset SESSION.branch = form.branch>
</cfif>

<cfparam name="yes_list" default="0">
<cfparam name="no_list" default="0">
<cfparam name="notes_list" default="0">
<cfparam name="session.crew_assignment_last" default="All">
<CFSET session.crew_assignment_last = 0>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<cfif NOT IsDefined("Form.Submit")  AND NOT IsDefined("Form.Pend")  AND NOT IsDefined("url.Inventory_Report_ID")>
  <cfquery name="insert_new_report" datasource="jrgm">
  INSERT INTO inventory_report_list 
  (inventory_date,inventory_branch,inventory_user ) VALUES ('#todayDate#','#SESSION.branch#',#SESSION.userid#)
</cfquery>
  <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM inventory_report_list  
</cfquery>
  <CFSET  Inventory_Report_ID = getmaxid.newid>
</cfif>
<cfif   IsDefined("Form.Submit")  OR   IsDefined("Form.Pend")>
  <CFSET  Inventory_Report_ID = form.Inventory_Report_ID>
  <cfquery name="delete_report" datasource="jrgm">
  DELETE FROM inventory_report_results 
  WHERE  Inventory_Report_ID =#Inventory_Report_ID#
</cfquery>
  <cfif   IsDefined("Form.CHECKBOX1")>
    <cfloop index="i" list="#Form.CHECKBOX1#" delimiters=",">
      <cfquery name="insert_yes_info" datasource="jrgm">
  INSERT INTO inventory_report_results 
  (inventory_report_id,equipment_db_id,equipment_yn) VALUES (#inventory_report_id#, #i#, 1)
</cfquery>
    </cfloop>
    <CFSET yes_list = form.CHECKBOX1>
  </cfif>
  <cfif   IsDefined("Form.CHECKBOX0")>
    <cfloop index="i" list="#Form.CHECKBOX0#" delimiters=",">
      <cfquery name="insert_yes_info" datasource="jrgm">
  INSERT INTO inventory_report_results 
  (inventory_report_id,equipment_db_id,equipment_yn) VALUES (#inventory_report_id#, #i#, 0)
</cfquery>
    </cfloop>
    <CFSET no_list = form.CHECKBOX0>
  </cfif>
  <cfloop list="#form.fieldnames#" index="field">
    <cfif left(field,7) EQ "COMMENT" >
      <cfset equipment_db_id = ListLast("#field#","COMMENT_") />
      <cfif evaluate("COMMENT_#equipment_db_id#") NEQ "">
        <CFSET notes =evaluate("COMMENT_#equipment_db_id#")>
        <cfquery name="update_notes" datasource="jrgm">
  UPDATE   inventory_report_results  set  equipment_notes = '#notes#' WHERE equipment_db_id =#equipment_db_id#  AND
  inventory_report_id = #inventory_report_id#
  </cfquery>
        <cfset notes_list = ListAppend(notes_list,equipment_db_id)>
      </cfif>
    </cfif>
  </cfloop>
</cfif>
<cfquery name="get_report_info_notes" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_notes IS NOT NULL
</cfquery>
<cfloop query="get_report_info_notes">
  <cfset notes_list = ListAppend(notes_list,equipment_db_id)>
</cfloop>
<cfif   IsDefined("Form.Submit")  >
  <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_status = 1  WHERE ID =#Inventory_Report_ID#
 </cfquery>
</cfif>
<cfif   IsDefined("Form.Pend")  >
  <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_status = 0  WHERE ID =#Inventory_Report_ID#
 </cfquery>
</cfif>
<cfif  IsDefined("form.filter")  AND CREW_ASSIGNMENT_LAST NEQ 'All'>
  <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_filter = #form.CREW_ASSIGNMENT_LAST# WHERE ID =#Inventory_Report_ID#
 </cfquery>
</cfif>
<cfif   IsDefined("url.Inventory_Report_ID")  >
  <CFSET  Inventory_Report_ID = #url.Inventory_Report_ID#>
  <cfquery name="get_report_info1" datasource="jrgm">
  SELECT * FROM inventory_report_list 
  WHERE ID = #Inventory_Report_ID#
</cfquery>
  <cfif  get_report_info1.inventory_filter NEQ "">
    <CFSET form.crew_assignment_last = get_report_info1.inventory_filter>
  </cfif>
  <cfquery name="get_report_info_yes" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_yn =1
</cfquery>
  <cfloop query="get_report_info_yes">
    <cfset yes_list = ListAppend(yes_list,equipment_db_id)>
  </cfloop>
  <cfquery name="get_report_info_no" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_yn =0
</cfquery>
  <cfloop query="get_report_info_no">
    <cfset no_list = ListAppend(no_list,equipment_db_id)>
  </cfloop>
</cfif>
<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<cfif  IsDefined("form.filter")  AND CREW_ASSIGNMENT_LAST NEQ 'All'>
  <cfquery name="get_filter_employee" datasource="jrgm">
SELECT   [Employee ID],  [Name FirstLast]  AS employee_name FROM app_employees
WHERE    [Employee ID] = #form.crew_assignment_last#
 </cfquery>
</cfif>
<cfif  IsDefined("CREW_ASSIGNMENT_LAST") AND CREW_ASSIGNMENT_LAST NEQ 'All'>
  <cfquery name="get_filter_employee" datasource="jrgm">
SELECT   [Employee ID],  [Name FirstLast]  AS employee_name FROm app_employees
WHERE  [Employee ID] = #form.crew_assignment_last#
 </cfquery>
</cfif>
<!---      OR IsDefined("CREW_ASSIGNMENT_LAST")> --->

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
      <cfquery name="getequipment" datasource="jrgm"  >
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 4 > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>
 ORDER by  ID ASC
</cfquery>
      <cfif   IsDefined("Form.Pend")  >
        <div class="inventory-message">Your Inventory Report is Pended.<br />
          <a href="default.cfm" class="bluebutton">Go to Home Screen</a> <a href="inventory_report_printable_eversion1.cfm?Inventory_Report_ID=<cfoutput>#Inventory_Report_ID#</cfoutput>" class="bluebutton">Continue With the Report</a></div>
        <cfabort>
      </cfif>
      <cfif   IsDefined("Form.submit")  >
        <div class="inventory-message">Your Inventory Report is Submitted. <br />
          <a href="default.cfm" class="bluebutton">Go to Home Screen</a></div>
        <cfabort>
      </cfif>
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
        <h1>Equipment Inventory Report</h1>
      </div>
      <table class="table large">
                  <tbody>
                    <tr>
                    <td>
                        <form id="form_branch" method="post">
                        Branch:
                            <select name="branch"   tabindex="5" onChange="document.getElementById('form_branch').submit()">
                                <option value="Corporate" <cfif SESSION.branch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                                <option value="Charlottesville" <cfif SESSION.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                                <option value="Chesterfield" <cfif SESSION.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                                <option value="Newport News" <cfif SESSION.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                                <option value="Portsmouth" <cfif SESSION.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                                <option value="Richmond" <cfif SESSION.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                            </select>
                        </form>
                        </br ><br />
                    </td>
                    <td>Report ID: <cfoutput>#Inventory_Report_ID#</cfoutput></td>
                    <td>
					<cfif  IsDefined("form.filter")  AND (IsDefined("CREW_ASSIGNMENT_LAST")  AND CREW_ASSIGNMENT_LAST NEQ 'All')>
                    Filter: <cfoutput>#get_filter_employee.employee_name#</cfoutput>
          </cfif>
          <cfif NOT IsDefined("form.filter") AND     NOT IsDefined("CREW_ASSIGNMENT_LAST")>
            <form action="inventory_report_printable_eversion1.cfm" method="post">
              Filter:
              <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name,Crew_assignment_last
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   WHERE  branch = '#SESSION.branch#'
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
              <select name="crew_assignment_last"   tabindex="5" onchange='this.form.submit()' class="bs-select form-control">
                <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
                <option   value ="3"  <cfif get_allocations.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
                <option   value ="5"  <cfif get_allocations.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
                <cfoutput query="get_allocations">
                  <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
                </cfoutput>
              </select>
              <input type="hidden"  name="filter" value="yes"/>
            </form>
          </cfif>
          </td>
                    </tr>
                    <tr>
                    <td>Date: <cfoutput>#todayDate#</cfoutput></td><td>User: <cfoutput>#SESSION.screenname#</cfoutput></td><td></td>
                    </tr></tbody></table>
          
                    
        </div>
      </div>
      <!-- END PAGE TITLE --> 
      
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
              <form action="inventory_report_printable_eversion1.cfm" method="post">
                <table class="table largefull">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Category</th>
                      <th>Equip ID</th>
                      <th>Product Name</th>
                      <th>Serial #</th>
                      <th>Status</th>
                      <th>Allocated To</th>
                      <th>In Inventory</th>
                      <th>Notes</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="getequipment">
                      <tr>
                        <td>#ID#</td>
                        <td>#Category#</td>
                        <td>#Equipment_ID#</td>
                        <td>#Product_Name#</td>
                        <td>#Serial_Number#</td>
                        <td>
                          <cfif inventory_status EQ 1>
                            Active
                            <cfelseif inventory_status EQ 2>
                            Pending Repair
                            <cfelseif inventory_status EQ 3>
                            In Repair
                            <cfelseif inventory_status EQ 0>
                            Inactive
                            <cfelse>
                            Active
                          </cfif></td>
                        <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14#
 </cfquery>
                        <td>#get_branch_employees_cache.fullname#</td>
                        <td nowrap="nowrap">Yes
                          <input type="checkbox" name="checkbox1" class="form-control" value="#ID#"   
			  <cfif listFindNoCase(yes_list, ID)>checked="checked"</cfif> />
                          &nbsp;   No&nbsp;
                          <input type="checkbox" name="checkbox0" class="form-control"  value="#ID#"    
				<cfif listFindNoCase(no_list, ID)>checked="checked"</cfif> /></td>
                        <td><cfif listFindNoCase(notes_list, ID)>
                            <cfquery name="get_report_info_notesA" dbtype="query">
  SELECT * FROM get_report_info_notes 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_db_id  =#getequipment.ID#
</cfquery>
                            <textarea name="comment_#ID#" id="styled" class="form-control">#get_report_info_notesA.equipment_notes#</textarea>
                            <cfelse>
                            <textarea name="comment_#ID#" id="styled" class="form-control"></textarea>
                          </cfif></td>
                      </tr>
                    </cfoutput>
                  <input type="hidden" name="Inventory_Report_ID"  value="<cfoutput>#Inventory_Report_ID#</cfoutput>" />
                  <tr>
                    <td colspan="8"><div align="right"><span class="text-danger">Pending the Report will allow you to come back later and make changes and then make final submission.</span></div></td>
                    <td><input type="submit"  name="pend"   value="Pend Report" class="btn btn-primary" /></td>
                  </tr>
                  <tr>
                    <td colspan="8"><div align="right"><span class="text-danger">Submitting the Report is FINAL. No changes can be made after clicking the submit report button.</span></div></td>
                    <td><input type="submit" name="submit"  value="Submit Report" class="btn btn-primary" /></td>
                  </tr>
                    </tbody>
                  
                </table>
              </form>
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