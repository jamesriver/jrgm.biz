<cfset url.ds_date = '6/24/13'>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_query = #url.ds_date#>
<cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
<cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
<cfset Now_Time = Now()>
<!---  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  <cfset today = dateadd("d",0,somedate)> --->
<!---   Get Daily Sheet for Crew Leader --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/print.css" rel="stylesheet" media="print" type="text/css" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.redtype {
	color: #F00;
}
</style>
</head>
<body >
<!--- <div id="outerfull"> --->
<div id="centrecontent">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfquery name="get_ds" datasource="jrgm">
SELECT   * FROM app_daily_sheets  WHERE  ds_date= '#url.ds_date#'
</cfquery>
    <!---   Get Daily Sheet for Crew Leader --->
    <cfloop query="get_ds">
      <CFSET dsid= get_ds.id>
      <cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employee_name FROM   app_employees WHERE [Employee ID]=   #get_ds.supervisor_id#   
</cfquery>
      <cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employee_name FROM   app_employees WHERE [Employee ID]=  #get_ds.crew_leader_id#   
</cfquery>
      <!------------------- Get in progress time ---------------------->
      <cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM  app_employee_payroll_clock WHERE in_out_status = 1 AND crew_leader =#get_ds.crew_leader_id#
    </cfquery>
      <cfif calculate_time.recordcount GT 0>
        <cfoutput query="calculate_time">
          <cfquery name="update_time" datasource="jrgm">
    UPDATE Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
        </cfoutput>
      </cfif>
      <!------------------- Get in progress time ---------------------->
      <table width="100%" border="0" cellpadding="0"  >
        <tr>
          <td><div class="header"> Administrative &#8212; Daily Sheet
              <cfif IsDefined("url.employee_id")>
                for <cfoutput query="get_crew_leader"> #employee_Name# </cfoutput>
              </cfif>
            </div></td>
          <td class="dstable_date" align="right"><cfoutput>#DateFormat(url.ds_date, "dddd, mmmm dd, yyyy")# </cfoutput> </td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="0"  >
        <tr>
          <td><cfquery name="get_all_employee_minutes_for_day" datasource="jrgm"  > 
