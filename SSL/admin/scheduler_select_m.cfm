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

<cfif is_admin EQ 0>
Permission denied.
<cfabort>
</cfif>

<cfset allowed_access_roles = 'ALL'>
<cfset todayDate = Now()>
<cfoutput>
SELECT ae.*, ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, aep.employee_active, aep.username, aep.password, aep.access_role, CASE WHEN ar.name IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN 'No Employee Login' ELSE 'Crew Member' END ELSE ar.name END as access_role_name, CASE WHEN ar.access_role_id IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN -1 ELSE 0 END ELSE ar.access_role_id END as access_role_id, ac.supervisor_id, ac.crew_leader_id FROM app_employees ae
  LEFT JOIN app_employee_passwords aep ON aep.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=aep.access_role
  LEFT JOIN app_crews_new ac ON ac.employee_id=ae.[Employee ID]
  WHERE ae.active_record=1 AND (ae.[Employee ID]=#SESSION.userid# OR (
  <cfif is_admin EQ 0>
  <cfelseif is_admin EQ 1>
    ae.branch <>'Test'
  <cfelseif is_admin EQ 2>
    <cfset allowed_access_roles = '1,0,2,6,7,9'>
    ae.branch=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT"> AND ac.Employee_Position_ID IN (#allowed_access_roles#)
  <cfelseif is_admin EQ 3>
    <cfset allowed_access_roles = '0,2,6,7'>
    ae.branch=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT"> AND ac.Employee_Position_ID IN (#allowed_access_roles#)
  <cfelseif is_admin EQ 4>
    <cfset allowed_access_roles = '1,0,2,6,7,9,10'>
    ac.Employee_Position_ID IN (#allowed_access_roles#)
  </cfif>
  ))
  <cfif SESSION.userid NEQ 1001>
    AND ar.is_admin != 1
  </cfif>
  ORDER BY CASE WHEN ar.access_role_id IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN -1 ELSE 110 END ELSE ar.displayorder END, ae.branch, ae.first_name
</cfoutput>
<cfquery name="get_employees" datasource="jrgm">
  SELECT ae.*, ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, aep.employee_active, aep.username, aep.password, aep.access_role, CASE WHEN ar.name IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN 'No Employee Login' ELSE 'Crew Member' END ELSE ar.name END as access_role_name, CASE WHEN ar.access_role_id IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN -1 ELSE 0 END ELSE ar.access_role_id END as access_role_id, ac.supervisor_id, ac.crew_leader_id FROM app_employees ae
  LEFT JOIN app_employee_passwords aep ON aep.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=aep.access_role
  LEFT JOIN app_crews_new ac ON ac.employee_id=ae.[Employee ID]
  WHERE ae.active_record=1 AND (ae.[Employee ID]=#SESSION.userid# OR (
  <cfif is_admin EQ 0>
  <cfelseif is_admin EQ 1>
    ae.branch <>'Test'
  <cfelseif is_admin EQ 2>
    <cfset allowed_access_roles = '1,0,2,6,7,9'>
    ae.branch=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT"> AND ac.Employee_Position_ID IN (#allowed_access_roles#)
  <cfelseif is_admin EQ 3>
    <cfset allowed_access_roles = '0,2,6,7'>
    ae.branch=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT"> AND ac.Employee_Position_ID IN (#allowed_access_roles#)
  <cfelseif is_admin EQ 4>
    <cfset allowed_access_roles = '1,0,2,6,7,9,10'>
    ac.Employee_Position_ID IN (#allowed_access_roles#)
  </cfif>
  ))
  <cfif SESSION.userid NEQ 1001>
    AND (ar.is_admin != 1 OR ar.is_admin IS NULL)
  </cfif>
  ORDER BY CASE WHEN ar.access_role_id IS NULL THEN CASE WHEN ac.employee_id IS NULL THEN -1 ELSE 110 END ELSE ar.displayorder END, ae.branch, ae.first_name
</cfquery>
<cfset employees_for_insert = ArrayNew(1)>
<cfset employee_counts = StructNew()>
<cfset employee_total = 0>
<cfloop query="get_employees">
    <cfif !StructKeyExists(employee_counts, access_role_id)>
        <cfset employee_counts[access_role_id] = 1>
    <cfelse>
        <cfset employee_counts[access_role_id]++>
    </cfif>
    <cfset employee_total++>
    <cfset ArrayAppend(employees_for_insert, [full_name, first_name, last_name, employee_id, username, password, branch, email, access_role_id, access_role_name])>
