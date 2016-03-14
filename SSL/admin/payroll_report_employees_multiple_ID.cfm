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
<cfoutput>#todayDate#</cfoutput>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table  border="0" cellpadding="0" cellspacing="0" class="sortable" >
        <tr>
          <td align="left" class="dstable_header">ID</td>
          <td class="dstable_header">Name</td>
          <td align="left" class="dstable_header">Branch</td>
          <td align="left" class="dstable_header">Position</td>
          <td align="left" class="dstable_header">Active</td>
        </tr>
        <cfquery name="getemp_multiple" datasource="jrgm">
			SELECT  [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,branch,active_record  FROM APP_employees
			WHERE [Employee ID]  > 9999 AND  [Employee ID] < 99999    
  			 ORDER by [Employee ID] ASC
			</cfquery>
        <cfoutput query="getemp_multiple">
          <tr>
            <td  class="dstable" align="left"><strong>#Employee_ID#</strong></td>
            <td class="dstable">#employee_name#  </td>
            <td align="left"  class="dstable">#getemp_multiple.branch#</td>
            <td align="left"  class="dstable">#position#</td>
            <td align="left"  class="dstable"><cfif active_record EQ 1>
                Active
              </cfif>
              <cfif active_record EQ 0>
                Inactive
              </cfif></td>
          </tr>
          <cfquery name="getemp_multiple2" datasource="jrgm">
			SELECT  [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,branch,active_record  FROM APP_employees
			WHERE [Employee ID]  < 9999 AND [Name FirstLast]  ='#getemp_multiple.employee_name#'  AND  [Employee ID] <>#getemp_multiple.employee_id#
 			</cfquery>
          <!---        <cfoutput query="getemp_multiple2"> --->
          <tr>
            <td  class="dstable" align="left"><strong>#getemp_multiple2.Employee_ID#</strong></td>
            <td class="dstable">#getemp_multiple2.employee_name#</td>
            <td align="left"  class="dstable">#getemp_multiple2.branch#</td>
            <td align="left"  class="dstable">#getemp_multiple2.position#</td>
            <td align="left"  class="dstable"><cfif active_record EQ 1>
                Active
              </cfif>
              <cfif active_record EQ 0>
                Inactive
              </cfif></td>
          </tr>
        </cfoutput>
      </table>
    </div>
  </div>
</div>
<br />
<br />
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
