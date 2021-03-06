<cfinclude template="#APPLICATION.basePath#view/global_header.cfm">

<div class="header"> Administrative
<cfif SESSION.userid EQ 1001 OR SESSION.userid EQ 1003 OR SESSION.userid EQ 9991>
  <a href="/SSL/admin/scheduler_select_m.cfm" class="bluebutton">Level Access</a>
</cfif>
</div>
<a href="/SSL/admin/default3.cfm" target="_blank">Click here to view the old version of this screen (e.g. if you can't locate a link)</a>
<table width="100%" border="0" cellspacing="10" cellpadding="5">
  <tr>
    <cfif  IsDefined("SESSION.access_role")  AND (SESSION.access_role EQ  '1' OR SESSION.access_role EQ  '9' OR SESSION.access_role EQ  '97' OR SESSION.access_role EQ '94')>
      <td valign="top"><div class="subheader">Reports</div>
        <div class="dashboardHeader">Renewal Management</div>
          <ul class="dashboard">
            <!--- <li><a href="/SSL/admin/project_renewal_management.cfm">Renewal Management</a></li>--->
            <li><a href="/SSL/admin/project_list_renewal.cfm">Renewal Management</a></li>
            <div class="dashboardHeader">Project Management</div>
            <li><a href="/SSL/admin/project_list.cfm">Project List / Manage Project Information</a></li>
            <cfif  IsDefined("SESSION.access_role")  AND  SESSION.access_role NEQ  '1'  >
              <!---li><a href="/SSL/admin/project_create_new_project.cfm">Create New Project</a></li--->
            </cfif>
            <li><a href="http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>cronjob_projectlinks.php">Authorize Insightly Project Links</a></li>
            <!---    <li><a href="/SSL/admin/project-View_Project_Information.cfm">Manage Project Information</a> </li>--->
          </ul>
        <div class="dashboardHeader">Jobs &amp; Materials Reports</div>
        <ul class="dashboard">
          <!--- <li><a href="/SSL/admin/select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
                <li><a href="/SSL/admin/select_branch_j3.cfm">Job Labor &amp; Materials Report by Job (excel)</a></li> --->
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_projectassignments');">Project Assignments Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labormaterials');">Labor & Materials Combined Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labor');">Labor Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_materials');">Materials Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval');">Snow Removal (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval&nocostrates=1');">Snow Removal - No Cost Rates (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=view_jobcost');">Job Cost Report</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=view_jobcostsummary');">Job Cost Summary Report (CSV)</a></li>
          <!--- <li><a href="/SSL/admin/select_branch_j4.cfm">Job Labor &amp; Materials Report by Branch (excel)</a></li>--->

        </ul></td>
    </cfif>
    <cfif  IsDefined("SESSION.access_role")  AND NOT (SESSION.access_role EQ  '1' OR SESSION.access_role EQ  '9' OR SESSION.access_role EQ  '97' OR SESSION.access_role EQ '94')>
      <td valign="top"><div class="subheader">Project Management</div>
        <div class="dashboardHeader">Renewal Management</div>
          <ul class="dashboard">
            <!--- <li><a href="/SSL/admin/project_renewal_management.cfm">Renewal Management</a></li>--->
            <li><a href="/SSL/admin/project_list_renewal.cfm">Renewal Management</a></li>
            <div class="dashboardHeader">Project Management</div>
            <li><a href="/SSL/admin/project_list.cfm">Project List / Manage Project Information</a></li>
            <cfif  IsDefined("SESSION.access_role")  AND  SESSION.access_role NEQ  '1'  >
              <!---li><a href="/SSL/admin/project_create_new_project.cfm">Create New Project</a></li--->
            </cfif>
            <li><a href="http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>cronjob_projectlinks.php">Authorize Insightly Project Links</a></li>
            <!---    <li><a href="/SSL/admin/project-View_Project_Information.cfm">Manage Project Information</a> </li>--->
          </ul>
        <div class="dashboardHeader">Jobs &amp; Materials Reports</div>
        <ul class="dashboard">
          <!--- <li><a href="/SSL/admin/select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
              <li><a href="/SSL/admin/select_branch_j3.cfm">Job Labor &amp; Materials Report by Job (excel)</a></li> --->
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_projectassignments');">Project Assignments Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labormaterials');">Labor & Materials Combined Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_labor');">Labor Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_materials');">Materials Report (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval');">Snow Removal (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_snowremoval&nocostrates=1');">Snow Removal - No Cost Rates (CSV)</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=view_jobcost');">Job Cost Report</a></li>
          <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=view_jobcostsummary');">Job Cost Summary Report (CSV)</a></li>
          <!--- <li><a href="/SSL/admin/select_branch_j4.cfm">Job Labor &amp; Materials Report by Branch (excel)</a></li>--->

        </ul>
        <!---div class="dashboardHeader">Snow Plow Daily Sheet Reports</div>
        <ul class="dashboard">
          <li><a href="/SSL/admin/snow_plow_2016.cfm">Daily Sheet Listing - <font color="#F40A0A" style="font-weight:bold">Probable Auto-Timed Out</font></a></li>
          <li><a href="/SSL/admin/daily_sheet_listing_corp_only.cfm">Daily Sheet Listing (CORP only)</a></li>
          <li><a href="/ssl/admin/dailysheet_add2.cfm">New Daily Sheet</a> <img src="images/new2.gif" width="33" height="16" /> [Snow Plow Entry]</li>
        </ul--->
        </td>
      <cfif  IsDefined("Session.USERID")  AND Session.USERID NEQ  '3298' >
        <td valign="top" nowrap="nowrap"><div class="subheader">Admin</div>
          <div class="dashboardHeader">Payroll</div>
          <ul class="dashboard">
            <li> <a  href="/SSL/admin/payroll/payrollBetty.cfm">Payroll Approval Screen</a></li>
            <li><a href="/SSL/admin/payroll_manager.cfm">Payroll Manager</a></li>
            <li> <a href="/SSL/admin/payroll/payroll_block.cfm">Payroll Block</a> </li>
            <li> Upload csv Files</li>
           <li><a href="/SSL/admin/payroll/FWW_Employees_active.cfm">FWW Employees</a></li>
            <li><a href="/SSL/admin/payroll_report_employees_multiple_ID_betty.cfm">Employees Working in 2 Branches</a></li>
            <li><a href="/SSL/admin/payroll/payroll_unapproved.cfm">Unapproved Payroll</a></li>
            <li><a href="/SSL/admin/dailysheet_add.cfm">Add a Daily Sheet</a></li>
            <!---li><a href="/SSL/admin/payroll/pto_add.cfm">Add PTO Time</a></li--->
            <!---li><a href="/SSL/admin/payroll/pto_payroll_view_employee_detail.cfm">View PTO Report</a></li--->
          </ul>
          <cfif  IsDefined("Session.USERID")  AND Session.USERID NEQ  '3298' >
            <div class="dashboardHeader">Payroll Reports</div>
            <ul class="dashboard">
              <li><a href="/SSL/admin/payroll_report_daily.cfm">Daily Employee Payroll Report</a></li>
              <li><a href="/SSL/admin/payroll/select_branch.cfm"> Employee Payroll Detail by Date Report</a></li>
              <li><a href="/SSL/admin/payroll/select_branch_all_employees.cfm">Branch Payroll Detail by Dates Report</a></li>
            </ul>
            <div class="dashboardHeader">Daily Sheet Reports</div>
            <ul class="dashboard">
              <li><a href="javascript:window.open('http://<cfoutput>#CONFIG_APISERVER_URL#</cfoutput>biz/?AWS=1&EmployeeID=<cfoutput>#SESSION.userid#</cfoutput>&action=csv_dailysheettimecompare');">Daily Sheet Time Compare Report (CSV)</a></li>
              <li><a href="/SSL/admin/daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a></li>
              <li><a href="/SSL/admin/report_signout_questions_hours.cfm">Daily Sheet Sign Out Question Hours</a></li>
              <li><a href="/SSL/admin/report_signout_questions_injury.cfm">Daily Sheet Sign Out Question Injury</a></li>
              <li><a href="/SSL/admin/daily_sheet_listing.cfm">Daily Sheet Listing</a></li>
            </ul>
            <div class="dashboardHeader">Exception Reports</div>
            <ul class="dashboard">
              <li><a href="/SSL/admin/payroll_manager_deadtime.cfm">Dead Time Report</a></li>
              <li><a href="/SSL/admin/payroll_manager_misctime.cfm">Miscellaneous Job Time Report</a></li>
              <li><a href="/SSL/admin/payroll_manager_employeesworkedinotherbranches.cfm">Daily Sheets With Employees From Other Branches Report</a></li>
            </ul>
            <cfif SESSION.userid EQ 1001  >
              <div class="dashboardHeader">Quoting Admin</div>
              <ul class="dashboard">
                <li><a href="/SSL/admin/quote_data_entry_row_maria.cfm" target="_blank">View/Edit Quoting Calculations and Versions</a></li>
                <li><a href="/SSL/admin/quote_materials_admin.cfm" target="_blank">Manage Material Names and Costs</a></li>
              </ul>
              <!---div class="dashboardHeader">Manage Log In Credentials</div>
              <ul class="dashboard">
                <li><a href="/SSL/admin/manage_crew_leaders.cfm">Manage Supervisors/Crew Leaders</a></li>
              </ul>
              </div--->
            </cfif>
          </cfif></td>
      </cfif>
    </cfif>
    <td valign="top"><div class="subheader">Sales</div>
      <cfif  IsDefined("SESSION.access_role")   AND  SESSION.access_role NEQ  '1'  >
        <div class="dashboardHeader">Quoting</div>
        <ul class="dashboard">
          <li><a href="../quoting-new/quote_create_renewal.cfm" target="_blank">Create Renewal Quote</a></li>
          <li><a href="../quoting-new/quote_create_from_opportunity.cfm" target="_blank">Create Quote From Insightly Opportunity</a></li>
          <li><a href="/ssl/quoting-new/quote_list.cfm">Quote List</a></li>
        </ul>
        <!---div class="dashboardHeader">Ben Chan/Intacct Documentation</div>
        <ul class="dashboard">
          <li><a href="http://api.jrgm.com"  target="_blank">Log In Screen to Ben Chan/Intacct Documentation</a></li>
        </ul--->
      </cfif>
      <br />
      <br /></td>
    <cfif  IsDefined("SESSION.access_role")  AND SESSION.access_role NEQ  '1'    >
      <td valign="top"><div class="subheader">Forms</div>
        <cfif SESSION.userid EQ 1001  >
          <!---div class="dashboardHeader">Lists</div>
          <ul class="dashboard">
            <li><a href="/forms/irlist.cfm">Incident Report List</a></li>
            <li><a href="/forms/injurylist.php">Injury Report List</a>&nbsp; &nbsp;&nbsp; </li>
          </ul>
          </ul>
          </div--->
        </cfif>
        <div class="dashboardHeader">Inspection Forms</div>
        <ul class="dashboard">
          <li><a href="/SSL/admin/Morning_Inspection_List.cfm">Morning Inspection Forms</a></li>
          <li><a href="/SSL/admin/Evening_Inspection_List.cfm">End of Day Inspection Forms</a></li>
          <li><a href="/SSL/admin/Weekly_Equipment_Maintenance_List.cfm">Weekly Equipment Maintenance Forms</a></li>
        </ul>
        <div class="dashboardHeader">Other Forms</div>
        <ul class="dashboard">
          <li><a href="http://forms.jrgm.com/crew-safety-inspection" target="_blank">Crew Safety Inspection</a></li>
          <li><a href="http://forms.jrgm.com/gate-check" target="_blank"> Gate Check</a></li>
          <li><a href="http://forms.jrgm.com/incident-report" target="_blank">Incident Report</a></li>
          <li><a href="http://forms.jrgm.com/injury-report" target="_blank">Injury Report</a></li>
          <li><a href="http://forms.jrgm.com/job-quality-audit" target="_blank">Job Quality Audit</a></li>
          <li><a href="http://forms.jrgm.com/new-employee-feedback" target="_blank">New Employee Feedback</a></li>
          <li><a href="http://forms.jrgm.com/pto-request" target="_blank">PTO Request</a></li>
          <li><a href="http://forms.jrgm.com/shop-inspection" target="_blank">Shop Inspection</a></li>
        </ul>
        </div>
      <!---div class="dashboardHeader">Add a Daily Sheet</div>
      <ul class="dashboard">
        <li><a href="/ssl/admin/dailysheet_add2.cfm">New Daily Sheet</a> <img src="images/new2.gif" width="33" height="16" /> [Snow Plow Entry]</li>
      </ul>
        </div--->
        </td>
    </cfif>
    <cfif  IsDefined("SESSION.access_role")  AND NOT (SESSION.access_role EQ  '1' OR SESSION.access_role EQ  '9' OR SESSION.access_role EQ  '97' OR SESSION.access_role EQ '94')>
      <td valign="top"><div class="subheader">Miscellaneous</div>
        <div class="dashboardHeader">Equipment Reports</div>
        <ul class="dashboard">
          <li><a href="/SSL/admin/inventory.cfm">Repair Report</a></li>
          <li><a href="/SSL/admin/inventory_list_report_miscategorized.cfm">Uncategorized Equipment</a></li>
          <li><a href="/SSL/admin/inventory_list_report_no_eqid.cfm">Equipment WITHOUT Equipment ID</a></li>
          <li><a href="/SSL/admin/inventory_list_report_dupeqid.cfm">Duplicate Equipment ID Report</a></li>
          <li><a href="/SSL/admin/inventory_list_report_dupserial.cfm">Duplicate Serial Number Report</a></li>
          <li><a href="/SSL/admin/maintenance_list.cfm">Equipment in Repair Report</a></li>
          <li><a href="/SSL/admin/inventory_list_by_crew_assignment.cfm">Equipment by Crew Assignment</a></li>
        </ul>
        <div class="dashboardHeader">Equipment Logs</div>
        <ul class="dashboard">
          <li> <a href="/SSL/admin/Log_Repair_logs.cfm">Repair Log</a></li>
          <li><a href="/SSL/admin/Log_oil_change.cfm">Oil Change Log</a> </li>
          <li> <a href="/admin/equipment_date_updates.cfm">Update Next Oil Change Due</a></li>
          <li><a href="/SSL/admin/Log_inspections.cfm">Inspection Log</a></li>
        </ul>
        <div class="dashboardHeader">Oil Change Due Reports</div>
        <ul class="dashboard">
          <li><a href="/SSL/admin/Log_oil_change_due_date.cfm">By Date</a></li>
          <li><a href="/SSL/admin/Log_oil_change_due_hours.cfm">By Hours</a></li>
          <li><a href="/SSL/admin/Log_oil_change_due_miles.cfm">By Miles</a></li>
        </ul>
        <div class="dashboardHeader">Sync Reports</div>
        <ul class="dashboard">
          <li><a href="/ssl/admin/timed_in_from_prior_check_loop.cfm"  >30 Day Sync Report</a> </li>
        </ul>
        <div class="dashboardHeader">Other</div>
        <ul class="dashboard">
          <li><a href="/SSL/admin/view_ALL_notes_pic.cfm">Notes List</a> </li>
          <li><a href="/SSL/admin/branch_listing.cfm">Branch Personnel Listing</a></li>
        </ul>
      </td>
    </cfif>
  </tr>
</table>

<cfinclude template="#APPLICATION.basePath#view/global_footer.cfm">