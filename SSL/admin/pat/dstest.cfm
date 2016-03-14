<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>
<CFSET lastds = 0>
This Query check the  employee_payroll_clock table greater than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
  <cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM  app_employee_payroll_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Time_In > '#tomorrowDate_query#'

 </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the  employee_payroll_clock table less than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset yesterdayDate_query_alt = #DateAdd( 'd', 0, todayDate_query)#>
  <cfset yesterdayDate_query = #DateFormat("#yesterdayDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM  app_employee_payroll_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Time_In < '#yesterdayDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the  job clock table greater than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
  <cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Job_Time_In > '#tomorrowDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the  job clock table less than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset yesterdayDate_query_alt = #DateAdd( 'd', 0, todayDate_query)#>
  <cfset yesterdayDate_query = #DateFormat("#yesterdayDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Job_Time_In < '#yesterdayDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the job services actual employee table table greater than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
  <cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_services_actual_employee WHERE ds_id =   #get_daily_sheets.ID# 
 AND Service_Time_In > '#tomorrowDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the  job services actual employee table less than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset yesterdayDate_query_alt = #DateAdd( 'd', 0, todayDate_query)#>
  <cfset yesterdayDate_query = #DateFormat("#yesterdayDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_services_actual_employee WHERE ds_id =   #get_daily_sheets.ID# 
 AND Service_Time_In < '#yesterdayDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the job_services_clock table table greater than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, todayDate_query)#>
  <cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_services_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Service_Time_In > '#tomorrowDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
This Query check the  job_services_clock table less than today<br>
<cfquery name="get_daily_sheets" datasource="jrgm"  > 
SELECT  * FROM app_daily_sheets WHERE ID > #lastds#   ORDER  by  ID
 </cfquery>
<cfloop query="get_daily_sheets">
  <cfset todayDate_query =   #DateFormat("#get_daily_sheets.ds_date#", "mm/dd/yyyy")#>
  <cfset yesterdayDate_query_alt = #DateAdd( 'd', 0, todayDate_query)#>
  <cfset yesterdayDate_query = #DateFormat("#yesterdayDate_query_alt#", "mm/dd/yyyy")#>
  <cfquery name="get_daily_sheets_x" datasource="jrgm"  > 
SELECT  * FROM APP_job_services_clock WHERE ds_id =   #get_daily_sheets.ID# 
 AND Service_Time_In < '#yesterdayDate_query#'
  </cfquery>
  <cfif get_daily_sheets_x.recordcount GT 0>
    <cfdump  var="#get_daily_sheets_x#">
  </cfif>
</cfloop>
</body>
</html>
