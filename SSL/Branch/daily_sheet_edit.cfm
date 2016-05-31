<!--- This code is for the prior day timeout issue --->
 <cfset todayDate = Now()> 
    <cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
     <cfset mytime = timeFormat(now(), "hh:mm tt")>
  <!---   EMPLOYEES --->
    <cfquery name="time_me_out" datasource="jrgm">
 SELECT * FROM APP_Employee_Payroll_Clock WHERE In_out_status = 1 AND ds_date < '#today_datex#'
 </cfquery>
   <!---  <cfdump  var="#time_me_out#"> --->
    <br />
    <br />
    <cfif  time_me_out.recordcount GT 0>
    <!--- <cfmail to="pat@1design.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="Timed in Prior Branch"  type="html">
 Timed in Prior Branch  -#time_me_out.ds_id#
    </cfmail> --->
    
      <cfloop query="time_me_out">
        <cfset y = year(time_me_out.ds_date)>
        <cfset m = month(time_me_out.ds_date)>
        <cfset d = day(time_me_out.ds_date)>
        <cfset thatday_5PM = createDatetime(y,m,d,17,0,0)>
        <CFSET outtime = thatday_5PM>
        <cfquery name="time_me_out_update" datasource="jrgm">
 UPDATE APP_Employee_Payroll_Clock 
 SET   Time_Out =  #outtime#
  WHERE ID = #time_me_out.ID#
 </cfquery>
      </cfloop>
    </cfif>
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out) 
      </cfquery>
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out), in_out_status=2
    WHERE time_out IS NOT NULL
     </cfquery>
   <!---  <strong>JOBS</strong> --->
    <cfquery name="time_me_outj" datasource="jrgm">
  SELECT * FROM APP_Job_Clock WHERE In_out_status = 1 AND job_time_in < '#today_datex#'
    </cfquery>
<!---     <cfdump  var="#time_me_outj#"> --->
    <cfif  time_me_outj.recordcount GT 0>
      <cfloop query="time_me_outj">
        <cfset y = year(time_me_outj.Job_Time_In)>
        <cfset m = month(time_me_outj.Job_Time_In)>
        <cfset d = day(time_me_outj.Job_Time_In)>
        <cfset thatday_5PM = createDatetime(y,m,d,17,0,0)>
        <CFSET outtime = thatday_5PM>
        <cfquery name="time_me_out_update" datasource="jrgm">
 UPDATE APP_job_Clock 
 SET   Job_Time_Out =  #outtime#
  WHERE ID = #time_me_outj.ID#
 </cfquery>
      </cfloop>
    </cfif>
    <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2
    WHERE job_time_out IS NOT NULL  AND ID > 50000
     </cfquery>
 <!--- This code is for the prior day timeout issue --->











<cfif IsDefined("url.unapprove")>
  <cfquery name="approve_ds" datasource="#request.dsn#">
 UPDATE  app_daily_sheets SET ds_approved =NULL, ds_approved_date=NULL,ds_approved_by = #SESSION.userid#  WHERE ID = #dsid#
 </cfquery>
  <cfelseif IsDefined("url.approve")>
   <cfquery name="approve_ds" datasource="#request.dsn#">
 UPDATE  app_daily_sheets SET ds_approved =1, ds_approved_date=CURRENT_TIMESTAMP,ds_approved_by = #SESSION.userid#  WHERE ID = #dsid#
 </cfquery>
  <cflocation url="dailysheet_select.cfm">
</cfif>

 <cfquery name="get_open_workers" datasource="jrgm" >
 SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
 WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #url.dsid# AND CAST(Time_In as date) = '#DateFormat(now(), 'yyyy-mm-dd')#'
 </cfquery>

<cfquery name="get_ds" datasource="jrgm">
SELECT   * FROM app_daily_sheets  WHERE ID=#url.dsid#   
</cfquery>
<CFSET ds_date =  get_ds.ds_date>
<CFSET supervisor_id =  get_ds.supervisor_id>
<CFSET crew_leader_id =  get_ds.crew_leader_id>
<CFSET dsid =  get_ds.ID>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset todayDate_query = #ds_date#>
<cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
<cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
<cfset Now_Time = Now()>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<!---   Get Daily Sheet for Crew Leader --->
<CFSET dsid= get_ds.id>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename,branch FROM app_employees WHERE [Employee ID]=   #supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #crew_leader_id#   
</cfquery>
<!------------------- Get in progress time ---------------------->
<cfquery name="update_employee_time" datasource="jrgm">
 UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out) WHERE ds_id =#url.dsid#
