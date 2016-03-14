<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE Employee_ID =#form.Employee_ID# 
AND ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <!--- <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
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
   ('#form.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
  <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>--->
  
  <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1101") AND form.SERVICE1101 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1101,#SERVICE1101#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1102") AND form.SERVICE1102 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1102,#SERVICE1102#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1103") AND form.SERVICE1103 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1103,#SERVICE1103#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1104") AND form.SERVICE1104 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1104,#SERVICE1104#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1105") AND form.SERVICE1105 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1105,#SERVICE1105#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1106") AND form.SERVICE1106 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1106,#SERVICE1106#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1107") AND form.SERVICE1107 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1107,#SERVICE1107#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1108") AND form.SERVICE1108 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1108,#SERVICE1108#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1109") AND form.SERVICE1109 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1109,#SERVICE1109#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1110") AND form.SERVICE1110 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1110,#SERVICE1110#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1111") AND form.SERVICE1111 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1111,#SERVICE1111#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1201") AND form.SERVICE1201 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1201,#SERVICE1201#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1202") AND form.SERVICE1202 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1202,#SERVICE1202#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1203") AND form.SERVICE1203 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1203,#SERVICE1203#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1204") AND form.SERVICE1204 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1204,#SERVICE1204#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1205") AND form.SERVICE1205 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1205,#SERVICE1205#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1301") AND form.SERVICE1301 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1301,#SERVICE1301#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1302") AND form.SERVICE1302 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1302,#SERVICE1302#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1303") AND form.SERVICE1303 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1303,#SERVICE1303#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1304") AND form.SERVICE1304 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1304,#SERVICE1304#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1305") AND form.SERVICE1305 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1305,#SERVICE1305#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1306") AND form.SERVICE1306 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1306,#SERVICE1306#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1307") AND form.SERVICE1307 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1307,#SERVICE1307#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1308") AND form.SERVICE1308 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1308,#SERVICE1308#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1401") AND form.SERVICE1401 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1401,#SERVICE1401#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1402") AND form.SERVICE1402 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1402,#SERVICE1402#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1500") AND form.SERVICE1500 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1500,#SERVICE1500#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1600") AND form.SERVICE1600 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1600,#SERVICE1600#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1701") AND form.SERVICE1701 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1701,#SERVICE1701#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1702") AND form.SERVICE1702 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1702,#SERVICE1702#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  
  <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
  <cfif IsDefined("form.SERVICE2001") AND form.SERVICE2001 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2001,#SERVICE2001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2002") AND form.SERVICE2002 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2002,#SERVICE2002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2003") AND form.SERVICE2003 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2003,#SERVICE2003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3001") AND form.SERVICE3001 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3001,#SERVICE3001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3002") AND form.SERVICE3002 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3002,#SERVICE3002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3003") AND form.SERVICE3003 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3003,#SERVICE3003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3004") AND form.SERVICE3004 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3004,#SERVICE3004#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3005") AND form.SERVICE3005 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3005,#SERVICE3005#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7001") AND form.SERVICE7001 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7001,#SERVICE7001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7002") AND form.SERVICE7002 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7002,#SERVICE7002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7003") AND form.SERVICE7003 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7003,#SERVICE7003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7004") AND form.SERVICE7004 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7004,#SERVICE7004#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7005") AND form.SERVICE7005 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7005,#SERVICE7005#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7006") AND form.SERVICE7006 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7006,#SERVICE7006#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE7007") AND form.SERVICE7007 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',7007,#SERVICE7007#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
  </cfif>
  <cfoutput>
    <cflocation url="daily_sheet_edit2.cfm?dsid=#ds_id#">
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
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) 
   VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
   </cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1101") AND form.SERVICE1101 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1101,#SERVICE1101#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1102") AND form.SERVICE1102 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1102,#SERVICE1102#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1103") AND form.SERVICE1103 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1103,#SERVICE1103#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1104") AND form.SERVICE1104 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1104,#SERVICE1104#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1105") AND form.SERVICE1105 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1105,#SERVICE1105#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1106") AND form.SERVICE1106 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1106,#SERVICE1106#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1107") AND form.SERVICE1107 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1107,#SERVICE1107#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1108") AND form.SERVICE1108 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1108,#SERVICE1108#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1109") AND form.SERVICE1109 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1109,#SERVICE1109#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1110") AND form.SERVICE1110 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1110,#SERVICE1110#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1111") AND form.SERVICE1111 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1111,#SERVICE1111#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1201") AND form.SERVICE1201 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1201,#SERVICE1201#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1202") AND form.SERVICE1202 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1202,#SERVICE1202#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1203") AND form.SERVICE1203 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1203,#SERVICE1203#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1204") AND form.SERVICE1204 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1204,#SERVICE1204#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1205") AND form.SERVICE1205 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1205,#SERVICE1205#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1301") AND form.SERVICE1301 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1301,#SERVICE1301#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1302") AND form.SERVICE1302 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1302,#SERVICE1302#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1303") AND form.SERVICE1303 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1303,#SERVICE1303#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1304") AND form.SERVICE1304 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1304,#SERVICE1304#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1305") AND form.SERVICE1305 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1305,#SERVICE1305#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1306") AND form.SERVICE1306 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1306,#SERVICE1306#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1307") AND form.SERVICE1307 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1307,#SERVICE1307#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1308") AND form.SERVICE1308 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1308,#SERVICE1308#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1401") AND form.SERVICE1401 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1401,#SERVICE1401#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1402") AND form.SERVICE1402 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1402,#SERVICE1402#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1500") AND form.SERVICE1500 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1500,#SERVICE1500#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )


