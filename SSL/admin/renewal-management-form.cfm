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
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
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
        <h1>Create a Renewal Management Form </h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a>  /  </li>
        <li class="active">Create a Renewal Management Form</li>
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
   
         <form action="renewal-management-add.cfm" method="post">
          <table class="table large">
           <tr>
              <td align="right">Project ID</td>
              <td><input type="text" tabindex="1" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter Project ID" name="mf_ProjID" /></td>
            </tr>
             <tr>
              <td align="right">Project Name</td>
               <td><input type="text" tabindex="2" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter Project Name" name="mf_ProjName" />
              </td>
            </tr>
             <tr>
              <td align="right">Branch</td>
               <td><input type="text" tabindex="3" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter Branch Name" name="mf_Branch" />
              </td>
            </tr>
            <tr>
              <td align="right">Start Date</td>
              <td><input tabindex="4" class="form-control form-control-inline input-medium date-picker" type="text" name="mfs_date" />
              </td>
            </tr>
            <tr>
              <td align="right">End Date</td>
              <td><input tabindex="5" class="form-control form-control-inline input-medium date-picker" type="text" name="mfe_date" />
              </td>
            </tr>
            <tr>
              <td align="right">Responsible User</td>
               <td><input type="text" tabindex="6" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter Responsible User" name="mf_RU" />
              </td>
            </tr>
             <tr>
              <td align="right">Project Value</td>
               <td><input type="text" tabindex="7" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter the Project Value" name="mf_ProjValue" />
              </td>
            </tr>
            <tr>
              <td align="right">Project Status</td>
               <td><input type="text" tabindex="8" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter the Project Status" name="mf_ProjStatus" />
              </td>
            </tr>
             <tr>
              <td align="right">Renewal Lead</td>
               <td><input type="text" tabindex="9" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter the Renewal Lead" name="mf_RenewalLead" />
              </td>
            </tr>
            <tr>
              <td align="right">% Increase Requested</td>
               <td><input type="text" tabindex="10" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Enter the Percent Increase Requested" name="mf_PercentReq" />
              </td>
            </tr>
            <tr>
              <td align="right">Hold Billing</td>
               <td><input type="text" tabindex="11" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Hold Billing" name="mf_HoldBilling" />
              </td>
            </tr>
             <tr>
              <td align="right">Renewal Notes</td>
               <td><input type="text" tabindex="12" size="4" maxlength="4" class="form-control input-inline input-medium" placeholder="Renewal Notes" name="mf_RenewalNotes" />
              </td>
            </tr>
            <tr>
              <td></td>
              <td><a class="btn btn-success btn-sm" href="#">Create Project</a></td>
            </tr>
            
            <tr>
              <td>&nbsp;</td>
              <td align="right"><br />
<input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" /></td>
            </tr>
          </table>
        </form>
         
           
  </div>
</div>
</div></div></div>
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
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {  
 		
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script>

</body></html>

