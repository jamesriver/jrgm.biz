<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE Employee_ID =#form.Employee_ID# 
AND ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
  <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
  </cfif>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<!----------------Start Multiple----------------------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submitall")>
  <cfquery name="getallemployeesonthisjob" datasource="jrgm">
SELECT DISTINCT employee_id  FROM app_job_services_actual_employee
 WHERE  ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
  </cfquery>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE   ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <cfloop query="getallemployeesonthisjob">
    <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )</cfquery>
    </cfif>
  </cfloop>
  <!---   <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
<cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE Employee_ID =#form.Employee_ID# 
AND ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
  <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
 <cfoutput>  
<cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
</cfoutput>  
 </cfif>
 
<!----------------Start Multiple----------------------------- --->
 
 <cfif IsDefined("form.ds_id") AND  IsDefined("form.submitall")>
 
   <cfquery name="getallemployeesonthisjob" datasource="jrgm">
SELECT DISTINCT employee_id  FROM app_job_services_actual_employee
 WHERE  ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
  </cfquery>
 <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE   ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
 <cfloop query="getallemployeesonthisjob"> 
 <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
   <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#') 
   </cfquery>
  </cfif>
  </cfloop> --->
 <cfoutput>  
<cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
</cfoutput>  
 </cfif>
 
<!----------------------------End Multiple-------------------------------------- --->


<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfif IsDefined("form.Employee_ID")>
  <CFSET Employee_ID= form.Employee_ID>
  <cfelseif IsDefined("url.Employee_ID")>
  <CFSET Employee_ID= url.Employee_ID>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
</cfquery>
<cfquery name="get_employee_service_time_main" datasource="jrgm">
SELECT  * FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID ASC
</cfquery>
<cfquery name="get_employee_service_time" datasource="jrgm">
SELECT  * FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID DESC 
</cfquery>
<!---  <cfquery name="get_employee_service_IDS" datasource="jrgm">
SELECT  service_id FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID ASC
</cfquery>


<cfset serviceid_list = ValueList(get_employee_service_IDS.service_id)>
<cfoutput>#serviceid_list#</cfoutput> --->
<cfquery name="get_job_name" datasource="jrgm">
SELECT  ID, [Wk Location Name] AS jobname, [Job ID] AS job_ID FROM app_jobs 
WHERE   [Job ID] = '#get_employee_service_time.JOB_ID#'
ORDER by ID ASC
  </cfquery>
<CFSET getrowcount =#get_employee_service_time.recordcount#>
<!--- <cfdump var="#get_employee_service_time#"> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<style type="text/css">
 input { text-align:right; }
.redarial {font: normal .9em Arial, Helvetica, sans-serif;color: red;}
.materialsbutton {
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
	font-size:14px;
	font-weight:bold;
	text-align: center;
	padding:6px 20px;
	text-decoration:none;
	width: 300px;
	margin-right: 30px;
	margin-bottom: 10px;
	}
 </style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Employee Service Time Editor</div>
      <table   border="0" cellpadding="0" cellspacing="0" class="dailysheet_table_top" >
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Date : </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;&nbsp; &nbsp; </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >DSID:<cfoutput>#DS_ID#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" > </td>
        </tr>
        <tr>
          <td align="left" class="dailysheetEditTop">Supervisor : </td>
          <td align="left" class="dailysheetEditTop"><cfoutput>#get_supervisor.employeename#</cfoutput></td>
          <td align="left" class="dailysheetEditTop">&nbsp;</td>
          <td align="left" class="dailysheetEditTop" >Crew Leader : </td>
          <td align="left" class="dailysheetEditTop" ><cfoutput>#get_crew_leader.employeename#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Employee Name:</strong> </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_employee.employeename#</cfoutput></strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Job Name:</strong> </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_job_name.jobname#</cfoutput></strong></td>
        </tr>
        <tr>
          <td colspan="5" align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Total Time to Account For:&nbsp;</strong><strong><cfoutput>#url.totalminutes#</cfoutput>&nbsp; minutes</strong></td>
       
        </tr>
      </table>
      <form  method="post" action="daily_sheet_edit_employee_service_time1.cfm"   >
        <table border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td colspan="14" align="center" nowrap="nowrap" class="redarial" >Please enter time worked for each service in minutes.</td>
          </tr>
          <tr>
            <td colspan="14" align="center">&nbsp;</td>
          </tr>
          <tr>
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
          <tr>
            <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">
              <td class="dstable" align="center"><CFSET service_ID =#ListElement#>
                <cfquery name="get_employee_service_time" datasource="jrgm">
            SELECT  total_time FROM app_job_services_actual_employee 
            WHERE Employee_ID =#Employee_ID# 
            AND ds_id = #ds_id#
            AND JOB_clock_ID = #JOB_clock_ID#
            AND service_ID = #service_ID#
           </cfquery>
                <cfif get_employee_service_time.recordcount GT 0>
                  <cfoutput query="get_employee_service_time">
                    <input type="text" value="#total_time#" name="service#service_ID#"  maxlength="5"  size="5" />
                  </cfoutput>
                  <cfelse>
                  <cfoutput>
                    <input type="text" value="" name="service#service_ID#"  maxlength="5"  size="5" />
                  </cfoutput>
                </cfif>
              </td>
            </cfloop>
          </tr>
          <tr>
            <td colspan="14"><img src="images/clear.gif" width="1" height="10" /></td>
          </tr>
          <tr> <cfoutput>
              <td colspan="4" align="left" class="dailysheetEditTop"><a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="dssbutton">Back to Daily Sheet</a></td>
            </cfoutput>
            <td colspan="6" align="right" class="dailysheetEditTop"><input type="submit" name="submit" id="submit" class="materialsbutton" value="Use for this Employee Only" /></td>
            <td colspan="6" align="right" class="dailysheetEditTop"><input type="submit" name="submitall" id="submit" class="materialsbutton" value="Use for ALL Employees on this Job" /></td>
          </tr>
          <tr>
            <td colspan="10" align="left" class="dailysheetEditTop">
    
             <cfif   
			 IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ ""  
			 OR
			  IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ ""
			  OR
			 IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "" 
			  OR
			 IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "" 
			 OR
			 IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "" 
			 >
              <span class="redarial">The time has been addded</span>
             </cfif> 
            </td>
            <td colspan="4" align="right" class="dailysheetEditTop">&nbsp;</td>
          </tr>
          <cfoutput>
            <input type="hidden" name="crew_leader_id"   value="#get_employee_service_time_main.crew_leader#" />
            <input type="hidden" name="job_clock_id"   value="#get_employee_service_time_main.job_clock_id#" />
            <input type="hidden" name="job_id_J"   value="#get_employee_service_time_main.Job_ID#" />
            <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
          </cfoutput>
        </table>
      </form>
      </table>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<br />
<br />
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
