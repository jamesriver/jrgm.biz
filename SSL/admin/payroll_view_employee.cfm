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
          <td class="header">Employees with Payroll  - All Dates starting 1/1/2015</td>
        </tr>
      </table>
      <!---  <cfquery name="get_all_employees" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT  first_name ,  last_name, [Employee ID]  AS  Employee_ID FROM APP_employees  
</cfquery>--->
      <cfquery name="get_employees_with_time1" datasource="jrgm">
SELECT DISTINCT Employee_ID FROM
app_employee_payroll_clock  WHERE  ds_date > '12/31/2014'
  </cfquery>
      <CFSET mylist ="0">
      <cfloop query="get_employees_with_time1">
        <cfset myList = ListAppend(mylist,Employee_ID)>
      </cfloop>
      <cfquery name="get_employees_with_time" datasource="jrgm">
SELECT first_name, last_name,  [Employee ID] AS Employee_ID FROM 
APP_employees  WHERE  [Employee ID] IN (#mylist#)
ORDER by  last_name
 </cfquery>
      
      <!--- <cfquery name="get_employees_with_time" datasource="jrgm">
SELECT DISTINCT Employee_ID FROM 
app_employee_payroll_clock  
 ORDER by  Employee_ID ASC
</cfquery> --->
      
      <ul>
        <cfoutput query="get_employees_with_time"> 
          <!---    <cfquery name="get_employees_name"   dbtype="query">
SELECT  first_name ,  last_name    FROM get_all_employees WHERE Employee_ID = #get_employees_with_time.Employee_ID#
 </cfquery>--->
          <li class="dstable_cl"><a href="payroll_view_employee_detail.cfm?empid=#get_employees_with_time.Employee_ID#" >#get_employees_with_time.last_name#, #get_employees_with_time.first_name# </a></li>
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
