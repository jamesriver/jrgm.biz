 <cfabort>  
<cfif CGI.HTTP_USER_AGENT EQ 'CFSCHEDULE' >
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
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset Now_Time = Now()>
      <cfset  now_less_15minutes =   #DateAdd('n', -15, Now_Time)#>
      <cfset mytime = timeFormat(now(), "hh:mm tt")>
      <cfquery name="get_closed_jobs15" datasource="jrgm" >
 SELECT  ID,Job_ID, Crew_Leader_ID, Job_Time_In, Job_Time_Out, Job_Time_worked, In_Out_Status, DS_ID 
 FROM app_job_clock WHERE  Job_Time_Out >  #now_less_15minutes#
 ORDER BY ID DESC
 </cfquery>
      <cfloop query="get_closed_jobs15" >
        <cfquery name="get_JOB_name" datasource="jrgm">
SELECT [Job ID], [Wk Loc ID], [Wk Location Name] AS jobname ,
Crew_Leader_ID, Supervisor_ID, branch, Status
FROM app_jobs  WHERE [Job ID] = '#get_closed_jobs15.Job_ID#'
</cfquery>
        <cfquery name="get_CL_name" datasource="jrgm">
SELECT first_name,last_name,branch FROM APP_employees
WHERE  [Employee ID] =#get_closed_jobs15.Crew_Leader_ID#
</cfquery>
        <cfquery name="get_super_id" datasource="jrgm">
SELECT  Supervisor_ID, Crew_Leader_ID, DS_Date 
FROM app_daily_sheets WHERE ID =  #get_closed_jobs15.DS_ID #
</cfquery>
        <cfquery name="get_super_name" datasource="jrgm">
SELECT firstname,lastname,email FROM app_employee_passwords
WHERE  employee_ID =#get_super_id.Supervisor_ID#
</cfquery>
        <cfoutput> #get_closed_jobs15.ds_id# -#get_super_name.firstname# #get_super_name.lastname# - #get_super_name.email# -#get_JOB_name.jobname# -#get_CL_name.first_name# #get_CL_name.last_name# -#get_JOB_name.jobname#-#TimeFormat(get_closed_jobs15.Job_Time_Out, "hh:mm tt")# </cfoutput><br />
        <cfmail to="#get_super_name.email#"    FROM="benchanviolin@gmail.com"  subject="JRGM Job Time Out Alert" type="html">
          <cfinclude   template="includes/footer.cfm">
          <br />
          This is a message from the JRGM alert system.<br />
          <br />
          #get_CL_name.first_name# #get_CL_name.last_name#'s crew timed out for the #get_JOB_name.jobname# job today at #TimeFormat(get_closed_jobs15.Job_Time_Out, "hh:mm tt")# <br />
          <br />
          The daily sheet ID is #get_closed_jobs15.ds_id#<br />
          <br />
          This email was sent to: #get_super_name.firstname# #get_super_name.lastname# - #get_super_name.email#<br />
          <br />
          You do not need to respond to this email.
        </cfmail>
      </cfloop>
      <!---  <cfmail to="benchanviolin@gmail.com" FROM="benchanviolin@gmail.com"  subject="JRGM Job Time Out Alert"  type="html">
        JRGM Employee Auto Time Out Alert Ran
      </cfmail> ---> 
    </div>
  </div>
  </div>
  </body>
  </html>
</cfif>
