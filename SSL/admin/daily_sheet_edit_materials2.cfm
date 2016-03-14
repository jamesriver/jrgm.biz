<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")  AND  form.submit NEQ "Delete"  >
  <cfif  form.QUANTITY_USED  IS "">
    <cfoutput>
      <cflocation url="daily_sheet_edit_materials2.cfm?dsid=#ds_id#&job_clock_id=#form.job_clock_id#&error=qty">
    </cfoutput>
  </cfif>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_job_materials_actual 
   (Job_ID,ds_id, Item_ID,Quantity_used,crew_leader,job_clock_id,Service_Date) 
   VALUES 
   ('#form.job_ID#',#form.ds_id#,'#form.item_id#',#form.quantity_used#,#form.CREW_LEADER#,#form.job_clock_id#,#form.ds_date#)
   </cfquery>
  <!---<cfoutput>
    <cflocation url="daily_sheet_edit2.cfm?dsid=#ds_id#">
  </cfoutput>--->
</cfif>

<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")  AND  form.submit EQ "Delete"  >
 <cfquery name="insert_job" datasource="jrgm">
   DELETE FROM   app_job_materials_actual 
  WHERE ID = #MATID#
   </cfquery>
   </cfif>


<!--- <cfif Not IsDefined("url.error")> --->
<!---<CFQUERY name="get_all_units" datasource="#request.dsn#">
 SELECT DISTINCT unit_used  AS unit_used FROM app_job_materials_actual  
 </CFQUERY>--->
<!---  </cfif> --->
<cfif IsDefined("form.dsid")>
  <CFSET ds_id= form.dsid>
  <cfelseif IsDefined("url.dsid")>
  <CFSET ds_id= url.dsid>
</cfif>
<cfif IsDefined("form.job_clock_id")>
  <CFSET job_clock_id= form.job_clock_id>
  <cfelseif IsDefined("url.job_clock_id")>
  <CFSET job_clock_id= url.job_clock_id>
</cfif>
<CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM app_job_clock WHERE ID = #job_clock_id#
   </CFQUERY>
<cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] as empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] as empid, [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
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
    <div class="container-fluid"> <br>
<br>

      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Materials Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb"> <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_listing.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li> <li> <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#ds_id#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Materials Editor</li>
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
           <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")  AND  form.submit NEQ "Delete"  >
            <p>The materials have been added to the daiy sheet.</p>
            <p><cfoutput> <a href="daily_sheet_edit2.cfm?DSID=#form.ds_id#" class="btn btn-primary">Back to Daily Sheet</a></cfoutput></p>
            <cfabort>
          </cfif>
          
          
          <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")  AND  form.submit EQ "Delete"  >
            <p>The materials have been deleted from the daily sheet.</p>
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
              <td><strong>Job Name: <cfoutput>#get_this_job_name.event_name#</cfoutput></strong></td>
              <td><strong>Job ID: <cfoutput>#get_this_job.Job_ID#</cfoutput></strong></td>
            </tr>
          </table>
          
   <cfquery name="get_this_material" datasource="jrgm">
SELECT *  FROM    app_job_materials_actual  WHERE ID  = #url.matid# 
</cfquery>
          <form   method="post" action="daily_sheet_edit_materials2.cfm" >
            <cfquery name="get_all_materials" datasource="jrgm">
SELECT *  FROM app_materials_list order by sortid
</cfquery>
            <table class="table large">
              <tr>
                <td><strong>Select Materials</strong></td>
                <td>
                  <select name="item_id" class="bs-select form-control" >
                  <cfoutput>  <option value="#get_this_material.item_id#"  selected>#get_this_material.item_id#</option> </cfoutput>
                    <cfoutput query="get_all_materials">
                      <option value="#item_id#">#item_id#</option>
                    </cfoutput>
                  </select>
               </td>
              </tr>
              
              <tr>
                <td><strong>Select Quantity </strong></td>
                <td><strong><cfoutput>
                  <input type="text" value="#get_this_material.Quantity_used#" name="quantity_used"  maxlength="5"  size="5" class="form-control input-inline input-small" />
                </cfoutput>
                  <cfif IsDefined("url.error")>
                    <span class="text-danger">Please  enter the quantity used.</span>
                  </cfif>
                  </strong></td>
              </tr>
              <tr>
                <td >&nbsp;</td>
                <td><input type="submit" name="submit" class="btn btn-primary" id="submit" value="Submit" />  <input type="submit" name="submit" class="btn btn-primary" id="submit" value="Delete" /></td>
              </tr>
              <cfoutput>
                <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
                <input type="hidden" name="ds_id"   value="#DS_ID#" />
                <input type="hidden" name="crew_leader"  value="#get_crew_leader.empid#"  />
                <input type="hidden" name="supervisor"   value="#get_supervisor.empid#" />
                <input type="hidden" name="job_clock_id"   value="#job_clock_id#" />
                <input type="hidden" name="job_id"   value="#get_this_job.job_id#" />
                 <input type="hidden" name="MATID"   value="#url.MATID#" />
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