<!--- COLDFUSION LOGIC HERE --->
<cfinclude template="#APPLICATION.basePath#include/init.cfm">
<cfset is_admin = 0>

<cfquery name="get_is_admin" datasource="#CONFIG_DATABASENAME#">
    SELECT is_admin FROM access_roles WHERE access_role_id=#SESSION.access_role#
</cfquery>
<cfloop query="get_is_admin">
    <cfset is_admin = get_is_admin.is_admin>
</cfloop>
<cfif SESSION.branch EQ 'Corporate'>
    <cfset is_admin = 1>
</cfif>

<!--- COLDFUSION POST LOGIC HERE--->
<cfset todayDate = Now()>
<cfif IsDefined('form.ds_post_data') AND IsDefined('form.ds_id')>
    <cfscript>
        function getTimeSQL(str)
        {
            if (str EQ '') return '';

            var spl = str.split(':');
            var hour = spl[1];
            var minute = spl[2];

            return (hour<10?'0' & hour:hour) & ':' & (minute<10?'0' & minute:minute) & ':00.000';
        }

        function getTotalTime(starttime, endtime)
        {
            var startminutes = getTotalTimeFromString(starttime);
            var endminutes = getTotalTimeFromString(endtime);
            var totalminutes = Abs(startminutes - endminutes);
            if (endminutes LT startminutes) totalminutes = 24*60-totalminutes;
            return totalminutes;
        }

        function getTotalTimeDisplay(totalminutes)
        {
            var totalhours = Int(totalminutes / 60);
            totalminutes = totalminutes % 60;
            return (totalhours LT 10?'0'&totalhours:totalhours)&':'&(totalminutes LT 10?'0'&totalminutes:totalminutes);
        }

        function getTotalTimeFromString(str)
        {
            if (str EQ '') return 0;

            var spl = str.split(':');
            var army_hour = spl[1];
            var minute = spl[2];
            return army_hour*60 + minute*1;
        }

        function getIdFromServiceCode(str)
        {
            if (str EQ '') return '';

            var spl = str.split(' - ');
            return spl[1];
        }
    </cfscript>

    <!--- SANITIZE DATA AND PERFORM SANITY CHECKS --->
    <cfset post_data = deserializeJSON(form.ds_post_data)>
    <!---cfdump var="#post_data#">
    <cfabort--->
    <cfset ds_data = post_data.ds_data>
    <cfset ds_date = DateFormat(ds_data.ds_date, 'yyyy-mm-dd')>
    <cfset ds_employees = post_data.ds_employees>
    <cfset ds_jobs = post_data.ds_jobs>

    <cfquery name="get_branch_code" datasource="#CONFIG_DATABASENAME#">
        SELECT branch_code FROM branches
        WHERE branch_name=<cfqueryparam value="#ds_data.ds_branch#" CFSQLType="CF_SQL_TEXT">
    </cfquery>
    <cfset ds_branch_code = get_branch_code.branch_code>

    <cfloop collection=#ds_employees# item="index">
        <cfset ds_employee = ds_employees[index]>
        <cfif StructKeyExists(ds_employee, 'startendtimes')>
            <cfloop from="1" to="#arrayLen(ds_employee.startendtimes)#" index="i">
                <cfset startendtime = ds_employee.startendtimes[i]>
                <cfset starttime = getTimeSQL(startendtime.starttime)>
                <cfset endtime = getTimeSQL(startendtime.endtime)>
                <cfif endtime LT starttime>
                    <cfset endtime = DateFormat(DateAdd('d', 1, ds_date), 'yyyy-mm-dd') & ' ' & getTimeSQL(startendtime.endtime)>
                <cfelse>
                    <cfset endtime = ds_date & ' ' & getTimeSQL(startendtime.endtime)>
                </cfif>
                <cfset starttime = ds_date & ' ' & getTimeSQL(startendtime.starttime)>
                <cfset totalTime = getTotalTime(startendtime.starttime, startendtime.endtime)>

                <cfset ds_employees[index].startendtimes[i].starttime = starttime>
                <cfset ds_employees[index].startendtimes[i].endtime = endtime>
                <cfset ds_employees[index].startendtimes[i].totalTime = totalTime>
            </cfloop>
        </cfif>
    </cfloop>

    <cfloop collection=#ds_jobs# item="job_index">
        <cfset ds_job = ds_jobs[job_index]>
        <cfif StructKeyExists(ds_job, 'ds_employees')>
            <cfloop from="1" to="#arrayLen(ds_job.ds_employees)#" index="index">
                <cfset ds_employee = ds_job.ds_employees[index]>
                <cfif StructKeyExists(ds_employee, 'servicecodes')>
                    <cfloop from="1" to="#arrayLen(ds_employee.servicecodes)#" index="i">
                        <cfset servicecode = ds_employee.servicecodes[i]>
                        <cfset ds_jobs[job_index].ds_employees[index].servicecodes[i].id = getIdFromServiceCode(servicecode.id)>
                    </cfloop>
                </cfif>
            </cfloop>
        </cfif>
        <cfif StructKeyExists(ds_job, 'ds_materials')>
            <cfloop from="1" to="#arrayLen(ds_job.ds_materials)#" index="index">
                <cfset ds_material = ds_job.ds_materials[index]>
            </cfloop>
        <cfelseif ds_job.nomaterials EQ 'YES'>
        <cfelse>
        </cfif>        
        <cfset starttime = getTimeSQL(ds_job.starttime)>
        <cfset endtime = getTimeSQL(ds_job.endtime)>
        <cfif endtime LT starttime>
            <cfset endtime = DateFormat(DateAdd('d', 1, ds_date), 'yyyy-mm-dd') & ' ' & getTimeSQL(ds_job.endtime)>
        <cfelse>
            <cfset endtime = ds_date & ' ' & getTimeSQL(ds_job.endtime)>
        </cfif>
        <cfset starttime = ds_date & ' ' & getTimeSQL(ds_job.starttime)>
        <cfset totalTime = getTotalTime(ds_job.starttime, ds_job.endtime)>
        
        <cfif ds_job.starttime_lunch NEQ '' AND ds_job.endtime_lunch NEQ ''>
            <cfset starttime_lunch = getTimeSQL(ds_job.starttime_lunch)>
            <cfset endtime_lunch = getTimeSQL(ds_job.endtime_lunch)>
            <cfif endtime_lunch LT starttime_lunch>
                <cfset endtime_lunch = DateFormat(DateAdd('d', 1, ds_date), 'yyyy-mm-dd') & ' ' & getTimeSQL(ds_job.endtime_lunch)>
            <cfelse>
                <cfset endtime_lunch = ds_date & ' ' & getTimeSQL(ds_job.endtime_lunch)>
            </cfif>
            <cfset starttime_lunch = ds_date & ' ' & getTimeSQL(ds_job.starttime_lunch)>
            <cfset totalTime_lunch = getTotalTime(ds_job.starttime_lunch, ds_job.endtime_lunch)>

            <cfset ds_jobs[job_index].starttime_lunch = starttime_lunch>
            <cfset ds_jobs[job_index].endtime_lunch = endtime_lunch>
            <cfset ds_jobs[job_index].totalTime_lunch = totalTime_lunch>
        </cfif>

        <cfset ds_jobs[job_index].starttime = starttime>
        <cfset ds_jobs[job_index].endtime = endtime>
        <cfset ds_jobs[job_index].totalTime = totalTime>
    </cfloop>
    <!---cfdump var="#ds_jobs#">
    <cfabort--->

    <cfif form.ds_id GT 0>
        <!--- SAVE EXISTING DAILY SHEET --->
    <cfelse>
        <!--- CREATE NEW DAILY SHEET --->
        <cfquery name="insert_ds" datasource="#CONFIG_DATABASENAME#" result="result_insert_ds">
            INSERT INTO app_daily_sheets
            (Supervisor_ID, Crew_Leader_ID, DS_Date, record_created, entry_method, branch_code)
            VALUES (
                <cfqueryparam value="#ds_data.supervisor_id#" CFSQLType="CF_SQL_TEXT">,
                <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                <cfqueryparam value="#ds_date#" CFSQLType="CF_SQL_TEXT">,
                GETUTCDATE(),
                2,
                <cfqueryparam value="#ds_branch_code#" CFSQLType="CF_SQL_TEXT">
            )
        </cfquery>
        <cfset ds_id = result_insert_ds["GENERATEDKEY"]>
    </cfif>

    <!--- CREATE EMPLOYEE PAYROLL TIMES --->
    <cfloop collection=#ds_employees# item="index">
        <cfset ds_employee = ds_employees[index]>
        <cfif StructKeyExists(ds_employee, 'startendtimes')>
            <cfloop from="1" to="#arrayLen(ds_employee.startendtimes)#" index="i">
                <cfset startendtime = ds_employee.startendtimes[i]>
                <cfquery name="insert_ds_employee" datasource="#CONFIG_DATABASENAME#" result="result_insert_ds_employee">
                    INSERT INTO app_employee_payroll_clock
                    (Employee_ID, ds_id, crew_leader, ds_date, supervisor, time_in, time_out, time_worked, entry_method, In_Out_Status)
                    VALUES (
                        <cfqueryparam value="#ds_employee.id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_date#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_data.supervisor_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#startendtime.starttime#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#startendtime.endtime#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#startendtime.totalTime#" CFSQLType="CF_SQL_TEXT">,
                        2,
                        2
                    )
                </cfquery>
            </cfloop>
        </cfif>
    </cfloop>

    <!--- COLLECT EXISTING EMPLOYEE AND JOB INFORMATION TO DETERMINE IF IT SHOULD BE CREATED, UPDATED, OR DELETED --->

    <!--- UPDATE OR CREATE JOBS --->
    <cfloop collection=#ds_jobs# item="job_index">
        <cfset ds_job = ds_jobs[job_index]>
        <cfquery name="insert_app_job_clock" datasource="#CONFIG_DATABASENAME#" result="result_insert_app_job_clock">
            INSERT INTO app_job_clock
            (Job_ID, Job_Time_In, Job_Time_Out, In_Out_Status, Crew_Leader_ID, ds_id)
            VALUES (
                <cfqueryparam value="#ds_job.id#" CFSQLType="CF_SQL_TEXT">,
                <cfqueryparam value="#ds_job.starttime#" CFSQLType="CF_SQL_TEXT">,
                <cfqueryparam value="#ds_job.endtime#" CFSQLType="CF_SQL_TEXT">,
                1,
                <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                <cfqueryparam value="#ds_id#" CFSQLType="CF_SQL_TEXT">
            )
        </cfquery>
        <cfset job_clock_id = result_insert_app_job_clock["GENERATEDKEY"]>

        <!--- ADD LUNCH IF APPLICABLE --->
        <cfif ds_job.starttime_lunch NEQ '' AND ds_job.endtime_lunch NEQ ''>
            <cfquery name="insert_app_job_clock" datasource="#CONFIG_DATABASENAME#" result="result_insert_app_job_clock">
                INSERT INTO app_lunch
                (ds_id, Job_ID, Crew_Leader_ID, Lunch_Time_In, Lunch_Time_Out, job_clock_id)
                VALUES (
                    <cfqueryparam value="#ds_id#" CFSQLType="CF_SQL_TEXT">,
                    <cfqueryparam value="#ds_job.id#" CFSQLType="CF_SQL_TEXT">,
                    <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                    <cfqueryparam value="#ds_job.starttime_lunch#" CFSQLType="CF_SQL_TEXT">,
                    <cfqueryparam value="#ds_job.endtime_lunch#" CFSQLType="CF_SQL_TEXT">,
                    <cfqueryparam value="#job_clock_id#" CFSQLType="CF_SQL_TEXT">
                )
            </cfquery>
        </cfif>

        <!--- UPDATE OR CREATE EMPLOYEE SERVICE CODES --->
        <cfif StructKeyExists(ds_job, 'ds_employees')>
            <cfloop from="1" to="#arrayLen(ds_job.ds_employees)#" index="index">
                <cfset ds_employee = ds_job.ds_employees[index]>
                <cfif StructKeyExists(ds_employee, 'servicecodes')>
                    <cfloop from="1" to="#arrayLen(ds_employee.servicecodes)#" index="i">
                        <cfset servicecode = ds_employee.servicecodes[i]>
                        <cfquery name="insert_app_job_services_actual_employee" datasource="#CONFIG_DATABASENAME#">
                            INSERT INTO app_job_services_actual_employee
                            (Employee_ID, Job_ID, Service_ID, Total_Time, ds_id, crew_leader, job_clock_id)
                            VALUES
                            (
                                <cfqueryparam value="#ds_employee.id#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#ds_job.id#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#servicecode.id#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#servicecode.time#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#ds_id#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                                <cfqueryparam value="#job_clock_id#" CFSQLType="CF_SQL_TEXT">
                            )
                        </cfquery>
                    </cfloop>
                </cfif>
            </cfloop>
        </cfif>
        <!--- UPDATE OR CREATE MATERIALS --->
        <cfif StructKeyExists(ds_job, 'ds_materials')>
            <cfloop from="1" to="#arrayLen(ds_job.ds_materials)#" index="index">
                <cfset ds_material = ds_job.ds_materials[index]>
                <cfquery name="insert_app_job_materials_actual" datasource="#CONFIG_DATABASENAME#">
                    INSERT INTO app_job_materials_actual
                    (Job_ID, ds_id, Item_ID, Quantity_used, crew_leader, job_clock_id, Service_Date)
                    VALUES
                    (
                        <cfqueryparam value="#ds_job.id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_material.id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_material.quantity#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_data.crew_leader_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#job_clock_id#" CFSQLType="CF_SQL_TEXT">,
                        <cfqueryparam value="#ds_date#" CFSQLType="CF_SQL_TEXT">
                    )
                </cfquery>
            </cfloop>
        </cfif>
        <!--- SET JOB START, END, LUNCH TIMES --->
    </cfloop>

    <!--- DELETE ANYTHING THAT WAS NOT CREATED OR UPDATED --->

    <!--- ALL DONE; REDIRECT TO EDIT PAGE --->
    <cflocation url="/SSL/admin/daily_sheet_edit2.cfm?dsid=#ds_id#">
