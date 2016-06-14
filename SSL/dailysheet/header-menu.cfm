<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2 >
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date>
 <CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >
 <CFSET PAY_PERIOD_NUMBER_PRIOR  =  pay_period_number-1>

 <!-- BEGIN HEADER MENU INCLUDE -->
  <div class="page-header-menu">
    <div class="container-fluid"> 
      <div id="hor-menu-default" class="hor-menu">
        <ul class="nav navbar-nav">
        <li class="menu-dropdown classic-menu-dropdown clearfix"> 
			<a data-hover="megamenu-dropdown" data-close-others="true" href="payroll_main.cfm" class="dropdown-toggle new-added"> Payroll  
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a> 
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
			    <ul class="dropdown-menu pull-left">
						<li><a href="payroll_status.cfm">Payroll Status</a></li>
						<li><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>">Approve Week 1</a></li>
						<li><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>">Approve Week 2</a></li>
						<li><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#pay_period_number#</cfoutput>">View Current Payroll Period</a></li>
						<li><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#PAY_PERIOD_NUMBER_PRIOR#</cfoutput>">View Prior Payroll Period</a></li>  
						<li><a href="pto_add.cfm">Add PTO Time</a></li>
						<li><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></li>
						<li><a href="payroll_view_branch_detail_all_select_dates.cfm">Branch Payroll Detail by Date</a></li>
				</ul>
        </li>
        <li class="menu-dropdown classic-menu-dropdown clearfix"> 
			<a data-hover="megamenu-dropdown" data-close-others="true" href="dailysheet_select.cfm" class="dropdown-toggle new-added">  Daily Sheet 
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
				<ul class="dropdown-menu pull-left">
                  <li><a href="dailysheet_add.cfm">Add a Daily Sheet </a></li>
					<li><a href="dailysheet_status.cfm">Daily Sheet Status</a></li>
					<li><a href="daily_sheet_listing_time_compare.cfm">Time Comparison</a></li>
				</ul>
		</li>
		<li class="menu-dropdown classic-menu-dropdown clearfix"> 
			<a data-hover="megamenu-dropdown" data-close-others="true" href="do_login.cfm?employee_ID=<cfoutput>#SESSION.userid#</cfoutput>&schedchoice=jobs" class="dropdown-toggle new-added">
			Jobs 
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i>
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
				<ul class="dropdown-menu pull-left">
					<li><a href="job_notes.cfm">Job Notes</a></li>
				</ul>
		</li>
		<li class="menu-dropdown classic-menu-dropdown clearfix">
			<a data-hover="megamenu-dropdown" data-close-others="true" href="do_login.cfm?employee_ID=<cfoutput>#SESSION.userid#</cfoutput>&schedchoice=crews"class="new-added"> 
			Crews 
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
				<ul class="dropdown-menu pull-left">
				    <li><a href="/SSL/scheduler/crew_assignments.cfm">Modify Crew Assignments</a></li>
					<li><a href="employee_notes.cfm">Employee Notes</a></li>
				</ul>
		</li>
        <li class="menu-dropdown classic-menu-dropdown clearfix">
			<a data-hover="megamenu-dropdown" data-close-others="true" href="inventory_list.cfm" class="dropdown-toggle new-added"> Equipment 
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
            <ul class="dropdown-menu pull-left">
              <li><a href="equipment_status.cfm">Equipment Status</a></li>
              <li><a href="inventory_reports_list.cfm">Inventory Reports</a></li>
              <li><a href="inspection_reports.cfm">Inspection Reports</a></li>
               <li><a href="oil_change_info.cfm">Oil Change Reports</a></li>
            </ul>
		</li>
        <li class="menu-dropdown classic-menu-dropdown clearfix">
			<a data-hover="megamenu-dropdown" data-close-others="true" href="directory.cfm" class="dropdown-toggle new-added"> Directory
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
            <ul class="dropdown-menu pull-left">
              <li><a href="directory_employees.cfm">Employees</a></li>
              <li><a href="directory_usernamepassword.cfm">Usernames and Passwords</a></li>
              <li><a href="directory_branchjobs.cfm">Jobs</a></li>
              <li><a href="directory_materials.cfm">Materials</a></li>
            </ul>
        </li>
        <li class="clearfix"><a href="forms.cfm"><span class="glyphicon glyphicons-more-items new-added"></span> Forms</a></li>
        <li class="menu-dropdown classic-menu-dropdown clearfix">
			<a data-hover="megamenu-dropdown" data-close-others="true" href="reports.cfm" class="new-added"> Reports
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
            <ul class="dropdown-menu pull-left">
              <li><a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a></li>
              <li><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
              <li><a href="payroll_view_branch_detail_all_select_dates.cfm">Branch Payroll Detail by Date</a></li>
                <li><a href="dailysheet_notsync.cfm">Late Sync Report - 90 Days</a></li>
              <li class="divider"></li>
              <li><a href="inventory_report_printable.cfm" target="_blank">Equipment Inventory Report (Printable) </a></li>
              <li><a href="inventory_report_printable_eversion1.cfm" target="_blank">Start an Equipment Inventory Report (Electronic) </a></li>
              <li><a href="inventory_reports_list.cfm">View Prior Equipment Inventory Reports (Electronic) </a></li>
               <li class="divider"></li>
              <li><a href="IRList.cfm">Incident Report List</a></li>
              <li><a href="InjuryList.cfm">Injury Report List</a></li>
              <li class="divider"></li>
              <li><a href="Morning_Inspection_List.cfm">Morning Inspection Forms</a></li>
              <li><a href="Evening_Inspection_List.cfm">End of Day Inspection Forms</a></li>
            <li>   <a href="Weekly_Equipment_Maintenance_List.cfm">Weekly Equipment Maintenance Forms</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div> 
  
  
  
 
  
 
  
  <!-- END HEADER MENU INCLUDE  --> 