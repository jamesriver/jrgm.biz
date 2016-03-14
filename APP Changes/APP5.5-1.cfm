<!doctype html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>JRGM APP 5.5 Verison 1 Issues</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="../assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="../assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="../assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="../assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="../assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="../favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
 <div class="page-content">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-12"> 
<table class="table table-striped table-bordered table-hover" id="sample_1">
  <tbody>
    
    <tr>
      <td  width="450" ><p><strong>Issue 1:&nbsp; APP letting me by pass accounting for all service time.<br>
        </strong><br>
        I did just  re-create the same issue that I mentioned to you guys before.&nbsp; Here is  what I did...</p>
        <p>I was at the  apply service code screen.&nbsp; I applied time for 1/2 the crew and then  navigated away from the app (like I did accidentally before).&nbsp; It had me  log back in and it put me to the log in screen with no way of going back to  that job and allocating the rest of the time.&nbsp; It seems that we must have  it go right back to that same screen or we have a very big hole</p></td>
      <td ><ol>
        <li>Start Job</li>
        <li>End Job</li>
        <li>Enter time for some employees but not all or don't enter any time at all</li>
        <li>Leave the APP or Turn off the tablet</li>
        <li>Turn tablet back on and Log back in</li>
      </ol>
        <p>When I come back to the APP it lets me proceed without accounting for all of the service time. This must be a change in this version because I think in the current production version even if you log out or turn the APP off when you log back in it forces you to enter all service time for all employees before proceeding. We need to put in a check that makes sure that all time is accounted for</p>
        <p>&nbsp;</p></td>
    </tr>
    
    <tr>
      <td width="450" ><strong>Issue 2: Employee Service info not being recorded in data tables</strong><br>
        <br>
        <br>
      See this <a href="Screenshots/JRGM _ Daily Sheet 32722.pdf">daily sheet </a></td>
      <td > On this daily sheet the crew leader worked 6 jobs and <strong>did enter service time for each job</strong> but somehow it wasn't recorded&nbsp;in the database.<br>
        <br>
        The jobs show up in the <strong>app_job_clock table</strong> but the service time he entered doesn't show up in the <strong>app_job_services_clock table</strong> or the <strong>app_job_services_actual_employee table.</strong></p>
        <p>How is this possible?</p>
        <p>Maybe if you get issue 1 resolved it will solve this issue.<br>
      </p></td>
    </tr>
    
    <tr>
      <td width="450"><strong>Issue 3: The services are difficult to choose. <br>
        <br>
        Sometimes I need to tap several times before it selects. </strong> <br>
        <br>
        Is there somewhere special I need to tap on? Is there a way to make this easier to tap on/select?<br>
        <br>
        7000 Snow Services is particularly hard to select
     </td>
      <td><img src="Screenshots/Screenshots JRGM 10212015/1307 1308 reversed.png" width="512" height="300" alt=""/></td>
    </tr>
    
    <tr>
      <td><p><strong>Issue 4:  Add another service under <br>
        2000 Enhancement named <br>
        <br>
        2003-Plant Replacement (Warranty)<br>
      </strong></p>
      <p><strong>I thought this was done??</strong></p></td>
      <td><img src="Screenshots/Screenshots JRGM 10212015/2003.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2"></td>
    </tr>
    <tr>
      <td   width="450"><p class="redfont"><strong>Change 3: Weekly equipment maintenance form needs to fit the screen</strong></p>
        <p>The  weekly equipment maintenance form on my tablet could be pulled in a bit on the  sides so that you can still see the equipment name / id while you are checking  boxes.&nbsp; I think that's a minor tweak and there seems to be enough space  between the columns to do this.</p>
<p class="redfont">&nbsp;</p></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/Screenshot_eq maintenance form.png" width="512" height="300" alt=""/></td>
    </tr>
   
    <tr>
      <td class="redfont"  width="450"><strong>Change 4: Lengthen materials select list</strong>.<br>
        <span style="color: #000000">See how the material name gets cut off? <br>
        <br>
        Can we lengthen this so that the entire material name shows?</span></td>
      <td >&nbsp;<img src="Screenshots/Screenshots JRGM 10212015/Screenshot_materials.png" width="512" height="300" alt=""/></td>
    </tr>
  
    <tr>
      <td class="redfont" ><p><strong>Change 5:&nbsp;What is this message?</strong><br>
        I get it when I enter more time than is available. <br>
        <br>
        Can you make this message say this?<br>
        <br>
        Employee Name incorrect time entered.</p>
        <p>So in this case it would&nbsp; say Matthew Davis incorrect time entered.</p>
        <p>&nbsp;</p></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/sufficien_time.png" width="512" height="300" alt=""/></td>
    </tr>
   
  </tbody>
</table>

        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 

<!-- BEGIN FOOTER --> 
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
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="../assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="../assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="../assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="../assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {        
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
   TableAdvanced.init();
});
</script>




</body>
<!-- END BODY -->
</html>