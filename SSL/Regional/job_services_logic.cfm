<!--- This is for the service  actually performed table --->
<cfif IsDefined("form.GO_TO_MATERIALS")>
  <cflocation url="materials.cfm?ds_date=#ds_date#&amp;job_id=#job_ID#&amp;ds_id=#ds_id#&amp;CREW_LEADER_ID=#CREW_LEADER_ID#">
</cfif>
<cfif IsDefined("form.job_id")  AND form.job_id EQ "0000"  >
  <cflocation url="services.cfm?ds_date=#ds_date#&amp;ds_id=#ds_id#&amp;CREW_LEADER_ID=#CREW_LEADER_ID#">
</cfif>
<cfif form.job_time_worked EQ "">
  <cflocation url="services.cfm?ds_date=#ds_date#&amp;job_id=#job_ID#&amp;ds_id=#ds_id#&amp;CREW_LEADER_ID=#CREW_LEADER_ID#">
  <cfelse>
  <CFSET job_time_worked =form.job_time_worked>
</cfif>
<!--- This is for the service  actually performed table --->
<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<cfif StructKeyExists(form,"services_done")>
  <cfset todaysdate = #Now()#>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO job_services_clock 
   (Job_ID,Service_Time,Service_ID,ds_id,crew_leader) 
   VALUES 
   ('#form.job_ID#',#form.Job_time_Worked#,#form.JOB_SERVICES_DONE#,#ds_id#,#crew_Leader_id#) 
   </cfquery>
  <!---  The employee insert starts here --->
  <cfset todaysdate = #Now()#>
  <CFSET employee_ID_list  ="#form.Employee_ID#">
  <cfloop  list = "#employee_ID_list#"   index = "i" >
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO job_services_actual_employee (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader) 
   VALUES ('#i#','#form.job_ID#',#form.JOB_SERVICES_DONE#,#form.Job_time_Worked#,#ds_id#,#crew_Leader_id#) 
   </cfquery>
  </cfloop>
  <cflock timeout=20 scope="Session" type="Exclusive">
    <cfset StructDelete(Session, "job_ID")>
  </cflock>
  <cflocation url="services.cfm?ds_date=#ds_date#&amp;job_id=#job_ID#&amp;ds_id=#ds_id#&amp;CREW_LEADER_ID=#CREW_LEADER_ID#">
</cfif>
