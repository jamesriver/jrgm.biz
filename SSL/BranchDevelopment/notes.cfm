<CFSET allchecked ='Yes'>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfif IsDefined("url.Job_ID")>
  <cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT [Wk Location Name] As job_location FROM APP_jobs WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
</cfif>
<cfif IsDefined("url.employee_ID")>
  <cfquery name="get_this_employee" datasource="jrgm" maxrows="1">
SELECT  [Employee ID], [Name FirstLast] AS employeename FROM APP_employees WHERE  [Employee ID]=  #url.Employee_ID#  
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
	width: 600px;
	padding:10px;
}
</style>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="header">Notes
          <cfif IsDefined("url.Job_ID")>
            for <cfoutput query="get_job_info"> #job_location# </cfoutput>
          </cfif>
          <cfif IsDefined("url.employee_id")>
            for <cfoutput query="get_this_employee"> #employeename# </cfoutput>
          </cfif></td>
      </tr>
    </table>
    <form action="notes_logic.cfm" method="post">
      <table width="100%" border="0" cellpadding="0">
        <tr>
          <td><textarea  name="note_content" cols="30" rows="5"></textarea>
          </td>
        </tr>
        <tr>
          <td><input type="submit" name="post_notes" id="button" value="Submit Notes" class="bluebutton" /></td>
        </tr>
      </table>
      <cfoutput>
        <cfif IsDefined("url.work_date")>
          <input type="hidden" name="work_date" value="#url.work_date#" />
          <cfelse>
          <input type="hidden" name="work_date" value="#todayDate#" />
        </cfif>
        <cfif IsDefined("url.job_id")>
          <input type="hidden" name="job_id" value="#url.job_id#" />
        </cfif>
        <cfif IsDefined("url.employee_id")>
          <input type="hidden" name="employee_id" value="#url.employee_id#" />
        </cfif>
      </cfoutput>
      </table>
    </form>
    <br />
    <br />
    <cfif IsDefined("url.note_submit")>
      <span class="notesb"><span class="crew">Your note was submitted.</span></span>
    </cfif>
  </div>
</div>
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
