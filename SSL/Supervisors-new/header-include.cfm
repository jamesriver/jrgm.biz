<!-- BEGIN HEADER INCLUDE -->

<div class="page-header-top">
  <div class="container-fluid">
    <div class="page-logo"><a href="index.cfm"><img src="assets/global/img/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a> Welcome <cfoutput> #SESSION.screenname#</cfoutput> <span class="title">Production Manager, <cfoutput>#Session.branch#</cfoutput></span></div>
    
    <!-- BEGIN RESPONSIVE MENU TOGGLER LEAVE FOR MOBILE PHONE NAVIGATION --> 
    <a href="javascript:;" class="menu-toggler"></a> 
    <!-- END RESPONSIVE MENU TOGGLER -->
    
    <div class="top-menu">
      <div class="btn-group">
        <button type="button" class="btn red dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <i class="fa fa-exclamation-circle"> Alerts </i> <i class="fa fa-angle-down"></i> </button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="dailysheet_status.cfm">Daily Sheets</a></li>
          <!--- <li><a href="payroll_status.cfm">Payroll</a></li>
          <li><a href="equipment_status.cfm">Equpment</a></li>--->
          <li class="divider"> </li>
          <li><a href="report_signout_questions_hours.cfm">Signout &#8212; Hours </a></li>
          <li><a href="report_signout_questions_injury.cfm">Signout &#8212; Injury </a></li>
          <li><a href="daily_sheet_listing_time_compare.cfm">Daily Time Sheet Comparison </a></li>
          <li><a href="dailysheet_notsync.cfm">Late Sync Report - 45 Days</a></li>
          <!--- <li><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report </a></li>---> 
          <!---  <li class="divider"></li>
          <li><a href="inventory_reports_list.cfm">View Prior Equipment Inventory Reports (Electronic) </a></li>
          <li><a href="inventory_report_printable.cfm" target="_blank">Start an Equipment Inventory Report (Printable) </a></li>
          <li><a href="inventory_report_printable_eversion1.cfm" target="_blank">Start an Equipment Inventory Report (Electronic) </a></li>
          <li class="divider"></li>
          <li><a href="Morning_Inspection_List.cfm">Morning Inspection Forms </a></li>
          <li><a href="Evening_Inspection_List.cfm">End of Day Inspection Forms</a></li>
          <li><a href="Weekly_Equipment_Maintenance_List.cfm">Weekly Inspection Forms </a></li>--->
        </ul>
      </div>
      <a href="#myModal-01" role="button" class="btn btn-primary btn-sm" data-toggle="modal">Feedback</a> <span class="separator"></span> <a href="help-center.cfm" class="btn btn-default"><i class="fa fa-question-circle"></i> Help Center </a> <a href="index.cfm" class="btn btn-default"><i class="fa fa-home"></i> Home </a> <a href="/indexnew.cfm" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout </a> </div>
  </div>
</div>
<!-- END HEADER INCLUDE --> 

<!--- Modal -------------------> 

<!-- Modal -->
<div class="modal fade" id="myModal-01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="mail.php" method="post" class="form-horizontal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Feedback Form</h4>
        </div>
        <div class="modal-body">
          <div class=" form-group">
            <label class="col-sm-2">Comment:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="comment">
              <input type="hidden" name="user" value="<cfoutput> #SESSION.screenname#</cfoutput>">
              <input type="hidden" name="page_name" value="<cfoutput>#listlast(cgi.script_name,"/")#</cfoutput>">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          <input type="submit" value="submit" class="btn btn-primary" name="submit">
        </div>
      </form>
    </div>
  </div>
</div>
