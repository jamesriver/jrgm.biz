<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>

<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >    

<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>


<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>

 

<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
 
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 
 <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <cfif IsDefined("url.pay_period_week1")>
   <CFSET  pay_period_week1 =#pay_period_week1#>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Unapproved Payroll For <cfoutput>#regionname#</cfoutput> Region -Week 1</td>
        </tr>
      </table>
       
  <!---   Check Pay Period 1 --->
<cfquery name="app_payroll_periods1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>  
 <CFSET pay_period_end_week1 =  dateadd("d",7,app_payroll_periods1.pay_period_start)>
   
 <cfquery name="get_employees_with_time_Week1" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)
      AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1#)
		ORDER by APP_employees.last_name
  </cfquery>
  <CFSET mylist ="0">
<cfloop query="get_employees_with_time_Week1">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<cfif SESSION.branch EQ 'Test'>
<CFSET mylist ="0">
</cfif>
   <cfquery name="get_employees_with_time_unapproved_Week1" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
	WHERE    
         ( app_employee_payroll_clock.Time_In > #app_payroll_periods1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1#)
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL    
		ORDER by APP_employees.last_name
 </cfquery>
<!---  <cfdump var="#get_employees_with_time_unapproved#">  --->
 <table class="sortable" cellpadding="0" cellspacing="0" width="70%" >
      <thead>
 				<tr>
				<th  align="left">Branch</td></th>
               <th  align="left">Employee ID</td></th>
 				 <th  align="left">First Name</td></th>
 				 <th  align="left">Last Name</td> </th>  
 				 <th  align="left">DS Date</td> </th>
 				 <th  align="left">DSID</td> </th>
 				</tr>		
 </thead>
      <tbody>
				<cfoutput query="get_employees_with_time_unapproved_Week1">
                <tr>
				<td>#BRANCH#</td>
                <td>#EMPLOYEE_ID#</td>
                <td>#FIRST_NAME#</td>
 				<td>#LAST_NAME#</td>
                    <td>#dateformat(ds_date,"mm/dd/yy")#</td>
 				  <td><a href="daily_sheet.cfm?dsid=#DS_ID#">#DS_ID#</a></td>
 				</tr></cfoutput>
                </tbody>
    </table><br />
<br />
<br />
</cfif>
 <cfif IsDefined("url.pay_period_week2")>
<table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Unapproved Payroll For <cfoutput>#regionname#</cfoutput> Region -Week 2</td>
        </tr>
      </table>
      
  <!---   Check Pay Period 2 --->
<cfquery name="app_payroll_periods2" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>  
 <CFSET pay_period_end_week2 =  dateadd("d",7,app_payroll_periods2.pay_period_start)>
   
 <cfquery name="get_employees_with_time_Week2" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)
      AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods2.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
		ORDER by APP_employees.last_name
  </cfquery>
  <CFSET mylist ="0">
<cfloop query="get_employees_with_time_Week2">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<cfif SESSION.branch EQ 'Test'>
<CFSET mylist ="0">
</cfif>
   <cfquery name="get_employees_with_time_unapproved_Week2" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
	WHERE    
         ( app_employee_payroll_clock.Time_In > #app_payroll_periods2.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week2#)
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL    
		ORDER by APP_employees.last_name
 </cfquery>
<!---  <cfdump var="#get_employees_with_time_unapproved#">  --->
 <table class="sortable" cellpadding="0" cellspacing="0" width="70%" >
      <thead>
 				<tr>
				<th  align="left">Branch</td></th>
               <th  align="left">Employee ID</td></th>
 				 <th  align="left">First Name</td></th>
 				 <th  align="left">Last Name</td> </th>  
 				 <th  align="left">DS Date</td> </th>
 				 <th  align="left">DSID</td> </th>
 				</tr>		
 </thead>
      <tbody>
				<cfoutput query="get_employees_with_time_unapproved_Week2">
                <tr>
				<td>#BRANCH#</td>
                <td>#EMPLOYEE_ID#</td>
                <td>#FIRST_NAME#</td>
 				<td>#LAST_NAME#</td>
 				  <td>#dateformat(ds_date,"mm/dd/yy")#</td>
 				  <td><a href="daily_sheet.cfm?dsid=#DS_ID#">#DS_ID#</a></td>
 				</tr></cfoutput>
                </tbody>
    </table><br />
<br />
<br />
</cfif>
<br />

                </div>   </div>   </div>
  <script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
