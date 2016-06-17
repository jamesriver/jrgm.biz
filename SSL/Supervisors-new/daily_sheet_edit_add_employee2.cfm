<cfif IsDefined("form.EMPLOYEEID") >
  <cfquery name="insert_time" datasource="jrgm">
 INSERT INTO app_employee_payroll_clock (Employee_ID,crew_leader,supervisor,ds_id, In_Out_Status, time_worked,ds_date,entry_method) 
 VALUES (#form.EMPLOYEEID#,#form.crew_leader#,#form.supervisor#,#dsid#,2,0,'#form.ds_date#',2)
 </cfquery>
  <cfquery name="get_this_employee" datasource="jrgm">
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE active_record = 1 AND  [Employee ID] =#form.EMPLOYEEID#
</cfquery>
  <!--- Get all Job_clock_ids for this DS --->
  <cfquery name="get_job_clock_ids" datasource="jrgm"  >
SELECT   *  FROM app_job_clock WHERE ds_id =#dsid#
 </cfquery>
  <cfloop   query="get_job_clock_ids">
    <cfquery name="insert_app_job_services_actual_employee" datasource="jrgm">
  INSERT INTO app_job_services_actual_employee 
    (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   (#form.EMPLOYEEID#,'#get_job_clock_ids.job_ID#','0000','0','#form.dsid#','#form.CREW_LEADER#',#get_job_clock_ids.ID#) 
   </cfquery>
  </cfloop>
  <!--- Get all Job_clock_ids for this DS --->
  <!---   <cfabort> --->
</cfif>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.dsid")>
  <CFSET ds_id= url.dsid>
</cfif>

<cfquery name="get_ds" datasource="jrgm">
SELECT   * FROM app_daily_sheets  WHERE ID=#ds_id#
</cfquery>
<cfif get_ds.recordcount EQ 0>
    Invalid Daily Sheet.
    <cfabort>
</cfif>

<cfquery name="get_DSID_info" datasource="jrgm"  >
SELECT   ds_date,supervisor_id, crew_leader_id   FROM app_daily_sheets
WHERE ID =#dsid#
 </cfquery>
<cfquery name="get_branch_employees_on_DSID" datasource="jrgm"  >
SELECT   employee_id   FROM app_employee_payroll_clock
WHERE ds_id =#dsid#
 </cfquery>
<CFSET mylist ="0">
<cfloop query="get_branch_employees_on_DSID">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<!--- Get Employee List --->
<cfset employees_select = ArrayNew(1)>
<cfquery name="get_employees_in_crew" datasource="jrgm"  >
    SELECT * FROM app_crews_new
    WHERE (crew_leader_id=#get_ds.crew_leader_id#
       OR employee_id=#get_ds.crew_leader_id#
       )
       AND  [employee_id] NOT IN (#mylist#)
    ORDER BY last_name
 </cfquery>
 <cfloop query="get_employees_in_crew">
   <cfset myList = ListAppend(mylist,Employee_ID)>
   <cfset employee_name = crew_name>
   <cfif employee_branch NEQ SESSION.branch>
        <cfset employee_name = employee_name & ' [' & employee_branch & ']'>
   </cfif>
   <cfset employee_name = employee_name & ' (assigned to current crew)'>
   <cfset ArrayAppend(employees_select, [employee_id, employee_name])>
 </cfloop>
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1 AND  [Employee ID] NOT IN (#mylist#)
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<cfloop query="get_branch_employees">
    <cfset ArrayAppend(employees_select, [employee_id, fullname])>
</cfloop>

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
<link href="assets/admin/layout3/css/dsicons.css" rel="stylesheet" type="text/css">
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
      
      <div class="page-title">
        <h1>Daily Sheet Add Employee</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="dailysheet_select.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#url.dsid#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Edit Daily Sheet</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <form   method="post" action="daily_sheet_edit_add_employee2.cfm?dsid=<cfoutput>#url.dsid#</cfoutput>"   onsubmit="setTimeout('window.close()',1000)">
            <table class="table large">
              <tr>
                <td nowrap="nowrap"><strong>Choose employee to add:</strong></td>
                <td><select name="employeeID" class="bs-select form-control">
                    <cfoutput>
                    <cfloop from="1" to="#arrayLen(employees_select)#" index="i">
                        <cfset employee = employees_select[i]>
                        <option value="#employee[1]#">#employee[2]#</option>
                    </cfloop>
                    </cfoutput>
                  </select></td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td><div align="right"> <cfoutput>
                      <input type="hidden" name="ds_date"   value="#DateFormat(get_DSID_info.ds_date, "yyyy-mm-dd")#" />
                      <input type="hidden" name="dsid"   value="#dsid#" />
                      <input type="hidden" name="crew_leader"  value="#get_DSID_info.crew_leader_id#"  />
                      <input type="hidden" name="supervisor"   value="#get_DSID_info.supervisor_id#" />
                    </cfoutput>
                    <input type="submit" name="submit" id="submit" value="Submit"  class="btn btn-primary"/>
                    <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#url.dsid#</cfoutput>" class="btn btn-primary">Back to Daily Sheet</a> </div></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <cfif IsDefined("form.EMPLOYEEID")>
        <div class="row">
          <div class="col-md-12">
            <h2 class="text-danger"><cfoutput>#get_this_employee.fullname#</cfoutput> has been added to the daily sheet.</h2>
            <p>Please select another employee to add or close this window to go back to the daily sheet.</p>
            <cfoutput>
              <p>Please make sure to refresh the daily sheet by clicking the blue refresh icon to edit this employee.</p>
            </cfoutput> </div>
        </div>
      </cfif>
      
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>

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