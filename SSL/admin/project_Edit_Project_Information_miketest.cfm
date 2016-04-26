<!--- contract_installments, last_quote_id--->

<cfset is_admin = 0>
<cfif SESSION.userid EQ 1001 OR  SESSION.userid EQ 1870>
    <cfset is_admin = 1>
</cfif>
<cfset has_active_intacct_project = false>
<!---cfhttp here later--->
<cfset incoming_api_result = 1>
<cfif incoming_api_result eq 1>
  <cfset has_active_intacct_project = true>
</cfif>
<cfset todayDate = Now()>
<cfif   IsDefined("form.submitted")>
    <cfset project_status_checkbox_value = 0>
    <cfif isDefined("form.project_status_checkbox")>
        <cfset project_status_checkbox_value = 1>
    </cfif>

<!--- ====== update project info in database ====== --->
  <CFQUERY name="update_app_jobs" datasource="#request.dsn#">
UPDATE app_jobs SET
Status = <cfqueryparam value="#Form.Status#"     CFSQLType="CF_SQL_VARCHAR"> ,
billing_contact_name =  <cfqueryparam value="#Form.billing_contact_name#"     CFSQLType="CF_SQL_VARCHAR"> ,
billing_contact_phone =  <cfqueryparam value="#Form.billing_contact_phone#"     CFSQLType="CF_SQL_VARCHAR"> ,
<!---billing_contact_phone2 =  <cfqueryparam value="#Form.billing_contact_phone2#"     CFSQLType="CF_SQL_VARCHAR">,--->
[Service Address] =   <cfqueryparam value="#Form.project_work_location_address#"     CFSQLType="CF_SQL_VARCHAR">,
billto_company_name =   <cfqueryparam value="#Form.billto_company_name#"     CFSQLType="CF_SQL_VARCHAR">,
billing_contact_email_address  =   <cfqueryparam value="#Form.billing_contact_email_address#"     CFSQLType="CF_SQL_VARCHAR">,
[Wk Location Name]  =   <cfqueryparam value="#Form.projectname#"     CFSQLType="CF_SQL_VARCHAR">,
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
 project_start_date = <cfqueryparam value="#DateFormat(Form.project_start_date, "mm/dd/yyyy")#"     CFSQLType="CF_SQL_DATE">,
 project_end_date = <cfqueryparam value="#DateFormat(Form.project_end_date, "mm/dd/yyyy")#"     CFSQLType="CF_SQL_DATE">,
 contract_installments = <cfqueryparam value="#Form.contract_installments#"     CFSQLType="CF_SQL_NCHAR">,
 total_project_value = <cfqueryparam value="#Form.total_project_value#"     CFSQLType="CF_SQL_VARCHAR">,
 sales_contact_Employee_ID = #Form.sales_contact_Employee_ID#,
 responsible_user_Employee_ID = #Form.responsible_user_Employee_ID#,
 Crew_leader_ID = #Form.Crew_Leader_ID#,
 Spray_Tech_ID = #Form.Spray_Tech_ID#,
 Irrigation_Tech_ID = #Form.Irrigation_Tech_ID#,
 project_status_checkbox = #project_status_checkbox_value#,
 project_details = <cfqueryparam value="#Form.project_details#"     CFSQLType="CF_SQL_TEXT">,
 irrigation_services_included = <cfqueryparam value="#Form.irrigation_services_included#"     CFSQLType="CF_SQL_VARCHAR">,
 last_modified_date = GETUTCDATE(),
 last_modified_date_external = GETUTCDATE(),
 last_modified_by = #SESSION.userid#,
 last_quote_id = #form.last_quote_id#
    WHERE  [Job ID]  = '#form.ProjectID#'
    </CFQUERY>
 <cfhttp url="http://api.jrgm.com/external_api/insightly.php?auth=jrgmAPI!&type=syncbiz&insightly_id=#form.insightly_id#" method="get" result="httpResp" timeout="30">
     <cfhttpparam type="header" name="Content-Type" value="application/json" />
 </cfhttp>
 <cflocation url="project_Edit_Project_Information.cfm?ProjectID=#ProjectID#&insightly_id=#form.insightly_id#" />

</cfif>

