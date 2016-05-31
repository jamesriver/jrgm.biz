<!--- BEGIN REWRITING SCRIPT --->

<!--- get employees for select dropdowns --->
<cfquery name="get_employees" datasource="jrgm"  >
    SELECT ae.Last_name, ae.First_name, [Employee ID] as employee_id, ae.branch, ar.name as position FROM app_employees ae
    LEFT JOIN app_employee_passwords ac ON ac.employee_id=ae.[Employee ID]
    LEFT JOIN access_roles ar ON ar.access_role_id=ac.access_role
    WHERE ae.active_record=1
    GROUP BY ae.Last_name, ae.First_name, [Employee ID], ae.branch, ar.name
    ORDER by ae.Last_name ASC,ae.first_name ASC
</cfquery>

<!--- get branches for select dropdowns --->
<cfquery name="get_branches" datasource="jrgm"  >
    SELECT * FROM branches
    <cfif SESSION.branch EQ 'test'>
        WHERE branch_code=100
    <cfelse>
        WHERE branch_active=1 AND branch_visible_to_select=1
    </cfif>
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
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
<!-- END THEME STYLES -->
<link href="css/styles_ds.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
</head>
<body>
<cfinclude template="includes/subbar.cfm">
<!---    <cfinclude template="includes/topbar_ds.cfm">--->

<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> <br>
<br>
<br>

      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Create a Daily Sheet</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_listing.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Create a Daily Sheet</li>
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
        <div class="col-md-6">
            <form method="post">
              <table class="table large">
                <tr>
                  <td align="right">Enter Daily Sheet Date</td>
                  <td><input class="form-control form-control-inline input-medium date-picker"  type="text" name="ds_date" /></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap" align="right">Choose Production Manager&nbsp;</td>
                  <td><span id="span_Supervisor_ID"></span></td>
                  <td><span id="span_Supervisor_ID_branch"></span></td>
                </tr>
                <tr>
                  <td nowrap="nowrap" align="right">Choose Supervisor / Crew Leader</td>
                  <td><span id="span_Crew_Leader_ID"></span></td>
                  <td><span id="span_Crew_Leader_ID_branch"></span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="right"><br />
                  <td align="right"><br />
                    <input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" /></td>
                </tr>
                <tr>
                  <td colspan="3"><span class="text-danger">All 3 fields are required</span></td>
                </tr>
              </table>
            </form>
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
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 
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
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 

<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/components-pickers.js"></script> 
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    var employees = [];
    <cfoutput query="get_employees">
        <cfset employee_name = Last_Name & ', ' & First_Name>employees.push({ name: '#Replace(employee_name, "'", "\\'", "ALL")#', id: #employee_id#, position: '#Replace(position, "'", "\\'", "ALL")#', branch: '#branch#' });
    </cfoutput>

    var branches = [];
    <cfoutput query="get_branches">
        branches.push({ name: '#Replace(branch_name, "'", "\\'", "ALL")#', id: #branch_code# });</cfoutput>

    jQuery(document).ready(function() {
       // initiate layout and plugins
       Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
       ComponentsPickers.init();

       populateBranchSelect('Supervisor_ID', '<cfoutput>#SESSION.branch#</cfoutput>');
       populateBranchSelect('Crew_Leader_ID', '<cfoutput>#SESSION.branch#</cfoutput>');

       populateEmployeeSelect('Supervisor_ID', '<cfoutput>#SESSION.branch#</cfoutput>');
       populateEmployeeSelect('Crew_Leader_ID', '<cfoutput>#SESSION.branch#</cfoutput>');
    });

    function populateBranchSelect(spanId, branch) {
        var html = '';
        html += '<select name="'+spanId+'" class="bs-select form-control" onChange="populateEmployeeSelect(\''+spanId+'\', this.value)">';
        for(var i=0; i<branches.length; i++) {
            var b = branches[i];
            html += '<option value="'+b.name+'"'+(b.name == branch?' selected':'')+'>'+b.name+'</option>';
        }
        html += '</select>';
        document.getElementById('span_'+spanId+'_branch').innerHTML = html;
    }

    function populateEmployeeSelect(spanId, branch) {
        var html = '';
        html += '<select name="'+spanId+'" class="bs-select form-control">';
        for(var i=0; i<employees.length; i++) {
            var e = employees[i];
            if (e.branch == branch)
                html += '<option value="'+e.id+'">'+e.name+(e.position?' ('+e.position+')':'')+'</option>';
        }
        html += '</select>';
        document.getElementById('span_'+spanId).innerHTML = html;
    }
</script>
</body>
<!-- END BODY -->
</html>