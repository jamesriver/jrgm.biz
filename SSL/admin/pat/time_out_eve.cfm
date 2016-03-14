 DONT USE THIS ONE!!!
<!---   <cfif CGI.HTTP_USER_AGENT EQ 'CFSCHEDULE' >  --->
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent">
 
 <cfmail to="patrick.hutchinson2@gmail.com" from="pat@429designs.com"  subject="JRGM Job Auto Time Out"  type="html">
    The JRGM Timer Ran 1
  </cfmail>
  
  <!--centre content goes here -->
<div class="centrecontent_inner">
<cfset y = year(now())>
  <cfset m = month(now())>
  <cfset d = day(now())>
  <cfset today_5PM = createDatetime(y,m,d,17,0,0)>
  <cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
  <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
  <cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
  <CFSET outtime = today_5PM>
  
  
   <cfquery name="get_open_workers" datasource="jrgm" >
    SELECT * FROM APP_Employee_Payroll_Clock  
    WHERE in_out_status=1 AND time_out IS NULL
    ORDER by ID
     </cfquery>
  <cfloop query="get_open_workers" >
    <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_out = #outtime# , in_out_status=2,auto_time =1
    WHERE ID =#get_open_workers.ID#
     </cfquery>
    <cfquery name="get_emp_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_open_workers.employee_id#
     </cfquery>
    <cfquery name="get_CL_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_open_workers.crew_leader#
     </cfquery>
    <cfmail to="patrick.hutchinson2@gmail.com"   cc="patrick.hutchinson2@gmail.com"  from="pat@429designs.com"  subject="JRGM Employee Auto Time Out" type="html">
      <cfinclude   template="includes/footer.cfm">
      <br />
      #get_emp_name.first_name# #get_emp_name.last_name# -Employee ID : #get_open_workers.ID# of #get_cl_name.first_name# #get_cl_name.last_name#'s crew was auto timed out at 5:00 PM today.<br />
      The daily sheet ID is #get_open_workers.ds_id#<br />
      Please contact the administrator to get the correct time. <br />
      <br />
    </cfmail>
  </cfloop>
<!---   Added 1/25/2014 --->
   <cfquery name="update_employee_time" datasource="jrgm">
  UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out) WHERE time_in > #daybeforeyesterday_5PM#
    </cfquery>
  <!---   Added 1/25/2014 --->
    
      
  Employees Done
  <cfquery name="get_open_jobs" datasource="jrgm">
    SELECT * FROM APP_Job_Clock  
    WHERE in_out_status=1  AND job_time_out IS NULL
     </cfquery>
  <cfloop query="get_open_jobs" >
    <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE App_Job_Clock SET job_time_out = #outtime# , in_out_status=2,auto_time =1
    WHERE ID =#get_open_jobs.ID#
     </cfquery>
    <cfquery name="get_job_name" datasource="jrgm">
    SELECT [job id] AS jobid,[Wk Location Name] AS jobname FROM APP_jobs
    WHERE ID =#get_open_jobs.ID#
     </cfquery>
    <cfquery name="get_super_cl" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_open_jobs.crew_leader_id#
        </cfquery>
    <cfmail to="patrick.hutchinson2@gmail.com" cc="nfirth@jrgm.com"  from="pat@429designs.com"  subject="JRGM Job Auto Time Out"  type="html">
      <cfinclude template="includes/footer.cfm">
      <br />
      #get_job_name.jobname# Job ID : #get_job_name.jobid# worked on by #get_super_cl.first_name# #get_super_cl.last_name#'s crew was auto timed out at 5:00 PM today.<br />
      Please contact the administrator to get the correct time.. <br />
      The daily sheet ID is #get_open_jobs.ds_id# <br />
   
    </cfmail>
  </cfloop>
  
  <!---   Added 1/25/2014 --->

  <cfquery name="get_lunch_times" datasource="jrgm" >
SELECT ID,ds_id, job_id, Crew_Leader_ID, Lunch_Time, Lunch_Time_Out, Lunch_Time_In, job_clock_id
FROM app_lunch   WHERE Lunch_Time_In > #daybeforeyesterday_5PM# 
ORDER BY job_clock_id DESC
   </cfquery>
  <cfloop query="get_lunch_times" >
    <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE app_job_clock SET lunch_time = #get_lunch_times.lunch_time#,actual_job_time = (Job_Time_worked-lunch_time)
    WHERE ID =#get_lunch_times.job_clock_id#
     </cfquery>
 </cfloop>
<!---   Added 1/25/2014 --->


  Jobs Done<br />
  <!---   Close ALL Sessions --->
  <cfquery name="close_app_session" datasource="jrgm">
    UPDATE APP_loginSession SET SessionOutTime = #outtime#  
  </cfquery>
  <!---   Close ALL Sessions --->
  <cfmail to="patrick.hutchinson2@gmail.com" from="pat@429designs.com"  subject="JRGM Job Auto Time Out"  type="html">
    The JRGM Timer Ran 2
  </cfmail>
</div></div></div>
</body>
</html>
<!---   </cfif>    --->