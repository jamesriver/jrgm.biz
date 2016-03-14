 
 <CFSET mylist ="">
 
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

<!--- <CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_week1  =  pay_period_week-1>
<CFSET pay_period_end_week  =  pay_period_number>
<cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week#
 </cfquery>
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
<cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
<CFSET pay_period_end_week_plusone =  dateadd("d",1,app_payroll_periods_L.pay_period_end)>
<CFSET pay_period_end_week_plusoneC =  dateadd("d",1,app_payroll_periods_C.pay_period_end)> --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; target-densitydpi=low-dpi;"/>
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="js/jquery-ui.css" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>

<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
 
 .notes2 li {
	padding-bottom: 6px;
	font: normal 13px/140% Arial, Helvetica, sans-serif;
	color: #323232;
	list-style: none;
}

.notes2 li a {
	font-weight: bold;
	color: #006699;	
	text-decoration: none;
}

.notes2 li a:hover {
	font-weight: bold;
	color: #c9742b;	
	text-decoration: none;
}


</style>

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
          <td valign="top">
 <div class="alertsh">Alerts</div> 
 
  <div id="tabs">
	<ul>
		<li><a href="#tabs-1">Daily Sheets</a></li>
	<!--- 	<li><a href="#tabs-2">Payroll</a></li> --->
        <li><a href="#tabs-4">Sign Out</a></li>
        <li><a href="#tabs-5">Reports</a></li>
 	</ul>
	<div id="tabs-1">
    <cfquery name="get_ds_tech" datasource="jrgm"  > 
