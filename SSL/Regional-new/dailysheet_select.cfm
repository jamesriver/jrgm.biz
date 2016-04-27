<CFSET session.Crew_Leader_IDR = 0>
<cfif IsDefined("form.submitted2")>
  <CFSET session.Crew_Leader_IDR = form.Crew_Leader_ID>
</cfif>
<CFSET allchecked ='Yes'>
<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
 </cfquery>
<cfquery name="get_all_employee_PR_info" datasource="jrgm">
 SELECT   ds_id, supervisor, in_out_status, time_out FROM APP_Employee_Payroll_Clock   WHERE  Time_Out   > '2015-10-01 12:00:00.000' AND  Time_Out IS NOT NULL
  </cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfquery name="get_daily_sheets" datasource="jrgm"    maxrows="500">
 SELECT  * FROM app_daily_sheets 
WHERE <!---ds_date < '#todaydate_DS#'   AND---> branch_code IN (#branchcodelist#) 
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
<cfif IsDefined("form.submitted2")  AND CREW_LEADER_ID NEQ 'All'   >AND    Crew_Leader_ID = #form.Crew_Leader_ID#</cfif>
<cfif IsDefined("form.submitted2")  AND CREW_LEADER_ID EQ 'All'   >AND    0=0</cfif>
 ORDER by ds_date DESC
 </cfquery>

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
        <h1>Daily Sheets for <cfoutput>#regionname#</cfoutput> Region</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Daily Sheets</li>
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
          <div class="portlet light ">
            <div class="portlet-body">
              <div class="spacerneg20"></div>
              <cfif IsDefined("url.delete") AND url.delete EQ 'yes'>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="dailysheet_header">Are you sure you want to delete Daily Sheet ID <cfoutput>#url.dsid#</cfoutput>?<br />
                      <cfoutput><a href="dailysheet_select.cfm?dsid=#url.dsid#&deleteme=yes" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="dailysheet_select.cfm" class="YesNoButton">No. Go back to list</a>
                        <p  class="redarial"> <br />
                          Choosing yes will delete this daily sheet. </p>
                      </cfoutput>
                      <cfabort></td>
                  </tr>
                </table>
              </cfif>
              <cfif IsDefined("url.deleteme") AND url.deleteme EQ 'yes'>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM app_daily_sheets WHERE ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_clock  WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE  FROM  app_employee_payroll_clock WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE  FROM  app_lunch WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_clock WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM   APP_job_materials_actual WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
                <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_Lunch WHERE DS_ID =#url.dsid#
    </cfquery>
                <!---<cfmail to="benchanviolin@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="Daily Sheet Deleted"  type="html">
                  DSID : #url.dsid# was deleted by #SESSION.screenname#
                </cfmail>--->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="dailysheet_header">This daily sheet has been deleted.
                      &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <br />
                      <a href="dailysheet_select.cfm" class="YesNoButton"> Go back to list</a>
                      <cfabort></td>
                  </tr>
                </table>
              </cfif>
              <div class="row">
                <div class="col-md-4">
                  <div class="row"  >
                    <label class="control-label col-md-4"  ><strong>View by Supervisor</strong></label>
                    <div class="col-xs-4 col-sm-6"> 
                      <!--  VIEW BY CREW LEADER DROP DOWN -->
                      <form action="dailysheet_select.cfm" method="post">
                        <cfquery name="get_clid" datasource="jrgm"  >
SELECT      ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch, email, 
                      app_language, password_date, color, textcolor
FROM         app_employee_passwords WHERE employee_branch IN   (#PreserveSingleQuotes(branchlist)#)
   ORDER by  lastname ASC,firstname ASC
 </cfquery>
                        <select class="bs-select form-control" name="Crew_Leader_ID"   tabindex="5" onchange='this.form.submit()'>
                          <option value="All" <cfif session.crew_leader_idr EQ 'All'> selected="selected"</cfif>>Show Me All</option>
                          <cfoutput query="get_clid">
                            <option   value="#employee_id#" <cfif session.crew_leader_idr EQ #get_clid.employee_id#> selected="selected"</cfif>>#employee_name#</option>
                          </cfoutput>
                        </select>
                        <input type="hidden"  name="submitted2" value="yes"/>
                      </form>
                      <!--  END CREW LEADER DROP DOWN --></div>
                  </div>
                </div>
                <div class="col-md-8"> 
                  <!--  SEARCH BY DSID  -->
                  <form action="dailysheet_select.cfm" method="post" class="form-inline" role="form">
                    <label class="control-label"><strong>Search by DSID</strong></label>
                    <input type="text" class="form-control input-inline input-medium" placeholder="Enter DSID" name="dsid">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <!--  END SEARCH BY DSID  --> 
                    
                    <!--  ADD DAILY SHEET BUTTON  --> 
                    <a href="dailysheet_add2.cfm" class="btn btn-success">Add a Daily Sheet</a> 
                    <!--  END ADD DAILY SHEET BUTTON  -->
                    
                    <input type="hidden"  name="submitted" value="yes"/>
                  </form>
                </div>
                
                <!--  END TOP SEARCH SECTION --> 
                
              </div>
            </div>
            <div class="spacer20"></div>
            <table class="table table-striped table-hover" id="sample_5">
              <thead>
                <tr>
                  <th><div align="left">Date</div></th>
                  <th><div align="left">ID</div></th>
                  <th><div align="left">Branch</div></th>
                  <th><div align="left">Production Manager</div></th>
                  <th><div align="left">Supervisor/Crew Leader</div></th>
                  <th><div align="left">View</div></th>
                  <!---<th><div align="left">Map</div></th>--->
                  <th><div align="left">Edit</div></th>
                  <th><div align="left">Approve</div></th>
                  <th><div align="left">Delete</div></th>
                </tr>
              </thead>
              <tbody>
              <cfif get_daily_sheets.recordcount EQ 0>
                <h2>There are currently no Daily Sheets for <cfoutput>#SESSION.regionname#</cfoutput></h2>
                <cfabort>
              </cfif>
              <cfoutput query="get_daily_sheets">
                <cfquery name="get_info_S"  dbtype="query"   cachedWithin="#createTimeSpan( 0, 8, 0, 0 )#">
SELECT  last_name AS employee_name,branch
FROM get_all_employee_info WHERE employee_ID =#get_daily_sheets.supervisor_id#
        </cfquery>
                <cfquery name="get_info_CL" dbtype="query"  cachedWithin="#createTimeSpan( 0, 8, 0, 0 )#">
SELECT   last_name AS employee_name,branch
FROM   get_all_employee_info WHERE employee_ID =#get_daily_sheets.Crew_Leader_ID#
    </cfquery>
                <tr>
                  <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                  <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets.ID#</a></td>
                  <td><div align="left">#get_info_S.branch#</div></td>
                  <td>#get_info_S.employee_name#</td>
                  <td>#get_info_CL.employee_name#</td>
                  <td><a href="daily_sheet.cfm?dsid=#ID#">View</a></td>
                  <cfquery name="get_open_workers" dbtype="query" >
           SELECT   ds_id, supervisor FROM get_all_employee_PR_info  
        WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #ID#
         </cfquery>
                  <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  AND  ds_approved NEQ 1 AND get_open_workers.recordcount  EQ 0>
                    <td><a href="daily_sheet_edit.cfm?dsid=#ID#&email=yes&branch=#get_info_S.branch#">Edit</a></td>
                    <cfelse>
                    <td> -</td>
                  </cfif>
                  <cfif       ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM)) AND get_open_workers.recordcount  EQ 0>
                    <cfif get_daily_sheets.ds_approved EQ 1>
                      <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype"><font color="red"><strong>Approved</strong></font></a></td>
                      <cfelse>
                      <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">Approve</a></td>
                    </cfif>
                    <cfelse>
                    <td> -</td>
                  </cfif>
                  <cfif  (ds_date GT #APPLICATION.blockdate#)>
                    <td><a href="dailysheet_select.cfm?delete=yes&dsid=#get_daily_sheets.ID#">Delete</a></td>
                    <cfelse>
                    <td> -</td>
                  </cfif>
                </tr>
              </cfoutput>
              </tbody>
              
            </table>
          </div>
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