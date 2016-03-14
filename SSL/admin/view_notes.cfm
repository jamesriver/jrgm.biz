<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfif IsDefined("url.Job_ID")>
  <cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM APP_jobs WHERE [Job ID]=  '#url.Job_ID#'   
</cfquery>
</cfif>
<cfif IsDefined("url.employee_ID")>
  <cfquery name="get_this_employee" datasource="jrgm" maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone FROM APP_employees WHERE  [Employee ID]=  #url.Employee_ID#  
</cfquery>
</cfif>
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
<style>
textarea {
	width: 400px;
	padding: 10px;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Notes for
            <cfif IsDefined("url.employee_ID")>
              <cfoutput query="get_this_employee">#employeename#</cfoutput>
            </cfif>
            <cfif IsDefined("url.job_ID")>
              <cfoutput query="get_job_info">#locationname#</cfoutput>
          </cfif></td>
        </tr>
      </table>
      <cfquery name="get_job_notes" datasource="jrgm">
SELECT * FROM APP_notes WHERE <cfif IsDefined("url.employee_ID")> Employee_ID = #Employee_ID#</cfif><cfif IsDefined("url.job_ID")> job_ID = '#job_ID#'</cfif>
ORDER by Note_Date DESC
</cfquery>
      <ul class="crew">
        <cfif get_job_notes.recordcount EQ 0>
          <li>There are no notes for this
            <cfif IsDefined("url.employee_ID")>
              employee
            </cfif>
            <cfif IsDefined("url.Job_ID")>
              job
            </cfif>
            .</li>
          <cfelse>
          <cfoutput query="get_job_notes">
            <li>#dateformat(Note_Date,"mm/dd/yyyy")# - #note_content#</li>
          </cfoutput>
        </cfif>
      </ul>
      <cfif IsDefined("url.employee_ID")>
        <cfoutput> <a href="notes.cfm?employee_id=#employee_id#" class="bluebutton">Add Notes</a></cfoutput>
      </cfif>
      <cfif IsDefined("url.job_ID")>
        <cfoutput> <a href="notes.cfm?job_ID=#job_ID#" class="bluebutton">Add Notes</a></cfoutput>
      </cfif>
    </div>
  </div>
  <!-- to clear footer -->
</div>
 
<!-- end outer div -->
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
