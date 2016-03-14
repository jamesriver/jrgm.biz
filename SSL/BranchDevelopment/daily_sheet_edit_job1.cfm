<cfif IsDefined("form.ID")>
  <CFSET ID= form.ID>
  <cfelseif IsDefined("url.ID")>
  <CFSET ID= url.ID>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <cfquery name="update_job_clock" datasource="jrgm">
  UPDATE App_Job_Clock SET Job_ID = '#form.job_id#'
   WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
  </cfquery>
  <cfquery name="update_job_services_clock" datasource="jrgm">
  UPDATE App_Job_services_clock SET Job_ID = '#form.job_id#'
   WHERE job_clock_id =#form.job_clock_id# AND DS_ID =#form.ds_id#
  </cfquery>
  <cfquery name="update_app_job_services_actual_employee" datasource="jrgm">
  UPDATE app_job_services_actual_employee SET Job_ID = '#form.job_id#'
   WHERE job_clock_id =#form.job_clock_id# AND DS_ID =#form.ds_id#
  </cfquery>
</cfif>
<cfif IsDefined("url.deleteme")>
  <cfquery name="delete_job_time" datasource="jrgm">
  DELETE FROM app_job_clock
   WHERE  DS_ID =#url.ds_id# AND ID = #url.ID#
  </cfquery>
  <cfquery name="delete_employee_services" datasource="jrgm">
 DELETE FROM app_job_services_actual_employee
  WHERE  DS_ID =#url.ds_id# AND job_clock_id = #url.ID#
  </cfquery>
  <cfquery name="delete_employee_services_tot" datasource="jrgm">
 DELETE FROM app_job_services_clock
 WHERE  DS_ID =#url.ds_id# AND job_clock_id = #url.ID#
  </cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_time")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.Job_Time_In>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.Job_Time_Out>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE App_Job_Clock
SET Job_Time_In = '#string4#',Job_Time_Out=  '#string6#'  
 WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
   </cfquery>
  <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2
    WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
  <cfquery name="update_job_services_clock" datasource="jrgm">
    UPDATE   APP_Job_Services_Clock SET service_time = DATEDIFF(mi,service_time_in,service_time_out) 
  WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
  <cfquery name="update_job_services_actual_employee__clock" datasource="jrgm">
 UPDATE APP_Job_Services_Actual_Employee SET total_time = DATEDIFF(mi,service_time_in,service_time_out) 
  WHERE ID =#form.ID# AND DS_ID =#form.ds_id#
     </cfquery>
