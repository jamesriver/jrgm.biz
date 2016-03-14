 
<cfparam  name="Session.PTO_Date" default=""  >
<cfparam  name="form.PTO_Date" default=""  >
<cfparam  name="Session.pto_hours" default=""  >
<cfparam  name="form.pto_hours" default=""  >
 
  <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch IN ('#SESSION.BRANCH#')  AND    active_record = 1  
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
 
<cfif IsDefined("form.submitted")  AND  NOT  IsDefined("form.review")>
  <cfif BRANCH_NAME EQ 'Richmond' >
    <CFSET branchcode =10>
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
    <CFSET branchcode =20>
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
    <CFSET branchcode =30>
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
    <CFSET branchcode =70>
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchcode =80>
    <cfelseif BRANCH_NAME EQ 'Newport News' >
    <CFSET branchcode =90>
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
  <cfquery name="insert_pto" datasource="jrgm">
   INSERT INTO payroll_pto (  employee_id,branch_code,userid,pto_hours,date_entered,pto_date)
      VALUES       ( #form.employee_id#,#branchcode#,#SESSION.userid#,#form.pto_hours#,CURRENT_TIMESTAMP, '#form.pto_date#')
      </cfquery>
</cfif>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
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
        <h1>Add PTO Time</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="payroll_main.cfm">Payroll</a><i class="fa fa-circle"></i> </li>
        <li class="active">Add PTO Time</li>
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
					  <div class="col-md-6">
                      <cfif IsDefined("form.submitted")   AND  NOT  IsDefined("form.review")>
<cfquery name="get_this_employee" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID]= #form.EMPLOYEE_ID#
 ORDER by  Last_name ASC,first_name ASC
</cfquery>

<cfoutput><p>Your information has been submitted.
</p>
<p>You have submitted #PTO_HOURS# PTO hours for #BRANCH_NAME# Employee #get_this_employee.fullname# (#EMPLOYEE_ID#)  for work date #DateFormat(PTO_DATE, "mmmm dd, yyyy")#.</p>
<p><a href="pto_add.cfm" class="btn btn-primary">Add more PTO time.</a></p>
</cfoutput>
<div class="spacer20"></div>
<cfelseif IsDefined("form.submitted")   AND   IsDefined("form.review") AND pto_hours NEQ "">
        <cfquery name="get_this_employee" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID]= #form.EMPLOYEE_ID#
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
        <form action="pto_add.cfm" method="post">
           <div class="table-responsive">
			<table class="table large" >
            <tbody>
            <tr>
              <td>PTO Date: <cfoutput> #form.pto_date#</cfoutput></td>
            </tr>
            <tr>
              <td nowrap="nowrap">Branch: <cfoutput>#SESSION.BRANCH#</cfoutput></td>
            </tr>
            <tr>
              <td nowrap="nowrap">Employee: <cfoutput> #get_this_employee.fullname# </cfoutput></td>
            </tr>
            <tr>
              <td nowrap="nowrap" >PTO Hours: <cfoutput> #form.pto_hours# </cfoutput></td>
            </tr>
            <tr>
              <td></td>
              <td><div align="right"><br />
                <input type="hidden"  name="submitted" value="yes"/>
                <input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" />
              </div></td>
            </tr>
            <tr>
              <td colspan="2">
                <p>Please review and submit your information if it is correct.</p>
                 <a href = "javascript:history.back()" class="btn btn-primary">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="pto_add.cfm" class="btn btn-primary">Start Over</a></td>
            </tr>
          </table></div>
          <cfoutput>
            <input type="hidden"  name="BRANCH_NAME" value="#SESSION.BRANCH#"/>
            <input type="hidden"  name="EMPLOYEE_ID" value="#form.EMPLOYEE_ID#"/>
            <input type="hidden"  name="PTO_DATE" value="#form.PTO_DATE#"/>
            <input type="hidden"  name="PTO_HOURS" value="#form.PTO_HOURS#"/>
          </cfoutput>
        </form>
        <cfelse>
        <form action="pto_add.cfm" method="post">
         <div class="table-responsive">
			<table class="table large" >
            <tbody>
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME EQ 'Choose' AND pto_date EQ "">
            <tr >
              <td colspan="2"><p class="text-danger">Please choose a date to proceed</p></td>
            </tr>
            </cfif>
            <tr>
              <td>Enter PTO Date:</td>
              <td><cfif  Session.pto_date EQ ""  AND form.pto_date EQ "">
              <input class="form-control form-control-inline input-medium date-picker" size="16" type="text" name="pto_date" value=""/>
                  <cfelse>
                  <input name="pto_date" type="text" tabindex="4" size="12" maxlength="12"  <cfoutput>value="#form.pto_date#"</cfoutput> />
                </cfif>
              </td>
            </tr>
            <tr>
              <td nowrap="nowrap">Branch:</td>
              <td><cfoutput>#SESSION.BRANCH#</cfoutput></td>
            </tr>
             
              <tr>
                <td nowrap="nowrap">Choose Employee:</td>
                <td>
                    <select name="employee_id" class="bs-select form-control">
                      <cfoutput query="get_branch_employees">
                        <option value="#employee_id#" 
		       <cfif IsDefined("form.employee_id") AND form.employee_id EQ #employee_id#>selected="selected"</cfif>>#fullname# </option>
                      </cfoutput>
                    </select>
                  </td>
              </tr>
              <tr>
                <td nowrap="nowrap">PTO Hours:</td>
                <td>
                    <cfif  Session.pto_hours EQ "" AND form.pto_hours EQ "">
                      <input name="pto_hours" type="text"    tabindex="4" size="4" maxlength="4"   class="form-control input-inline input-medium" placeholder="Enter PTO hours" <cfoutput>value="#Session.pto_hours#"</cfoutput> />
                      <cfelse>
                      <input name="pto_hours" type="text" tabindex="4" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter PTO hours" <cfoutput>value="#form.pto_hours#"</cfoutput> />
                    </cfif>
                 </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right"><br />
                  <input type="hidden"  name="submitted" value="yes"/>
                  <cfif  NOT IsDefined("form.review") OR pto_hours EQ "">
                    <input type="submit" name="Review"   value="Review" class="btn btn-primary" />
                  </cfif>
                </td>
              </tr>
            </cfif>
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
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
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