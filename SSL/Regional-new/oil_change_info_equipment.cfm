<cfif IsDefined("form.EquipmentID")>
  <CFSET EquipmentID =form.EquipmentID>
</cfif>
<cfif IsDefined("url.ID")>
  <CFSET EquipmentID =url.ID>
</cfif>
<cfif IsDefined("form.submit")  AND  OIL_CHANGE_DATE IS NOT  "" AND EMPLOYEEID NEQ 0 >
  <cfquery name="insert_eq_table" datasource="jrgm"  >
INSERT INTO equipment_oil_changes (EQUIPMENT_ID,enter_date, last_oil_change_employee_id,oil_change_date,
last_oil_change_mileage,LAST_OIL_CHANGE_HOURS,entered_by)     
VALUES 
('#form.EquipmentID#',CURRENT_TIMESTAMP,'#EMPLOYEEID#', '#form.oil_change_date#',
'#form.LAST_OIL_CHANGE_MILEAGE#',   '#form.LAST_OIL_CHANGE_HOURS#','#SESSION.userid#')
  </cfquery>
  <cfif  form.LAST_OIL_CHANGE_HOURS EQ "">
    <CFSET form.LAST_OIL_CHANGE_HOURS =0>
  </cfif>
  <cfif  form.LAST_OIL_CHANGE_MILEAGE EQ "">
    <CFSET form.LAST_OIL_CHANGE_MILEAGE =0>
  </cfif>
  <cfquery name="update_eq_table" datasource="jrgm"  >
UPDATE equipment SET  last_oil_change_hours = #form.LAST_OIL_CHANGE_HOURS# , last_oil_change_miles = #form.LAST_OIL_CHANGE_MILEAGE# ,last_oil_change_date ='#form.oil_change_date#'
 WHERE ID=#form.EquipmentID#
</cfquery>
  <cflocation url="history_allocation.cfm?ID=#form.EquipmentID#">
</cfif>
<cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#EquipmentID#
</cfquery>
<CFSET crew_assignment_last = #getequipment_this.COMPUTED_COLUMN_14#>
<cfif IsDefined("url.id")>
  <cfquery name="getequipment_this" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0),CREW_ASSIGNMENT_LAST
  FROM equipment WHERE 0=0 AND ID=#url.id#
</cfquery>
  <cfelse>
  <CFSET url.id =form.EquipmentID>
</cfif>

 
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#getequipment_this.branch_name#'  AND    active_record = 1  
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
<!DOCTYPE html>
<!--[if IE 8]> <html> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]>
<html lang="en" class="no-js">

<!-- BEGIN HEAD -->

<head>
<meta charset="utf-8">
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
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">

<!-- END THEME STYLES -->
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
        <h1>Enter Oil Change Information</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="inventory_list.cfm">Equipment</a><i class="fa fa-circle"></i> </li>
          <li> <a href="history_allocation.cfm">Equipment Information</a><i class="fa fa-circle"></i> </li>
          <li class="active">Enter Oil Change Information</li>
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
        <div class="col-md-6"> <br />
          <cfif IsDefined("form.submit")   AND  form.OIL_CHANGE_DATE IS "">
            <div class="alert alert-danger"> You must enter an oil change date.<br />
              Please <a href = "javascript:history.back()">go back</a> and enter an oil change date. </div>
            <cfabort>
          </cfif>
          <cfif IsDefined("form.submit")   AND  form.EMPLOYEEID EQ 0>
            <div class="alert alert-danger"> You must enter an Oil Changed By name.<br>
              Please <a href = "javascript:history.back()">go back</a> and enter an Oil Changed By name. </div>
            <cfabort>
          </cfif>
          <form method="post" action="oil_change_info_equipment.cfm"  >
          <table class="table large">
              <tbody>
                <tr>
                  <td>Equipment ID :</td>
                  <td><cfoutput>#url.ID#</cfoutput></td>
                </tr>
                <tr>
                  <td>Description :</td>
                  <td><cfoutput>#getequipment_this.product_name#</cfoutput></td>
                </tr>
                <tr>
                  <td>Date Oil Changed:</td>
                  <td><input class="form-control form-control-inline input-medium date-picker" size="16" type="text" name="oil_change_date" value=""/></td>
                </tr>
                <tr>
                  <td>Oil Changed By:</td>
                  <td><select name="employeeID" class="bs-select form-control">
                      <option   selected="selected" value="0" >Please Choose</option>
                      <cfoutput query="get_branch_employees">
                        <option value="#employee_id#" 
		  <cfif get_branch_employees.employee_id  EQ #crew_assignment_last#>selected="selected"</cfif>>#fullname#</option>
                      </cfoutput>
                    </select></td>
                </tr>
                <tr>
                  <td>Hours:</td>
                  <td><input name="last_oil_change_hours" class="form-control input-inline input-small" placeholder="Enter hours" type="text" size="8" maxlength="8" /></td>
                </tr>
                <tr>
                  <td>Mileage:</td>
                  <td><input name="last_oil_change_mileage" class="form-control input-inline input-small" placeholder="Enter mileage" type="text" size="10" maxlength="10" /></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right"> <cfoutput>
                        <input type="hidden" name="EquipmentID" id="submit" value="#ID#" />
                      </cfoutput>
                      <input name="submit" type="submit" class="btn blue-madison" id="submit" value="Submit">
                    </div></td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </div>
    </div>
    <!-- END PAGE CONTENT INNER --> 
  </div>
</div>
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --><script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/components-pickers.js"></script> 
<!-- END PAGE LEVEL SCRIPTS --> 
<script>
        jQuery(document).ready(function() {       
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script> 
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>