</cfquery>
<CFIF NOT IsDefined("SESSION.BRANCH")>
  <cfset SESSION.BRANCH = #get_supervisor.branch#>
</CFIF>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style type="text/css">
input {
	text-align:left;
	font: bold 16px Arial, Helvetica, sans-serif;
	color: #333333;	
	padding: 4px 6px 3px 6px;
	width: 150px;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}

.redarialbig {
	padding-top: 24px;
	font: bold 1.2em Arial, Helvetica, sans-serif;
	color: red;
}
</style>

</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
  <div class="header">Edit Daily Sheet</div>
  <div class="spacer10"></div>
  <cfif IsDefined("url.message")>
  <span class="redarialbig">Please add all employees to the new daily sheet first and then add jobs. </span><br>
  <br />
   </cfif>
    <table width="100%" border="0" cellpadding="0"  >
      <tr>
        <td> 
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td nowrap="nowrap" class="dstable_top2" ><strong>Date : <cfoutput>#DateFormat(ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
              <td align="left" nowrap="nowrap" class="dstable_topwidth"><strong>Crew Leader : <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
               </tr>
            <tr>
              <td nowrap="nowrap" class="dstable_top2" ><strong>DSID: <cfoutput query="get_ds">#ID#</cfoutput></strong></td>
              <td align="left" nowrap="nowrap" class="dstable_topwidth"><strong>Supervisor : <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
            </tr>
          </table></td>
          <td> 
        <table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td nowrap="nowrap" align="left" class="dstable_top2"><span class="orangetype"><cfif get_ds.ds_approved EQ 1>
                  Approved as of <cfoutput>#DateFormat(get_ds.ds_approved_date, "mm/dd/yyyy")#</cfoutput>
                </cfif></span></td>
                <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS))  AND timenow GT today_3PM) AND get_open_workers.recordcount  EQ 0>
                  <td><cfif get_ds.ds_approved EQ 1>
                    <cfoutput><a href="daily_sheet_edit.cfm?dsid=#get_ds.ID#&email=yes&unapprove=yes" class="redbutton">Unapprove</a></cfoutput>
                    <cfelse>
                    <cfoutput><a href="daily_sheet.cfm?dsid=#get_ds.ID#&email=yes&approve=yes" class="greenbutton">Approve</a></cfoutput>
                  </cfif></td>
                </cfif>
              </tr>
            </table></td>
        <td> <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="dstable_top"><a href="dailysheet_help.cfm?" onclick="javascript:void window.open('dailysheet_help.cfm','1384819222444','width=800,height=725,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,right=0,top=20');return false;"><i class="fa-red fa-question-circle"></i></a>
            <cfoutput><a href="daily_sheet_edit.cfm?dsid=#dsid#"><i class="fa-green fa-refresh"></i></a></cfoutput>
             <cfoutput><a href="daily_sheet_edit_add_job1.cfm?ds_id=#dsid#" class="greenbuttonsm">Add a Job</a></cfoutput></td>
           </tr>
        </table>
        </td></tr></table>
   <div class="spacer20"></div>
       
     <!---   <cfdump var="#Application#">   --->
        <table width="100%" border="0" cellpadding="0"  >
          <tr>
            <td>
               <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
                <tr>
                  <td width="25" align="center" class="dstable_header">Edit</td>
                  <td class="dstable_header">Name</td>
                  <td align="center" class="dstable_header">#</td>
                  <td align="center" class="dstable_header">Start</td>
                  <td align="center" class="dstable_header">End</td>
                  <td align="center" class="dstable_header">Start</td>
                  <td align="center" class="dstable_header">End</td>
                  <td align="center" class="dstable_header">Total  (H:M)</td>
                </tr>
                <cfquery name="get_employees_for_Crew_Leader" datasource="jrgm">
				SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,last_name  FROM APP_employees
				WHERE [Employee ID] IN 
				(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE  ds_id = #dsid#) 
				 ORDER by last_name ASC
		        </cfquery>
                <!---      <cfdump var="#get_employees_for_Crew_Leader#">   --->
                <cfoutput query="get_employees_for_Crew_Leader">
                  <tr>
                    <td width="25" align="center" class="dstable">
                   <cfif ds_date GT #APPLICATION.blockdate#>
                    <a href="daily_sheet_edit_employee_time1.cfm?ds_id=#dsid#&Employee_ID=#get_employees_for_Crew_Leader.Employee_ID#"><i class="fa-orange fa-pencil-square"></i></a>
                    </cfif>
                    </td>
                    <td class="dstable">#employee_name#</td>
                    <cfquery name="get_number_of_times" datasource="jrgm">
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                 GROUP by Employee_ID
 				    </cfquery>
                    <td align="center"  class="dstable">#get_number_of_times.cid#</td>
                    <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
				SELECT  ID,time_In,  time_Out AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid# <!--- AND (time_In IS NOT NULL AND  --->
				ORDER by time_in ASC
                    </cfquery>
                    <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                    <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")# &nbsp;</td>
                    <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
				SELECT time_In, time_Out   AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				AND ID  <> #get_employee_time_am.ID#  <!--- AND time_In IS NOT NULL --->
				ORDER by time_in DESC
                    </cfquery>
                    <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
                    <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")# &nbsp;</td>
                    <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM app_employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                    </cfquery>
                    <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                    <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM app_employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid# AND in_out_status =1
                    </cfquery>
                    <!---  <cfdump var="#get_employee_minutes_for_day_inprogress#"> --->
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
                    <td  class="dstable" align="center">#hours#:#NumberFormat(minutes,"09")#</td>
                  </tr>
                </cfoutput>
          <!---           <cfif dateDiff('d',ds_date,now()) LT 15>  ---><!--- <cfoutput>#ds_date# -#APPLICATION.blockdate#</cfoutput> --->
                   <cfif ds_date GT #APPLICATION.blockdate#> 
                       <tr> <cfoutput>
                  <td colspan="2" class="dstable"><a href="daily_sheet_edit_add_employee.cfm?" onclick="javascript:void window.open('daily_sheet_edit_add_employee.cfm?dsid=#dsid#','1384819222444','width=800,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,left=300,top=20');return false;"><i class="fa-green fa-plus-square"></i><span class="greentype">Add Employee</span></a></td>
                </cfoutput>
                  <td colspan="6" valign="middle"   class="dstable"></td>
                </tr>
                </cfif>
              </table>
              <CFQUERY name="get_this_job" datasource="#request.dsn#">
  		SELECT * FROM app_job_clock   
  		WHERE Crew_Leader_ID =#crew_leader_id#   AND ds_id = #dsid# 
        ORDER BY  Job_Time_Out ASC
  	          </CFQUERY>
              <!--- <cfdump var="#get_this_job#">    --->
              <cfloop query="get_this_job" >
                <cfquery name="get_this_job_name" datasource="jrgm">
		SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_this_job.job_id#'
			    </cfquery>
                <CFQUERY name="get_this_job_lunch" datasource="#request.dsn#">
		  SELECT * FROM app_lunch   
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# ORDER BY  ID ASC
 		        </CFQUERY>
                <!---   <cfdump var="#get_this_job_lunch#">   --->
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table" >
                  <cfoutput>
                    <tr>
                      <td width="25"  align="center" valign="middle"  class="dstable_headersm1"><a href="daily_sheet_edit_job1.cfm?ID=#get_this_job.ID#&ds_id=#dsid#"><i class="fa-orange fa-pencil-square"></i></a></td>
                      <td   colspan="16" valign="middle" nowrap="nowrap"  class="dstable_headersm1">#get_this_job_name.event_name# - #job_id# - Job Clock ID: #get_this_job.id# <br />
                        Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#
                        <cfif get_this_job_lunch.Lunch_Time_In NEQ "">
                          &nbsp; &nbsp;  Lunch Start: #TimeFormat(get_this_job_lunch.Lunch_Time_In, "hh:mm tt")#
                        </cfif>
                        <cfif get_this_job_lunch.Lunch_Time_Out NEQ "">
                          &nbsp; &nbsp;Lunch Stop: #TimeFormat(get_this_job_lunch.Lunch_Time_Out, "hh:mm tt")#
                        </cfif>
                        <cfif get_this_job.Job_Time_Out IS "">
                          &nbsp; &nbsp; <span class="redtype">Job in Progress</span>
                          <cfelse>
                          &nbsp; &nbsp; End #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                        </cfif>
                        &nbsp;
                        <cfif get_this_job.job_time_worked EQ "">
                          <CFSET get_this_job.job_time_worked = 0>
                        </cfif>
                        <cfparam name="Lunch_Time" default="0">
                        <cfif get_this_job_lunch.recordcount EQ 0>
                          <cfset totalminutes_this_job=#get_this_job.job_time_worked#>
                          <cfelse>
                          <cfset totalminutes_this_job=#get_this_job.job_time_worked#-#get_this_job_lunch.Lunch_Time#>
                        </cfif>
                        <cfset hours_all_tj= int(totalminutes_this_job\60)>
                        <cfset minutes_all_tj = int(totalminutes_this_job mod 60)>
                        <cfif get_this_job.job_time_worked GT 0>
                          &nbsp; &nbsp; Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)
                        </cfif>
                        <!---   <cfquery name="get_all_employee_minutes_for_job" datasource="jrgm"  >
					SELECT Sum(total_time) AS  minutes_worked_day_crew FROM APP_job_services_actual_employee  
					WHERE job_clock_id=  '#get_this_job.ID#'
  					AND ds_id = #dsid#
                  </cfquery>
                  <!--- <cfdump var="#get_all_employee_minutes_for_job#"> --->
                  <cfif get_all_employee_minutes_for_job.minutes_worked_day_crew EQ "">
                    <CFSET get_all_employee_minutes_for_job.minutes_worked_day_crew = 0>
                  </cfif>
                  <cfset totalminutes="#get_all_employee_minutes_for_job.minutes_worked_day_crew#">
                  <cfset hours_all_j= int(totalminutes\60)>
                  <cfset minutes_all_j = int(totalminutes mod 60)> --->
                        <!---   <cfif totalminutes GT 0>
                       &nbsp; &nbsp;   &nbsp; &nbsp;  Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)
                    </cfif > &nbsp; &nbsp;   &nbsp; &nbsp;  --->
                        <span class="redtype"><br>
                          Please make sure all crew members service time is accounted for</span></td>
                    </tr>
                  </cfoutput>
                  <tr>
                    <td width="25" class="dstable_subheader">&nbsp;</td>
                    <td class="dstable_subheader">Employee</td>
                    <td class="dstable_subheader" align="center">1000<br />
                      Compl</td>
                    <td class="dstable_subheader" align="center">1010<br />
                      Prune</td>
                    <td class="dstable_subheader" align="center">1020<br />
                      Trash Rem</td>
                    <td class="dstable_subheader" align="center">1040<br />
                      Edge</td>
                    <td class="dstable_subheader" align="center">1070<br />
                      Turf Fert</td>
                    <td class="dstable_subheader" align="center">1080<br />
                      Aer</td>
                    <td class="dstable_subheader" align="center">1090<br />
                      Overseed</td>
                    <td class="dstable_subheader" align="center">2000<br />
                      Lime</td>
                    <td class="dstable_subheader" align="center">2030<br />
                      Seas Col</td>
                    <td class="dstable_subheader" align="center">2050<br />
                      Leaf Rem</td>
                    <td class="dstable_subheader" align="center">2060<br />
                      Misc.</td>
                    <td class="dstable_subheader" align="center">2090<br />
                      BdWeed</td>
                    <td class="dstable_subheader" align="center">3030<br />
                      BdMulch</td>
                    <td class="dstable_subheader" align="center">4000<br />
                      Extra</td>
                  </tr>
                  <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
                  <cfquery name="get_employee_time_services" datasource="jrgm"   >
			SELECT ID, Employee_ID,SERVICE_ID,TOTAL_TIME,JOB_clock_ID FROM app_job_services_actual_employee 
			WHERE   job_clock_id = #get_this_job.ID#
		AND ds_id = #dsid# 
			      </cfquery>
                  <!--- <cfdump var="#get_employee_time_services#">   --->
                  <cfoutput query="get_employee_time_services" >
                    <cfset hours_all_s= int(get_employee_time_services.total_time\60)>
                    <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
                    <cfquery name="get_employee_name" datasource="jrgm">
            	 SELECT [Employee ID] As employee_id,[Name FirstLast] AS employee_name FROM APP_employees WHERE [Employee ID] =  #get_employee_time_services.Employee_ID#
                    </cfquery>
                    <!--- <cfoutput> --->
                    <tr>
                      <td width="25" align="center"  nowrap="nowrap" class="dstable"><a href="daily_sheet_edit_employee_service_time1.cfm?ds_id=#dsid#&Employee_ID=#get_employee_time_services.Employee_ID#&JOB_clock_ID=#get_employee_time_services.job_clock_id#&totalminutes=#totalminutes_this_job#"><i class="fa-orange fa-pencil-square"></i></a></td>
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
				SELECT * FROM app_job_materials_actual  
				WHERE   job_clock_id=  '#get_this_job.ID#'
 			      </cfquery>
                  <cfif get_materials_used.recordcount GT 0>
                    <tr>
                      <td width="25" nowrap="nowrap" class="dstable_subheader">&nbsp;</td>
                      <td class="dstable_subheader" nowrap="nowrap">Materials Used</td>
                      <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" >Quantity </td>
                      <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >Unit</td>
                      <td class="dstable_subheader" colspan="12"   align="center" valign="bottom" nowrap="nowrap" >&nbsp;</td>
                    </tr>
                  </cfif>
                  <cfoutput query="get_materials_used">
                    <tr>
                      <td width="25" align="center" nowrap="nowrap" class="dstable" ><a href="daily_sheet_edit_materials1.cfm?ds_id=#dsid#&MATID=#get_materials_used.ID#"><i class="fa-orange fa-pencil-square"></i></a></td>
                      <td class="dstable" nowrap="nowrap" >#item_id#</td>
                      <td   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#Quantity_used#</td>
                      <td  align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#unit_used#</td>
                      <td colspan="12"   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >&nbsp;</td>
                    </tr>
                  </cfoutput>
                  <tr>
                    <td align="left" colspan="16" class="dstable">
					<cfoutput><a href="daily_sheet_edit_add_materials1.cfm?dsid=#dsid#&job_clock_id=#get_this_job.ID#"><i class="fa-green fa-plus-square"></i><span class="greentype">Add Materials</span></a></cfoutput>
                   <cfoutput><a href="daily_sheet_edit_add_employee_job.cfm?" onclick="javascript:void window.open('daily_sheet_edit_add_employee_job.cfm?dsid=#dsid#&job_clock_id=#get_this_job.ID#','1384819222444','width=800,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,left=300,top=20');return false;"><i class="fa-green fa-plus-square"></i><span class="greentype">Add Employee to this Job</span></a></cfoutput>
                    <cfif get_this_job_lunch.Lunch_Time_In EQ "">
                    <cfoutput><a href="daily_sheet_edit_add_lunch1.cfm?ds_id=#dsid#&job_clock_id=#get_this_job.ID#"><i class="fa-green fa-plus-square"></i><span class="greentype">Add Lunch to this Job</span></a></cfoutput></td>
                      <cfelse>
                    </cfif>
                   
                  </tr>
                </table>
              </cfloop>
              <br /></td>
          </tr>
        </table>
      <!---  <div class="spacer20"></div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
            <tr>
              <td width="25" align="center" class="dstable_header">Edit</td>
              <td class="dstable_header">Name</td>
              <td align="center" class="dstable_header">#</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Total  (H:M)</td>
            </tr>
            <cfquery name="get_employees_for_Crew_Leader" datasource="jrgm">
				SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,last_name  FROM APP_employees
				WHERE [Employee ID] IN 
				(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE  ds_id = #dsid#) 
				 ORDER by last_name ASC
		</cfquery>
            <!---      <cfdump var="#get_employees_for_Crew_Leader#">   --->
            <cfoutput query="get_employees_for_Crew_Leader">
              <tr>
                <td width="25" align="center" class="dstable"><a href="daily_sheet_edit_employee_time1.cfm?ds_id=#dsid#&Employee_ID=#get_employees_for_Crew_Leader.Employee_ID#"><img src="images/edit.png" width="20" height="20" /></a></td>
                <td class="dstable">#employee_name#</td>
                <cfquery name="get_number_of_times" datasource="jrgm">
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                 GROUP by Employee_ID
 				 </cfquery>
                <td align="center"  class="dstable">#get_number_of_times.cid#</td>
                <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
				SELECT  ID,time_In,  time_Out AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid# <!--- AND (time_In IS NOT NULL AND  --->
				ORDER by time_in ASC
                </cfquery>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")# &nbsp;</td>
                <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
				SELECT time_In, time_Out   AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				AND ID  <> #get_employee_time_am.ID#  <!--- AND time_In IS NOT NULL --->
				ORDER by time_in DESC
                </cfquery>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")# &nbsp;</td>
                <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM app_employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                </cfquery>
                <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM app_employee_payroll_clock 
WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid# AND in_out_status =1
                </cfquery>
                <!---  <cfdump var="#get_employee_minutes_for_day_inprogress#"> --->
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
                <td  class="dstable" align="center">#hours#:#NumberFormat(minutes,"09")#</td>
              </tr>
            </cfoutput>
            <tr> <cfoutput>
                <td width="25" align="center" class="dstable"><a href="daily_sheet_edit_add_employee.cfm?" onclick="javascript:void window.open('daily_sheet_edit_add_employee.cfm?dsid=#dsid#','1384819222444','width=800,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,left=300,top=20');return false;"><img src="images/add.png" width="20" height="20" /></a> </td>
              </cfoutput>
              <td colspan="7" valign="middle"   class="dstable"><span class="greentype">Add Employee</span></td>
            </tr>
          </table>
          <CFQUERY name="get_this_job" datasource="#request.dsn#">
  		SELECT * FROM app_job_clock   
  		WHERE Crew_Leader_ID =#crew_leader_id#   AND ds_id = #dsid# 
        ORDER BY  Job_Time_Out ASC
  	      </CFQUERY>
          <!--- <cfdump var="#get_this_job#">    --->
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="jrgm">
		SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_this_job.job_id#'
			</cfquery>
            <CFQUERY name="get_this_job_lunch" datasource="#request.dsn#">
		  SELECT * FROM app_lunch   
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# ORDER BY  ID ASC
 		</CFQUERY>
            <!---   <cfdump var="#get_this_job_lunch#">   --->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table" >
              <cfoutput>
                <tr>
                  <td width="25"  align="center" valign="middle"  class="dstable_headersm1"><a href="daily_sheet_edit_job1.cfm?ID=#get_this_job.ID#&ds_id=#dsid#"><img src="images/edit.png" width="20" height="20" /></a></td>
                  <td   colspan="16" valign="middle" nowrap="nowrap"  class="dstable_headersm1">#get_this_job_name.event_name# - #job_id# - Job Clock ID: #get_this_job.id# <br />
                    Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#
                    <cfif get_this_job_lunch.Lunch_Time_In NEQ "">
                      &nbsp; &nbsp;  Lunch Start: #TimeFormat(get_this_job_lunch.Lunch_Time_In, "hh:mm tt")#
                    </cfif>
                    <cfif get_this_job_lunch.Lunch_Time_Out NEQ "">
                      &nbsp; &nbsp;Lunch Stop: #TimeFormat(get_this_job_lunch.Lunch_Time_Out, "hh:mm tt")#
                    </cfif>
                    <cfif get_this_job.Job_Time_Out IS "">
                      &nbsp; &nbsp; <span class="redtype">Job in Progress</span>
                      <cfelse>
                      &nbsp; &nbsp; End #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                    </cfif>
                    &nbsp;
                    <cfif get_this_job.job_time_worked EQ "">
                      <CFSET get_this_job.job_time_worked = 0>
                    </cfif>
                    <cfparam name="Lunch_Time" default="0">
                    <cfif get_this_job_lunch.recordcount EQ 0>
                      <cfset totalminutes_this_job=#get_this_job.job_time_worked#>
                      <cfelse>
                      <cfset totalminutes_this_job=#get_this_job.job_time_worked#-#get_this_job_lunch.Lunch_Time#>
                    </cfif>
                    <cfset hours_all_tj= int(totalminutes_this_job\60)>
                    <cfset minutes_all_tj = int(totalminutes_this_job mod 60)>
                    <cfif get_this_job.job_time_worked GT 0>
                      &nbsp; &nbsp; Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)
                    </cfif>
                    <!---   <cfquery name="get_all_employee_minutes_for_job" datasource="jrgm"  >
					SELECT Sum(total_time) AS  minutes_worked_day_crew FROM APP_job_services_actual_employee  
					WHERE job_clock_id=  '#get_this_job.ID#'
  					AND ds_id = #dsid#
                  </cfquery>
                  <!--- <cfdump var="#get_all_employee_minutes_for_job#"> --->
                  <cfif get_all_employee_minutes_for_job.minutes_worked_day_crew EQ "">
                    <CFSET get_all_employee_minutes_for_job.minutes_worked_day_crew = 0>
                  </cfif>
                  <cfset totalminutes="#get_all_employee_minutes_for_job.minutes_worked_day_crew#">
                  <cfset hours_all_j= int(totalminutes\60)>
                  <cfset minutes_all_j = int(totalminutes mod 60)> --->
                    <!---   <cfif totalminutes GT 0>
                       &nbsp; &nbsp;   &nbsp; &nbsp;  Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)
                    </cfif > &nbsp; &nbsp;   &nbsp; &nbsp;  --->
                    <span class="redtype"><br>
                    Please make sure all crew members service time is accounted for</span></td>
                </tr>
              </cfoutput>
              <tr>
                <td width="25" class="dstable_subheader">&nbsp;</td>
                <td class="dstable_subheader">Employee</td>
                <td class="dstable_subheader" align="center">1000<br />
                  Compl</td>
                <td class="dstable_subheader" align="center">1010<br />
                  Prune</td>
                <td class="dstable_subheader" align="center">1020<br />
                  Trash Rem</td>
                <td class="dstable_subheader" align="center">1040<br />
                  Edge</td>
                <td class="dstable_subheader" align="center">1070<br />
                  Turf Fert</td>
                <td class="dstable_subheader" align="center">1080<br />
                  Aer</td>
                <td class="dstable_subheader" align="center">1090<br />
                  Overseed</td>
                <td class="dstable_subheader" align="center">2000<br />
                  Lime</td>
                <td class="dstable_subheader" align="center">2030<br />
                  Seas Col</td>
                <td class="dstable_subheader" align="center">2050<br />
                  Leaf Rem</td>
                <td class="dstable_subheader" align="center">2060<br />
                  Misc.</td>
                <td class="dstable_subheader" align="center">2090<br />
                  BdWeed</td>
                <td class="dstable_subheader" align="center">3030<br />
                  BdMulch</td>
                <td class="dstable_subheader" align="center">4000<br />
                  Extra</td>
              </tr>
              <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
              <cfquery name="get_employee_time_services" datasource="jrgm"   >
			SELECT ID, Employee_ID,SERVICE_ID,TOTAL_TIME,JOB_clock_ID FROM app_job_services_actual_employee 
			WHERE   job_clock_id = #get_this_job.ID#
		AND ds_id = #dsid# 
			</cfquery>
              <!--- <cfdump var="#get_employee_time_services#">   --->
              <cfoutput query="get_employee_time_services" >
                <cfset hours_all_s= int(get_employee_time_services.total_time\60)>
                <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
                <cfquery name="get_employee_name" datasource="jrgm">
            	 SELECT [Employee ID] As employee_id,[Name FirstLast] AS employee_name FROM APP_employees WHERE [Employee ID] =  #get_employee_time_services.Employee_ID#
                </cfquery>
                <!--- <cfoutput> --->
                <tr>
                  <td width="25" align="center"  nowrap="nowrap" class="dstable"><a href="daily_sheet_edit_employee_service_time1.cfm?ds_id=#dsid#&Employee_ID=#get_employee_time_services.Employee_ID#&JOB_clock_ID=#get_employee_time_services.job_clock_id#&totalminutes=#totalminutes_this_job#"><img src="images/edit.png" width="20" height="20" /></a></td>
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
				SELECT * FROM app_job_materials_actual  
				WHERE   job_clock_id=  '#get_this_job.ID#'
 			 </cfquery>
              <cfif get_materials_used.recordcount GT 0>
                <tr>
                  <td width="25" nowrap="nowrap" class="dstable_subheader">&nbsp;</td>
                  <td class="dstable_subheader" nowrap="nowrap">Materials Used</td>
                  <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" >Quantity </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >Unit</td>
                  <td class="dstable_subheader" colspan="12"   align="center" valign="bottom" nowrap="nowrap" >&nbsp;</td>
                </tr>
              </cfif>
              <cfoutput query="get_materials_used">
                <tr>
                  <td width="25" align="center" nowrap="nowrap" class="dstable" ><a href="daily_sheet_edit_materials1.cfm?ds_id=#dsid#&MATID=#get_materials_used.ID#"><img src="images/edit.png" width="20" height="20" /></a></td>
                  <td class="dstable" nowrap="nowrap" >#item_id#</td>
                  <td   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#Quantity_used#</td>
                  <td  align="center" valign="bottom" nowrap="nowrap" class="dstable"  >#unit_used#</td>
                  <td colspan="12"   align="center" valign="bottom" nowrap="nowrap" class="dstable"  >&nbsp;</td>
                </tr>
              </cfoutput>
              <tr>
                <td width="25" align="center" class="dstable"><cfoutput> <a href="daily_sheet_edit_add_materials1.cfm?dsid=#dsid#&job_clock_id=#get_this_job.ID#"><img src="images/add.png" width="20" height="20" /></a> </cfoutput></td>
                <td valign="middle"   class="dstable"><span class="greentype">Add Materials</span></td>
                <td valign="middle"   class="dstable"></td>
                <td valign="middle"   class="dstable">&nbsp;</td>
                <td align="right" valign="middle"   class="dstable"><cfoutput><a href="daily_sheet_edit_add_employee_job.cfm?" onclick="javascript:void window.open('daily_sheet_edit_add_employee_job.cfm?dsid=#dsid#&job_clock_id=#get_this_job.ID#','1384819222444','width=800,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1,left=300,top=20');return false;"><img src="images/add.png" alt="" width="20" height="20" /></a></cfoutput> </td>
                <td colspan="3" valign="middle"   class="dstable"><span class="greentype1">Add Employee to this Job</span></td>
                <td valign="middle"   class="dstable">&nbsp;</td>
                <cfif get_this_job_lunch.Lunch_Time_In EQ "">
                  <td align="right" valign="middle"   class="dstable"><cfoutput><a href="daily_sheet_edit_add_lunch1.cfm?ds_id=#dsid#&job_clock_id=#get_this_job.ID#"><img src="images/add.png" alt="" width="20" height="20" /></a></cfoutput></td>
                  <td colspan="3" valign="middle"   class="dstable"><span class="greentype1">Add Lunch to this Job</span></td>
                  <cfelse>
                  <td align="right" valign="middle"   class="dstable" colspan="4">&nbsp;</td>
                </cfif>
                <td valign="middle"   class="dstable">&nbsp;</td>
                <td valign="middle"   class="dstable">&nbsp;</td>
                <td valign="middle"   class="dstable">&nbsp;</td>
              </tr>
            </table>
          </cfloop>
        --->
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html><!---  This is the good join query
 <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT t1.*, t2.*  FROM app_job_services_actual_employee AS T1 INNER JOIN job_clock AS T2 ON T1.Job_ID = T2.Job_ID WHERE crew_leader =#crew_leader_id#
  ORDER by t2.ID ASC
    </CFQUERY> --->
<!---  down vote accepted
	

This is current accepted way to link to a specific lat lon (rather than search for the nearest object).

http://maps.google.com/maps?z=12&t=m&q=loc:38.9419+-78.3020

    z is the zoom level (1-20)
    t is the map type ("m" map, "k" satellite, "h" hybrid, "p" terrain, "e" GoogleEarth)
    q is the search query, if it is prefixed by loc: then google assumes it is a lat lon separated by a +

 --->
