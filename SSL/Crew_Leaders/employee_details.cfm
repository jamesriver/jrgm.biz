<cfquery name="get_employee_info" datasource="jrgm">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone FROM employees WHERE [Employee ID]=  #url.Employee_ID# <!--- AND export_id =1 --->
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Employee Detail</div>
      <cfoutput query="get_employee_info">
              <div class="subheader">#employeename#</div>
              <ul class="crew">
             
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><li>Employee ID: #EmployeeID#</li></td>
                    <td><li>Position:  #Position#</li></td>
                  </tr>
                  <tr>
                    <td><li>Phone Home:  #homephone#</li></td>
                    <td><li class="crewbot">Phone Cell:  #cellphone#</li></td>
                  </tr>
                </table>
             </cfoutput>
            </ul>
      <div class="spacer20"></div>
      <div class="subheader">Notes for <cfoutput query="get_employee_info">#employeename#</cfoutput></div>
      
      <cfquery name="get_job_notes" datasource="jrgm">
      SELECT * FROM notes WHERE Employee_ID = #Employee_ID#  
     ORDER by Note_Date DESC
      </cfquery>
      <ul class="crew">
        <cfif get_job_notes.recordcount EQ 0>
          <li>There are no notes for this employee.</li>
          <cfelse>
          <cfoutput query="get_job_notes">
            <li>#dateformat(Note_Date,"mm/dd/yyyy")# - #note_content#</li>
          </cfoutput>
        </cfif>
      </ul>
      <div align="right"><cfoutput> <a href="notes.cfm?work_date=#url.work_date#&employee_id=#employee_id#"><img src="images/icon_note.png" width="67" height="79" alt="Add Notes" /></a></cfoutput></div>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
