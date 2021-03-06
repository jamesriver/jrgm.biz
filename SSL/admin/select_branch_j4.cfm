

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>James River Grounds Management</title>
<meta http-equiv="X-UA-Compaftible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets2/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets2/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets2/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets2/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets2/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets2/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.redtype {
	color: #F00;
}
table.sortable7 {
	background: #FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable7 thead {
	padding: 10px;
	background-color: #cde3fc;
	color: #000;
	cursor: default;
	font: bold .9em Arial, Helvetica, sans-serif;
}
table.sortable7 thead th {
	padding: 10px;
	background-color: #cde3fc;
	color: 000;
	font: bold 1em Arial, Helvetica, sans-serif;
}
table.sortable7 tbody tr {
	border: 1px solid #b3d4e5;
	padding: 5px;
}
table.sortable7 tbody tr.alt {
	background: #ffffff url(../images/tralt-bg.jpg) top left repeat-x;
}
table.sortable7 tbody tr:hover {
	background: #cde3fc none;
}
table.sortable7 tbody td {
	padding: 10px;
	font: normal .95em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable7 tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable7 tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
li {
	font: bold 1.2em Arial, Helvetica, sans-serif;
	padding: 2px;
}
</style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body >
<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>

<!-- BEGIN PAGE CONTENT -->
<div class="page-content">
  <div class="container-fluid"><br />
    <table border="1"   cellpadding="10"  width="50%">
      <tbody>
        <tr>
          <td align="center"><strong>Labor Reports</strong></td>
          <td  align="center"><strong>Material Reports <br />
          (These are not ready yet)</strong></td>
        </tr>
        <tr>
          <td align="center"  width="50%"><a href="job_labor_4.cfm?BRANCH_NAME=Charlottesville">Charlottesville</a></td>
          <td align="center"  width="50%"><a href="job_materials_4.cfm?BRANCH_NAME=Charlottesville">Charlottesville</a></td>
        </tr>
        <tr>
          <td  align="center"><a href="job_labor_4.cfm?BRANCH_NAME=Chesterfield">Chesterfield</a></td>
          <td  align="center"><a href="job_materials_4.cfm?BRANCH_NAME=Chesterfield">Chesterfield</a></td>
        </tr>
        <tr>
          <td  align="center"><a href="job_labor_4.cfm?BRANCH_NAME=Newport News">Newport News</a></td>
          <td  align="center"><a href="job_materials_4.cfm?BRANCH_NAME=Newport News">Newport News</a></td>
        </tr>
        <tr>
          <td  align="center"><a href="job_labor_4.cfm?BRANCH_NAME=Portsmouth">Portsmouth</a></td>
          <td align="center"><a href="job_materials_4.cfm?BRANCH_NAME=Portsmouth">Portsmouth</a></td>
        </tr>
        <tr>
          <td align="center"><a href="job_labor_4.cfm?BRANCH_NAME=Richmond">Richmond</a></td>
          <td align="center"><a href="job_materials_4.cfm?BRANCH_NAME=Richmond">Richmond</a></td>
        </tr>
      </tbody>
    </table>
    <br />
    <br />
  </div>
</div>
</div>
</div>
</div>
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/table-advanced.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script> 
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
</html>
