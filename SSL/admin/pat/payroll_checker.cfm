<cfset todayDate = Now()>
<CFSET todayDate = #DateFormat(todayDate, "mm/dd/yyyy")#>
<cfset yesterday = dateadd("d",-1,todayDate)>
<!--- <cfoutput>#todayDate#-#yesterday#</cfoutput> --->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>

<!--- <cfquery name="get_many_hours" datasource="jrgm">
SELECT     Employee_ID, ds_date, SUM(time_worked) AS sumtimeworked
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')    
GROUP BY Employee_ID, ds_date
HAVING   SUM(time_worked)> 720
ORDER BY sumtimeworked DESC
</cfquery>
 <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>Employee ID</td>  
      <td>Date</td>
     <td>Name</td>
    <td>Branch</td>
    <td>Daily Hours</td>
   </tr>
<cfoutput query="get_many_hours">
  <tr>
    <td>#Employee_ID#</td>
        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
     <cfquery name="get_many_hours_name" datasource="jrgm">
SELECT     [Employee ID], branch,[Name FirstLast] AS empname
FROM         app_employees
WHERE   [Employee ID] = #Employee_ID#
 </cfquery>
     <td>#get_many_hours_name.empname#</td>
       <td>#get_many_hours_name.branch#</td>
    <td>#sumtimeworked#</td>
    
    <cfquery name="get_many_hours_DSD" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>
  <cfloop query="get_many_hours_DSD">  <td><a href="../daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#">#get_many_hours_DSD.ds_id#</a></td></cfloop>
    </tr>
    
   
</table> 
  --->
 
 
multiple daily sheet check regardless of time worked

<cfquery name="get_many_hours" datasource="jrgm">
 SELECT employee_ID,ds_date,COUNT(DISTINCT ds_id) AS Count ,SUM(time_worked) AS sumtimeworked
 FROM  app_employee_payroll_clock
 WHERE     (ds_date > '#APPLICATION.blockdate#')    
 GROUP BY Employee_ID, ds_date
 HAVING   COUNT(DISTINCT ds_id) > 1
 </cfquery>

  <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>Employee ID</td>  
          <td>Date</td>
     <td>Name</td>
    <td>Branch</td>
    <td>Daily Hours</td>
   </tr>
<cfoutput query="get_many_hours">
  <tr>
    <td>#Employee_ID#</td>
        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
     <cfquery name="get_many_hours_name" datasource="jrgm">
SELECT     [Employee ID], branch,[Name FirstLast] AS empname
FROM         app_employees
WHERE   [Employee ID] = #Employee_ID#
 </cfquery>
     <td>#get_many_hours_name.empname#</td>
       <td>#get_many_hours_name.branch#</td>
    <td>#sumtimeworked#</td>
    
    <cfquery name="get_many_hours_DSD" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>
  <cfloop query="get_many_hours_DSD">  <td><a href="../daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#">#get_many_hours_DSD.ds_id#</a></td></cfloop>
    </tr>
  </cfoutput>
</table> 
<!--- #get_many_hours_name.branch# -   #get_many_hours_name.empname#-#Employee_ID#  is on 2 daily sheets on  #DateFormat(ds_date, "mm/dd/yyyy")#<br> --->
 
<br>

Gets Employees with more than 2 Time Ins per day
<cfquery name="get_many_dsids" datasource="jrgm">
SELECT     Employee_ID, ds_date, COUNT(ds_ID) AS totalids
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')  
GROUP BY Employee_ID, ds_id,ds_date
HAVING   COUNT(ds_ID) > 2
ORDER BY totalids DESC
</cfquery>

 <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>Employee ID</td>  
        <td>Date</td>
     <td>Name</td>
    <td>Branch</td>
    <td>Daily Time Ins</td>
   </tr>
<cfoutput query="get_many_dsids">
  <tr>
    <td>#Employee_ID#</td>
        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
     <cfquery name="get_many_hours_name" datasource="jrgm">
SELECT     [Employee ID], branch,[Name FirstLast] AS empname
FROM         app_employees
WHERE   [Employee ID] = #Employee_ID#
 </cfquery>
     <td>#get_many_hours_name.empname#</td>
       <td>#get_many_hours_name.branch#</td>
    <td>#totalids#</td>
    
    <cfquery name="get_many_hours_DSD" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>
  <cfloop query="get_many_hours_DSD">  <td><a href="../daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#">#get_many_hours_DSD.ds_id#</a></td></cfloop>
    </tr>
   </cfoutput>
</table><br>
<br>
<br>

Employees with more than 12 Hours per day
<cfquery name="get_many_hours" datasource="jrgm">
SELECT     Employee_ID, ds_date, SUM(time_worked) AS sumtimeworked
FROM         app_employee_payroll_clock
WHERE     (ds_date > '#APPLICATION.blockdate#')  
GROUP BY Employee_ID, ds_date
HAVING   SUM(time_worked)> 720
ORDER BY sumtimeworked DESC
</cfquery>

 <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>Employee ID</td>  
          <td>Date</td>
     <td>Name</td>
    <td>Branch</td>
    <td>Daily Hours</td>
   </tr>
<cfoutput query="get_many_hours">
  <tr>
    <td>#Employee_ID#</td>
        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
     <cfquery name="get_many_hours_name" datasource="jrgm">
SELECT     [Employee ID], branch,[Name FirstLast] AS empname
FROM         app_employees
WHERE   [Employee ID] = #Employee_ID#
 </cfquery>
     <td>#get_many_hours_name.empname#</td>
       <td>#get_many_hours_name.branch#</td>
    <td>#sumtimeworked#</td>
     <cfquery name="get_many_hours_DSD" datasource="jrgm" >
SELECT     ds_id
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
</cfquery>
  <cfloop query="get_many_hours_DSD" >  <td><a href="../daily_sheet.cfm?dsid=#get_many_hours_DSD.ds_id#">#get_many_hours_DSD.ds_id#</a></td></cfloop>

   </tr>
   </cfoutput>
</table><br>
<br>
<br>
</body>
</html>
