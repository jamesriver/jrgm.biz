<cfif IsDefined('form.branch')>
    <cfset SESSION.branch = form.branch>
</cfif>

<!---<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >
<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >--->


<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, [Name FirstLast] AS  [employee_name], first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>


<!---<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>
--->
<!---<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>--->

<!---
<cfquery name="get_accept_date_all" datasource="jrgm">
SELECT   ID,acceptdate,Equipment_ID,completionDate  FROM equipment_repair_log ORDER by ID DESC
</cfquery>
--->

<cfquery name="get_all_jobs_info" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid,branch FROM app_jobs  
</cfquery>

<!---
<cfquery name="get_all_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE    Branch_name IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>
--->

<!--- <cfdump  var="#get_crew_leaders#"> --->
<!---<CFSET mylistgs ="">
<cfloop query="get_supers">
  <cfset myListgs = ListAppend(mylistgs,Employee_ID)>
</cfloop>--->
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
<cfset todaydate = now() />

<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.2
Version: 3.6.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
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
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
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
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!-- END THEME STYLES -->

</head>
<body>

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="page-title">
        <h1>Dashboard <small><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></small></h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Dashboard </li>
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
      <cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
      <cfset today_datexy = #DateFormat(yesterday, "mm/dd/yyyy")#>
      <!---   Get the first time in of today --->
      <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  
 FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date = '#today_datex#'  
 </cfquery>
      <!---<cfdump var="#get_first_time_in#">---> 
      
      <!---<cfif  get_first_time_in.first_id_oftheday EQ "">
  <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  
 FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date = '#today_datexy#'
 </cfquery>
