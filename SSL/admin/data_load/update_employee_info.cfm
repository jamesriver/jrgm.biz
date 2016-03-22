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


<!---Step 2 - This process adds new employees to the app_crews table--->
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
 (#get_employees_not_in_app_crews.Employee_ID#, '#get_employees_not_in_app_crews.Employee_Name#','#get_employees_not_in_app_crews.Branch#',NULL,0,'#TRIM(get_employees_not_in_app_crews.First_Name)#','#TRIM(get_employees_not_in_app_crews.Last_Name)#','2016-03-01 16:00:00','2017-11-01 16:30:00',1,'#get_BM_ID.Employee_ID#')
 </cfquery>
  </cfloop>
  <!--- Query to make active_employees in app_employees are listed in APP_CREWS ----> 
  These employees were added to app_crews
  <cfdump var="#get_employees_not_in_app_crews#">
</cfif>
<!---END Step 2 - This process adds new employees to the app_crews table---> 
Step 2 Done 


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

<!---Step 4 Get new records--->
<cfquery name="get_all_employees_in_app_employees" datasource="JRGM" >
 SELECT  [Employee ID] AS employee_ID FROM app_employees_test_backup    <!---WHERE [Employee ID] < 9993--->
  </cfquery>
<CFSET mylist ="0">
<cfloop query="get_all_employees_in_app_employees">
  <cfset myList = ListAppend(mylist,employee_ID)>
</cfloop>
<cfquery name="get_new_records"  datasource="jrgm">
 SELECT * FROM app_employees WHERE [Employee ID]  NOT IN (#myList#)  <!---#maxfilenumber#--->
 </cfquery>
 <cfdump var="#get_new_records#">
 
 <!---END Step 4 Get new records--->
 Step 4 Done
 
 <!---Step 5 Inactivated records--->
 <cfquery name="get_inactivated_records"   datasource="jrgm">
SELECT [Employee ID] AS empid,  [Name FirstLast] AS empname,branch
FROM app_employees
WHERE active_record = 1 AND  [Employee ID] < 9500 AND   [Employee ID]  NOT IN (SELECT [Employee ID] FROM app_employees_test)
ORDER by branch
</cfquery>
 <cfdump var="#get_inactivated_records#">
 
 <cfquery name="drop_test" datasource="JRGM" >
DROP TABLE app_employees_test_backup;
</cfquery>

 
</body>
</html>