</cfif>

<cfquery name="get_all_employees" datasource="#CONFIG_DATABASENAME#">
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, ae.first_name, ae.last_name, CASE WHEN ac.employee_position_id IS NULL OR ac.employee_position_id IN (2,6,7) THEN 0 ELSE CASE WHEN ar.is_admin > 0 THEN 1 ELSE ac.employee_position_id END END as access_role, ac.crew_leader_id, ae.branch FROM app_employees ae
  INNER JOIN app_crews ac ON ac.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=ac.employee_position_id
  WHERE ae.active_record=1
  AND ae.[Employee ID] < 9500
  GROUP BY ae.[Employee ID], ae.[Name FirstLast], ae.first_name, ae.last_name, ac.crew_leader_id, ae.branch, ac.employee_position_id, ar.is_admin
  ORDER BY ae.last_name
</cfquery>
<cfset employees = ArrayNew(1)>
<cfset employees_used = StructNew()>
<cfloop query="get_all_employees">
    <cfif !StructKeyExists(employees_used, employee_id)>
        <cfset StructInsert(employees_used, employee_id, 1)>
        <cfset ArrayAppend(employees, { 'id': employee_id, 'name': full_name , 'first_name': first_name, 'last_name': last_name, 'access_role': access_role, 'crew_leader_id': crew_leader_id, 'branch': branch })>
    </cfif>
</cfloop>

<cfquery name="get_branches" datasource="#CONFIG_DATABASENAME#">
  SELECT * FROM branches
  WHERE branch_active=1
  AND branch_visible_to_select=1
  ORDER BY branch_name
</cfquery>

<cfquery name="get_all_branch_jobs" datasource="#CONFIG_DATABASENAME#">
    SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id, branch FROM APP_jobs
    ORDER by [Wk Location Name] ASC
</cfquery>

<cfquery name="get_all_service_codes" datasource="#CONFIG_DATABASENAME#">
    SELECT asca.Service_Group_ID, asca.Service_Group_name, ase.Service_ID, ase.Service_Name FROM app_services_catg asca
    INNER JOIN app_services ase ON ase.Service_Group_ID=asca.Service_Group_ID
    ORDER BY asca.Service_Group_ID, ase.Service_ID
</cfquery>

<cfquery name="get_all_materials" datasource="#CONFIG_DATABASENAME#">
    SELECT * FROM app_materials_list
    ORDER BY sortid
</cfquery>

<!--- UI LOGIC HERE --->
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Daily Sheet</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<!-- AngularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
<!-- Firebase -->
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase.js"></script>
<!-- AngularFire -->
<script src="https://cdn.firebase.com/libs/angularfire/2.0.1/angularfire.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<link id="ui-css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.css" rel="stylesheet">
<!-- Bootstrap -->
<link id="bsdp-css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="/SSL/admin/assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<link href="/SSL/admin/assets/admin/layout3/css/dsicons.css" rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/SSL/admin/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="/SSL/admin/assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="/favicon.ico"/>
<style>
    #div_main {
        display: none;
    }
    #table_employees {
    }
    .div_job {
        background-color: #999999;
        color: #FFFFFF;
        border: 1px solid black;
        font-weight: bold;
    }
    .table {
    	margin-left: 5px;
    }
    label {
        font-weight: bold;
    }
    .class-error {
        color: #d9534f;
    }
    .class-selecttype {
        width: 90px;
    }
</style>
<link href="/SSL/admin/css/styles_ds.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfoutput>
<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="57"><img src="/SSL/admin/images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></td>
      <td class="subbartxt">Welcome: #SESSION.screenname#</td>
      <td ><!--<a href="supervisors/setting.cfm" class="first"><img src="/SSL/admin/images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
     <td class="subbartxt" width="200" align="right">  <a href="#APPLICATION.homedirectory##APPLICATION.homepage#">Home</a><img src="/SSL/admin/images/clear.gif" width="20" height="2" alt="" /></td>
    </tr>
  </table>
