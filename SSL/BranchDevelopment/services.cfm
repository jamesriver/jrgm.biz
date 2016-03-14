<cfquery name="get_all_jobs" datasource="jrgm">
SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id FROM APP_jobs WHERE   active_record =1   
ORDER by [Wk Location Name]   
</cfquery>
<cfquery name="get_employees" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM APP_employees WHERE Direct_Supervisor_ID = #SESSION.userid#  AND active_record =1
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
<cfinclude template="includes/topbar.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">
  <cfquery name="get_this_crew_leader" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM APP_employees WHERE [Employee ID] = #CREW_LEADER_ID#  AND active_record =1 
</cfquery>
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="5" class="header">Daily Sheet</td>
    </tr>
    <tr>
      <td class="dailysheet_header">Crew Leader : </td>
      <td  class="subheadersp">&nbsp;<cfoutput>#get_this_crew_leader.EMPLOYEE_NAME#</cfoutput> </td>
      <td width="40"></td>
      <td class="dailysheet_header">Work Date : </td>
      <td  class="subheadersp">&nbsp;<cfoutput>#url.ds_date#</cfoutput> </td>
    </tr>
  </table>
  <div class="spacer20"></div>
  <form class="css_form" action="job_services_logic.cfm" method="post">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr class="services">
        <td valign="top">Choose a Job/Property</td>
        <td valign="top">Choose a Service</td>
        <td valign="top">Choose Employees</td>
        <td align="center" valign="top">&nbsp;</td>
        <td align="left" valign="top">&nbsp;Minutes</td>
        <td align="center" valign="top">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><fieldset>
          <div class="select_element">
            <select name="job_id">
              <option value="0000" selected="selected">Choose a Property</option>
              <CFOUTPUT QUERY="get_all_jobs">
                <option value="#Job_ID#" <cfif IsDefined("url.Job_ID") AND Job_ID EQ url.Job_ID>selected="selected"</cfif>>#Work_Loc_Name#</option>
              </CFOUTPUT>
            </select>
          </div>
          </fieldset></td>
        <td valign="top"><cfquery name="get_services_list_short" datasource="jrgm">
			SELECT * FROM APP_services_list_short  ORDER by Service_Name
			</cfquery>
          <fieldset>
          <div class="select_element">
            <select name="job_services_done">
              <CFOUTPUT QUERY="get_services_list_short">
                <option value="#Service_ID#" <cfif Service_ID EQ 1000>selected="selected"</cfif>>#Service_Name#</option>
              </CFOUTPUT>
            </select>
          </div>
          </fieldset></td>
        <cfquery name="get_employees_crew_1" datasource="jrgm">
   SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM APP_employees WHERE [Employee ID] IN (SELECT Employee_ID from APP_Employee_Payroll_Clock WHERE ds_id=   #url.ds_id#)
ORDER by EMPLOYEE_NAME
</cfquery>
        <td valign="top"><ul class="crew">
            <cfoutput query="get_employees_crew_1">
              <li>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><input type="checkbox" name="Employee_ID"  value="#Employee_ID#"   id="crew#currentrow#"   />
                    </td>
                    <td width="75%" nowrap="nowrap">#EMPLOYEE_NAME# </td>
                    <td nowrap="nowrap"></td>
                    <td align="right" ></td>
                  </tr>
                </table>
              </li>
            </cfoutput>
          </ul></td>
        <td align="center" valign="top">&nbsp;</td>
        <td align="left" valign="top"><input name="job_time_worked" type="text" id="total_time" class="textbox"    placeholder="" size="5"  style="text-align: right"  maxlength="4" />
        </td>
        <td align="center" valign="top">&nbsp;</td>
        <td valign="top" >&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center" nowrap="nowrap">&nbsp;</td>
        <td align="center" nowrap="nowrap">&nbsp;</td>
        <td align="center" nowrap="nowrap">&nbsp;</td>
        <td nowrap="nowrap" align="left">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="center" nowrap="nowrap"></td>
        <td><input type="submit" name="services_done"   value="SUBMIT" class="bluebutton" />
          <div class="spacer40"></div>
          <input type="submit" name="go_to_materials"   value="Enter Materials For This Job" class="materialsbuttonwider" /></td>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
    </table>
    <cfoutput>
      <cfif IsDefined("url.ds_date")>
        <input type="hidden" name="ds_date" value="#url.ds_date#" />
        <cfelse>
        <input type="hidden" name="ds_date" value="#ds_date#" />
      </cfif>
      <!--- <input type="hidden" name="job_id" value="#job_id#" /> --->
      <input type="hidden" name="ds_id" value="#url.ds_id#" />
      <input type="hidden" name="crew_leader_id" value="#url.crew_leader_id#" />
    </cfoutput>
  </form>
  <div class="spacer20"></div>
  <cfif IsDefined("url.Job_ID") >
    <cfquery name="get_job_services" datasource="jrgm" >
SELECT t1.*, t2.service_name FROM APP_job_services_clock AS T1 INNER JOIN APP_services_list_short AS T2 ON T1.service_ID = T2.service_ID WHERE T1.job_ID = '#job_ID#'    <CFIF IsDefined("url.ds_id")>
    AND T1.ds_id =#url.ds_id#
   </CFIF>
  
</CFQUERY>
    <!--- <Cfdump var="#get_job_services#">  --->
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><div class="subheader"><cfoutput>Services Performed &amp; Total Crew Time&nbsp;
              <!--- &nbsp;&nbsp;<span class="details_desc">Job Started: #TimeFormat(get_this_job_total_time.Job_Time_In, "HH:mm")#- Job Stopped: #TimeFormat(get_this_job_total_time.Job_Time_Out, "HH:mm")#&nbsp;&nbsp;Total Job Time: #get_this_job_total_time.Job_time_worked# Minutes --->
              </span></cfoutput> </div></td>
      </tr>
      <cfoutput query="get_job_services">
        <cfquery name="get_this_job_total_services_time" datasource="jrgm" >
SELECT SUM(Total_Time) AS total_service_time FROM APP_job_services_actual_employee  WHERE  ds_id =#url.ds_id#  and service_id =#service_id#  AND job_id='#job_id#'
</CFQUERY>
        <tr>
          <td class="services">#service_id# - #service_name# - #get_this_job_total_services_time.total_service_time# Minutes </td>
        </tr>
      </cfoutput>
    </table>
  </cfif>
  <!-- to clear footer -->
</div>
<br />
<br />
<br />
<br />
<br />
<br />
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
