 <cfset y = year(now())>
      <cfset m = month(now())>
      <cfset d = day(now())>
      <cfset today_11PM = createDatetime(y,m,d,23,0,0)>
      <cfset yesterday_11PM = dateAdd("d",-2,today_11PM)>
      <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_11PM)>
      <cfset tomorrow_5PM = dateAdd("d",1,today_11PM)>
      <CFSET outtime = today_11PM>
      <CFSET todays_date = #DateFormat(Now())#>
      <cfset yesterday = CreateDate(Year(Now()),Month(Now()),Day(Now()-1))>
      <cfset today = Now()>
      
 <!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
 <body>
 <!---  <cfquery name="get_ds_edits" datasource="jrgm">
SELECT DISTINCT ds_id,supervisor
FROM app_employee_payroll_clock_backup AS a INNER JOIN APP_employees AS p
 ON a.supervisor = p.[Employee ID]
 </cfquery>   --->
  <cfquery name="get_ds_gps" datasource="jrgm">
 SELECT DISTINCT DS_ID, crew_leader_id FROM    app_gps
 WHERE ds_date > #yesterday_11PM#  AND ds_id  > 0
  </cfquery>
 <cfloop query="get_ds_gps">
 <cfquery name="get_branch" datasource="jrgm">
SELECT branch,first_name,last_name FROM APP_employees WHERE [Employee ID] =#get_ds_gps.crew_leader_id#
 </cfquery>  
 
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
 <cfoutput> 
   <tr>
    <td>#get_ds_gps.DS_ID#</td>
     <td>#get_branch.branch#</td>
       <td>#get_branch.first_name#  #get_branch.last_name#</td>
    <cfquery name="get_ds_gps_time" datasource="jrgm">
 SELECT notes,RIGHT(CONVERT(VARCHAR, DS_Date, 100), 7) AS Time FROM app_gps
 WHERE DS_ID = #get_ds_gps.DS_ID# AND notes ='periodic'
  </cfquery>
   <cfloop query="get_ds_gps_time"> <td> #get_ds_gps_time.Time#  </td></cfloop>
  </tr>
  </cfoutput>
</table>
 </cfloop>
<cfabort>
</body>
</html>