</div>
</cfoutput>
<br />
<br />
<br />
<div ng-app="sampleApp" ng-controller="SampleCtrl" class="page-container-fluid">
  <form id="form_saveds" method="post">
    <input type="hidden" id="ds_id" name="ds_id" value="0">
    <input type="hidden" id="ds_post_data" name="ds_post_data" value="">
  </form>

  <div style="display: none">
    <button id="btn_initialize" ng-click="initialize()" style="display: none">Initialize</button>
    <button id="btn_signIn" ng-click="signIn()" style="display: none">Sign In</button>
    <button id="btn_save" ng-click="save()">Force Save</button>
  </div>
  <!--p ng-if="firebaseUser">Signed in user: <strong>{{ firebaseUser.uid }}</strong></p-->

  <div id="div_loading">
    <br />
    <br />
    <center><img src="/SSL/admin/ajax-loader.gif">&nbsp;<span id="span_loading">Loading... please wait.</span></center>
    <br />
    <br />
    <br />
    <br />
  </div>
  <!-- BEGIN PAGE CONTENT -->

  <div id="div_main" class="page-content">
    <div class="container-fluid">

      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-5">
          <table class="table large">
            <tr>
              <td nowrap="nowrap">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_date">Date:</label>
                        <input id="ds_date" name="ds_date" ng-model="ds_data.ds_date" class="form-control" style="width: 100px" datepicker>
                        <span ng-if="!isDateValid()" class="class-error">Must be within current pay period</span>
                    </div>
                </div>
              </td>
              <td width="50" nowrap="nowrap">&nbsp;</td>
              <td nowrap="nowrap">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_branch">Branch:</label>
                        <select id="ds_branch" name="ds_branch" ng-model="ds_data.ds_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                    </div>
                </div>
              </td>
              <td  nowrap="nowrap">
                <div class="form-inline">
                    <div class="form-group">
                        <a class="btn btn-success btn-lg" ng-click="createDailySheet()">Create Daily Sheet</a>
                        &nbsp;&nbsp;&nbsp;<a class="btn btn-danger btn-lg" ng-click="resetEverything()">Start Over</a>
                    </div>
                </div>
            </tr>
            <tr ng-if="ds_data.ds_branch == 'Corporate'">
                <td colspan="4"><i>Corporate branch isn't supported yet.  Choose a different branch.</i></td>
            </tr>
            <tr ng-if="ds_data.ds_branch != 'Corporate'">
              <td nowrap="nowrap">
                <div class="form-inline">
                      <div class="form-group">
                          <label for="ds_supervisor_id">Production Manager:</label>
                          <select id="ds_supervisor_id" name="ds_supervisor_id" ng-model="ds_data.supervisor_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.ds_branch][1]" class="form-control" ng-change="save()"></select>
                      </div>
                  </div>
              </td>
              <td width="50" nowrap="nowrap">&nbsp;</td>
              <td nowrap="nowrap">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_crew_leader_id">Supervisor/Crew Leader:</label>
                        <select id="ds_crew_leader_id" name="ds_crew_leader_id" ng-model="ds_data.crew_leader_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.ds_branch][0]" class="form-control" ng-change="addCrewLeader();"></select>
                    </div>
                </div>
              </td>
              <td nowrap="nowrap"></td>
              <td nowrap="nowrap"></td>
              <td  nowrap="nowrap"></td>
            </tr>
          </table>
        </div>
        <div class="col-md-4"> </div>
        <div class="col-md-5"> </div>
      </div>
 <div ng-if="ds_data.crew_leader_id > 0">
      <div class="row">
        <div class="col-md-12">
          <h4 class="panel-title">
          <H4> Employee Time </h4>
          <br>
          <table class="table largefull">
            <thead>
              <tr>
                <th><div align="center">Edit</div></th>
                <th >Employee Name </th>
                <th><div align="center">#</div></th>
                <th><div align="center">Start</div></th>
                <th><div align="center">End</div></th>
                <th><div align="center">Start</div></th>
                <th><div align="center">End</div></th>
                <th><div align="center">Total (H:M)</div></th>
                <th><div align="center">Job Total (H:M)</div></th>
              </tr>
            </thead>
            <tbody>
                <tr ng-repeat="ds_employee in ds_employees">
                    <td width="25" align="center">
                      <a ng-click="editEmployeeStartEndTimes(ds_employee)"><i class="fa-orange fa-pencil-square"></i></a>
                    </td>
                    <td>
                        {{ employees[ds_employee.id].full_name }} [{{ employees[ds_employee.id].branch }}]&nbsp;
                        <a ng-click="removeEmployee(ds_employee)"><i class="fa-red fa-minus-square"></i></a>
                        <span ng-if="ds_employee.id == ds_data.crew_leader_id">&nbsp;</span>
                    </td>
                    <td align="center">{{ employees[ds_employee.id].startendtimes.length }}</td>
                    <td align="center">{{ ds_employee.startendtimes[0].starttime_display }}</td>
                    <td align="center">{{ ds_employee.startendtimes[0].endtime_display }}</td>
                    <td align="center">{{ ds_employee.startendtimes[1].starttime_display }}</td>
                    <td align="center">{{ ds_employee.startendtimes[1].endtime_display }}</td>
                    <td align="center">{{ ds_employee.totalTime }}</td>
                    <td align="center">
                        <span class="class-error" ng-if="getTotalTimeFromString(ds_employee.jobTime) != getTotalTimeFromString(ds_employee.totalTime)">{{ ds_employee.jobTime }}</span>
                        <span ng-if="getTotalTimeFromString(ds_employee.jobTime) == getTotalTimeFromString(ds_employee.totalTime)">{{ ds_employee.jobTime }}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="form-inline">
                            <div class="form-group">
                                <select id="add_branch" name="add_branch" ng-model="ds_data.add_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                                <select id="add_employee_id" name="add_employee_id" ng-model="ds_data.add_employee_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.add_branch][0]" class="form-control" ng-change="save()"></select>
                                <a class="btn btn-success btn-xs" ng-click="addEmployee(ds_data.add_employee_id)">Add Employee</a>
                            </div>
                        </div>
                    </td>
                    <td colspan="6"></td>
                </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div ng-if="ds_jobs.length > 0" class="col-md-12">
          <H4> Job Services and Materials </h4>
          <div class="panel-body">
              <div ng-repeat="ds_job in ds_jobs">
                  <div class="alert alert-info text-coname">{{ jobs[ds_job.id].name }} - {{ ds_job.id }}&nbsp;<a ng-click="removeJob(ds_job)"><i class="fa-red fa-minus-square"></i></a></div>
                  <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                          <th><div align="center"><a ng-click="editJobTimes(ds_job)"><i class="fa-orange fa-pencil-square"></i></a></div></th>
                          <th colspan="16">
                            <span class="text-cotime">Start&nbsp; {{ ds_job.starttime_display }}</span>
                            <span ng-if="ds_job.starttime_lunch" class="text-cotime">&nbsp; &nbsp;  Lunch Start: {{ ds_job.starttime_lunch_display }}</span>
                            <span ng-if="ds_job.endtime_lunch" class="text-cotime">&nbsp; &nbsp;Lunch Stop: {{ ds_job.endtime_lunch_display }}</span>
                            <span class="text-cotime">&nbsp; &nbsp; End&nbsp; {{ ds_job.endtime_display }}</span>
                            &nbsp;
                            <span class="text-cotime">&nbsp; &nbsp; Total Hours {{ ds_job.totalTimeDisplay }}</span>
                            &nbsp;
                            <span class="class-error" ng-if="ds_job.totalTimeCrew % getTotalTimeFromString(ds_job.totalTime) != 0" class="text-cotime">Total Crew Hours {{ ds_job.totalTimeCrewDisplay }}</span>
                            <span ng-if="ds_job.totalTimeCrew % getTotalTimeFromString(ds_job.totalTime) == 0" class="text-cotime">Total Crew Hours {{ ds_job.totalTimeCrewDisplay }}</span>
                          </th>
                        </tr>
                        <tr>
                          <th colspan="17">
                            <div class="form-inline">
                                <div class="form-group">
                                    <select id="add_job_employee_employee_id" name="add_job_employee_employee_id" ng-model="ds_data.add_job_employee_employee_id" ng-options="employee[0] as employee[1] for employee in employees_cached" class="form-control" ng-change="save()"></select>
                                    <a class="btn btn-success btn-xs" ng-click="addEmployeeToJob(ds_data.add_job_employee_employee_id, ds_job.id)">Add Employee to this Job</a>
                                    <a class="btn btn-primary btn-xs" ng-click="addAllEmployeesToJob(ds_job.id)">Add All Current Employees to this Job</a>
                                </div>
                            </div>
                          </th>
                        </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td><span class="tableheadersm">Employee</span></td>
                        <td><div align="center"><span class="tableheadersm">1000<br />
                            Seasonal</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1100<br />
                            Turf</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1200<br />
                            Tree/Shrub </span></div></td>
                        <td><div align="center"><span class="tableheadersm">1300<br />
                            Mulch</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1400<br />
                            Color</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1500<br />
                            Misc</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1600<br />
                            Day</span></div></td>
                        <td><div align="center"><span class="tableheadersm">1700<br />
                            Off</span></div></td>
                        <td><div align="center"><span class="tableheadersm">2000<br />
                            Enh</span></div></td>
                        <td><div align="center"><span class="tableheadersm">3000<br />
                            Irr</span></div></td>
                        <td><div align="center"><span class="tableheadersm">7000<br />
                            Snow</span></div></td>
                      </tr>
                        <tr ng-repeat="ds_employee in ds_job.ds_employees">
                          <td width="25" align="center"  nowrap="nowrap"><a ng-click="editEmployeeServiceCodes(ds_employee, ds_job)"><i class="fa-orange fa-pencil-square"></i></a></td>
                          <td  nowrap="nowrap">
                            {{ employees[ds_employee.id].full_name }}
                            <a ng-click="removeEmployeeFromJob(ds_employee, ds_job)"><i class="fa-red fa-minus-square"></i></a>
                          </td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1000] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1100] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1200] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1300] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1400] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1500] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1600] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[1700] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[2000] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[3000] }}
                            </div></td>
                          <td><div align="center">
                            {{ ds_employee.servicecodeparentsdisplay[7000] }}
                            </div></td>
                        </tr>

                        <tr ng-if="!ds_job.ds_materials">
                            <td></td>
                            <td colspan="15">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <input type="checkbox" value="1" class="checkbox-nomaterialsused" ng-model="ds_job.nomaterials" ng-change="saveNoMaterialsToJob(ds_job, ds_job.nomaterials)">
                                        Check this box if no materials were used
                                        <span ng-if="!ds_job.nomaterials" class="span-nomaterialsused-error class-error" style="display: none">Please check off this box or add materials</span>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr ng-if="ds_job.ds_materials">
                          <td></td>
                          <td nowrap="nowrap"><span class="tableheadersm">Materials Used</span></td>
                          <td align="center" nowrap="nowrap" ><span class="tableheadersm">Quantity</span></td>
                          <td colspan="13" align="center" nowrap="nowrap" >&nbsp;</td>
                        </tr>

                        <tr ng-repeat="ds_material in ds_job.ds_materials">
                          <td></td>
                          <td nowrap="nowrap" >{{ ds_material.id }}</td>
                          <td align="center" nowrap="nowrap">{{ ds_material.quantity }}</td>
                          <td colspan="13"   align="center" nowrap="nowrap"  >&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan="16">
                              <div align="left">
                                <a ng-click="editMaterials(ds_job)"><i class="fa-green fa-plus-square"></i><span class="text-dsadd">Add/Edit/Remove Materials</span></a>
                              </div>
                          </td>
                        </tr>
                    </tbody>
                  </table>
              </div>
          </div>
        </div>
      </div>

      <h4>Add a Job to this Daily Sheet:</h4>
      <h4>
          <div class="form-inline">
              <div class="form-group">
                  <select id="add_job_branch" name="add_job_branch" ng-model="ds_data.add_job_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                  <select id="add_job_job_id" name="add_job_job_id" ng-model="ds_data.add_job_job_id" ng-options="job[0] as job[1] for job in jobs_select[ds_data.add_job_branch]" class="form-control" ng-change="save()"></select>
                  <a class="btn btn-success btn-xs" ng-click="addJob(ds_data.add_job_job_id)">Add Job</a>
              </div>
          </div>
      </h4>
      <br />

        <H4 ng-if="ds_jobs.length > 0"> Job Service Detail Information (read-only)</h4>
        <div ng-if="ds_jobs.length > 0" class="panel-body">
          <div ng-repeat="ds_job in ds_jobs">
              <div class="alert alert-info text-coname">{{ jobs[ds_job.id].name }} - {{ ds_job.id }}</div>
              <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                        <th colspan="16">
                          <span class="text-cotime">Start&nbsp; {{ ds_job.starttime_display }}</span>
                          <span ng-if="ds_job.starttime_lunch" class="text-cotime">&nbsp; &nbsp;  Lunch Start: {{ ds_job.starttime_lunch_display }}</span>
                          <span ng-if="ds_job.endtime_lunch" class="text-cotime">&nbsp; &nbsp;Lunch Stop: {{ ds_job.endtime_lunch_display }}</span>
                          <span class="text-cotime">&nbsp; &nbsp; End&nbsp; {{ ds_job.endtime_display }}</span>
                          &nbsp;
                          <span class="text-cotime"><span class="text-cotime">&nbsp; &nbsp;&nbsp; &nbsp;Total Crew Hours {{ ds_job.totalTimeCrewDisplay }}</span>
                        </th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr ng-repeat="ds_employee in ds_job.ds_employees">
                      <td width="300">
                        {{ employees[ds_employee.id].full_name }}
                      </td>
                      <td width="100">
                        <span ng-repeat="(index, servicecode) in ds_employee.servicecodes">
                            <span ng-if="index > 0">,&nbsp;</span>
                            {{ servicecode.time }}
                        </span>
                      </td>
                      <td width="200">
                        <span ng-repeat="(index, servicecode) in ds_employee.servicecodes">
                            <span ng-if="index > 0">,&nbsp;</span>
                            {{ servicecode.id }}
                        </span>
                      </td>
                    </tr>
                  </tbody>
              </table>
          </div>
      <!-- END PAGE CONTENT INNER -->
    </div>
  </div>
  </div>
  <!-- END PAGE CONTENT -->
