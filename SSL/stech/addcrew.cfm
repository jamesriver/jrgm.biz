<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfif todayDate_dow EQ 2>
  <CFSET todayDate_dow_v = "Mon">
  <cfelseif   todayDate_dow EQ 3>
  <CFSET todayDate_dow_v = "Tues">
  <cfelseif   todayDate_dow EQ 4>
  <CFSET todayDate_dow_v = "Wed">
  <cfelseif   todayDate_dow EQ 5>
  <CFSET todayDate_dow_v = "Thur">
  <cfelseif   todayDate_dow EQ 6>
  <CFSET todayDate_dow_v = "Fri">
  <cfelseif   todayDate_dow EQ 7>
  <CFSET todayDate_dow_v = "Sat">
  <cfelseif   todayDate_dow EQ 1>
  <CFSET todayDate_dow_v = "Sun">
</cfif>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM app_jobs WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid#
AND active_record =1
</cfquery>
<!---<cfquery name="get_job_info" datasource="jrgm">
SELECT * FROM app_jobs WHERE Job_ID=  #url.Job_ID#
</cfquery>--->
<CFSET allchecked ='Yes'>
<cfquery name="get_employees" datasource="jrgm">
SELECT * FROM app_employees WHERE Direct_Supervisor_ID = #SESSION.userid#  AND active_record =1
</cfquery>
<CFSET mylist ="">
<cfloop query="get_employees">
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
          <td class="header">Daily Sheet</td>
          <td><div class="subheadersp">Jose Gonzalez</div></td>
        </tr>
      </table>
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><ul class="crew">
              <li class="crewtop"> <a href="employee_details.cfm?Employee_ID=1995&work_date=#todayDate#">
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><input name="Employee_ID" type="checkbox" class="regular-checkbox big-checkbox"   id="checkbox-2"  value="1995" checked="checked" />
                      <label for="checkbox-2-1"></label>
                    </td>
                    <td>Jerald H Tavenner</td>
                  </tr>
                </table>
                </a></li>
              <li class="crewbot"> <a href="employee_details.cfm?Employee_ID=1995&amp;work_date=#todayDate#">
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><input name="Employee_ID" type="checkbox" class="regular-checkbox big-checkbox"   id="checkbox-2"  value="1995" checked="checked" />
                      <label for="checkbox-2-1"></label>
                    </td>
                    <td>Jose J Alvarez</td>
                  </tr>
                </table>
                </a> </li>
            </ul></td>
          <td width="40"><img src="images/clear.png" width="40" height="1" /></td>
          <td valign="top"><div class="styled-select">
              <select name="job_services_done">
                <option selected="selected">Choose additional crew</option>
                <option value="1">Jerald H Tavenner</option>
                <option value="2">Jose J Alvarez</option>
                <option value="3">Hector Smith</option>
              </select>
            </div></td>
        </tr>
        <tr>
          <td valign="top">&nbsp;</td>
          <td>&nbsp;</td>
          <td valign="top"><input type="submit" name="materials_used"   value="SUBMIT" class="bluebutton" /></td>
        </tr>
      </table>
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
