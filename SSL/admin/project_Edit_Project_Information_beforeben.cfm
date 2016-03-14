<!--- contract_installments, last_quote_id--->

<cfset has_active_intacct_project = false>
<!---cfhttp here later--->
<cfset incoming_api_result = 1>
<cfif incoming_api_result eq 1>
  <cfset has_active_intacct_project = true>
</cfif>
<cfset todayDate = Now()>
<cfif   IsDefined("form.BUTTON")  AND  form.BUTTON EQ 'Submit'>
  <CFQUERY name="update_app_jobs_new" datasource="#request.dsn#">
UPDATE app_jobs_new SET 
billing_contact_name =  <cfqueryparam value="#Form.billing_contact_name#"     CFSQLType="CF_SQL_VARCHAR"> ,
billing_contact_phone =  <cfqueryparam value="#Form.billing_contact_phone#"     CFSQLType="CF_SQL_VARCHAR"> ,
<!---billing_contact_phone2 =  <cfqueryparam value="#Form.billing_contact_phone2#"     CFSQLType="CF_SQL_VARCHAR">,--->
[Service Address] =   <cfqueryparam value="#Form.project_work_location_address#"     CFSQLType="CF_SQL_VARCHAR">,
billto_company_name =   <cfqueryparam value="#Form.billto_company_name#"     CFSQLType="CF_SQL_VARCHAR">,
billing_contact_email_address  =   <cfqueryparam value="#Form.billing_contact_email_address#"     CFSQLType="CF_SQL_VARCHAR">,
project_type  =   <cfqueryparam value="#Form.project_type#"     CFSQLType="CF_SQL_VARCHAR">,
branch =   <cfqueryparam value="#Form.branch#"     CFSQLType="CF_SQL_VARCHAR">,
[Service State] =   <cfqueryparam value="#Form.project_work_location_state#"     CFSQLType="CF_SQL_VARCHAR">,
billing_state =   <cfqueryparam value="#Form.billing_state#"     CFSQLType="CF_SQL_VARCHAR">,
[Service City] = <cfqueryparam value="#Form.project_work_location_city#"     CFSQLType="CF_SQL_VARCHAR">,
 billing_address2=   <cfqueryparam value="#Form.billing_address2#"     CFSQLType="CF_SQL_VARCHAR">,
 billing_city =   <cfqueryparam value="#Form.billing_city#"     CFSQLType="CF_SQL_VARCHAR">,
 billing_address  =   <cfqueryparam value="#Form.billing_address#"     CFSQLType="CF_SQL_VARCHAR">,
[Service Zip]  =   <cfqueryparam value="#Form.project_work_location_zip#"     CFSQLType="CF_SQL_VARCHAR">,
 billing_zip  =   <cfqueryparam value="#Form.billing_zip#"     CFSQLType="CF_SQL_VARCHAR">,
 [Service Address2]   =   <cfqueryparam value="#Form.project_work_location_address2#"     CFSQLType="CF_SQL_VARCHAR">,
 active_record =   '#Form.active_record#'   ,
last_modified_date  =  '#Form.last_modified_date#' ,
 last_modified_date =     <cfqueryparam value="#DateFormat(todayDate, "mm/dd/yyyy")#"    CFSQLType="CF_SQL_DATE" >

    WHERE  [Job ID]  = '#form.projectid#'
    </CFQUERY>
 
</cfif>
<cfif IsDefined("url.ProjectID")>
  <CFSET ProjectID=url.ProjectID>
  <cfelseif IsDefined("form.ProjectID")>
  <CFSET ProjectID=form.ProjectID>
  <cfelse>
  <CFSET jobname="">
</cfif>
<cfquery name="get_project_info" datasource="jrgm">   
SELECT       ID, [Job ID] AS ProjectID, [Wk Loc ID], [Wk Location Name] AS projectname, [Service Address] as project_work_location_address, [Service Address2]   AS project_work_location_address2, [Service City] as project_work_location_city, [Service State] as project_work_location_state, [Service Zip] as project_work_location_zip, project_type,
                       active_record, branch, Responsible_User_Employee_ID, Supervisor_ID, Spray_Tech_ID, Irrigation_Tech_ID, Status, irrigation, 
                      sales_contact_Employee_ID, billing_contact_name, billing_contact_phone, billing_contact_email_address, billing_address, billing_address2, billing_city, 
                      billing_state, billing_zip, project_start_date, project_end_date, total_project_value, irrigation_services_included, department, last_modified_date, last_modified_by, 
                      last_modified_date, billto_company_name,contract_installments, last_quote_id
