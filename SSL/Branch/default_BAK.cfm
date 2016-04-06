<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE  Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<cfquery name="get_BM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="0">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
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
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
        <div class="header"><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></div> 
    <div class="spacer20"></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top" width="60%">
          <div class="alertsh">Alerts</div>
        <div class="alerts">
       <!-- <div class="alertsSubTop">Daily Sheet</div>
              <ul>
                <li>Salvador Garcia has 42 hours this week to date. <a href="payroll_main.cfm">View</a></li>
                <li>Bon Ouk did not timeout on 12/3/2013. The system auto timed him out. Please correct his time. Daily Sheet ID 342. <a href="dailysheet_select.cfm">View Daily Sheet</a><br />
                </li>
              </ul>-->
              <div class="alertsSub">Daily Sheets</div>
 <cfquery name="get_UA_daily_sheets_for_RM" datasource="jrgm"  > 
SELECT  * FROM APP_daily_sheets  WHERE ((Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#)) AND ds_approved IS NULL AND ds_date > '05/31/2014' ORDER by ds_date DESC
  </cfquery>
  <p>The following Daily Sheets have NOT been approved.</p>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
               <thead>
                <tr>
                  <th align="left">DSID</th>
                  <th align="left">Date</th>
                  <th align="left">Branch</th>
                  <th align="left">Supervisor</th>
                </tr>
                </thead>
                 <tbody>
                <cfoutput query="get_UA_daily_sheets_for_RM">
                  <cfquery name="get_info_S" datasource="jrgm">
SELECT  last_name AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_UA_daily_sheets_for_RM.supervisor_id#
        </cfquery>
                  <tr>
                    <td><a href="daily_sheet.cfm?dsid=#ID#">#ID#</a></td>
                    <td>#dateformat(ds_date,"mm/dd/yyyy")#</td>
                    <td align="left">#get_info_S.branch#</td>
                    <td>#get_info_S.employee_name#</td>
                  </tr>
                </cfoutput>
              </tbody>
              </table>
            
              
              <div class="alertsSub">Payroll</div>
       <CFSET pay_period_week  =  pay_period_week-1>       
<cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET MIDPLUS1_DATE =  dateadd("d",8,app_payroll_periods.pay_period_start)>
 <CFSET pay_period_endPLUS1_DATE =  dateadd("d",1,pay_period_end)>
  <CFSET pay_period_end_week_plusone =  dateadd("d",7,app_payroll_periods.pay_period_start)>
  <CFSET begin_date = '#pay_period_start#'>
<CFSET end_date = '#pay_period_end#'>
<cfset end_date_plus1 = dateadd("d",1,end_date)>
  
               <cfquery name="get_employees_with_time" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#SESSION.branch#'  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
		ORDER by APP_employees.last_name
 </cfquery>
  <CFSET mylist ="">
<cfloop query="get_employees_with_time">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<cfif SESSION.branch EQ 'Test'>
<CFSET mylist ="0">
</cfif>
   <cfquery name="get_employees_with_time_unapproved" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE  
         (app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)  AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
 <!--- <cfdump var="#get_employees_with_time_unapproved#"> --->
 <div class="alertnofields"><cfif get_employees_with_time_unapproved.recordcount EQ 0>All payroll is approved
 <cfelse>
           You have unapproved payroll.
    <a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week#</cfoutput>">Go here to approve payroll</a> </cfif></div>
              </td>
          <td valign="top" ><cfif SESSION.branch EQ 'test'>
              <div class="blueAlignment"><a href="manage_crew_leaders.cfm" class="bluebutton">Manage Crew Leaders</a> </div>
            </cfif>
            <cfquery name="get_employees_notes" datasource="jrgm">
SELECT  ID,note_content,employee_id,Note_Author_ID FROM app_notes WHERE Employee_ID  
 IN (SELECT Employee_ID FROM app_crews WHERE  Employee_branch = '#SESSION.branch#')
 ORDER by  Note_Date ASC
            </cfquery>
            <!--- <cfdump var="#get_employees_notes#"> --->
           <div class="noteshtop">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="notestitle">Employee Notes</span></td>
      <td align="right"><span class="noteshDate"><cfoutput>#DateFormat(todayDate, "mmmm dd, yyyy")#</cfoutput></span></td>
    </tr>
  </table>
 </div>
            <div class="notes">
              <p>
              <cfif get_employees_notes.recordcount EQ 0>
                No Employee Notes for today
                <cfelse>
                </p>
                <ul>
                  <cfoutput query="get_employees_notes">
                    <cfquery name="get_employees_name" datasource="jrgm">
SELECT  [Name FirstLast] AS empname FROM app_employees  WHERE [Employee ID]  =
 #get_employees_notes.employee_id#
</cfquery>
                    <li><a href="employee_details.cfm?employee_id=#employee_id#&work_date=#todayDate#">#get_employees_name.empname#</a> : #note_content#</li>
                  </cfoutput>
                </ul>
              </cfif>
              <p><a href="employee_notes.cfm">
              View all employee notes >
              </a></p></div>
            <cfquery name="get_job_notes" datasource="jrgm" maxrows="10">
SELECT  ID,note_content, job_id FROM app_notes WHERE job_ID  
 IN (SELECT job_ID FROM app_events WHERE  branch = '#SESSION.branch#')
 ORDER by  Note_Date ASC
</cfquery>
            <!--- <cfdump var="#get_job_notes#"> --->
           <div class="notesh">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="notestitle">Job Notes</span></td>
      <td align="right"><span class="noteshDate"><cfoutput>#DateFormat(todayDate, "mmmm dd, yyyy")#</cfoutput></span></td></tr></table></div>
            <div class="notes">
              <p>
              <cfif get_job_notes.recordcount EQ 0>
                No Job Notes for today
                <cfelse>
                </p>
                <ul>
                  <cfoutput query="get_job_notes">
                    <cfquery name="get_jobs_name" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname FROM app_jobs WHERE  [Job ID]  =
 '#get_job_notes.job_id#'
</cfquery>
                    <li><a href="job_details.cfm?job_id=#job_id#&work_date=#todayDate#">#get_jobs_name.jobname# </a> : #note_content#</li>
                  </cfoutput>
                </ul>
              </cfif>
               <p><a href="job_notes.cfm">
              View all job notes >
              </a></p>
            </div></td>
        </tr>
      </table>
    </div>
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
