 
<cfset todayDate = Now()>
<cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
<cfset mytime = timeFormat(now(), "hh:mm tt")>
<cfset daysago7 = dateadd("d",-14,today_datex)>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

<!---Step 1 - UPDATE app-employee table with data from app_employees_test table--->
<cfquery name="get_records_from_app_employees_test" datasource="JRGM"   > 
SELECT     ID, [Employee ID] AS employee_id, [Name FirstLast], First_name, Last_name, Position, [Ph Home] AS PhHome , Phone_Cell, [Ph Cell] AS phcell, [Direct Supervisor], [Name LastFirst], Branch, 
 [Crew Leader ID], last_modified_date, export_date, active_record, Direct_Supervisor_ID, Middle_name, position_id, email, [[Employee ID]]_OLD], color, textcolor, 
 export_id, employee_address, employee_city, employee_state, employee_zip_code, employee_dob, employee_phone, employee_hire_date, 
 POSITION_EFFECTIVE_DATE, REPORTS_TO_EFFECTIVE_DATE, STATUS_EFFECTIVE_DATE, REGULAR_PAY_EFFECTIVE_DATE, employee_rehire_date, fww
FROM         app_employees_test  
ORDER BY [Employee ID] ASC
  </cfquery>
<cfloop query="get_records_from_app_employees_test">
  <cfquery name="update_records"   datasource="jrgm">
  UPDATE app_employees SET  
  position = '#get_records_from_app_employees_test.position#',
employee_address = '#get_records_from_app_employees_test.employee_address#',
  employee_city =    '#get_records_from_app_employees_test.employee_city#',
 employee_state =    '#get_records_from_app_employees_test.employee_state#',
 employee_zip_code =    '#get_records_from_app_employees_test.employee_zip_code#',
 employee_phone =    '#get_records_from_app_employees_test.employee_phone#',
 email =    '#get_records_from_app_employees_test.email#',
   [Ph Home] =  '#get_records_from_app_employees_test.PhHome#',
Phone_Cell =  '#get_records_from_app_employees_test.Phone_Cell#',
 [Ph Cell] =  '#get_records_from_app_employees_test.phcell#',
 FWW =  '#get_records_from_app_employees_test.FWW#',
 employee_dob = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_dob#"> ,
 employee_hire_date = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_hire_date#"> ,
 employee_rehire_date =<cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_rehire_date#"> ,
 last_modified_date = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.last_modified_date#">
  WHERE  [Employee ID] =#get_records_from_app_employees_test.employee_id#
  </cfquery>
</cfloop>
<!---END Step 1 - UPDATE app-employee table with data from app_employees_test table---> 
Step 1 Done 

<!---<!---Step 2 - This process adds new employees to the app_crews table--->
<cfquery name="get_employees_not_in_app_crews" datasource="jrgm" >
    SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS Employee_name, First_name, Last_name, Position,  Branch
 FROM app_employees WHERE  ACTIVE_RECORD > 0 AND [Employee ID] < 100000 AND  branch <> 'Corporate' AND position <> 'Regional Manager' AND position <> 'Branch Administrator' AND [Employee ID] NOT IN (SELECT employee_id FROM app_crews )
     </cfquery>
<cfif get_employees_not_in_app_crews.recordcount GT 0>
  <cfloop query="get_employees_not_in_app_crews" >
    <cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#get_employees_not_in_app_crews.Branch#'  AND access_role = 9  AND employee_active =1
