<CFIF IsDefined("url.work_date")>
  <cfset todayDate1 = #url.work_date#>
  <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
  <cfelse>
  <cfset todayDate1 = Now()>
  <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>

<!---  <cfoutput> #form.ds_date#  -#todayDate#</cfoutput>
	  <cfabort>   --->

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
  <CFSET branchcode =0>
</cfif>
<cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND form.ds_date LTE todayDate AND  IsDefined("form.SUPERVISOR_ID") AND form.ds_date LT #APPLICATION.blockdate#>
You cannot enter a daily sheet prior to the current pay period.  <br>
  Please go back and select another date.
  <cfabort>
</cfif>
<cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND form.ds_date LTE todayDate AND  IsDefined("form.SUPERVISOR_ID")>
  <cfquery name="insert_ds" datasource="#request.dsn#">
 INSERT INTO  app_daily_sheets (Supervisor_ID, Crew_Leader_ID, DS_Date, record_created,entry_method,branch_code) VALUES ( #form.Supervisor_ID#, '#form.CREW_LEADER_ID#','#form.ds_date#',CURRENT_TIMESTAMP,2,#branchcode#  )
 </cfquery>
  <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM app_daily_sheets  
 </cfquery>
</cfif>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1  
 ORDER by  Last_name ASC,first_name ASC
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
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
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
        <h1>Create a Daily Sheet</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="dailysheet_select.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Create a Daily Sheet</li>
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
          <cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND form.ds_date GT  todaydate AND  IsDefined("form.SUPERVISOR_ID")>
            <br />
            <h2>The Daily Sheet date must be before today. <br />
              Please <a href = "javascript:history.back()">and select a date equal to today or a date before today.</h2>
            <cfabort>
            <br />
          </cfif>
          <cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND  IsDefined("form.SUPERVISOR_ID")>
            <br />
           <!--- <cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="BM Create New DS"  type="html">
              dsid= #getmaxid.newid#
            </cfmail>--->
            <h2>Daily Sheet ID : <cfoutput>#getmaxid.newid# has been created.</cfoutput></span><cfoutput><br />
                <br />
                <a href="daily_sheet_edit2.cfm?dsid=#getmaxid.newid#&message=yes" class="btn btn-primary" >Edit Daily Sheet</a> </cfoutput></h2>
            <br />
            <br />
            <span class="text-danger"><strong>Remember to add Employees to the new daily sheet before adding Jobs.</strong><br />
            </span><br />
            <p>If this daily sheet was created in error please contact administrator to remove.</p>
        
            <cfelse>
            <form action="dailysheet_add2.cfm" method="post">
              <table class="table large">
                <tr>
                  <td align="right">Enter Daily Sheet Date</td>
                  <td><input class="form-control form-control-inline input-medium date-picker"  type="text" name="ds_date" /></td>
                </tr>
                <tr>
                  <td nowrap="nowrap" align="right">Choose Production Manager&nbsp;</td>
                  <td><select name="Supervisor_ID" class="bs-select form-control">
                      <cfoutput query="get_branch_employees">
                        <option value="#employee_id#">#fullname#</option>
                      </cfoutput>
                    </select></td>
                </tr>
                <tr>
                  <td nowrap="nowrap" align="right">Choose Supervisor / Crew Leader</td>
                  <td><select name="Crew_Leader_ID" class="bs-select form-control">
                      <cfoutput query="get_branch_employees">
                        <option value="#employee_id#">#fullname#</option>
                      </cfoutput>
                    </select></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="right"><br />
                    <input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" /></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="text-danger">All 3 fields are required</span></td>
                </tr>
              </table>
            </form>
          </cfif>
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
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 

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
</body>
<!-- END BODY -->
</html>