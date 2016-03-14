<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
 
<cfif IsDefined("url.Job_ID")>
 
<cfquery name="get_job_info" datasource="jrgm">
SELECT [Wk Location Name] As job_location FROM jobs WHERE [Job ID] =  '#url.Job_ID#' AND active_record= 1
</cfquery>
</cfif>
<cfif IsDefined("url.employee_ID")>
  <cfquery name="get_this_employee" datasource="jrgm">
SELECT  [Employee ID], [Name FirstLast] AS employeename FROM employees WHERE  [Employee ID]=  #url.Employee_ID#  
</cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
textarea {
	width: 450px;
	padding:10px;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Notes
            <cfif IsDefined("url.Job_ID")>
              for <cfoutput query="get_job_info"> #job_location# </cfoutput>
            </cfif>
            <cfif IsDefined("url.employee_id")>
              for <cfoutput query="get_this_employee"> #employeename# </cfoutput>
            </cfif>
          </td>
        </tr>
      </table>
      <form action="notes_logic.cfm" method="post">
        <table width="100%" border="0" cellpadding="0">
          <tr>
            <td><textarea  name="note_content" cols="30" rows="5"></textarea>
            </td>
          </tr>
          <tr>
            <td><input type="submit" name="post_notes" id="button" value="Submit Notes" class="jobstart" /></td>
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
        <span class="timeout">Your note was submitted.</span>
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
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