</div>

<!--jQuery popup loader-->
<div id="div_popupStartEndTimes" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <table cellspacing="0" align="center" style="width: 50%; min-width: 750px; border: 1px solid black">
                <tr>
                    <td align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Start/End Times: {{ ds_data.editing_employee.name }}</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <center><a class="btn btn-success btn-xs" ng-click="addStartEndTime()">Add New Start/End Time</a></center>
                        <br />
                    </td>
                </tr>
                <tr ng-repeat="(index, startendtime) in ds_temp.editing_startendtimes">
                    <td align="center" style="padding-bottom: 20px">
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">Start Time:</label>
                                <select class="class-selecttype" ng-model="startendtime.starttime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" ng-change="changeStartEndTime(index)"></select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="endtime">End Time:</label>
                                <select class="class-selecttype" ng-model="startendtime.endtime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" ng-change="changeStartEndTime(index)"></select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="endtime">Total Time:</label>
                                <span ng-if="startendtime.totalTimeDisplay && isEmployeeStartTimeValid(startendtime.totalTime)">{{ startendtime.totalTimeDisplay }}</span>
                                <span ng-if="!startendtime.totalTimeDisplay">00:00</span>
                                <span class="class-error" ng-if="!isEmployeeStartTimeValid(startendtime.totalTime)">{{ startendtime.totalTimeDisplay }}</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-danger btn-xs" ng-click="removeStartEndTime(index)">Remove</a>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">Or Type:</label>
                                <input class="class-selecttype" ng-model="startendtime.starttime_typed" ng-change="updateTempEmployeeStartTimes()">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="endtime">Or Type:</label>
                                <input class="class-selecttype" ng-model="startendtime.endtime_typed" ng-change="updateTempEmployeeStartTimes()">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <a class="btn btn-info btn-md" ng-click="saveStartEndTimes()">Save to This employee only</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-primary btn-md" ng-click="saveStartEndTimesToAllEmployees()">Save to ALL employees</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-warning btn-md" ng-click="cancelStartEndTimes()">Cancel</a>
                        </center>
                        <br />
                    </td>
                </tr>
            </table>
        </center>
    </div>
</div>

<datalist id="datalist_servicecodes">
    <cfoutput query="get_all_service_codes">
        <option value="#Service_Name#">
    </cfoutput>
</datalist>
<div id="div_popupServiceCodes" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <table cellspacing="0" align="center" style="width: 50%; min-width: 750px; border: 1px solid black">
                <tr>
                    <td align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Service Codes: {{ ds_data.editing_employee.name }}</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <center><a class="btn btn-success btn-xs" ng-click="addServiceCode()">Add New Service Code</a></center>
                        <br />
                    </td>
                </tr>
                <tr ng-repeat="(index, servicecode) in ds_temp.editing_servicecodes">
                    <td align="center" style="padding-bottom: 20px">
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="servicecode">Enter Service Code:</label>
                                <select ng-model="servicecode.id" class="form-control" style="width: 150px">
                                    <cfoutput query="get_all_service_codes">
                                        <option value="#Service_Name#">#Service_Name#</option>
                                    </cfoutput>
                                </select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="servicecodetime">Time:</label>
                                <input ng-model="servicecode.time" class="form-control" style="width: 60px">&nbsp;minutes
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-danger btn-xs" ng-click="removeServiceCode(index)">Remove</a>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="servicecode">Or Type:</label>
                                <input ng-model="servicecode.id_typed" class="form-control" style="width: 150px" ng-change="changeServiceCode(index)">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            Total Job Time:&nbsp;{{ getTempJobTime() }}
                            <span class="class-error" ng-if="getTempJobTime() != getTempServiceTime()">&nbsp;&nbsp;&nbsp;&nbsp;Total Service Time:&nbsp;{{ getTempServiceTime() }}</span>
                            <span ng-if="getTempJobTime() == getTempServiceTime()">&nbsp;&nbsp;&nbsp;&nbsp;Total Service Time:&nbsp;{{ getTempServiceTime() }}</span>
                        </center>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <a class="btn btn-info btn-md" ng-click="saveServiceCodes()">Save to This employee only</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-primary btn-md" ng-click="saveServiceCodesToAllEmployees()">Save to ALL employees</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-warning btn-md" ng-click="cancelServiceCodes()">Cancel</a>
                        </center>
                        <br />
                    </td>
                </tr>
            </table>
        </center>
    </div>
</div>

<div id="div_popupJobTimes" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <table cellspacing="0" align="center" style="width: 50%; min-width: 750px; border: 1px solid black">
                <tr>
                    <td align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Job Times: {{ ds_temp.editing_job_name }}</td>
                </tr>
                <tr>
                    <td align="center" style="padding-bottom: 20px">
                        <br />
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">Start Time:</label>
                                <select ng-model="ds_temp.editing_starttime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control" ng-change="changeJobTimes()"></select>
                            </div>
                        </div>
                        <br />
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">Lunch Start:</label>
                                <select ng-model="ds_temp.editing_starttime_lunch" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control" ng-change="changeJobTimes()"></select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="starttime">Lunch End:</label>
                                <select ng-model="ds_temp.editing_endtime_lunch" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control" ng-change="changeJobTimes()"></select>
                            </div>
                        </div>
                        <br />
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">End Time:</label>
                                <select ng-model="ds_temp.editing_endtime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control" ng-change="changeJobTimes()"></select>
                            </div>
                        </div>
                        <br />
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="starttime">Total Time:</label>
                                <span ng-if="isJobStartTimeValid(ds_temp.editing_totalTime)">{{ ds_temp.editing_totalTimeDisplay }}</span>
                                <span class="class-error" ng-if="!isJobStartTimeValid(ds_temp.editing_totalTime)">{{ ds_temp.editing_totalTimeDisplay }}</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <a class="btn btn-info btn-md" ng-click="saveJobTimes()">Save</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-warning btn-md" ng-click="cancelJobTimes()">Cancel</a>
                        </center>
                        <br />
                    </td>
                </tr>
            </table>
        </center>
    </div>
</div>

<datalist id="datalist_materials">
    <cfoutput query="get_all_materials">
        <option value="#Item_ID#">
    </cfoutput>
