 <cfsetting requesttimeout="7200">
    
    <cfquery name="get_all_time" datasource="jrgm"  >
SELECT ID, Employee_ID, Time_In, Time_Out, time_worked, ds_id,ds_date FROM app_employee_payroll_clock
WHERE ds_date > '05/31/2014'
</cfquery>


<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  
    <td>Employee</td>
    <td>Date</td>
    <td>EMP ID</td>
    <td>DSID</td>
    <td>Start Time</td>
    <td>Lunch Clock Out</td>
    <td>After Lunch Clock In</td>
    <td>End of Day Clock Out</td>
    <td>Total Time worked for the day</td>
  </tr>
     <cfquery name="get_employees" datasource="jrgm"  maxrows="100"   >
SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,last_name FROM APP_employees
  WHERE [Employee ID] IN 
(SELECT Employee_ID FROM  app_employee_payroll_clock )  AND   [Employee ID] > 3246
 ORDER by employee_id  ASC
</cfquery>
<cfloop query="get_employees">
   <cfquery name="get_dsids"   dbtype="query" >
SELECT  DISTINCT ds_id, ds_date,Employee_ID  FROM get_all_time
WHERE Employee_ID =#get_employees.employee_id#  <!--- AND ds_ID < 15000  --->AND ds_date > '05/31/2014'
  ORDER by ds_date desc  
 </cfquery>
   <cfloop query="get_dsids">  
     <cfquery name="get_number_of_times"   dbtype="query" >
 				 SELECT Employee_ID,COUNT(Employee_ID) AS cid FROM  get_all_time WHERE Employee_ID				=#get_employees.Employee_ID# AND ds_id = #get_dsids.ds_id#
                 GROUP by Employee_ID
 				 </cfquery> 
  <cfif get_number_of_times.cid LT 3>
  <cfquery name="get_employee_time_am" datasource="jrgm" maxrows="1">
SELECT  ID,time_In,  time_Out   FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees.Employee_ID# 
  AND ds_id = #get_dsids.ds_id#
 ORDER by time_In ASC
 </cfquery>
  <cfquery name="get_employee_time_pm" datasource="jrgm" maxrows="1">
SELECT time_In, time_Out FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees.Employee_ID# 
AND ID  <> #get_employee_time_am.ID# AND ds_id = #get_dsids.ds_id#
ORDER by time_In DESC
                </cfquery>
  <cfoutput> <tr>
    <td>#get_employees.employee_name#</td>
    <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
    <td>#get_employees.employee_id#</td>
    <td>#get_dsids.ds_id#</td>
    <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
   <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")# </td>
<td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
    <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#</td>
         <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  app_employee_payroll_clock WHERE Employee_ID =#get_employees.Employee_ID# AND ds_id = #get_dsids.ds_id#
                </cfquery>
    <td>#get_employee_minutes_for_day.minutes_worked_day#</td>
  </tr></cfoutput>
  </cfif></cfloop>
  </cfloop>
</table>







