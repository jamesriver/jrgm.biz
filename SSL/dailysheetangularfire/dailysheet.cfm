<cfset is_admin = 0>
<cfquery name="get_is_admin" datasource="jrgm">
    SELECT is_admin FROM access_roles WHERE access_role_id=#SESSION.access_role#
</cfquery>
<cfloop query="get_is_admin">
    <cfset is_admin = get_is_admin.is_admin>
</cfloop>
<cfif SESSION.branch EQ 'Corporate'>
    <cfset is_admin = 1>
</cfif>

<cfset todayDate = Now()>
<cfquery name="get_all_employees" datasource="jrgm">
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

<cfquery name="get_branches" datasource="jrgm">
  SELECT * FROM branches
  WHERE branch_active=1
  AND branch_visible_to_select=1
  ORDER BY branch_name
</cfquery>

<cfquery name="get_all_branch_jobs" datasource="jrgm">
    SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id, branch FROM APP_jobs
    ORDER by [Wk Location Name] ASC
</cfquery>

<cfquery name="get_all_service_codes" datasource="jrgm">
    SELECT * FROM app_job_services_list
    WHERE is_active=1
    ORDER BY service_id
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
                        <select id="ds_crew_leader_id" name="ds_crew_leader_id" ng-model="ds_data.crew_leader_id" ng-options="employee[0] as employee[1] for employee in employees_select[ds_data.ds_branch][0]" class="form-control" ng-change="save(); addCrewLeader();"></select>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <table id="table_employees" class="table table-striped">
                    <thead>
                        <th style="padding: 5px">Employee</th>
                        <th style="padding: 5px">Start/End Times</th>
                        <th style="padding: 5px">Total Time</th>
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
                        <a class="btn btn-success btn-xs" ng-click="addEmployee(ds_data.add_employee_id)">Add</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <div class="form-inline">
                    <div class="form-group">
                        <select id="add_job_branch" name="add_job_branch" ng-model="ds_data.add_job_branch" ng-options="branch[0] as branch[1] for branch in branches_select" class="form-control" ng-change="save()"></select>
                        <select id="add_job_job_id" name="add_job_job_id" ng-model="ds_data.add_job_job_id" ng-options="job[0] as job[1] for job in jobs_select[ds_data.add_job_branch]" class="form-control" ng-change="save()"></select>
                        <a class="btn btn-success btn-xs" ng-click="addJob(ds_data.add_job_job_id)">Add</a>
                    </div>
                </div>
                <div ng-repeat="ds_job in ds_jobs">
                    <br />
                    <div class="div_job" style="padding: 5px; height: 33px">
                        <div style="float: left">{{ ds_job.id }} - {{ jobs[ds_job.id].name }}</div>
                        <div style="float: right"><a class="btn btn-danger btn-xs" ng-click="removeJob(ds_job)">Remove</a></div>
                    </div>
                    <table id="table_job" class="table table-striped">
                        <thead>
                            <th style="padding: 5px">Employee</th>
                            <th style="padding: 5px">Time by Service Codes</th>
                            <th style="padding: 5px">Total Time</th>
                            <th style="padding: 5px">Remove</th>
                        </thead>
                        <tbody ng-repeat="ds_employee in ds_job.ds_employees">
                            <tr>
                                <td style="padding: 5px">{{ employees[ds_employee.id].full_name }}</td>
                                <td style="padding: 5px">
                                    <span ng-repeat="servicecodetime in ds_employee.servicecodetimes">
                                        {{ servicecodetime.display }}
                                        <br />
                                    </span>
                                    <a class="btn btn-info btn-xs" ng-click="editEmployeeServiceCodes(ds_employee)">Edit</a>
                                </td>
                                <td style="padding: 5px">
                                    <span ng-if="ds_employee.totalServiceTime">{{ ds_employee.totalServiceCodeTime }}</span>
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
                            <a class="btn btn-success btn-xs" ng-click="addEmployeeToJob(ds_data.add_job_employee_employee_id, ds_job.id)">Add</a>
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
            <cfif parent_id NEQ ''>
                <option value="#service_id# - #name#">
            </cfif>
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
                                    <!--select ng-model="servicecode.id" ng-options="option[0] as option[1] for option in ds_temp.editing_servicecodes_options"></select-->
                                    <input ng-model="servicecode.id" list="datalist_servicecodes">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="servicecodetime">Time:</label>
                                    <input ng-model="servicecode.time" style="width: 60px">&nbsp;minutes
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
    <!--end popup loader-->
