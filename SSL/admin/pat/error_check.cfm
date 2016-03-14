<!---

JOBS QUERIES

<!---------------Query to make sure job exists for a job worked-------------->
<cfquery name="j2" datasource="jrgm">
SELECT DISTINCT Job_ID
FROM         app_job_clock
WHERE     (Job_ID NOT IN
                          (SELECT     [Job ID]
                            FROM          app_jobs))
ORDER BY Job_ID
 </cfquery>
<cfif j2.recordcount GT 0>
  <br>
  J2--Query to make sure job exists for a job worked-
  <cfdump  var="#j2#">
</cfif>

<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j3" datasource="jrgm">

SELECT       ID, Job_ID, Job_clock_ID, Service_ID, Service_Time_In, Service_Time_Out, Service_Time, ds_id, crew_leader, OLD_JOB_ID
FROM         app_job_services_clock
WHERE     (Job_clock_ID NOT IN
   (SELECT     ID
    FROM          app_job_clock))
                            
   </cfquery>
<cfif j3.recordcount GT 0>
  <br>
  J3--Query to make sure job exists for a job worked-
  <cfdump  var="#j3#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->


<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j4" datasource="jrgm">
SELECT      ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader, branch_code, 
                      OLD_JOB_ID
FROM         app_job_services_actual_employee
WHERE     (job_clock_id NOT IN
                          (SELECT     ID
                            FROM          app_job_clock))        
   </cfquery>
<cfif j4.recordcount GT 0>
  <br>
  J4--Query to make sure job exists for a job worked-
  <cfdump  var="#j4#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->

<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j5" datasource="jrgm">
SELECT      ID, Job_ID, Job_clock_ID, Service_ID, Service_Time_In, Service_Time_Out, Service_Time, ds_id, crew_leader, OLD_JOB_ID
FROM         app_job_services_clock
WHERE     (Service_Time = 0)
   </cfquery>
<cfif j5.recordcount GT 0>
  <br>
  J5--Query to make sure job exists for a job worked-
  <cfdump  var="#j5#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->

<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j6" datasource="jrgm">
SELECT     TOP (2000) ID, Job_ID, Job_clock_ID, Service_ID, Service_Time_In, Service_Time_Out, Service_Time, ds_id, crew_leader, OLD_JOB_ID
FROM         app_job_services_clock
WHERE     (Service_Time = 0)
   </cfquery>
<cfif j6.recordcount GT 0>
  <br>
  J6--Query to make sure job exists for a job worked-
  <cfdump  var="#j6#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->


<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j7" datasource="jrgm">
SELECT     [Job ID], [Wk Loc ID], [Wk Location Name], branch
FROM         app_jobs
WHERE     (0 = 0) AND (active_record = 1) AND ([Wk Location Name] NOT IN
                          (SELECT     event_name
                            FROM          app_events
                            WHERE      (0 = 0)))
   </cfquery>
<cfif j7.recordcount GT 0>
  <br>
  J7--Query to make sure job exists for a job worked-
  <cfdump  var="#j7#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->


<!---------------Query to make sure Job_clock_ID exists for a job worked-------------->
<cfquery name="j8" datasource="jrgm">
SELECT     [Job ID], [Wk Loc ID], [Wk Location Name], branch
SELECT     [Job ID], [Wk Loc ID], [Wk Location Name], branch
FROM         app_jobs
WHERE     (0 = 0) AND (active_record = 1) AND ([Job ID] NOT IN
                          (SELECT     job_id
                            FROM          app_events
                            WHERE      (0 = 0)))
ORDER BY ID DESC
   </cfquery>
<cfif j8.recordcount GT 0>
  <br>
  J8--Query to make sure job exists for a job worked-
  <cfdump  var="#j8#">
</cfif>

<!---------------END Query to make sure Job_clock_ID exists for a job worked-------------->

JOBS QUERIES

--->

<cfquery name="get_all_employees" datasource="jrgm">
SELECT  ID, [Employee ID], [Name FirstLast], First_name, Last_name, Position,  [Name LastFirst], Branch, 
last_modified_date, export_date, active_record,  position_id, email,
export_id,  employee_hire_date, employee_rehire_date, [direct supervisor] AS supervisor ,direct_supervisor_id,
fww, regular_pay_rate
 FROM app_employees     
</cfquery>
<cfset todayDate = Now()>
<cfset Now_Time = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset tomorrow = #DateFormat("#tomorrow#", "mm/dd/yyyy")#>
<cfset today = #DateFormat("#todayDate#", "mm/dd/yyyy")#>

<!---These are quoting table queries--->
<!---<cfquery name="q200" datasource="jrgm">
SELECT     ID, date_created,  opportunity_id, date_updated, user_id   FROM quote_main  
WHERE  opportunity_id  
NOT IN (SELECT    opportunity_id  FROM quote_services)
</cfquery>

<cfif q200.recordcount GT 0>
  Q200-
  <cfdump  var="#q200#">
</cfif>


<cfquery name="q201" datasource="jrgm">
SELECT   opportunity_id   FROM quote_services   
WHERE  opportunity_id  
NOT IN (SELECT    opportunity_id  FROM quote_main)
</cfquery>

<cfif q201.recordcount GT 0>
  q201-
  <cfdump  var="#q201#">
</cfif>

 <cfloop query="q201">
    <cfquery name="UPDATEget_eq_emp" datasource="jrgm">
DELETE  FROM quote_services    WHERE
 opportunity_id  = #q201.opportunity_id#
  </cfquery>
  </cfloop>



<cfquery name="q201A" datasource="jrgm">
SELECT   opportunity_id   FROM quote_materials   
WHERE  opportunity_id  
NOT IN (SELECT    opportunity_id  FROM quote_main)
</cfquery>

<cfif q201A.recordcount GT 0>
  q201A-
  <cfdump  var="#q201A#">
</cfif>

  <cfloop query="q201A">
    <cfquery name="UPDATEget_eq_emp" datasource="jrgm">
DELETE  FROM quote_materials    WHERE
 opportunity_id  = #q201A.opportunity_id#
  </cfquery>
  </cfloop>


