<!---<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2 >
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date>
<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >--->
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
  <cfelseif BRANCH EQ 'Test' >
  <CFSET branchcode =100>
  <cfelse>
  <CFSET branchcode ='Unknown'>
</cfif>
<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch = '#SESSION.branch#'
 </cfquery>
<CFSET myemployeelist ="0">
<cfloop query="get_all_employee_info">
  <cfset myemployeelist = ListAppend(myemployeelist,Employee_ID)>
</cfloop>
<cfquery name="get_all_equipment_repair_log_info"    datasource="jrgm"   >
SELECT   ID,acceptdate,Equipment_ID,completionDate  FROM equipment_repair_log
  </cfquery>
<cfquery name="get_all_jobs_info" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid FROM app_jobs  
</cfquery>
<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE  Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<cfquery name="get_BM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylistsupers ="0">
<cfloop query="get_supers">
  <cfset mylistsupers = ListAppend(mylistsupers,Employee_ID)>
</cfloop>
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
      
      <cfif  get_first_time_in.first_id_oftheday EQ "">
        <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MAX(ID) AS  first_id_oftheday  
 FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL
 </cfquery>
      </cfif>
      <cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#today_datex#' AND ID > #get_first_time_in.first_id_oftheday#    
  </cfquery>
      <CFSET mylist ="0">
      <cfloop query="get_APK_time_after_DSID" >
        <cfset myList = ListAppend(mylist,ds_id)>
      </cfloop>
      <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#) AND branch_code = #branchcode#
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
                      <th>Production Manager</th>
                      <th>Supervisor/Crew Leader</th>
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
        <div class="col-md-6 col-sm-12"> 
          <!-- BEGIN PORTLET-->
          <div class="portlet box blue-hoki">
            <cfquery name="get_UA_daily_sheets_for_RM" datasource="jrgm"  > 