</div>

<script type='text/javascript'>
    var app = angular.module("sampleApp", ["firebase"]);
    var initialized = false;
    var admin_email = 'bchan@jrgm.com';
    var admin_password = 'firebase1!';
    var db_root = '<cfoutput>#Replace(CGI.REMOTE_ADDR, '.', '', 'ALL')#</cfoutput>/<cfoutput>#SESSION.userid#</cfoutput>';
    var date_now = '<cfoutput>#dateFormat(now(), 'mm/dd/yyyy')#</cfoutput>';
    var admin_branch = '<cfoutput>#SESSION.branch#</cfoutput>';

    var employees = {};
    var employees_select = {};
    //[full_name, first_name, last_name, employee_id, username, password, branch, email, access_role_id, access_role_name]
    <cfoutput>
    <cfloop from="1" to="#arrayLen(employees)#" index="i">
        <cfset employee = employees[i]>
        var employee = { full_name: '#employee.id# - #Replace(employee.name, "'", "\\'", "ALL")#', first_name: '#Replace(employee.first_name, "'", "\\'", "ALL")#', last_name: '#Replace(employee.last_name, "'", "\\'", "ALL")#', employee_id: '#employee.id#', branch: '#employee.branch#', 'access_role': '#employee.access_role#' };
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
        var servicecode = { name: '#service_id# - #Replace(name, "'", "\'", "ALL")#', id: '#service_id#' };
        servicecodes_select.push([servicecode.id, servicecode.name]);</cfoutput>

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

                                $scope.save();
                            });
                        }

                        $scope.addCrewLeader = function(){
                            console.log('crew_leader_id = '+$scope.ds_data.crew_leader_id);

                            var query = DBModel(db_root+'/ds_employees').orderByChild("id").equalTo($scope.ds_data.crew_leader_id).limitToFirst(1);
                            if ($firebaseArray(query).length == 0)
                                $scope.addEmployee($scope.ds_data.crew_leader_id);
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
                                console.log($scope.ds_jobs);
                                $scope.ds_jobs.$save(key);
                            });
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
                        
                        $scope.editEmployeeServiceCodes = function(employee){
                            $scope.ds_temp = {};
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
                            $scope.saveServiceCode();
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.saveServiceCode = function(){
                            var employee = $scope.ds_temp.editing_employee;
                            employee.servicecodes = $scope.ds_temp.editing_servicecodes;
                            totalminutes = 0;
                            for(var i=0; i<employee.servicecodes.length; i++)
                            {
                                employee.servicecodes[i].display = 'the display '+employee.servicecodes[i].time;
                                totalminutes += employee.servicecodes[i].time;
                            }
                            var totalhours = Math.floor(totalminutes / 60);
                            var totalminutes = totalminutes % 60;
                            employee.totalTime = (totalhours<10?'0'+totalhours:totalhours)+':'+(totalminutes<10?'0'+totalminutes:totalminutes);
                            $scope.ds_employees.$save(employee);
                        }

                        $scope.saveServiceCodesToAllEmployees = function(){
                            if (!confirm('Are you sure you want to overwrite ALL employee service code times?')) return;

                            for(var i=0; i<$scope.ds_employees.length; i++)
                            {
                                $scope.ds_temp.editing_employee = $scope.ds_employees[i];
                                $scope.saveServiceCode();
                            }
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.cancelServiceCodes = function(){
                            hidePopup('div_popupServiceCodes');
                        };

                        $scope.save = function(){
                            if ($scope.ds_data.crew_leader_id && $scope.ds_employees.length == 0)
                            {
                                console.log('force add '+$scope.ds_data.crew_leader_id);
                                $scope.addEmployee($scope.ds_data.crew_leader_id);
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
        var spl = starttime.split(':');
        var army_hour = spl[0];
        var minute = spl[1];
        var startminutes = army_hour*60 + minute*1;

        spl = endtime.split(':');
        army_hour = spl[0];
        minute = spl[1];
        var endminutes = army_hour*60 + minute*1;
        return Math.abs(startminutes - endminutes);
    }
</script>
</body>
</html>