SELECT  SUM(ISNULL(time_worked,time_worked_current)) AS  minutes_worked_day_crew FROM  app_employee_payroll_clock WHERE crew_leader =#get_ds.crew_leader_id# AND  Time_In >= '#todayDate_query#'
 and Time_In < '#tomorrowDate_query#'  AND ds_id = #dsid#
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
                <td class="dstable_top" align="left" >Crew Leader : <cfoutput>#get_crew_leader.Employee_Name# - #get_ds.crew_leader_id#</cfoutput></td>
                <td class="dstable_top" align="left">Supervisor : <cfoutput>#get_supervisor.Employee_Name#-#get_ds.supervisor_id#</cfoutput></td>
                <td class="dstable_top" align="left">DSID : <cfoutput>#get_ds.ID#</cfoutput></td>
                <td class="dstable_top" align="right" nowrap="nowrap" > Total Crew Hours for Day : &nbsp;&nbsp; <cfoutput>#hours_all#:#minutes_all#&nbsp;&nbsp;  (#totalminutes# min.)</cfoutput></td>
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
SELECT DISTINCT Employee_ID,crew_name AS employee_name FROM crews 
WHERE Employee_ID IN 
(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE crew_leader =#get_ds.crew_leader_id# 
 AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#' AND ds_id = #dsid#) 
</cfquery>
              <!--- <cfdump var="#get_employees_for_Crew_Leader#">
 --->
              <cfoutput query="get_employees_for_Crew_Leader">
                <tr>
                  <td class="dstable">#employee_name# -#Employee_ID#</td>
                  <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
SELECT  ID,time_In, ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#' AND ds_id = #dsid#
ORDER by ID ASC
                </cfquery>
                  <cfquery name="get_employee_time_am_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#' AND ds_id = #dsid#
ORDER by ID ASC
</cfquery>
                  <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                  <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                    <cfif get_employee_time_am_current.time_Out EQ "">
                      *
                    </cfif></td>
                  <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
SELECT time_In,ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#'
AND ID  <> #get_employee_time_am.ID# AND ds_id = #dsid#
ORDER by ID DESC
                </cfquery>
                  <cfquery name="get_employee_time_pm_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND  Time_In >= '#todayDate_query#'
AND Time_In < '#tomorrowDate_query#' AND ds_id = #dsid#
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
SELECT Sum(time_worked) AS  minutes_worked_day FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#'  AND ds_id = #dsid#
                </cfquery>
                  <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                  <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND  Time_In >= '#todayDate_query#'
 AND Time_In < '#tomorrowDate_query#' AND in_out_status =1  AND ds_id = #dsid#
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
  SELECT * FROM job_clock   
  WHERE Crew_Leader_ID =#get_ds.crew_leader_id# AND  Job_Time_In >= '#todayDate_query#'
   AND Job_Time_In < '#tomorrowDate_query#' AND ds_id = #dsid# ORDER BY  ID ASC
     </CFQUERY>
            <!--- <cfdump var="#get_this_job#">    --->
            <cfloop query="get_this_job" >
              <cfquery name="get_this_job_name" datasource="jrgm">
SELECT event_name FROM app_events 
WHERE job_id ='#get_this_job.job_id#'
ORDER by ID ASC
</cfquery>
              <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
                <cfoutput>
                  <tr>
                    <td  class="dstable_header"   colspan="4" nowrap="nowrap">#get_this_job_name.event_name# - #job_id# - Job Clock ID: #get_this_job.id# </td>
                    <td  class="dstable_headersm" colspan="2" align="left" nowrap="nowrap">Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")# </td>
                    <td  class="dstable_headersm" colspan="2" align="left" nowrap>End
                      <cfif get_this_job.Job_Time_Out IS "">
                        <span class="redtype">Job in Progress</span>
                        <cfelse>
                        #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                      </cfif>
                      &nbsp;</td>
                    <cfif get_this_job.job_time_worked EQ "">
                      <CFSET get_this_job.job_time_worked = 0>
                    </cfif>
                    <cfset totalminutes_this_job="#get_this_job.job_time_worked#">
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
                    <td class="dstable_headersm" colspan="4" nowrap="nowrap"><cfif totalminutes GT 0>
                        Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)
                    </cfif
                 ></td>
                  </tr>
                </cfoutput>
                <tr>
                  <td class="dstable_subheader" nowrap="nowrap">Employee</td>
                  <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" >1000<br />
                    Complete </td>
                  <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" >1010<br />
                    Prune </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >1020<br />
                    Trash Rem</td>
                  <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" >1040<br />
                    Edge </td>
                  <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" >1070<br />
                    Turf Fert </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >1080<br />
                    Aeration </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >1090<br />
                    Overseed </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >2000<br />
                    Lime </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >2030<br />
                    Seas. Color </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >2050<br />
                    Leaf Rem</td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >2060<br />
                    Misc. </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >2090<br />
                    Bed Weed </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >3030<br />
                    Mulch Bed </td>
                  <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" >4000<br />
                    Extra </td>
                </tr>
                <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
                <cfquery name="get_employee_time_services" datasource="jrgm"   >
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM job_services_actual_employee 
WHERE   job_clock_id = #get_this_job.ID#
AND  Service_Time_In >= '#todayDate_query#'
 AND Service_Time_In < '#tomorrowDate_query#' AND ds_id = #dsid#
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
                    <td class="dstable"  nowrap="nowrap">#get_employee_name.employee_name# - #Employee_ID#</td>
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
                <!---    </cfloop> --->
                <cfquery name="get_materials_used" datasource="jrgm"  >
SELECT * FROM job_materials_actual  
WHERE   job_clock_id=  '#get_this_job.ID#' AND ds_id = #dsid#
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
          </td>
        </tr>
      </table>
    </cfloop>
  </div>
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div --><script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
<!---  This is the good join query
 <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT t1.*, t2.*  FROM job_services_actual_employee AS T1 INNER JOIN job_clock AS T2 ON T1.Job_ID = T2.Job_ID WHERE crew_leader =#url.crew_leader_id#
  ORDER by t2.ID ASC
    </CFQUERY> --->
