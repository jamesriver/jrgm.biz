<cfset is_admin = 0>
<cfif SESSION.userid EQ 1001 OR SESSION.userid EQ 1003 OR SESSION.userid EQ 1870>
    <cfset is_admin = 1>
</cfif>


<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
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
          <td class="subbartxt">Welcome: Admin</td>
          <td width="42"><!--<a href="supervisors/setting.cfm" class="first"><img src="images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
          <td width="20"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
        </tr>
      </table>
    </div>
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="subheader"></div>
      <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td valign="top"><div class="dailysheet_header">Admin</div>
            <cfquery name="get_admin" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role IN (95, 96,99) AND employee_active =1
Order by lastname
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_admin">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_admin.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <div class="dailysheet_header">Business Development Group</div>
            <cfquery name="get_bdg" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 94 AND employee_active =1 
Order by lastname
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_bdg">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_bdg.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <div class="dailysheet_header">Regional Manager</div>
            <cfquery name="get_regional_managers" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 10 AND employee_active =1  
Order by lastname
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_regional_managers">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_regional_managers.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <div class="dailysheet_header">Branch Manager</div>
            <cfquery name="get_branch_managers" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 9 AND active_record =1 Order by last_name
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                  <th align="left">Crews</th>
                  <th align="left">Jobs</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_branch_managers">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#crew_name#</td>
                    <td>#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=crews" target="_blank">Crews</a></td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=jobs" target="_blank">Jobs</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <div class="dailysheet_header">Regional Admin</div>
            <cfquery name="get_reg_admin" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 98 AND employee_active =1
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_reg_admin">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td>#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_reg_admin.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <div class="dailysheet_header">Mechanics</div>
            <cfquery name="get_mechanics" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 8 AND employee_active =1
</cfquery>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_mechanics">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_mechanics.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <br /></td>
          <td>&nbsp;</td>
          <cfquery name="get_supervisors" datasource="jrgm">
SELECT employee_id, employee_branch, crew_name, last_name FROM   app_crews   WHERE  Employee_Position_ID= 1 AND active_record =1
GROUP BY employee_id, employee_branch, crew_name, last_name
ORDER by employee_branch, last_name
</cfquery>
          <td valign="top"><div class="dailysheet_header">Production Managers / Supervisors (<cfoutput>#get_supervisors.recordcount#</cfoutput>)</div>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                  <th align="left">Crews</th>
                  <th align="left">Jobs</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_supervisors">
                  <tr>
                    <td align="left">#employee_ID#</td>
                    <td align="left">#crew_name#</td>
                    <td align="left">#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                    <td align="left"><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=crews" target="_blank">Crews</a></td>
                    <td align="left"><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=jobs" target="_blank">Jobs</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <cfquery name="get_tech" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 6 AND active_record =1 AND employee_branch <>'Test'
ORDER by employee_branch, last_name
   </cfquery>
            <cfquery name="get_techD" datasource="jrgm">
SELECT DISTINCT  employee_ID FROM   app_crews   WHERE  Employee_Position_ID= 6 AND active_record =1 AND employee_branch <>'Test'
    </cfquery>
            <div class="dailysheet_header">Irrigation Techs (<cfoutput>#get_techD.recordcount#</cfoutput>)</div>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_tech">
                  <tr>
                    <td  align="left">#employee_ID#</td>
                    <td align="left">#crew_name#</td>
                    <td align="left">#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_tech.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br />
            <cfquery name="get_tech" datasource="jrgm">
SELECT employee_branch, last_name, employee_id, crew_name FROM   app_crews   WHERE  Employee_Position_ID= 7 AND active_record =1 AND employee_branch <>'Test'
GROUP BY employee_branch, last_name, employee_id, crew_name
ORDER by employee_branch, last_name
        </cfquery>
            <div class="dailysheet_header">Spray Techs (<cfoutput>#get_tech.recordcount#</cfoutput>)</div>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_tech">
                  <tr>
                    <td  align="left">#employee_ID#</td>
                    <td align="left">#crew_name#</td>
                    <td align="left">#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_tech.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table></td>
          <td>&nbsp;</td>
          <cfquery name="get_CL" datasource="jrgm">
SELECT ac.employee_id, ac.employee_branch, ac.crew_name, ac.last_name, aep.employee_active FROM   app_crews ac
LEFT JOIN app_employee_passwords aep ON aep.employee_id=ac.employee_id
WHERE  ac.Employee_Position_ID= 2 AND ac.active_record =1 AND ac.employee_branch <>'Test'
GROUP BY ac.employee_id, ac.employee_branch, ac.crew_name, ac.last_name, aep.employee_active
ORDER by ac.employee_branch, ac.last_name
        </cfquery>
          <cfquery name="get_techCLD" datasource="jrgm">
SELECT DISTINCT  ac.employee_ID FROM   app_crews ac
WHERE  ac.Employee_Position_ID= 2 AND ac.active_record =1 AND ac.employee_branch <>'Test'
    </cfquery>
          <td valign="top"><div class="dailysheet_header">Crew Leaders (<cfoutput>#get_techCLD.recordcount#</cfoutput>)</div>
            <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <cfif is_admin EQ 1>
                    <th align="left">Edit</th>
                  </cfif>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_CL">
                  <tr<cfif employee_active NEQ 1> style="color: ##FF0000"</cfif>>
                    <td  align="left">#employee_ID#</td>
                    <td align="left">#crew_name#</td>
                    <td align="left">#employee_branch#</td>
                    <cfif is_admin EQ 1>
                        <td><input type="button" value="Edit" onClick="editEmployee(#employee_ID#)"></td>
                    </cfif>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <br /></td>
        </tr>
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

        var html = 'Saving... please wait.';
        showPopup(html);

        $.ajax({
            url: 'scheduler_select_m_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'saveEmployee', 'employee_id': employee_id, 'employee_active': employee_active },
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
