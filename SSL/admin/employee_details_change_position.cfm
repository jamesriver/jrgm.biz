<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<CFQUERY name="is_employee_in_password_table" datasource="#request.dsn#">
SELECT * FROM app_employee_passwords  WHERE employee_id=#url.employee_id#
</CFQUERY>
<cfif is_employee_in_password_table.recordcount EQ 0>
  <CFSET pwneeded = 'yes'>
  <cfelse>
  <CFSET pwneeded = 'no'>
</cfif>
<cfif IsDefined("url.remove")>
  <CFQUERY name="update_app_crews_table" datasource="#request.dsn#">
UPDATE app_crews SET   Employee_Position_ID= 0   WHERE employee_id=#url.employee_id#
</CFQUERY>
  <CFQUERY name="update_pw_table" datasource="#request.dsn#">
UPDATE app_employee_passwords SET   employee_active =0  WHERE employee_id=#url.employee_id#
</CFQUERY>
  <cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="MC Crew Leader Change- Remove"  type="html">
    App_crews table changed (Removed) for employee_id=#url.employee_id#<br>
    App_employee_passwords table changed (Removed) for employee_id=#url.employee_id#(Should be inactive(0))
  </cfmail>
</cfif>
<cfif IsDefined("url.add")>
  <CFQUERY name="update_app_crews_table" datasource="#request.dsn#">
UPDATE app_crews SET   Employee_Position_ID= 2,crew_leader_id = NULL   WHERE employee_id=#url.employee_id#
</CFQUERY>
  <CFQUERY name="getnumber_rowsincrews" datasource="#request.dsn#" maxrows="1">
SELECT ID   FROM app_crews    WHERE employee_id=#url.employee_id#
ORDER by end_date DESC
</CFQUERY>
  <cfif getnumber_rowsincrews.recordcount GT 0>
    <CFQUERY name="delete_getnumber_rowsincrews" datasource="#request.dsn#" >
DELETE FROM app_crews   WHERE employee_id=#url.employee_id# AND ID NOT IN (#getnumber_rowsincrews.ID#)
</CFQUERY>
  </cfif>
  <cfif pwneeded EQ 'yes'>
    <CFQUERY name="get_emp_info" datasource="#request.dsn#">