</cfif>
--->
      <cfif  get_first_time_in.first_id_oftheday EQ "">
        <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MAX(ID) AS  first_id_oftheday  
 FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL
 </cfquery>
      </cfif>
      <cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#today_datex#' AND ID > #get_first_time_in.first_id_oftheday#      AND ds_date > '09/30/2015'
  </cfquery>
      <CFSET mylist ="0">
      <cfloop query="get_APK_time_after_DSID" >
        <cfset myList = ListAppend(mylist,ds_id)>
      </cfloop>

      <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#) AND branch_code IN (#branchcodelist#)
 ORDER by ID DESC
 </cfquery>
      <cfif  get_APK_time_after.recordcount GT 0>
        <div class="row">
          <div class="col-md-12">
            <div class="portlet box red">
              <div class="portlet-title">
                <div class="caption">Tablets with Sync Issues<br>
                </div>
              </div>
              <div class="portlet-body">
                <p class="text-danger"><strong> These daily sheets synced  today and did not sync on the correct work day. </strong></p>
                Please check the tablet settings and review the <a href="assets/admin/layout3/pdfs/Reminder%20Sheet%20English.pdf">syncing procedures </a>with the crew leader
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>DSID</th>
                      <th>Work Date</th>
                      <th>Branch</th>
                      <th>Supervisor</th>
                      <th>Crew Leader</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="get_APK_time_after" >
                      <cfquery name="get_info_CL"  dbtype="query"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID   =#get_APK_time_after.CREW_LEADER_ID#
        </cfquery>
                      <cfquery name="get_info_S"  dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID=#get_APK_time_after.supervisor_ID#
        </cfquery>
                      <tr>
                        <td><a href="daily_sheet.cfm?dsid=#get_APK_time_after.ID#">#get_APK_time_after.ID#</a></td>
                        <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                        <td>#get_info_S.branch#</td>
                        <td>#get_info_S.employee_name#</td>
                        <td>#get_info_CL.employee_name#</td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </cfif>
      <div class="row margin-top-10">
        <div class="col-sm-12 text-center">
            <form id="form_branch" method="post">
            Switch to view a different branch:
                <select name="branch"   tabindex="5" onChange="document.getElementById('form_branch').submit()">
                    <option value="Corporate" <cfif SESSION.branch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                    <option value="Charlottesville" <cfif SESSION.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <option value="Chesterfield" <cfif SESSION.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <option value="Newport News" <cfif SESSION.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth" <cfif SESSION.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond" <cfif SESSION.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                </select>
            </form>
            </br ><br />
        </div>
      </div>

      <!--   DAILY SHEETS AND PAYROLL ROW   -->
      <div class="row">
        <div class="col-md-6 col-sm-12"> 

          <!-- BEGIN PORTLET-->
          <div class="portlet box blue-hoki" id="dailySheetsIdForAjax">
            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal"><cfoutput>0</cfoutput></span> Daily Sheets</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            <div class="portlet-body">
		<span id="icon_ajaxloading" style="display: inline"><i>Daily Sheets Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_daily_sheets.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("dailySheetsIdForAjax").innerHTML=data;
                    }
                });
		</script>

          </div> 
        </div>
      </div>
        <!-- END PORTLET-->

        <div class="col-md-6 col-sm-12"> 
          <!-- BEGIN PORTLET-->
          <div class="portlet box green" id="payrollIdForAjax">
            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal">1</span> Payroll</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            
            <div class="portlet-body"> 

		<span id="icon_ajaxloading" style="display: inline"><i>Payroll Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_payroll.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("payrollIdForAjax").innerHTML=data;
                    }
                });
		</script>

            </div>
      
            <!-- END PORTLET--> 
          </div>
        </div>
      </div>

      <!--   EQUIPMENT ROW   -->
      <div class="row">
        <div class="col-md-12">
          <div class="portlet box yellow-casablanca">
            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal">4</span> Equipment</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            <div class="portlet-body">
              <div class="scroller" style="height:300px">
	        <div id="equipmentIdForAjax">

		<span id="icon_ajaxloading" style="display: inline"><i>Equipment Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_equipment.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("equipmentIdForAjax").innerHTML=data;
                    }
                });
		</script>

                </div>
	      </div>
            </div>
          </div>
        </div>
      </div>
  <!--   END EQUIPMENT ROW   --> 
  
  <!--   SIGN OUT AND REPORTS ROW  -->
  <div class="row">
    <div class="col-md-6 col-sm-12"> 

      <!-- SIGN OUT SECTION-->
      <div class="portlet box purple-plum">
        <div class="portlet-title">
          <div class="caption"> Sign Out</div>
          <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
        </div>
        <div class="portlet-body">
          <div class="scroller" style="height:300px">
	    <div id="signOutIdForAjax">

		<span id="icon_ajaxloading" style="display: inline"><i>Sign Out Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_signout.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("signOutIdForAjax").innerHTML=data;
                    }
                });
		</script>

            </div>
          </div>
        </div>
      </div>
      <!-- END SIGN OUT SECTION  --> 

    </div>
    <div class="col-md-6 col-sm-12"> 
      
      <!-- BEGIN REPORTS SECTION -->
      <div class="portlet box grey-cascade">
        <div class="portlet-title">
          <div class="caption">Reports</div>
          <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
        </div>
        <div class="portlet-body">
          <div class="scroller" style="height:300px">
            <div class="spacer20"></div>
            <ul>
              <li><a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_projectassignments');">Project Assignments Report (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labormaterials');">Labor & Materials Combined Report (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labor');">Labor Report (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_materials');">Materials Report (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval');">Snow Removal (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval&nocostrates=1');">Snow Removal - No Cost Rates (CSV)</a></li>
              <li><a href="javascript:window.open('http://api.jrgm.com/biz/?EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=view_jobcost');">Job Cost Report</a></li>
            </ul>

            <cfquery name="see_if_pended" datasource="jrgm">
              SELECT * FROM inventory_report_list
              WHERE  inventory_user =  #SESSION.userid#  AND  inventory_status = 0
            </cfquery>
            <h5>Equipment Inventory Reports</h5>
            <ul>
              <li><a href="inventory_report_printable.cfm" target="_blank">Equipment Inventory Report (Printable)</a></li>
              <cfif see_if_pended.recordcount EQ 0>
                <li><a href="inventory_report_printable_eversion1.cfm" target="_blank">Start an Equipment Inventory Report (Electronic)</a></li>
                <cfelse>
                <li><a href="inventory_report_printable_eversion1.cfm?Inventory_Report_ID=<cfoutput>#see_if_pended.ID#</cfoutput>" target="_blank">Continue with Pended Equipment  Inventory Report -(<cfoutput>#see_if_pended.ID#</cfoutput>)</a></li>
              </cfif>
              <li><a href="inventory_reports_list.cfm">View Prior Equipment Inventory Report (Electronic)</a></li>
            </ul>

            <!--- <cfif  Session.userid EQ 1433  > --->
            <h5>Inspection Reports</h5>
            <ul>
              <li><a href="Morning_Inspection_List.cfm">Morning Inspection Forms</a></li>
              <li><a href="Evening_Inspection_List.cfm">End of Day Inspection Forms</a></li>
              <li><a href="Weekly_Equipment_Maintenance_List.cfm">Weekly Equipment Maintenance Forms</a></li>
            </ul>
            <!---     </cfif> --->
          </div>
        </div>
      </div>
      <!-- END REPORTS SECTION --> 

    </div>
  </div>
  <!--  END SIGN OUT AND REPORTS ROW  --> 
  
  <!--  EMPLOYEE AND JOB NOTES ROW  -->
  <div class="row">
    <div class="col-md-6"> 
      <!-- EMPLOYEE NOTES SECTION -->
      <div class="portlet box blue-madison">
        <!--- <cfdump var="#get_employees_notes#">  --->
        <div class="portlet-title">
          <div class="caption"> Employee Notes</div>
          <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
          <div class="actions"> <a href="employee_notes.cfm" class="btn btn-circle btn-default"> View All </a> </div>
        </div>
        <div class="portlet-body">

	    <div id="employeeNotesIdForAjax">

		<span id="icon_ajaxloading" style="display: inline"><i>Employee Notes Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_employee_notes.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("employeeNotesIdForAjax").innerHTML=data;
                    }
                });
		</script>

            
        
        </div>
        <!-- END EMPLOYEE NOTES --> 
      </div>
    </div>
  </div>
  <div class="col-md-6"> 
    
    <!-- BEGIN JOB NOTES-->
    <div class="portlet box green-haze">

      <!--- <cfdump var="#get_job_notes#"> --->
      <div class="portlet-title">
        <div class="caption">Job Notes</div>
        <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
        <div class="actions"> <a href="job_notes.cfm" class="btn btn-circle btn-default"> View All </a> </div>
      </div>
      <div class="portlet-body">

	    <div id="jobNotesIdForAjax">

		<span id="icon_ajaxloading" style="display: inline"><i>Employee Notes Loading... please wait.</i></span>

		<script>
                $.ajax({
                    url: 'index_job_notes.cfm',
                    type: 'get',
                    success: function(data) {
			document.getElementById("jobNotesIdForAjax").innerHTML=data;
                    }
                });
		</script>

            </div>

      </div>
    </div>
  </div>
</div>
<!-- END JOB NOTES-->
</div>
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
</div>
</div>

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

</body>
<!-- END BODY -->
</html>