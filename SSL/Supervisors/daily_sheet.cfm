<cfif IsDefined("url.unapprove")>
  <cfquery name="approve_ds" datasource="#request.dsn#">
 UPDATE  app_daily_sheets SET ds_approved =NULL, ds_approved_date=NULL,ds_approved_by = NULL,ds_date_last=CURRENT_TIMESTAMP,  ds_last_by =#SESSION.userid#  WHERE ID = #dsid#
 </cfquery>
  <cfelseif IsDefined("url.approve")>
   <cfquery name="approve_ds" datasource="#request.dsn#">
 UPDATE  app_daily_sheets SET ds_approved =1, ds_approved_date=CURRENT_TIMESTAMP,ds_approved_by = #SESSION.userid#,ds_date_last=CURRENT_TIMESTAMP,  ds_last_by =#SESSION.userid#    WHERE ID = #dsid#
 </cfquery>
</cfif>
<!--- ds_date_last  - ds_last_by --->
 <cfquery name="get_open_workers" datasource="jrgm" >
 SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
 WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #url.dsid# AND CAST(Time_In as date) = CAST(getdate() as date)
 </cfquery>
 
 <CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
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
<cfset todayDate_query = #ds_date#>
<cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
<cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
<cfset Now_Time = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<!---   Get Daily Sheet for Crew Leader --->
<CFSET dsid= get_ds.id>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #crew_leader_id#   
</cfquery>
<!------------------- Get in progress time ---------------------->
<cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM app_employee_payroll_clock 
    WHERE in_out_status = 1 AND crew_leader =#crew_leader_id#
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="jrgm">
    UPDATE App_Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
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
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.redtype {
	color: #F00;
}
.greentype1 {
	color: #588302;
}
.dssbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background:-moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color:#8299bb;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #3f4b5b;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	text-align: center;
	padding:6px 14px;
	text-decoration:none;
	width: 100px;
	margin-right: 20px;
	margin-top: 20px;
}
.dssbutton:hover {
	color:#ffffff;
	text-decoration:none;
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
      <div class="header">Daily Sheet</div>
      <table width="100%" border="0" cellpadding="0"  >
        <tr>
          <td><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                <table border="0" cellpadding="0" cellspacing="0"  >
                  <tr>
                    <td nowrap="nowrap" class="dstable_top2">Date : <cfoutput>#DateFormat(ds_date, "mmmm dd, yyyy")#</cfoutput></td>
                    <td class="dstable_topwidth">Crew Leader : <cfoutput>#get_crew_leader.employeename#</cfoutput></td>
                   </tr>
                  <tr>
                    <td nowrap="nowrap" class="dstable_top2">DSID : <cfoutput query="get_ds">#ID#</cfoutput></td>
                    <td class="dstable_topwidth" >Supervisor : <cfoutput>#get_supervisor.employeename#</cfoutput></td>
                    </tr>
                </table></td>
                <td><table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td nowrap="nowrap" align="left" class="dstable_top2"><span class="orangetype"><cfif get_ds.ds_approved EQ 1>
                      Approved as of <cfoutput>#DateFormat(get_ds.ds_approved_date, "mm/dd/yyyy")#</cfoutput>
                    </cfif></span></td>
                    <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS))  AND timenow GT today_3PM) AND get_open_workers.recordcount  EQ 0>
                      <td></td>
                      <td ><cfif get_ds.ds_approved EQ 1>
                        <cfoutput><a href="daily_sheet.cfm?dsid=#get_ds.ID#&email=yes&unapprove=yes" class="redbutton">Unapprove</a></cfoutput>
                        <cfelse>
                        <cfoutput><a href="daily_sheet_edit.cfm?dsid=#get_ds.ID#"  class="bluebutton">Edit </a><a href="daily_sheet.cfm?dsid=#get_ds.ID#&email=yes&approve=yes" class="greenbutton">Approve</a></cfoutput>
                      </cfif></td>
                    </cfif>
                  </tr>
                </table></td>
              </tr>
            </table>
            <div class="spacer20"></div>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
            <tr>
              <td class="dstable_header">Name</td>
              <td align="center" class="dstable_header">#</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Total  (H:M)</td>
            </tr>
            <cfquery name="get_employees_for_Crew_Leader" datasource="jrgm">
			 SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,last_name   FROM APP_employees
   			WHERE [Employee ID] IN 
			(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE  ds_id = #dsid#) 
			 ORDER by last_name ASC
		</cfquery>
            <cfoutput query="get_employees_for_Crew_Leader">
              <tr>
               <cfquery name="get_employees_CompleteHours" datasource="jrgm">
        SELECT CompleteHours FROM 
       app_employee_payroll_clock WHERE CompleteHours =0  AND   Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
           </cfquery>
           <cfquery name="get_employees_injury" datasource="jrgm">
        SELECT IsEmpInjury  FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND   Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
           </cfquery>
                  <td class="dstable">#employee_name# -#Employee_ID#&nbsp; &nbsp;
				  <cfif get_employees_CompleteHours.CompleteHours EQ 0>
                    <span class="redtype">(Hours Disagreed)</span>
                  </cfif><cfif get_employees_injury.IsEmpInjury EQ 0>&nbsp; &nbsp;
                    <span class="redtype">(Injury Disagreed)</span>
                  </cfif></td>
                <cfquery name="get_number_of_times" datasource="jrgm">
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                 GROUP by Employee_ID
 				 </cfquery>
                <td align="center"  class="dstable"><a href="daily_sheet_view_employee_time.cfm?ds_id=#dsid#&Employee_ID=#Employee_ID#">#get_number_of_times.cid#</a></td>
                <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
				SELECT  ID,time_In, ISNULL(time_Out,#Now_Time#)  AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				ORDER by time_in ASC
                </cfquery>
                <cfquery name="get_employee_time_am_current" datasource="jrgm" maxrows="1">
				SELECT     time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				ORDER by time_in ASC
				</cfquery>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_am_current.time_Out EQ "">
                    *
                  </cfif></td>
                <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
				SELECT time_In,ISNULL(time_Out,#Now_Time#)  AS time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				AND ID  <> #get_employee_time_am.ID#
				ORDER by time_in DESC
                </cfquery>
                <cfquery name="get_employee_time_pm_current" datasource="jrgm" maxrows="1">
				SELECT     time_Out FROM app_employee_payroll_clock 
				WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
				AND ds_id = #dsid#
				ORDER by time_in DESC
				</cfquery>
                <!--- <cfdump var="#get_employee_time_pm_current#"> 
 --->
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_pm_current.time_Out EQ "">
                    *
                  </cfif></td>
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
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# 
       ORDER BY  ID ASC
 		</CFQUERY>
            <!---   <cfdump var="#get_this_job_lunch#">   --->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
              <cfoutput>
                <tr>
                  <td   colspan="17" valign="middle" nowrap="nowrap"  class="dstable_headersm1">#get_this_job_name.event_name# -#get_this_job.job_id# - Job Clock ID: #get_this_job.id# <br />
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
                  </td>
                </tr>
              </cfoutput>
              <tr>
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
			SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM app_job_services_actual_employee 
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
                  <td class="dstable"  nowrap="nowrap" >#get_employee_name.employee_name#</td>
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
                  <td class="dstable_subheader" nowrap="nowrap">Materials Used</td>
                  <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" >Quantity </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >Unit</td>
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
          <br />
          <br />
          <cfquery name="get_gps_info" datasource="jrgm"  >
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_ds.ID#  
                    ORDER by DS_Date ASC
 			 </cfquery>
          <table width="100%" border="0" cellpadding="0"  class="dailysheet_table">
            <tr>
              <td class="dstable_header">ID</td>
              <td class="dstable_header">CLID</td>
              <td class="dstable_header">DSID</td>
              <td class="dstable_header">Date</td>
              <td class="dstable_header">Time</td>
              <td class="dstable_header">GPS Latitude</td>
              <td class="dstable_header">GPS Longitude</td>
              <td class="dstable_header">GPS<br />
                Status</td>
              <td class="dstable_header">Network<br />
                Status</td>
              <td class="dstable_header">Map</td>
              <td class="dstable_header">Notes</td>
            </tr>
            <cfoutput query="get_gps_info">
              <tr>
                <td  class="dstable">#ID#</td>
                <td  class="dstable">#crew_leader_ID#</td>
                <td  class="dstable">#DS_ID#</td>
                <td  class="dstable">#DateFormat(DS_Date, "dddd, mmmm dd, yyyy")#</td>
                <td  class="dstable">#TimeFormat(DS_Date, "hh:mm tt")#</td>
                <td  class="dstable">#NumberFormat(gps_latitude,"999.999")#</td>
                <td  class="dstable">#NumberFormat(gps_longitude,"999.999")#</td>
                <td  class="dstable">#GPS_Status#</td>
                <td  class="dstable">#Network_Status#</td>
                <td  class="dstable"><a href="https://maps.google.com/maps?q=#get_gps_info.gps_latitude#,#get_gps_info.gps_longitude#" target="_blank">Map</a></td>
                <td  class="dstable">#notes#</td>
              </tr>
            </cfoutput>
          </table></td>
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
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
 