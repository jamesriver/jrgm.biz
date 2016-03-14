<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mm/dd/yyyy")>
</CFIF>
<cfif IsDefined("url.ProjectID")>
  <CFSET ProjectID=url.ProjectID>
  <cfelse>
  <CFSET jobname="">
</cfif>
<cfquery name="get_project_info" datasource="jrgm">   
SELECT       ID, [Job ID] AS ProjectID, [Wk Loc ID], [Wk Location Name] AS projectname, [Service Address] as project_work_location_address, [Service Address2]   AS project_work_location_address2, [Service City] as project_work_location_city, [Service State] as project_work_location_state, [Service Zip] as project_work_location_zip, project_type,
                       active_record, branch, Responsible_User_Employee_ID, Supervisor_ID, Spray_Tech_ID, Irrigation_Tech_ID, Status, irrigation, 
                      sales_contact_Employee_ID, billing_contact_name, billing_contact_phone, billing_contact_email_address, billing_address, billing_address2, billing_city, 
                      billing_state, billing_zip, project_start_date, project_end_date, total_project_value, irrigation_services_included, department, last_modified_date, last_modified_by, 
                      last_modified_date,billto_company_name,contract_installments, last_quote_id
FROM         app_jobs  WHERE [Job ID] ='#ProjectID#'
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
        <h1>Project Management - View Project Information</h1>
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
      <!---<table width="90%" border="0" align="center">
        <tbody>
          <tr>
            <td><strong>This data is from the app_jobs table! </strong></td>
          </tr>
        </tbody>
      </table>
      <br />---> 
      <cfoutput  query="get_project_info">
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
              <td>#billing_contact_name#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Branch</td>
              <td width="300" nowrap="nowrap">#branch#</td>
              <td> Billing Contact</td>
              <td>#billing_contact_name#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Project Status</td>
              <td width="300" nowrap="nowrap">#Status#</td>
              <td> Billing Contact Phone 1</td>
              <td>#billing_contact_phone#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">&nbsp;</td>
              <td nowrap="nowrap">&nbsp;</td>
              <td>Billing Contact  Email Address</td>
              <td>#billing_contact_email_address#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Project Type</td>
              <td width="300" nowrap="nowrap">#project_type#</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Active/Inactive</td>
              <cfif   active_record EQ 1>
                <CFSET Active_inactive ='Active'>
                <cfelseif   active_record EQ 0>
                <CFSET Active_inactive ='Inactive'>
                <cfelse>
                <CFSET Active_inactive =''>
              </cfif>
              <td width="300" nowrap="nowrap">#Active_inactive#</td>
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
              <td nowrap="nowrap">Address 1&nbsp;</td>
              <td width="300" nowrap="nowrap">#project_work_location_address#</td>
              <td>Billing Address</td>
              <td>#billing_address#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Address 2&nbsp;</td>
              <td width="300" nowrap="nowrap">#project_work_location_address2#</td>
              <td>Billing Address2</td>
              <td>#billing_address2#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">City</td>
              <td width="300" nowrap="nowrap">#project_work_location_city#</td>
              <td>Billing City </td>
              <td>#billing_city#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">State</td>
              <td width="300" nowrap="nowrap">#project_work_location_state#</td>
              <td>Billing State</td>
              <td>#billing_state#</td>
            </tr>
            <tr>
              <td nowrap="nowrap">Zip</td>
              <td width="300" nowrap="nowrap">#project_work_location_zip#</td>
              <td>Billing Zip</td>
              <td>#billing_zip#</td>
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
              <td  colspan="2" nowrap="nowrap"  class="blue-madison"> STAFF ASSIGNMENTS </td>
            </tr>
            <cfif get_project_info.sales_contact_Employee_ID EQ "">
              <tr>
                <td  width="200">Sales Contact</td>
                <td><!---Need Info---></td>
              </tr>
              <cfelse>
              <cfquery name="get_sc" datasource="jrgm">
             SELECT       [Employee ID], [Name FirstLast] AS Sales_Contact, First_name, Last_name,   email,  
            FROM app_employees WHERE  Employee_ID = #sales_contact_Employee_ID#
              </cfquery>
              <tr>
                <td>Sales Contact</td>
                <td>#get_sc.Sales_Contact# - #sales_contact_Employee_ID#</td>
              </tr>
            </cfif>
            <cfquery name="get_bm" datasource="jrgm">
              SELECT crew_name AS BM_Name FROM app_crews WHERE  Employee_branch = '#get_project_info.branch#'  AND   Employee_Position_ID =9
              </cfquery>
            <tr>
              <td>Branch Manager</td>
              <td >#get_bm.BM_Name#</td>
            </tr>
            <cfif get_project_info.Responsible_User_Employee_ID EQ "">
              <tr>
                <td>Production Manager</td>
                <td><!---Need Info---></td>
              </tr>
              <cfelse>
              <cfquery name="get_pm" datasource="jrgm">
              SELECT  [Employee ID], [Name FirstLast] AS PM_Name, First_name, Last_name   FROM app_employees WHERE  [Employee ID] = #Responsible_User_Employee_ID#
              </cfquery>
              <tr>
                <td>Production Manager</td>
                <td>#get_pm.PM_Name# - #Responsible_User_Employee_ID#</td>
              </tr>
            </cfif>
            <cfif get_project_info.Supervisor_ID EQ "">
              <tr>
                <td>Supervisor/Crew Leader</td>
                <td><!---Need Info---></td>
              </tr>
              <cfelse>
              <cfquery name="get_cl" datasource="jrgm">
         SELECT  [Employee ID], [Name FirstLast] AS CL_Name, First_name, Last_name   FROM app_employees WHERE [Employee ID] = #Supervisor_ID#
              </cfquery>
              <tr>
                <td>Supervisor/Crew Leader</td>
                <td>#get_cl.CL_Name# - #Supervisor_ID#</td>
              </tr>
            </cfif>
            <cfif get_project_info.Spray_Tech_ID EQ "">
              <tr>
                <td>T&O Specialist</td>
                <td><!---Need Info---></td>
              </tr>
              <cfelse>
              <cfquery name="get_stech" datasource="jrgm">
         SELECT  [Employee ID], [Name FirstLast] AS ST_Name, First_name, Last_name   FROM app_employees WHERE [Employee ID] = #Spray_Tech_ID#
              </cfquery>
              <tr>
                <td>T&O Specialist</td>
                <td>#get_stech.ST_Name# - #Spray_Tech_ID#</td>
              </tr>
            </cfif>
            <cfif get_project_info.Irrigation_Tech_ID EQ "">
              <tr>
                <td>Irrigation Technician</td>
                <td><!---Need Info---></td>
              </tr>
              <cfelse>
              <cfquery name="get_itech" datasource="jrgm">
         SELECT  [Employee ID], [Name FirstLast] AS IT_Name, First_name, Last_name   FROM app_employees WHERE [Employee ID] = #Irrigation_Tech_ID#
              </cfquery>
              <tr>
                <td>Irrigation Technician</td>
                <td>#get_itech.IT_Name# - #Irrigation_Tech_ID#</td>
              </tr>
            </cfif>
          </tbody>
        </table>
      </cfoutput> <br />
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td colspan="5" nowrap="nowrap"  class="blue-madison"> REVENUE </td>
          </tr>
          <tr>
            <td colspan="5">Provide list of all sales invoices coded to project. <strong>&nbsp;&nbsp;<span style="color: #F40A0A"> <br />
              </span></strong>
              <p>Data that we need could be retrieved via an API call if you use Javascript/jQuery AJAX.  This will be particularly useful for invoices and any other data that only exists in Intacct or Insightly (because they're best managed inside of those systems directly).</p></td>
          </tr>
          <tr>
            <td><strong>INV #</strong></td>
            <td><strong>Date</strong></td>
            <td><strong>Amount</strong></td>
            <td><strong>Due Date</strong></td>
            <td><strong>Paid / Unpaid</strong></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </tbody>
      </table>
      <br />
      <cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader,branch
 FROM app_jobs_all WHERE [Job ID]= '#ProjectID#' 
</cfquery>
      <cfif NOT IsDefined("url.showall")>
        <cfquery name="get_job_labor" datasource="jrgm" maxrows="20">
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#ProjectID#'  AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_in < '#todaydate#'     
 order by  Service_Time_In DESC
  </cfquery>
        <cfelse>
        <cfquery name="get_job_labor" datasource="jrgm" >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#ProjectID#'  AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_in < '#todaydate#'     
 order by  Service_Time_In DESC
  </cfquery>
      </cfif>
      <!--- <cfdump var="#get_job_labor#">--->
      <CFSET mylist ="0">
      <cfloop query="get_job_labor">
        <cfset myList = ListAppend(mylist,ds_id)>
      </cfloop>
      
      <!--- <table class="table table-striped table-bordered table-hover sortable" >--->
      
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td colspan="14" nowrap="nowrap"  class="blue-madison"> PROJECT LABOR:&nbsp; Info from 2015 daily sheets  
			<cfif NOT IsDefined("url.showall")>  - Showing last 20 Records. Click <cfoutput><a href="project_View_Project_Information.cfm?showall=yes&ProjectID=#url.ProjectID#" style="color: red" >here</a></cfoutput> to see all records from 2015
            </cfif>
            
            <cfif  IsDefined("url.showall")>  - Showing ALL records from 2015. Click <cfoutput><a href="project_View_Project_Information.cfm?ProjectID=#url.ProjectID#" style="color: red" >here</a></cfoutput> to see only the last 20 records records from 2015
            </cfif></td>
          </tr>
          <tr>
            <td align="left"><strong>Branch</strong></td>
            <td align="left"><strong>Job Name</strong></td>
            <td align="left"><strong>Job ID</strong></td>
            <td align="left"><strong>Date</strong></td>
            <td align="left"><strong>DSID</strong></td>
            <td align="left"><strong>Employee ID</strong></td>
            <td align="left"><strong>Employee Name</strong></td>
            <td align="left"><strong>Service ID</strong></td>
            <td align="left"><strong>Time Worked<br />
              Minutes</strong></td>
            <td align="left"><strong>Time Worked<br />
              Hours</strong></td>
            <td align="left"><strong>Labor Cost<br />
              @ 13.00/hr</strong></td>
            <td align="left"><strong>CLID</strong></td>
            <td align="left"><strong>Crew Leader Name</strong></td>
            <td align="left"><strong>Job Clock ID</strong></td>
          </tr>
            </thead>
          
          <cfquery name="get_employee_info" datasource="jrgm"   >
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
        <tbody>
          <cfoutput query="get_job_labor">
            <tr>
              <td>#get_job_info.branch#</td>
              <td>#get_job_info.locationname#</td>
              <td nowrap="nowrap">#url.ProjectID#</td>
              <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
              <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
              <td>#Employee_ID#</td>
              <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
              <td>#get_employee_info2.report_name#</td>
              <td>#Service_ID#</td>
              <td>#Total_Time#</td>
              <cfset hours = int(Total_Time\60)>
              <cfset minutes = int(Total_Time mod 60)>
              <td>#hours#:#NumberFormat(minutes,"09")#</td>
              <cfset laborcost = 0.21666667*Total_Time>
              <td>#NumberFormat(laborcost,"999,999.99")#</td>
              <td>#crew_leader#</td>
              <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
              <td>#get_employee_info3.report_name#</td>
              <td>#job_clock_id#</td>
            </tr>
          </cfoutput>
         <!--- <cfquery name="get_job_labor_total" datasource="jrgm"  >
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id   = '#ProjectID#'  AND service_time_in  > = '01/01/2015 00:00:00'  AND   service_time_in < '#todaydate#'
   </cfquery>
          <tr>
            <td><strong>Totals</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <cfoutput>
              <td><strong>#get_job_labor_total.totaljobtime#</strong></td>
              <cfset hours = int(get_job_labor_total.totaljobtime\60)>
              <cfset minutes = int(get_job_labor_total.totaljobtime mod 60)>
              <td><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
              <cfset laborcost = 0.21666667*get_job_labor_total.totaljobtime>
              <td><strong>#NumberFormat(laborcost,"999,999.99")#</strong></td>
            </cfoutput>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>--->
          <!--- <thead>--->
          <tr>
            <td colspan="14" align="left"><i>Daily Sheets with missing service information - Must be viewing all records to see Daily Sheets with missing service information</i></td>
          </tr>
          <!---   </thead>--->
            <cfif  IsDefined("url.showall")>
          <cfquery name="get_job_labor_missing" datasource="jrgm"  >
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id = '#ProjectID#' AND ds_id NOT IN  (#myList#)     AND job_Time_In  > = '01/01/2015 00:00:00' AND 
  job_Time_out < '#todaydate#' 
 order by  job_Time_In DESC
   </cfquery>
          <cfif  get_job_labor_missing.recordcount EQ 0>
            <tr>
              <td colspan="14" class="arialfont"> All Service Time is Accounted for</td>
            </tr>
            <cfelse>
            <cfoutput query="get_job_labor_missing">
              <tr>
                <td>#get_job_info.branch#</td>
                <td>#get_job_info.locationname#</td>
                <td>#url.ProjectID#</td>
                <td>#DateFormat(job_Time_In, "mm/dd/yyyy")#</td>
                <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>#Job_Time_worked#</td>
                <cfset hours = int(Job_Time_worked\60)>
                <cfset minutes = int(Job_Time_worked mod 60)>
                <td>#hours#:#NumberFormat(minutes,"09")#</td>
                <cfset laborcost = 0.21666667*Job_Time_worked>
                <td>#NumberFormat(laborcost,"999,999.99")#</td>
                <td>#Crew_Leader_ID#</td>
                <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
                <td>#get_employee_info4.report_name#</td>
                <td>#ID#</td>
              </tr>
            </cfoutput>
          </cfif>   
           </cfif>
      </table>
      <br />
      
      <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#ProjectID#'   AND Service_Date  > = '12/31/2014'   
  order by  Service_Date DESC
  </cfquery>
   <table width="90%" border="1">
        <tbody>
          <tr>
            <td colspan="9" nowrap="nowrap"  class="blue-madison"> PROJECT MATERIALS: Info from 2015 daily sheets</td>
          </tr>
            <td align="left"><strong>Branch</strong></td>
          <td align="left"><strong>Job Name</strong></td>
          <td align="left"><strong>Job ID</strong></td>
          <td align="left"><strong>Date</strong></td>
          <td align="left"><strong>DSID</strong></td>
          <td align="left"><strong>Job Clock ID</strong></td>
          <td align="left"><strong>Item ID</strong></td>
          <td align="left"><strong>Quantity Used</strong></td>
          <td align="left"><strong>Unit Used</strong></td>
        </tr>
      </thead>
      <tbody>
        <cfoutput query="get_job_materials">
          <tr>
            <td>#get_job_info.branch#</td>
            <td>#get_job_info.locationname#</td>
            <td>#url.ProjectID#</td>
            <td>#DateFormat(Service_Date, "mm/dd/yyyy")#</td>
            <td>#ds_id#</td>
            <td>#Job_clock_ID#</td>
            <td>#Item_ID#</td>
            <td>#Quantity_used#</td>
            <td>#Unit_used#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
      <br />
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td   nowrap="nowrap"  class="blue-madison">JOB COSTING</td>
          </tr>
          <tr>
            <td>This is where we provide some basic P&amp;L updates and  comparisons with quote</td>
          </tr>
        </tbody>
      </table>
      <br />
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td   nowrap="nowrap"  class="blue-madison">LINKS</td>
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
            <td   nowrap="nowrap"  class="blue-madison">NOTES</td>
          </tr>
          <tr>
            <td>Project Notes</td>
          </tr>
        </tbody>
      </table>
      </td>
      </tr>
      </tbody>
      </table>
      <br />
      <table width="90%" border="1">
        <tbody>
          <tr>
            <td><strong>Notes:</strong></td>
          </tr>
          <tr>
            <td><ol>
                <li>Ben &amp; I need to make sure we're in agreement on all of the fileds in the app_jobs table before the changeover</li>
                <li>I need to test APP vs  the new app_jobs table&nbsp;before the changeover</li>
                <li>We need to discuss how project data will be managed until the quoting system is fully functioning</li>
                <li>There is a lot of missing data. See if some of the missing data can be input into Insightly now and imported at the changeover. I can send excel to Maria to show all of the missing info</li>
              </ol></td>
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
