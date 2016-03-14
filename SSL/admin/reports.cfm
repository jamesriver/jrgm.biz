<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 
</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
  <div class="header">Reports</div>
     
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="subheader">Payroll Reports</div>
      <ul class="dashboard">
        <li><a href="payroll_report_daily.cfm">Daily Employee Payroll Report</a></li>
        <li><a href="payroll/select_branch.cfm"> Employee Payroll Detail by Date Report</a></li>
        <li><a href="payroll/select_branch_all_employees.cfm">Branch Payroll Detail by Dates Report</a></li>
    </ul>
     <div class="subheader">Jobs &amp; Materials Reports</div>
         <ul class="dashboard">
        <li><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></li>
      </ul>
        
    
    </td>
    <td valign="top"><div class="subheader">Daily Sheet Reports</div>
   <ul class="dashboard">
       <li><a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a></li>
       <li><a href="report_signout_questions_hours.cfm">Daily Sheet Sign Out Question Hours</a></li>
       <li><a href="report_signout_questions_injury.cfm">Daily Sheet Sign Out Question Injury</a></li>
       </ul>
           <div class="subheader">Misc</div>
        <ul class="dashboard">
       <li><a href="view_ALL_notes_pic.cfm">Notes List</a>     </li>
       <li><a href="branch_listing.cfm">Branch Personnel Listing</a></li>
     </ul>
      </td>
        <td valign="top"><div class="subheader">Equipment Reports</div>
          <ul class="dashboard">
            <li><a href="inventory.cfm">Repair Report</a></li>
        <li>Repair Logs</li>
            <li><a href="inventory_list_report_miscategorized.cfm">Uncategorized Equipment</a></li>
            <li><a href="inventory_list_report_dupeqid.cfm">Duplicate Equipment ID Report</a></li>
                  <li><a href="inventory_list_report_dupserial.cfm">Duplicate Serial Number Report</a></li>
                  <li><a href="maintenance_list.cfm">Equipment in Repair Report</a></li>
          </ul>
         </td>
      </tr>
</table>
     
      
   </div>
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
<script src="js/jquery.pageslide.min.js"></script>
<script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
