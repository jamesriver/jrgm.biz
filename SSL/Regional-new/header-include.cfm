<!-- BEGIN HEADER INCLUDE -->

<div class="page-header-top">
  <div class="container-fluid">
    <div class="page-logo"><a href="index.cfm"><img src="assets/global/img/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a> Welcome <cfoutput> #SESSION.screenname#</cfoutput> <span class="title">Regional Manager</span></div>
    
    <!-- BEGIN RESPONSIVE MENU TOGGLER LEAVE FOR MOBILE PHONE NAVIGATION --> 
    <a href="javascript:;" class="menu-toggler"></a> 
    <!-- END RESPONSIVE MENU TOGGLER -->
    
    <div class="top-menu">
      <div class="btn-group">
        <button type="button" class="btn red dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <i class="fa fa-exclamation-circle"> Alerts </i> <i class="fa fa-angle-down"></i> </button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="dailysheet_status.cfm">Daily Sheets Unapproved</a></li>
          <li></li>
          <li><a href="report_signout_questions_hours.cfm">Signout &#8212; Hours </a></li>
          <li><a href="report_signout_questions_injury.cfm">Signout &#8212; Injury </a></li>
           <li><a href="dailysheet_notsync.cfm">Late Sync Report - 45 Days</a></li>
          <li><a href="daily_sheet_listing_time_compare.cfm">Daily Time Sheet Comparison </a></li>
           <li class="divider"></li>
        </ul>
      </div>
      <span class="separator"></span> 
	 
	  <a href="#myModal-01" role="button" class="btn btn-primary btn-sm" data-toggle="modal">Feedback</a>
      <span class="separator"></span> <a href="help-center.cfm" class="btn btn-default"><i class="fa fa-question-circle"></i> Help Center </a> <a href="index.cfm" class="btn btn-default"><i class="fa fa-home"></i> Home </a> <a href="http://www.jrgm.biz/indexnew.cfm" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout </a> </div>
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
        
		<input type="submit" value="Submit" class="btn btn-primary" name="Submit">
      </div>
	</form>
    </div>
  </div>
</div>