</datalist>
<div id="div_popupMaterials" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <table cellspacing="0" align="center" style="width: 50%; min-width: 750px; border: 1px solid black">
                <tr>
                    <td align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Materials: {{ ds_data.editing_job_name.name }}</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <center><a class="btn btn-success btn-xs" ng-click="addJobMaterial()">Add New Material</a></center>
                        <br />
                    </td>
                </tr>
                <tr ng-repeat="(index, material) in ds_temp.editing_materials">
                    <td align="center" style="padding-bottom: 20px">
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="material">Enter Material:</label>
                                <input ng-model="material.id" list="datalist_materials" class="form-control" style="width: 150px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="materialtime">Quantity:</label>
                                <input ng-model="material.quantity" class="form-control" style="width: 60px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-danger btn-xs" ng-click="removeJobMaterial(index)">Remove</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <a class="btn btn-info btn-md" ng-click="saveMaterials()">Save</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-warning btn-md" ng-click="cancelMaterials()">Cancel</a>
                        </center>
                        <br />
                    </td>
                </tr>
            </table>
        </center>
    </div>
</div>
<!--end popup loader-->
<!-- END PAGE CONTAINER -->

<!-- BEGIN FOOTER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
	<div class="container" align="center">
		 2016 &copy; James River Grounds Management
	</div>
</div>
<div class="scroll-to-top">
	<i class="icon-arrow-up"></i>
