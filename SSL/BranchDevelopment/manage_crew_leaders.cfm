<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   

     <table width="100%" border="0" cellpadding="0">
      <tr>
        <td><div class="header">Manage Crew Leaders</div>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3" valign="top" class="alertsh">Generally changing positions should not be done during the work day when crews have been timed into the APP. <br />
            Please try and make changes before or after the work day.</td>
          </tr>
        <tr>
          <td valign="top">&nbsp;</td>
          <td></td>
          <td valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td valign="top">
        
          <header class="details_title">Current Crew Leaders</header>
          <div class="content">
          
  <table class="sortable" border="0" cellspacing="0" cellpadding="3">

<tr>
    <th align="left" nowrap="nowrap">First Name</th>
    <th align="left" nowrap="nowrap">Last Name</th>
    <th align="left" nowrap="nowrap">Position</th>
  
    <th align="left" nowrap="nowrap">Change</th>
  </tr>

  
  <cfquery name="get_branch_employees_CL" datasource="jrgm"  >
SELECT * FROM app_employee_passwords
WHERE employee_branch = '#SESSION.branch#'  AND employee_active = 1  
AND access_role = 2
 ORDER by  Lastname ASC,firstname ASC
</cfquery>
 

  <cfoutput query="get_branch_employees_CL"> <tr>
    <td nowrap="nowrap">#firstname#</td>
    <td nowrap="nowrap">#lastname#</td>
    <td nowrap="nowrap">Crew Leader</td>
    <td nowrap="nowrap"><a href="employee_details_change_position.cfm?employee_id=#get_branch_employees_CL.Employee_ID#&work_date=#todayDate#&clalready=yes">Change</a></td>
  </tr>

  </cfoutput>
</table> 

          </div>
      </td><td width="50"></td>
      
      <td valign="top">
           <header class="details_title">Current Non-Crew Leaders</header>
          <div class="content">
          
  <table class="sortable" border="0" cellspacing="0" cellpadding="0">

<tr>
    <th align="left" nowrap="nowrap">First Name</th>
    <th align="left" nowrap="nowrap">Last Name</th>
   <th align="left" nowrap="nowrap">Position</th>
     <th align="left" nowrap="nowrap">Change</th>  
  </tr>
 <cfquery name="get_branch_employees_nonCL" datasource="jrgm"  >
SELECT * FROM app_employee_passwords
WHERE employee_branch = '#SESSION.branch#'  AND employee_active = 1  
 ORDER by  Lastname ASC,firstname ASC
</cfquery>
 <cfset mylist ="">
<cfloop query="get_branch_employees_nonCL">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
  
   <cfquery name="get_branch_employees_noncl" datasource="jrgm"  >
select first_name, last_name,position, [employee id] as employee_id from app_employees
where branch = '#session.branch#'  and active_record = 1  and [employee id] not in (#mylist#)   
  order by  last_name asc,first_name asc
</cfquery>
 

  <cfoutput query="get_branch_employees_noncl"> <tr>
    <td nowrap="nowrap">#first_name#</td>
    <td nowrap="nowrap">#last_name#</td>
    <td nowrap="nowrap">#position#</td>
    <td nowrap="nowrap"><a href="employee_details_change_position.cfm?employee_id=#get_branch_employees_noncl.employee_id#&work_date=#todaydate#&clalready=no">Change</a></td>
  </tr>

  </cfoutput>
</table> 

          </div>
      </td></tr></table>
        
        <br />
           
    
         </td>
      </tr>
    </table>
  </div>  </div>
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
 <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