SELECT  * FROM APP_daily_sheets  WHERE ((Supervisor_ID IN (#mylistsupers#)  OR  Supervisor_ID = #SESSION.userid#)) AND ds_approved IS NULL AND ds_date > '12/31/2014' ORDER by ds_date DESC , ID DESC
  </cfquery>
            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal"><cfoutput>#get_UA_daily_sheets_for_RM.RecordCount#</cfoutput></span> Daily Sheets</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            <div class="portlet-body">
              <p class="text-danger"><strong>The following Daily Sheets have NOT been approved.</strong></p>
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th>DSID</th>
                    <th>Date</th>
                    <th>Branch</th>
                    <th>Production Manager</th>
                    <th>Supervisor/Crew Leader</th>
                  </tr>
                </thead>
                <tbody>
                  <cfoutput query="get_UA_daily_sheets_for_RM">
                    <cfquery name="get_info_S"  dbtype="query" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
						SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID =#get_UA_daily_sheets_for_RM.supervisor_id#
					</cfquery>
                    <cfquery name="get_info_CL" dbtype="query" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
						SELECT   last_name AS employee_name,branch
						FROM   get_all_employee_info WHERE employee_ID =#get_UA_daily_sheets_for_RM.Crew_Leader_ID#
					</cfquery>
                    <tr>
                      <td><a href="daily_sheet.cfm?dsid=#ID#">#ID#</a></td>
                      <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                      <td >#get_info_S.branch#</td>
                      <td>#get_info_S.employee_name#</td>
                      <td>#get_info_CL.employee_name#</td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- END PORTLET-->
        <div class="col-md-6 col-sm-12"> 
          <!-- BEGIN PORTLET-->
          <div class="portlet box green">
            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal">1</span> Payroll</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            
            <!--   Check Pay Period 1 --->
            
            <div class="portlet-body"> 
              
              <!---   Check Pay Period 1 --->
              <cfquery name="app_payroll_periods1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>
              <CFSET pay_period_end_week1 =  dateadd("d",7,app_payroll_periods1.pay_period_start)>
              <cfquery name="get_employees_with_time_Week1" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#SESSION.branch#'  
        AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week1">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif SESSION.branch EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week1" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
              <cfif  todaydate GT APPLICATION.week1_date_available  AND get_employees_with_time_unapproved_Week1.recordcount GT 0>
                <p class="text-danger"><strong>You have unapproved Week 1 payroll.</strong></p>
                <a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>" class="btn btn-primary">Approve week 1 payroll</a>
                <cfelse>
                <p class="text-success"><strong>All Week 1 payroll is approved.</strong></p>
              </cfif>
              
              <!---   Check Pay Period 2 --->
              <cfquery name="app_payroll_periods2" datasource="jrgm">
 SELECT   pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>
              <CFSET pay_period_end_week2 =  dateadd("d",7,app_payroll_periods2.pay_period_start)>
              <cfquery name="get_employees_with_time_Week2" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#SESSION.branch#'  
        AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week2">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif SESSION.branch EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week2" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
              <cfif  todaydate GT APPLICATION.week2_date_available AND get_employees_with_time_unapproved_Week2.recordcount GT 0>
                <p class="text-danger"><strong>You have unapproved Week 2 payroll.</strong></p>
                <a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>" class="btn btn-primary">Approve week 2 payroll</a>
                <cfelse>
                <br>
                <br>
                <p class="text-success"><strong>All Week 2 payroll is approved.</strong></p>
              </cfif>
              <cfquery name="get_many_hours" datasource="jrgm">
 SELECT employee_ID,ds_date,COUNT(DISTINCT ds_id) AS Count 
 FROM  app_employee_payroll_clock
 WHERE     (ds_date > '#APPLICATION.blockdate#')     AND Employee_ID IN (#myemployeelist#)
 GROUP BY Employee_ID, ds_date
 HAVING   COUNT(DISTINCT ds_id) > 1
 </cfquery>
              <cfif  get_many_hours.recordcount GT 0>
                <br>
                <br>
                <br>
                <p class="text-danger"><strong>These employees are on more than 1 daily sheet  in 1 day. Please review to make sure that this is correct.</strong></p>
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th> Employee ID</th>
                      <th> Date</th>
                      <th> Employee Name</th>
                      <th> DSID #1</th>
                      <th> DSID #2</th>
                    </tr>
                  </thead>
                  <cfoutput query="get_many_hours">
                    <tbody>
                      <tr>
                        <td>#Employee_ID#</td>
                        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
                        <cfquery name="get_many_hours_name"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID = #Employee_ID#
 </cfquery>

                        <td>#get_many_hours_name.employee_name#</td>
                        <!---    <td>#get_many_hours_name.branch#</td> --->
                        <cfquery name="get_ds_id" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,Time_In, Time_Out
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
 </cfquery>
                        <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id.ds_id#"  target="_blank">#get_ds_id.ds_id#</a><br>
                          #TimeFormat(get_ds_id.time_in, "HH:mm")# - #TimeFormat(get_ds_id.time_out, "HH:mm")#</td>
                        <cfquery name="get_ds_id_other" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,Time_In, Time_Out
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#  AND ds_id <> #get_ds_id.ds_id#
 </cfquery>
                        <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id_other.ds_id#"  target="_blank">#get_ds_id_other.ds_id#</a><br>
                          #TimeFormat(get_ds_id_other.time_in, "HH:mm")# - #TimeFormat(get_ds_id_other.time_out, "HH:mm")#</td>
                      </tr>
                    </tbody>
                  </cfoutput>
                </table>
              </cfif>
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
            
            <!--   PENDING REPAIR  -->
            <div class="portlet-body">
              <div class="scroller" style="height:300px">
                <cfquery name="get_this_equipment_in_repair_pending" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 2  AND Branch_name = '#SESSION.branch#' 
 </cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair_pending.recordcount#</cfoutput></span> Pending Repair</h4>
                <div class="table-scrollable table-scrollable-borderless">
                  <cfif get_this_equipment_in_repair_pending.recordcount EQ  0 >
                    There is no equipment pending repair
                    <cfelse>
                    <table class="table table-hover table-light">
                      <thead>
                        <tr class="uppercase">
                          <th> date pended repair</th>
                          <th> category </th>
                          <th> eqid </th>
                          <th> equip name</th>
                          <th>allocated to</th>
                          <th>history</th>
                        </tr>
                      </thead>
                      <cfoutput query="get_this_equipment_in_repair_pending">
                        <tr>
                          <td>#dateformat(pended_repair_date,"mm/dd/yy")#</td>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair_pending.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query"  cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href= "history_allocation.cfm?ID=#ID#">History</a></td>
                        </tr>
                      </cfoutput>
                    </table>
                  </cfif>
                </div>
                <!--   END PENDING REPAIR  -->
                
                <div class="spacer40"></div>
                
                <!--  CURRENTLY IN REPAIR  -->
                <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3  AND
Branch_name = '#SESSION.branch#'  
ORDER by ID DESC
 </cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair.recordcount#</cfoutput></span> Currently in Repair</h4>
                <div class="table-scrollable table-scrollable-borderless"> 
                  <!---  <cfdump var="#get_this_equipment_in_repair#"> --->
                  <cfif get_this_equipment_in_repair.recordcount EQ 0 >
                    There is no equipment currently in repair
                    <cfelse>
                    <table class="table table-hover table-light">
                      <thead>
                        <tr class="uppercase">
                          <th> date given<br>
                            to mechanic</th>
                          <th> date repair<br>
                            log started</th>
                          <th> repair<br>
                            log id</th>
                          <th>category</th>
                          <th>eQid</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th>history</th>
                        </tr>
                      </thead>
                      <cfoutput query="get_this_equipment_in_repair">
                        
                          <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                          <cfquery name="get_accept_date"        dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #get_this_equipment_in_repair.ID#  AND   completionDate IS NULL
 ORDER by ID DESC
 </cfquery>
                          <cfif  get_accept_date.recordcount EQ 0>
                            <td>Not Started</td>
                            <td>-</td>
                            <cfelse>
                            <td>#dateformat(get_accept_date.acceptdate,"mm/dd/yy")#</td>
                            <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&amp;equipmentid=#ID#"  target="_blank">#ID#</a></td>
                          </cfif>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                        </tr>
                      </cfoutput>
                        </tbody>
                      
                    </table>
                  </cfif>
                </div>
                <!--  END CURRENTLY IN REPAIR  -->
                <div class="spacer40"></div>
                
                <!--   RECENTLY COMPLETED REPAIRS  -->
                <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" >
SELECT * FROM equipment WHERE   inventory_status = 5
AND    Branch_name = '#SESSION.branch#' 
ORDER by repair_last_completed_date DESC
 </cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair_recent.recordcount#</cfoutput></span> Recently Completed Repairs with Status "Completed Repair" <span class="message">These Need a Status Change</span> </h4>
                <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                  There is no equipment with recently completed repairs that needs a status change.
                  <cfelse>
                  <div class="table-scrollable table-scrollable-borderless">
                  <table class="table table-hover table-light">
                    <thead>
                      <tr class="uppercase">
                        <th> date given<br>
                          to mechanic</th>
                        <th>date repair<br>
                          completed</th>
                        <th>repair<br>
                          log id</th>
                        <th>category</th>
                        <th>eQid</th>
                        <th>Equipment Name</th>
                        <th>Allocated to</th>
                        <th>change status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <cfoutput query="get_this_equipment_in_repair_recent">
                        <tr>
                          <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                          <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                          <cfquery name="get_accept_date2"       dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                          <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&amp;equipmentid=#ID#">#ID#</a></td>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href="history_allocation.cfm?ID=#ID#">Change Status</a></td>
                        </tr>
                      </cfoutput>
                    </tbody>
                  </table>
                </cfif>
              </div>
              <!--   END RECENTLY COMPLETED REPAIRS  -->
              
              <div class="spacer40"></div>
              
              <!--  RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  -->
              <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="20">
SELECT * FROM equipment WHERE   inventory_status = 1  AND repair_last_completed_date IS NOT NULL
AND    Branch_name = '#SESSION.branch#' 
ORDER by repair_last_completed_date DESC
 </cfquery>
              <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                There is no equipment with recently completed repairs
                <cfelse>
                <h4>Recently Completed Repairs with Status "Active" (Showing last 20) <span class="message">These Do Not Need a Status Change</span> </h4>
                <div class="table-scrollable table-scrollable-borderless">
                <table class="table table-hover table-light">
                  <thead>
                    <tr class="uppercase">
                      <th> date given<br>
                        to mechanic</th>
                      <th>date repair<br>
                        completed</th>
                      <th>repair<br>
                        log id</th>
                      <th>category</th>
                      <th>eQid</th>
                      <th>Equipment Name</th>
                      <th>Allocated to</th>
                      <th>history</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="get_this_equipment_in_repair_recent">
                      <tr>
                        <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                        <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                        <cfquery name="get_accept_date2"        dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_all_equipment_repair_log_info
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                        <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td>
                        <td>#Category#</td>
                        <td>#Equipment_ID#</td>
                        <td>#Product_name#</td>
                        <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
                          <td>Unallocated</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                          <td>Spare</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                          <td>Inactive</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                          <td>Seasonal</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                          <td>Lost</td>
                          <cfelse>
                          <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                          <td>#get_branch_employees_cache.employee_name#</td>
                        </cfif>
                        <td><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>
            </div>
            <!--  END RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  --> 
            
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
            <h4>Hours </h4>
            Employees that answered "I do not agree" to hours signout question <span class="message">Showing last 20</span>
            <div class="table-scrollable table-scrollable-borderless">
              <table class="table table-hover table-light">
                <thead>
                  <tr class="uppercase">
                    <th> DSID </th>
                    <th> Date </th>
                    <th> employee name</th>
                    <th>Production Manager</th>
                    <th>Supervisor/Crew Leader</th>
                  </tr>
                </thead>
                <cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT  * FROM APP_daily_sheets  WHERE ((Supervisor_ID IN (#mylistsupers#)  OR  Supervisor_ID = #SESSION.userid#)) AND ds_date > '12/31/2014' ORDER by ds_date DESC
    </cfquery>
                <CFSET mylistds ="0">
                <cfloop query="get_daily_sheets">
                  <cfset mylistds = ListAppend(mylistds,ID)>
                </cfloop>
                <cfquery name="get_employees_CompleteHours" datasource="jrgm" maxrows="20">
        SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0 AND ds_id In (#mylistds#)  
       ORDER by ds_date desc
          </cfquery>
                <cfoutput query="get_employees_CompleteHours">
                  <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_CompleteHours.employee_ID#
        </cfquery>
                  <cfquery name="get_info_CL"  dbtype="query">
SELECT employee_name,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.crew_leader#
        </cfquery>
                  <cfquery name="get_info_S"  dbtype="query">
SELECT employee_name,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.supervisor#
        </cfquery>
                  <tr>
                    <td><a href="daily_sheet.cfm?dsid=#get_employees_CompleteHours.ds_id#" target="_blank">#ds_id#</a></td>
                    <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                    <td>#get_employees_name.employee_name#</td>
                    <td>#get_info_S.last_name#</td>
                    <td>#get_info_CL.last_name#</td>
                  </tr>
                </cfoutput>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><a href="report_signout_questions_hours.cfm" class="btn btn-circle btn-sm blue-madison"> View All </a></td>
                </tr>
              </table>
              <div class="spacer20"></div>
              <h4>Injury </h4>
              Employees that answered "I do not agree" to injury signout question <span class="message">Showing last 20</span>
              <div class="table-scrollable table-scrollable-borderless">
                <table class="table table-hover table-light">
                  <thead>
                    <tr class="uppercase">
                      <th> DSID </th>
                      <th> Date </th>
                      <th> employee name</th>
                      <th>Production Manager</th>
                      <th>Supervisor/Crew Leader</th>
                    </tr>
                  </thead>
                  <cfquery name="get_employees_injury" datasource="jrgm" maxrows="20">
        SELECT ds_id,IsEmpInjury,employee_ID,CREW_LEADER,supervisor ,DS_DATE FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND ds_id In (#mylistds#)
       ORDER by ds_date desc
          </cfquery>
                  <cfoutput query="get_employees_injury">
                    <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_injury.employee_ID#
        </cfquery>
                    <cfquery name="get_info_CL"  dbtype="query">
SELECT employee_name,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.crew_leader#
        </cfquery>
                    <cfquery name="get_info_S"  dbtype="query">
SELECT employee_name,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.supervisor#
        </cfquery>
                    <tr>
                      <td><a href="daily_sheet.cfm?dsid=#get_employees_injury.ds_id#" target="_blank">#ds_id#</a></td>
                      <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                      <td>#get_employees_name.employee_name#</td>
                      <td>#get_info_S.last_name#</td>
                      <td>#get_info_CL.last_name#</td>
                    </tr>
                  </cfoutput>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a href="report_signout_questions_injury.cfm" class="btn btn-circle btn-sm blue-madison"> Show All </a></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- END SIGN OUT SECTION  --> 
      </div>
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
             <!--- <li><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
              <li><a href="branch_joblist.cfm">Job Labor &amp; Materials Detail Report for Excel</a>&nbsp;<img src="assets/excel.png" width="16" height="16" alt=""/> </li>--->
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
        <cfquery name="get_employees_notes" datasource="jrgm">
SELECT  ID,note_content,employee_id,Note_Author_ID, Note_Date FROM app_notes WHERE Employee_ID  
 IN (SELECT Employee_ID FROM app_crews WHERE  Employee_branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
            </cfquery>
        <!--- <cfdump var="#get_employees_notes#">  --->
        <div class="portlet-title">
          <div class="caption"> Employee Notes</div>
          <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
          <div class="actions"> <a href="employee_notes.cfm" class="btn btn-circle btn-default"> View All </a> </div>
        </div>
        <div class="portlet-body">
          <cfif get_employees_notes.recordcount EQ 0>
            <div class="scroller" style="height:300px"> No employee notes. </div>
            <cfelse>
            <div class="table-scrollable table-scrollable-borderless">
            <table class="table table-hover table-light">
              <tbody>
                <cfoutput query="get_employees_notes">
                  <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_notes.employee_ID#
        </cfquery>
                  <tr>
                    <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
                    <td><a href="employee_details.cfm?employee_id=#employee_id#&amp;work_date=#todayDate#">#get_employees_name.employee_name#</a> : #note_content#</td>
                    <td><a href=""><i class="fa fa-times-circle font-red"></i></a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
          </cfif>
        </div>
        <!-- END EMPLOYEE NOTES --> 
      </div>
    </div>
  </div>
  <div class="col-md-6"> 
    
    <!-- BEGIN JOB NOTES-->
    <div class="portlet box green-haze">
      <cfquery name="get_job_notes" datasource="jrgm" maxrows="7">
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID]  FROM app_jobs WHERE  branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
</cfquery>
      <!--- <cfdump var="#get_job_notes#"> --->
      <div class="portlet-title">
        <div class="caption">Job Notes</div>
        <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
        <div class="actions"> <a href="job_notes.cfm" class="btn btn-circle btn-default"> View All </a> </div>
      </div>
      <div class="portlet-body">
        <cfif get_job_notes.recordcount EQ 0>
          <div class="scroller" style="height:300px">No Job Notes for today</div>
          <cfelse>
          <div class="table-scrollable table-scrollable-borderless">
          <table class="table table-hover table-light">
            <tbody>
              <cfoutput query="get_job_notes">
                <cfquery name="get_jobs_name" dbtype="query">
SELECT   jobname FROM get_all_jobs_info WHERE  jobid  = '#get_job_notes.job_id#'
</cfquery>
                <tr>
                  <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
                  <td><a href="job_details.cfm?job_id=#job_id#&amp;work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                  <td><a href=""><i class="fa fa-times-circle font-red"></i></a></td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
        </cfif>
      </div>
    </div>
  </div>
</div>
<cfif SESSION.branch EQ 'test'>
  <div class="row">
    <div class="col-md-6"> 
      <!-- EMPLOYEE NOTES SECTION -->
      <div class="portlet box blue-madison">
        <div class="portlet-title">
          <div class="caption">Manage Crew Leaders</div>
          <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
        </div>
        <div class="portlet-body">
          <div class="table-scrollable table-scrollable-borderless">
            <table class="table table-hover table-light">
              <tbody>
                <tr>
                  <td><cfif SESSION.branch EQ 'test'>
                      <div class="blueAlignment"><a href="manage_crew_leaders.cfm" class="bluebutton">Manage Crew Leaders</a> </div>
                    </cfif></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- END JOB NOTES--> 
  </div>
</cfif>
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