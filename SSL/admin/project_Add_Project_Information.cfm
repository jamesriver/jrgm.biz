<cfif IsDefined("url.z")><CFSET jobname=url.z><cfelse> <CFSET jobname=""></cfif>

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
</style>
</head>
<body >
<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Project Management  -Manage Project Information&nbsp; </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">Project Management / </li>
          <li class="active">Manage Project Information</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
<table width="90%" border="0" align="center">
        <tbody>
          <tr>
            <td><p><strong>Most of this data will come from the app_jobs once the changes from app_new table are in place! <br />
              This is static info. </strong></p>
              <p><strong>There will be a viewable version and editable version (for some users and for certain information) of this screen<br />
            </strong></p></td>
          </tr>
        </tbody>
      </table><br />


      <table class="table"  >
        <tbody>
          <tr>
            <td><h2><cfoutput>#jobname#</cfoutput></h2>
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td colspan="2"><strong>PROJECT DETAILS</strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><strong>CUSTOMER</strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">Project ID </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Client Contact:</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td   colspan="2">Branch</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Client Phone 1</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td   colspan="2">Project Status</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Client Phone 2</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td   colspan="2">Start Date</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Client Email</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td   colspan="2">End Date</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2"><strong>Work Location</strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><strong>Bill To Information</strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">Address 1&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Address 1</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">Address 2&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Address 2</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">City, State, Zip</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;City, State, Zip</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="155" colspan="2">Total Project Amount</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;Billing Schedule (monthly, annual,    quarterly?) # installments?</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td colspan="6"><strong>STAFF ASSIGNMENTS </strong></td>
                  </tr>
                  <tr>
                    <td>Branch Manager</td>
                    <td colspan="5">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>Production Manager</td>
                    <td colspan="5">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>Crew Leader</td>
                    <td colspan="5">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>T&amp;O Specialist<br /></td>
                    <td colspan="5">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="155">Irrigation Technician</td>
                    <td colspan="5">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td colspan="5"><strong>REVENUE: </strong></td>
                  </tr>
                  <tr>
                    <td colspan="5">Provide list of all sales invoices coded to project. <strong>&nbsp;&nbsp;<span style="color: #F40A0A"> <br />
                    </span></strong>
                      <p>Data that we need could be retrieved via an API call if you use Javascript/jQuery AJAX.  This will be particularly useful for invoices and any other data that only exists in Intacct or Insightly (because they're best managed inside of those systems directly).</p>
                      <p></p>
                   </td>
                  </tr>
                  <tr>
                    <td>INV #</td>
                    <td>Date</td>
                    <td>Amount</td>
                    <td>Due Date</td>
                    <td>Paid / Unpaid</td>
                  </tr>
                  <tr>
                    <td>INV 4567</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td colspan="6"><strong> PROJECT LABOR:&nbsp; Info from daily sheets</strong></td>
                  </tr>
                  <tr>
                    <td colspan="6">List view with drill down on labor usage,</td>
                  </tr>
                  <tr>
                    <td>Date</td>
                    <td>DSID</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td colspan="6"><strong> PROJECT MATERIALS: Info from daily sheets</strong></td>
                  </tr>
                  <tr>
                    <td colspan="6">List view with drill down on material usage</td>
                  </tr>
                  <tr>
                    <td>Date</td>
                    <td>DSID</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td><strong>JOB COSTING : </strong></td>
                  </tr>
                  <tr>
                    <td>This is where we provide some basic P&L updates and  comparisons with quote</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td><strong>LINKS :</strong></td>
                  </tr>
                  <tr>
                    <td><ul>
                        <li>Link to executed contract</li>
                        <li> Link to original quote</li>
                        <li> Link to spec sheet</li>
                        <li> Link to insightly project record? (For registered users)</li>
                        <li> Link to intact project? (For registered users)</li>
                      </ul></td>
                  </tr>
                </tbody>
              </table>
               <br />
              <table width="90%" border="1">
                <tbody>
                  <tr>
                    <td><strong>NOTES :&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                        <input type="submit" name="submit" id="submit" value="Add Notes" />
                    </strong></td>
                  </tr>
                  <tr>
                    <td>Project Notes</td>
                  </tr>
                </tbody>
              </table>
              <br /></td>
          </tr>
        </tbody>
      </table>
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
