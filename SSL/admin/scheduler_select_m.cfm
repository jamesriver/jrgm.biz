<cfset is_admin = 0>
<cfif SESSION.userid EQ 1001 OR SESSION.userid EQ 1003 OR SESSION.userid EQ 1870>
    <cfset is_admin = 1>
</cfif>

<cfset todayDate = Now()>
<cfquery name="get_employees" datasource="jrgm">
  SELECT ae.[Employee ID] as employee_id, ae.branch, ae.[Name FirstLast] as full_name, ae.last_name, aep.employee_active, CASE WHEN ar.name IS NULL THEN 'Crew Member' ELSE ar.name END as access_role_name, CASE WHEN ar.access_role_id IS NULL THEN 0 ELSE ar.access_role_id END as access_role_id, ac.supervisor_id, ac.crew_leader_id FROM app_employees ae
  LEFT JOIN app_employee_passwords aep ON aep.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=aep.access_role
  LEFT JOIN app_crews_new ac ON ac.employee_id=ae.[Employee ID]
  WHERE ae.active_record=1 AND ae.branch <>'Test'
  ORDER BY CASE WHEN ar.access_role_id IS NULL THEN 110 ELSE ar.displayorder END, ae.branch, ae.last_name
</cfquery>
<cfset employee_counts = StructNew()>
<cfset employee_total = 0>
<cfloop query="get_employees">
    <cfif !StructKeyExists(employee_counts, access_role_id)>
        <cfset employee_counts[access_role_id] = 1>
    <cfelse>
        <cfset employee_counts[access_role_id]++>
    </cfif>
    <cfset employee_total++>
</cfloop>

<cfquery name="get_all_employees" datasource="jrgm">
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name FROM app_employees ae
</cfquery>
<cfset employees = StructNew()>
<cfloop query="get_all_employees">
    <cfset employees[employee_id] = full_name>
</cfloop>

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
        </tr>
      </table>
    </div>
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
    Total Active Employees in Biz: <cfoutput>#employee_total#</cfoutput><br />

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
                    <cfif is_admin EQ 1 AND access_role_id NEQ 0>
                        <th align="left">Home</th>
                        <th align="left">Edit</th>
                    </cfif>
                </tr>
            </thead>
            <tbody>
      </cfif>
          <tr<cfif employee_active NEQ 1 AND access_role_id NEQ 0> style="color: ##FF0000"</cfif>>
            <td align="left">#employee_id#</td>
            <td align="left">#full_name#</td>
            <td align="left">#branch#</td>
            <cfif access_role_id EQ 9 OR access_role_id EQ 1>
                <td align="left"><a href="/SSL/scheduler/crew_assignments.cfm?branch=#branch#" target="_blank">Crews</a></td>
            </cfif>
            <cfif access_role_id EQ 2 OR access_role_id EQ 6 OR access_role_id EQ 7>
                <td><cfif StructKeyExists(employees, supervisor_id)>#employees[supervisor_id]#<cfelse>[ Unassigned ]</cfif></td>
            </cfif>
            <cfif access_role_id EQ 0>
                <td><cfif StructKeyExists(employees, crew_leader_id)>#employees[crew_leader_id]#<cfelse>[ Unassigned ]</cfif></td>
            </cfif>
            <cfif is_admin EQ 1 AND access_role_id NEQ 0>
                <td><a href="do_loginnew.cfm?employee_ID=#employee_id#&schedchoice=home" target="_blank">Home</a></td>
                <td><input type="button" value="Edit" onClick="editEmployee(#employee_id#)"></td>
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
            'supervisor_name': data[8]
        };

        console.log(data);

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

    function saveEmployee()
    {
        var employee_id = $('#employee_id').val();
        var employee_active = $('#employee_active').prop('checked')?1:0;
        var username = $('#username').val();
        var password = $('#password').val();

        var html = 'Saving... please wait.';
        showPopup(html);

        $.ajax({
            url: 'scheduler_select_m_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'saveEmployee', 'employee_id': employee_id, 'employee_active': employee_active, 'username': username, 'password': password },
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
</script>
</cfif>
</body>
</html>
