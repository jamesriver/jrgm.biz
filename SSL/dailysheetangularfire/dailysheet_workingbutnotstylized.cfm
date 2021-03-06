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
    <cfoutput>Done, ID=#ds_id#</cfoutput>
    <cfabort>
</cfif>

<cfquery name="get_all_employees" datasource="#CONFIG_DATABASENAME#">
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, ae.first_name, ae.last_name, CASE WHEN ac.employee_position_id IS NULL OR ac.employee_position_id=2 THEN 0 ELSE CASE WHEN ar.is_admin > 0 THEN 1 ELSE ac.employee_position_id END END as access_role, ac.crew_leader_id, ae.branch FROM app_employees ae
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
<link id="bs-css" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link id="bsdp-css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet">
</head>
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
</style>
<body>

<!--ANGULARFIRE SPECIFIC CODE-->
<div ng-app="sampleApp" ng-controller="SampleCtrl">
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
        <center><img src="/SSL/admin/ajax-loader.gif">&nbsp;Loading... please wait.</center>
    </div>

    <div id="div_main" style="padding: 20px;">
        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_date">Date of Service:</label>
                        <input id="ds_date" name="ds_date" ng-model="ds_data.ds_date" class="form-control" style="width: 50%" datepicker>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_branch">Branch:</label>
                        <select id="ds_branch" name="ds_branch" ng-model="ds_data.ds_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_supervisor_id">Production Manager:</label>
                        <select id="ds_supervisor_id" name="ds_supervisor_id" ng-model="ds_data.supervisor_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.ds_branch][1]" class="form-control" ng-change="save()"></select>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_crew_leader_id">Supervisor/Crew Leader:</label>
                        <select id="ds_crew_leader_id" name="ds_crew_leader_id" ng-model="ds_data.crew_leader_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.ds_branch][0]" class="form-control" ng-change="addCrewLeader();"></select>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <div class="visible-xs visible-sm visible-md"><hr /></div>
                <div class="form-inline">
                    <div class="form-group">
                        <a class="btn btn-success btn-lg" ng-click="syncPostData()">Save Daily Sheet</a>
                    </div>
                </div>
                <div class="visible-xs visible-sm visible-md"><hr /></div>
            </div>
        </div>
        <br />
        <div ng-if="ds_data.crew_leader_id > 0" class="row">
            <div class="col-lg-6 col-sm-12">
                <table id="table_employees" class="table table-striped">
                    <thead>
                        <th style="padding: 5px">DS Employee</th>
                        <th style="padding: 5px">Start/End Times</th>
                        <th style="padding: 5px">Total Time</th>
                        <th style="padding: 5px">Job Time</th>
                        <th style="padding: 5px">Remove</th>
                    </thead>
                    <tbody ng-repeat="ds_employee in ds_employees">
                        <tr>
                            <td style="padding: 5px">{{ employees[ds_employee.id].full_name }}</td>
                            <td style="padding: 5px">
                                <span ng-repeat="startendtime in ds_employee.startendtimes">
                                    {{ startendtime.display }}
                                    <br />
                                </span>
                                <a class="btn btn-info btn-xs" ng-click="editEmployeeStartEndTimes(ds_employee)">Edit</a>
                            </td>
                            <td style="padding: 5px">
                                <span ng-if="ds_employee.totalTime">{{ ds_employee.totalTime }}</span>
                            </td>
                            <td style="padding: 5px">
                                <span ng-if="ds_employee.jobTime">{{ ds_employee.jobTime }}</span>
                            </td>
                            <td style="padding: 5px">
                                <a ng-if="ds_employee.id != ds_data.crew_leader_id" class="btn btn-danger btn-xs" ng-click="removeEmployee(ds_employee)">Remove</a>
                                <span ng-if="ds_employee.id == ds_data.crew_leader_id">&nbsp;</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-inline">
                    <div class="form-group">
                        <select id="add_branch" name="add_branch" ng-model="ds_data.add_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                        <select id="add_employee_id" name="add_employee_id" ng-model="ds_data.add_employee_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.add_branch][0]" class="form-control" ng-change="save()"></select>
                        <a class="btn btn-success btn-xs" ng-click="addEmployee(ds_data.add_employee_id)">Add DS Employee</a>
                    </div>
                </div>
                <div class="visible-xs visible-sm visible-md"><hr /></div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <div class="form-inline">
                    <div class="form-group">
                        <select id="add_job_branch" name="add_job_branch" ng-model="ds_data.add_job_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                        <select id="add_job_job_id" name="add_job_job_id" ng-model="ds_data.add_job_job_id" ng-options="job[0] as job[1] for job in jobs_select[ds_data.add_job_branch]" class="form-control" ng-change="save()"></select>
                        <a class="btn btn-success btn-xs" ng-click="addJob(ds_data.add_job_job_id)">Add Job</a>
                    </div>
                </div>
                <div ng-repeat="ds_job in ds_jobs">
                    <div class="visible-xs visible-sm visible-md"><hr /></div>
                    <div class="visible-lg"><br /></div>
                    <div class="div_job" style="padding: 5px; height: 33px">
                        <div style="float: left">{{ ds_job.id }} - {{ jobs[ds_job.id].name }}</div>
                        <div style="float: right"><a class="btn btn-danger btn-xs" ng-click="removeJob(ds_job)">Remove</a></div>
                    </div>
                    <table id="table_job" class="table table-striped">
                        <thead>
                            <th style="padding: 5px">&nbsp;</th>
                            <th style="padding: 5px">Start Time</th>
                            <th ng-if="ds_job.starttime_lunch" style="padding: 5px">Lunch Start</th>
                            <th ng-if="ds_job.endtime_lunch" style="padding: 5px">Lunch End</th>
                            <th style="padding: 5px">End Time</th>
                            <th style="padding: 5px">Total Time</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="padding: 5px"><a class="btn btn-info btn-xs" ng-click="editJobTimes(ds_job)">Edit Times</a></td>
                                <td style="padding: 5px">{{ ds_job.starttime_display }}</td>
                                <td ng-if="ds_job.starttime_lunch"style="padding: 5px">{{ ds_job.starttime_lunch_display }}</td>
                                <td ng-if="ds_job.endtime_lunch" style="padding: 5px">{{ ds_job.endtime_lunch_display }}</td>
                                <td style="padding: 5px">{{ ds_job.endtime_display }}</td>
                                <td style="padding: 5px">{{ ds_job.totalTime }}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div ng-if="ds_job.totalTime">
                        <table id="table_job" class="table table-striped">
                            <thead>
                                <th style="padding: 5px"><a class="btn btn-info btn-xs" ng-click="editMaterials(ds_job)">Edit Materials</a></th>
                                <th ng-if="ds_job.ds_materials" style="padding: 5px">Material</th>
                                <th ng-if="ds_job.ds_materials" style="padding: 5px">Quantity</th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="ds_material in ds_job.ds_materials">
                                    <td style="padding: 5px">&nbsp;</td>
                                    <td style="padding: 5px">{{ ds_material.id }}</td>
                                    <td style="padding: 5px">{{ ds_material.quantity }}</td>
                                </tr>
                                <tr ng-if="!ds_job.ds_materials">
                                    <td style="padding: 5px">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <input type="checkbox" value="1" ng-model="ds_job.nomaterials" ng-change="saveNoMaterialsToJob(ds_job, ds_job.nomaterials)">
                                                Check this box if no materials were used
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="table_job" class="table table-striped">
                            <thead>
                                <th style="padding: 5px">Job Employee</th>
                                <th style="padding: 5px">Time by Service Codes</th>
                                <th style="padding: 5px">Total Time</th>
                                <th style="padding: 5px">Remove</th>
                            </thead>
                            <tbody ng-repeat="ds_employee in ds_job.ds_employees">
                                <tr>
                                    <td style="padding: 5px">{{ employees[ds_employee.id].full_name }}</td>
                                    <td style="padding: 5px">
                                        <span ng-repeat="servicecode in ds_employee.servicecodes">
                                            {{ servicecode.display }}
                                            <br />
                                        </span>
                                        <a class="btn btn-info btn-xs" ng-click="editEmployeeServiceCodes(ds_employee, ds_job.id)">Edit</a>
                                    </td>
                                    <td style="padding: 5px">
                                        <span ng-if="ds_employee.totalServiceTime">{{ ds_employee.totalServiceTime }}</span>
                                    </td>
                                    <td style="padding: 5px">
                                        <a class="btn btn-danger btn-xs" ng-click="removeEmployeeFromJob(ds_employee, ds_job)">Remove</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="form-inline">
                            <div class="form-group">
                                <select id="add_job_employee_employee_id" name="add_job_employee_employee_id" ng-model="ds_data.add_job_employee_employee_id" ng-options="employee[0] as employee[1] for employee in employees_cached" class="form-control" ng-change="save()"></select>
                                <a class="btn btn-success btn-xs" ng-click="addEmployeeToJob(ds_data.add_job_employee_employee_id, ds_job.id)">Add DS Employee to Job</a>
                                <a class="btn btn-primary btn-xs" ng-click="addAllEmployeesToJob(ds_job.id)">Add All DS Employees to Job</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--jQuery popup loader-->
    <div id="div_popupStartEndTimes" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
        <div style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
            <center>
                <table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">
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
                                    <select ng-model="startendtime.starttime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options"></select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="endtime">End Time:</label>
                                    <select ng-model="startendtime.endtime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options"></select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="btn btn-danger btn-xs" ng-click="removeStartEndTime(index)">Remove</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                                <a class="btn btn-info btn-md" ng-click="saveStartEndTimes()">Save</a>
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
                <table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">
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
                                    <input ng-model="servicecode.id" list="datalist_servicecodes" class="form-control" style="width: 150px">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="servicecodetime">Time:</label>
                                    <input ng-model="servicecode.time" class="form-control" style="width: 60px">&nbsp;minutes
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="btn btn-danger btn-xs" ng-click="removeServiceCode(index)">Remove</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                                <a class="btn btn-info btn-md" ng-click="saveServiceCodes()">Save</a>
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
                <table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">
                    <tr>
                        <td align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Job Times: {{ ds_temp.editing_job_name }}</td>
                    </tr>
                    <tr>
                        <td align="center" style="padding-bottom: 20px">
                            <br />
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="starttime">Start Time:</label>
                                    <select ng-model="ds_temp.editing_starttime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control"></select>
                                </div>
                            </div>
                            <br />
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="starttime">Lunch Start:</label>
                                    <select ng-model="ds_temp.editing_starttime_lunch" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control"></select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="starttime">Lunch End:</label>
                                    <select ng-model="ds_temp.editing_endtime_lunch" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control"></select>
                                </div>
                            </div>
                            <br />
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="starttime">End Time:</label>
                                    <select ng-model="ds_temp.editing_endtime" ng-options="option[0] as option[1] for option in ds_temp.editing_startendtimes_options" class="form-control"></select>
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
                <table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">
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
</div>

