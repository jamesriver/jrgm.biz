

<!---   Get Daily Sheet for Crew Leader --->
<cfquery name="get_ds" datasource="jrgm">
SELECT   * FROM app_daily_sheets  WHERE ID=#url.dsid#   <!--- AND  ds_date= '#url.ds_date#' --->
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

<cfif ds_date GT '12/05/15'><cflocation url="daily_sheet2.cfm?dsid=#url.dsid#"></cfif>


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
SELECT  branch, [Employee ID], [Name FirstLast] AS employee_name FROM   app_employees WHERE [Employee ID]=   #supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employee_name FROM   app_employees WHERE [Employee ID]=  #crew_leader_id#    
</cfquery>
<!------------------- Get in progress time ---------------------->
<cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM  app_employee_payroll_clock WHERE in_out_status = 1 AND crew_leader =#crew_leader_id#
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
  </cfoutput>
</cfif>
<!------------------- Get in progress time ---------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
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
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
 
    <table width="100%" border="0" cellpadding="0"  >
      <tr>
        <td><cfquery name="get_all_employee_minutes_for_day" datasource="jrgm"  > 
SELECT  SUM(ISNULL(time_worked,time_worked_current)) AS  minutes_worked_day_crew FROM  app_employee_payroll_clock WHERE crew_leader =#crew_leader_id# 
AND ds_id = #dsid#
 </cfquery>
          <cfif get_all_employee_minutes_for_day.minutes_worked_day_crew EQ "">
            <CFSET get_all_employee_minutes_for_day.minutes_worked_day_crew = 0>
          </cfif>
          <!--- <cfdump var="#get_all_employee_minutes_for_day#"> --->
          <cfset totalminutes="#get_all_employee_minutes_for_day.minutes_worked_day_crew#">
          <!--- convert to hours/minutes --->
          <cfset hours_all= int(totalminutes\60)>
          <cfset minutes_all = int(totalminutes mod 60)>
          <table width="95%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table_top" >
            <tr class="dstable">
              <td height="25" align="left" nowrap="nowrap" class="dstable_top">Branch : <cfoutput>#get_supervisor.branch#</cfoutput></td>
              <td height="25" align="left" nowrap="nowrap" class="dstable_top">Date : <cfoutput>#DateFormat(ds_date, "mmmm dd, yyyy")#</cfoutput></td>
          <td height="25" align="left" nowrap="nowrap" class="dstable_top">Production Manager : <cfoutput>#get_supervisor.Employee_Name#-#supervisor_id#</cfoutput></td>
              <td height="25" align="left" nowrap="nowrap" class="dstable_top">Supervisor : <cfoutput>#get_crew_leader.Employee_Name# - #crew_leader_id#</cfoutput></td>
              <td align="left" nowrap="nowrap" class="dstable_top">DSID : <cfoutput>#dsid#</cfoutput></td>
           
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
            <tr class="dstable_headersm">
              <td class="dstable_header">Name</td>
              <td align="center" class="dstable_header">#</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Total  (H:M)</td>
            </tr>
            <cfquery name="get_employees_for_Crew_Leader" datasource="jrgm">
SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position, last_name <!--- ,Employee_Position_ID  ---> FROM APP_employees
WHERE [Employee ID] IN 
(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE crew_leader =#crew_leader_id# 
 AND ds_id = #dsid#) 
 ORDER by last_name ASC
            </cfquery>
            <!--- <cfdump var="#get_employees_for_Crew_Leader#">
 --->
            <cfoutput query="get_employees_for_Crew_Leader">
              <tr>
                <td class="dstable">#employee_name# -#Employee_ID#</td>
                 <cfquery name="get_number_of_times" datasource="jrgm">
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  app_employee_payroll_clock WHERE Employee_ID				=#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                 GROUP by Employee_ID
 				 </cfquery>
                
                <td align="center"  class="dstable"><a href="daily_sheet_view_employee_time.cfm?ds_id=#dsid#&Employee_ID=#Employee_ID#">#get_number_of_times.cid#</a></td>
                <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
SELECT  ID,time_In, ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In ASC
                </cfquery>
                <cfquery name="get_employee_time_am_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In ASC
</cfquery>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_am_current.time_Out EQ "">
                    *
                  </cfif></td>
                <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
SELECT time_In,ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ID  <> #get_employee_time_am.ID# AND ds_id = #dsid#
ORDER by time_In DESC
                </cfquery>
                <cfquery name="get_employee_time_pm_current" datasource="jrgm" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In DESC
</cfquery>
                <!--- <cfdump var="#get_employee_time_pm_current#"> 
 --->
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#
                  <cfif get_employee_time_pm_current.time_Out EQ "">
                    *
                  </cfif></td>
                <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                </cfquery>
                <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND in_out_status =1  AND ds_id = #dsid#
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
  		SELECT * FROM APP_job_clock   
  		WHERE  ds_id = #dsid# ORDER BY  job_time_out ASC
   	      </CFQUERY>
          <!--- <cfdump var="#get_this_job#">    --->
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="jrgm">
			SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_this_job.job_id#'
			ORDER by ID ASC
			</cfquery>
            <CFQUERY name="get_this_job_lunch" datasource="#request.dsn#">
		  SELECT * FROM app_lunch   
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# ORDER BY  ID ASC
 		</CFQUERY>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
             
              <cfoutput>
                <tr>
                  <td  class="dstable_headersm"   colspan="3" nowrap="nowrap">#get_this_job_name.event_name# - #get_this_job.job_id# - Job Clock ID: #get_this_job.id#</td>
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap="nowrap">Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#</td>
                  <cfif get_this_job_lunch.Lunch_Time_In NEQ "">
                    <td  class="dstable_headersm"   align="left" nowrap="nowrap" colspan="2"> Lunch Start: #TimeFormat(get_this_job_lunch.Lunch_Time_In, "hh:mm tt")#</td>
                  </cfif>
                  <cfif get_this_job_lunch.Lunch_Time_Out NEQ "">
                    <td  class="dstable_headersm"   align="left" nowrap="nowrap" colspan="2"> Lunch Stop: #TimeFormat(get_this_job_lunch.Lunch_Time_Out, "hh:mm tt")#</td>
                  </cfif>
                  <td  class="dstable_headersm" colspan="2" align="left" nowrap>
				  
				  <cfif get_this_job.Job_Time_Out IS "">
                      <span class="redtype">Job in Progress</span>
                      <cfelse>
                      End #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#
                    </cfif>
                    &nbsp;</td>
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
                  <td  class="dstable_headersm" colspan="3" nowrap="nowrap">
				  <cfif get_this_job.job_time_worked GT 0>
                      Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)
                  </cfif></td>
                
                  <td class="dstable_headersm"   nowrap="nowrap"> </td> <cfif get_this_job_lunch.Lunch_Time_Out EQ ""> 
                 <td class="dstable_headersm" colspan="4"> 
  </td>  </cfif>
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
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM APP_job_services_actual_employee 
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
				SELECT * FROM app_job_materials_actual  
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
          <cfquery name="get_gps_info" datasource="jrgm"  >
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_ds.ID#  
                    ORDER by DS_Date ASC
 			 </cfquery>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table">
            <tr class="dstable_headersm">
              <td class="dstable_header">ID</td>
              <td class="dstable_header">CLID</td>
              <td class="dstable_header">DSID</td>
              <td class="dstable_header">Date</td>
              <td class="dstable_header">Time</td>
              <td class="dstable_header">GPS Latitude</td>
              <td class="dstable_header">GPS Longitude</td>
              <td class="dstable_header">Geo Info</td>
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
                <td  class="dstable"><a href="http://maps.googleapis.com/maps/api/geocode/json?latlng=#gps_latitude#,#gps_longitude#&sensor=true" target="_blank">Geo Info</a></td>
                <td  class="dstable">#GPS_Status#</td>
                <td  class="dstable">#Network_Status#</td>
                <td  class="dstable"><a href="http://maps.google.com/maps?z=15&t=m&q=loc:#gps_latitude#+#gps_longitude#" target="_blank">Map</a></td>
                <td  class="dstable">#notes#</td>
              </tr>
            </cfoutput>
          </table></td>
      </tr>
    </table>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div --><script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
<!---  This is the good join query
 <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT t1.*, t2.*  FROM APP_job_services_actual_employee AS T1 INNER JOIN job_clock AS T2 ON T1.Job_ID = T2.Job_ID WHERE crew_leader =#crew_leader_id#
  ORDER by t2.ID ASC
    </CFQUERY> --->
