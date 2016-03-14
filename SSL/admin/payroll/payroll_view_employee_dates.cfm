
<!--- <cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#url.branch#'  AND access_role = 9  AND employee_active =1
</cfquery>

<cfquery name="get_BM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] =#get_BM_ID.Employee_ID#
</cfquery> --->

<cfquery name="get_supers" datasource="jrgm">
SELECT Employee_ID, username, password, employee_name FROM 
APP_employee_passwords WHERE  employee_branch ='#url.branch#' AND access_role =1
</cfquery>


<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!--- <cfoutput>#myList#</cfoutput> --->



<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
<cfset Now_Time = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
      <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td class="header">Employee Detail For <cfoutput>#url.branch#</cfoutput> Branch</td>
        </tr>
      </table>
      
 <cfquery name="get_employees_with_time" datasource="jrgm">
SELECT DISTINCT Employee_ID, APP_employees.last_name FROM 
app_employee_payroll_clock  
INNER JOIN APP_employees
ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
WHERE SUPERVISOR  IN (#mylist#)
ORDER by APP_employees.last_name
 </cfquery>    

  
 <table class="sortable" border="0" cellspacing="0" cellpadding="2"  >
 <thead> 
  <tr>
    <th>Branch</th>
    <th>Employee Name&nbsp; &nbsp;&nbsp;</th>
    <th>Employee ID</th>
    <th>Hire Date</th>
    <th>Rehire Date</th>
     
        </tr>
        </thead>
         <tbody>
  
  <cfoutput query="get_employees_with_time">
 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name ,employee_hire_date,employee_rehire_date   FROM 
app_employees WHERE [Employee ID] = #get_employees_with_time.Employee_ID#
 </cfquery>
  <tr>
    <td>#url.branch#</td>
    <td> <a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#&branch=#url.branch#" >#get_employees_name.first_name# #get_employees_name.last_name# </a></td>
    <td>#get_employees_with_time.Employee_ID#</td>
    <td>#DateFormat(get_employees_name.employee_hire_date, "mm/dd/yyyy")#</td>
   <td>#DateFormat(get_employees_name.employee_rehire_date, "mm/dd/yyyy")#</td>
    </tr>
  &nbsp;
</cfoutput>
</table>

  </div>
  <!-- to clear footer -->
</div>
<!-- to clear footer -->&nbsp;
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