FROM         app_jobs_new  WHERE [Job ID] ='#ProjectID#'
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>James River Grounds Management</title>
<meta http-equiv="X-UA-Compaftible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets2/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets2/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets2/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets2/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets2/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets2/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets2/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />
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
.blue-madison {
	color: #FFFFFF;
	background-color: #578ebe;
	border-color: "";
}
.table.large {
	margin-left: 10px;
	margin-bottom: 20px;
	width: 95%;
}
.table.large thead > tr > th {
	padding: 5px 6px;
	font-size: 12px;
	font-weight: 600;
	color: #00472e;
}
.table.large tbody > tr > td {
	padding: 5px 6px;
	font-size: 12px;
}
.form-horizontal .form-group input, .form-horizontal .form-group select, .form-horizontal .form-group label {
	height: 0px;
	line-height: 0px;
}
input {
	width: 265px;
	padding: 4px;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box;    /* Firefox, other Gecko */
	box-sizing: border-box;         /* Opera/IE 8+ */
	border: 1px solid #e5e5e5;
	-webkit-box-shadow: none;
	box-shadow: none;
	-webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
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
        <h1>Project Management - Edit Project Information</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">Project Management / </li>
          <li> <a href="project_list.cfm"  class="redtype">Go to Project List</a></li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
      <form action="project_Edit_Project_Information.cfm" method="post"  >
        <cfoutput  query="get_project_info" maxrows="1">
          <table class="table large" >
          <tbody>
          <tr>
          <td>
          <h2>#projectname#</h2>
          <table width="90%" border="1">
            <tbody>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> PROJECT DETAILS </td>
                <td   colspan="2" nowrap="nowrap"  class="blue-madison"> CUSTOMER </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project ID </td>
                <td width="300" nowrap="nowrap">#ProjectID#</td>
                <td>Bill To Company</td>
                <td><input name="billto_company_name" type="text"  value="#get_project_info.billto_company_name#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Branch</td>
                <td width="300" nowrap="nowrap"><select name="branch"   tabindex="5" >
                    <option value="Charlottesville" <cfif get_project_info.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <option value="Chesterfield" <cfif get_project_info.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <option value="Newport News" <cfif get_project_info.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth" <cfif get_project_info.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond" <cfif get_project_info.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                  </select></td>
                <td>Billing Contact</td>
                <td><input name="billing_contact_name" type="text"  value="#get_project_info.billing_contact_name#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project Status</td>
                <td width="300" nowrap="nowrap">#Status#</td>
                <td>Billing Contact Phone 1</td>
                <td><input name="billing_contact_phone" type="text"   value="#get_project_info.billing_contact_phone#"   /></td>
              </tr>
              <tr>
                <td colspan="2" nowrap="nowrap">Allow this project to automatically deactivate after the end date<input type="checkbox" name="checkbox" id="checkbox"  align="left"/>
                </td>
                <td nowrap="nowrap">Billing Contact  Email Address</td>
                <td><input name="billing_contact_email_address" type="text"  value="#get_project_info.billing_contact_email_address#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project Type</td>
                <td width="300" nowrap="nowrap"><input name="project_type" type="text"  value="#get_project_info.project_type#"   /></td>
                <td nowrap="nowrap">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Active/Inactive</td>
                <td><select name="active_record"    >
                    <option value="0" <cfif get_project_info.active_record EQ '0'> selected="selected"</cfif>>Inactive</option>
                    <option value="1" <cfif get_project_info.active_record EQ '1'> selected="selected"</cfif>>Active</option>
                  </select></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Total Project Amount</td>
                <td nowrap="nowrap">#total_project_value#</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Start Date</td>
                <td width="300" nowrap="nowrap">#DateFormat(project_start_date, "mm/dd/yyyy")#</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">End Date</td>
                <td width="300" nowrap="nowrap">#DateFormat(project_end_date, "mm/dd/yyyy")#</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>## Installments</td>
                <td>#contract_installments#</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>Last Quote ID</td>
                <td>#last_quote_id#</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> WORK LOCATION </td>
                <td   colspan="2" nowrap="nowrap"  class="blue-madison"> BILL TO INFORMATION </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Address 1 </td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_address" type="text" value="#get_project_info.project_work_location_address#"   /></td>
                <td>Billing Address</td>
                <td><input name="billing_address" type="text" value="#get_project_info.billing_address#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Address 2 </td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_address2" type="text"  value="#get_project_info.project_work_location_address2#"   /></td>
                <td>Billing Address2</td>
                <td><input name="billing_address2" type="text"  value="#get_project_info.billing_address2#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">City</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_city" type="text"  value="#get_project_info.project_work_location_city#"   /></td>
                <td>Billing City </td>
                <td><input name="billing_city" type="text"  value="#get_project_info.billing_city#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">State</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_state" type="text"  value="#get_project_info.project_work_location_state#"   /></td>
                <td>Billing State</td>
                <td><input name="billing_state" type="text"  value="#get_project_info.billing_state#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Zip</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_zip" type="text"  value="#get_project_info.project_work_location_zip#"   /></td>
                <td>Billing Zip</td>
                <td><input name="billing_zip" type="text"  value="#get_project_info.billing_zip#"   /></td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td width="300" nowrap="nowrap">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Date Last Modified</td>
                <td width="300" nowrap="nowrap">#DateFormat(last_modified_date, "mm/dd/yyyy")#</td>
                <td>Modified By</td>
                <cfif get_project_info.last_modified_by EQ "">
                  <td>&nbsp;</td>
                  <cfelse>
                  <cfquery name="get_lm" datasource="jrgm">
             SELECT       [Employee ID], [Name FirstLast] AS last_mod_person, First_name, Last_name,   email 
            FROM app_employees WHERE   [Employee ID] = #get_project_info.last_modified_by#
              </cfquery>
                  <td>#get_lm.last_mod_person#</td>
                </cfif>
              </tr>
            </tbody>
          </table>
          <br />
          <table width="90%" border="1">
            <tbody>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> STAFF ASSIGNMENTS&nbsp;<br />
                  (Will these be branch level positions be edited here or at the Branch Level with the new scheduler?)</td>
              </tr>
              <cfif get_project_info.sales_contact_Employee_ID EQ "">
                <tr>
                  <td>Sales Contact</td>
                  <td colspan="5"><!---Need Info---></td>
                </tr>
                <cfelse>
                <cfquery name="get_sc" datasource="jrgm">
             SELECT       [Employee ID], [Name FirstLast] AS Sales_Contact, First_name, Last_name,   email,  
            FROM app_employees WHERE  Employee_ID = #sales_contact_Employee_ID#
              </cfquery>
                <tr>
                  <td>Sales Contact</td>
                  <td colspan="5">#get_sc.Sales_Contact# - #sales_contact_Employee_ID#</td>
                </tr>
              </cfif>
              <cfquery name="get_bm" datasource="jrgm">
              SELECT crew_name AS BM_Name FROM app_crews WHERE  Employee_branch = '#get_project_info.branch#'  AND   Employee_Position_ID =9
              </cfquery>
              <tr>
                <td>Branch Manager</td>
                <td colspan="5">#get_bm.BM_Name#</td>
              </tr>
              <cfif get_project_info.Responsible_User_Employee_ID EQ "">
                <tr>
                  <td>Production Manager</td>
                  <td colspan="5"><!---Need Info---></td>
                </tr>
                <cfelse>
                <cfquery name="get_pm" datasource="jrgm">
              SELECT  [Employee ID], [Name FirstLast] AS PM_Name, First_name, Last_name   FROM app_employees WHERE  [Employee ID] = #Responsible_User_Employee_ID#
              </cfquery>
                <tr>
                  <td>Production Manager</td>
                  <td colspan="5">#get_pm.PM_Name# - #Responsible_User_Employee_ID#</td>
                </tr>
              </cfif>
              <cfif get_project_info.Supervisor_ID EQ "">
                <tr>
                  <td>Supervisor/Crew Leader</td>
                  <td colspan="5"><!---Need Info---></td>
                </tr>
                <cfelse>
                <cfquery name="get_cl" datasource="jrgm">
         SELECT  [Employee ID], [Name FirstLast] AS CL_Name, First_name, Last_name   FROM app_employees WHERE [Employee ID] = #Supervisor_ID#
              </cfquery>
                <tr>
                  <td>Supervisor/Crew Leader</td>
                  <td colspan="5">#get_cl.CL_Name# - #Supervisor_ID#</td>
                </tr>
              </cfif>
              <tr>
                <td>T&amp;O Specialist<br /></td>
                <td colspan="5">#Spray_Tech_ID#</td>
              </tr>
              <tr>
                <td width="155">Irrigation Technician</td>
                <td colspan="5">#Irrigation_Tech_ID#</td>
              </tr>
            </tbody>
          </table>
          <p>&nbsp;</p>
          <p>
            <input name="last_modified_by" type="hidden"    value="#SESSION.userid#" />
            <input name="ProjectID" type="hidden" class="button"  value="#ProjectID#" />
            <input name="button" type="submit" class="btn btn-primary"  value="Submit" />
            &nbsp;</p>
        </cfoutput>
      </form>
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td><strong>Notes:</strong></td>
          </tr>
          <tr>
            <td><ol>
                <li>I need to test APP vs  the new app_jobs_new table&nbsp;before the changeover</li>
                <li>There is a lot of missing data. See if some of the missing data can be input into Insightly now and imported at the changeover. I can send excel to Maria to show all of the missing info</li>
              </ol></td>
          </tr>
        </tbody>
      </table>
      </td>
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
