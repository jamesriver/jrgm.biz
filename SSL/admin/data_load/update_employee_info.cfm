<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
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
 <!---POSITION_EFFECTIVE_DATE    = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.POSITION_EFFECTIVE_DATE#"> ,
 REGULAR_PAY_EFFECTIVE_DATE = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.REGULAR_PAY_EFFECTIVE_DATE#"> ,--->
 employee_dob = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_dob#"> ,
 employee_hire_date = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_hire_date#"> ,
 employee_rehire_date =<cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.employee_rehire_date#"> ,
 last_modified_date = <cfqueryparam cfsqltype="cf_sql_date" value="#get_records_from_app_employees_test.last_modified_date#">
  WHERE  [Employee ID] =#get_records_from_app_employees_test.employee_id#
  </cfquery>
</cfloop>
Done!!
</body>
</html>
