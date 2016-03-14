<cfparam name="Session.job_id" default="0000">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  <!--- AND export_id =1 ---> 
ORDER by start_date,event_name
</cfquery>
<cfquery name="get_job_info" datasource="jrgm">
SELECT * FROM job_general_info WHERE Job_ID=  '#url.Job_ID#'  <!--- AND export_id =1 --->
</cfquery>
<CFSET allchecked ='Yes'>
<cfset todayDate_query = #DateFormat("#Now()#", "mm/dd/yyyy")#>
<cfset tomorrowDate_query_alt = #DateAdd( 'd', +1, now())#>
<cfset tomorrowDate_query = #DateFormat("#tomorrowDate_query_alt#", "mm/dd/yyyy")#>
<cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader   
FROM employee_payroll_clock WHERE (Crew_Leader = #SESSION.userid#) AND in_out_status=1 
 </cfquery>
<CFSET mylist ="">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<cfquery name="get_job_services" datasource="jrgm" >
SELECT t1.*, t2.service_name FROM job_services_clock AS T1 INNER JOIN services_list_short AS T2 ON T1.service_ID = T2.service_ID WHERE T1.job_ID = '#job_ID#'    <CFIF IsDefined("url.ID")>
    AND T1.Job_clock_ID =#url.id#
   </CFIF>
</CFQUERY>
<!---  <cfdump  var="#get_job_services#">   --->
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
<script type="text/javascript">

        $(document).ready(function() {

  if (navigator.userAgent.match(/Android/i)) {
    window.scrollTo(0,0); // reset in case prev not scrolled  
    var nPageH = $(document).height();
    var nViewH = window.outerHeight;
    if (nViewH > nPageH) {
      nViewH -= 150;
      $('BODY').css('height',nViewH + 'px');
    }
    window.scrollTo(0,1);
  }

});

</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar_services.cfm">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner"> <cfoutput query="get_job_info">
        <div class="subheader">#Work_Loc_Name#</div>
      </cfoutput>
      <form class="css_form" action="job_services_logic.cfm" method="post">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="dailysheet_header">Employee</td>
            <td class="dailysheet_header"><img src="images/clear.gif" width="60" height="1" /></td>
            <td class="dailysheet_header">Service</td>
          </tr>
          <tr>
            <td valign="top"><ul class="crew">
                <cfoutput query="get_employees">
                  <cfquery name="get_names" datasource="jrgm">
                 SELECT  employee_Name  FROM employee_general_info WHERE Employee_ID=  #get_employees.Employee_ID#  
                </cfquery>
                  <li>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><input name="Employee_ID" type="checkbox" id="crew#currentrow#" value="#Employee_ID#"  <cfif allchecked EQ 'Yes'>checked </cfif> /></td>
                        <td align="left" width="95%"><a href="employee_details.cfm?Employee_ID=#Employee_ID#&work_date=#todayDate#">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="left" width="75%" nowrap="nowrap">#get_names.EMPLOYEE_NAME#</td>
                            </tr>
                          </table>
                          </a> 
                      </td>
                      </tr>
                    </table>
                  </li>
                </cfoutput>
              </ul></td>
            <td align="center" valign="top">&nbsp;</td>
            <td valign="top"><cfquery name="get_services_list_short" datasource="jrgm">
			SELECT * FROM services_list_short  ORDER by Service_Name
			</cfquery>
              <fieldset>
              <div class="select_element">
                <select name="job_services_done">
                  <CFOUTPUT QUERY="get_services_list_short">
                    <option value="#Service_ID#" <cfif Service_ID EQ 1000>selected="selected"</cfif>>#Service_Name#</option>
                  </CFOUTPUT>
                </select>
              </div>
              </fieldset>
              <div class="dailysheet_header">Minutes</div>
              <input name="total_time" type="text" class="textbox" id="total_time" placeholder="" size="5"  style="text-align: right"  maxlength="4"  <cfif IsDefined("url.Job_Time_worked")>value="<cfoutput>#url.Job_Time_worked#</cfoutput>"</cfif> />
              <div class="spacer40"></div>
              <input type="submit" name="services_done"   value="SUBMIT" class="bluebutton" />
              <br />
              <br />
              <cfif get_job_services.recordcount GT 0>
                <input type="submit" name="go_to_materials"   value="Enter Materials" class="materialsbutton" />
              </cfif>
            </td>
          </tr>
        </table>
        <cfoutput>
          <cfif IsDefined("url.work_date")>
            <input type="hidden" name="work_date" value="#url.work_date#" />
            <cfelse>
            <input type="hidden" name="work_date" value="#todayDate#" />
          </cfif>
          <input type="hidden" name="job_id" value="#job_id#" />
          <input type="hidden" name="ID" value="#url.id#" />
        </cfoutput>
      </form>
    <!---   <cfquery name="get_job_services" datasource="jrgm" >
SELECT t1.*, t2.service_name FROM job_services_clock AS T1 INNER JOIN services_list_short AS T2 ON T1.service_ID = T2.service_ID WHERE T1.job_ID = '#job_ID#'    <CFIF IsDefined("url.ID")>
    AND T1.Job_clock_ID ='#url.id#'
   </CFIF> --->
  
</CFQUERY>
      <cfquery name="get_this_job_total_time" datasource="jrgm" >
SELECT * FROM job_clock  WHERE  ID =#url.id#
</CFQUERY>
      <!--- <Cfdump var="#get_job_services#">  --->
      <div class="subheader"><cfoutput>Services Performed</cfoutput></div>
      <cfoutput>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="dstable_headersm">Job Started:  #TimeFormat(get_this_job_total_time.Job_Time_In, "HH:mm")#</td>

            <td class="dstable_headersm">Job Stopped:  #TimeFormat(get_this_job_total_time.Job_Time_Out, "HH:mm")#</td>
            <td class="dstable_headersm">Total Job Time: #get_this_job_total_time.Job_time_worked# Minutes</td>
          </tr>
        </table>
      </cfoutput>
      <div class="spacer20"></div>
      
      <table border="0" cellpadding="0" cellspacing="0" width="100%" class="dailysheet_table">
     
        <tr>
          <td class="dstable_subheader" nowrap="nowrap"><strong>Employee</strong></td>
          <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" ><strong>1000<br />
            Complete </strong></td>
          <td class="dstable_subheader" align="center" valign="bottom" nowrap="nowrap" ><strong>1010<br />
            Prune </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1020<br />
            Trash Rem</strong></td>
          <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" ><strong>1040<br />
            Edge </strong></td>
          <td class="dstable_subheader"   align="center" valign="bottom" nowrap="nowrap" ><strong>1070<br />
            Turf Fert </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1080<br />
            Aeration </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>1090<br />
            Overseed </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2000<br />
            Lime </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2030<br />
            Seas. Color </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2050<br />
            Leaf Rem</strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2060<br />
            Misc. </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>2090<br />
            Bed Weed </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>3030<br />
            Mulch Bed </strong></td>
          <td class="dstable_subheader"  align="center" valign="bottom" nowrap="nowrap" ><strong>4000<br />
            Extra </strong></td>
        </tr>
        <!--- Its looping through the job_services and thus getting a new row for each service.
   It needs to loop through the each employee job_services  --->
        <cfquery name="get_employee_time_services" datasource="jrgm"   >
SELECT Employee_ID,SERVICE_ID,TOTAL_TIME FROM job_services_actual_employee 
WHERE   job_clock_id = #url.ID#
AND  Service_Time_In >= '#todayDate_query#'
 AND Service_Time_In < '#tomorrowDate_query#'
        </cfquery>
        <!--- <cfdump var="#get_employee_time_services#">   --->
        <cfoutput query="get_employee_time_services" >
          <cfset minutes_all_s = int(get_employee_time_services.total_time mod 60)>
          <cfquery name="get_employee_name" datasource="jrgm">
            SELECT crew_name AS employee_name FROM crews WHERE Employee_ID =  #get_employee_time_services.Employee_ID#
                </cfquery>
          <!--- <cfoutput> --->
          <tr>
            <td class="dstable"  nowrap="nowrap">#get_employee_name.employee_name#</td>
            <td class="dstable" align="center"><cfif SERVICE_ID EQ 1000>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1010>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable" align="center"><cfif SERVICE_ID EQ 1020>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1040>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1070>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1080>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 1090>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2000>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2030>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2050>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable"  align="center"><cfif SERVICE_ID EQ 2060>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable" align="center"><cfif SERVICE_ID EQ 2090>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable" align="center"><cfif SERVICE_ID EQ 3030>#NumberFormat(minutes_all_s,"09")#</cfif></td>
            <td class="dstable" align="center"><cfif SERVICE_ID EQ 4000>#NumberFormat(minutes_all_s,"09")#</cfif></td>
          </tr>
        </cfoutput>
        <!---    </cfloop> --->
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="includes/footer.cfm">
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
