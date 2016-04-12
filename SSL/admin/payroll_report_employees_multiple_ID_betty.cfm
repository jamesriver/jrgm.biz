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
<!--- <cfoutput>#todayDate#</cfoutput> --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<LINK rel="stylesheet" type"text/css" href="payroll/css/print.css" media="print">

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
</style>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <div class="centrecontent_inner">
      <div class="header">Employees Working in 2 Branches (Non-Managers)</div>
      <table  border="0" cellpadding="0" cellspacing="0" class="sortable" >
        <thead>
          <tr>
            <th align="left">ID</th>
            <th>Name</th>
            <th align="left">Branch</th>
            <th align="left">Position</th>
          </tr>
        </thead>
        <tbody>
          <cfquery name="getemp_multiple" datasource="jrgm">
			SELECT  [Employee ID] AS employee_id,[Name FirstLast] AS employee_name, last_name,position,branch  FROM APP_employees
			WHERE [Employee ID]  > 9999 AND  [Employee ID] < 999999   AND LEN([Employee ID]) IN (5,6) AND  [Employee ID]  
            NOT IN (SELECT employee_id FROM app_employee_passwords  WHERE access_role <>2   )  AND  active_record =1
  			 ORDER by last_name ASC
			</cfquery>
          <cfoutput query="getemp_multiple">
            <tr>
              <td align="left"><strong>#Employee_ID#</strong></td>
              <td>#employee_name#</td>
              <td align="left" >#getemp_multiple.branch#</td>
              <td align="left">#position#</td>
            </tr>
            <cfquery name="getemp_multiple2" datasource="jrgm">
			SELECT  [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,branch  FROM APP_employees
			WHERE [Employee ID]  < 9999 AND [Name FirstLast]  ='#getemp_multiple.employee_name#'
 			</cfquery>
            <!---        <cfoutput query="getemp_multiple2"> --->
            <tr>
              <td align="left"><strong>#getemp_multiple2.Employee_ID#</strong></td>
              <td>#getemp_multiple2.employee_name#</td>
              <td align="left">#getemp_multiple2.branch#</td>
              <td align="left">#position#</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div id="clearfooter"></div>
<!-- to clear footer --> 
<!--</div>--> 
<!-- end outer div --> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