<cfquery name="q202" datasource="jrgm">
SELECT  opportunity_id, opportunity_name,  date_updated_utc, date_quote_started, date_quote_updated
FROM         quote_start  WHERE  date_quote_updated IS NOT NULL
 AND opportunity_id  
NOT IN (SELECT    opportunity_id  FROM quote_main)
</cfquery>

<cfif q202.recordcount GT 0>
  q202
  <cfdump  var="#q202#">
  
  <cfloop query="q202">
    <cfquery name="UPDATEget_eq_emp" datasource="jrgm">
 UPDATE quote_start
SET date_quote_started = NULL, date_quote_updated = NULL, user_id
 = NULL  WHERE opportunity_id  = #q202.opportunity_id#
  </cfquery>
  </cfloop>
</cfif>--->
<!---These are quoting table queries--->
<!---  <cfabort>--->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>James River Error Check</title>
<style type="text/css">
.red {
	color: #F00;
}
</style>
</head>
<body>
<br>
<br>
Consistency Checks 
<!---------------Query to make sure crew leaders have a direct_supervisor_id id in employees table --------------->
<cfquery name="q1"  dbtype="query">
    SELECT first_name,last_name,ID,supervisor FROM   get_all_employees WHERE position_id =2  AND direct_supervisor_id IS NULL AND active_record=1
     </cfquery>
<cfif q1.recordcount GT 0>
  Q1-Query to make sure crew leaders have a direct_supervisor_id id in employees table
  <cfdump  var="#q1#">
</cfif>
<!---------------Query to make sure crew leaders have a direct_supervisor_id id in employees table ---------------> 

<!---------------Query to make sure that employees listed as CL =2 and supervisors=1 and bm =9 have passsords --------------->
<cfquery name="q2" datasource="jrgm">
    SELECT first_name,last_name,ID, employee_branch,employee_position_id,   employee_id FROM app_crews WHERE employee_position_id IN (1,2,6,7,8,9,10,95) AND active_record=1  AND first_name <> 'General' AND employee_id NOT IN (SELECT employee_id FROM app_employee_passwords)
     </cfquery>
<cfif q2.recordcount GT 0>
  <br>
  Q2-Query to check to make sure that employees listed as CL =2 and supervisors=1 and bm =9 have passwords
  <cfdump  var="#q2#">
</cfif>
<!---------------END Query to make sure that employees listed as CL =2 and supervisors=1 and bm =9 have passwords ---------------> 

<!---------------Query to make sure that  CL =2 have crew_leader_id listed as NULL--------------->
<cfquery name="q3" datasource="jrgm">
 SELECT first_name,last_name,ID, employee_branch,employee_position_id,   employee_id FROM app_crews WHERE employee_position_id IN (2) AND active_record=1  AND crew_leader_id IS NOT NULL
 </cfquery>
<cfif q3.recordcount GT 0>
  <br>
  Q3- Query to make sure that  CL =2 have crew_leader_id listed as NULL IN APP_Crews
  <cfdump  var="#q3#">
</cfif>
<!---------------END  Query to make sure that  CL =2 have crew_leader_id listed as NULL---------------> 

<!---------------Query to check for missing jobs in app_events and wont be showing under ALL branch jobs----------------->
<cfquery name="q4" datasource="jrgm">
SELECT     TOP (1000) ID, [Job ID], [Wk Loc ID], [Wk Location Name], [Service Address],  [Service City], [Service State], [Service Zip],   export_date, active_record, export_id, Crew_Leader_ID, Supervisor_ID, branch, Status
FROM         app_jobs
WHERE      [Wk Loc ID] <>2961173 AND    [Wk Loc ID] <>2986307   AND ([Wk Location Name] NOT IN
 (SELECT     event_name
 FROM app_events))  AND ID NOT IN (1212,1213,1215)    AND active_record =1
</cfquery>
<cfif q4.recordcount GT 0>
  Q4-Query to check for missing jobs in app_events and wont be showing under ALL branch jobs
  <cfdump var="#q4#">
</cfif>
<!---------END -Query to check for missing jobs in app_events and wont be showing under ALL branch jobs-------------> 

<!-----------------------------Query to make sure Crew leaders have a supervisor ID  and NOT  0--------------------------->
<cfquery name="q5" datasource="jrgm">
SELECT     employee_id,id,end_date
FROM         app_crews
WHERE   Employee_Position_ID = 2 AND  supervisor_id = 0  AND   end_date >  '#tomorrow#'
</cfquery>
<cfif q5.recordcount GT 0>
  Q5-This crew leader needs a supervisor
  <cfdump var="#q5#">
</cfif>
<!--------------------------------END Query to check for duplicate employee id Numbers---------------------------> 

<!-----------------------------Query to check for duplicate Project ID Numbers----------------------------->
<cfquery name="q6" datasource="jrgm">  
 SELECT DISTINCT [Wk Loc ID], COUNT([Wk Loc ID]) AS counter
FROM         app_jobs WHERE [Wk Loc ID] <> 9999999
GROUP BY [Wk Loc ID]
HAVING COUNT([Wk Loc ID]) > 1
ORDER BY counter DESC
</cfquery>
<cfif q6.recordcount GT 0>
  Q6-Query to check for duplicate Project ID Numbers
  <cfdump var="#q6#">
</cfif>
<!----END  Query to check for duplicate Project ID Numbers-----------------------------------------> 

<!-----------------------------Query to check for duplicate JOB ID Numbers--------------------------->
<cfquery name="q7" datasource="jrgm">
 SELECT DISTINCT [Job ID], COUNT([Job ID]) AS counter
FROM app_jobs
GROUP BY [Job ID]
HAVING COUNT([Job ID]) > 1
ORDER BY counter DESC
</cfquery>
<cfif q7.recordcount GT 0>
  Q7-  Query to check for duplicate JOB ID Numbers
  <cfdump var="#q7#">
</cfif>
<!-----------------END  Query to check for duplicate JOB IDID Numbers-----------------------------------> 

<!-----------------------------Query to check for duplicate employee id Numbers----------------------------->
<cfquery name="q8" datasource="jrgm">
SELECT     [Employee ID] AS empid, COUNT([Employee ID]) AS counter
FROM         app_employees
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) > 1
ORDER BY counter DESC
</cfquery>
<cfif q8.recordcount GT 0>
  Q8- Query to check for duplicate employee id numbers in App_employees
  <cfdump var="#q8#">
