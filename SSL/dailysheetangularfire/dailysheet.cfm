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
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, ae.first_name, ae.last_name, CASE WHEN ac.employee_position_id IS NULL THEN 0 ELSE CASE WHEN ar.is_admin > 0 THEN 1 ELSE ac.employee_position_id END END as access_role, ac.crew_leader_id, ae.branch FROM app_employees ae
  INNER JOIN app_crews ac ON ac.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=ac.employee_position_id
  WHERE ae.active_record=1
  GROUP BY ae.[Employee ID], ae.[Name FirstLast], ae.first_name, ae.last_name, ac.crew_leader_id, ae.branch, ac.employee_position_id, ar.is_admin
  ORDER BY ae.last_name
</cfquery>
<cfset employees = ArrayNew(1)>
<cfloop query="get_all_employees">
    <cfset ArrayAppend(employees, { 'id': employee_id, 'name': full_name , 'first_name': first_name, 'last_name': last_name, 'access_role': access_role, 'crew_leader_id': crew_leader_id, 'branch': branch })>
</cfloop>

<cfquery name="get_branches" datasource="jrgm">
  SELECT * FROM branches
  WHERE branch_active=1
  AND branch_visible_to_select=1
  ORDER BY branch_name
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
    .div_main {
        display: none;
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

    <div id="div_main" style="padding: 20px">
        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_date">Date of Service:</label>
                        <input id="ds_date" name="ds_date" ng-model="data.ds_date" class="form-control" style="width: 50%" datepicker>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_supervisor_id">Production Manager:</label>
                        <select id="ds_supervisor_branch" name="ds_supervisor_branch" ng-model="data.supervisor_branch" ng-options="branch[0] as branch[1] for branch in branches" class="form-control" ng-change="save()"></select>
                        <select id="ds_supervisor_id" name="ds_supervisor_id" ng-model="data.supervisor_id" ng-options="employee[0] as employee[1] for employee in employees[data.supervisor_branch][1]" class="form-control" ng-change="save()"></select>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <label for="ds_crew_leader_id">Supervisor/Crew Leader:</label>
                        <select id="ds_crew_leader_branch" name="ds_crew_leader_branch" ng-model="data.crew_leader_branch" ng-options="branch[0] as branch[1] for branch in branches" class="form-control" ng-change="save()"></select>
                        <select id="ds_crew_leader_id" name="ds_crew_leader_id" ng-model="data.crew_leader_id" ng-options="employee[0] as employee[1] for employee in employees[data.crew_leader_branch][2]" class="form-control" ng-change="save()"></select>
                    </div>
                </div>

                <!--header ng-repeat-start="message in messages">
                    Header {{ message.foo }}
                </header>
                <div class="body">
                    Body {{ message.foo }}
                </div>
                <footer ng-repeat-end>
                    Footer {{ message.foo }}
                </footer-->
            </div>
        </div>
    </div>
  </div>
</div>

<script type='text/javascript'>
    var app = angular.module("sampleApp", ["firebase"]);
    var initialized = false;
    var admin_email = 'bchan@jrgm.com';
    var admin_password = 'firebase1!';

    var employees = {};
    var employees_select = {};
    //[full_name, first_name, last_name, employee_id, username, password, branch, email, access_role_id, access_role_name]
    <cfoutput>
    <cfloop from="1" to="#arrayLen(employees)#" index="i">
        <cfset employee = employees[i]>
        var employee = { full_name: '#Replace(employee.name, "'", "\\'", "ALL")#', first_name: '#Replace(employee.first_name, "'", "\\'", "ALL")#', last_name: '#Replace(employee.last_name, "'", "\\'", "ALL")#', employee_id: '#employee.id#', branch: '#employee.branch#', 'access_role': '#employee.access_role#' };
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
    <cfoutput query="get_branches">
        branches['#branch_name#'] = { branch_abbr: '#branch_abbr#'};
        branches_select.push(['#branch_name#', '#branch_name#']);</cfoutput>

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
                        $scope.data = $firebaseObject(DBModel('<cfoutput>#Replace(CGI.REMOTE_ADDR, '.', '', 'ALL')#</cfoutput>/<cfoutput>#SESSION.userid#</cfoutput>'));
                        $scope.branches = branches_select;
                        $scope.employees = employees_select;

                        $scope.data.$loaded(function(data){
                            //DEFAULT VALUES
                            if (!$scope.data.ds_date)
                                $scope.data.ds_date = '<cfoutput>#dateFormat(now(), 'mm/dd/yyyy')#</cfoutput>';
                            if (!$scope.data.supervisor_branch)
                                $scope.data.supervisor_branch = '<cfoutput>#SESSION.branch#</cfoutput>';
                            if (!$scope.data.crew_leader_branch)
                                $scope.data.crew_leader_branch = '<cfoutput>#SESSION.branch#</cfoutput>';

                            $scope.save();
                            console.log($scope.data);

                            initialize();
                        });

                        $scope.save = function(){
                            //console.log('save');
                            $scope.data.$save();
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
                                scope.data.ds_date = date;
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
    function showPopup(html)
    {
        if (html)
        {
            $('#div_popupWindowContent').html(html);
        }
        document.getElementById('div_popupWindowSheen').style.display = 'block';
    }

    function hidePopup()
    {
        document.getElementById('div_popupWindowSheen').style.display = 'none';
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

    function saveEmployee()
    {
        var employee_id = $('#employee_id').val();
        var employee_active = $('#employee_active').prop('checked')?1:0;
        var username = $('#username').val();
        var password = $('#password').val();
        var branch = $('#branch').val();
        var access_role = $('#access_role').val();

        var html = 'Saving... please wait.';
        showPopup(html);

        $.ajax({
            url: 'scheduler_select_m_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'saveEmployee', 'employee_id': employee_id, 'employee_active': employee_active, 'username': username, 'password': password, 'branch': branch, 'access_role': access_role },
            success: function(data) {
                if (data.error)
                {
                    hidePopup();
                    alert(data.error);
                }
                else
                {
                    window.location = 'scheduler_select_m.cfm';
                }
            }
        });
    }

    function changeBranch(branch)
    {
        //check to see if this employee might be getting added to a new branch
        var employee_id = $('#add_employee').val();
        var employee = employees[employee_id];
        if (employee.username)
        {
            if (employee.branch != branch)
            {
                $('#add_employee_id_new').val(employee_id+'1');
                $('#add_username').val(employee.username+branches[branch].branch_abbr);
            }
            else
            {
                $('#add_employee_id_new').val(employee_id);
                $('#add_username').val(employee.username);
            }
        }
    }
</script>
</body>
</html>
