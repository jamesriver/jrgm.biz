<!--- get branches for select dropdowns --->
<!---cfdump var="#SESSION#"><cfabort--->

<cfset user_is_admin = 0>
<cfset user_access_role = 1>
<cfset user_employee_id = 0>

<cfif SESSION.access_role EQ 9 OR SESSION.access_role EQ 10 OR SESSION.access_role EQ 94 OR SESSION.access_role EQ 95 OR SESSION.access_role EQ 96 OR SESSION.access_role EQ 98 OR SESSION.access_role EQ 99>
    <cfset user_is_admin = 1>
    <cfset user_access_role = 9>
<cfelseif SESSION.access_role EQ 1> <!---supervisor--->
    <!--- keep default values set above --->
<cfelse>
    Access denied.
    <cfabort>
</cfif>

<cfif IsDefined('url.employee_id')>
    <cfset user_employee_id = url.employee_id>
<cfelseif user_is_admin EQ 0 OR SESSION.access_role EQ 9>
    <cfset user_employee_id = SESSION.userid>
</cfif>

<cfif user_employee_id NEQ 0>
    <cfquery name="get_employee" datasource="jrgm">
        SELECT [Name FirstLast] as employee_name, branch as employee_branch FROM app_employees
        WHERE [Employee ID]=#user_employee_id#
    </cfquery>
    <cfset user_employee_name = get_employee.employee_name>
    <cfset user_employee_branch = get_employee.employee_branch>
<cfelse>
</cfif>

<cfquery name="get_branches" datasource="jrgm"  >
    SELECT * FROM branches
    <cfif SESSION.branch EQ 'test'>
        WHERE branch_code=100
    <cfelseif SESSION.access_role EQ 9 OR SESSION.access_role EQ 1>
        WHERE branch_name=<cfqueryparam value="#SESSION.branch#" CFSQLType="CF_SQL_TEXT">
    <cfelse>
        WHERE branch_active=1 AND branch_visible_to_select=1
    </cfif>
    AND branch_code != 12 <!--- Corporate branch does not have any crews --->
    ORDER by branch_name
</cfquery>

<cfquery name="get_all_branches" datasource="jrgm"  >
    SELECT * FROM branches
    WHERE
    <cfif SESSION.branch EQ 'test'>
        branch_code=100 AND
    </cfif>
    branch_active=1 AND branch_visible_to_select=1 AND
    branch_code != 12 <!--- Corporate branch does not have any crews --->
    ORDER by branch_name
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
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
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
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="/SSL/admin/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/SSL/admin/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="/SSL/admin/assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="/SSL/admin/assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
<!-- END THEME STYLES -->
<link href="/SSL/admin/css/styles_ds.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
</head>
<body>
<!---cfinclude template="/SSL/admin/includes/subbar.cfm"--->

<div class="page-container-fluid">
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> Logged in as <cfoutput>#SESSION.screenname#</cfoutput> (<cfoutput>#SESSION.access_role#</cfoutput>)<br>
<br>
<br>

      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Crew Assignments</h1>
        <span style="position: relative; top: 20px; left: 20px">This system allows Branch Managers to assign Supervisors/Crew Leaders to Production Managers, and allows Production Managers to organize Crews.<br />When creating daily sheets manually, crew members appear in the top of the dropdown list and can be from other branches.</span>
      </div>
      <!-- END PAGE TITLE -->
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <a href="/SSL/admin/default.cfm">Home</a>
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

      <cfoutput>
      <div class="row">
        <div class="col-md-12">
            <form method="post">
              <center>
                <a id="btn_showDiagram" style="display: none; position: relative; top: -15px" class="btn btn-primary" onClick="showDiagram()">Show Complete Crew Diagram</a>
                <a id="btn_hideDiagram" style="display: none; position: relative; top: -15px" class="btn btn-info" onClick="hideDiagram()">Hide Complete Crew Diagram</a>
              </center>
              <table class="table large">
                <tr>
                  <cfif user_is_admin EQ 1 AND SESSION.access_role NEQ 9>
                      <td nowrap="nowrap" align="right">Choose Branch&nbsp;</td>
                      <td><span id="span_main_branch"></span></td>
                  <cfelse>
                      <td nowrap="nowrap" align="center"><b>#user_employee_name# (#user_employee_id#) [#user_employee_branch#]</b></td>
                  </cfif>
                </tr>
              </table>
            </form>
        </div>
      </div>
      <div id="div_crewassignments" class="row">
        <div class="col-md-12">
            <div id="div_supervisor" align="center"></div>
            <table id="table_crewassignments" align="center">
                <tr id="tr_crewassignments"></tr>
            </table>
        </div>
      </div>
      <div id="div_crews" class="row" style="display: none">
      </div>
      </cfoutput>
    </div>
    <!-- END PAGE CONTENT INNER -->
  </div>
