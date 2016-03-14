<!--- This is the code to force cl to enter services --->
<cfif   IsDefined("Session.job_services_entered") AND  Session.job_services_entered EQ 0>
  <cfquery name="get_job_without_services" datasource="jrgm" maxrows="1">
SELECT * FROM job_clock WHERE Crew_Leader_ID = #Session.userid#  
ORDER by ID DESC 
</cfquery>
  <cflocation url="services.cfm?work_date=#todayDate_DS#&job_id=#get_job_without_services.job_id#&ID=#get_job_without_services.ID#">
</cfif>
<!--- END This is the code to force cl to enter services --->
<cfset Now_Time = Now()>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<!--- <cfset todayDate_dow = DayOfWeek(todayDate)> --->
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
 
 <cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM jobs WHERE [Job ID] =  '#url.Job_ID#'  AND active_record= 1
 </cfquery>
 
 
<cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader_ID, crew_name AS employee_name  FROM crews WHERE (Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) <!--- AND export_id =1  --->
</cfquery>
<CFSET mylist ="#SESSION.userid#">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<cfquery name="get_if_any_employee_clocked_in" datasource="jrgm" >
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
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
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
	<!--- <cfdump var="#get_job_info#"> --->
    <!--centre content goes here -->
    <div class="centrecontent_inner"> 
    <div class="icons">
    <div class="iconsea">
	<cfoutput query="get_job_info"><a href="directions.cfm?job_id=#job_id#&work_date=#url.work_date#" ><img src="images/icon_directions_new.png" width="67" height="79" alt="Directions" /></a></cfoutput></div>
   <div class="iconsea"> <cfoutput><a href="notes.cfm?Job_ID=#Job_ID#&work_date=#url.work_date#"><img src="images/icon_note_new.png" width="67" height="79" alt="Add a Note" /></a></cfoutput></div>
   <div class="clear"> </div></div>
     <form  action="job_time_logic.cfm" method="post">
              <table border="0" cellpadding="0" cellspacing="0">
                <cfquery name="get_job_timestamp" datasource="jrgm" maxrows="1">
                    SELECT * FROM job_clock WHERE job_ID = '#Job_ID#'   AND 
					DATEADD(hour,10,Job_Time_In) > #Now_Time#  AND crew_leader_id = #SESSION.userid#
					<!--- Job_time_in = #todayDate# --->  
                    <CFIF IsDefined("url.ID")>
                    AND ID=#url.ID#
                    </CFIF>
                    ORDER by ID DESC
                 </cfquery>
               
                <tr>
                  <cfif get_job_timestamp.in_out_status EQ 1>
                    <td><input type="image" src="images/icon_jobstop.png" width="100" height="100" alt="Job Stop" name="job_out" id="button" value="Job Stop" /></td>
                    <cfelse>
                    <cfquery name="make_sure_not_already_in" datasource="jrgm">
                 SELECT Job_ID FROM job_clock 
            WHERE  In_Out_Status =1 AND Crew_Leader_ID = #SESSION.userid#
              </cfquery>
                    <cfif make_sure_not_already_in.recordcount EQ 0>
                      <td align="center"><cfif get_if_any_employee_clocked_in.recordcount GT 0>
                      <input type="image" src="images/icon_jobstart.png" width="100" height="100" alt="Job Start" name="job_in" value="Job Start" id="button">
                        </cfif>
                      <!---     <input type="submit" name="job_in" id="button" value="Job Start" class="jobstart" /> --->
                      </td>
                    </cfif>
                  </cfif>
                  <td class="width40"></td>
                  <cfif get_job_timestamp.in_out_status EQ 1>
                    <td nowrap="nowrap" class="timeIn">Time In : <cfoutput>#TimeFormat(get_job_timestamp.Job_Time_In, "hh:mm tt")#</cfoutput> </td>
                  </cfif>
                </tr>
              </table>
			  <cfoutput>
                <cfif IsDefined("url.work_date")>
                  <input type="hidden" name="work_date" value="#url.work_date#" />
                  <cfelse>
                  <input type="hidden" name="work_date" value="#todayDate#" />
                </cfif>
                <input type="hidden" name="job_id" value="#job_id#" />
                <input type="hidden" name="ID" value="#get_job_timestamp.ID#" />
                <input type="hidden" name="Job_Time_In" value="#get_job_timestamp.Job_Time_In#" />
                <input type="hidden" name="Job_Time_Out" value="#get_job_timestamp.Job_Time_Out#" />
                <input type="hidden" name="job_time_worked" value="#get_job_timestamp.job_time_worked#" />
              </cfoutput>
            </form>
      <cfoutput query="get_job_info">
        <div class="subheader">#locationname#</div>
              <div class="lgaddress">#jobaddress1# #jobcity# VA #jobzip#</div>
      </cfoutput>
      <div class="spacer20"></div>
      <cfoutput query="get_job_info">
        <table border="0" cellpadding="0" cellspacing="0">
          <!--- <tr>
            <td class="details_title">Contact</td>
            <td class="details_desc"><!--- #Account_Manager# ---></td>
          </tr>
          <tr>
            <td class="details_title">Phone</td>
            <td class="details_desc"><!--- 555-555-1212 ---></td>
          </tr> --->
          <tr>
            <td class="details_title">Manager</td>
            <td class="details_desc">#acctmgr#</td>
          </tr>
          <tr>
            <td class="details_title">Crew Lead</td>
            <td class="details_desc">#CrewLeader#</td>
          </tr>
          <tr>
            <td class="details_title">Spray Tech</td>
            <td class="details_desc"><!--- #Account_Manager# ---></td>
          </tr>
          <tr>
            <td class="details_title">Irrig Tech</td>
            <td class="details_desc"><!--- #Account_Manager# ---></td>
          </tr>
          <tr>
            <td class="details_title">Irrig Contrator</td>
            <td class="details_desc"><!--- #Account_Manager# ---></td>
          </tr>
        </table>
      </cfoutput>
      <div class="spacer40"></div>
      <div class="subheader">Notes</div>
      <cfquery name="get_job_notes" datasource="jrgm">
       SELECT * FROM notes WHERE job_ID = '#job_ID#'
       ORDER by Note_Date DESC
      </cfquery>
      <ul class="crew2">
        <cfif get_job_notes.recordcount EQ 0>
          <li>There are no notes for this job.</li>
          <cfelse>
          <cfoutput query="get_job_notes">
            <li>#dateformat(Note_Date,"mm/dd/yyyy")# - #note_content#</li>
          </cfoutput>
        </cfif>
      </ul>
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
