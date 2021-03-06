<CFSET request.dsn = 'jrgm'>
 
<cfquery name="get_open_workers" datasource="#request.dsn#" >
 SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
 WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #url.dsid# AND CAST(Time_In as date) = '#DateFormat(now(), 'yyyy-mm-dd')#'
 </cfquery>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfquery name="get_ds" datasource="#request.dsn#">
SELECT   * FROM app_daily_sheets  WHERE ID=#url.dsid#    
</cfquery>
<!---<cfdump var="#get_ds#">
<cfabort>--->
<CFSET ds_date =  get_ds.ds_date>
<CFSET supervisor_id =  get_ds.supervisor_id>
<CFSET crew_leader_id =  get_ds.crew_leader_id>
<CFSET dsid =  get_ds.ID>
<CFSET branch_code =  get_ds.branch_code>
<cfif branch_code EQ '10' >
  <CFSET branchname ='Richmond'>
  <cfelseif branch_code EQ '20' >
  <CFSET branchname ='Portsmouth'>
  <cfelseif branch_code EQ '30'  >
  <CFSET branchname ='Charlottesville'>
  <cfelseif branch_code EQ '70'  >
  <CFSET branchname ='Williamsburg'>
  <cfelseif branch_code EQ '80'  >
  <CFSET branchname ='Chesterfield'>
  <cfelseif branch_code EQ '90' >
  <CFSET branchname ='Newport News'>
  <cfelseif  branch_code EQ '12'>
  <CFSET branchname ='Corporate'>
  <cfelseif  branch_code EQ '00'>
  <CFSET branchname ='Unknown'>
  <cfelseif branch_code EQ '' >
  <CFSET branchname ='Unknown'>
  <cfelse>
  <CFSET branchname ='Unknown'>
</cfif>
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
<cfquery name="get_supervisor" datasource="#request.dsn#">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM APP_employees WHERE [Employee ID]=  #get_ds.supervisor_id# <!---  AND active_record =1 --->
</cfquery>
<cfquery name="get_crew_leader" datasource="#request.dsn#">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM APP_employees WHERE [Employee ID]=    #crew_leader_id#   
</cfquery>
<!------------------- Get in progress time ---------------------->
<cfquery name="calculate_time" datasource="#request.dsn#">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    from APP_Employee_Payroll_Clock 
    WHERE in_out_status = 1 AND crew_leader =#crew_leader_id#
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="#request.dsn#">
    UPDATE APP_Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
  </cfoutput>
</cfif>
<!------------------- END get in progress time ---------------------->

<cfquery name="get_service_names" datasource="#request.dsn#">
    SELECT    ID, Service_Name, Service_ID
FROM         dbo.app_services
    </cfquery>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>JRGM | Daily Sheet</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->

<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
<style>
.text-coname {
	font-family: "Open Sans", sans-serif;
	font-size: 13px;
	font-weight: 600;
	color: #000;
}
.text-cotime {
	font-weight: 600;
	color: #666;
	font-size: 12px;
}
.text-service1 {
	font-size: 13px;
	font-weight: 800;
	color: #000;
}
.text-service {
	font-size: 12px;
	font-weight: 600;
	color: #333;
}
.panel-heading {
	background-color: #d9edf7;
	border-color: #bce8f1;
	color: #31708f;
}
.alert-info {
	background-color: #d9edf7;
	border-color: #bce8f1;
	color: #31708f;
	padding: 10px;
}
.alert-success {
	padding: 10px;
	background-color: #dff0d8;
	border-color: #d6e9c6;
	color: #3c763d;
	font-size: 14px;
	font-weight: 600;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
	box-shadow: 0 1px 1px rgba(0,0,0,.05)
}
.table {
	margin-left: 5px;
}
.text-success-lgtxt {
	font-size: 14px;
	font-weight: 600;
	color: green
}
.portlet-box-green {
	background-color: white;
	font-size: 17px;
	font-weight: 700;
	color: black;
}
.panel-title {
	font-size: 20px;
	font-weight: 700;
	color: #0C435E;
}
</style>
<!--- <link href="css/styles_ds.css" rel="stylesheet" type="text/css" /> --->
</head>
<body>
 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid">
