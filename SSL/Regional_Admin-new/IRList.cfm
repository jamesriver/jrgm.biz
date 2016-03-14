    <cfdirectory action="list" directory="C:\inetpub\websites\jrgm.biz\forms\photos\incident_reports\" name="incident_reports" recurse="true">
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
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
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->

<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
        <h1>Incident Reports</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Incident Reports</li>
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
					<div class="portlet light ">
        <div class="portlet-body">
<div class="spacerneg20"></div>
        <table class="table table-striped table-hover" id="sample_5">
 <thead> 
<tr> 
   <th><div align="left">Date</div></th>
   <th><div align="center">ID</div></th> 
   <th><div align="left">Time</div></th> 
   <th><div align="left">Nature of Incident</div></th>
   <th><div align="left">Location</th> 
    <th><div align="left">Employee</div></th> 
    <th><div align="left">Postition</div></th>  
    <th><div align="left">Supervisor</div></th>
    <th><div align="left">Branch</div></th>  
     <th><div align="left">Reported To</div></th>
      <th><div align="right">Reported Date</div></th>
      <th><div align="center">Drug Tested</div></th>
      <th><div align="left">Ins Claim</div></th>
      <th><div align="right">Cost of Damage</div></th>
      <th><div align="right">Employee Fined / Amt</div></th>
      <th><div align="right">Status</div></th>
      <th><div align="right">Full Report</div></th>
      <th><div align="center">PDF</div></th>
       </tr> 
</thead> 

<cfquery name="get_IR_List" datasource="jrgm"  > 
SELECT  * FROM Form_IncidentReport   ORDER  by  incidentRpt_Date DESC
 </cfquery>
 <tbody>  
<cfoutput query="get_IR_List">  
<tr>
    
	<td nowrap="nowrap">#DateFormat("#incidentRpt_Date#", "mm/dd/yyyy")#</td>
    <td><div align="left">#IR_ID#</div></td>
    <td><div align="left">#IncidentTime#</div></td>
    <td><div align="left">#DamegeDesc#</div></td>
    <td><div align="left">#Location#</div></td>
    <td><div align="left">#Employee#</div></td>
    <td><div align="left">#Position#</div></td>    
    <td><div align="left">#Supervisor#</div></td>
    <td><div align="left">#Branch#</div></td>  
    <td><div align="left">#ReportedTo#</div></td>
    <td nowrap="nowrap">#DateFormat("#ReportedDate#", "mm/dd/yyyy")#</td>
    <td><div align="center">#BO_DrugTest#</div></td>
    <td><div align="left">#InsuranceInfo#</div></td>
    <td><div align="right">#BO_FinalLoss#</div></td>
    <td><div align="right">#BO_IsFine#</div></td>
    <td><div align="right">#BO_Status#</div></td>
    <td><div align="center"><a href="http://www.jrgm.biz/forms/incidentreport_bo.php?id=#IR_ID#" target="_blank">View</a></div></td>
  <cfquery name="incident_reports" dbtype="query">
    SELECT   * 
    from incident_reports
   WHERE name LIKE '#IR_ID#%'
</cfquery>
<cfif  incident_reports.recordcount GT 0>
  <td><div align="right">
         <a href="http://www.jrgm.biz/forms/photos/incident_reports/#IR_ID#.pdf">  <img src="assets/admin/layout3/img/pdf_file.png" width="24" height="24" /> </a>
     </div></td>
     <cfelse>
       <td><div align="center"> - </div></td>
     </cfif>
 </tr>
 </cfoutput>
  </tbody>
</table>
            </div>
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
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
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
<script>
jQuery(document).ready(function() {  
      
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script>
</body>
<!-- END BODY -->
</html>