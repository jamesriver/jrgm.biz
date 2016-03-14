<cfif IsDefined("deleteme")  AND deleteme  EQ 'yes'>
  <cfquery name="delete_job_notes" datasource="jrgm">
DELETE  FROM APP_notes WHERE   ID  = #url.noteid# 
 </cfquery>
</cfif>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader,branch
 FROM APP_jobs WHERE [Job ID] =  '#url.Job_ID#'
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
        <h1>Job Details for <cfoutput>#get_job_info.locationname#</cfoutput></h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Job Details</li>
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
         <table width="98%" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td>     <cfoutput query="get_job_info">
      
            <p><strong>Job Branch&##8212;#branch#</strong></p>
          <p><strong>Job ID&##8212;#ID#</strong></p>
          <p><strong>James River ID&##8212;#Job_ID#</strong></p>
          <p><strong>Job Location&##8212;#locationname#</strong></p>
          <p><strong>Address&##8212;#jobaddress1#</strong></p>
          <p><strong>City&##8212;#jobcity#, #jobstate# #jobzip#</strong></p>
      </cfoutput></td>
  </tr>
</table>
          </div></div>
           <div class="row">
          <div class="col-md-4"><br>

          <cfoutput> <a href="notes.cfm?work_date=#url.work_date#&amp;job_id=#job_id#" class="btn btn-primary">Add Notes</a></cfoutput>
           <div class="spacer20"></div>
          </div></div>
          <div class="row">
        <div class="col-md-12">
          <table class="table large"  width="90%">
            <thead>
              <tr>
                <th>Date</th>
                <th>Reported by</th>
                <th>Note</th>
                <th>Pictures</th>
                <th><div align="center">Remove</div></th>
              </tr>
            </thead>
           <cfquery name="get_job_notes" datasource="jrgm">
SELECT * FROM APP_notes WHERE  job_ID = '#job_ID#' 
ORDER by Note_Date DESC
</cfquery>
            <tbody>
               <cfoutput query="get_job_notes">
                <tr>
                  <td>#dateformat(Note_Date,"mm/dd/yyyy")#</td>
                 <cfquery name="get_auth_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename  FROM APP_employees WHERE [Employee ID]=  #get_job_notes.Note_Author_ID#  
</cfquery>
                    <td nowrap="nowrap">#ID#- #get_auth_info.employeename# </td>
              <td>#note_content#</td>
              <cfdirectory action="list" directory="C:\inetpub\websites\webservice.jrgm.biz\NotesImg\" name="Job_note_pix" recurse="true">
              <cfquery name="Job_note_pix" dbtype="query">
    select *
    from Job_note_pix
  WHERE name LIKE '#ID#%'
</cfquery>
              <!---  <cfdump  var="#Job_note_pix#">  --->
              <td><div align="center" ><cfloop query="Job_note_pix"  startRow = "1" endRow = "5">
                  <a href="http://webservice.jrgm.biz/NotesImg/#name#" target="_blank"><img src="http://webservice.jrgm.biz/NotesImg/#name#" width="20" height="20" /></a>&nbsp;
              </cfloop></div></td>
              <td><div align="center"><a href="job_details.cfm?deleteme=notsure&job_id=#job_id#&work_date=#url.work_date#&noteid=#get_job_notes.ID#"><i class="fa fa-times-circle font-red"></i></a></div></td>
            </tr>
          </cfoutput>
          </table>
          
           <cfif IsDefined("deleteme") AND deleteme EQ 'notsure' >
            <p class="text-danger">Are you sure you want to delete this note?</p>
           <cfoutput> <a href="job_details.cfm?deleteme=yes&amp;job_id=#job_id#&amp;work_date=#url.work_date#&amp;noteid=#url.noteid#" class="btn btn-primary">Yes</a>&nbsp;&nbsp; &nbsp; <a href="job_details.cfm?work_date=#url.work_date#&amp;job_id=#job_id#"  class="btn btn-primary">No</a></cfoutput></span>
              <cfabort>
          </cfif> 
          <div class="spacer40"></div>
          </div>
            </div>
            <!-- END JOB NOTES--> 
          </div>
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
  
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>

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
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script> 
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support --> 
<script src="assets/global/plugins/morris/morris.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/index3.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<!-- END PAGE LEVEL SCRIPTS --> 
<script>
jQuery(document).ready(function() { 
  
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo(theme settings page)
   Index.init(); // init index page
   Tasks.initDashboardWidget(); // init tash dashboard widget
});
</script> 
<!-- END JAVASCRIPTS -->
</div>
</body>
<!-- END BODY -->
</html>