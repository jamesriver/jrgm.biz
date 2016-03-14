<!--- This is the code to force cl to enter services --->
<cfif   IsDefined("Session.job_services_entered") AND  Session.job_services_entered EQ 0>
  <cfquery name="get_job_without_services" datasource="jrgm" maxrows="1">
SELECT * FROM job_clock WHERE Crew_Leader_ID = #Session.userid#  
ORDER by ID DESC 
</cfquery>
  <cflocation url="services.cfm?work_date=#todayDate_DS#&job_id=#get_job_without_services.job_id#&ID=#get_job_without_services.ID#">
</cfif>
<!--- END This is the code to force cl to enter services --->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset todayDate_query = #DateFormat("#Now()#", "mm/dd/yyyy")#>
<cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, now())#>
<cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
<cfset Now_Time = Now()>

 <!---   Get Daily Sheet for Crew Leader --->
<cfquery name="get_ds" datasource="jrgm">
SELECT   * FROM daily_sheets  WHERE crew_leader_id=#session.userid#   AND  ds_date= '#todayDate_DS#'
</cfquery>
<CFSET dsid= get_ds.id>
<!--- <cfdump var="#get_todays_jobs#"> --->
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS crewleadername FROM employees WHERE [Employee ID]=  #session.userid#  <!--- AND export_id =1 --->
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM employees WHERE [Employee ID]=  #session.supervisor_id#  <!--- AND export_id =1 --->
</cfquery>
<!------------------- Get in progress time ---------------------->
<cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM  employee_payroll_clock 
    WHERE in_out_status = 1 AND crew_leader =#session.userid#
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="jrgm">
    UPDATE Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
  </cfoutput>
</cfif>
<!------------------- Get in progress time ---------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/print.css" rel="stylesheet" media="print" type="text/css" />
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
</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/topbar.cfm">
  <cfinclude template="includes/subbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <table width="100%" border="0" cellpadding="0"  >
      <tr>
        <td><div class="header">Daily Sheet
            <cfif IsDefined("url.employee_id")>
              for <cfoutput query="get_crew_leader"> #employee_Name# </cfoutput>
            </cfif>
          </div></td>
        <td class="dstable_date" align="right"><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")# </cfoutput> </td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="0"  >
      <tr>
        <td><cfquery name="get_all_employee_minutes_for_day" datasource="jrgm"  > 
SELECT  SUM(ISNULL(time_worked,time_worked_current)) AS  minutes_worked_day_crew FROM employee_payroll_clock  
WHERE crew_leader =#session.userid# AND  Time_In >= '#todayDate_query#'
 and Time_In < '#tomorrowDate_query#'
 </cfquery>
          <cfif get_all_employee_minutes_for_day.minutes_worked_day_crew EQ "">
            <CFSET get_all_employee_minutes_for_day.minutes_worked_day_crew = 0>
          </cfif>
          <!--- <cfdump var="#get_all_employee_minutes_for_day#"> --->
          <cfset totalminutes="#get_all_employee_minutes_for_day.minutes_worked_day_crew#">
          <!--- convert to hours/minutes --->
          <cfset hours_all= int(totalminutes\60)>
          <cfset minutes_all = int(totalminutes mod 60)>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table_top" >
            <tr>
              <td class="dstable_top" align="left" ><strong>Crew Leader : </strong><cfoutput>#get_crew_leader.crewleadername#</cfoutput></td>
              <td class="dstable_top" align="left"><strong>Supervisor : </strong><cfoutput>#get_supervisor.employeename#</cfoutput></td>
              <td class="dstable_top" align="right" nowrap="nowrap" ><strong> Total Crew Hours for Day : &nbsp;</strong>&nbsp; <cfoutput>#hours_all#:#minutes_all#&nbsp;&nbsp;  (#totalminutes# min.)</cfoutput></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
            <tr>
              <td class="dstable_header">Name</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Total  (H:M)</td>
            </tr>
            <cfquery name="get_employees_for_Crew_Leader" datasource="jrgm">
