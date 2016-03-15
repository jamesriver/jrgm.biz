<!-- BEGIN HEADER MENU INCLUDE -->

<div class="page-header-menu">
  <div class="container-fluid">
    <div id="hor-menu-default" class="hor-menu">
      <ul class="nav navbar-nav">
        <li class="menu-dropdown classic-menu-dropdown clearfix"> <a data-hover="megamenu-dropdown" data-close-others="true" href="inventory_list.cfm" class="dropdown-toggle new-added"> Equipment <i class="fa fa-angle-down hidden-sm hidden-xs"></i> </a> <i class="fa fa-angle-down visible-sm visible-xs downside"></i>
          <ul class="dropdown-menu pull-left">
            <li><a href="oil_change_info.cfm">Oil Change Reports</a></li>
                      </ul>
        </li>
        <li class="menu-dropdown classic-menu-dropdown clearfix"> <a data-hover="megamenu-dropdown" data-close-others="true" href="inventory_list.cfm" class="dropdown-toggle new-added"> Inspection Forms <i class="fa fa-angle-down hidden-sm hidden-xs"></i> </a> <i class="fa fa-angle-down visible-sm visible-xs downside"></i>
          <ul class="dropdown-menu pull-left">
   <li><a href="Morning_Inspection_List.cfm">Morning Inspection Forms</a></li>
            <li><a href="Evening_Inspection_List.cfm">Evening Inspection Forms</a></li>
          </ul>
        </li>
        <li class="clearfix"><a href="forms.cfm"><span class="glyphicon glyphicons-more-items new-added"></span> Forms</a> </li>
        <cfif SESSION.userid EQ 1002>
          <li class="clearfix"><a href="/ssl/admin/default.cfm"  target="_blank"><span class="glyphicon glyphicons-more-items new-added"></span> Admin</a></li>
        </cfif>
      </ul>
    </div>
  </div>
</div>

<!-- END HEADER MENU INCLUDE  --> 