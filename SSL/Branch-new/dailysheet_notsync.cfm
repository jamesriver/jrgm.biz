 <cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch = '#SESSION.branch#'
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
 
 
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
  <cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>

<CFSET branch ='#SESSION.branch#'>
 <cfif BRANCH EQ 'Richmond' >
    <CFSET branchcode =10>
     <cfelseif BRANCH EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif BRANCH EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif BRANCH EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif BRANCH EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif BRANCH EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
    <CFSET branchcode ='Unknown'>
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
        <h1>Daily Sheets That Did Not Sync on the Correct  Work Day</h1><br>
       </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Daily Sheets That Did Not Sync</li>
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
				<div class="col-md-12">These daily sheets did not sync on the correct work day in the past 45 days. Please check the tablet settings and review the <a href="assets/admin/layout3/pdfs/Reminder%20Sheet%20English.pdf">syncing procedures </a>with the crew leader<br><br>


              <table class="table table-striped table-bordered table-hover" id="sample_3">
          <thead>
            <tr>
              <th align="left">DSID</th>
              <th align="left">ID </th>
              <th align="left">Date</th>
              <th align="left">DS Date </th>
              <th align="left">Days Late</th>
              <th align="left">Branch </th>
              <th align="left">Supervisor </th>
              <th align="left">Crew Leader </th>
              <th align="left">Approved </th>
            </tr>
          </thead>
          <tbody>
             <CFSET mylistused ="0">
            <cfset startDate = Now()-45>
            <cfset endDate = Now() >
            <cfloop from="#startDate#" to="#endDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
            <!---<cfoutput>#dateformat(i, "mm/dd/yyyy")#<br /></cfoutput>   --->
   <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date =
 '#DateFormat(i, "mm/dd/yyyy")#'
  </cfquery>
              <cfif get_first_time_in.first_id_oftheday NEQ "">
<cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#DateFormat(i, "mm/dd/yyyy")#' AND ID > #get_first_time_in.first_id_oftheday#
  </cfquery>
                <CFSET mylist ="0">
                <cfloop query="get_APK_time_after_DSID" >
                  <cfset myList = ListAppend(mylist,ds_id)>
                </cfloop>
                <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#) AND ID NOT In (#mylistused#)     AND branch_code = #branchcode#
 ORDER by ID DESC
 </cfquery>
 
                <cfoutput query="get_APK_time_after" >
                 <cfquery name="get_info_CL"  dbtype="query"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID   =#get_APK_time_after.CREW_LEADER_ID#
        </cfquery>
        <cfquery name="get_info_S"  dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID=#get_APK_time_after.supervisor_ID#
        </cfquery>
                     <cfquery name="get_sync_date"  datasource="jrgm"   >
 SELECT   MAX(record_created)   AS sync_date
FROM         app_employee_payroll_clock
WHERE     (ds_id = #get_APK_time_after.ID#) 
        </cfquery>
            <CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#>
            <cfif  var LT 0>
                  <tr>
                    <td><a href="daily_sheet.cfm?dsid=#get_APK_time_after.ID#">#get_APK_time_after.ID#</a></td>
                    <td>#get_APK_time_after.ID#</td>
                    
                    <td nowrap="nowrap">#DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#</td>
                    <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                    <CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#>
                    <td align="left">#var#</td>
                    <td align="left">#get_info_S.branch#</td>
                    <td>#get_info_S.employee_name#</td>
                    <td>#get_info_CL.employee_name#</td>
                    <cfif get_APK_time_after.ds_approved EQ 1>
                      <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                      <cfelse>
                      <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">-</a> </td>
                    </cfif>
                  </tr>     
                  </cfif>
          <cfset mylistused = ListAppend(mylistused,get_APK_time_after.ID)>
                 </cfoutput>
              </cfif>
         
            </cfloop>
          </tbody>
        </table></td>
    </tr>
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