</cfif>
<CFQUERY name="get_this_job" datasource="#request.dsn#">
SELECT * FROM app_job_clock WHERE ID = #id#
</CFQUERY>
<cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/bootstrap.min.css" type="text/css" media="screen" />
<link href="assets/pygments.css" type="text/css" rel="stylesheet" />
<link href="assets/prettify/prettify.css" type="text/css" rel="stylesheet" />
<link href="assets/bootstrap/css/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
<link href="css/bootstrap-timepicker.min.css" type="text/css" rel="stylesheet" />
<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
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
      <div class="header">Job Editor</div>
      <table   border="0" cellpadding="3" cellspacing="0" class="dailysheet_table_top" >
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Date : </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;&nbsp; &nbsp; </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >DSID:</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#DS_ID#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" class="dailysheetEditTop">Supervisor : </td>
          <td align="left" class="dailysheetEditTop"><cfoutput>#get_supervisor.employeename#</cfoutput></td>
          <td align="left" class="dailysheetEditTop">&nbsp;</td>
          <td align="left" class="dailysheetEditTop" >Crew Leader : </td>
          <td align="left" class="dailysheetEditTop" ><cfoutput>#get_crew_leader.employeename#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Job Name:&nbsp; </strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_this_job_name.event_name#</cfoutput></strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Job ID:&nbsp; </strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_this_job.Job_ID#</cfoutput></strong></td>
        </tr>
        <cfoutput>
          <tr>
            <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job Start Time :</span></td>
            <td align="left" nowrap="nowrap" class="dailysheetEditTop" >#TimeFormat(get_this_job.Job_Time_In, "hh:mm tt")#</td>
            <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
            <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job End Time </span></td>
            <td align="left" nowrap="nowrap" class="dailysheetEditTop" >#TimeFormat(get_this_job.Job_Time_Out, "hh:mm tt")#</td>
          </tr>
        </cfoutput>
      </table>
      <cfif IsDefined("url.delete")>
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td align="left" class="dailysheetEdit"> Are you sure you want to delete <strong><cfoutput>#get_this_job_name.event_name#</cfoutput></strong> from this daily sheet? <br />
              <cfoutput><a href="daily_sheet_edit_job1.cfm?deleteme=yes&ds_id=#ds_id#&ID=#url.ID#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_job1.cfm?ds_id=#ds_id#&ID=#url.ID#" class="YesNoButton">No</a>
                <p  class="redarial"> <br />
                  Choosing yes will delete <strong> #get_this_job_name.event_name# </strong> from this daily sheet. </p>
              </cfoutput> </td>
          </tr>
        </table>
        <cfabort>
      </cfif>
      <form   method="post" action="daily_sheet_edit_job1.cfm" >
        <cfquery name="get_all_branch_jobs" datasource="jrgm">
		SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id FROM APP_jobs
		WHERE branch= '#get_this_job_name.branch#'
        ORDER by [Wk Location Name] ASC
		</cfquery>
        <table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td nowrap="nowrap" class="dailysheetEditTop">Select Job</td>
            <td class="dailysheetEditTop"><div class="stylededit-select">
                <select name="Job_ID"  >
                  <cfoutput query="get_all_branch_jobs">
                    <option value="#job_id#" 
		  <cfif get_all_branch_jobs.job_id  EQ #get_this_job.job_ID#>selected="selected"</cfif>>#work_loc_name#</option>
                  </cfoutput>
                </select>
              </div></td>
            <td><input type="submit" name="submit" value="Submit" class="materialsbutton"/></td>
          </tr>
          <cfoutput>
            <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Crew_Leader_ID"   value="#get_this_job.Crew_Leader_ID#" />
            <input type="hidden" name="ID"   value="#get_this_job.ID#" />
            <input type="hidden" name="job_clock_id"   value="#get_this_job.ID#" />
            <input type="hidden" name="job_clock_name"   value="1" />
          </cfoutput>
        </table>
      </form>
      <table border="0" cellpadding="0" cellspacing="0" >
        <form  method="post" action="daily_sheet_edit_job1.cfm"   >
          <cfoutput query="get_this_job">
            <tr>
              <td align="right" nowrap="nowrap" class="dailysheetEdit">Job Start Time In:</td>
              <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                  <input id="timepicker1" type="text" class="input-small" name="Job_Time_In" value="#TimeFormat(Job_Time_In,"short")#" />
                  <span class="add-on"><i class="icon-time"></i></span> </div>
                <!---  <input type="text"  value="#TimeFormat(Job_Time_In, "HH:mm")#"  name="Job_Time_In"   maxlength="5"  size="5" /> ---></td>
              <td align="right" nowrap="nowrap" class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
              <td align="right" nowrap="nowrap" class="dailysheetEdit">Job End Time  :</td>
              <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                  <input id="timepicker2" type="text" class="input-small" name="Job_Time_Out" value="#TimeFormat(Job_Time_Out,"short")#" />
                  <span class="add-on"><i class="icon-time"></i></span> </div>
                <!--- <input type="text"  value="#TimeFormat(Job_Time_Out, "HH:mm")#"  name="Job_Time_Out" maxlength="5" size="5" /> ---></td>
              <td class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
              <td align="right"valign="top" class="dailysheetEdit"><input name="submit" type="submit" class="materialsbutton"  value="Submit" /></td>
              <td align="right"valign="top" class="dailysheetEdit">&nbsp;</td>
            </tr>
            <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Crew_Leader_ID"   value="#get_this_job.Crew_Leader_ID#" />
            <input type="hidden" name="ID"   value="#get_this_job.ID#" />
            <input type="hidden" name="job_clock_id"   value="#get_this_job.ID#" />
            <input type="hidden" name="job_clock_time"   value="1" />
          </cfoutput>
        </form>
      </table>
      <br />
      <br />
      <tr> <cfoutput>
          <td><a href="daily_sheet_edit_job1.cfm?ds_id=#ds_id#&ID=#ID#&delete=yes"  class="removebutton">Remove this Job</a></td>
          <td>&nbsp;</td>
          <td><a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="dssbutton" >Back to Daily Sheet</a></td>
        </cfoutput> </tr>
      <!---  <cfoutput>
        <p><a href="daily_sheet_edit.cfm?dsid=#ds_id#"  class="dssbutton">Back to Daily Sheet</a></p>
      </cfoutput>  --->
    </div>
  </div>
  <!-- to clear footer -->
</div>
<script type="text/javascript" src="assets/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/jquery/2.2.2/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/prettify/prettify.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
<script type="text/javascript">
$('#timepicker1').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker2').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker3').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker4').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker5').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker6').timepicker({
   defaultTime: false
});
 </script>
<!--- <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script> --->
</body>
</html>