</div>
<!-- END FOOTER -->
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="/SSL/admin/assets/global/plugins/respond.min.js"></script>
<script src="/SSL/admin/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="/SSL/admin/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="/SSL/admin/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/SSL/admin/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/pages/scripts/table-advanced.js"></script>
<script type='text/javascript'>
    var app = angular.module("sampleApp", ["firebase"]);
    var initialized = false;
    var admin_email = 'bchan@jrgm.com';
    var admin_password = 'firebase1!';
    var db_root = '<cfoutput>#Replace(CGI.REMOTE_ADDR, '.', '', 'ALL')#</cfoutput>/<cfoutput>#SESSION.userid#</cfoutput>/add';
    var date_now = '<cfoutput>#dateFormat(now(), 'mm/dd/yyyy')#</cfoutput>';
    var date_now_raw = '<cfoutput>#dateFormat(now(), 'yyyy-mm-dd')#</cfoutput>';
    var date_block_raw = '<cfoutput>#dateFormat(APPLICATION.blockdate, 'yyyy-mm-dd')#</cfoutput>';
    var admin_branch = '<cfoutput>#SESSION.branch#</cfoutput>';
    var last_crew_leader_id;

    var employees = {};
    var employees_select = {};
    <cfoutput>
    <cfloop from="1" to="#arrayLen(employees)#" index="i">
        <cfset employee = employees[i]>
        var employee = { full_name: '#employee.id# - #Replace(employee.name, "'", "\\'", "ALL")#', first_name: '#Replace(employee.first_name, "'", "\\'", "ALL")#', last_name: '#Replace(employee.last_name, "'", "\\'", "ALL")#', employee_id: '#employee.id#', branch: '#employee.branch#', 'access_role': '#employee.access_role#', 'crew_leader_id': '#employee.crew_leader_id#' };
        employees[#employee.id#] = employee;
        if (!employees_select[employee.branch])
            employees_select[employee.branch] = {};
        if (!employees_select[employee.branch][employee.access_role])
            employees_select[employee.branch][employee.access_role] = [];
        employees_select[employee.branch][employee.access_role].push([employee.employee_id, employee.full_name]);
    </cfloop>
    </cfoutput>

    var branches = {};
    var branches_select = [];
    var jobs = {};
    var jobs_select = [];
    <cfoutput query="get_branches">
        branches['#branch_name#'] = { branch_abbr: '#branch_abbr#'};
        branches_select.push(['#branch_name#', '#branch_name#']);</cfoutput>

    <cfoutput query="get_all_branch_jobs">
        var job = { name: '#Replace(work_loc_name, "'", "\'", "ALL")#', id: '#job_id#', branch: '#branch#' };
        jobs[job.id] = job;
        if (!jobs_select[job.branch])
            jobs_select[job.branch] = [];
        jobs_select[job.branch].push([job.id, job.name]);</cfoutput>

    var servicecodes_select = [];
    <cfoutput query="get_all_service_codes">
        var servicecode = { name: '#Replace(Service_Name, "'", "\'", "ALL")#', id: '#Service_ID#' };
        servicecodes_select.push([servicecode.id, servicecode.name]);</cfoutput>

    var materials_select = [];
        <cfoutput query="get_all_materials">
            var material = { name: '#Replace(Item_ID, "'", "\'", "ALL")#', id: '#Replace(Item_ID, "'", "\'", "ALL")#' };
            materials_select.push([material.id, material.name]);</cfoutput>

    app.factory("DBModel", [function() {
        return function(node) {
            var ref;
            if (node)
                ref = firebase.database().ref(node);
            else
                ref = firebase.database().ref();
            return ref;
        }}
    ]);

    app.controller("SampleCtrl", ["$scope", "$firebaseArray", "$firebaseAuth", "$firebaseObject", "DBModel",
        function($scope, $firebaseArray, $firebaseAuth, $firebaseObject, DBModel) {
            $scope.initialize = function() {
                $scope.auth = $firebaseAuth();

                $scope.auth.$onAuthStateChanged(function(firebaseUser) {
                    console.log('auth changed!');
                    if ((!firebaseUser || firebaseUser.email != admin_email))
                    {
                        $scope.auth.$signOut();
                        $scope.signIn();
                        return;
                    }

                    if (!initialized && firebaseUser) {
                        console.log(firebaseUser.email);
                        // User is signed in.
                        initialized = true;

                        $scope.firebaseUser = firebaseUser;
                        $scope.ds_data = $firebaseObject(DBModel(db_root+'/ds_data'));
                        $scope.ds_employees = $firebaseArray(DBModel(db_root+'/ds_employees'));
                        $scope.ds_jobs = $firebaseArray(DBModel(db_root+'/ds_jobs'));
                        $scope.branches_select = branches_select;
                        $scope.employees_select = employees_select;
                        $scope.employees = employees;
                        $scope.jobs_select = jobs_select;
                        $scope.jobs = jobs;
                        $scope.servicecodes_select = servicecodes_select;
                        $scope.materials_select = materials_select;
                        $scope.date_latest_raw = date_now_raw;
                        $scope.date_earliest_raw = date_block_raw;

                        $scope.ds_data.$loaded(function(data){
                            $scope.ds_employees.$loaded(function(data){
                                $scope.reInitialize();
                                initialize();
                            });
                        });

                        $scope.addEmployee = function(employee_id){
                            if (!employee_id) return;

                            var query = DBModel(db_root+'/ds_employees').orderByChild("id").equalTo(employee_id).limitToFirst(1);
                            var result = $firebaseArray(query);
                            result.$loaded(function(data){
                                if (data.length != 0) return;

                                $scope.ds_employees.$add({ 'id': employee_id }).then(function(){
                                    $scope.save();
                                });
                                console.log('added '+employee_id);
                            });
                        };

                        $scope.removeEmployee = function(employee){
                            if (!confirm('Remove '+employees[employee.id].full_name+' from this Daily Sheet?')) return;

                            $scope.ds_employees.$remove(employee).then(function() {
                                console.log('removed employee');
                                console.log(employee);

                                //need to remove from all jobs too
                                if ($scope.ds_jobs)
                                {
                                    for(var i=0; i<$scope.ds_jobs.length; i++)
                                    {
                                        if ($scope.ds_jobs[i].ds_employees)
                                        {
                                            for(var ii=0; ii<$scope.ds_jobs[i].ds_employees.length; ii++)
                                            {
                                                if ($scope.ds_jobs[i].ds_employees[ii].id == employee.id)
                                                {
                                                    $scope.ds_jobs[i].ds_employees.splice(ii, 1);
                                                    $scope.ds_jobs.$save(i);
                                                }
                                            }
                                        }
                                    }
                                }

                                $scope.save();
                            });
                        };

                        $scope.addCrewLeader = function(){
                            if ($scope.ds_employees.length > 0)
                            {
                                if (!confirm('Changing the crew leader now will remove all existing employees from this daily sheet.  Are you sure?'))
                                {
                                    $scope.ds_data.crew_leader_id = last_crew_leader_id;
                                    return;
                                }
                            }

                            last_crew_leader_id = $scope.ds_data.crew_leader_id;

                            DBModel(db_root+'/ds_employees').remove().then(function(){
                                $scope.save();

                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                    $scope.ds_jobs[i].ds_employees = [];
                                    $scope.ds_jobs.$save(i);
                                }
                            });
                        };

                        $scope.editEmployeeStartEndTimes = function(employee){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_employee = employee;
                            $scope.ds_temp.editing_employee_name = employee.name;
                            $scope.ds_temp.editing_startendtimes = employee.startendtimes;
                            $scope.ds_temp.editing_startendtimes_options = buildStartEndTimesOptions();

                            showPopup('div_popupStartEndTimes');
                        };

                        $scope.addStartEndTime = function(){
                            if (!$scope.ds_temp.editing_startendtimes)
                                $scope.ds_temp.editing_startendtimes = [];
                            var starttime = '8:50';
                            if ($scope.ds_temp.editing_startendtimes[$scope.ds_temp.editing_startendtimes.length-1])
                                starttime = addMinutesToTime($scope.ds_temp.editing_startendtimes[$scope.ds_temp.editing_startendtimes.length-1].endtime, 30);
                            var endtime = starttime;
                            var totalTime = 0;
                            $scope.ds_temp.editing_startendtimes.push({ 'starttime': starttime, 'endtime': endtime, 'totalTime': totalTime });
                            console.log($scope.ds_temp.editing_startendtimes);
                        };

                        $scope.changeStartEndTime = function(index){
                            $scope.ds_temp.editing_startendtimes[index].totalTime = getTotalTime($scope.ds_temp.editing_startendtimes[index].starttime, $scope.ds_temp.editing_startendtimes[index].endtime);
                            $scope.ds_temp.editing_startendtimes[index].totalTimeDisplay = getTotalTimeDisplay($scope.ds_temp.editing_startendtimes[index].totalTime);
                        }

                        $scope.removeStartEndTime = function(key){
                            $scope.ds_temp.editing_startendtimes.splice(key, 1);
                        }

                        $scope.saveStartEndTimes = function(){
                            if (!$scope.saveStartEndTime()) return;

                            hidePopup('div_popupStartEndTimes');
                        };

                        $scope.saveStartEndTime = function(){
                            var employee = $scope.ds_temp.editing_employee;
                            employee.startendtimes = $scope.ds_temp.editing_startendtimes;
                            totalminutes = 0;
                            for(var i=0; i<employee.startendtimes.length; i++)
                            {
                                var startendtime = employee.startendtimes[i];
                                if (!$scope.isEmployeeStartTimeValid(startendtime.totalTime))
                                {
                                    alert('At least one start/time pair has an invalid Total Time.');
                                    return false;
                                }

                                employee.startendtimes[i].starttime_display = getTimeDisplay(employee.startendtimes[i].starttime);
                                employee.startendtimes[i].endtime_display = getTimeDisplay(employee.startendtimes[i].endtime);
                                var totalTime = getTotalTime(employee.startendtimes[i].starttime, employee.startendtimes[i].endtime);
                                totalminutes += totalTime;
                            }
                            employee.totalTime = getTotalTimeDisplay(totalminutes);
                            $scope.ds_employees.$save(employee);
                            return true;
                        };

                        $scope.saveStartEndTimesToAllEmployees = function(){
                            if (!confirm('Are you sure you want to overwrite ALL employee times?')) return;

                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                $scope.ds_temp.editing_employee = $scope.ds_employees[i];
                                if (!$scope.saveStartEndTime()) return;
                            }
                            hidePopup('div_popupStartEndTimes');
                        };

                        $scope.cancelStartEndTimes = function(){
                            hidePopup('div_popupStartEndTimes');
                        };
                        
                        $scope.addJob = function(job_id){
                             if (!job_id) return;
 
                             /*var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                             var result = $firebaseArray(query);
                             result.$loaded(function(data){
                                 if (data.length != 0) return;
 
                                 $scope.ds_jobs.$add({ 'id': job_id });
                             });*/

                             $scope.ds_jobs.$add({ 'id': job_id });
                        };
                        
                        $scope.removeJob = function(job){
                            if (!confirm('Remove '+jobs[job.id].name+' from this Daily Sheet?')) return;

                            $scope.ds_jobs.$remove(job).then(function() {
                                console.log('removed job');
                                console.log(job);
                                $scope.save();
                            });
                        };

                        $scope.editJobTimes = function(job){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_job = job;
                            $scope.ds_temp.editing_job_name = jobs[job.id].name;
                            $scope.ds_temp.editing_starttime = job.starttime;
                            $scope.ds_temp.editing_endtime = job.endtime;
                            $scope.ds_temp.editing_starttime_lunch = job.starttime_lunch;
                            $scope.ds_temp.editing_endtime_lunch = job.endtime_lunch;
                            $scope.ds_temp.editing_startendtimes_options = buildStartEndTimesOptions();
                            $scope.changeJobTimes();

                            showPopup('div_popupJobTimes');
                        }
                        
                        $scope.changeJobTimes = function(){
                            var totalminutes = getTotalTime($scope.ds_temp.editing_starttime, $scope.ds_temp.editing_endtime);
                            if ($scope.ds_temp.editing_starttime_lunch && $scope.ds_temp.editing_endtime_lunch)
                            {
                                var totallunchminutes = getTotalTime($scope.ds_temp.editing_starttime_lunch, $scope.ds_temp.editing_endtime_lunch);
                                totalminutes -= totallunchminutes;
                            }
                            $scope.ds_temp.editing_totalTime = totalminutes;
                            $scope.ds_temp.editing_totalTimeDisplay = getTotalTimeDisplay(totalminutes)+' ('+totalminutes+' min)';
                        }
                        
                        $scope.saveJobTimes = function(){
                            if (!$scope.saveJobTimesToJob()) return;
                            hidePopup('div_popupJobTimes');
                        };

                        $scope.saveJobTimesToJob = function(){
                            if (!$scope.isJobStartTimeValid($scope.ds_temp.editing_totalTime))
                            {
                                alert('Please make sure all times are correct for this job.');
                                return false;
                            }

                            var job_id = $scope.ds_temp.editing_job.id;

                            var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                            var result = $firebaseArray(query);
                            result.$loaded(function(result){
                                var job = result[0];

                                var key = -1;
                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                   if ($scope.ds_jobs[i].id == job_id)
                                       key = i;
                                }
                                if (key == -1) return;

                                job.starttime = $scope.ds_temp.editing_starttime;
                                job.endtime = $scope.ds_temp.editing_endtime;
                                job.starttime_lunch = $scope.ds_temp.editing_starttime_lunch?$scope.ds_temp.editing_starttime_lunch:'';
                                job.endtime_lunch = $scope.ds_temp.editing_endtime_lunch?$scope.ds_temp.editing_endtime_lunch:'';

                                job.starttime_display = getTimeDisplay(job.starttime);
                                job.endtime_display = getTimeDisplay(job.endtime);
                                job.starttime_lunch_display = getTimeDisplay(job.starttime_lunch);
                                job.endtime_lunch_display = getTimeDisplay(job.endtime_lunch);

                                $scope.ds_jobs[key] = job;
                                $scope.ds_jobs.$save(key);

                                $scope.refreshJobCalculations(job.id);
                            });

                            return true;
                        };

                        $scope.cancelJobTimes = function(){
                            hidePopup('div_popupJobTimes');
                        };

                        $scope.editMaterials = function(job){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_job = job;
                            $scope.ds_temp.editing_job_name = jobs[job.id].name;
                            $scope.ds_temp.editing_materials = job.ds_materials;

                            showPopup('div_popupMaterials');
                        };
                        
                        $scope.addJobMaterial = function(){
                            if (!$scope.ds_temp.editing_materials)
                                $scope.ds_temp.editing_materials = [];
                            $scope.ds_temp.editing_materials.push({ 'id': '', 'quantity': '' });
                            console.log($scope.ds_temp.editing_materials);
                        };

                        $scope.removeJobMaterial = function(key){
                            $scope.ds_temp.editing_materials.splice(key, 1);
                        };

                        $scope.saveMaterials = function(){
                            $scope.saveMaterialsToJob();
                            hidePopup('div_popupMaterials');
                        };
                        
                        $scope.saveMaterialsToJob = function(){
                            var job_id = $scope.ds_temp.editing_job.id;
                            console.log('job_id: '+job_id);

                            var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                            var result = $firebaseArray(query);
                            result.$loaded(function(result){
                                var job = result[0];

                                var key = -1;
                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                   if ($scope.ds_jobs[i].id == job_id)
                                       key = i;
                                }
                                if (key == -1) return;

                                job.ds_materials = $scope.ds_temp.editing_materials;

                                $scope.ds_jobs[key] = job;
                                $scope.ds_jobs.$save(key);
                            });
                        };

                        $scope.saveNoMaterialsToJob = function(job, nomaterials){
                            var job_id = job.id;

                            console.log('hi '+nomaterials);
                            var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                            var result = $firebaseArray(query);
                            result.$loaded(function(result){
                                var job = result[0];

                                var key = -1;
                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                   if ($scope.ds_jobs[i].id == job_id)
                                       key = i;
                                }
                                if (key == -1) return;

                                job.nomaterials = nomaterials;

                                $scope.ds_jobs[key] = job;
                                $scope.ds_jobs.$save(key);
                            });
                        };

                        $scope.cancelMaterials = function(){
                            hidePopup('div_popupMaterials');
                        };

                        $scope.addEmployeeToJob = function(employee_id, job_id){
                            if (!employee_id) return;
                            if (!job_id) return;

                            var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                            var result = $firebaseArray(query);
                            result.$loaded(function(result){
                                var data = result[0];
                                if (data.ds_employees)
                                {
                                    for(var i=0; i<data.ds_employees.length; i++)
                                    {
                                        if (data.ds_employees[i].id == employee_id) return;
                                    }
                                }

                                if (!data.ds_employees)
                                    data.ds_employees = [];
                                data.ds_employees.push({ id: employee_id });

                                var key = -1;
                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                    if ($scope.ds_jobs[i].id == job_id)
                                        key = i;
                                }
                                if (key == -1) return;

                                $scope.ds_jobs[key] = data;
                                $scope.ds_jobs.$save(key);
                            });
                        };

                        $scope.addAllEmployeesToJob = function(job_id){
                            if ($scope.ds_employees.length > 0)
                            {
                                var key = -1;
                                for(var i=0; i<$scope.ds_jobs.length; i++)
                                {
                                    if ($scope.ds_jobs[i].id == job_id)
                                        key = i;
                                }
                                if (key == -1) return;

                                var job = $scope.ds_jobs[key];
                                for(i=0; i<$scope.ds_employees.length; i++)
                                {
                                    var employee = $scope.ds_employees[i];
                                    $scope.addEmployeeToJob(employee.id, job.id);
                                }
                            }
                        };

                        $scope.removeEmployeeFromJob = function(employee, job){
                            if (!confirm('Remove '+employees[employee.id].full_name+' from '+jobs[job.id].name+'?')) return;

                            for(var i=0; i<job.ds_employees.length; i++)
                            {
                                if (job.ds_employees[i].id == employee.id)
                                    job.ds_employees.splice(i, 1);
                            }

                            var key = -1;
                            for(var i=0; i<$scope.ds_jobs.length; i++)
                            {
                                if ($scope.ds_jobs[i].id == job.id)
                                    key = i;
                            }
                            if (key == -1) return;

                            $scope.ds_jobs[key] = job;
                            $scope.refreshJobCalculations(job.id);
                            $scope.refreshEmployeeCalculations(employee.id);
                        };
                        
                        $scope.editEmployeeServiceCodes = function(employee, job){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_job = job;
                            $scope.ds_temp.editing_job_id = job.id;
                            $scope.ds_temp.editing_employee = employee;
                            $scope.ds_temp.editing_employee_name = employee.name;
                            $scope.ds_temp.editing_servicecodes = employee.servicecodes;
                            $scope.ds_temp.editing_servicecodes_options = buildServiceCodesOptions();

                            showPopup('div_popupServiceCodes');
                        }

                        $scope.addServiceCode = function(){
                            if (!$scope.ds_temp.editing_servicecodes)
                                $scope.ds_temp.editing_servicecodes = [];
                            $scope.ds_temp.editing_servicecodes.push({ 'id': '', 'time': '' });
                            console.log($scope.ds_temp.editing_servicecodes);
                        };

                        $scope.removeServiceCode = function(key){
                            $scope.ds_temp.editing_servicecodes.splice(key, 1);
                        }

                        $scope.changeServiceCode = function(index){
                            var dl = document.getElementById('datalist_servicecodes');
                            var bestmatch = null;
                            for(var i=0; i<dl.options.length; i++)
                            {
                                if (!bestmatch)
                                {
                                    var opt = dl.options[i].value;
                                    if (opt.substring(0, 1) == $scope.ds_temp.editing_servicecodes[index].id_typed.substring(0, 1) && opt.indexOf($scope.ds_temp.editing_servicecodes[index].id_typed) != -1)
                                        bestmatch = opt;
                                }
                            }
                            if (bestmatch)
                                $scope.ds_temp.editing_servicecodes[index].id = bestmatch;
                        }

                        $scope.saveServiceCodes = function(){
                            $scope.saveServiceCodesToEmployee();
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.saveServiceCodesToEmployee = function(){
                            var employee = $scope.ds_temp.editing_employee;
                            var job_id = $scope.ds_temp.editing_job_id;
                            employee.servicecodes = $scope.ds_temp.editing_servicecodes;
                            employee.servicecodeparents = {};
                            employee.servicecodeparentsdisplay = {};
                            totalminutes = 0;
                            for(var i=0; i<employee.servicecodes.length; i++)
                            {
                                //employee.servicecodes[i].display = employee.servicecodes[i].id+' ['+employee.servicecodes[i].time+' min]';
                                var servicecodeparent = Math.floor(getIdFromServiceCode(employee.servicecodes[i].id) / 100)*100;
                                var servicetime = employee.servicecodes[i].time*1;
                                if (!employee.servicecodeparents[servicecodeparent])
                                    employee.servicecodeparents[servicecodeparent] = 0;
                                employee.servicecodeparents[servicecodeparent] += servicetime;
                                totalminutes += servicetime;
                            }
                            if (employee.servicecodeparents)
                            {
                                for(var i in employee.servicecodeparents)
                                {
                                    employee.servicecodeparentsdisplay[i] = getTotalTimeDisplay(employee.servicecodeparents[i]);
                                }
                            }
                            employee.totalServiceTime = getTotalTimeDisplay(totalminutes);

                            var key = -1;
                            var job;
                            for(var i=0; i<$scope.ds_jobs.length; i++)
                            {
                                job = $scope.ds_jobs[i];
                                if ($scope.ds_jobs[i].id == job_id)
                                    key = i;
                            }
                            if (key == -1) return;
                            job = $scope.ds_jobs[key];

                            var ekey = -1;
                            for(i=0; i<job.ds_employees.length; i++)
                            {
                                if (job.ds_employees[i].id == employee.id)
                                    ekey = i;
                            }
                            if (ekey == -1) return;

                            $scope.ds_jobs[key].ds_employees[ekey] = employee;
                            $scope.ds_jobs.$save(key);

                            //keep things synced
                            $scope.refreshJobCalculations(job_id);
                            $scope.refreshEmployeeCalculations(employee.id);
                        };

                        $scope.saveServiceCodesToAllEmployees = function(){
                            if (!confirm('Are you sure you want to overwrite ALL employee service code times?')) return;

                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                $scope.ds_temp.editing_employee = $scope.ds_employees[i];
                                $scope.saveServiceCodesToEmployee();
                            }
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.cancelServiceCodes = function(){
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.reInitialize = function(){
                            //DEFAULT VALUES
                            if (!$scope.ds_data.ds_date)
                                $scope.ds_data.ds_date = date_now;
                            if (!$scope.ds_data.ds_branch)
                                $scope.ds_data.ds_branch = admin_branch;
                            $scope.ds_data.add_branch = $scope.ds_data.ds_branch;
                            $scope.ds_data.add_employee_id = 0;
                            $scope.ds_data.add_job_branch = $scope.ds_data.ds_branch;
                            $scope.ds_data.add_job_job_id = 0;
                            if (!$scope.ds_data.crew_leader_id)
                                $scope.ds_data.crew_leader_id = 0;
                            last_crew_leader_id = $scope.ds_data.crew_leader_id;

                            $scope.save();
                        };

                        $scope.refreshJobCalculations = function(job_id){
                            var key = -1;
                            var totalcrewminutes = 0;
                            for(var i=0; i<$scope.ds_jobs.length; i++)
                            {
                                if ($scope.ds_jobs[i].id == job_id)
                                {
                                    key = i;
                                    job = $scope.ds_jobs[i];
                                    if (job.ds_employees)
                                    {
                                        for(var ii=0; ii<job.ds_employees.length; ii++)
                                        {
                                            var emp = job.ds_employees[ii];
                                            if (emp.servicecodes)
                                            {
                                                for(var iii=0; iii<emp.servicecodes.length; iii++)
                                                {
                                                    var servicetime = emp.servicecodes[iii].time*1;
                                                    totalcrewminutes += servicetime;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (key == -1) return;

                            var totalminutes = getTotalTime($scope.ds_jobs[key].starttime, $scope.ds_jobs[key].endtime);
                            if ($scope.ds_jobs[key].starttime_lunch && $scope.ds_jobs[key].endtime_lunch)
                            {
                                var totallunchminutes = getTotalTime($scope.ds_jobs[key].starttime_lunch, $scope.ds_jobs[key].endtime_lunch);
                                console.log('total lunch minutes: '+totallunchminutes);
                                totalminutes -= totallunchminutes;
                            }
                            $scope.ds_jobs[key].totalTime = getTotalTimeDisplay(totalminutes);
                            $scope.ds_jobs[key].totalTimeDisplay = $scope.ds_jobs[key].totalTime+' ('+totalminutes+' min)';

                            $scope.ds_jobs[key].totalTimeCrew = totalcrewminutes;
                            var totalcrewminutes = 1*$scope.ds_jobs[key].totalTimeCrew;
                            $scope.ds_jobs[key].totalTimeCrewDisplay = getTotalTimeDisplay(totalcrewminutes)+' ('+totalcrewminutes+' min)';
                            $scope.ds_jobs.$save(key);
                        }
                        
                        $scope.refreshEmployeeCalculations = function(employee_id){
                            var key = -1;
                            var totalminutes = 0;                            
                            var employee;
                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                employee = $scope.ds_employees[i];
                                if ($scope.ds_employees[i].id == employee_id)
                                {
                                    key = i;
                                    for(var ii=0; ii<$scope.ds_jobs.length; ii++)
                                    {
                                        var job = $scope.ds_jobs[ii];
                                        if (job.ds_employees)
                                        {
                                            for(var iii=0; iii<job.ds_employees.length; iii++)
                                            {
                                                var emp = job.ds_employees[iii];
                                                if (emp.id == employee.id && emp.servicecodes)
                                                {
                                                    for(var iiii=0; iiii<emp.servicecodes.length; iiii++)
                                                    {
                                                        var servicetime = emp.servicecodes[iiii].time*1;
                                                        totalminutes += servicetime;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (key == -1) return;

                            var employee = $scope.ds_employees[key];
                            employee.jobTime = getTotalTimeDisplay(totalminutes);
                            $scope.ds_employees.$save(employee);
                        }

                        $scope.save = function(){
                            $scope.ds_data.crew_leader_id = last_crew_leader_id;
                            if ($scope.ds_data.crew_leader_id && $scope.ds_employees.length == 0)
                            {
                                //force add current crew members
                                $scope.addEmployee($scope.ds_data.crew_leader_id);
                                for(var i in employees)
                                {
                                    //console.log('check '+i+' with crew leader '+employees[i].crew_leader_id+' ?= '+$scope.ds_data.crew_leader_id);
                                    if (employees[i].crew_leader_id == $scope.ds_data.crew_leader_id && i != $scope.ds_data.crew_leader_id)
                                        $scope.addEmployee(i);
                                }
                            }

                            if (!$scope.ds_data.crew_leader_id)
                            {
                                //change branch for employee and job default adding for convenience until crew leader is chosen
                                $scope.ds_data.add_branch = $scope.ds_data.ds_branch;
                                $scope.ds_data.add_job_branch = $scope.ds_data.ds_branch;
                            }

                            for(var i=0; i<$scope.ds_jobs.length; i++)
                            {
                                $scope.refreshJobCalculations($scope.ds_jobs[i].id);
                            }

                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                $scope.refreshEmployeeCalculations($scope.ds_employees[i].id);
                            }

                            $scope.employees_cached = [];
                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                var employee = $scope.ds_employees[i];
                                $scope.employees_cached.push([employee.id, employees[employee.id].full_name]);
                            }

                            if ($scope.ds_data.ds_date)
                                $scope.ds_data.ds_date_raw = $scope.ds_data.ds_date.substring(6, 10) + '-' + $scope.ds_data.ds_date.substring(0, 2) + '-' + $scope.ds_data.ds_date.substring(3, 5);

                            $scope.ds_data.$save();
                            console.log('saved');
                            console.log($scope.ds_data);
                        };

                        $scope.createDailySheet = function(){
                            var error_message = '';
                            if (!$scope.isDateValid())
                                error_message = 'Please correct this daily sheet\'s date.';
                            else if (!$scope.areAllMaterialsEntered())
                            {
                                $('.span-nomaterialsused-error').show();
                                error_message = 'Please check the box for all jobs with no materials.';
                            }

                            if (error_message)
                            {
                                alert(error_message);
                                return;
                            }

                            $scope.syncPostData();
                        }

                        $scope.syncPostData = function(){
                            firebase.database().ref(db_root).once('value', function(snap){
                                if (!confirm('Create this daily sheet?')) return;

                                $('#ds_post_data').val(JSON.stringify(snap.val()));
                                $('#form_saveds').submit();
                            });
                        };

                        $scope.resetEverything = function(){
                            if (!confirm('Are you SURE you want to start over from scratch?  This action cannot be undone.')) return;

                            DBModel(db_root).remove().then(function(){
                                reInitialize();
                            });
                        };

                        //VALIDATION
                        $scope.isDateValid = function(){
                            return $scope.ds_data.ds_date_raw >= $scope.date_earliest_raw && $scope.ds_data.ds_date_raw <= $scope.date_latest_raw;
                        }

                        $scope.isEmployeeStartTimeValid = function(totalTime){
                            return totalTime > 0 && totalTime < 15*60;
                        }

                        $scope.isJobStartTimeValid = function(totalTime){
                            return totalTime > 0 && totalTime < 15*60;
                        }

                        $scope.getTempJobTime = function(){
                            try
                            {
                                return $scope.ds_temp.editing_job.totalTimeDisplay;
                            }
                            catch(ob)
                            {
                                return '';
                            }
                        }

                        $scope.getTempServiceTime = function(){
                            try
                            {
                                var totalminutes = 0;
                                for(var i=0; i<$scope.ds_temp.editing_servicecodes.length; i++)
                                {
                                    var servicecode = $scope.ds_temp.editing_servicecodes[i];
                                    totalminutes += 1*servicecode.time;
                                }
                                return getTotalTimeDisplay(totalminutes)+' ('+totalminutes+' min)';
                            }
                            catch(ob)
                            {
                                return '00:00 (0 min)';
                            }
                        }

                        $scope.updateTempEmployeeStartTimes = function(){
                            try
                            {
                                for(var i=0; i<$scope.ds_temp.editing_startendtimes.length; i++)
                                {
                                    var startendtime = $scope.ds_temp.editing_startendtimes[i];
                                    if (startendtime.starttime_typed)
                                    {
                                        startendtime.starttime = parseTypedTimeIntoValue(startendtime.starttime_typed);
                                    }
                                    if (startendtime.endtime_typed)
                                    {
                                        startendtime.endtime = parseTypedTimeIntoValue(startendtime.endtime_typed);
                                    }
                                    $scope.changeStartEndTime(i);
                                }
                            }
                            catch(ob)
                            {

                            }
                        }

                        $scope.areAllMaterialsEntered = function(){
                            var allchecked = true;
                            $('.checkbox-nomaterialsused').each(function(){
                                if ($(this).is(':visible') && !$(this).attr("checked")) {
                                    allchecked = false;
                                }
                            });
                            return allchecked;
                        }

                        //bind to JS functions for ng-if use
                        $scope.getTotalTimeFromString = getTotalTimeFromString;

                    } else {
                        // No user is signed in.
                    }
                });
            };

            $scope.signIn = function() {
                if (!initialized)
                {
                    console.log('try to sign in');
                    $scope.auth.$signInWithEmailAndPassword(admin_email, admin_password).catch(function(error) {
                        // Handle Errors here.
                        var errorCode = error.code;
                        var errorMessage = error.message;
                        // ...
                    });
                }
            };
        }
    ]);

    app.directive('datepicker', function() {
        return {
            restrict: 'A',
            require : 'ngModel',
            link : function (scope, element, attrs, ngModelCtrl) {
                $(function(){
                    $(element).datepicker({
                        dateFormat:'mm/dd/yy',
                        onSelect:function (date) {
                            scope.$apply(function () {
                                scope.ds_data.ds_date = date;
                                scope.save();
                            });
                        }
                    });
                });
            }
        }
    });

    app.run(function($rootScope) {
        var config = {
            apiKey: "AIzaSyAfrSlKwKnk-R2ACP5iU4MDEQ6q2ySK0u8",
            authDomain: "jrgm-daily-sheet-session.firebaseapp.com",
            databaseURL: "https://jrgm-daily-sheet-session.firebaseio.com",
            storageBucket: "jrgm-daily-sheet-session.appspot.com",
        };

        firebase.initializeApp(config);

        $( document ).ready(function() {
            $('#btn_initialize').click();
            setTimeout('executeLogin()', 1000);
        });
    });

    function executeLogin()
    {
        $('#btn_signIn').click();
    }

    function initialize()
    {
        $('#div_loading').hide();
        $('#div_main').show();
    }

    function reInitialize()
    {
        $('#div_loading').show();
        $('#div_main').hide();
        $('#span_loading').html('Re-initializing... please wait.');

        setTimeout('window.location.reload()', 100);
    }
</script>
<!----------------------------->

<script>
    function showPopup(id)
    {
        document.getElementById(id).style.display = 'block';
    }

    function hidePopup(id)
    {
        document.getElementById(id).style.display = 'none';
    }

    function editEmployee(employee_id)
    {
        showPopup('Loading... please wait.');

        $.ajax({
            url: 'scheduler_select_m_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'getEmployee', 'employee_id': employee_id },
            success: function(data) {
                if (data.error)
                {
                    hidePopup();
                    alert(data.error);
                }
                else
                {
                    popUpEditEmployee(data['DATA'][0]);
                }
            }
        });
    }

    function buildStartEndTimesOptions()
    {
        var options = [];
        options.push(['', '[ no value ]']);
        for(var army_hour=0; army_hour<24; army_hour++)
        {
            for(var minute=0; minute<60; minute+=5)
            {
                var str = army_hour+':'+minute;
                var display_str = getTimeDisplay(str);
                //var selected = (army_hour == 8 && minute == 50?' selected':'');
                options.push([str, display_str]);
            }
        }
        return options;
    }

    function buildServiceCodesOptions()
    {
        var options = servicecodes_select;
        return options;
    }

    function getTimeDisplay(str)
    {
        if (!str) return '';

        var spl = str.split(':');
        var army_hour = spl[0];
        var minute = spl[1];

        var ampm = 'am';
        if (army_hour == 0)
            hour = 12;
        else
        {
            if (army_hour >= 12)
                ampm = 'pm';
            if (army_hour == 12)
                hour = 12;
            else
                hour = army_hour % 12;
        }

        return (hour<10?'0'+hour:hour)+':'+(minute<10?'0'+minute:minute)+' '+ampm.toUpperCase();
    }

    function getTotalTimeDisplay(totalminutes)
    {
        if (totalminutes < 0) return '';
        var totalhours = Math.floor(totalminutes / 60);
        totalminutes = totalminutes % 60;
        return (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);
    }

    function getTotalTime(starttime, endtime)
    {
        var startminutes = getTotalTimeFromString(starttime);
        var endminutes = getTotalTimeFromString(endtime);
        var totalminutes = Math.abs(startminutes - endminutes);
        if (endminutes < startminutes) totalminutes = 24*60-totalminutes;
        return totalminutes;
    }

    function getTotalTimeFromString(str)
    {
        if (!str) return 0;

        var spl = str.split(':');
        var army_hour = spl[0];
        var minute = spl[1];
        //console.log(army_hour);
        //console.log(minute);
        return army_hour*60 + minute*1;
    }

    function getIdFromServiceCode(str)
    {
        if (!str) return '';

        var spl = str.split(' - ');
        return spl[0];
    }

    function parseTypedTimeIntoValue(time)
    {
        var numberPattern = /\d+/g;
        var spl = time.split(':');
        var hour = 0;
        var minute = 0;
        if (spl.length > 0)
        {
            hour = 1*spl[0].match(numberPattern)[0];
            if (spl.length > 1)
            {
                minute = 1*spl[1].match(numberPattern)[0];
            }
        }

        //make assumptions about times based on business hours
        if (hour >= 6 && hour <= 11) //assume these are AM
        {
            if (time.toLowerCase().indexOf('pm') != -1)
                hour += 12;
        }
        else if (hour >= 13) //army time
        {
        }
        else //assume these are PM
        {
            if (hour == 12)
            {
                if (time.toLowerCase().indexOf('am') != -1)
                    hour = 0;
            }
            else
            {
                hour += 12;
                if (time.toLowerCase().indexOf('am') != -1)
                    hour -= 12;
            }
        }
        return hour+':'+minute;
    }

    function addMinutesToTime(time, minutes)
    {
        var totalminutes = getTotalTimeFromString(time);
        totalminutes += minutes;
        return getTotalTimeDisplay(totalminutes);
    }
</script>
</body>
</html>