<!--- ======= get project info from database ======= --->
<cfquery name="get_project_info" datasource="jrgm">
SELECT       ID, [Job ID] AS ProjectID, [Wk Loc ID], [Wk Location Name] AS projectname, [Service Address] as project_work_location_address, [Service Address2]   AS project_work_location_address2, [Service City] as project_work_location_city, [Service State] as project_work_location_state, [Service Zip] as project_work_location_zip, project_type,
                       active_record, branch, Responsible_User_Employee_ID, Supervisor_ID, Spray_Tech_ID, Irrigation_Tech_ID, Status, irrigation,
                      sales_contact_Employee_ID, billing_contact_name, billing_contact_phone, billing_contact_email_address, billing_address, billing_address2, billing_city,
                      billing_state, billing_zip, project_start_date, project_end_date, total_project_value, irrigation_services_included, department, last_modified_date, last_modified_by,
                      Crew_Leader_ID, billto_company_name,contract_installments, last_quote_id, project_status_checkbox, [Wk Loc ID] as insightly_id, project_details, irrigation_services_included
FROM         app_jobs  WHERE [Job ID] ='#ProjectID#'
</cfquery>

<cfif IsDefined("url.ProjectID")>
  <CFSET ProjectID=url.ProjectID>
  <cfelseif IsDefined("form.ProjectID")>
  <CFSET ProjectID=form.ProjectID>
  <cfelse>
  <CFSET jobname="">
</cfif>



<!--- ======= get active quote ======= --->
<cfquery name="get_active_quotes" datasource="jrgm">
SELECT qs.ID, qs.opportunity_name, qs.opportunity_id, qm.adjusted_contract_price, qm.contract_installments, qm.date_created, qm.date_updated, qm.user_id FROM quote_start qs
INNER JOIN quote_main qm ON qm.opportunity_id=qs.opportunity_id
WHERE qs.ID = '#get_project_info.last_quote_ID#'
  AND qs.date_quote_deleted IS NULL
</cfquery>
<cfset last_quote = StructNew()>
<cfloop query="get_active_quotes">
    <cfif get_active_quotes.ID EQ get_project_info.last_quote_id>
        <cfset last_quote = get_active_quotes>
    </cfif>
</cfloop>

<!--- ================== Get list of employees for the dropdowns =================== --->
<cfset employees = ArrayNew(1)>
<cfquery name="get_employees" datasource="jrgm">
SELECT  [Employee ID] as employee_id, [Name FirstLast] AS CL_Name FROM app_employees WHERE active_record=1 AND [Employee ID]<9999 ORDER BY [First_name]
</cfquery>
<cfloop query="get_employees">
    <cfset ArrayAppend(employees, [get_employees.employee_id, get_employees.CL_Name & ' - ' & get_employees.employee_id])>
</cfloop>

<!--- ================== Check for an existing Intacct project, then if found lock the form's billing and customer info fields as read-only =================== --->
<cfhttp url="http://api.jrgm.com/external_api/intacct.php?auth=jrgmAPI!&type=project&insightly_id=#get_project_info.insightly_id#&start_date=#DateFormat(get_project_info.project_start_date, "yyyy-mm-dd")#&end_date=#DateFormat(get_project_info.project_end_date, "yyyy-mm-dd")#" method="get" result="httpResp" timeout="30">
    <cfhttpparam type="header" name="Content-Type" value="application/json" />
</cfhttp>
<cfset intacct_response=DeserializeJSON(httpResp.filecontent)>

<cfset ProjectID_Intacct = ' | <font color="##AA0000">No Intacct project within these dates</font>'>
<cfif IsDefined('intacct_response.data')>
    <cftry>
        <cfset intacct_project = intacct_response.data>
        <cfif IsDefined('intacct_project.intacct_id')>
            <cfset ProjectID_Intacct = ' | <font color="##0000AA">' & intacct_project.intacct_id & '</font>'>
        </cfif>
    <cfcatch>
        <cfset ProjectID_Intacct = ' | <font color="##AA0000">Failed to read Intacct; try again later</font>'>
    </cfcatch>
    </cftry>
</cfif>

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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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



<!---<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>--->

 <cfif SESSION.userid EQ 1009 OR  SESSION.userid EQ 3085>
  <div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar_estimators.cfm">