</cfif>
<!--------------------------------END Query to check for duplicate employee id Numbers---------------------------> 

<!-----------------------------Query to count instances of employee in crew table------------------------------------>
<cfquery name="q9" datasource="jrgm">
 SELECT     crew_name, employee_position_id, COUNT(crew_name) AS cccn, employee_branch
FROM         app_crews WHERE Employee_Position_ID <> NULL
GROUP BY crew_name, employee_position_id,employee_branch
ORDER BY crew_name ASC 
</cfquery>
<!--- <cfdump var="#q3#"> --->
<cfquery name="q10"  dbtype="query">
 SELECT     crew_name,   COUNT(crew_name) AS cccn
FROM         q9
GROUP BY crew_name 
HAVING  COUNT(crew_name) > 1
ORDER BY crew_name ASC
</cfquery>
<cfif q10.recordcount GT 0>
  Q10-  Query to count instances of employee in crew table with different positions
  <cfdump var="#q10#">
</cfif>
<!------------------------------------------END Query to count instances of employee in crew table-------------------------------------------> 

<!-----------------Query to make sure that CL who have passwords are active are listed as 2's in  app_crews----------------------------->
<cfquery name="q11" datasource="jrgm">
    SELECT   ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
FROM app_employee_passwords WHERE access_role =2 AND EMPLOYEE_ACTIVE > 0 AND  employee_id NOT IN (SELECT employee_id FROM app_crews WHERE employee_position_id =2)
     </cfquery>
<cfif q11.recordcount GT 0>
  Q11-  Query to make sure that CL who have passwords are active are listed as 2's in  app_crews
  <cfdump var="#q11#">
</cfif>
<!-----------------END  Query to make sure that CL who have passwords are active are listed as 2's in  app_crews-----------------------------> 

<!-----------------Query to make sure that users who login have an email  in app_passwords----------------------------->
<cfquery name="q12" datasource="jrgm">
    SELECT ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname,   employee_branch, email
FROM    app_employee_passwords WHERE access_role =2 AND EMPLOYEE_ACTIVE > 0 AND   LEN(email) = 0 AND employee_branch <> 'Test'
     </cfquery>
<cfif q12.recordcount GT 0>
  Q12- Query to make sure that users who login have an email  in app_passwords-
  <cfdump var="#q12#">
</cfif>
<!-----------------END  Query to make sure that users who login have an email  in app_passwords-----------------------------> 

<!-----------------Query to make sure that CL who have passwords are active are listed as 6's in  app_crews----------------------------->
<cfquery name="q13" datasource="jrgm">
  SELECT   ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
FROM app_employee_passwords WHERE access_role =6 AND EMPLOYEE_ACTIVE > 0 AND  employee_id NOT IN (SELECT employee_id FROM app_crews WHERE employee_position_id =6)
     </cfquery>
<cfif q13.recordcount GT 0>
  Q13-Query to make sure that CL who have passwords are active are listed as 6's in  app_crews
  <cfdump var="#q13#">
</cfif>
<!-----------------END  Query to make sure that CL who have passwords are active are listed as 6's in  app_crews-----------------------------> 

<!-----------------Query to make sure that  PM who have passwords are active are listed as 1's in  app_crews----------------------------->
<cfquery name="q13b" datasource="jrgm">
  SELECT   ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
FROM app_employee_passwords WHERE access_role =1 AND EMPLOYEE_ACTIVE > 0 AND  employee_id NOT IN (SELECT employee_id FROM app_crews WHERE employee_position_id =1)
     </cfquery>
<cfif q13b.recordcount GT 0>
  Q13b-Query to make sure that PM who have passwords are active are listed as 1's in  app_crews
  <cfdump var="#q13b#">
</cfif>
<!-----------------END  Query to make sure that CL who have passwords are active are listed as 6's in  app_crews-----------------------------> 

<!-----------------Query to make sure that CL who have passwords are active are listed as 7's in  app_crews----------------------------->
<cfquery name="q14" datasource="jrgm">
  SELECT   ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
FROM app_employee_passwords WHERE access_role =7 AND EMPLOYEE_ACTIVE > 0 AND  employee_id NOT IN (SELECT employee_id FROM app_crews WHERE employee_position_id =7)
     </cfquery>
<cfif q14.recordcount GT 0>
  Q14- Query to make sure that CL who have passwords are active are listed as 7's in  app_crews
  <cfdump var="#q14#">
</cfif>
<!-----------------END  Query to make sure that CL who have passwords are active are listed as 7's in  app_crews-----------------------------> 

<!--------------------------------------------------Query to check for duplicate usernames----------------------------------------------------------------->
<cfquery name="q15" datasource="jrgm">  
 SELECT DISTINCT username, COUNT(username) AS counter
FROM        app_employee_passwords   WHERE username <> 'jbatterson'
 GROUP BY username
HAVING COUNT(username) > 1
ORDER BY counter DESC
</cfquery>
<cfif q15.recordcount GT 0>
  Q15- Query to check for duplicate Usernames
  <cfdump var="#q15#">
</cfif>
<!-------------------------------------------END  Query to check for duplicate usernames---------------------------------------------------------------> 

<!---------------Query to make sure there is an actual job in App_job_clock to correspond to app_job_services_actual_employee --------------->
<cfquery name="q16" datasource="jrgm">
SELECT job_clock_id
FROM app_job_services_actual_employee
WHERE ID > 236326 AND  (job_clock_id NOT IN
(SELECT ID  FROM app_job_clock))
 </cfquery>
<cfif q16.recordcount GT 0>
  Q16- Query to make sure there is an actual job in App_job_clock to correspond to app_job_services_actual_employee
  <cfdump  var="#q16#">
</cfif>
<!---------------END Query to make sure there is an actual job in App_job_clock to correspond to app_job_services_actual_employee ---------------> 
<br>
<br>

<!--- Employees that are not in the ADP active file--->
<cfquery name="q19"   datasource="jrgm">
 SELECT     [Employee ID] AS empid,  [Name FirstLast],branch
FROM         app_employees
WHERE      active_record = 1 AND  [Employee ID] < 5000 AND   [Employee ID]  NOT IN (SELECT [Employee ID] FROM app_employees_test)
ORDER by branch
 </cfquery>
