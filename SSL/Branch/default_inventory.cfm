<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE <!--- (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) --->Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
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
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar_inventory.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="70%" valign="middle"><span class="header">
          <!--Schedule for -->
          <cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></span></td>
        <td align="right"><table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="middle"><cfoutput><a href="default.cfm?work_date=#dateformat(yesterday,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tl','','images/today_lefto.png',0)"><img src="images/today_left.png" alt="Previous Day" width="42" height="39" id="tl" /></a></cfoutput></td>
              <td><cfoutput><a href="default.cfm?work_date=#dateformat(todayDate_button,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('today','','images/today_o.png',0)"><img src="images/today.png" alt="Today" width="96" height="39" id="today" /></a></cfoutput></td>
              <td><cfoutput><a href="default.cfm?work_date=#dateformat(tomorrow,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tr','','images/today_rto.png',0)"><img src="images/today_rt.png" alt="Next Day" width="42" height="39" id="tr" /></a></cfoutput></td>
            </tr>
        </table></td>
      </tr>
    </table>
    <div class="subheader">
      <p>Supervisors</p>
    </div>
    <article class="accordion-a"> <cfoutput query="get_employees">
        <section>
          <header>
            <h1>#EMPLOYEE_NAME#</h1>
          </header>
          <div class="content">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top" class="crewjob_header">Crew</td>
                <td valign="top"><ul class="crewjob_list">
                    <cfquery name="get_employees_super" datasource="jrgm">
SELECT   DISTINCT Employee_ID, crew_name AS employee_name,Employee_Position_ID  
FROM APP_crews WHERE 
  (Employee_ID = #get_employees.employee_id#)
  OR (supervisor_id = #get_employees.employee_id#  
  AND (start_date  >=  (#today#) AND start_date < (#tomorrow#))) 
  OR  (supervisor_id = #get_employees.employee_id#   AND end_date > (#tomorrow#))
AND active_record > 0
ORDER by Employee_Position_ID DESC 
</cfquery>
                    <!---    <cfdump var="#get_employees_cl#">    
 --->
                    <cfloop query="get_employees_super">
                      <li><a href="employee_details.cfm?employee_id=#get_employees_super.Employee_ID#&amp;work_date=#todayDate#">#employee_name#</a></li>
                    </cfloop>
                  </ul></td>
                <td valign="top" class="crewjob_header_rt">Jobs</td>
                <td valign="top"><ul class="crewjob_list">
                    <cfquery name="get_todays_jobs_cl" datasource="jrgm">
SELECT * FROM APP_events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND  crew_leader_id = #get_employees.employee_id#  AND export_id =1   OR (rec_type like '%2%' AND  crew_leader_id = #get_employees.employee_id#  AND export_id =1) ORDER by start_date,event_name
</cfquery>
                    <!--- <cfdump var="#get_todays_jobs_cl#"> --->
                    <cfif get_todays_jobs_cl.recordcount GT 0>
                      <cfloop query="get_todays_jobs_cl">
                        <li><a href="job_details.cfm?work_date=#todayDate#&amp;job_id=#get_todays_jobs_cl.job_ID#">#get_todays_jobs_cl.event_name#</a></li>
                      </cfloop>
                      <cfelse>
                      <li>There are no jobs for today.</li>
                    </cfif>
                  </ul></td>
              </tr>
            </table>
          </div>
        </section>
      </cfoutput></article>
  </div>
  <!-- to clear footer -->
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
