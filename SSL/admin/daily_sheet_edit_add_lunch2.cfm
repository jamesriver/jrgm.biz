<cfparam name="Job_Time_In" default="00:00">
<cfparam name="Job_Time_Out" default="00:00">
<cfparam name="Lunch_start_time" default="00:00">
<cfparam name="Lunch_end_time" default="00:00">
<cfif IsDefined("form.job_clock_ID")>
  <CFSET job_clock_ID= form.job_clock_ID>
  <cfelseif IsDefined("url.job_clock_ID")>
  <CFSET job_clock_ID= url.job_clock_ID>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <cfif  Lunch_end_time LTE Lunch_start_time>
    <!---  <cfabort> --->
    <cfoutput>
      <cflocation url="daily_sheet_edit_add_lunch2.cfm?ds_id=#ds_id#&job_clock_id=#job_clock_id#&error=time">
    </cfoutput>
  </cfif>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.Lunch_start_time>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.Lunch_end_time>
  <cfset string6 =  string1 &  string2 &  string5>
  <!--- <cfset totalminutes_this_job=#get_this_job.job_time_worked#-#get_this_job_lunch.Lunch_Time#> --->
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO APP_lunch (ds_id, job_id,Crew_Leader_ID, Lunch_Time_Out, Lunch_Time_In, job_clock_id
) VALUES (#form.ds_id#,'#form.job_ID#',#form.Crew_Leader_ID#,'#string6#','#string4#',#form.job_clock_ID#)
    </cfquery>
  <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM APP_lunch  
    </cfquery>
  <cfquery name="update_employee_time" datasource="jrgm">
 UPDATE APP_lunch SET lunch_time = DATEDIFF(mi,Lunch_Time_In,Lunch_Time_Out) WHERE ID =#getmaxid.newid#
</cfquery>
  <cfquery name="get_lunch_mins" datasource="jrgm">
 SELECT lunch_time  FROM APP_lunch  WHERE ID =#getmaxid.newid#
</cfquery>
  <cfquery name="Update_lunchtime" datasource="jrgm">
   UPDATE APP_job_clock SET lunch_time = #get_lunch_mins.lunch_time#  WHERE ds_id = #ds_id# AND ID = #form.job_clock_ID#
    </cfquery>
</cfif>
<cfif IsDefined("ID")>
  <CFQUERY name="get_this_job" datasource="#request.dsn#">
SELECT * FROM app_job_clock WHERE ID = #id#
</CFQUERY>
  <cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
</cfif>
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
SELECT   [Employee ID], [Employee ID] as empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
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
<link href="css/styles_ds.css" rel="stylesheet" type="text/css" /> 
<!-- END THEME STYLES -->
</head>
<body>
  <cfinclude template="includes/subbar.cfm">  
<!---    <cfinclude template="includes/topbar_ds.cfm">--->
 
<div class="page-container-fluid"> 
<!-- END HEADER SECTION --> 
 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Lunch Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_listing.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li> <li> <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#ds_id#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Lunch Editor</li>
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
          <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.Lunch_end_time")>
            <p>The lunch times have been aded to the daily sheet.</p>
            <p>Don't forget to enter service time for each employee.</p>
            <p><cfoutput> <a href="daily_sheet_edit2.cfm?DSID=#form.ds_id#" class="btn btn-primary">Back to Daily Sheet</a></cfoutput></p>
            <cfabort>
          </cfif>
          <table class="table large" >
            <tr>
              <td><strong>Date: <cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
              <td><strong>DSID: <cfoutput>#DS_ID#</cfoutput></strong></td>
            </tr>
            <tr>
              <td><strong>Production Manager: <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
              <td><strong>Supervisor/Crew Leader: <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
            </tr>
            <tr>
              <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM app_job_clock WHERE ID = #job_clock_id#
   </CFQUERY>
              <cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch,[Job ID] AS job_id FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
              <td><strong>Job Name: <cfoutput>#get_this_job_name.event_name#</cfoutput></strong></td>
              <td></td>
            </tr>
          </table>
          <form  method="post" action="daily_sheet_edit_add_lunch2.cfm" >
            <table class="table large">
              <cfoutput>
                <tr>
                  <td nowrap="nowrap"><strong>Lunch Start Time :</strong></td>
                  <td width="300"><div class="input-group">
                      <input id="timepicker1"  type="text" class="form-control timepicker timepicker-no-seconds" name="Lunch_start_time" value="#TimeFormat(Lunch_start_time,"short")#">
                      <span class="input-group-btn">
                      <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                      </span> </div></td>
                  <td></td>
                  <td nowrap="nowrap"><strong>Lunch End Time: </strong></td>
                  <td width="300"><div class="input-group">
                      <input id="timepicker2"  type="text" class="form-control timepicker timepicker-no-seconds" name="Lunch_end_time" value="#TimeFormat(Lunch_end_time,"short")#">
                      <span class="input-group-btn">
                      <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                      </span> </div></td>
                  <td><input name="submit" type="submit" class="btn btn-primary"  value="Submit" /></td>
                </tr>
                <cfif IsDefined("url.error")>
                  <tr>
                    <td colspan="5"><span class="text-danger"><strong>The Lunch End Time MUST be after the Lunch Start Time</strong></span></td>
                  </tr>
                </cfif>
                <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                <input type="hidden" name="ds_id"   value="#DS_ID#" />
                <input type="hidden" name="Crew_Leader_ID"   value="#get_crew_leader.empid#" />
                <input type="hidden" name="job_clock_name"   value="1" />
                <input type="hidden" name="job_clock_ID"   value="#job_clock_ID#" />
                <input type="hidden" name="job_ID"   value="#get_this_job_name.job_ID#" />
              </cfoutput>
            </table>
          </form>
          <cfoutput> <a href="daily_sheet_edit2.cfm?dsid=#ds_id#" class="btn btn-primary">Back to Daily Sheet</a> </cfoutput> </div>
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