</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1600") AND form.SERVICE1600 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1600,#SERVICE1600#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1701") AND form.SERVICE1701 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1701,#SERVICE1701#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1702") AND form.SERVICE1702 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1702,#SERVICE1702#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    
    <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
    <cfif IsDefined("form.SERVICE2001") AND form.SERVICE2001 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2001,#SERVICE2001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2002") AND form.SERVICE2002 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2002,#SERVICE2002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2003") AND form.SERVICE2003 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2003,#SERVICE2003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3001") AND form.SERVICE3001 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3001,#SERVICE3001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3002") AND form.SERVICE3002 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3002,#SERVICE3002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3003") AND form.SERVICE3003 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3003,#SERVICE3003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3004") AND form.SERVICE3004 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3004,#SERVICE3004#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3005") AND form.SERVICE3005 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3005,#SERVICE3005#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7001") AND form.SERVICE7001 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7001,#SERVICE7001#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7002") AND form.SERVICE7002 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7002,#SERVICE7002#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7003") AND form.SERVICE7003 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7003,#SERVICE7003#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7004") AND form.SERVICE7004 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7004,#SERVICE7004#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7005") AND form.SERVICE7005 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7005,#SERVICE7005#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7006") AND form.SERVICE7006 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7006,#SERVICE7006#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE7007") AND form.SERVICE7007 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',7007,#SERVICE7007#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <!--- <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', #form.ds_date# )
</cfquery>
    </cfif>--->
  </cfloop>
  <cfoutput>
    <cflocation url="daily_sheet_edit2.cfm?dsid=#ds_id#">
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
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/dsicons.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.smallfont {
	font-size: .7em;
	color: #000000;
	font-weight: bold;
}
.smallerfont {
	font-size: .7em;
	font-weight: bold;
}
.table {
	margin-left: 5px;
	margin-right: 50px;
}
</style>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
<link href="css/styles_ds.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfinclude template="includes/subbar.cfm">
<!---    <cfinclude template="includes/topbar_ds.cfm">--->