SELECT  * FROM APP_daily_sheets  WHERE    crew_leader_id = #SESSION.userid#  AND ds_approved IS NULL AND ds_date > '05/31/2014' ORDER by ds_date DESC
  </cfquery>
    <span class="alertnofields">The following Daily Sheets have NOT been approved.</span><br />
       <div class="spacer10"></div> 
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
                <cfoutput query="get_ds_tech">
                  <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_ds_tech.supervisor_id#
        </cfquery>
                  <tr>
                    <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">#ID#</a></td>
                    <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                    <td align="left">#get_info_S.branch#</td>
                    <td>#get_info_S.employee_name#</td>
                  </tr>
                </cfoutput>
              </tbody>
              </table></div>
 
	
    <div id="tabs-4"> 
      <div class="alertsSub">Hours&nbsp; </div>
      <span class="alertnofields">Employees that answered "I do not agree" to hours signout question</span>&nbsp; (Showing last 20)<br />
       <div class="spacer10"></div> 
      
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
  <thead>
                <tr>
                       <th align="left">DSID</th>
                       <th align="left">Date</th>
                  <th align="left">Employee Name</th>
                  <th align="left">Supervisor</th>
                  <th align="left">Crew Leader</th>
                </tr>
                </thead>
    <tbody>
      <cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT  * FROM APP_daily_sheets  WHERE (( Supervisor_ID = #SESSION.userid#)) AND ds_date > '05/31/2014' ORDER by ds_date DESC
    </cfquery>
       <CFSET mylistds ="0">
<cfloop query="get_daily_sheets">
  <cfset mylistds = ListAppend(mylistds,ID)>
</cfloop>
         <cfquery name="get_employees_CompleteHours" datasource="jrgm" maxrows="20">
        SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0 AND ds_id In (#mylistds#)  
       ORDER by ds_date desc
          </cfquery>
        <cfoutput query="get_employees_CompleteHours">   
        <cfquery name="get_employees_name" datasource="jrgm">
        SELECT  first_name ,  last_name,branch , [Name FirstLast]AS fullname   FROM 
        app_employees WHERE [Employee ID] = #get_employees_CompleteHours.employee_ID#
        </cfquery>
          <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,last_name
FROM   app_employees WHERE [Employee ID] =#get_employees_CompleteHours.crew_leader#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch,last_name
FROM   app_employees WHERE [Employee ID] =#get_employees_CompleteHours.supervisor#
        </cfquery>
          <tr>
    <td nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#get_employees_CompleteHours.ds_id#" target="_blank">#ds_id#</a></td>
<td nowrap="nowrap" align="left">#dateformat(ds_date,"mm/dd/yy")# </td> 
            <td nowrap="nowrap">#get_employees_name.fullname#</td>
    <!---        <td nowrap="nowrap">#get_employees_name.branch#</td> --->
           <td nowrap="nowrap">#get_info_S.last_name#</td>
          <td nowrap="nowrap">#get_info_CL.last_name#</td>
          </tr>
        </cfoutput>
           <tr>
    <td colspan="5" nowrap="nowrap" ><a href="report_signout_questions_hours.cfm"  class="notes2"><strong>Show All ></strong> </a></td>
           </tr>
          </tbody>
</table>
              <div class="alertsSub">Injury</div> 
                  <span class="alertnofields">Employees that answered "I do not agree" to injury signout question</span>&nbsp; (Showing last 20)<br />
               <div class="spacer10"></div> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
       <thead>
                <tr>
             <th align="left">DSID</th>
                         <th align="left">Date</th>
                  <th align="left">Employee Name</th>
                  <th align="left">Supervisor</th>
                  <th align="left">Crew Leader</th>
                </tr>
                </thead>
    <tbody>
          <cfquery name="get_employees_injury" datasource="jrgm" maxrows="20">
        SELECT * FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND ds_id In (#mylistds#)
       ORDER by ds_date desc
          </cfquery>
       
        <cfoutput query="get_employees_injury">   
        <cfquery name="get_employees_name" datasource="jrgm">
        SELECT  first_name ,  last_name,branch , [Name FirstLast]AS fullname   FROM 
        app_employees WHERE [Employee ID] = #get_employees_injury.employee_ID#
        </cfquery>
          <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,last_name
FROM   app_employees WHERE [Employee ID] =#get_employees_injury.crew_leader#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch, last_name
FROM   app_employees WHERE [Employee ID] =#get_employees_injury.supervisor#
        </cfquery>
          <tr>         
           <td  nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#get_employees_injury.ds_id#" target="_blank">#ds_id#</a></td>
             <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yy")# </td> 
         <td nowrap="nowrap" align="left">#get_employees_name.fullname#</td>
    <!---        <td nowrap="nowrap">#get_employees_name.branch#</td> --->
           <td nowrap="nowrap">#get_info_S.last_name#</td>
          <td nowrap="nowrap">#get_info_CL.last_name#</td>
          </tr>
        </cfoutput>
            <tr>
    <td colspan="5" nowrap="nowrap" ><a href="report_signout_questions_injury.cfm"  class="notes2"><strong>Show All ></strong> </a></td>
           </tr>
          </tbody>
      </table>
</div>

  <div id="tabs-5"> 
      <div class="alertsSub">Reports</div>
      
      <!--- <a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a
 >  --->
  </div>
           </td>
          <!--- <td valign="top" >
		<!---   <cfif SESSION.branch EQ 'test'>
              <div class="blueAlignment"><a href="manage_crew_leaders.cfm" class="bluebutton">Manage Crew Leaders</a> </div>
            </cfif> --->
            <cfquery name="get_employees_notes" datasource="jrgm">
SELECT  ID,note_content,employee_id,Note_Author_ID, Note_Date FROM app_notes WHERE Employee_ID  
 IN (SELECT Employee_ID FROM app_crews WHERE  Employee_branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
            </cfquery>
             <!--- <cfdump var="#get_employees_notes#">  --->
           <div class="noteshtop">
  <div class="notestitle">Employee Notes</div>
 </div>
            <div class="notes">
              
              <cfif get_employees_notes.recordcount EQ 0>
                <p>No Employee Notes for today</p>
                <cfelse>
                
                
                
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortablenotes">
              
                 <tbody>
                   <cfoutput query="get_employees_notes">
                    <cfquery name="get_employees_name" datasource="jrgm">
SELECT  [Name FirstLast] AS empname FROM app_employees  WHERE [Employee ID]  =
 #get_employees_notes.employee_id#
</cfquery>
                    
                    
                   <tr>
                   <td>#dateformat(Note_Date,"mm/dd/yy")#</td>
                   <td><a href="employee_details.cfm?employee_id=#employee_id#&work_date=#todayDate#">#get_employees_name.empname#</a> : #note_content#</td>
                   <td><a href=""><i class="fa fa-times-circle"></i></a></td>
                   </tr> 
                  </cfoutput>
                </tbody></table>
                
              </cfif>
              <p><a href="employee_notes.cfm">
              View all employee notes >
              </a></p></div>
            <cfquery name="get_job_notes" datasource="jrgm" maxrows="10">
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID]  FROM app_jobs WHERE  branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
</cfquery>
            <!--- <cfdump var="#get_job_notes#"> --->
           <div class="notesh">
<div class="notestitle">Job Notes</div></div>
            <div class="notes">
             
              <cfif get_job_notes.recordcount EQ 0>
                 <p>No Job Notes for today</p>
                <cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortablenotes">
              
                 <tbody>
                  <cfoutput query="get_job_notes">
                    <cfquery name="get_jobs_name" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname FROM app_jobs WHERE  [Job ID]  =
 '#get_job_notes.job_id#'
</cfquery>
                    
                    
                   <tr>
                   <td>#dateformat(Note_Date,"mm/dd/yy")#</td>
                   <td><a href="job_details.cfm?job_id=#job_id#&work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                   <td><a href=""><i class="fa fa-times-circle"></i></a></td>
                   </tr> 
                  </cfoutput>
                </tbody></table>
              </cfif>
               <p><a href="job_notes.cfm">
              View all job notes >
              </a></p>
            </div>                 
                       </td> --->
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
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
$( "#tabs" ).tabs();


</script>
</body>
</html>