SELECT DISTINCT Employee_ID,crew_name AS employee_name,Employee_Position_ID FROM crews 
WHERE Employee_ID IN 
(SELECT Employee_ID FROM Employee_Payroll_Clock 
 WHERE crew_leader =#session.userid# 
 AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#') 
 ORDER by Employee_Position_ID DESC 
</cfquery>


            <cfoutput query="get_employees_for_Crew_Leader">
              <tr>
                <td class="dstable">#employee_name#</td>
                <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
SELECT  ID,time_In, ISNULL(time_Out,#Now_Time#)  AS time_Out FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#'
ORDER by ID ASC
                </cfquery>
                <cfquery name="get_employee_time_am_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#'
ORDER by ID ASC
</cfquery>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_am_current.time_Out EQ "">
                    *
                  </cfif></td>
                <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
SELECT time_In,ISNULL(time_Out,#Now_Time#)  AS time_Out FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#'
AND ID  <> #get_employee_time_am.ID#
ORDER by ID DESC
                </cfquery>
                <cfquery name="get_employee_time_pm_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#'
ORDER by ID DESC
</cfquery>
                <!--- <cfdump var="#get_employee_time_pm_current#"> 
 --->
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_pm_current.time_Out EQ "">
                    *
                  </cfif></td>
                <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#'
                </cfquery>
                <!---    <cfdump var="#get_employee_minutes_for_day#">   --->
                <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#' AND in_out_status =1
                </cfquery>
                <!---      <cfdump var="#get_employee_minutes_for_day_inprogress#">  --->
                <cfif get_employee_minutes_for_day.minutes_worked_day EQ "" AND get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress EQ "">
                  <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                <cfif get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress NEQ "">
                  <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                    <CFSET get_employee_minutes_for_day.minutes_worked_day =0>
                  </cfif>
                  <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day#+#get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress# >
                  <cfelse>
                  <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day# >
                </cfif>
                <cfset hours = int(totalminutes\60)>
                <cfset minutes = int(totalminutes mod 60)>
                <td  class="dstable" align="center"><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
              </tr>
            </cfoutput>
          </table>
     <!---      <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM job_clock   
  WHERE Crew_Leader_ID =#session.userid# AND  Job_Time_In >= '#todayDate_query#'
   AND Job_Time_In < '#tomorrowDate_query#' ORDER BY  ID ASC
     </CFQUERY>
          <!--- <cfdump var="#get_this_job#">    --->
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="jrgm">
SELECT event_name FROM events 
WHERE job_id ='#get_this_job.job_id#'
ORDER by ID ASC
</cfquery>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
              <cfoutput>
                <tr>
                  <td  class="dstable_header"   colspan="4" nowrap="nowrap"><strong>#get_this_job_name.event_name# </strong></td>
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap="nowrap"><strong>Start</strong><strong>&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")# </strong></td>
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap="nowrap"><strong>End </strong><strong>
                    <cfif get_this_job.Job_Time_Out IS "">
                      <span class="redtype">Job in Progress</span>
                      <cfelse>
                      #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                    </cfif>
                    </strong>&nbsp;</td>
                  <cfif get_this_job.JOB_TIME_WORKED EQ "">
                    <CFSET get_this_job.JOB_TIME_WORKED = 0>
                  </cfif>
                  <cfset totalminutes_this_job="#get_this_job.JOB_TIME_WORKED#">
                  <cfset hours_all_tj= int(totalminutes_this_job\60)>
                  <cfset minutes_all_tj = int(totalminutes_this_job mod 60)>
                  <td  class="dstable_headersm" colspan="3" nowrap="nowrap"><cfif get_this_job.JOB_TIME_WORKED GT 0>
                      <strong>Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)</strong>
                    </cfif></td>
                  <cfquery name="get_all_employee_minutes_for_job" datasource="jrgm"  >
SELECT Sum(total_time) AS  minutes_worked_day_crew FROM job_services_actual_employee  
WHERE job_clock_id=  '#get_this_job.ID#'
AND  Service_Time_In >= '#todayDate_query#'
AND Service_Time_In < '#tomorrowDate_query#'
                  </cfquery>
                  <!--- <cfdump var="#get_all_employee_minutes_for_job#"> --->
                  <cfif get_all_employee_minutes_for_job.minutes_worked_day_crew EQ "">
                    <CFSET get_all_employee_minutes_for_job.minutes_worked_day_crew = 0>
                  </cfif>
                  <cfset totalminutes="#get_all_employee_minutes_for_job.minutes_worked_day_crew#">
                  <cfset hours_all_j= int(totalminutes\60)>
                  <cfset minutes_all_j = int(totalminutes mod 60)>
                  <td class="dstable_headersm" nowrap="nowrap"><cfif totalminutes GT 0>
                      <strong>Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.) </strong>
                    </cfif></td>
                  <td class="dstable_headersm" nowrap="nowrap">&nbsp;</td>
                  <td class="dstable_headersm" nowrap="nowrap">
<cfif get_this_job.Lunch_Time GT 0><strong>Lunch</strong></cfif> &nbsp;</td>
                  <td class="dstable_headersm" nowrap="nowrap">&nbsp;</td>
                </tr> --->
                  <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM job_clock   
  WHERE Crew_Leader_ID =#session.userid# AND  Job_Time_In >= '#todayDate_query#'
   AND Job_Time_In < '#tomorrowDate_query#' ORDER BY  ID ASC
     </CFQUERY>
         <!---    <cfdump var="#get_this_job#">    ---> 
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="jrgm">
SELECT event_name FROM events 
WHERE job_id ='#get_this_job.job_id#'
ORDER by ID ASC
</cfquery>

 <!---  <cfdump var="#get_this_job_name#">   --->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
              <cfoutput>
                    <tr>
                  <td  class="dstable_header"   colspan="4" nowrap="nowrap">#get_this_job_name.event_name# - #get_this_job.job_id# - Job Clock ID: #get_this_job.id# </td>
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap="nowrap">Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#   </td>
               <cfif get_this_job.Lunch_Time_Out NEQ ""> 
               <td  class="dstable_headersm"   align="left" nowrap="nowrap">  
                Lunch Start : #TimeFormat(get_this_job.Lunch_Time_Out, "hh:mm tt")#
                    </td>
                    
                    
                  </cfif>
                  
                   <cfif get_this_job.Lunch_Time_In NEQ ""> 
               <td  class="dstable_headersm"   align="left" nowrap="nowrap">  
                Lunch Stop: #TimeFormat(get_this_job.Lunch_Time_In, "hh:mm tt")#
                    </td>
                  </cfif>
                
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap>
                    <cfif get_this_job.Job_Time_Out IS "">
                      <span class="redtype">Job in Progress</span>
                      <cfelse>
                    End  #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                    </cfif>
                    &nbsp;</td>
                  <cfif get_this_job.job_time_worked EQ "">
                    <CFSET get_this_job.job_time_worked = 0>
                  </cfif>
                  <cfset totalminutes_this_job=#get_this_job.job_time_worked#-#Lunch_Time#>
                  <cfset hours_all_tj= int(totalminutes_this_job\60)>
                  <cfset minutes_all_tj = int(totalminutes_this_job mod 60)>
                  <td  class="dstable_headersm" colspan="3" nowrap="nowrap"><cfif get_this_job.job_time_worked GT 0>
                      Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)
                    </cfif></td>
                  <cfquery name="get_all_employee_minutes_for_job" datasource="jrgm"  >