<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE --><br>
<br>

      <div class="page-title">
        <h1>Employee Service Time Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_listing.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li> <a href="daily_sheet_edit2.cfm?dsid=<cfoutput>#ds_id#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
          <li class="active">Employee Service Time Editor</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <table class="table large">
            <tr>
              <td><strong>Date: <cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
              <td><strong>DSID: <cfoutput>#DS_ID#</cfoutput></strong></td>
            </tr>
            <tr>
              <td><strong>Production Manager: <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
              <td><strong>Supervisor/Crew Leader: <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
            </tr>
            <tr>
              <td><strong>Employee Name: <cfoutput>#get_employee.employeename#</cfoutput></strong></td>
              <td><strong>Job Name: <cfoutput>#get_job_name.jobname#</cfoutput></strong></td>
            </tr>
            <tr>
              <td colspan="2"><strong>Total Time to Account For: <cfoutput>#url.totalminutes#</cfoutput> minutes</strong></td>
            </tr>
          </table>
          <form  method="post" action="daily_sheet_edit_employee_service_time2.cfm"   >
            <div align="center">
              <p class="text-danger"><strong>Please enter time worked for each service in minutes.</strong></p>
            </div>
            <table class="table table-striped table-hover">
              <tbody>
                <tr>
                  <td><div  class="smallerfont"> 1000 - SEASONAL SERVICE</div></td>
                  <cfloop index = "ListElement" list = "1000">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="11"></td>
                </tr>
                <tr>
                  <td></td>
                  <cfloop index = "ListElement" list = "1000">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="11"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1100 - TURF CARE </div></td>
                  <cfloop index = "ListElement" list = "1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                </tr>
                <tr>
                  <td><!---1100 - TURF CARE--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1200 - TREE & SHRUB CARE</div></td>
                  <cfloop index = "ListElement" list = "1201,1202,1203,1204,1205">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="6"></td>
                </tr>
                <tr>
                  <td><!---1200 - TREE & SHRUB CARE--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1201,1202,1203,1204,1205">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="6"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1300 - MULCH SERVICE</div></td>
                  <cfloop index = "ListElement" list = "1301,1302,1303,1304,1305,1306,1307,1308">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="3"></td>
                </tr>
                <tr>
                  <td><!---1300 - MULCH SERVICE--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1301,1302,1303,1304,1305,1306,1307,1308">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="3"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1400 - SEASONAL COLOR</div></td>
                  <cfloop index = "ListElement" list = "1401,1402">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="9"></td>
                </tr>
                <tr>
                  <td><!---1400 - SEASONAL COLOR--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1401,1402">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="9"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1500 - MISC. SERVICES</div></td>
                  <cfloop index = "ListElement" list = "1500">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="10"></td>
                </tr>
                <tr>
                  <td><!---1500 - MISCELLANEOUS SERVICES--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1500">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="10"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">1600 - DAY PORTER</div></td>
                  <cfloop index = "ListElement" list = "1600">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="10"></td>
                </tr>
                <tr>
                  <td><!---1600 - DAY PORTER--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1600">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="10"></td>
                </tr>
                <tr>
                  <td  nowrap><div  class="smallerfont">1700 - OFF SEASON SERVICE</div></td>
                  <cfloop index = "ListElement" list = "1701,1702">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="9"></td>
                </tr>
                <tr>
                  <td><!---1700 - OFF SEASON SERVICE--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "1701,1702">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="9"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">2000 - ENHANCEMENT</div></td>
                  <cfloop index = "ListElement" list = "2001,2002,2003">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="8"></td>
                </tr>
                <tr>
                  <td><!---2000 - ENHANCEMENT--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "2001,2002,2003">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="8"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">3000 - IRRIGATION SERVICE</div></td>
                  <cfloop index = "ListElement" list = "3001,3002,3003,3004,3005">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="6"></td>
                </tr>
                <tr>
                  <td><!---3000 - IRRIGATION SERVICE--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "3001,3002,3003,3004,3005">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="6"></td>
                </tr>
                <tr>
                  <td><div  class="smallerfont">7000 - SNOW SERVICES</div></td>
                  <cfloop index = "ListElement" list = "7001,7002,7003,7004,7005,7006,7007">
                    <td><div align="center"  class="smallfont">
                        <CFSET service_ID =#ListElement#>
                        <cfquery name="get_service_name" datasource="jrgm">
            SELECT      Service_Name, Service_ID