</cfquery>
    <cfquery name="insert_into_SQL" datasource="JRGM">
 INSERT INTO APP_crews 
 (Employee_ID ,crew_name,Employee_Branch ,Crew_Leader_ID ,Employee_Position_ID,First_name,Last_name,start_date,end_date,active_record,supervisor_ID)
 VALUES 
 (#get_employees_not_in_app_crews.Employee_ID#, '#get_employees_not_in_app_crews.Employee_Name#','#get_employees_not_in_app_crews.Branch#',NULL,0,'#TRIM(get_employees_not_in_app_crews.First_Name)#','#TRIM(get_employees_not_in_app_crews.Last_Name)#','2016-03-01 16:00:00','2019-12-31 16:30:00',1,'#get_BM_ID.Employee_ID#')
 </cfquery>
  </cfloop>
  <!--- Query to make active_employees in app_employees are listed in APP_CREWS ----> 
  These employees were added to app_crews
  <cfdump var="#get_employees_not_in_app_crews#">
</cfif>
<!---END Step 2 - This process adds new employees to the app_crews table---> 
Step 2 Done --->

<!---Step 3 - Updates email address in app_employee_passwords--->
<cfquery name="get_active_users_with_creds"   datasource="jrgm">
  SELECT        ID, Employee_ID                 
FROM            app_employee_passwords  WHERE employee_active =1
  </cfquery>
<cfloop query="get_active_users_with_creds">
  <cfquery name="get_email"   datasource="jrgm">
  SELECT email FROM app_employees 
  WHERE   [Employee ID] =  #get_active_users_with_creds.Employee_ID#
  </cfquery>
  <cfquery name="update_email"   datasource="jrgm">
  UPDATE app_employee_passwords SET  email = '#get_email.email#'
  WHERE Employee_ID =  #get_active_users_with_creds.Employee_ID#
  </cfquery>
</cfloop>
<!---END Step 3 - Updates email address in app_employee_passwords---> 
Step 3 Done 

<!---app_employees_test_backup has yesterdays active employees in it---> 

<!---Step 4 Get new records--->
<cfquery name="get_all_employees_in_app_employees" datasource="JRGM" >
 SELECT  [Employee ID] AS employee_ID FROM app_employees_test_backup WHERE [Employee ID] < 9993
  </cfquery>
<CFSET mylist ="0">
<cfloop query="get_all_employees_in_app_employees">
  <cfset myList = ListAppend(mylist,employee_ID)>
</cfloop>
<cfquery name="get_new_records"  datasource="jrgm">
 SELECT [Employee ID] AS employee_ID, [Name FirstLast] AS employee_name, branch FROM app_employees WHERE [Employee ID]  NOT IN (#myList#) AND active_record = 1  AND [Employee ID] < 9993
 </cfquery>
<cfdump var="#get_new_records#">
<!---This email address needs to be changed to Maria--->
<cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="New Employees"  type="html">
  <cfif get_new_records.recordcount EQ 0>
    There are no new records in today's ADP data load.
    <cfelse>
    These are the new employees in today's ADP data load.<br>
    <br>
    <cfloop query="get_new_records">
      #employee_ID#, #employee_name#, #branch#<br>
    </cfloop>
  </cfif>
</cfmail>
<!---END Step 4 Get new records---> 
Step 4 Done 

<!---Step 5 Inactivated records--->
<cfquery name="get_inactivated_records"   datasource="jrgm">
SELECT [Employee ID] AS employee_ID,  [Name FirstLast] AS employee_name,branch
FROM app_employees
WHERE active_record =0  AND  [Employee ID] < 9993 AND   [Employee ID]   IN (SELECT [Employee ID] FROM app_employees_test_backup)
ORDER by branch
</cfquery>
<cfdump var="#get_inactivated_records#">
<!---This email address needs to be changed to Maria--->
<cfmail to="patrick.hutchinson2@gmail.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="Inactivated Employees"  type="html">
  <cfif get_inactivated_records.recordcount EQ 0>
    There are no inactivated records in today's ADP data load.
    <cfelse>
    These are the inactivated employees in today's ADP data load.<br>
    <br>
    <cfloop query="get_inactivated_records">
      #employee_ID#, #employee_name#, #branch#<br>
    </cfloop>
  </cfif>
</cfmail>
<!---END Step 5 Get new records---> 
Step 5 Done 

<!--- Step 6 Inactivate login credentials in App_employee_passwords--->
<cfquery name="get_active_in_pw_table" datasource="jrgm">
SELECT  ID, Employee_ID, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
 FROM app_employee_passwords WHERE  EMPLOYEE_ACTIVE =1 AND  
employee_id   IN (SELECT [Employee ID] FROM app_employees WHERE active_record=0)
 </cfquery>
<cfloop query="get_active_in_pw_table">
  <CFQUERY name="update_pw_table" datasource="#request.dsn#">
UPDATE app_employee_passwords SET  employee_active =0  WHERE employee_id=#get_active_in_pw_table.employee_id#
</CFQUERY>
<!---remove records from crews table--->
<CFQUERY name="remove_from_crews_table" datasource="#request.dsn#">
DELETE FROM app_crews  WHERE employee_id=#get_active_in_pw_table.employee_id#
</CFQUERY>
<CFQUERY name="remove_from_crews_table_C" datasource="#request.dsn#">
DELETE FROM app_crews  WHERE crew_leader_id=#get_active_in_pw_table.employee_id#
</CFQUERY>
<CFQUERY name="remove_from_crews_table_S" datasource="#request.dsn#">
DELETE FROM app_crews  WHERE supervisor_id=#get_active_in_pw_table.employee_id#
</CFQUERY>  
<!---remove records from events table--->

<CFQUERY name="remove_from_events_table_C" datasource="#request.dsn#">
DELETE FROM app_events  WHERE crew_leader_id=#get_active_in_pw_table.employee_id#
</CFQUERY>
DELETE FROM app_events 
<CFQUERY name="remove_from_events_table_S" datasource="#request.dsn#">
DELETE FROM app_events  WHERE supervisor_id=#get_active_in_pw_table.employee_id#
</CFQUERY>  
DELETE FROM app_events 
</cfloop>
<!---END Step 6 Inactivate login credentials in App_employee_passwords--->

<!---Step 7 - This process adds new employees to the app_crews table--->
<cfquery name="get_employees_not_in_app_crews" datasource="jrgm" >
    SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS Employee_name, First_name, Last_name, Position,  Branch
 FROM app_employees WHERE  ACTIVE_RECORD > 0 AND [Employee ID] < 100000 AND  branch <> 'Corporate' AND position <> 'Regional Manager' AND position <> 'Branch Administrator' AND [Employee ID] NOT IN (SELECT employee_id FROM app_crews )
     </cfquery>
<cfif get_employees_not_in_app_crews.recordcount GT 0>
  <cfloop query="get_employees_not_in_app_crews" >
    <cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#get_employees_not_in_app_crews.Branch#'  AND access_role = 9  AND employee_active =1
</cfquery>
    <cfquery name="insert_into_SQL" datasource="JRGM">
 INSERT INTO APP_crews 
 (Employee_ID ,crew_name,Employee_Branch ,Crew_Leader_ID ,Employee_Position_ID,First_name,Last_name,start_date,end_date,active_record,supervisor_ID)
 VALUES 
 (#get_employees_not_in_app_crews.Employee_ID#, '#get_employees_not_in_app_crews.Employee_Name#','#get_employees_not_in_app_crews.Branch#',NULL,0,'#TRIM(get_employees_not_in_app_crews.First_Name)#','#TRIM(get_employees_not_in_app_crews.Last_Name)#','2016-03-01 16:00:00','2019-12-31 16:30:00',1,'#get_BM_ID.Employee_ID#')
 </cfquery>
  </cfloop>
  <!--- Query to make active_employees in app_employees are listed in APP_CREWS ----> 
  These employees were added to app_crews
  <cfdump var="#get_employees_not_in_app_crews#">
</cfif>
<!---END Step 7 - This process adds new employees to the app_crews table---> 
Step 7 Done 


<!------Step 8------------Query to make sure equipment is allocated to an active employee --------------->
<cfquery name="get_equipment_allocated_to_inactive_employee" datasource="jrgm">
SELECT branch_name,ID, crew_assignment_last FROM equipment
WHERE   crew_assignment_last <> 3 AND  crew_assignment_last < >5   AND  crew_assignment_last NOT IN (SELECT [Employee ID] FROM app_employees WHERE active_record =1)
ORDER by ID
 </cfquery>
 
<cfif get_equipment_allocated_to_inactive_employee.recordcount GT 0>
 <!---create backup of equipment table--->
<cfquery name="make_copy_of_equipment_table"   datasource="jrgm">
SELECT * INTO equipment_backup  FROM equipment
</cfquery>
 <cfloop query="get_equipment_allocated_to_inactive_employee">
 <!---UPDATE  equipment table  set allocated person to branch manager--->
<cfquery name="UPDATE_equipment_table" datasource="jrgm">
UPDATE equipment
SET crew_assignment_last =(SELECT employee_id FROM app_employee_passwords  WHERE employee_branch = '#get_equipment_allocated_to_inactive_employee.branch_name#' 
AND access_role = 9 AND  employee_active =1)
WHERE ID  = #get_equipment_allocated_to_inactive_employee.ID#
  </cfquery> 
  </cfloop>
 <!--- <cfdump  var="#get_equipment_allocated_to_inactive_employee#">--->
</cfif>
<!------END Step 8--------------------- Query to make sure equipment is allocated to an active employee----------------------------------->

<!---<!------Step 9---------------   Insert missing jobs into app_events ----------------------------------> 

<!---------- Get missing jobs and job info from app_jobs ---------->
<cfquery name="get_jobs_missing_from_events" datasource="JRGM"   >
 SELECT DISTINCT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,
  Location = STUFF(
      COALESCE(', ' + RTRIM([Service Address]),'')  
    + COALESCE(', ' + RTRIM([Service Address2]),'')  
    + COALESCE(', ' + RTRIM([Service City]), '') 
    + COALESCE(', ' + RTRIM([Service State]), '') 
    + COALESCE(', ' + RTRIM([Service Zip]),  '')
    , 1, 2, '')
  FROM app_jobs WHERE active_record =1 AND [Job ID] NOT IN (SELECT job_id FROM  app_events) AND [Job ID]  <> '3163441' AND [Job ID]  <> 'J2338-1213'
 </cfquery>
<!---------- Loop through missing jobs add the job and info to app_events table ---------->
<cfloop query="get_jobs_missing_from_events" >
  <cfquery name="insert_into_app_events" datasource="JRGM">
 INSERT INTO APP_events 
 (Job_ID,event_name, branch,event_location,start_date,end_date,active_record) 
 VALUES 
 ('#get_addressess.job_id#','#get_addressess.work_location_name#','#get_addressess.branch#','#get_addressess.Location#' ,'2016-01-01 00:00:00','2019-06-01 00:00:00',1 ) 
</cfquery>
</cfloop>
<!------END Step 9--------------------- Job is  loaded into app_events table----------------------------------->--->

<!---Step 10 make sure that time_worked is updated in APP_Employee_Payroll_Clock --->
<cfquery name="update_employee_time" datasource="jrgm">
UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out), in_out_status=2
WHERE time_out IS NOT NULL  AND  ds_date > #daysago14#
</cfquery>
<!---END Step 10 make sure that time_worked is updated in APP_Employee_Payroll_Clock --->
<cfquery name="drop_test" datasource="JRGM" >
DROP TABLE app_employees_test_backup;
</cfquery>


CHECK app_events_backup!!!
</body>
</html>