</div>
<cfelse>
<div class="page-header">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
</div>
</cfif>

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
      
       <cfif SESSION.userid EQ 1009 OR  SESSION.userid EQ 3085>
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          
          <li> <a href="project_list.cfm"  class="redtype">Go to Project List</a></li>
        </ul>
      </div>
      <cfelse>
       <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a> / </li>
          <li class="active">Project Management / </li>
          <li> <a href="project_list.cfm"  class="redtype">Go to Project List</a></li>
        </ul>
      </div>
      </cfif>
      
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->

  <div class="page-content">
    <div class="container-fluid">
      <form action="project_Edit_Project_Information.cfm?ProjectID=<cfoutput>#ProjectID#</cfoutput>" method="post" onSubmit="document.getElementById('submit_button').value = 'Saving and Syncing... please wait.'; document.getElementById('submit_button').disabled = true" >
        <input type="hidden" name="insightly_id" value="<cfoutput>#get_project_info.insightly_id#</cfoutput>">
        <cfoutput  query="get_project_info" maxrows="1">
          <table class="table large" >
          <tbody>
          <tr>
          <td>
          <h2>#projectname#</h2>
          <table width="90%" border="1">
            <tbody>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> PROJECT NAME </td>
                <td   colspan="2" nowrap="nowrap"  class="blue-madison"> ACTIVE QUOTE </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project Name</td>
                <td width="300" nowrap="nowrap">
                    <cfif is_admin EQ 1>
                        <input name="projectname" type="text" style="width: 100%" value="<cfoutput>#projectname#</cfoutput>">
                    <cfelse>
                        <input name="projectname" type="hidden" value="<cfoutput>#projectname#</cfoutput>"><cfoutput>#projectname#</cfoutput>
                    </cfif>
                </td>
                <td nowrap="nowrap">Active Quote</td>
                <td width="300" nowrap="nowrap">
                    <div id="div_quote">
                    <cfif IsDefined('last_quote.ID')>
                        <input type="hidden" name="last_quote_id" value="#last_quote.ID#">
                        Created: #DateFormat(last_quote.date_created, "mm/dd/yyyy")#, Last Updated: #DateFormat(last_quote.date_updated, "mm/dd/yyyy")#<br />
                        $<cfoutput>#last_quote.adjusted_contract_price#</cfoutput> (<cfoutput>#last_quote.contract_installments#</cfoutput> installments / year)&nbsp;
                        <a href="javascript:updateQuote()">Change Link</a>
                        <a href="/ssl/quoting-new/quote_data_entry.cfm?ID=#last_quote.opportunity_id#" target="_blank"><input type="button" value="View/Edit Quote"></a>
                    <cfelse>
                        <input type="hidden" name="last_quote_id" value="0">
                        <a href="javascript:updateQuote()">Create Link to an Existing Quote / Insightly Opportunity</a>
                    </cfif>
                    </div>
                </td>
              </tr>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> PROJECT DETAILS </td>
                <td   colspan="2" nowrap="nowrap"  class="blue-madison"> CUSTOMER </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project ID </td>
                <td width="300" nowrap="nowrap">#ProjectID# #ProjectID_Intacct#</td>
                <td>Bill To Company</td>
                <td>
                    <cfif IsDefined('intacct_project.billto_company_name')>
                        <input name="billto_company_name" type="hidden"  value="#intacct_project.billto_company_name#"   />
                        <cfoutput>#intacct_project.billto_company_name#</cfoutput>
                    <cfelse>
                        <input name="billto_company_name" type="text"  value="#get_project_info.billto_company_name#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Branch</td>
                <td width="300" nowrap="nowrap">
                    <cfif is_admin EQ 1>
                        <select name="branch"   tabindex="5" >
                            <option value="Charlottesville" <cfif get_project_info.branch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                            <option value="Chesterfield" <cfif get_project_info.branch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                            <option value="Newport News" <cfif get_project_info.branch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                            <option value="Portsmouth" <cfif get_project_info.branch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                            <option value="Richmond" <cfif get_project_info.branch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                        </select>
                    <cfelse>
                        <input type="hidden" name="branch" value="#branch#">#branch#
                    </cfif>
                </td>
                <td>Billing Contact</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_contact_name')>
                        <input name="billing_contact_name" type="hidden"  value="#intacct_project.billing_contact_name#"   />
                        <cfoutput>#intacct_project.billing_contact_name#</cfoutput>
                    <cfelse>
                        <input name="billing_contact_name" type="text"  value="#get_project_info.billing_contact_name#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project Status</td>
                <td width="300" nowrap="nowrap">

                    <cfif is_admin EQ 1>
                        <select name="Status"   tabindex="5" >
                          <cfset statuses = ArrayNew(1)>
                          <cfset ArrayAppend(statuses, ['NOT STARTED', 'NOT STARTED'])>
                          <cfset ArrayAppend(statuses, ['IN PROGRESS', 'IN PROGRESS'])>
                          <cfset ArrayAppend(statuses, ['COMPLETED', 'COMPLETED'])>
                          <cfset ArrayAppend(statuses, ['DEFERRED', 'DEFERRED'])>
                          <cfset ArrayAppend(statuses, ['CANCELLED', 'CANCELLED'])>
                          <cfset ArrayAppend(statuses, ['ABANDONED', 'ABANDONED'])>

                          <cfloop from="1" to="#arrayLen(statuses)#" index="i">
                            <cfset value = "">
                            <cfif UCASE(get_project_info.Status) EQ statuses[i][1]>
                              <cfset value = ' selected="selected"'>
                            </cfif>
                            <option value="<cfoutput>#statuses[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#statuses[i][2]#</cfoutput> </option>
                          </cfloop>
                        </select>
                    <cfelse>
                        <input type="hidden" name="Status" value="#get_project_info.Status#">
                        <cfoutput>#get_project_info.Status#</cfoutput>
                    </cfif>
                    <cfif IsDefined('intacct_project.project_status')>
                         | <font color="##0000AA">#intacct_project.project_status#</font>
                    </cfif>
                </td>
                <td>Billing Contact Phone 1</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_contact_phone')>
                        <input name="billing_contact_phone" type="hidden"  value="#intacct_project.billing_contact_phone#"   />
                        <cfoutput>#intacct_project.billing_contact_phone#</cfoutput>
                    <cfelse>
                        <input name="billing_contact_phone" type="text"  value="#get_project_info.billing_contact_phone#"   />
                    </cfif>
                </td>
              </tr>
              <cfset project_status_checkbox_selected = ''>
              <cfif get_project_info.project_status_checkbox EQ 1>
                <cfset project_status_checkbox_selected = ' checked '>
              </cfif>
              <tr>
                <td colspan="2" nowrap="nowrap">
                    <cfif is_admin EQ 1>
                        Check off if this project will NOT be renewed
                        <input type="checkbox" name="project_status_checkbox" id="project_status_checkbox"  align="left"<cfoutput>#project_status_checkbox_selected#</cfoutput>/>
                    <cfelse>
                        <cfif project_status_checkbox_selected neq ''>
                            This project will currently NOT be renewed
                            <input type="hidden" name="project_status_checkbox" id="project_status_checkbox" value="1">
                        <cfelse>
                            This project WILL currently be renewed
                        </cfif>
                    </cfif>
                    <cfif project_status_checkbox_selected neq '' AND IsDefined('intacct_project.intacct_projects_past_enddate')>
                        <cfoutput>#intacct_project.intacct_projects_past_enddate#</cfoutput>
                    </cfif>
                </td>
                <td nowrap="nowrap">Billing Contact Email Address</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_contact_email_address')>
                        <input name="billing_contact_email_address" type="hidden"  value="#intacct_project.billing_contact_email_address#"   />
                        <cfoutput>#intacct_project.billing_contact_email_address#</cfoutput>
                    <cfelse>
                        <input name="billing_contact_email_address" type="text"  value="#get_project_info.billing_contact_email_address#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Project Type</td>
                <td width="300" nowrap="nowrap"><select name="project_type"   tabindex="5" >
                    <cfset project_types = ArrayNew(1)>
                    <cfset ArrayAppend(project_types, ['Apt/Condo/Townhome', 'Apt/Condo/Townhome'])>
                    <cfset ArrayAppend(project_types, ['HOA', 'HOA'])>
                    <cfset ArrayAppend(project_types, ['Hotel', 'Hotel'])>
                    <cfset ArrayAppend(project_types, ['Industrial', 'Industrial'])>
                    <cfset ArrayAppend(project_types, ['Institutional', 'Institutional'])>
                    <cfset ArrayAppend(project_types, ['Multifamily', 'Multifamily'])>
                    <cfset ArrayAppend(project_types, ['Municipal', 'Municipal'])>
                    <cfset ArrayAppend(project_types, ['Office', 'Office'])>
                    <cfset ArrayAppend(project_types, ['Other', 'Other'])>
                    <cfset ArrayAppend(project_types, ['Residential', 'Residential'])>
                    <cfset ArrayAppend(project_types, ['Retail', 'Retail'])>

                    <cfloop from="1" to="#arrayLen(project_types)#" index="i">
                      <cfset value = "">
                      <cfif UCASE(get_project_info.project_type) EQ project_types[i][1]>
                        <cfset value = ' selected="selected"'>
                      </cfif>
                      <option value="<cfoutput>#project_types[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#project_types[i][2]#</cfoutput> </option>
                    </cfloop>
                  </select></td>
                <td nowrap="nowrap">&nbsp;</td>
                <td style="color: ##0000AA">
                    <cfif IsDefined('intacct_project.billto_company_name')>
                        Log into Intacct to change this information directly.
                    <cfelse>
                        &nbsp;
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Active/Inactive</td>
                <td>
                    <cfif is_admin EQ 1>
                        <select name="active_record"    >
                            <option value="0" <cfif get_project_info.active_record EQ '0'> selected="selected"</cfif>>Inactive</option>
                            <option value="1" <cfif get_project_info.active_record EQ '1'> selected="selected"</cfif>>Active</option>
                        </select></td>
                    <cfelse>
                        <input type="hidden" name="active_record" value="#active_record#"><cfif active_record EQ 1>active<cfelse>inactive</cfif>
                    </cfif>
                <td>Contract Installments Per Year</td>
                <td>
                      <cfif IsDefined('intacct_project.contract_installments')>
                          <input name="contract_installments" type="hidden"  value="#intacct_project.contract_installments#"   />
                          <cfoutput>#intacct_project.contract_installments#</cfoutput>
                      <cfelse>
                          <cfif IsDefined('last_quote.ID')>
                              <input name="contract_installments" type="hidden"  value="#last_quote.contract_installments#"   />
                              <cfoutput>#last_quote.contract_installments#</cfoutput>
                          <cfelse>
                              <select name="contract_installments"    >
                                <option value="12" <cfif get_project_info.contract_installments EQ '12'> selected="selected"</cfif>>12</option>
                                <option value="6" <cfif get_project_info.contract_installments EQ '6'> selected="selected"</cfif>>6</option>
                                <option value="4" <cfif get_project_info.contract_installments EQ '4'> selected="selected"</cfif>>4</option>
                                <option value="3" <cfif get_project_info.contract_installments EQ '3'> selected="selected"</cfif>>3</option>
                                <option value="2" <cfif get_project_info.contract_installments EQ '2'> selected="selected"</cfif>>2</option>
                                <option value="1" <cfif get_project_info.contract_installments EQ '1'> selected="selected"</cfif>>1</option>
                              </select>
                          </cfif>
                      </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Total Annual Amount</td>
                <td nowrap="nowrap">
                    <cfif is_admin EQ 1>
                        <input name="total_project_value" type="text" value="#total_project_value#">
                    <cfelse>
                        <input type="hidden" name="total_project_value" value="#total_project_value#">#total_project_value#
                    </cfif>
                </td>
                <td nowrap="nowrap">&nbsp;</td>
                <td style="color: ##0000AA">
                    <cfif IsDefined('intacct_project.contract_installments')>
                        Log into Intacct to change this value directly.
                    <cfelse>
                        &nbsp;
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Start Date</td>
                <td width="300" nowrap="nowrap">
                <cfif is_admin EQ 1>
                    <input name="project_start_date" type="text" value="#DateFormat(project_start_date, "mm/dd/yyyy")#">
                <cfelse>
                    <input type="hidden" name="project_start_date" value="#DateFormat(project_start_date, "mm/dd/yyyy")#">#DateFormat(project_start_date, "mm/dd/yyyy")#
                </cfif>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">End Date</td>
                <td width="300" nowrap="nowrap">
                <cfif is_admin EQ 1>
                    <input name="project_end_date" type="text" value="#DateFormat(project_end_date, "mm/dd/yyyy")#">
                <cfelse>
                    <input type="hidden" name="project_end_date" value="#DateFormat(project_end_date, "mm/dd/yyyy")#">#DateFormat(project_end_date, "mm/dd/yyyy")#
                </cfif>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Details</td>
                <td colspan=3><textarea name="project_details" style="width: 100%" rows="5">#project_details#</textarea></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Irrigation Services Included</td>
                <td colspan=3><input name="irrigation_services_included" style="width: 100%" value="#irrigation_services_included#"></td>
              </tr>
              <tr>
                <td colspan="2" nowrap="nowrap"  class="blue-madison"> WORK LOCATION </td>
                <td   colspan="2" nowrap="nowrap"  class="blue-madison"> BILL TO INFORMATION </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Address 1 </td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_address" type="text" value="#get_project_info.project_work_location_address#"   /></td>
                <td>Billing Address</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_address')>
                        <input name="billing_address" type="hidden"  value="#intacct_project.billing_address#"   />
                        <cfoutput>#intacct_project.billing_address#</cfoutput>
                    <cfelse>
                        <input name="billing_address" type="text"  value="#get_project_info.billing_address#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Address 2 </td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_address2" type="text"  value="#get_project_info.project_work_location_address2#"   /></td>
                <td>Billing Address2</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_address2')>
                        <input name="billing_address2" type="hidden"  value="#intacct_project.billing_address2#"   />
                        <cfoutput>#intacct_project.billing_address2#</cfoutput>
                    <cfelse>
                        <input name="billing_address2" type="text"  value="#get_project_info.billing_address2#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">City</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_city" type="text"  value="#get_project_info.project_work_location_city#"   /></td>
                <td>Billing City </td>
                <td>
                    <cfif IsDefined('intacct_project.billing_city')>
                        <input name="billing_city" type="hidden"  value="#intacct_project.billing_city#"   />
                        <cfoutput>#intacct_project.billing_city#</cfoutput>
                    <cfelse>
                        <input name="billing_city" type="text"  value="#get_project_info.billing_city#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">State</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_state" type="text"  value="#get_project_info.project_work_location_state#"   /></td>
                <td>Billing State</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_state')>
                        <input name="billing_state" type="hidden"  value="#intacct_project.billing_state#"   />
                        <cfoutput>#intacct_project.billing_state#</cfoutput>
                    <cfelse>
                        <input name="billing_state" type="text"  value="#get_project_info.billing_state#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">Zip</td>
                <td width="300" nowrap="nowrap"><input name="project_work_location_zip" type="text"  value="#get_project_info.project_work_location_zip#"   /></td>
                <td>Billing Zip</td>
                <td>
                    <cfif IsDefined('intacct_project.billing_zip')>
                        <input name="billing_zip" type="hidden"  value="#intacct_project.billing_zip#"   />
                        <cfoutput>#intacct_project.billing_zip#</cfoutput>
                    <cfelse>
                        <input name="billing_zip" type="text"  value="#get_project_info.billing_zip#"   />
                    </cfif>
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td width="300" nowrap="nowrap">&nbsp;</td>
                <td nowrap="nowrap">&nbsp;</td>
                <td style="color: ##0000AA">
                    <cfif IsDefined('intacct_project.billto_company_name')>
                        Log into Intacct to change this information directly.
                    <cfelse>
                        &nbsp;
                    </cfif>
                </td>
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
              <tr>
                  <td>Sales Contact</td>
                  <td colspan="5" nowrap="nowrap"><select name="sales_contact_Employee_ID"   tabindex="5" >
                    ,<option value="0">[ No assignment ]</option>
                    <cfloop from="1" to="#arrayLen(employees)#" index="i">
                      <cfset value = "">
                      <cfif get_project_info.sales_contact_Employee_ID EQ employees[i][1]>
                        <cfset value = ' selected="selected"'>
                      </cfif>
                      <option value="<cfoutput>#employees[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#employees[i][2]#</cfoutput> </option>
                    </cfloop>
                  </select></td>
              </tr>
              <cfquery name="get_bm" datasource="jrgm">
              SELECT crew_name AS BM_Name FROM app_crews WHERE  Employee_branch = '#get_project_info.branch#'  AND   Employee_Position_ID =9
              </cfquery>
              <tr>
                <td>#get_project_info.branch# Branch Manager</td>
                <td colspan="5">#get_bm.BM_Name#</td>
              </tr>
              <tr>
                <td>Production Manager</td>
                <td colspan="5" nowrap="nowrap"><select name="responsible_user_Employee_ID"   tabindex="5" >
                  ,<option value="0">[ No assignment ]</option>
                  <cfloop from="1" to="#arrayLen(employees)#" index="i">
                    <cfset value = "">
                    <cfif get_project_info.responsible_user_Employee_ID EQ employees[i][1]>
                      <cfset value = ' selected="selected"'>
                    </cfif>
                    <option value="<cfoutput>#employees[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#employees[i][2]#</cfoutput> </option>
                  </cfloop>
                </select></td>
              </tr>
              <tr>
                  <td>Supervisor/Crew Leader</td>
                  <td colspan="5" nowrap="nowrap"><select name="Crew_Leader_ID"   tabindex="5" >
                    ,<option value="0">[ No assignment ]</option>
                    <cfloop from="1" to="#arrayLen(employees)#" index="i">
                      <cfset value = "">
                      <cfif get_project_info.Crew_Leader_ID EQ employees[i][1]>
                        <cfset value = ' selected="selected"'>
                      </cfif>
                      <option value="<cfoutput>#employees[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#employees[i][2]#</cfoutput> </option>
                    </cfloop>
                  </select></td>
              </tr>
              <tr>
                <td>T&amp;O Specialist</td>
                <td colspan="5" nowrap="nowrap"><select name="Spray_Tech_ID"   tabindex="5" >
                  ,<option value="0">[ No assignment ]</option>
                  <cfloop from="1" to="#arrayLen(employees)#" index="i">
                    <cfset value = "">
                    <cfif get_project_info.Spray_Tech_ID EQ employees[i][1]>
                      <cfset value = ' selected="selected"'>
                    </cfif>
                    <option value="<cfoutput>#employees[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#employees[i][2]#</cfoutput> </option>
                  </cfloop>
                </select></td>
              </tr>
              <tr>
                  <td width="205">Irrigation Technician</td>
                  <td colspan="5" nowrap="nowrap"><select name="Irrigation_Tech_ID"   tabindex="5" >
                    ,<option value="0">[ No assignment ]</option>
                    <cfloop from="1" to="#arrayLen(employees)#" index="i">
                      <cfset value = "">
                      <cfif get_project_info.Irrigation_Tech_ID EQ employees[i][1]>
                        <cfset value = ' selected="selected"'>
                      </cfif>
                      <option value="<cfoutput>#employees[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#employees[i][2]#</cfoutput> </option>
                    </cfloop>
                  </select></td>
              </tr>
            </tbody>
          </table>
          <p>&nbsp;</p>
          <p>
            <input name="last_modified_by" type="hidden"    value="#SESSION.userid#" />
            <input name="ProjectID" type="hidden" class="button"  value="#ProjectID#" />
            <input name="submit_button" id="submit_button" type="submit" class="btn btn-primary"  value="Submit" />
            &nbsp;</p>
            <input type="hidden" name="submitted" value="1">
        </cfoutput>
      </form>
      </td>
      </tr>
      </tbody>
      </table>

      <script>
        function updateQuote()
        {
            var oldval = $('#div_quote').html();
            $('#div_quote').html('<img src="ajax-loader.gif">&nbsp;Loading... please wait.');
            $.ajax({
                url: 'project_Edit_Project_Information_ajax.cfm',
                type: 'get',
                data: { 'ProjectID': '<cfoutput>#ProjectID#</cfoutput>' },
                success: function(data) {
                    $('#div_quote').html(data);
                }
            });
        }
      </script>
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