FROM         app_services WHERE service_ID = #service_ID#
           </cfquery>
                        <cfoutput>#get_service_name.Service_Name#</cfoutput> </div></td>
                  </cfloop>
                  <td colspan="4"></td>
                </tr>
                <tr>
                  <td><!---7000 - SNOW SERVICES--->&nbsp;</td>
                  <cfloop index = "ListElement" list = "7001,7002,7003,7004,7005,7006,7007">
                    <td><div align="center">
                        <CFSET service_ID =#ListElement#>
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
                      </div></td>
                  </cfloop>
                  <td colspan="4"></td>
                </tr>
              </tbody>
            </table>
            <tr>
              <td colspan="4">&nbsp;</td>
              <td colspan="6" align="right">&nbsp;</td>
              <td colspan="6" align="right">&nbsp;</td>
            </tr>
            <tr> <cfoutput>
                <td colspan="4"><a href="daily_sheet_edit2.cfm?dsid=#ds_id#" class="btn btn-primary">Back to Daily Sheet</a></td>
              </cfoutput>
              <td colspan="6" align="right"><input type="submit" name="submit" id="submit" class="btn btn-primary" value="Use for this Employee Only" /></td>
              <td colspan="6" align="right"><input type="submit" name="submitall" id="submit" class="btn btn-primary" value="Use for ALL Employees on this Job" /></td>
            </tr>
            <tr>
              <td colspan="10" align="left" ><strong>
                <cfif   
			 IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ ""  
			 OR
			  IsDefined("form.SERVICE1101") AND form.SERVICE1101 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1102") AND form.SERVICE1102 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1103") AND form.SERVICE1103 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1104") AND form.SERVICE1104 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1105") AND form.SERVICE1105 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1106") AND form.SERVICE1106 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1107") AND form.SERVICE1107 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1108") AND form.SERVICE1108 NEQ "" 
			  OR              
              IsDefined("form.SERVICE1109") AND form.SERVICE1109 NEQ "" 
			  OR
               IsDefined("form.SERVICE1110") AND form.SERVICE1110 NEQ "" 
			  OR              
              IsDefined("form.SERVICE1111") AND form.SERVICE1111 NEQ "" 
			  OR                           
			 IsDefined("form.SERVICE1201") AND form.SERVICE1201 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1202") AND form.SERVICE1202 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1203") AND form.SERVICE1203 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1204") AND form.SERVICE1204 NEQ "" 
			 OR
			 IsDefined("form.SERVICE1205") AND form.SERVICE1205 NEQ "" 
             OR
              IsDefined("form.SERVICE1301") AND form.SERVICE1301 NEQ ""  
			 OR
			  IsDefined("form.SERVICE1302") AND form.SERVICE1302 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1303") AND form.SERVICE1303 NEQ ""
			  OR
			 IsDefined("form.SERVICE1304") AND form.SERVICE1304 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1305") AND form.SERVICE1305 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1306") AND form.SERVICE1306 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1307") AND form.SERVICE1307 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1308") AND form.SERVICE1308 NEQ "" 
			  OR                   
              IsDefined("form.SERVICE1401") AND form.SERVICE1401 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1402") AND form.SERVICE1402 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1500") AND form.SERVICE1500 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1600") AND form.SERVICE1600 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1701") AND form.SERVICE1701 NEQ "" 
			 OR
			 IsDefined("form.SERVICE1702") AND form.SERVICE1702 NEQ "" 
             OR
              IsDefined("form.SERVICE2001") AND form.SERVICE2001 NEQ ""  
			 OR
			  IsDefined("form.SERVICE2002") AND form.SERVICE2002 NEQ "" 
			  OR
			  IsDefined("form.SERVICE2003") AND form.SERVICE2003 NEQ ""
			  OR  
              IsDefined("form.SERVICE3001") AND form.SERVICE3001 NEQ "" 
			  OR
			 IsDefined("form.SERVICE3002") AND form.SERVICE3002 NEQ "" 
			  OR
			  IsDefined("form.SERVICE3003") AND form.SERVICE3003 NEQ "" 
			  OR
			 IsDefined("form.SERVICE3004") AND form.SERVICE3004 NEQ "" 
			  OR
			 IsDefined("form.SERVICE3005") AND form.SERVICE3005 NEQ "" 
			  OR
              IsDefined("form.SERVICE7001") AND form.SERVICE7001 NEQ "" 
			  OR
			 IsDefined("form.SERVICE7002") AND form.SERVICE7002 NEQ "" 
			  OR
			 IsDefined("form.SERVICE7003") AND form.SERVICE7003 NEQ "" 
			  OR
			 IsDefined("form.SERVICE7004") AND form.SERVICE7004 NEQ "" 
			  OR
			 IsDefined("form.SERVICE7005") AND form.SERVICE7005 NEQ "" 
			 OR
			 IsDefined("form.SERVICE7006") AND form.SERVICE7006 NEQ "" 
              OR
			 IsDefined("form.SERVICE7007") AND form.SERVICE7007 NEQ "" 
			 >
                  <span class="text-danger">The time has been addded</span>
                </cfif>
                </strong></td>
              <td colspan="4" align="right" class="dailysheetEditTop">&nbsp;</td>
            </tr>
            </tbody>
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
        </div>
      </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 
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
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script> 
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/components-pickers.js"></script> 
<!-- END PAGE LEVEL SCRIPTS --> 
<script>
        jQuery(document).ready(function() {       
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script> 
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>