<cfif q19.recordcount GT 0>
  Q19-Employees that are not in the ADP active file
  <cfdump  var="#q19#">
</cfif>
<!--- END Employees that are not in the ADP active file---> 
<br>
<br>
<!--- Employees that are not inactive in MS SQL but in the ADP active file--->
<cfquery name="q20"   datasource="jrgm">
 SELECT     [Employee ID] AS empid,  [Name FirstLast],branch
FROM         app_employees
WHERE      active_record = 0 AND  [Employee ID] < 5000 AND   [Employee ID]   IN (SELECT [Employee ID] FROM app_employees_test)
ORDER by branch
 </cfquery>
<cfif q20.recordcount GT 0>
  q20-Employees that are not inactive in MS SQL but in the ADP active file-
  <cfdump  var="#q20#">
</cfif>
<!--- END Employees that are not in MS SQL but in the ADP active file---> 
<br>
<br>
<!--- Employees that are not   in MS SQL but in the ADP active file  --->
<cfquery name="q21"   datasource="jrgm">
SELECT     [Employee ID] AS empid,  [Name FirstLast],branch
FROM         app_employees_test
WHERE      [Employee ID] < 5000 AND   [Employee ID]   NOT IN (SELECT [Employee ID] FROM app_employees)
ORDER by branch
 </cfquery>
<cfif q21.recordcount GT 0>
  Q21-Employees that are not   in MS SQL but in the ADP active file
  <cfdump  var="#q21#">
</cfif>
<!--- END Employees that are not   in MS SQL but in the ADP active file  ---> 
<br>
<br>
<!---------------Query to make sure equipment is allocated to an active employee --------------->
<cfquery name="get_eq_emp" datasource="jrgm">
 SELECT branch_name,ID, crew_assignment_last
FROM equipment
WHERE   crew_assignment_last <> 3 AND  crew_assignment_last < >5   AND  crew_assignment_last NOT IN (SELECT [Employee ID] FROM app_employees WHERE active_record =1)
ORDER by ID
 </cfquery>
<cfif get_eq_emp.recordcount GT 0>
  Fix Equipment- Uncomment this out
  <cfloop query="get_eq_emp">
    <cfquery name="UPDATEget_eq_emp" datasource="jrgm">
 UPDATE equipment
SET crew_assignment_last =(SELECT employee_id FROM app_employee_passwords  WHERE employee_branch = '#get_eq_emp.branch_name#' 
AND access_role = 9 AND  employee_active =1)
 WHERE ID  = #get_eq_emp.ID#
  </cfquery>
  </cfloop>
  Query to make sure equipment is allocated to an active employee
  <cfdump  var="#get_eq_emp#">
</cfif>
<!--------------END Query to make sure equipment is allocated to an active employee ---------------> 

<!-----------------Query to make active_employees in app_employees NOT listed in APP_CREWS----------------------------->
<cfquery name="get_employees_not_in_app_crews" datasource="jrgm" maxrows="3">
    SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS Employee_name, First_name, Last_name, Position,  Branch
 FROM app_employees WHERE  ACTIVE_RECORD > 0 AND [Employee ID] < 100000 AND  branch <> 'Corporate' AND position <> 'Regional Manager' AND position <> 'Branch Administrator' AND [Employee ID] NOT IN (SELECT employee_id FROM app_crews )
     </cfquery>
<cfif get_employees_not_in_app_crews.recordcount GT 0>
  Uncomment out to see active_employees in app_employees NOT listed in APP_CREWS
  <cfloop query="get_employees_not_in_app_crews" >
    <cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#get_employees_not_in_app_crews.Branch#'  AND access_role = 9  AND employee_active =1