</div>
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<!---cfinclude template="/SSL/admin/footer-include.cfm"--->
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>

<!--jQuery popup loader-->
<div id="div_popupWindowSheen" style="background: no-repeat 50% 50% rgba(255, 255, 255, 1); left: 0; top: 0; width: 100%; height: 100%; text-align: center; display: none; position: fixed; z-index: 1001;">
    <div id="div_popupWindow" style="top: 50%; text-align: center; position: relative; transform: translatey(-50%); -webkit-transform: translatey(-50%); max-height: 80%; overflow: auto;">
        <center>
            <div id="div_popupWindowContent"></div>
        </center>
    </div>
</div>
<!--end popup loader-->


<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
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
<script src="/SSL/admin/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>

<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="/SSL/admin/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/SSL/admin/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="/SSL/admin/assets/admin/pages/scripts/components-pickers.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

  <script>
    var branches = [];
    <cfoutput query="get_all_branches">
        branches.push({ name: '#Replace(branch_name, "'", "\\'", "ALL")#', id: #branch_code# });</cfoutput>

    var supervisors = [];
    var crew_leaders = [];
    var crew_members = [];
    var employees = [];

    var user_branch = '<cfoutput>#SESSION.branch#</cfoutput>';
    var user_access_role = <cfoutput>#user_access_role#</cfoutput>;
    var user_employee_id = <cfoutput>#user_employee_id#</cfoutput>;
    var user_is_admin = <cfoutput>#user_is_admin#</cfoutput>;
    var user_supervisor_id = <cfoutput>#SESSION.userid#</cfoutput>;

    var bgcolors = [
        '#EF2121','#4EB84A','#FFC221','#39215B',
        '#A8CE39','#801042','#F78026','#0D6B8B',
        '#F7EF48','#8C4A9C','#F36321','#0A827A'
    ];
    var textcolors = [
        '#FFFFFF','#000000','#000000','#FFFFFF',
        '#000000','#FFFFFF','#000000','#FFFFFF',
        '#000000','#FFFFFF','#000000','#FFFFFF'
    ];

    jQuery(document).ready(function() {
       // initiate layout and plugins
       Metronic.init(); // init metronic core components
       Layout.init(); // init current layout
       Demo.init(); // init demo features
       ComponentsPickers.init();

       populateBranchSelect('main', <cfif IsDefined('url.branch')>'<cfoutput>#url.branch#</cfoutput>'<cfelse>user_branch</cfif>);
    });

    function populateBranchSelect(spanId, branch) {
        var html = '';
        user_branch = '';
        html += '<select name="'+spanId+'" class="bs-select form-control" onChange="getSupervisorsAndCrewLeaders(this.value)">';
        for(var i=0; i<branches.length; i++) {
            var b = branches[i];
            if (b.name == branch)
                user_branch = branch;
            html += '<option value="'+b.name+'"'+(b.name == branch?' selected':'')+'>'+b.name+'</option>';
        }
        html += '</select>';
        $('#span_'+spanId+'_branch').html(html);

        if (!user_branch)
            user_branch = branches[0].name;
        if (user_is_admin)
            getSupervisorsAndCrewLeaders(user_branch);
        else
            getCrewLeadersAndCrewMembers(user_employee_id);
    }

    function getSupervisorsAndCrewLeaders(branch) {
        user_branch = branch;
        $('#tr_crewassignments').html('Loading... please wait.');
        $('#div_supervisor').html('');

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'getSupervisorsAndCrewLeaders', 'branch': branch },
            success: function(data) {
                try
                {
                    var obj = data['DATA'];
                    var i;
                    var ob;

                    supervisors = [];
                    crew_leaders = [];
                    crew_members = [];
                    employees = [];

                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        employees[ob[2]] = { employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] };
                    }

                    //branch manager
                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        if (ob[0] == 1 || ob[0] == 9 || ob[0] == 10)
                            supervisors.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                        else if (ob[0] == 2)
                        {
                            if (!crew_leaders[ob[4]])
                                crew_leaders[ob[4]] = [];
                            crew_leaders[ob[4]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                        }
                    }
                    buildBranchManagerVersion();
                }
                catch(ob)
                {
                    console.log(ob);
                    alert('An error occurred: '+ob);
                }

                hidePopup();
                hideDiagram();
            }
        });
    }

    function showEmployeeName(employee_id)
    {
        return employees[employee_id].employee_name+' ('+employees[employee_id].employee_id+')';
    }

    function buildBranchManagerVersion()
    {
        $('#tr_crewassignments').html('');

        var fullhtml = '';
        for(var i=0; i<supervisors.length; i++)
        {
            var s = supervisors[i];
            var bgcolor = bgcolors[i];
            var textcolor = textcolors[i];
            var html = '';
            html += '<table style="border: 1px solid black">';
            html += '<tr>';
            html += '<td style="cursor: pointer; padding: 15px; background-color: '+bgcolor+'; color: '+textcolor+'; font-weight: bold; border-bottom: 1px solid black" onmouseover="this.style.backgroundColor=\'#FFFF00\'; this.style.color = \'black\'" onmouseout="this.style.backgroundColor=\''+bgcolor+'\'; this.style.color = \''+textcolor+'\'" onClick="getCrewLeadersAndCrewMembers('+s.employee_id+')">'+showEmployeeName(s.employee_id)+'</td>';
            html += '</tr>';

            var cl = crew_leaders[s.employee_id];
            if (cl)
            {
                for(var ii=0; ii<cl.length; ii++)
                {
                    var cm = cl[ii];
                    html += '<tr>';
                    html += '<td style="cursor: pointer; padding: 15px" onmouseover="this.style.backgroundColor=\'#00AA00\'" onmouseout="this.style.backgroundColor=\'#FFFFFF\'" onClick="popUpMoveCrewLeader('+cm.employee_id+')">'+showEmployeeName(cm.employee_id)+'</td>';
                    html += '</tr>';
                }
            }

            html += '</table>';

            fullhtml += '<td valign="top" style="padding: 5px">'+html+'</td>';
        }
        $('#tr_crewassignments').append(fullhtml);
    }

    function popUpMoveCrewLeader(employee_id)
    {
        var e = employees[employee_id];

        var pophtml = '';
        pophtml += '<table align="center" style="width: 80%; border: 1px solid black">';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px; border-bottom: 1px solid black; background-color: #e5e5e5"><b>Assign Supervisor/Crew Leader to Production Manager</b></td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;">Click/Touch a Production Manager below to assign '+showEmployeeName(employee_id)+'</td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;"><input type="button" value="Cancel and Go Back" onClick="hidePopup()"></td>';
        pophtml += '</tr>';

        for(var i=0; i<supervisors.length; i++)
        {
            var s = supervisors[i];
            var bgcolor = bgcolors[i];
            var textcolor = textcolors[i];
            pophtml += '<tr>';
            pophtml += '<td align="center" style="padding: 10px"><div style="cursor: pointer; font-weight: bold; padding: 10px; border: 1px solid black; background-color: '+bgcolor+'; width: 50%; color: '+textcolor+'" onmouseover="this.style.backgroundColor=\'#FFFF00\'; this.style.color = \'black\'" onmouseout="this.style.backgroundColor=\''+bgcolor+'\'; this.style.color = \''+textcolor+'\'" onClick="moveCrewLeader('+employee_id+', '+s.employee_id+')">'+showEmployeeName(s.employee_id)+'</div></td>';
            pophtml += '</tr>';
        }
        pophtml += '</table>';
        showPopup(pophtml);
    }

    function moveCrewLeader(crew_leader_id, supervisor_id)
    {
        var pophtml = '';
        pophtml = 'Moving '+showEmployeeName(crew_leader_id)+' to '+showEmployeeName(supervisor_id)+'... please wait.';
        showPopup(pophtml);
        //alert('Move '+crew_leader_id+' to '+supervisor_id);

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'moveCrewLeader', 'crew_leader_id': crew_leader_id, 'supervisor_id': supervisor_id },
            success: function(data) {
                if (data.error)
                {
                    hidePopup();
                    alert(data.error);
                }
                else
                {
                    getSupervisorsAndCrewLeaders(user_branch);
                }
            }
        });
    }

    function getCrewLeadersAndCrewMembers(supervisor_id) {
        user_supervisor_id = supervisor_id;
        $('#tr_crewassignments').html('Loading... please wait.');
        $('#div_supervisor').html('');

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'getCrewLeadersAndCrewMembers', 'supervisor_id': supervisor_id, 'branch': user_branch },
            success: function(data) {
                try
                {
                    var obj = data['DATA'];
                    var i;
                    var ob;

                    supervisors = [];
                    crew_leaders = [];
                    crew_members = [];
                    employees = [];
                    unassigned = { employee_name: 'UNASSIGNED', employee_id: 0, crew_leader_id: 0, supervisor_id: 0 };

                    employees[0] = unassigned;
                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        employees[ob[2]] = { employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] };
                    }

                    //crew leader
                    crew_leaders.push(unassigned);
                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        if (ob[0] == 1 || ob[0] == 9 || ob[0] == 10)
                            supervisors.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                        else if (ob[0] == 2)
                            crew_leaders.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                        else if (ob[0] == 0 || ob[0] == 6 || ob[0] == 7)
                        {
                            if (!crew_members[ob[3]])
                                crew_members[ob[3]] = [];
                            crew_members[ob[3]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4], employee_branch: ob[5] });
                        }                            
                    }
                    buildProductionManagerVersion();
                }
                catch(ob)
                {
                    console.log(ob);
                    alert('An error occurred: '+ob);
                }

                hidePopup();
                hideDiagram();
            }
        });
    }

    function buildProductionManagerVersion()
    {
        $('#tr_crewassignments').html('');

        var fullhtml = '';

        var s = null;
        for(var i=0; i<supervisors.length; i++)
        {
            if (user_supervisor_id == supervisors[i].employee_id)
                s = supervisors[i];
        }
        if (!s) return;

        var html = '';
        if (user_is_admin)
        {
            html += '<table style="border: 1px solid black">';
            html += '<tr>';
            html += '<td style="cursor: pointer; padding: 15px; background-color: #999999; color: #FFFFFF; font-weight: bold; border-bottom: 1px solid black" onmouseover="this.style.backgroundColor=\'#FFFF00\'; this.style.color = \'black\'" onmouseout="this.style.backgroundColor=\'#999999\'" onClick="getSupervisorsAndCrewLeaders(\''+user_branch+'\')">'+showEmployeeName(s.employee_id)+'</td>';
            html += '</tr>';
            html += '</table>';
            html += '<b>NOTE:</b>&nbsp;Click the button above to return to overview view for '+user_branch+'.';
            html += '<br />';
            html += '<br />';
        }

        $('#div_supervisor').html(html);

        if (crew_leaders)
        {
            for(var i=0; i<crew_leaders.length; i++)
            {
                var cl = crew_leaders[i];
                var bgcolor = bgcolors[i];
                var textcolor = textcolors[i];
                if (cl.employee_id == 0)
                {
                    bgcolor = 'white';
                    textcolor = 'black';
                }

                html = '';
                html += '<table style="border: 1px solid black">';
                html += '<tr>';
                html += '<td style="padding: 15px; background-color: '+bgcolor+'; color: '+textcolor+'; font-weight: bold; border-bottom: 1px solid black">'+showEmployeeName(cl.employee_id)+'</td>';
                html += '</tr>';

                var cms = crew_members[cl.employee_id];
                if (cms)
                {
                    for(var ii=0; ii<cms.length; ii++)
                    {
                        var cm = cms[ii];
                        var employee_label = showEmployeeName(cm.employee_id);
                        if (cm.employee_branch != user_branch)
                        {
                            employee_label += ' <font color="#0000AA"><b>['+cm.employee_branch+']</b></font>';
                        }
                        html += '<tr>';
                        html += '<td style="cursor: pointer; padding: 15px" onmouseover="this.style.backgroundColor=\'#00AA00\'" onmouseout="this.style.backgroundColor=\'#FFFFFF\'" onClick="popUpMoveCrewMember('+cm.employee_id+')">'+employee_label+'</td>';
                        html += '</tr>';
                    }
                }
                if (cl.employee_id != 0)
                {
                    html += '<tr>';
                    html += '<td style="padding: 15px"><input type="button" value="Find Crew Member" onClick="getCrewMembersFromAllBranches('+cl.employee_id+')"></td>';
                    html += '</tr>';
                }
                html += '</table>';

                fullhtml += '<td valign="top" style="padding: 5px">'+html+'</td>';
            }
        }
        else
        {
            fullhtml += '<center>[ No Crew Leaders have been assigned.  Contact your Branch Manager and request assignments. ]</center>';
        }
        $('#tr_crewassignments').append(fullhtml);
    }
    
    function popUpMoveCrewMember(employee_id)
    {
        var e = employees[employee_id];

        var pophtml = '';
        pophtml += '<table align="center" style="width: 80%; border: 1px solid black">';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px; border-bottom: 1px solid black; background-color: #purple"><b>Assign Crew Member to Crew Leader</b></td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;">Click/Touch a Supervisor/Crew Leader below to assign '+showEmployeeName(employee_id)+'</td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;"><input type="button" value="Cancel and Go Back" onClick="hidePopup()"></td>';
        pophtml += '</tr>';

        for(var i=0; i<crew_leaders.length; i++)
        {
            var cl = crew_leaders[i];
            var bgcolor = bgcolors[i];
            var textcolor = textcolors[i];
            if (cl.employee_id == 0)
            {
                bgcolor = 'white';
                textcolor = 'black';
            }
            pophtml += '<tr>';
            pophtml += '<td align="center" style="padding: 10px"><div style="cursor: pointer; font-weight: bold; padding: 10px; border: 1px solid black; background-color: '+bgcolor+'; width: 50%; color: '+textcolor+'" onmouseover="this.style.backgroundColor=\'#FFFF00\'; this.style.color = \'black\'" onmouseout="this.style.backgroundColor=\''+bgcolor+'\'; this.style.color = \''+textcolor+'\'" onClick="moveCrewMember('+employee_id+', '+cl.employee_id+')">'+showEmployeeName(cl.employee_id)+'</div></td>';
            pophtml += '</tr>';
        }
        pophtml += '</table>';
        showPopup(pophtml);
    }

    function moveCrewMember(employee_id, crew_leader_id)
    {
        var pophtml = '';
        pophtml = 'Moving crew member... please wait.';
        showPopup(pophtml);
        //alert('Move '+employee_id+' to '+crew_leader_id);

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            dataType: 'json',
            data: { 'ajaxAction': 'moveCrewMember', 'employee_id': employee_id, 'crew_leader_id': crew_leader_id, 'branch': user_branch },
            success: function(data) {
                if (data.error)
                {
                    hidePopup();
                    alert(data.error);
                }
                else
                {
                    getCrewLeadersAndCrewMembers(user_supervisor_id, user_branch);
                }
            }
        });
    }

    function getCrewMembersFromAllBranches(crew_leader_id) {
        showPopup('Loading... please wait.');

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'getCrewMembersFromAllBranches', 'branch': user_branch },
            success: function(data) {
                popUpMoveCrewMemberFromAnyBranch(crew_leader_id, data);
            }
        });
    }

    function getCrewMembersFromOtherBranches(crew_leader_id) {
        showPopup('Loading... please wait.');

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'getCrewMembersFromOtherBranches', 'branch': user_branch },
            success: function(data) {
                popUpMoveCrewMemberFromAnotherBranch(crew_leader_id, data);
            }
        });
    }

    function popUpMoveCrewMemberFromAnyBranch(crew_leader_id, data) {
        var pophtml = '';
        pophtml += '<table align="center" style="width: 80%; border: 1px solid black">';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px; border-bottom: 1px solid black; background-color: #purple"><b>Find Crew Member</b></td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;">Select ONE (1) Crew Member below, then click the corresponding button on the right.</td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;"><input type="button" value="Cancel and Go Back" onClick="hidePopup()"></td>';
        pophtml += '</tr>';

        for(var ii=0; ii<branches.length; ii++)
        {
            var b = branches[ii];
            console.log(ii + '. ' + b);

            pophtml += '<tr>';
            pophtml += '<td align="center" style="padding: 10px">';
            pophtml += '<span style="width: 150px; text-align: right"><b>'+b.name+':</b>&nbsp;&nbsp;</span>';
            pophtml += '<select id="select_employee_id_'+ii+'">';

            for(var i=0; i<data['DATA'].length; i++)
            {
                var cm = data['DATA'][i];
                if (cm[5] == b.name)
                    pophtml += '<option value="'+cm[2]+'">'+cm[1]+' ('+cm[2]+') ['+(cm[3]?'assigned to '+cm[3]:'==UNASSIGNED==')+']</option>';
            }

            pophtml += '</select>';
            pophtml += '&nbsp;&nbsp;<input type="button" value="Assign to '+showEmployeeName(crew_leader_id)+'" onClick="moveCrewMember(document.getElementById(\'select_employee_id_'+ii+'\').value, '+crew_leader_id+')">';
            pophtml += '</td>';
            pophtml += '</tr>';
        }

        pophtml += '</table>';
        showPopup(pophtml);
    }

    function popUpMoveCrewMemberFromAnotherBranch(crew_leader_id, data) {
        var pophtml = '';
        pophtml += '<table align="center" style="width: 80%; border: 1px solid black">';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px; border-bottom: 1px solid black; background-color: #purple"><b>'+showEmployeeName(crew_leader_id)+'</b></td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;">Select ONE (1) crew member below, then click the corresponding button on the right.</td>';
        pophtml += '</tr>';
        pophtml += '<tr>';
        pophtml += '<td align="center" style="padding: 10px;"><input type="button" value="Cancel and Go Back" onClick="hidePopup()"></td>';
        pophtml += '</tr>';

        for(var ii=0; ii<branches.length; ii++)
        {
            var b = branches[ii];
            if (b.name != user_branch)
            {
                pophtml += '<tr>';
                pophtml += '<td align="center" style="padding: 10px">';
                pophtml += '<span style="width: 150px; text-align: right"><b>'+b.name+':</b>&nbsp;&nbsp;</span>';
                pophtml += '<select id="select_employee_id_'+ii+'">';

                for(var i=0; i<data['DATA'].length; i++)
                {
                    var cm = data['DATA'][i];
                    if (cm[5] == b.name)
                        pophtml += '<option value="'+cm[2]+'">'+cm[1]+' ('+cm[2]+') ['+(cm[3]?'assigned to '+cm[3]:'==UNASSIGNED==')+']</option>';
                }

                pophtml += '</select>';
                pophtml += '&nbsp;&nbsp;<input type="button" value="Assign to '+showEmployeeName(crew_leader_id)+'" onClick="moveCrewMember(document.getElementById(\'select_employee_id_'+ii+'\').value, '+crew_leader_id+')">';
                pophtml += '</td>';
                pophtml += '</tr>';
            }
        }

        pophtml += '</table>';
        showPopup(pophtml);
    }

    function showDiagram()
    {
        $('#div_crewassignments').hide();
        $('#div_crews').show();
        $('#btn_showDiagram').hide();
        $('#btn_hideDiagram').show();

        $('#div_crews').html('<center>Loading... please wait.</center>');

        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'getFullCrews' },
            success: function(data) {
                try
                {
                    var obj = data['DATA'];
                    var i;
                    var ob;

                    supervisors = [];
                    crew_leaders = [];
                    crew_members = [];
                    employees = [];
                    unassigned = { employee_name: 'UNASSIGNED', employee_id: 0, crew_leader_id: 0, supervisor_id: 0 };

                    employees[0] = unassigned;
                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        employees[ob[2]] = { employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] };
                    }

                    //crew leader
                    crew_leaders.push(unassigned);
                    for(i=0; i<obj.length; i++)
                    {
                        ob = obj[i];
                        if (ob[0] == 1 || ob[0] == 9 || ob[0] == 10)
                        {
                            if (!supervisors[ob[5]])
                                supervisors[ob[5]] = [];
                            supervisors[ob[5]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4], employee_branch: ob[5] });
                        }
                        else if (ob[0] == 2)
                        {
                            if (!crew_leaders[ob[4]])
                                crew_leaders[ob[4]] = [];
                            crew_leaders[ob[4]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                        }
                        else if (ob[0] == 0 || ob[0] == 6 || ob[0] == 7)
                        {
                            if (!crew_members[ob[3]])
                                crew_members[ob[3]] = [];
                            crew_members[ob[3]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4], employee_branch: ob[5] });
                        }
                    }
                    buildFullCrewsVersion();
                }
                catch(ob)
                {
                    console.log(ob);
                    alert('An error occurred: '+ob);
                }

                hidePopup();
            }
        });
    }

    function buildFullCrewsVersion()
    {
        var fullhtml = '';
        for(var b=0; b<branches.length; b++)
        {
            var html = '';
            html += '<tr>';
            html += '<td><b>'+branches[b].name+'</b></td>';
            html += '<td></td>';
            html += '<td></td>';
            html += '<td></td>';
            html += '</tr>';

            var supervisors_by_branch = supervisors[branches[b].name];
            if (supervisors_by_branch)
            {
                for(var i=0; i<supervisors_by_branch.length; i++)
                {
                    var supervisor = supervisors_by_branch[i];
                    html += '<tr>';
                    html += '<td></td>';
                    html += '<td>'+showEmployeeName(supervisor.employee_id)+'</td>';
                    html += '<td></td>';
                    html += '<td></td>';
                    html += '</tr>';
                    var crew_leaders_by_supervisor = crew_leaders[supervisor.employee_id];
                    if (crew_leaders_by_supervisor)
                    {
                        for(var ii=0; ii<crew_leaders_by_supervisor.length; ii++)
                        {
                            var crew_leader = crew_leaders_by_supervisor[ii];
                            html += '<tr>';
                            html += '<td></td>';
                            html += '<td></td>';
                            html += '<td>'+showEmployeeName(crew_leader.employee_id)+'</td>';
                            html += '<td></td>';
                            html += '</tr>';

                            var crew_members_by_crew_leader = crew_members[crew_leader.employee_id];
                            if (crew_members_by_crew_leader)
                            {
                                for(var iii=0; iii<crew_members_by_crew_leader.length; iii++)
                                {
                                    var crew_member = crew_members_by_crew_leader[iii];
                                    html += '<tr>';
                                    html += '<td></td>';
                                    html += '<td></td>';
                                    html += '<td></td>';
                                    html += '<td>'+showEmployeeName(crew_member.employee_id)+'</td>';
                                    html += '</tr>';
                                }
                            }
                        }
                    }
                }
            }

            fullhtml += html;
        }
        $('#div_crews').html(fullhtml);
    }

    function hideDiagram()
    {
        $('#div_crews').hide();
        $('#div_crewassignments').show();
        $('#btn_hideDiagram').hide();
        $('#btn_showDiagram').show();
    }

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
  </script>
<!--- END OUTPUT --->

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
<script src="/SSL/admin/assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="/SSL/admin/js/twitter-bootstrap-hover-dropdown.js"></script>