<script type='text/javascript'>
    var app = angular.module("sampleApp", ["firebase"]);
    var initialized = false;
    var admin_email = 'bchan@jrgm.com';
    var admin_password = 'firebase1!';
    var db_root = '<cfoutput>#Replace(CGI.REMOTE_ADDR, '.', '', 'ALL')#</cfoutput>/<cfoutput>#SESSION.userid#</cfoutput>/add';
    var date_now = '<cfoutput>#dateFormat(now(), 'mm/dd/yyyy')#</cfoutput>';
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

                        $scope.ds_data.$loaded(function(data){
                            $scope.ds_employees.$loaded(function(data){
                                //DEFAULT VALUES
                                if (!$scope.ds_data.ds_date)
                                    $scope.ds_data.ds_date = date_now;
                                if (!$scope.ds_data.ds_branch)
                                    $scope.ds_data.ds_branch = admin_branch;
                                $scope.ds_data.add_branch = $scope.ds_data.ds_branch;
                                $scope.ds_data.add_employee_id = 0;
                                $scope.ds_data.add_job_branch = $scope.ds_data.ds_branch;
                                $scope.ds_data.add_job_job_id = 0;
                                last_crew_leader_id = $scope.ds_data.crew_leader_id;

                                $scope.save();

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
                        }

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
                        }

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
                        }

                        $scope.editEmployeeStartEndTimes = function(employee){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_employee = employee;
                            $scope.ds_temp.editing_employee_name = employee.name;
                            $scope.ds_temp.editing_startendtimes = employee.startendtimes;
                            $scope.ds_temp.editing_startendtimes_options = buildStartEndTimesOptions();

                            showPopup('div_popupStartEndTimes');
                        }

                        $scope.addStartEndTime = function(){
                            if (!$scope.ds_temp.editing_startendtimes)
                                $scope.ds_temp.editing_startendtimes = [];
                            var starttime = '8:50';
                            if ($scope.ds_temp.editing_startendtimes[$scope.ds_temp.editing_startendtimes.length-1])
                                starttime = $scope.ds_temp.editing_startendtimes[$scope.ds_temp.editing_startendtimes.length-1].endtime;
                            var endtime = starttime;
                            $scope.ds_temp.editing_startendtimes.push({ 'starttime': starttime, 'endtime': endtime });
                            console.log($scope.ds_temp.editing_startendtimes);
                        };

                        $scope.removeStartEndTime = function(key){
                            $scope.ds_temp.editing_startendtimes.splice(key, 1);
                        }

                        $scope.saveStartEndTimes = function(){
                            $scope.saveStartEndTime();
                            hidePopup('div_popupStartEndTimes');
                        };

                        $scope.saveStartEndTime = function(){
                            var employee = $scope.ds_temp.editing_employee;
                            employee.startendtimes = $scope.ds_temp.editing_startendtimes;
                            totalminutes = 0;
                            for(var i=0; i<employee.startendtimes.length; i++)
                            {
                                employee.startendtimes[i].display = getTimeDisplay(employee.startendtimes[i].starttime)+' - '+getTimeDisplay(employee.startendtimes[i].endtime);
                                totalminutes += getTotalTime(employee.startendtimes[i].starttime, employee.startendtimes[i].endtime);
                            }
                            var totalhours = Math.floor(totalminutes / 60);
                            var totalminutes = totalminutes % 60;
                            employee.totalTime = (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);
                            $scope.ds_employees.$save(employee);
                        }

                        $scope.saveStartEndTimesToAllEmployees = function(){
                            if (!confirm('Are you sure you want to overwrite ALL employee times?')) return;

                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                $scope.ds_temp.editing_employee = $scope.ds_employees[i];
                                $scope.saveStartEndTime();
                            }
                            hidePopup('div_popupStartEndTimes');
                        };

                        $scope.cancelStartEndTimes = function(){
                            hidePopup('div_popupStartEndTimes');
                        };
                        
                        $scope.addJob = function(job_id){
                             if (!job_id) return;
 
                             var query = DBModel(db_root+'/ds_jobs').orderByChild("id").equalTo(job_id).limitToFirst(1);
                             var result = $firebaseArray(query);
                             result.$loaded(function(data){
                                 if (data.length != 0) return;
 
                                 $scope.ds_jobs.$add({ 'id': job_id });
                                 console.log('added '+job_id);
                             });
                        }
                        
                        $scope.removeJob = function(job){
                            if (!confirm('Remove '+jobs[job.id].name+' from this Daily Sheet?')) return;

                            $scope.ds_jobs.$remove(job).then(function() {
                                console.log('removed job');
                                console.log(job);
                                $scope.save();
                            });
                        }

                        $scope.editJobTimes = function(job){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_job = job;
                            $scope.ds_temp.editing_job_name = jobs[job.id].name;
                            $scope.ds_temp.editing_starttime = job.starttime;
                            $scope.ds_temp.editing_endtime = job.endtime;
                            $scope.ds_temp.editing_starttime_lunch = job.starttime_lunch;
                            $scope.ds_temp.editing_endtime_lunch = job.endtime_lunch;
                            $scope.ds_temp.editing_startendtimes_options = buildStartEndTimesOptions();

                            showPopup('div_popupJobTimes');
                        }
                        
                        $scope.saveJobTimes = function(){
                            $scope.saveJobTimesToJob();
                            hidePopup('div_popupJobTimes');
                        };

                        $scope.saveJobTimesToJob = function(){
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

                                var totalminutes = getTotalTime(job.starttime, job.endtime);
                                if (job.starttime_lunch && job.endtime_lunch)
                                   totalminutes -= getTotalTime(job.starttime_lunch, job.endtime_lunch);
                                var totalhours = Math.floor(totalminutes / 60);
                                var totalminutes = totalminutes % 60;
                                job.totalTime = (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);

                                $scope.ds_jobs[key] = job;
                                $scope.ds_jobs.$save(key);
                            });
                        }

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
                        }

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
                        }

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
                        }

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
                        }

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
                        }

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
                            console.log($scope.ds_jobs);
                            $scope.ds_jobs.$save(key);
                        }
                        
                        $scope.editEmployeeServiceCodes = function(employee, job_id){
                            $scope.ds_temp = {};
                            $scope.ds_temp.editing_job_id = job_id;
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

                        $scope.saveServiceCodes = function(){
                            $scope.saveServiceCodesToEmployee();
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.saveServiceCodesToEmployee = function(){
                            var employee = $scope.ds_temp.editing_employee;
                            var job_id = $scope.ds_temp.editing_job_id;
                            employee.servicecodes = $scope.ds_temp.editing_servicecodes;
                            totalminutes = 0;
                            for(var i=0; i<employee.servicecodes.length; i++)
                            {
                                employee.servicecodes[i].display = employee.servicecodes[i].id+' ['+employee.servicecodes[i].time+' min]';
                                totalminutes += employee.servicecodes[i].time*1;
                            }
                            var totalhours = Math.floor(totalminutes / 60);
                            var totalminutes = totalminutes % 60;
                            employee.totalServiceTime = (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);

                            var key = -1;
                            var totalminutes = 0;
                            var job;
                            for(var i=0; i<$scope.ds_jobs.length; i++)
                            {
                                job = $scope.ds_jobs[i];
                                if ($scope.ds_jobs[i].id == job_id)
                                    key = i;
                                if (job.ds_employees)
                                {
                                    for(var ii=0; ii<job.ds_employees.length; ii++)
                                    {
                                        if (job.ds_employees[ii].id == employee.id)
                                        {
                                            var emp = job.ds_employees[ii];
                                            if (emp.servicecodes)
                                            {
                                                for(var iii=0; iii<emp.servicecodes.length; iii++)
                                                {
                                                    totalminutes += emp.servicecodes[iii].time*1;
                                                }
                                            }
                                        }
                                    }
                                }
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

                            key = -1;
                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                if ($scope.ds_employees[i].id == employee.id)
                                    key = i;
                            }
                            if (key == -1) return;

                            var employee = $scope.ds_employees[key];
                            var totalhours = Math.floor(totalminutes / 60);
                            var totalminutes = totalminutes % 60;
                            employee.jobTime = (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);;
                            $scope.ds_employees.$save(employee);
                        }

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

                            $scope.employees_cached = [];
                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                var employee = $scope.ds_employees[i];
                                $scope.employees_cached.push([employee.id, employees[employee.id].full_name]);
                            }
                            $scope.ds_data.$save();
                            console.log('saved');
                        };

                        $scope.syncPostData = function(){
                            firebase.database().ref(db_root).once('value', function(snap){
                                if (!confirm('Save this daily sheet?')) return;

                                $('#ds_post_data').val(JSON.stringify(snap.val()));
                                $('#form_saveds').submit();
                            });
                        };

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
</script>
</body>
</html>