</cfquery>
    <cfquery name="insert_into_SQL" datasource="JRGM">
 INSERT INTO APP_crews 
 (Employee_ID ,crew_name,Employee_Branch ,Crew_Leader_ID ,Employee_Position_ID,First_name,Last_name,start_date,end_date,active_record,supervisor_ID)
 VALUES 
 (#get_employees_not_in_app_crews.Employee_ID#, '#get_employees_not_in_app_crews.Employee_Name#','#get_employees_not_in_app_crews.Branch#',NULL,0,'#TRIM(get_employees_not_in_app_crews.First_Name)#','#TRIM(get_employees_not_in_app_crews.Last_Name)#','2016-01-01 16:00:00','2017-09-01 16:30:00',1,'#get_BM_ID.Employee_ID#')
 </cfquery>
  </cfloop>
  Query to make active_employees in app_employees are listed in APP_CREWS <br>
  These employees must are listed under the BM
  <cfdump var="#get_employees_not_in_app_crews#">
</cfif>
<!-----------------END Query to make active_employees in app_employees NOT listed in APP_CREWS-----------------------------> 

<!-----------------Query to make  sure active_employees in app_employees have the correct branch in APP_CREWS--------------->
<cfquery name="q29" datasource="jrgm" >
    SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS Employee_name, First_name, Last_name, Position,  Branch
 FROM app_employees WHERE  ACTIVE_RECORD > 0 AND [Employee ID] < 100000 AND  branch <> 'Corporate' AND position <> 'Regional Manager' AND position <> 'Branch Administrator' 
</cfquery>
<cfquery name="get_ALL_employee_branch_from_crews" datasource="jrgm">
SELECT employee_id AS Employee_ID,crew_name ,employee_branch FROM 
app_crews  
</cfquery>
<cfloop query="q29" >
  <cfquery name="get_employee_branch_from_crews"    dbtype="query">
SELECT Employee_ID,crew_name  FROM 
get_ALL_employee_branch_from_crews WHERE     Employee_ID=#q29.Employee_ID# AND employee_branch <> '#q29.Branch#' 
</cfquery>
  <cfif get_employee_branch_from_crews.recordcount GT 0>
    These employees have  a different branch in app_employees AND app_crews
    <cfdump  var="#get_employee_branch_from_crews#">
  </cfif>
</cfloop>
<!-----------------END Query to make  sure active_employees in app_employees have the correct branch in APP_CREWS---------------> 

<!--- Check to make sure job ids in events match job id in app_jobs--->
<cfquery name="q30" datasource="jrgm">
SELECT     job_id, event_name
FROM         app_events
WHERE     (job_id NOT IN
 (SELECT  [Job ID]
 FROM app_jobs)) 
 ORDER by event_name ASC
</cfquery>
<cfif q30.recordcount GT 0>
  Q30-Check to make sure job ids in events match job id in app_jobs
  <cfdump  var="#q30#">
</cfif>
<!--- END Check to make sure job ids in events match job id in app_jobs---> 

<!--- Check to make sure job ids in events match job id in app_jobs --->
<cfquery name="q30A" datasource="jrgm">
SELECT     job_id, event_name
FROM         app_events
WHERE     (job_id  IN
 (SELECT  [Job ID]
 FROM app_jobs where active_record =0)) 
 ORDER by event_name ASC
</cfquery>
<cfif q30A.recordcount GT 0>
  Q30A-Check to make sure job ids in events match job id in app_jobs -Need to delete in events
  <cfdump  var="#q30A#">
</cfif>
<!--- END Check to make sure job ids in events match job id in app_jobs ---> 

<br>
<!-----------------Query to make sure that inactive employees passwords are DISABLED in  app_employee_passwords----------------------------->
<cfquery name="q32" datasource="jrgm">
    SELECT  ID, Employee_ID, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch
 FROM app_employee_passwords WHERE  EMPLOYEE_ACTIVE =1 AND  
    employee_id   IN (SELECT [Employee ID] FROM app_employees WHERE active_record=0)
     </cfquery>
<cfif q32.recordcount GT 0>
  Q32-Query to make sure that inactive employees passwords are DISABLED in  app_employee_passwords
  <cfdump var="#q32#">
</cfif>
<!-----------------END  Query to make sure that CL who have passwords are active are listed as 2's in  app_crews-----------------------------> 

<!-----------------Query to make sure that daily sheets have a supervisor id--------------------------->
<cfquery name="q33" datasource="jrgm">
SELECT     TOP (200) ID, Supervisor_ID, Crew_Leader_ID, DS_Date, record_created, ds_approved, ds_approved_by, ds_approved_date, entry_method, ds_date_last, ds_last_by, 
   branch_code
FROM         app_daily_sheets WHERE  Supervisor_ID IS NULL
</cfquery>
<cfif q33.recordcount GT 0>
  Q33-  Query to make sure that employees in crews are active in app_employees
  <cfdump var="#q33#">
</cfif>
<!-----------------Query to make sure that employees in crews are active in app_employees---------------------------->
<cfquery name="q81" datasource="jrgm">
    SELECT employee_id FROM app_crews WHERE    employee_id   IN (SELECT [Employee ID] FROM app_employees WHERE active_record =0)
     </cfquery>
<cfif q81.recordcount GT 0>
  Q81-  Query to make sure that employees in crews are active in app_employees
  <cfdump var="#q81#">
</cfif>
<!-----------------END  Query to make sure that employees in crews are active in app_employees-----------------------------> 

<!-----------------Query to make sure that crew_leaders  in crews are active in app_employees---------------------------->
<cfquery name="q82" datasource="jrgm">
    SELECT  crew_leader_id FROM app_crews WHERE     crew_leader_id   IN (SELECT [Employee ID] FROM app_employees WHERE active_record =0)
    order by  crew_leader_id
     </cfquery>
<cfif q82.recordcount GT 0>
  Q82-  Query to make sure that  crew_leaders in crews are active in app_employees
  <cfdump var="#q82#">
</cfif>
<!-----------------END  Query to make sure that crew_leaders  in crews are active in app_employees-----------------------------> 

<!-----------------Query to make sure that crew_leaders  in crews are active in app_employees---------------------------->

<cfquery name="q82A" datasource="jrgm">
    SELECT     TOP (2000) ID, start_date, end_date, event_name, lat, lng, event_location, crew_leader_id, supervisor_id, branch, job_id, active_record, event_length, event_pid, 
                      event_id, textcolor, text, rec_type, export_id, color, RecurrenceDayID
FROM         app_events
WHERE     (crew_leader_id IN
                          (SELECT     Employee_ID
                            FROM          app_employee_passwords
                            WHERE      (employee_active = 0)))
   </cfquery>
<cfif q82A.recordcount GT 0>
  Q8A2-  Query to make sure that  crew_leaders in app_events are active in app_employees
  <cfdump var="#q82A#">
</cfif>

<!-----------------Query to make sure that supervisor_id  in crews are active in app_employees---------------------------->
<cfquery name="q83" datasource="jrgm">
    SELECT  supervisor_id  FROM app_crews WHERE     supervisor_id   IN (SELECT [Employee ID] FROM app_employees WHERE active_record =0)
    order by  crew_leader_id
     </cfquery>
<cfif q83.recordcount GT 0>
  Q83-  Query to make sure that  supervisor_id in crews are active in app_employees<br>
  DELETE These from crews. Make sure they show under BM.
  <cfdump var="#q83#">
</cfif>

<!-------------Query to check for Richmond Jobs---------Match in events-------->
<cfquery name="qrichmond" datasource="jrgm">
SELECT      [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],last_modified_date,   active_record, export_id, branch, Status
FROM         app_jobs WHERE branch = 'Richmond'  AND active_record =1   AND [Wk Loc ID] <>2961173  AND [Wk Loc ID] <>1773480   AND [Wk Loc ID] <>2438423 AND  [Wk Loc ID] <>  2892979 
AND      ( [Job ID] NOT IN 
 (SELECT    job_id  FROM  app_events WHERE branch = 'Richmond'))  
</cfquery>
<cfif qrichmond.recordcount GT 0>
  qrichmond-Query to check for Richmond Jobs ,
  <cfdump var="#qrichmond#">
</cfif>
<!--------------END Query to check for Richmond Jobs---------------Match in events--------> 

<!-------------Query to check for Newport News Jobs----------------Match in events-------->
<cfquery name="qnn" datasource="jrgm">
SELECT      [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],last_modified_date,   active_record, export_id, branch, Status
FROM         app_jobs WHERE branch = 'Newport News'  AND active_record =1  AND [Wk Loc ID] <>1844248 AND   [Wk Loc ID] <> 2568756
 AND [Wk Loc ID] <> 2621317 AND      [Wk Loc ID] <>2986307
AND      (  [Job ID]  NOT IN 
 (SELECT    job_id  FROM  app_events WHERE branch = 'Newport News'))  
</cfquery>
<cfif qnn.recordcount GT 0>
  qnn-Query to check for  Newport News Jobs
  <cfdump var="#qnn#">
</cfif>
<!--------------END Query to check for  Newport News Jobs--------------Match in events--------> 

<!---------------Query to check for Chesterfield Jobs-----------------Match in events-------->
<cfquery name="qCFLD" datasource="jrgm">
SELECT      [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],last_modified_date,   active_record, export_id, branch, Status
FROM         app_jobs WHERE branch = 'Chesterfield'  AND active_record =1  AND  [Wk Loc ID] <> 1476280 AND  [Wk Loc ID] <> 2213242 AND [Wk Loc ID] <> 2882441 
AND      ([Job ID] NOT IN 
 (SELECT    job_id  FROM  app_events WHERE branch = 'Chesterfield'))  
</cfquery>
<cfif qCFLD.recordcount GT 0>
  qCFLD-Query to check for  Chesterfield Jobs
  <cfdump var="#qCFLD#">
</cfif>
<!--------------END Query to check for  Chesterfield Jobs---------------Match in events--------> 

<!---------------Query to check for Charlottesville Jobs--------------Match in events-------->
<cfquery name="qCVLE" datasource="jrgm">
SELECT      [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],last_modified_date,   active_record, export_id, branch, Status
FROM         app_jobs WHERE branch = 'Charlottesville'  AND active_record =1  AND  [Wk Loc ID]  <> 1322500 AND  [Wk Loc ID]  <> 2649999
AND      (  [Job ID]  NOT IN 
 (SELECT    job_id  FROM  app_events WHERE branch = 'Charlottesville'))  
</cfquery>
<cfif qCVLE.recordcount GT 0>
  qCVLE-Query to check for  Charlottesville Jobs
  <cfdump var="#qCVLE#">
</cfif>
<!--------------END Query to check for  Charlottesville Jobs---------------Match in events--------> 

<!---------------Query to check for Portsmouth Jobs----------------->
<cfquery name="qPORT" datasource="jrgm">
SELECT      [Wk Loc ID], [Wk Location Name], [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],last_modified_date,   active_record, export_id, branch, Status
FROM         app_jobs WHERE branch = 'Portsmouth'  AND active_record =1  AND  [Wk Loc ID]  <> 2765980
AND      (  [Job ID] NOT IN 
 (SELECT    job_id  FROM  app_events WHERE branch = 'Portsmouth'))  
</cfquery>
<cfif qPORT.recordcount GT 0>
  qPORT-Query to check for  Portsmouth Jobs
  <cfdump var="#qPORT#">
</cfif>
<!--------------END Query to check for  Portsmouth Jobs--------------Match in events--------> 

<!---------------Query to check for inactive CL  in app_events  ---------------->
<cfquery name="q101" datasource="jrgm">
SELECT      ID, start_date, end_date, event_name, crew_leader_id,  branch
FROM         app_events
WHERE      crew_leader_id NOT IN
 (SELECT      Employee_ID FROM  app_employee_passwords WHERE  employee_active= 1 AND access_role>0)
</cfquery>
<cfif q101.recordcount GT 0>
  q101-Query to check for inactive CL  in app_events <br>
  DELETE These from events.
  <cfdump var="#q101#">
</cfif>
<!---------END ---Query to check for inactive CL  in app_events  -------------> 

<!---------------Query to check for inactive supervisor  in app_events  ---------------->
<cfquery name="q102" datasource="jrgm">
SELECT      ID, start_date, end_date, event_name,  supervisor_id, branch
FROM         app_events
WHERE      supervisor_id NOT IN
 (SELECT      Employee_ID  FROM  app_employee_passwords WHERE  employee_active= 1 AND access_role > 0)
</cfquery>
<cfif q102.recordcount GT 0>
  q102-Query to check for inactive Supervisor  in app_events <br>
  DELETE These from events.
  <cfdump var="#q102#">
</cfif>
<!---------END ---Query to check for inactive supervisor  in app_events  -------------> 

<!---------------Query to make sure oil change id is correct  --------------->
<cfquery name="get_oil_change_issues" datasource="jrgm">
SELECT    ID, equipment_id, oil_change_date, last_oil_change_employee_id, last_oil_change_mileage, last_oil_change_hours, enter_date, entered_by
FROM         equipment_oil_changes
WHERE     (entered_by IS NULL)  AND entry_corrected  IS NULL
ORDER BY ID DESC
 </cfquery>
<cfif get_oil_change_issues.recordcount GT 0>
  <br>
  <br>
  Query to make sure oil change id is correct <br>
  <!---  <cfdump var="#get_oil_change_issues.recordcount#">---> 
  -Should be 0- If not check  equipment_oil_changes table- Fix the equipment_id to the equipment ID field 
  <!---   <cfabort> --->
</cfif>
<cfif get_oil_change_issues.recordcount GT 0>
  <cfloop query="get_oil_change_issues">
    <cfquery name="UPDATE_get_oil_change_issues" datasource="jrgm">
 UPDATE equipment_oil_changes
SET equipment_id =(SELECT ID  FROM  equipment  WHERE Equipment_ID = '#get_oil_change_issues.equipment_id#' ), entry_corrected  =1 
 WHERE ID  = #get_oil_change_issues.ID#
</cfquery>
  </cfloop>
</cfif>
<!--------------END Query to make sure oil change id is correct ---------------> 

<!---Williamsburg in password tables--->
<cfquery name="q81" datasource="jrgm">
SELECT     ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch         
FROM         app_employee_passwords
WHERE     (employee_active = 1)  AND employee_branch ='Williamsburg'
ORDER BY employee_branch, Employee_ID, employee_name
</cfquery>
<cfif q81.recordcount GT 0>
  q81-Query to check for Williamsburg in password tables-
  <cfdump var="#q81#">
</cfif>
<!---END Williamsburg in password tables---> 

<!---Query to check for 00 EMP ID in app_employee_payroll_clock table--->
<cfquery name="get_00_employees" datasource="jrgm">
SELECT   employee_ID FROM app_employee_payroll_clock   WHERE  Employee_ID < 51
</cfquery>
<cfif get_00_employees.recordcount GT 0>
  get_00_employees-Query to check for 00 EMP ID in app_employee_payroll_clock table <br>
  Need to delete these
  <cfdump var="#get_00_employees#">
</cfif>
<!---END Query to check for 00 EMP ID in app_employee_payroll_clock table---> 

<!---Query to check for unapproved payroll in app_employee_payroll_clock table PRIOR PERIOD --->
<cfquery name="get_pr1234" datasource="jrgm">
SELECT     ID, Employee_ID, time_worked, In_Out_Status, ds_date, ds_id 
FROM         app_employee_payroll_clock
WHERE     (Time_In > '12/31/2014') AND (Time_Out < '#APPLICATION.blockdate#') 
AND (payroll_approved IS NULL) AND (Employee_ID < 100000)
</cfquery>
<cfif get_pr1234.recordcount GT 0>
  get_pr1234-Query to check for unapproved payroll in app_employee_payroll_clock table PRIOR PERIOD<br>
  I need to check  these
  <cfdump var="#get_pr1234#">
</cfif>
<br>
<br>
<cfif NOT IsDefined("url.runcounter")>
  <a href="error_check.cfm?runcounter=yes">Run Counter</a>
</cfif>
<cfif IsDefined("url.runcounter") AND  url.runcounter  EQ 'Yes'>
  <cfquery name="get_oil_change_count" datasource="jrgm">
SELECT     COUNT(ID) AS  oilchangecount 
FROM         equipment_oil_changes
 </cfquery>
  <cfquery name="get_inspection_count" datasource="jrgm">
SELECT     COUNT(ID) AS  inspectioncount 
FROM         equipment_inspections
 </cfquery>
  <cfquery name="get_equipment_repair_log_count" datasource="jrgm">
SELECT     COUNT(ID) AS  equipment_repair_log_count 
FROM         equipment_repair_log
 </cfquery>
  <cfquery name="get_active_employees" datasource="jrgm">
SELECT COUNT(ID) AS activeemployeescount
 FROM app_employees      WHERE active_record =1
</cfquery>
  <cfquery name="get_all_employees" datasource="jrgm">
SELECT COUNT(ID) AS allemployeescount
 FROM app_employees     
</cfquery>
  <cfquery name="get_timedin_employees" datasource="jrgm">
SELECT  DISTINCT employee_ID FROM app_employee_payroll_clock   WHERE ds_date = '#today#'
</cfquery>
  <cfquery name="get_am_inspections" datasource="jrgm">
 SELECT     COUNT(Inspection_ID) AS   aminspectionscount
FROM         app_Inspection_Master WHERE Inspection_Type ='Morning'
 </cfquery>
  <cfquery name="get_pm_inspections" datasource="jrgm">
 SELECT     COUNT(Inspection_ID) AS   pminspectionscount
FROM         app_Inspection_Master WHERE Inspection_Type ='Evening'
 </cfquery>
  <cfquery name="get_w_inspections" datasource="jrgm">
 SELECT     COUNT(Inspection_ID) AS   winspectionscount
FROM         app_Inspection_Master WHERE Inspection_Type ='Weekly'
 </cfquery>
  <cfquery name="get_incident" datasource="jrgm">
SELECT     COUNT(IR_ID) as incidentcount
FROM         Form_IncidentReport
 </cfquery>
  <cfquery name="get_injury" datasource="jrgm">
SELECT     COUNT(IR_ID) as injurycount
FROM       Form_InjuryReport
 </cfquery>
  <cfquery name="get_ds" datasource="jrgm">
 SELECT     COUNT(ID) AS dscount
FROM         app_daily_sheets WHERE ds_date = '#today#'
</cfquery>
  <cfquery name="insert_into_JRGMcounts" datasource="JRGM">
 INSERT INTO JRGM_counts
 (count_date, oil_changes,inspections, repair_logs, active_employees,all_employees,timed_in_employees_today,am_inspections, pm_inspections, 
 w_inspections, incident_reports, injury_reports,daily_sheets_today

)
 VALUES 
 (CURRENT_TIMESTAMP,#get_oil_change_count.oilchangecount#, #get_inspection_count.inspectioncount#, #get_equipment_repair_log_count.equipment_repair_log_count#, #get_active_employees.activeemployeescount#, 
 #get_all_employees.allemployeescount#,#get_timedin_employees.recordcount#,
 #get_am_inspections.aminspectionscount#,
 #get_pm_inspections.pminspectionscount#,
 #get_w_inspections.winspectionscount#,
 #get_incident.incidentcount#,
 #get_injury.injurycount#,
 #get_ds.dscount#
 )
 </cfquery>
  
  <!---SELECT      count_date, oil_changes, repair_logs, inspections, active_employees
FROM         JRGM_counts--->
</cfif>
<cfabort>
<cfabort>
<cfabort>
<cfabort>
<br>
<!--- Run This to compare FWW form ADP to BIZ ---> 
<!--- Convert file to XML document object --->
<cffile action="read" file="C:\inetpub\websites\jrgm.biz\SSL\admin\data_load\ADP_JRGM.xml" variable="myxml">
<cfset mydoc = XmlParse(myxml)>
<!--- get an array of employees --->
<cfset emp = mydoc.ROWSET.XmlChildren>
<cfset size = ArrayLen(emp)>
<cfparam name="FILE_NUMBER" default="0">
<cfset orderquery = QueryNew("
FIRST_NAME, 
LAST_NAME,
FILE_NUMBER,
JOB_TITLE_DESCRIPTION,
POSITION_STATUS,
JOB_TITLE_DESCRIPTION,
HOME_DEPARTMENT_CODE,
HIRE_DATE,
POSITION_EFFECTIVE_DATE,
STATUS_EFFECTIVE_DATE,
REHIRE_DATE,
CUSTOM_AREA_2"
, "
varchar,
varchar,
Integer,
varchar,
varchar,
varchar,
varchar,
date,
date,
date,
date,
varchar
"
) >
<cfset temp = QueryAddRow(orderquery, #size#)>
<cfloop index="i" from = "1" to = "#size#">
  <cfset  QuerySetCell(orderquery, "FIRST_NAME",mydoc.rowset.ROW[i].FIRST_NAME.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LAST_NAME",mydoc.rowset.ROW[i].LAST_NAME.XmlText, i)>
  <cfif Len(mydoc.rowset.ROW[i].FILE_NUMBER.XmlText)>
    <cfset QuerySetCell(orderquery, "FILE_NUMBER", mydoc.rowset.ROW[i].FILE_NUMBER.XmlText,i)>
  </cfif>
  <cfset  QuerySetCell(orderquery, "JOB_TITLE_DESCRIPTION",mydoc.rowset.ROW[i].JOB_TITLE_DESCRIPTION.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "POSITION_STATUS",mydoc.rowset.ROW[i].POSITION_STATUS.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "JOB_TITLE_DESCRIPTION",mydoc.rowset.ROW[i].JOB_TITLE_DESCRIPTION.XmlText, i)>
  <cfif Len(mydoc.rowset.ROW[i].HOME_DEPARTMENT_CODE.XmlText)>
    <cfset QuerySetCell(orderquery, "HOME_DEPARTMENT_CODE", mydoc.rowset.ROW[i].HOME_DEPARTMENT_CODE.XmlText,i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].HIRE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "HIRE_DATE",mydoc.rowset.ROW[i].HIRE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].POSITION_EFFECTIVE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "POSITION_EFFECTIVE_DATE",mydoc.rowset.ROW[i].POSITION_EFFECTIVE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].STATUS_EFFECTIVE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "STATUS_EFFECTIVE_DATE",mydoc.rowset.ROW[i].STATUS_EFFECTIVE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].REHIRE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "REHIRE_DATE",mydoc.rowset.ROW[i].REHIRE_DATE.XmlText, i)>
  </cfif>
  <cfset  QuerySetCell(orderquery, "CUSTOM_AREA_2",mydoc.rowset.ROW[i].CUSTOM_AREA_2.XmlText, i)>
