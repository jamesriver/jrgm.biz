<cfif IsDefined("form.ID")>
  <CFSET ID= form.ID>
  <cfelseif IsDefined("url.ID")>
  <CFSET ID= url.ID>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <cfquery name="update_job_clock" datasource="jrgm">
  UPDATE App_Job_Clock SET Job_ID = '#form.job_id#'
   WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
  </cfquery>
  <cfquery name="update_job_services_clock" datasource="jrgm">
  UPDATE App_Job_services_clock SET Job_ID = '#form.job_id#'
   WHERE job_clock_id =#form.job_clock_id# AND DS_ID =#form.ds_id#
  </cfquery>
  <cfquery name="update_app_job_services_actual_employee" datasource="jrgm">
  UPDATE app_job_services_actual_employee SET Job_ID = '#form.job_id#'
   WHERE job_clock_id =#form.job_clock_id# AND DS_ID =#form.ds_id#
  </cfquery>
</cfif>
<cfif IsDefined("url.deleteme")>
  <cfquery name="delete_job_time" datasource="jrgm">
  DELETE FROM app_job_clock
   WHERE  DS_ID =#url.ds_id# AND ID = #url.ID#
  </cfquery>
  <cfquery name="delete_employee_services" datasource="jrgm">
 DELETE FROM app_job_services_actual_employee
  WHERE  DS_ID =#url.ds_id# AND job_clock_id = #url.ID#
  </cfquery>
  <cfquery name="delete_employee_services_tot" datasource="jrgm">
 DELETE FROM app_job_services_clock
 WHERE  DS_ID =#url.ds_id# AND job_clock_id = #url.ID#
  </cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit2.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_time")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.Job_Time_In>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.Job_Time_Out>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE App_Job_Clock
SET Job_Time_In = '#string4#',Job_Time_Out=  '#string6#'  
 WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
   </cfquery>
  <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2
    WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
  <cfquery name="update_job_services_clock" datasource="jrgm">
    UPDATE   APP_Job_Services_Clock SET service_time = DATEDIFF(mi,service_time_in,service_time_out) 
  WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
  <cfquery name="update_job_services_actual_employee__clock" datasource="jrgm">
 UPDATE APP_Job_Services_Actual_Employee SET total_time = DATEDIFF(mi,service_time_in,service_time_out) 
  WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
</cfif>
<CFQUERY name="get_this_job" datasource="#request.dsn#">
SELECT * FROM app_job_clock WHERE ID = #id#
</CFQUERY>
<cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
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
 
 <link href="css/styles_ds.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
   <cfinclude template="includes/subbar.cfm"> 
<!---    <cfinclude template="includes/topbar_ds.cfm">--->
 
<div class="page-container-fluid"> 
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Job Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_listing.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#ds_id#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Job Editor</li>
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
          <table class="table large">
            <tr>
              <td><strong>Date: <cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
              <td><strong>DSID: <cfoutput>#DS_ID#</cfoutput></strong></td>
            </tr>
            <tr>
              <td><strong>Production Manager: <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
              <td><strong>Supervisor/Crew Leader: <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
            </tr>
            <tr>
              <td><strong>Job Name: <cfoutput>#get_this_job_name.event_name#</cfoutput></strong></td>
              <td><strong>Job ID:<cfoutput>#get_this_job.Job_ID#</cfoutput></strong></td>
            </tr>
            <cfoutput>
              <tr>
                <td><strong>Job Start Time: #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#</strong></td>
                <td><strong>Job End Time: #TimeFormat(get_this_job.Job_Time_Out, "hh:mm tt")#</strong></td>
              </tr>
            </cfoutput>
          </table>
          <cfif IsDefined("url.delete")>
            <p  class="text-danger"><strong>Are you sure you want to delete <cfoutput>#get_this_job_name.event_name#</cfoutput> from this daily sheet?</strong></p>
            <cfoutput><a href="daily_sheet_edit_job2.cfm?deleteme=yes&ds_id=#ds_id#&ID=#url.ID#" class="btn btn-primary"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_job2.cfm?ds_id=#ds_id#&ID=#url.ID#" class="btn btn-primary">No</a>
              <p></p>
              <p  class="text-danger"><strong>Choosing yes will delete #get_this_job_name.event_name# from this daily sheet.</strong></p>
            </cfoutput>
            <cfabort>
          </cfif>
          <form   method="post" action="daily_sheet_edit_job2.cfm" >
            <cfquery name="get_all_branch_jobs" datasource="jrgm">
		SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id FROM APP_jobs
		WHERE branch= '#get_this_job_name.branch#'
        ORDER by [Wk Location Name] ASC
		</cfquery>
            <table class="table large">
              <tr>
                <td nowrap="nowrap"><strong>Select Job</strong></td>
                <td><select name="Job_ID" class="bs-select form-control" >
                    <cfoutput query="get_all_branch_jobs">
                      <option value="#job_id#" 
		  <cfif get_all_branch_jobs.job_id  EQ #get_this_job.job_ID#>selected="selected"</cfif>>#work_loc_name#</option>
                    </cfoutput>
                  </select></td>
                <td><input type="submit" name="submit" value="Submit" class="btn btn-primary"/></td>
              </tr>
              <cfoutput>
                <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
                <input type="hidden" name="ds_id"   value="#DS_ID#" />
                <input type="hidden" name="Crew_Leader_ID"   value="#get_this_job.Crew_Leader_ID#" />
                <input type="hidden" name="ID"   value="#get_this_job.ID#" />
                <input type="hidden" name="job_clock_id"   value="#get_this_job.ID#" />
                <input type="hidden" name="job_clock_name"   value="1" />
              </cfoutput>
            </table>
          </form>
          <table class="table large">
            <form  method="post" action="daily_sheet_edit_job2.cfm"   >
              <cfoutput query="get_this_job">
                <tr>
                  <td nowrap="nowrap"><strong>Job Start Time In:</strong></td>
                  <td><div class="input-group">
                      <input id="timepicker1"  type="text" class="form-control timepicker timepicker-no-seconds" name="Job_Time_In" value="#TimeFormat(Job_Time_In,"short")#">
                      <span class="input-group-btn">
                      <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                      </span> </div></td>
                  <td></td>
                  <td nowrap="nowrap"><strong>Job End Time:</strong></td>
                  <td><div class="input-group">
                      <input id="timepicker2"  type="text" class="form-control timepicker timepicker-no-seconds" name="Job_Time_Out" value="#TimeFormat(Job_Time_Out,"short")#">
                      <span class="input-group-btn">
                      <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                      </span> </div></td>
                  <td></td>
                  <td ><input name="submit" type="submit" class="btn btn-primary"  value="Submit" /></td>
                  <td>&nbsp;</td>
                </tr>
                <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                <input type="hidden" name="ds_id"   value="#DS_ID#" />
                <input type="hidden" name="Crew_Leader_ID"   value="#get_this_job.Crew_Leader_ID#" />
                <input type="hidden" name="ID"   value="#get_this_job.ID#" />
                <input type="hidden" name="job_clock_id"   value="#get_this_job.ID#" />
                <input type="hidden" name="job_clock_time"   value="1" />
              </cfoutput>
            </form>
          </table>
          <br />
          <br />
          <cfoutput> <a href="daily_sheet_edit_job2.cfm?ds_id=#ds_id#&ID=#ID#&delete=yes"  class="btn btn-primary">Remove this Job</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="daily_sheet_edit2.cfm?dsid=#ds_id#" class="btn btn-primary" >Back to Daily Sheet</a> </cfoutput> </div>
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