SELECT Sum(total_time) AS  minutes_worked_day_crew FROM job_services_actual_employee  
WHERE job_clock_id=  '#get_this_job.ID#'
AND  Service_Time_In >= '#todayDate_query#'
AND Service_Time_In < '#tomorrowDate_query#'  AND ds_id = #dsid#
                  </cfquery>
                  <!--- <cfdump var="#get_all_employee_minutes_for_job#"> --->
                  <cfif get_all_employee_minutes_for_job.minutes_worked_day_crew EQ "">
                    <CFSET get_all_employee_minutes_for_job.minutes_worked_day_crew = 0>
                  </cfif>
                  <cfset totalminutes="#get_all_employee_minutes_for_job.minutes_worked_day_crew#">
                  <cfset hours_all_j= int(totalminutes\60)>
                  <cfset minutes_all_j = int(totalminutes mod 60)>
                  <td class="dstable_headersm" colspan="2" nowrap="nowrap"><cfif totalminutes GT 0>
                      Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)
                    </cfif
                 ></td>
                <cfif get_this_job.Lunch_Time_Out EQ ""> 
                 <td class="dstable_headersm" colspan="2"> 
  </td>  </cfif>
                </tr>
              </cfoutput>
              
              <tr>
                <td class="dstable_subheader" nowrap="nowrap"><strong>Employee</strong></td>
                <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" ><strong>1000<br />
                  Complete </strong></td>
                <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" ><strong>1010<br />
                  Prune </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1020<br />
                  Trash Rem</strong></td>
                <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" ><strong>1040<br />
                  Edge </strong></td>
                <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" ><strong>1070<br />
                  Turf Fert </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1080<br />
                  Aeration </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1090<br />
                  Overseed </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2000<br />
                  Lime </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2030<br />
                  Seas. Color </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2050<br />
                  Leaf Rem</strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2060<br />
                  Misc. </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2090<br />
                  Bed Weed </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>3030<br />
                  Mulch Bed </strong></td>
                <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>4000<br />
                  Extra </strong></td>
              </tr>
              <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
              <cfquery name="get_employee_time_services" datasource="jrgm"   >
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM job_services_actual_employee 
WHERE   job_clock_id = #get_this_job.ID#
AND  Service_Time_In >= '#todayDate_query#'
 AND Service_Time_In < '#tomorrowDate_query#'