</cfloop>
<!---cfdump var="#employees_for_insert#"><cfabort--->

<cfquery name="get_all_employees" datasource="jrgm">
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name FROM app_employees ae
</cfquery>
<cfset employees = StructNew()>
<cfloop query="get_all_employees">
    <cfset employees[employee_id] = full_name>
</cfloop>

<cfquery name="get_access_roles" datasource="jrgm">
  SELECT * FROM access_roles
  <cfif allowed_access_roles NEQ 'ALL'>
    WHERE access_role_id IN (#allowed_access_roles#)
  </cfif>
  ORDER BY displayorder
</cfquery>

<cfquery name="get_branches" datasource="jrgm">
  SELECT * FROM branches
  WHERE branch_active=1
  AND branch_visible_to_select=1
  <cfif is_admin GT 1>
    AND branch_name=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT">
  </cfif>
  ORDER BY branch_name
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <!--- <cfinclude template="includes/subbar.cfm"> --->
    <div class="subbar">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="57"><a href="default.cfm"><img src="images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a></td>
          <td class="subbartxt">Welcome: Level Access</td>
          <td width="42"><!--<a href="supervisors/setting.cfm" class="first"><img src="images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
          <td width="20"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
          <td class="subbartxt" width="200" align="right">  <a href="default.cfm">Home</a><img src="images/clear.gif" width="20" height="2" alt="" /></td>

        </tr>
      </table>
    </div>
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
    Total Employees Shown: <cfoutput>#employee_total#</cfoutput><br />
    <cfif is_admin GE 1>
        <center><input type="button" value="Add Employee Login" onClick="popUpAddEmployee()"></center>
    </cfif>
    <cfset last_access_role_id = ''>
    <cfoutput query="get_employees">
      <cfif last_access_role_id NEQ access_role_id>
        <cfif last_access_role_id NEQ ''>
            </tbody>
        </table>
        <br />
        </cfif>
        <cfset last_access_role_id = access_role_id>
        <div class="dailysheet_header">#access_role_name# (#employee_counts[access_role_id]#)</div>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
            <thead>
                <tr>
                    <th align="left">Employee ID</th>
                    <th align="left">Name</th>
                    <th align="left">Branch</th>
                    <cfif access_role_id EQ 9 OR access_role_id EQ 1>
                        <th align="left">Crews</th>
                    </cfif>
                    <cfif access_role_id EQ 2 OR access_role_id EQ 6 OR access_role_id EQ 7>
                        <th align="left">Production Manager</th>
                    </cfif>
                    <cfif access_role_id EQ 0>
                        <th align="left">Supervisor/Crew Leader</th>
                    </cfif>
                    <cfif is_admin GE 1 AND access_role_id NEQ 0 AND access_role_id NEQ 2>
                        <th align="left">Home</th>
                    </cfif>
                    <th align="left">Edit</th>
                </tr>
            </thead>
            <tbody>
      </cfif>
          <tr<cfif employee_active NEQ 1 AND username NEQ ''> style="color: ##FF0000"</cfif>>
            <td align="left">#employee_id#</td>
            <td align="left">#full_name#</td>
            <td align="left">#branch#</td>
            <cfif access_role_id EQ 9>
                <td align="left"><a href="/SSL/scheduler/crew_assignments.cfm?branch=#branch#" target="_blank">Crews</a></td>
            </cfif>
            <cfif access_role_id EQ 1>
                <td align="left"><a href="/SSL/scheduler/crew_assignments.cfm?branch=#branch#&employee_id=#employee_id#" target="_blank">Crews</a></td>
            </cfif>
            <cfif access_role_id EQ 2 OR access_role_id EQ 6 OR access_role_id EQ 7>
                <td><cfif StructKeyExists(employees, supervisor_id)>#employees[supervisor_id]#<cfelse>[ Unassigned ]</cfif></td>
            </cfif>
            <cfif access_role_id EQ 0>
                <td><cfif StructKeyExists(employees, crew_leader_id)>#employees[crew_leader_id]#<cfelse>[ Unassigned ]</cfif></td>
            </cfif>
            <cfif is_admin GE 1 AND access_role_id NEQ 0 AND access_role_id NEQ 2>
                <td><a href="do_loginnew.cfm?employee_ID=#employee_id#&schedchoice=home" target="_blank">Home</a></td>
            </cfif>
            <cfif username NEQ ''>
                <td><input type="button" value="Edit" onClick="editEmployee(#employee_id#)"></td>
            <cfelse>
                <td>&nbsp;</td>
            </cfif>
          </tr>
    </cfoutput>
    </tbody>
    </table>
    <br />
    <br />
    <br />
    <br />
      
      <!-- to clear footer --> 
    </div>
  </div>
</div>

<!--jQuery popup loader-->
<div id="div_popupWindowSheen" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div id="div_popupWindow" style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <div id="div_popupWindowContent"></div>
        </center>
    </div>
</div>
<!--end popup loader-->

<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

<cfif is_admin>
<script>
    var employees = {};
    var employees_select = [];
    //[full_name, first_name, last_name, employee_id, username, password, branch, email, access_role_id, access_role_name]
    <cfoutput>
    <cfloop from="1" to="#arrayLen(employees_for_insert)#" index="i">
        <cfset employee = employees_for_insert[i]>
        employees[#employee[4]#] = { full_name: '#Replace(employee[1], "'", "\\'", "ALL")#', first_name: '#Replace(employee[2], "'", "\\'", "ALL")#', last_name: '#Replace(employee[3], "'", "\\'", "ALL")#', employee_id: '#employee[4]#', username: '#Replace(employee[5], "'", "\\'", "ALL")#', password: '#Replace(employee[6], "'", "\\'", "ALL")#', branch: '#employee[7]#', email: '#employee[8]#', 'access_role': '#employee[9]#', access_role_name: '#employee[10]#' };
        employees_select.push([employees[#employee[4]#].employee_id, employees[#employee[4]#].full_name]);
    </cfloop>
    </cfoutput>
    employees_select.sort(function(a, b){
         var nameA=a[1].toLowerCase(), nameB=b[1].toLowerCase()
         if (nameA < nameB) //sort string ascending
          return -1
         if (nameA > nameB)
          return 1
         return 0 //default return value (no sorting)
    })

    var access_roles_select = [];
    <cfoutput query="get_access_roles">
        access_roles_select.push([#access_role_id#, '#name#']);</cfoutput>

    var branches = {};
    var branches_select = [];
    <cfoutput query="get_branches">
        branches['#branch_name#'] = { branch_abbr: '#branch_abbr#'};
        branches_select.push(['#branch_name#', '#branch_name#']);</cfoutput>

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

    function popUpEditEmployee(data)
    {
        var employee = {
            'employee_id': data[0],
            'crew_name': data[1],
            'position': data[2],
            'employee_active': data[3],
            'username': data[4],
            'password': data[5],
            'access_role': data[6],
            'password_date': data[7],
            'supervisor_name': data[8],
            'branch': data[9]
        };

        //console.log(employee);

        var html = '<table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">';
        html += '<input type="hidden" id="employee_id" value="'+employee.employee_id+'">';
        html += '<tr>';
        html += '<td colspan="2" align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Editing '+employee.crew_name+' ('+employee.position+')</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Employee ID:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">'+employee.employee_id+'</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Active Biz Login:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="employee_active" type="checkbox" value="1"'+(employee.employee_active==1?' checked':'')+'></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Access Role:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">';
        html += '<select id="access_role" onChange="showAccessRoleNote(\''+employee.access_role+'\', this.value)">';
        for(var i in access_roles_select)
        {
            var access_role = access_roles_select[i];
            html += '<option value="'+access_role[0]+'"'+(employee.access_role==access_role[0]?' selected':'')+'>'+access_role[1]+'</option>';
        }
        html += '</select>';
        html += '<br /><span id="access_role_note" style="font-size: 8pt; color: #0000AA; display: none"><i>make sure this value is also updated in ADP<br />this may affect crew assignments so remember to check afterwards</i></span>';
        html += '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Branch:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">';
        html += '<select id="branch" onChange="showBranchNote(\''+employee.branch+'\', this.value)">';
        for(var i in branches_select)
        {
            var branch = branches_select[i];
            html += '<option value="'+branch[0]+'"'+(employee.branch==branch[0]?' selected':'')+'>'+branch[1]+'</option>';
        }
        html += '</select>';
        html += '<br /><span id="branch_note" style="font-size: 8pt; color: #0000AA; display: none"><i>make sure this value is also updated in ADP</i></span>';
        html += '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Username:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="username" value="'+employee.username+'"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Password:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="password" value="'+employee.password+'"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<tr>';
        html += '<td colspan="2" align="center" style="padding: 10px"><input type="button" value="Save Changes" onClick="if (confirm(\'Save changes made to this employee?\')) saveEmployee()">&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onClick="hidePopup()"></td>';
        html += '</tr>';
        html += '</table>';
        showPopup(html);
    }

    function showBranchNote(original_branch, new_branch)
    {
        console.log(original_branch + ' ?= ' + new_branch);
        if (original_branch != new_branch)
        {
            $('#branch_note').show();
        }
        else
        {
            $('#branch_note').hide();
        }
    }
    
    function showAccessRoleNote(original_access_role, new_access_role)
    {
        console.log(original_access_role + ' ?= ' + new_access_role);
        if (original_access_role != new_access_role)
        {
            $('#access_role_note').show();
        }
        else
        {
            $('#access_role_note').hide();
        }
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

    function popUpAddEmployee()
    {
        var html = '<table cellspacing="0" align="center" style="width: 50%; border: 1px solid black">';
        html += '<tr>';
        html += '<td colspan="2" align="center" style="padding: 10px; border-top: 1px solid black; border-bottom: 2px solid black; background-color: #999999; color: #FFFFFF">Adding Employee Login</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Choose Employee:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">';
        html += '<select id="add_employee" onChange="updateAddEmployee(this.value)">';
        html += '<option value="">[ Choose one ]</option>';
        for(var i in employees_select)
        {
            var employee = employees[employees_select[i][0]];
            html += '<option value="'+employee.employee_id+'">'+employee.full_name+' ('+employee.employee_id+') ['+employee.branch+'] |'+employee.access_role_name+'|</option>';
        }
        html += '</select>';
        html += '<br /><span style="font-size: 8pt"><i>must be added in ADP first</i>';
        html += '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Employee ID:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="add_employee_id"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Login Employee ID:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="add_employee_id_new"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Branch:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">';
        html += '<select id="add_branch" onChange="changeBranch(this.value)">';
        html += '<option value="">[ Choose one ]</option>';
        for(var i in branches_select)
        {
            var branch = branches_select[i];
            html += '<option value="'+branch[0]+'">'+branch[1]+'</option>';
        }
        html += '</select>';
        html += '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Access Role:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px">';
        html += '<select id="add_access_role">';
        html += '<option value="">[ Choose one ]</option>';
        for(var i in access_roles_select)
        {
            var access_role = access_roles_select[i];
            html += '<option value="'+access_role[0]+'">'+access_role[1]+'</option>';
        }
        html += '</select>';
        html += '</td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Username:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="add_username"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<td align="right" width="50%" style="padding: 10px"><b>Password:</b></td>';
        html += '<td align="left" width="50%" style="padding: 10px"><input id="add_password"></td>';
        html += '</tr>';
        html += '<tr>';
        html += '<tr>';
        html += '<td colspan="2" align="center" style="padding: 10px"><input id="add_submit" type="button" value="Add Employee Login" onClick="if (confirm(\'Add this employee login?\')) addEmployee()">&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onClick="hidePopup()"></td>';
        html += '</tr>';
        html += '</table>';
        showPopup(html);
    }

    function updateAddEmployee(employee_id)
    {
        var employee = employees[employee_id];
        $('#add_employee_id').val(employee.employee_id);
        $('#add_employee_id_new').val(employee.employee_id);
        if (employee.username)
        {
            //a login already exists for this user
            $('#add_access_role').val(employee.access_role);
            $('#add_username').val(employee.username);
            $('#add_password').val(employee.password);
            $('#add_branch').val(employee.branch);
        }
        else
        {
            //this user does not yet have a login
            $('#add_access_role').val('');
            $('#add_username').val((employee.first_name.substring(0, 1).toLowerCase()+employee.last_name.toLowerCase()).replace(/[^a-zA-Z]/g, ''));
            $('#add_password').val('corpjrgm'+employee.employee_id);
            $('#add_branch').val('');
        }
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

    function addEmployee()
    {
        var employee_id = $('#add_employee_id').val();
        var employee_id_new = $('#add_employee_id_new').val();
        var access_role = $('#add_access_role').val();
        var username = $('#add_username').val();
        var password = $('#add_password').val();
        var branch = $('#add_branch').val();
        document.getElementById('add_submit').disabled = true;

        $.ajax({
            url: 'scheduler_select_m_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'addEmployee', 'employee_id': employee_id, 'employee_id_new': employee_id_new, 'access_role': access_role, 'username': username, 'password': password, 'branch': branch },
            success: function(data) {
                if (data.error)
                {
                    alert(data.error);
                    document.getElementById('add_submit').disabled = false;
                }
                else
                {
                    hidePopup();
                    window.location = 'scheduler_select_m.cfm';
                }
            }
        });
    }
</script>
</cfif>
</body>
</html>
