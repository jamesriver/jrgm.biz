<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Load Crews</title>
</head>
<!--- WATCH DUPS Escpecially NN Supervisors --->
<!--- Do the process so that all Supers look like BD --->
<body>
<cfquery name="getfmp_employees" datasource="JRGM" >
 SELECT  [Employee ID] AS Employee_ID, [Name FirstLast] AS Employee_Name, Branch AS Employee_Branch,[Crew Leader ID] AS Crew_Leader_ID,
  Position, Position_ID, Direct_Supervisor_ID, First_name,  Last_name FROM app_employees 
  WHERE active_record =1  AND branch ='Williamsburg'  AND [Employee ID]  IS NOT NULL   AND ID  =10387
  <!--- AND 
  (Position EQ 'Production Supervisor')  
   OR 
  (Position EQ 'Foreman')
  OR 
  (Position EQ 'Foreman - Training')
   OR 
  (Position EQ 'Foreman - Non-Driving')
  OR
   (Position EQ 'Branch Manager')
   OR 
   (Position EQ 'Production Manager') --->
    ORDER by  [Employee ID]
 </cfquery>
<cfloop query="getfmp_employees" >
  <cfquery name="insert_into_SQL" datasource="JRGM">
 INSERT INTO APP_crews 
 (Employee_ID ,crew_name,Employee_Branch ,Crew_Leader_ID ,supervisor_ID,Employee_Position_ID,First_name,  Last_name,start_date,end_date,active_record) 
 VALUES 
 (#getfmp_employees.Employee_ID#, '#getfmp_employees.Employee_Name#','#getfmp_employees.Employee_Branch#','#TRIM(getfmp_employees.Crew_Leader_ID)#','#TRIM(getfmp_employees.Direct_Supervisor_ID)#',0,'#TRIM(getfmp_employees.First_Name)#','#TRIM(getfmp_employees.Last_Name)#','2014-01-01 16:00:00','2015-04-01 16:30:00',1) 
 </cfquery>
</cfloop>
<!---  Step 2  Set Position _ID --->
<cfquery name="getfmp_employees_Pos" datasource="JRGM" >
 SELECT  [Employee ID] as emp_id,Position FROM app_employees WHERE branch ='Williamsburg' AND [Employee ID]  IS NOT NULL ORDER by [Employee ID]
 </cfquery>
<cfloop query="getfmp_employees_Pos" >
 <!---  <cfif getfmp_employees_pos.Position EQ 'Crew Member II' OR getfmp_employees_pos.Position EQ 'Crew Member I'  OR getfmp_employees_pos.Position EQ 'Crew Member- Detail' OR getfmp_employees_pos.Position EQ 'Crew Member Driver'  OR getfmp_employees_pos.Position EQ 'Crew Member' OR getfmp_employees_pos.Position EQ 'Crew Member - Driver'>
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews
SET employee_position_ID =0 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery> 
  </cfif>--->
  <cfif getfmp_employees_pos.Position EQ 'Production Supervisor'  >
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET employee_position_ID =1 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery>
  </cfif>
  <cfif getfmp_employees_pos.Position EQ 'Foreman - Training' OR getfmp_employees_pos.Position EQ 'Foreman' OR getfmp_employees_pos.Position EQ 'Foreman - Non-Driving'    >
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET  employee_position_ID =2 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery>
  </cfif>
<!---   <cfif getfmp_employees_pos.Position EQ 'Irrigation Tech'  >
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET employee_position_ID =3 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery>
  </cfif> --->
  <cfif getfmp_employees_pos.Position EQ 'Branch Manager'  >
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET employee_position_ID =9 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery>
  </cfif>
 <!---  <cfif getfmp_employees_pos.Position EQ 'Spray Tech'  >
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET employee_position_ID =5 WHERE employee_ID = #getfmp_employees_pos.emp_id#
 </cfquery>
  </cfif> --->
</cfloop>
<!---  Step 3 --->
<cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET crew_leader_id =0 WHERE employee_position_ID = 1
 </cfquery>
<cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews 
SET crew_leader_id =0,supervisor_id =0 WHERE employee_position_ID = 9
 </cfquery>
<!---  Step 4 --->
<!--- <cfquery name="getfmp_employees_Pos0" datasource="JRGM" >
 SELECT  employee_id,crew_leader_id FROM app_crews WHERE  employee_position_ID =0 AND employee_branch ='Williamsburg'   
 ORDER by employee_id
 </cfquery>
<cfloop query="getfmp_employees_Pos0" >
  <cfquery name="getfmp_employees_Pos0_supervisor" datasource="JRGM" >
 SELECT  supervisor_id FROM app_crews WHERE employee_id= #getfmp_employees_Pos0.crew_leader_id# 
 </cfquery>
  <cfif getfmp_employees_Pos0_supervisor.recordcount GT 0>
    <cfquery name="insert_into_SQL" datasource="JRGM">
 UPDATE  app_crews
SET supervisor_id  =#getfmp_employees_Pos0_supervisor.supervisor_id# 
WHERE employee_ID = #getfmp_employees_pos0.employee_id#
 </cfquery> 
  </cfif>
</cfloop>--->
Crews have been updated!
<cfabort>
<!---  Step 5 --->
<cfquery name="getfmp_employees_pw" datasource="JRGM" >
 SELECT  * FROM app_crews  WHERE Employee_Position_ID IN (1,2,9) AND  
Employee_ID >  #maxid#  
 ORDER by Employee_ID
 </cfquery>
<cfloop query="getfmp_employees_pw" >
  <CFSET  username = left(getfmp_employees_pw.firstname,1) & getfmp_employees_pw.lastname>
  <CFSET  password = 'jrgm'>
  <cfquery name="insert_into_SQL" datasource="JRGM">
 Insert INTO   employee_passwords (Employee_ID,notes,access_role,firstname,lastname,username,password,employee_branch,employee_active,date_added)
VALUES (#getfmp_employees_pw.Employee_ID#,'#getfmp_employees_pw.Employee_Name#',#getfmp_employees_pw.Employee_Position_ID#,'#getfmp_employees_pw.firstname#',
'#getfmp_employees_pw.lastname#','#username#','#password#','#getfmp_employees_pw.Employee_Branch#',1,CURRENT_TIMESTAMP)
 </cfquery>
</cfloop>
<cfabort>
</body>
</html>