</cfquery>
              <!--- <cfdump var="#get_employee_time_services#">   --->
              <cfoutput query="get_employee_time_services" >
                <cfset hours_all_s= int(get_employee_time_services.total_time\60)>
                <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
                <cfquery name="get_employee_name" datasource="jrgm">
            SELECT crew_name AS employee_name FROM crews WHERE Employee_ID =  #get_employee_time_services.Employee_ID#
                </cfquery>
                <!--- <cfoutput> --->
                <tr>
                  <td class="dstable"  nowrap="nowrap">#get_employee_name.employee_name#</td>
                  <td class="dstable" align="center"><cfif SERVICE_ID EQ 1000>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1010>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable" align="center"><cfif SERVICE_ID EQ 1020>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1040>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1070>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1080>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1090>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2000>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2030>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2050>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2060>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable" align="center"><cfif SERVICE_ID EQ 2090>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable" align="center"><cfif SERVICE_ID EQ 3030>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                  <td class="dstable" align="center"><cfif SERVICE_ID EQ 4000>
                      #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                    </cfif></td>
                </tr>
                
              </cfoutput>
          <cfquery name="get_materials_used" datasource="jrgm"  >
SELECT * FROM job_materials_actual  
WHERE   job_clock_id=  '#get_this_job.ID#'
  </cfquery>
              <cfif get_materials_used.recordcount GT 0>
                <tr>
                  <td class="dstable_subheader" nowrap="nowrap"><strong>Materials Used</strong></td>
                  <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" ><strong>Quantity </strong></td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>Unit</strong></td>
                  <td class="dstable_subheader" colspan="12"   align="center" valign="bottom" nowrap="nowrap" >&nbsp;</td>
                </tr>
              </cfif>
              <cfoutput query="get_materials_used">
                <tr>
                  <td class="dstable" nowrap="nowrap" >#item_id#</td>
                  <td   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#Quantity_used#</td>
                  <td  align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#unit_used#</td>
                  <td colspan="12"   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >&nbsp;</td>
                </tr>
              </cfoutput>
            </table>
          </cfloop>
        </td>
      </tr>
    
    </table>
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
<!---  This is the good join query
 <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT t1.*, t2.*  FROM job_services_actual_employee AS T1 INNER JOIN job_clock AS T2 ON T1.Job_ID = T2.Job_ID WHERE Crew_Leader = #Session.userid#
  ORDER by t2.ID ASC
    </CFQUERY> --->