</cfloop>
<cfquery name="get_all_records_adp"   dbtype="query"  >
   SELECT * FROM orderquery  WHERE  CUSTOM_AREA_2 ='FWW'
  </cfquery>
<!---<cfdump var="#get_all_records_adp#">  --->
<cfquery name="get_all_records_biz"    dbtype="query"  >
   SELECT * FROM get_all_employees    WHERE  active_record =1 AND FWW =1
  </cfquery>
<!---<cfdump var="#get_all_records_biz#">  ---> 
ADP-FWW
<cfdump var="#get_all_records_adp.recordcount#">
vs BIZ-FWW
<cfdump var="#get_all_records_biz.recordcount#">
<br>
<br>
<br>
</body>
</html>
<!--- Get Daily Sheets Edited----------------------->
<cfquery name="get_ds_edits" datasource="jrgm">
SELECT DISTINCT ds_id,supervisor
FROM app_employee_payroll_clock_backup AS a INNER JOIN APP_employees AS p
 ON a.supervisor = p.[Employee ID]
 </cfquery>
<cfloop query="get_ds_edits">
  <cfquery name="get_ds_edits1" datasource="jrgm">
SELECT branch FROM APP_employees WHERE [Employee ID] =#get_ds_edits.supervisor#
 </cfquery>
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
    <cfoutput>
      <tr>
        <td>#get_ds_edits.ds_id#</td>
        <td>#get_ds_edits1.branch#</td>
      </tr>
    </cfoutput>
  </table>
