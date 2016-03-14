 
   <cfif SESSION.branch EQ 'Richmond' >
    <CFSET branchcode =10>
     <cfelseif SESSION.branch EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif SESSION.branch EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif SESSION.branch EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif SESSION.branch EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif SESSION.branch EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
    <CFSET branchcode ='Unknown'>
  </cfif>
 
  <cfquery name="get_employee_pto_time" datasource="jrgm" >
SELECT     ID, employee_id, branch_code, userid, pto_hours, date_entered, pto_date
FROM         payroll_pto  WHERE branch_code  IN  (#branchcodelist#)
ORDER by pto_date desc
</cfquery>  
 

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
        <h1>PTO Report</h1>  </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="payroll_main.cfm">Payroll</a><i class="fa fa-circle"></i> </li>
        <li class="active">PTO Report</li>
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
                        <div class="table-responsive">
        <table class="table table-striped table-hover" >
        <thead> 
         <tr>
         <th>Branch</th> 
          <th >First Name</th>
           <th >Last Name</th>
          <th >Employee ID</th>
          <th >PTO Date</th>
          <th>PTO Hours</th>
          </tr>
        </thead>
        <tbody>  
 <cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT      ID, [Employee ID] AS employeeid, [Name FirstLast], First_name, Last_name FROM app_employees  
</cfquery>
 <cfoutput query="get_employee_pto_time">
 <tr>
 <cfif branch_code EQ '10' >
    <CFSET branchname ='Richmond'>
    <cfelseif branch_code EQ '20' >
    <CFSET branchname ='Portsmouth'>
    <cfelseif branch_code EQ '30'  >
    <CFSET branchname ='Charlottesville'>
    <cfelseif branch_code EQ '70'  >
    <CFSET branchname ='Williamsburg'>
    <cfelseif branch_code EQ '80'  >
    <CFSET branchname ='Chesterfield'>
    <cfelseif branch_code EQ '90' >
    <CFSET branchname ='Newport News'>
    <cfelseif  branch_code EQ '21'>
    <CFSET branchname ='Corporate'>
    <cfelseif  branch_code EQ '00'>
    <CFSET branchname ='Unknown'>
    <cfelseif branch_code EQ '' >
    <CFSET branchname ='Unknown'>
    <cfelse>
    <CFSET branchname ='Unknown'>
  </cfif>
 <td>#branchname#</td> 
 <cfquery name="get_employee_name"   dbtype="query" maxrows="1">
SELECT First_name, Last_name FROM  get_all_employee_info WHERE employeeid =#get_employee_pto_time.employee_id#
 </cfquery>
 <td>#get_employee_name.First_name#</td>
 <td>#get_employee_name.LAst_name#</td>
 <td>#employee_id#</td>
 <td>#DateFormat(pto_date, "mm/dd/yyyy")#</td>
 <td>#pto_hours#</td>
 </tr>  
 </cfoutput>
 </tbody>
</table>
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
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() { 
      
    // initiate layout and plugins
    Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
    // button state demo
    $('.demo-loading-btn')
      .click(function () {
        var btn = $(this)
        btn.button('loading')
        setTimeout(function () {
          btn.button('reset')
        }, 3000)
    });
});
</script>
</body>
<!-- END BODY -->
</html>