<!-- BEGIN PAGE HEAD -->
<div class="page-head">
<div class="container-fluid"> 
  <!-- BEGIN PAGE TITLE -->
  
  <div class="page-title">
    <h1>JRGM Daily Sheet</h1>
  </div>
</div>

<!-- BEGIN PAGE CONTENT INNER -->
<div class="page-content">
<div class="container-fluid"> 
  
  <!-- BEGIN PAGE CONTENT INNER -->
  <div class="row">
    <div class="col-md-6">
      <table class="table large">
        <tr>
          <td nowrap><strong>Date : <cfoutput>#DateFormat(ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
          <td width="50" align="left" nowrap  >&nbsp;</td>
          <td nowrap align="left"  ><strong>Branch : <cfoutput>#branchname#</cfoutput></strong></td>
          <td nowrap   width="150"><strong>DSID : <cfoutput query="get_ds">#ID#</cfoutput></strong></td>
        </tr>
        <tr>
          <td nowrap><strong>Production Manager : <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
          <td width="50"  nowrap>&nbsp;</td>
          <td  nowrap><strong>Supervisor / Crew Leader : <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
          <td></td>
        </tr>
        <tr>
            <td nowrap="nowrap" colspan="4"><div align="left">
              <span class="text-success-lgtxt">
              <cfif get_ds.ds_approved EQ 1>
                Approved as of <cfoutput>#DateFormat(get_ds.ds_approved_date, "mm/dd/yyyy")#</cfoutput>
              </cfif>
              </span></td>
          </tr>
      </table>
    </div>
    
  </div>
  <div class="row">
    <div class="col-md-12"> 
      <!--  <div class="spacer20"></div>-->
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <h2 class="panel-title"> Employee Time</h2>
        </div>
        <div class="panel-body">
          <table class="table large" >
            <thead>
              <tr>
                <th>Name</th>
                <th><div align="center">#</div></th>
                <th><div align="center">Start</div></th>
                <th><div align="center">End</div></th>
                <th><div align="center">Start</div></th>
                <th><div align="center">End</div></th>
                <th><div align="center">Total  (H:M)</div></th>
              </tr>
            </thead>
            <tbody>
              <cfquery name="get_employees_for_Crew_Leader" datasource="#request.dsn#">
SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,last_name FROM APP_employees
WHERE [Employee ID] IN 
(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE crew_leader =#crew_leader_id# 
 AND ds_id = #dsid#) 
 ORDER by last_name ASC
</cfquery>
              <cfoutput query="get_employees_for_Crew_Leader">
                <tr>
                  <cfquery name="get_employees_CompleteHours" datasource="#request.dsn#">
        SELECT CompleteHours FROM 
       app_employee_payroll_clock WHERE CompleteHours =0  AND   Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
           </cfquery>
                  <cfquery name="get_employees_injury" datasource="#request.dsn#">
        SELECT IsEmpInjury  FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND   Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
           </cfquery>
                  <td>#employee_name# -#Employee_ID#&nbsp; &nbsp;
                    <cfif get_employees_CompleteHours.CompleteHours EQ 0>
                      <span class="text-danger">(Hours Disagreed)</span>
                    </cfif>
                    <cfif get_employees_injury.IsEmpInjury EQ 0>
                      &nbsp; &nbsp; <span class="text-danger">(Injury Disagreed)</span>
                    </cfif></td>
                  <cfquery name="get_number_of_times" datasource="#request.dsn#">
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  app_employee_payroll_clock WHERE Employee_ID				=#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                 GROUP by Employee_ID
 				 </cfquery>
                  <td><div align="center" >#get_number_of_times.cid#</div></td>
                  <cfquery name="get_employee_time_am" datasource="#request.dsn#" maxrows="1">
SELECT  ID,time_In, ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In ASC
                </cfquery>
                  <cfquery name="get_employee_time_am_current" datasource="#request.dsn#" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In ASC
</cfquery>
                  <td><div align="center" >#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</div></td>
                  <td><div align="center" >#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                      <cfif get_employee_time_am_current.time_Out EQ "">
                        *
                      </cfif>
                    </div></td>
                  <cfquery name="get_employee_time_pm" datasource="#request.dsn#" maxrows="1">
SELECT time_In,ISNULL(time_Out,#Now_Time#)  AS time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ID  <> #get_employee_time_am.ID# AND ds_id = #dsid#
ORDER by time_In DESC
                </cfquery>
                  <cfquery name="get_employee_time_pm_current" datasource="#request.dsn#" maxrows="1">
SELECT     time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# 
AND ds_id = #dsid#
ORDER by time_In DESC
</cfquery>
                  <!--- <cfdump var="#get_employee_time_pm_current#"> 
 --->
                  <td><div align="center" >#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</div></td>
                  <td><div align="center" >#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#
                      <cfif get_employee_time_pm_current.time_Out EQ "">
                        *
                      </cfif>
                    </div></td>
                  <cfquery name="get_employee_minutes_for_day" datasource="#request.dsn#" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees_for_Crew_Leader.Employee_ID# AND ds_id = #dsid#
                </cfquery>
                  <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                  <cfquery name="get_employee_minutes_for_day_inprogress" datasource="#request.dsn#" maxrows="1">
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
                  <td><div align="center">#hours#:#NumberFormat(minutes,"09")#</div></td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
          </p>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title"> Jobs Worked </h4>
        </div>
        <div class="panel-body">
          <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM APP_job_clock   
  WHERE Crew_Leader_ID =#crew_leader_id# AND ds_id = #dsid#    
  ORDER BY  Job_Time_IN ASC
          </CFQUERY>
          
          <!--- <cfdump var="#get_this_job#">    --->
          
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="#request.dsn#">
	SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
            <CFQUERY name="get_this_job_lunch" datasource="#request.dsn#">
		  SELECT * FROM app_lunch   
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# ORDER BY  ID ASC
 		</CFQUERY>
            <p> 
            <cfoutput>
              <div class="alert alert-info text-coname">#get_this_job_name.event_name# - #get_this_job.job_id# - Job Clock ID: #get_this_job.id#</div>
            </cfoutput>
            <table class="table table-striped table-hover">
              <thead>
                <cfoutput>
                  <tr>
                    <th colspan="13" nowrap="nowrap"> <span class="text-cotime">Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#</span>
                      <cfif get_this_job_lunch.Lunch_Time_In NEQ "">
                        <span class="text-cotime">&nbsp; &nbsp;  Lunch Start: #TimeFormat(get_this_job_lunch.Lunch_Time_In, "hh:mm tt")#</span>
                      </cfif>
                      <cfif get_this_job_lunch.Lunch_Time_Out NEQ "">
                        <span class="text-cotime">&nbsp; &nbsp;Lunch Stop: #TimeFormat(get_this_job_lunch.Lunch_Time_Out, "hh:mm tt")#</span>
                      </cfif>
                      <cfif get_this_job.Job_Time_Out IS "">
                        &nbsp; &nbsp; <span class="text-danger">Job in Progress</span>
                        <cfelse>
                        <span class="text-cotime">&nbsp; &nbsp; End #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#</span>
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
                        <span class="text-cotime">&nbsp; &nbsp; Total Hours #hours_all_tj#:#NumberFormat(minutes_all_tj,"09")# &nbsp;&nbsp;(#totalminutes_this_job# min.)</span>
                      </cfif>
                      <cfquery name="get_all_employee_minutes_for_job" datasource="#request.dsn#"  >
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
                      <cfset minutes_all_j = int(totalminutes mod 60)>
                      <cfif totalminutes GT 0>
                        <span class="text-cotime">&nbsp; &nbsp;   &nbsp; &nbsp;  Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)</span>
                      </cfif >
                      &nbsp; &nbsp;   &nbsp; &nbsp; <br>
                    </th>
                  </tr>
                </cfoutput>
              </thead>
              <tbody>
                <tr>
                  <td><span class="tableheadersm">Employee</span></td>
                  <td><div align="center"><span class="tableheadersm">1000<br />
                      Seasonal</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1100<br />
                      Turf</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1200<br />
                      Tree/Shrub </span></div></td>
                  <td><div align="center"><span class="tableheadersm">1300<br />
                      Mulch</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1400<br />
                      Color</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1500<br />
                      Misc</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1600<br />
                      Day</span></div></td>
                  <td><div align="center"><span class="tableheadersm">1700<br />
                      Off</span></div></td>
                  <td><div align="center"><span class="tableheadersm">2000<br />
                      Enh</span></div></td>
                  <td><div align="center"><span class="tableheadersm">3000<br />
                      Irr</span></div></td>
                  <td><div align="center"><span class="tableheadersm">7000<br />
                      Snow</span></div></td>
                </tr>
                
                <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
                <cfquery name="get_employee_time_services" datasource="#request.dsn#"   >
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM APP_job_services_actual_employee 
WHERE   job_clock_id = #get_this_job.ID#
AND ds_id = #dsid# 
</cfquery>
                <!--- <cfdump var="#get_employee_time_services#">   ---> 
                <cfoutput query="get_employee_time_services" >
                  <cfset hours_all_s= int(get_employee_time_services.total_time\60)>
                  <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
                  <cfquery name="get_employee_name" datasource="#request.dsn#">
          SELECT [Employee ID] As employee_id,[Name FirstLast] AS employee_name FROM APP_employees WHERE [Employee ID] =  #get_employee_time_services.Employee_ID#
                </cfquery>
                  <!--- <cfoutput> --->
                  
                  <tr>
                    <td  nowrap="nowrap">#get_employee_name.employee_name#</td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 999  AND   SERVICE_ID LT 1100 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1099  AND   SERVICE_ID LT 1200 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1199  AND   SERVICE_ID LT 1300 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1299  AND   SERVICE_ID LT 1400 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1399  AND   SERVICE_ID LT 1500 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1499  AND   SERVICE_ID LT 1600 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1599  AND   SERVICE_ID LT 1700 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1699  AND   SERVICE_ID LT 1800 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 1999  AND   SERVICE_ID LT 3000 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 2999  AND   SERVICE_ID LT 7000 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                    <td><div align="center">
                        <cfif SERVICE_ID GT 6999  AND   SERVICE_ID LT 9000 >
                          #hours_all_s#:#NumberFormat(minutes_all_s,"09")#
                        </cfif>
                      </div></td>
                  </tr>
                </cfoutput>
                <cfquery name="get_materials_used" datasource="#request.dsn#"  >
SELECT * FROM APP_job_materials_actual  
WHERE   job_clock_id=  '#get_this_job.ID#'
  </cfquery>
                <cfif get_materials_used.recordcount GT 0>
                  <tr>
                    <td nowrap="nowrap">Materials Used</td>
                    <td   align="center" nowrap="nowrap" >Quantity </td>
                    <!---  <td  align="center" nowrap="nowrap" >Unit</td>--->
                    <td colspan="10"   align="center" nowrap="nowrap" >&nbsp;</td>
                  </tr>
                </cfif>
                <cfoutput query="get_materials_used">
                  <tr>
                    <td nowrap="nowrap" >#item_id#</td>
                    <td   align="center" valign="bottom" nowrap="nowrap"  >#Quantity_used#</td>
                    <!---    <td  align="center" valign="bottom" nowrap="nowrap"  >#unit_used#</td>--->
                    <td colspan="10"   align="center" valign="bottom" nowrap="nowrap"  >&nbsp;</td>
                  </tr>
                </cfoutput>
            </table>
          </cfloop>
          </p>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title"> Job Service Detail Information </h4>
        </div>
        <div class="panel-body">
          <cfloop query="get_this_job" >
            <cfquery name="get_this_job_name" datasource="#request.dsn#">
	SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
            <CFQUERY name="get_this_job_lunch" datasource="#request.dsn#">
		  SELECT * FROM app_lunch   
 		 WHERE ds_id = #dsid# AND job_clock_id =#get_this_job.ID# ORDER BY  ID ASC
 		</CFQUERY>
            <p> 
            <cfoutput>
              <div class="alert alert-info text-coname">#get_this_job_name.event_name# - #get_this_job.job_id# - Job Clock ID: #get_this_job.id#</div>
            </cfoutput>
            <table class="table table-striped table-hover">
              <thead>
              <cfoutput>
                <thead>
                  <tr>
                    <th colspan="3" nowrap="nowrap"> <span class="text-cotime">Start&nbsp; #TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#</span>
                      <cfif get_this_job_lunch.Lunch_Time_In NEQ "">
                        <span class="text-cotime">&nbsp; &nbsp;  Lunch Start: #TimeFormat(get_this_job_lunch.Lunch_Time_In, "hh:mm tt")#</span>
                      </cfif>
                      <cfif get_this_job_lunch.Lunch_Time_Out NEQ "">
                        <span class="text-cotime">&nbsp; &nbsp;Lunch Stop: #TimeFormat(get_this_job_lunch.Lunch_Time_Out, "hh:mm tt")#</span>
                      </cfif>
                      <cfif get_this_job.Job_Time_Out IS "">
                        &nbsp; &nbsp; <span class="text-danger">Job in Progress</span>
                        <cfelse>
                        <span class="text-cotime">&nbsp; &nbsp; End #TimeFormat(get_this_job.Job_Time_out, "hh:mm tt")#</span>
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
                      <cfquery name="get_all_employee_minutes_for_job" datasource="#request.dsn#"  >
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
                      <cfset minutes_all_j = int(totalminutes mod 60)>
                      <cfif totalminutes GT 0>
                        <span class="text-cotime">&nbsp; &nbsp;   &nbsp; &nbsp;  Total Crew Hours #hours_all_j#:#NumberFormat(minutes_all_j,"09")# &nbsp;&nbsp;(#totalminutes# min.)</span>
                      </cfif >
                    </th>
                  </tr>
                </thead>
              </cfoutput> 
              
              <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
              <cfquery name="get_employee_time_services" datasource="#request.dsn#"   >
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM APP_job_services_actual_employee 
WHERE   job_clock_id = #get_this_job.ID#
AND ds_id = #dsid# 
</cfquery>
              <!--- <cfdump var="#get_employee_time_services#">   ---> 
              <cfoutput query="get_employee_time_services" >
                <cfset hours_all_s= int(get_employee_time_services.total_time\60)>
                <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
                <cfquery name="get_employee_name" datasource="#request.dsn#">
          SELECT [Employee ID] As employee_id,[Name FirstLast] AS employee_name FROM APP_employees WHERE [Employee ID] =  #get_employee_time_services.Employee_ID#
                </cfquery>
                <cfquery name="get_service_name"  dbtype="query">
          SELECT service_name FROM get_service_names WHERE service_id =  #get_employee_time_services.SERVICE_ID#
                </cfquery>
                <tbody>
                  <tr>
                    <td>#get_employee_name.employee_name#</td>
                    <td>#TOTAL_TIME#</td>
                    <td><!---#SERVICE_ID# - --->#get_service_name.service_name#</td>
                  </tr>
                </tbody>
              </cfoutput>
            </table>
          </cfloop>
          </p>
          <!---   </div>---> 
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title"> GPS Information </h4>
        </div>
        <div class="panel-body">
          <p>
            <cfquery name="get_gps_info" datasource="#request.dsn#"  >
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_ds.ID#  
                    ORDER by DS_Date ASC
 			 </cfquery>
          <table class="table">
            <thead>
              <tr>
                <th>ID</th>
                <th>CLID</th>
                <th>DSID</th>
                <th>Date</th>
                <th>Time</th>
                <th>GPS Latitude</th>
                <th>GPS Longitude</th>
                <th>GPS<br />
                  Status</th>
                <th>Network<br />
                  Status</th>
                <th>Notes</th>
              </tr>
            <tbody>
              <cfoutput query="get_gps_info">
                <tr>
                  <td >#ID#</td>
                  <td >#crew_leader_ID#</td>
                  <td >#DS_ID#</td>
                  <td >#DateFormat(DS_Date, "dddd, mmmm dd, yyyy")#</td>
                  <td >#TimeFormat(DS_Date, "hh:mm tt")#</td>
                  <td >#NumberFormat(gps_latitude,"999.999")#</td>
                  <td >#NumberFormat(gps_longitude,"999.999")#</td>
                  <td >#GPS_Status#</td>
                  <td >#Network_Status#</td>
                  <td >#notes#</td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
          <br>
          <br>
          <br>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
<!---</div>---> 
<!-- END PAGE CONTENT INNER --> 

<!-- END PAGE CONTAINER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>

<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --> 
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]--> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/table-advanced.js"></script> 
<script>
jQuery(document).ready(function() {       
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script> 
<!---<script>
$( "#accordion1" ).accordion({ header: "h4", collapsible: true, active: false });
$('#accordion1').collapse({hide: true})
  </script>--->
</body>
<!-- END BODY -->
</html>