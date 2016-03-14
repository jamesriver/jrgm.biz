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
<style type="text/css">
.styled-select select {
   background: transparent;
   width: 268px;
   padding: 5px;
   font-size: 16px;
   line-height: 1;

   border-radius: 0;
   height: 34px;
   -webkit-appearance: none;
   }
   .styled-select {
   width: 240px;
   height: 34px;
   overflow: hidden;
   
   border: 1px solid #ccc;
   }
</style>
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
        <h1>Manage Supervisors/Crew Leaders</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Manage Supervisors/Crew Leaders</li>
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
              <cfif  NOT IsDefined("form.Branch")>
                <cfparam name=" form.Branch" default="choose" >
              </cfif>
              <form class="css_form"  action="manage_crew_leaders.cfm"  method="post">
              <table border="0" cellpadding="0" cellspacing="0">
              <cfif IsDefined("form.Branch")  AND  form.Branch EQ 'Choose' >
                <tr>
                  <td nowrap="nowrap" class="statusTD_right" align="right"><span style="font-size: 18px">Choose Branch :</span> &nbsp;&nbsp;</td>
                  <td class="statusTD_right"><div class="styled-select select">
                      <select name="Branch"   onchange='this.form.submit()'>
                        <option value="Choose"   
<cfif  form.Branch EQ 'Choose'> selected="selected"</cfif>>Choose Branch</option>
                        <option value="Charlottesville"   
<cfif  form.Branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                        <option value="Chesterfield"   
<cfif  form.Branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                        <option value="Newport News"   
<cfif  form.Branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                        <option value="Portsmouth"   
<cfif  form.Branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                        <option value="Richmond"   
<cfif  form.Branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                        <option value="Test"   
<cfif  form.Branch EQ 'Test'> selected="selected"</cfif>>Test</option>
                      </select>
                    </div></td>
                </tr>
                </table>
                </form>
                <cfabort>
              </cfif>
              <form class="css_form"  action="manage_crew_leaders.cfm"  method="post">
                <table border="0" cellpadding="0" cellspacing="0">
                  <cfif IsDefined("form.Branch") <!--- AND  form.Branch NEQ 'Choose'---> >
                    <tr>
                      <td nowrap="nowrap" class="statusTD_right" align="right"><span style="font-size: 18px">Current Branch :</span> &nbsp;&nbsp;</td>
                      <td class="statusTD_right"><div class="styled-select select">
                          <select name="Branch"   onchange='this.form.submit()'>
                            <!---  <option value="Choose"   
<cfif  form.Branch EQ 'Choose'> selected="selected"</cfif>>Current Branch</option>--->
                            <option value="Charlottesville"   
<cfif  form.Branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                            <option value="Chesterfield"   
<cfif  form.Branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                            <option value="Newport News"   
<cfif  form.Branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                            <option value="Portsmouth"   
<cfif  form.Branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                            <option value="Richmond"   
<cfif  form.Branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                            <option value="Test"   
<cfif  form.Branch EQ 'Test'> selected="selected"</cfif>>Test</option>
                          </select>
                        </div></td>
                    </tr>
                  </cfif>
                </table>
              </form>
              <br>
              <br>
              <table class="table table-striped table-hover" id="sample_5">
                <tr>
                  <td valign="top"><span class="caption-subject font-green-sharp bold uppercase">Current SUPERvisors/Crew Leaders</span> 

                    <table class="table table-striped table-hover" id="sample_5">
                      <tr>
                        <th align="left" nowrap="nowrap">First Name</th>
                        <th align="left" nowrap="nowrap">Last Name</th>
                        <th align="left" nowrap="nowrap">Position</th>
                        <th align="left" nowrap="nowrap">Change</th>
                      </tr>
                      <cfquery name="get_branch_employees_CL" datasource="jrgm"  >
SELECT * FROM app_employee_passwords
WHERE employee_branch = '#form.branch#' AND employee_active = 1  
AND access_role = 2
 ORDER by  Lastname ASC,firstname ASC
</cfquery>
                      <cfoutput query="get_branch_employees_CL">
                        <tr>
                          <td nowrap="nowrap">#firstname#</td>
                          <td nowrap="nowrap">#lastname#</td>
                          <td nowrap="nowrap">Crew Leader</td>
                          <td nowrap="nowrap"><a href="employee_details_change_position.cfm?employee_id=#get_branch_employees_CL.Employee_ID#&clalready=yes">Change</a></td>
                        </tr>
                      </cfoutput>
                    </table></td>
                  <td width="50"></td>
                  <td valign="top"><span class="caption-subject font-green-sharp bold uppercase">Current Non-SUPERvisors/Crew Leaders</span>
                    <table class="table table-striped table-hover" id="sample_5">
                      <tr>
                        <th align="left" nowrap="nowrap">First Name</th>
                        <th align="left" nowrap="nowrap">Last Name</th>
                        <th align="left" nowrap="nowrap">Position</th>
                        <th align="left" nowrap="nowrap">Change</th>
                      </tr>
                      <cfquery name="get_branch_employees_nonCL" datasource="jrgm"  >
SELECT * FROM app_employee_passwords
WHERE employee_branch = '#form.branch#'  AND employee_active = 1  
 ORDER by  Lastname ASC,firstname ASC
</cfquery>
                      <cfset mylist ="">
                      <cfloop query="get_branch_employees_nonCL">
                        <cfset myList = ListAppend(mylist,Employee_ID)>
                      </cfloop>
                      <cfquery name="get_branch_employees_noncl" datasource="jrgm"  >
select first_name, last_name,position, [employee id] as employee_id from app_employees
where branch = '#form.branch#'  and active_record = 1  and [employee id] not in (#mylist#)   
  order by  last_name asc,first_name asc
</cfquery>
                      <cfoutput query="get_branch_employees_noncl">
                        <tr>
                          <td nowrap="nowrap">#first_name#</td>
                          <td nowrap="nowrap">#last_name#</td>
                          <td nowrap="nowrap">#position#</td>
                          <td nowrap="nowrap"><a href="employee_details_change_position.cfm?employee_id=#get_branch_employees_noncl.employee_id#&clalready=no">Change</a></td>
                        </tr>
                      </cfoutput>
                    </table>
                    <br /></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
<cfinclude template="footer-include.cfm">  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->

<!-- END FOOTER -->

<div class="scroll-to-top">  </div>
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