</cfloop>
<cfabort>
<!--- END Get Daily Sheets Edited----------------------->
<!------- Get Time Only----------------------->
<cfquery name="get_time" datasource="jrgm" maxrows="10">
SELECT     DS_ID, DS_Date, RIGHT(CONVERT(VARCHAR, DS_Date, 100), 7) AS Time, notes
FROM         app_gps
WHERE     (DS_Date > '2/28/2014') AND (DS_ID > 0)
ORDER BY DS_ID, ID 
</cfquery>
<cfdump  var="#get_time#">
<!------- END  Get Time Only----------------------->

<!--- <cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT ds_ID FROM app_gps WHERE   ds_ID  NOT IN (SELECT ID FROM app_daily_sheets) 
</cfquery>
<cfdump var="#get_all_gps_info#">

<cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
DELETE FROM app_gps WHERE   ds_ID  NOT IN (SELECT ID FROM app_daily_sheets) 
</cfquery> 
 --->
<!--- <cfquery name="super_null" datasource="jrgm" >
 SELECT     ID,employee_id, crew_name, employee_position_id,  employee_branch,crew_leader_id, supervisor_id
FROM         app_crews 
WHERE supervisor_id IS NULL  
order by crew_name
</cfquery> --->
<!--- <cfloop query="super_null">
<cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#super_null.employee_branch#'  AND access_role = 9  AND employee_active =1
</cfquery>

