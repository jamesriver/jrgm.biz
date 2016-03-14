<cfif  NOT IsDefined("form.BRANCH_NAME")>
  <cfparam name=" form.BRANCH_NAME" default="choose" >
</cfif>
 
  <cfif IsDefined("form.BRANCH_NAME") AND   IsDefined("form.Job_ID") >
 <cflocation url="job_labor_materials.cfm?job_id=#form.Job_ID#">
 </cfif>
<cfif IsDefined("form.BRANCH_NAME") AND  form.BRANCH_NAME NEQ 'Choose' >
  <cfquery name="get_branch_jobs" datasource="jrgm"  >
SELECT [Job ID] AS job_id, [Wk Loc ID], [Wk Location Name] AS job_name, [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],  
                  active_record,  branch
FROM         app_jobs_all
WHERE branch =  '#form.BRANCH_NAME#'   
 ORDER by  job_name ASC
</cfquery>
</cfif>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
<!---<link href="css/styles.css" rel="stylesheet" type="text/css">--->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
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

  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
        <h1>Job Materials & Labor Detail - Select Branch</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">JRGM Quote List</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <div class="page-content">
    <div class="container-fluid">
    	<div class="row">
		<div class="col-md-12">
                <form class="css_form"  action="select_branch_j.cfm"  method="post">
          <table class="table large"   >
        
             <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME EQ 'Choose' > 
             <tr>
              <td nowrap="nowrap" align="right">Choose Branch:</td>
              <td>
                  <select name="BRANCH_NAME"  class="bs-select form-control"  onchange='this.form.submit()'>
                    <option value="Choose"   
<cfif  form.BRANCH_NAME EQ 'Choose'> selected="selected"</cfif>>Choose Branch</option>
                    <option value="Charlottesville"   
<cfif  form.BRANCH_NAME EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <option value="Chesterfield"   
<cfif  form.BRANCH_NAME EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <option value="Newport News"   
<cfif  form.BRANCH_NAME EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth"   
<cfif  form.BRANCH_NAME EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond"   
<cfif  form.BRANCH_NAME EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                    <option value="Williamsburg"   
<cfif  form.BRANCH_NAME EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
                  </select>
                </td>
                <td  width="800"> </td>
            </tr>
        <cfelse>
             <tr>
              <td nowrap="nowrap" align="right">Branch:  </td>
              <td><cfoutput># form.BRANCH_NAME#</cfoutput></td>
            </tr>
            </cfif>
          
            
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME NEQ 'Choose' >
              <tr>
                <td nowrap="nowrap"  align="right">Choose Job: </td>
                <td>
                    <select name="Job_ID"  class="bs-select form-control">
                      <cfoutput query="get_branch_jobs">
                        <option value="#Job_ID#" 
		   <cfif IsDefined("form.Job_ID") AND form.Job_ID EQ #Job_ID#>selected="selected"</cfif>>#job_name# </option>
                      </cfoutput>
                    </select>
                  </td>
              </tr>
               <tr>
                <td></td>
                <td align="left"><br />
                  <input type="hidden"  name="submitted" value="yes"/>
      <input type="submit" value="Get Job Information" name="submit" class="btn btn-primary">
                 </td>
              </tr>
            </cfif>
          </table>
        </form>
     </div>
     <div class="col-md-6">
     
     <cfif IsDefined("form.branch")>
     <div align="center"><a href="select_branch_j.cfm" class="btn btn-primary">Choose Another Branch or Job</a></div>
     </cfif>
     </div>
     
     </div>
    <!--Html-->
    </div> 
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