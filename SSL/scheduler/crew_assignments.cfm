<!--- get branches for select dropdowns --->
<!---cfdump var="#SESSION#"><cfabort--->

<cfif SESSION.access_role EQ 9 OR SESSION.access_role EQ 10 OR SESSION.access_role EQ 94 OR SESSION.access_role EQ 95 OR SESSION.access_role EQ 96 OR SESSION.access_role EQ 98 OR SESSION.access_role EQ 99>
    <cfset user_is_admin = 1>
    <cfset user_access_role = 9>
<cfelseif SESSION.access_role EQ 1> <!---supervisor--->
    <cfset user_is_admin = 0>
    <cfset user_access_role = 1>
<cfelse>
    Access denied.
    <cfabort>
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

      <div class="row">
        <div class="col-md-12">
            <form method="post">
              <table class="table large">
                <tr>
                  <td nowrap="nowrap" align="right">Choose Branch&nbsp;</td>
                  <td><span id="span_main_branch"></span></td>
                </tr>
              </table>
            </form>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
            <table id="table_crews" align="center">
                <tr id="tr_crews"></tr>
            </table>
        </div>
      </div>
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
    <cfoutput query="get_branches">
        branches.push({ name: '#Replace(branch_name, "'", "\\'", "ALL")#', id: #branch_code# });</cfoutput>

    var supervisors = [];
    var crew_leaders = [];
    var crew_members = [];

    var user_branch = '<cfoutput>#SESSION.branch#</cfoutput>';
    var user_access_role = <cfoutput>#user_access_role#</cfoutput>;
    var user_is_admin = <cfoutput>#user_is_admin#</cfoutput>;

    jQuery(document).ready(function() {
       // initiate layout and plugins
       Metronic.init(); // init metronic core components
       Layout.init(); // init current layout
       Demo.init(); // init demo features
       ComponentsPickers.init();

       populateBranchSelect('main', user_branch);
    });

    function populateBranchSelect(spanId, branch) {
        var html = '';
        var currentBranch = '';
        html += '<select name="'+spanId+'" class="bs-select form-control" onChange="initializeCrews(this.value)">';
        for(var i=0; i<branches.length; i++) {
            var b = branches[i];
            if (b.name == branch)
                currentBranch = branch;
            html += '<option value="'+b.name+'"'+(b.name == branch?' selected':'')+'>'+b.name+'</option>';
        }
        html += '</select>';
        document.getElementById('span_'+spanId+'_branch').innerHTML = html;

        if (!currentBranch)
            currentBranch = branches[0].name;
        initializeCrews(currentBranch);
    }

    function initializeCrews(branch) {
        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            dataType: 'json',
            data: { 'ajaxAction': 'initializeCrews', 'branch': branch, 'access_role': user_access_role },
            success: function(data) {
                try
                {
                    var obj = data['DATA'];
                    var i;
                    var ob;

                    supervisors = [];
                    crew_leaders = [];
                    crew_members = [];

                    switch(user_access_role)
                    {
                        case 9: //branch manager
                            for(i=0; i<obj.length; i++)
                            {
                                ob = obj[i];
                                if (ob[0] == 1)
                                    supervisors.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                                else if (ob[0] == 2)
                                {
                                    if (!crew_leaders[ob[4]])
                                        crew_leaders[ob[4]] = [];
                                    crew_leaders[ob[4]].push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                                }
                            }
                            console.log(supervisors);
                            console.log(crew_leaders);
                            console.log(crew_members);
                            buildBranchManagerVersion();
                            break;
                        case 1: //supervisor
                            for(i=0; i<obj.length; i++)
                            {
                                ob = obj[i];
                                if (ob[0] == 1)
                                    crew_leaders.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                                else if (ob[0] == 2 || ob[0] == 6 || ob[0] == 7)
                                    crew_members.push({ employee_name: ob[1], employee_id: ob[2], crew_leader_id: ob[3], supervisor_id: ob[4] });
                            }
                            buildSupervisorVersion();
                            break;
                    }
                }
                catch(ob)
                {
                    console.log(ob);
                    alert('An error occurred: '+ob);
                }
            }
        });
    }

    function buildBranchManagerVersion()
    {
        $('#tr_crews').html('');

        var fullhtml = '';
        for(var i=0; i<supervisors.length; i++)
        {
            var s = supervisors[i];
            var html = '';
            html += '<table style="border: 1px solid black">';
            html += '<tr>';
            html += '<td style="cursor: pointer; padding: 15px; background-color: #999999; color: #FFFFFF; font-weight: bold; border-bottom: 1px solid black">'+s.employee_name+'</td>';
            html += '</tr>';

            var cl = crew_leaders[s.employee_id];
            if (cl)
            {
                for(var ii=0; ii<cl.length; ii++)
                {
                    var bgcolor = '';
                    if (ii % 2 == 0) bgcolor = '#e5e5e5';
                    var cm = cl[ii];
                    html += '<tr>';
                    html += '<td style="cursor: pointer; padding: 15px; background-color: '+bgcolor+'">'+cm.employee_name+' ('+cm.employee_id+')</td>';
                    html += '</tr>';
                }
            }

            html += '</table>';

            fullhtml += '<td valign="top" style="padding: 5px">'+html+'</td>';
        }
        $('#tr_crews').append(fullhtml);
    }

    function buildSupervisorVersion()
    {

    }

    function saveCrew(id, field, value)
    {
        $.ajax({
            url: 'crew_assignments_ajax.cfm',
            type: 'post',
            data: { 'id': id, 'field': field, 'value': value },
            success: function(data) {
            }
        });
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