SELECT first_name,last_name, branch, [Name FirstLast] AS employee_name,email,[Employee ID] AS EmployeeID FROM app_employees  WHERE [Employee ID]=#url.employee_id#
</CFQUERY>
   <!--- <cfoutput>#get_emp_info.last_name#</cfoutput><br>--->
    <CFSET usernamef = LEFT(get_emp_info.first_name,1)>
    <cfset usernamel = ListFirst(get_emp_info.last_name, " -")>
    <!---   <cfoutput>#usernamel#</cfoutput><br>--->
    <CFSET username3 = get_emp_info.EmployeeID>
    <CFSET username = usernamef&usernamel&username3>
    <CFSET password = 'jrgm'>
    <!---<cfoutput>#username#</cfoutput>
    <cfabort>--->
    <cfquery name="insert_user_pwtable" datasource="#request.dsn#">
 INSERT INTO  app_employee_passwords (Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch,password_date,email) VALUES (#url.Employee_ID#, '#username#', '#password#', '#get_emp_info.employee_name#', 2, 1, '#get_emp_info.first_name#', '#get_emp_info.last_name#', #todayDate#, '#get_emp_info.branch#',#todayDate#,'#get_emp_info.email#' )
</cfquery>
    <cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="MC Crew Leader Change - Add"  type="html">
      App_crews table changed (Add) for employee_id=#url.employee_id#<br>
      App_employee_passwords table changed (Add-New) for employee_id=#url.employee_id#(Should be active(1)) New username =#username#
    </cfmail>
    <cfelse>
    <CFQUERY name="update_pw_table" datasource="#request.dsn#">
UPDATE app_employee_passwords SET   employee_active =1  WHERE employee_id=#url.employee_id#
</CFQUERY>
    <cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="MC Crew Leader Change - Add"  type="html">
      App_employee_passwords table changed (Add-Prior) for employee_id=#url.employee_id#(Should be active(1))
    </cfmail>
  </cfif>
</cfif>
<cfquery name="get_employee_creds" datasource="jrgm"  maxrows="1">
SELECT * FROM app_employee_passwords WHERE Employee_ID=  #url.Employee_ID#  
</cfquery>
<cfset username =get_employee_creds.username>
<cfset password =get_employee_creds.password>
<cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone,branch FROM APP_employees WHERE [Employee ID]=  #url.Employee_ID#  
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfif IsDefined("url.remove")>
  <cfmail to="patrick.hutchinson2@gmail.com"   from="patrick.hutchinson2@gmail.com"  subject="JRGM Crew Leader Change-Remove"  type="html">
    #get_employee_info.employeename# has been removed as a crew leader.
  </cfmail>
</cfif>
<cfif IsDefined("url.add")>
  <cfmail to="patrick.hutchinson2@gmail.com"   from="patrick.hutchinson2@gmail.com"  subject="JRGM Crew Leader Change-Add"  type="html">
    #get_employee_info.employeename# has been added as a crew leader.
  </cfmail>
</cfif>

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
<script>
function goBack() {
    window.history.back();
}
</script>
<style type="text/css">
input {
	text-align: right;
}
.arialfont {
	font: normal 1.0em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 10px;
	font: normal 1.0em Arial, Helvetica, sans-serif;
	color: red;
}
.YesNoButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background: -moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color: #8299bb;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #3f4b5b;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 6px 24px;
	text-decoration: none;
	width: 100px;
	margin-right: 40px;
	margin-top: 20px;
}
.NoButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background: -moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color: #8299bb;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #3f4b5b;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 6px 24px;
	text-decoration: none;
	width: 250px;
	margin-right: 40px;
	margin-top: 20px;
}
.YesNoButton:hover {
	color: #C4D2E7;
	text-decoration: none;
}
.NoButton:hover {
	color: #C4D2E7;
	text-decoration: none;
}
.font-lg {
	font: bold 18px Arial, Helvetica, sans-serif;
	color: #333333;
	padding-bottom: 10px;
}
.font-lg2 {
	font: bold 18px Arial, Helvetica, sans-serif;
	color: #666666;
	padding-bottom: 10px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include-mc.cfm">
  <cfinclude template="header-menu-mc.cfm">
</div>
<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
        <h1>Manage Supervisors / Crew Leaders</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Manage Supervisors / Crew Leaders</li>
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
          <div class="portlet light ">
            <div class="portlet-body">
              <table width="98%" border="0">
                <tbody>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right"><a href="manage_crew_leaders.cfm" >Go Back to List</a>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <cfif IsDefined("url.remove")>
                <br />
                <span class="redarial"><cfoutput><strong>#get_employee_info.employeename# </strong></cfoutput><strong>has been removed as a crew leader in the <cfoutput>#get_employee_info.branch# branch</cfoutput>.</strong></span><br />
                <br />
                <span class="arialfont">The  login credentials for <cfoutput>#get_employee_info.employeename#</cfoutput> have been inactivated and they will not have access to the JRGM APP. <br />
                <cfoutput>#get_employee_info.employeename#</cfoutput> is still in the branch as a regular crewman.<br />
                <br />
                <a href="manage_crew_leaders.cfm">Go back to Manage Supervisors / Crew Leaders</a>.</span>
                <cfabort>
              </cfif>
              <cfif IsDefined("url.add")>
                <br />
                <span class="redarial"> <cfoutput> <strong>#get_employee_info.employeename#</strong></cfoutput><strong> is now listed as a crew leader in the <cfoutput>#get_employee_info.branch#</cfoutput> branch</strong>.</strong> </span> <br>
 <br />
                <span class="arialfont">The  login credentials for <cfoutput>#get_employee_info.employeename#</cfoutput> have been activated and they now have access to the JRGM APP.<br />
                <cfoutput>#get_employee_info.employeename#</cfoutput> user name is <cfoutput><u>#username#</u></cfoutput> and the password is <cfoutput><u>#password#</u></cfoutput><br />
                <br />
                <a href="manage_crew_leaders.cfm">Go back to Manage Supervisors / Crew Leaders</a><br />
                </span>
                <cfabort>
              </cfif>
              <cfoutput query="get_employee_info">
                <div class="font-lg">#employeename#&nbsp; &nbsp; &nbsp;<font color="##666666" >(#get_employee_info.branch# Branch)</font></div>
                <cfif IsDefined("url.clalready") AND url.clalready EQ 'No'>
                  <br>
                  <span class="arialfont">Do you want to make #employeename# a supervisor/crew leader?</span> <br />
                  <cfoutput><a href="employee_details_change_position.cfm?add=yes&employee_id=#url.employee_id#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="manage_crew_leaders.cfm?employee_id=#url.employee_id#&clalready=no" class="NoButton"  onclick="goBack()">No Go Back to List</a>
                    <p  class="redarial"> <br>
                      Choosing yes will make <strong>#employeename#</strong> a supervisor/crew leader in the #get_employee_info.branch# branch</p>
                    <span class="arialfont">A username and password to access the JRGM APP will be generated.</span></cfoutput>
                  <cfelse>
                  <span class="arialfont">Do you want to remove <cfoutput>#employeename#</cfoutput> as a supervisor/crew leader?</span> <br />
                  <cfoutput><a href="employee_details_change_position.cfm?remove=yes&employee_id=#url.employee_id#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="manage_crew_leaders.cfm?employee_id=#url.employee_id#" class="NoButton" onclick="goBack()">No Go Back to List</a>
                    <p  class="redarial"><br>
                      Choosing yes will remove <strong>#get_employee_info.employeename#</strong> as a supervisor/crew leader.</span> </p>
                    <span class="arialfont">The  login credentials will be inactivated and they will not have access to the JRGM APP.<br />
                    <strong>#get_employee_info.employeename#</strong> will remain in the branch as a regular crewman.<br />
                    <br>
                    Remember if they are logged in as a supervisor/crew leader today they can continue working but they will not be able to log back into the APP if they have logged out. <br />
                    <br>
                    Crew members that were allocated to #get_employee_info.employeename# will now be allocated to his production manager. </span> </span></cfoutput>
                </cfif>
              </cfoutput><br />
              <br>
              <br>
            </div>
          </div>
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
    <cfinclude template="footer-include.cfm">
  </div>
  <!-- END PAGE CONTENT --> 
</div>
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