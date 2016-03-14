<cfloop  list = "#url.mylunchlist#"   index = "i" >
  <!--- Make sure employees are not already logged in --->
  <cfquery name="make_sure_not_already_in" datasource="jrgm">
     SELECT Employee_ID FROM Employee_Payroll_Clock 
     WHERE Employee_ID =#i#  AND In_Out_Status =1
       </cfquery>
  <cfif make_sure_not_already_in.recordcount EQ 0>
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO Employee_Payroll_Clock (Employee_ID,Time_In,In_Out_Status,crew_leader,supervisor,ds_id) 
   VALUES ('#i#',CURRENT_TIMESTAMP,1,#Session.userid#,#SESSION.supervisor_id#,#SESSION.DS_ID#)
   </cfquery>
  </cfif>
</cfloop>


<!--- <cfoutput> #Lunch_time_out#  -#Lunch_time_out#</cfoutput><cfabort> --->
<!--- <CFSET lunchinminutes = Now() - #SESSION.lunchtimeout#> --->
  
 <cfquery name="update_time" datasource="jrgm">
  UPDATE job_clock SET Lunch_time_in =CURRENT_TIMESTAMP 
  WHERE ID =#active_job_ID_to_Update#
  </cfquery>
  
<cfquery name="update_time" datasource="jrgm">
  UPDATE job_clock SET Lunch_Time=   DATEDIFF(mi,Lunch_time_out,Lunch_time_in)  WHERE ID =#active_job_ID_to_Update#
  </cfquery>
 
<!---  --->
<cflocation url="default.cfm">


<!--- <cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader_ID, crew_name AS employee_name,Employee_Position_ID  
FROM crews WHERE (Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) AND export_id =1 
</cfquery>
<!--- <cfdump var="#get_employees#"> --->
<CFSET mylist ="#SESSION.userid#">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
 --->
<cfquery name="get_max_ds" datasource="jrgm">
     SELECT MAX(ID) AS ds_id FROM DAILY_SHEETS 
     WHERE crew_leader_id =#Session.userid#   
       </cfquery>
<CFSET SESSION.DS_ID=get_max_ds.ds_id>
<!--- Time out employees --->
<!---  <cfquery name="get_max" datasource="jrgm">
 Select ID from Employee_Payroll_Clock where id=IDENT_CURRENT('Employee_Payroll_Clock') AND  crew_leader = #SESSION.userid#
 </cfquery> --->
<CFSET dte = #DateFormat(now(),"mm/dd/yyyy")#>
<CFSET tim = #TimeFormat(Now())#>
<CFSET newtime = #parsedatetime(dte&tim)#>
<cfquery name="jrgm_time" datasource="jrgm">  
    UPDATE Employee_Payroll_Clock 
    SET time_out =#newtime#
   WHERE DS_ID = #SESSION.DS_ID#  AND  In_Out_Status=1
    </cfquery>
<!---    <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,time_in,time_out) AS 'Duration'  FROM  employee_payroll_clock   
    WHERE DS_ID = #SESSION.DS_ID#  AND  In_Out_Status=1
    </cfquery> --->
<cfquery name="update_time" datasource="jrgm">
    UPDATE Employee_Payroll_Clock SET time_worked =   DATEDIFF(mi,time_in,time_out),In_Out_Status=2    
    WHERE DS_ID = #SESSION.DS_ID#  AND  In_Out_Status=1
    </cfquery>
<cfquery name="jrgm_time" datasource="jrgm">  
    SELECT employee_id FROM Employee_Payroll_Clock 
    WHERE DS_ID = #SESSION.DS_ID#  AND  time_out
    </cfquery>
<cfset Now_Time = Now()>
<CFSET allchecked ='No'>
<cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader_ID, crew_name AS employee_name,Employee_Position_ID  FROM crews WHERE (Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) AND export_id =1 
</cfquery>
<!--- <cfdump var="#get_employees#"> --->
<CFSET mylist ="#SESSION.userid#">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<!--------------- See if employees are ALL in or are ALL out --->
<cfquery name="get_employee_all_in" datasource="jrgm" maxrows="#get_employees.recordcount#">
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_employee_all_in#"> --->
<cfquery name="get_employee_all_out" datasource="jrgm"  maxrows="#get_employees.recordcount#">
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =2
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_employee_all_out#"> --->
<cfif get_employee_all_out.recordcount EQ get_employee_all_in.recordcount>
  <CFSET allchecked ='Yes'>
  <cfelse>
  <CFSET allchecked ='No'>
</cfif>
<cfif  get_employee_all_in.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>
<cfif  get_employee_all_out.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>
<!--- <cfoutput>#allchecked#</cfoutput>  --->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<!--- <cfset todayDate_dow = DayOfWeek(todayDate)> --->
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  AND export_id =1 
ORDER by start_date,event_name
</cfquery>
