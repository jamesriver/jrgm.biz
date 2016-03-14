
<!--- <cfquery name="get_BM_ID" datasource="jrgm">
SELECT employee_id AS Employee_ID  FROM 
app_employee_passwords WHERE employee_branch ='#url.branch#'  AND access_role = 9  AND employee_active =1
</cfquery>

<cfquery name="get_BM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] =#get_BM_ID.Employee_ID# AND position ='Branch Manager'
</cfquery> --->

<!--- <cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees_passwords WHERE  employee_branch LIKE '%#get_BM_Name.Employee_Name#%'
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
 
 
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
   
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Employees with Payroll For <cfoutput>#url.branch#</cfoutput> Branch</td>
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
 <ul>
 <cfoutput query="get_employees_with_time">
 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name    FROM 
app_employees WHERE [Employee ID] = #get_employees_with_time.Employee_ID#
 </cfquery>
       <li class="dstable_cl"><a href="payroll_view_employee_detail_all.cfm?empid=#get_employees_with_time.Employee_ID#&amp;branch=#url.branch#" >#get_employees_name.first_name# #get_employees_name.last_name# </a></li>
       </cfoutput>
       </ul>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
