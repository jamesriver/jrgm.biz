<cflocation url="services-summary.htm"> 


<cfquery name="get_current_job_info" datasource="jrgm">
SELECT (job_time_worked -Lunch_Time) AS job_time_worked FROM app_job_clock WHERE Job_ID=  '#form.Job_ID#'  AND   ID = #form.id#
</cfquery>


<!--- This is for the service  actually performed table --->
<cfif IsDefined("form.GO_TO_MATERIALS")>
  <cflocation url="materials.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#ID#">
</cfif>
<cfif form.total_time EQ "">
  <cflocation url="services.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#ID#">
  <cfelse>
  <CFSET total_time =form.total_time>
</cfif>
<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<cfif NOT IsDefined("form.Job_ID")>
  <cflocation url="default.cfm">
</cfif>
<cfif StructKeyExists(form,"SERVICES_DONE")>
  <cfquery name="This_Job" datasource="jrgm">
    SELECT (job_time_worked -Lunch_Time) AS job_time_worked,Job_Time_In, Job_Time_Out  FROM Job_Clock 
     WHERE  ID= #form.ID#
     </cfquery>
  <cfset todaysdate = #Now()#>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO job_services_clock 
   (Job_ID,Service_Time,Service_ID,Job_clock_ID,Service_Time_In,Service_Time_Out,ds_id,crew_leader) 
   VALUES 
   ('#form.job_ID#',#This_Job.Job_time_Worked#,#form.JOB_SERVICES_DONE#,#form.ID#, #CreateODBCDateTime(This_Job.Job_Time_In)#,#CreateODBCDateTime(This_Job.Job_Time_Out)#,#SESSION.DS_ID#,'#SESSION.userid#')
   </cfquery>
  <cfset todaysdate = #Now()#>
  
  <cfparam name="form.Employee_ID" default="#Session.userid#">
  
  <CFSET employee_ID_list  ="#form.Employee_ID#">

 <cfloop  list = "#employee_ID_list#"   index = "i" >
  
  
  <cfquery name="get_this_employees_time_this_job" datasource="jrgm"   >
SELECT Employee_ID, SUM(TOTAL_TIME) AS employeetime FROM job_services_actual_employee 
WHERE   job_clock_id = #form.ID# AND employee_id = #i#
GROUP by Employee_ID
 </cfquery>   
 
  <cfif get_this_employees_time_this_job.recordcount EQ 0> 
        <CFSET  employeetime =0>
          <cfelseif get_this_employees_time_this_job.employeetime EQ "">
          <CFSET  employeetime =0>
        <cfelse>
        <CFSET employeetime =get_this_employees_time_this_job.employeetime> 
        </cfif>
 
 <cfparam name="jta" default="0">
 
<!---  <cfoutput>#employeetime#</cfoutput><br>
 --->
 
 <CFSET jta =form.job_time_worked-employeetime>
 
  <CFSET jta_now =jta-form.total_time>
  
<!---   <cfoutput>#form.total_time#</cfoutput> --->
  <!--- <cfoutput>#jta#</cfoutput>  -<cfoutput>#jta_now#</cfoutput> -<cfoutput>#form.total_time#</cfoutput> --->
  <cfif jta_now GTE  0>a
  <CFSET total_time =<!--- jta- --->#form.total_time#>
  </cfif>
  
   <cfif jta_now LTE  0>b
  <CFSET total_time =jta>
  </cfif>
 
  <!---  <cfoutput>#total_time#</cfoutput> --->
  
<!---   <cfabort>   --->
  <cfif total_time GT 0>
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO job_services_actual_employee (Employee_ID,Job_ID,Service_ID,Total_Time,Service_Time_In,Service_Time_Out,Job_clock_ID,crew_leader,ds_id) VALUES ('#i#','#form.job_ID#',#form.JOB_SERVICES_DONE#,#total_time#,#CreateODBCDateTime(This_Job.Job_Time_In)#,#CreateODBCDateTime(This_Job.Job_Time_Out)#,#form.ID#,'#SESSION.userid#',#SESSION.DS_ID#)
   </cfquery>
   </cfif>
  </cfloop>
  <CFSET SESSION.job_services_entered = 1>
  <cflock timeout=20 scope="Session" type="Exclusive">
    <cfset StructDelete(Session, "job_ID")>
  </cflock>
  <cflocation url="services.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#ID#&job_time_worked=#get_current_job_info.job_time_worked#">
</cfif>
<!--- This end for the service actually performed table --->
