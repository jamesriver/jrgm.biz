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
			<a data-hover="megamenu-dropdown" data-close-others="true" href="dailysheet_select.cfm" class="dropdown-toggle new-added">  Daily Sheet 
				<i class="fa fa-angle-down hidden-sm hidden-xs"></i> 
			</a>
				<i class="fa fa-angle-down visible-sm visible-xs downside"></i>
				<ul class="dropdown-menu pull-left">
                  <li><a href="dailysheet_add.cfm">Add a Daily Sheet </a></li>
					<li><a href="dailysheet_status.cfm">Daily Sheet Status</a></li>
				</ul>
        </li>
        <li class="menu-dropdown classic-menu-dropdown clearfix">
		  <a data-hover="megamenu-dropdown" data-close-others="true" href="inventory_list.cfm" class="dropdown-toggle new-added"> Equipment</a>		
          <i class="fa fa-angle-down visible-sm visible-xs downside"></i>
            <ul class="dropdown-menu pull-left">
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
              <li><a href="directory_branchjobs.cfm">Jobs</a></li>
              <li><a href="directory_materials.cfm">Materials</a></li>
            </ul>
        </li>
        <li class="clearfix"><a href="forms.cfm"><span class="glyphicon glyphicons-more-items new-added"></span> Forms</a>          </li>
        </ul>
      </div>
    </div>
  </div> 
  
  
  
 
  
 
  
  <!-- END HEADER MENU INCLUDE  --> 