<cfquery name="get_BM_ID" datasource="jrgm">
UPDATE app_crews SET supervisor_id = #get_BM_ID.Employee_ID#
 WHERE  ID  =#super_null.ID#
</cfquery>
</cfloop>
 --->
<!--- <cfdump var="#super_null#"> --->

<table>
  <cfloop index = "col" list = "AnyFluid, EngineOil, DashLight, Horn, Tires, BrakesFluid, TurnSignal, Radiator, AlertSystem, CoupletPin, Brakeswitch, 
   ElectricConnector, SafetyChain, JackStand, TireWheel, RampCable, Spring, Brakes, Lights, GreaseDump, CheckOil, CleanFilter, Equ_TireWear, 
  Saf_Crew_Has_Appropriate_PPE, Saf_Fire_Extinguisher_Tagged_and_Current, Saf_First_Aid_Kit, Saf_Flares, Saf_Eyewash, Saf_Emergency_Contact">
    <CFSET column ='#col#'>
    <cfquery name="qrySE2" datasource="jrgm"    >
 SELECT      #col#, COUNT( #col#) AS cid
FROM         app_Inspection_Daily_CheckList
WHERE     ( #col#= 'F')
GROUP BY  #col#
ORDER BY cid DESC
</cfquery>
    <tr>
      <td><cfoutput>#col#-#qrySE2.cid#</cfoutput></td>
    </tr>
  </cfloop>
</table>
<cfabort>
