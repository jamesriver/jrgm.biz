<cfparam name="Job_Time_In" default="00:00">
<cfparam name="Job_Time_Out" default="00:00">
<cfparam name="Lunch_start_time" default="00:00">
<cfparam name="Lunch_end_time" default="00:00">
<cfif IsDefined("form.job_clock_ID")>
  <CFSET job_clock_ID= form.job_clock_ID>
  <cfelseif IsDefined("url.job_clock_ID")>
  <CFSET job_clock_ID= url.job_clock_ID>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <cfif  Lunch_end_time LTE Lunch_start_time>
    <!---  <cfabort> --->
    <cfoutput>
      <cflocation url="daily_sheet_edit_add_lunch1.cfm?ds_id=#ds_id#&job_clock_id=#job_clock_id#&error=time">
    </cfoutput>
  </cfif>
</cfif>
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.Lunch_start_time>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.Lunch_end_time>
  <cfset string6 =  string1 &  string2 &  string5>
  <!--- <cfset totalminutes_this_job=#get_this_job.job_time_worked#-#get_this_job_lunch.Lunch_Time#> --->
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO APP_lunch (ds_id, job_id,Crew_Leader_ID, Lunch_Time_Out, Lunch_Time_In, job_clock_id
) VALUES (#form.ds_id#,'#form.job_ID#',#form.Crew_Leader_ID#,'#string6#','#string4#',#form.job_clock_ID#)
    </cfquery>
  <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM APP_lunch  
    </cfquery>
  <cfquery name="update_employee_time" datasource="jrgm">
 UPDATE APP_lunch SET lunch_time = DATEDIFF(mi,Lunch_Time_In,Lunch_Time_Out) WHERE ID =#getmaxid.newid#
</cfquery>
  <cfquery name="get_lunch_mins" datasource="jrgm">
 SELECT lunch_time  FROM APP_lunch  WHERE ID =#getmaxid.newid#
</cfquery>
  <cfquery name="Update_lunchtime" datasource="jrgm">
   UPDATE APP_job_clock SET lunch_time = #get_lunch_mins.lunch_time#  WHERE ds_id = #ds_id# AND ID = #form.job_clock_ID#
    </cfquery>
</cfif>
<cfif IsDefined("ID")>
  <CFQUERY name="get_this_job" datasource="#request.dsn#">
SELECT * FROM app_job_clock WHERE ID = #id#
</CFQUERY>
  <cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
</cfif>
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
SELECT   [Employee ID], [Employee ID] as empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
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
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
</style>
</head>
<body onload="prettyPrint()" data-target=".subnav" data-spy="scroll" data-twttr-rendered="true" >
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Lunch Editor </div>
      <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.Lunch_end_time")>
        <table   border="0" cellpadding="3" cellspacing="0" class="arialfont" >
          <tr>
            <td align="left" nowrap="nowrap" >The lunch times have been aded to the daily sheet.<br />
              Dont forget to enter service time for each employee.<br />
              <cfoutput>
                <p><a href="daily_sheet_edit.cfm?dsid=#form.ds_id#"  class="dssbutton">Back to Daily Sheet</a></p>
              </cfoutput> </td>
          </tr>
        </table>
        <cfabort>
      </cfif>
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
          <td align="left" class="dailysheetEditTop">Job Name:</td>
          <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM app_job_clock WHERE ID = #job_clock_id#
   </CFQUERY>
          <cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch,[Job ID] AS job_id FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
          <td align="left" class="dailysheetEditTop"><cfoutput>#get_this_job_name.event_name#</cfoutput> </td>
          <td align="left" class="dailysheetEditTop">&nbsp;</td>
          <td align="left" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" class="dailysheetEditTop" >&nbsp;</td>
        </tr>
      </table>
      <form  method="post" action="daily_sheet_edit_add_lunch1.cfm" >
        <table border="0" cellspacing="0" cellpadding="0" >
          <cfoutput>
            <tr>
              <td align="right" nowrap="nowrap" class="dailysheetEdit">Lunch Start Time :</td>
              <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                  <input id="timepicker1" type="text" class="input-small" name="Lunch_start_time" value="#TimeFormat(Lunch_start_time,"short")#" />
                  <span class="add-on"><i class="icon-time"></i></span> </div></td>
              <td align="right" nowrap="nowrap" class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
              <td align="right" nowrap="nowrap" class="dailysheetEdit">Lunch End Time  :</td>
              <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                  <input id="timepicker2" type="text" class="input-small" name="Lunch_end_time" value="#TimeFormat(Lunch_end_time,"short")#" />
                  <span class="add-on"><i class="icon-time"></i></span> </div></td>
              <td class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
              <td align="right"valign="top" class="dailysheetEdit"><input name="submit" type="submit" class="materialsbutton"  value="Submit" />
              </td>
            </tr>
            <cfif IsDefined("url.error")>
              <tr>
                <td colspan="7" align="right" nowrap="nowrap" class="dailysheetEdit"><span class="redarial">The Lunch End Time MUST be after the Lunch Start Time</span> </td>
              </tr>
            </cfif>
            <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Crew_Leader_ID"   value="#get_crew_leader.empid#" />
            <input type="hidden" name="job_clock_name"   value="1" />
            <input type="hidden" name="job_clock_ID"   value="#job_clock_ID#" />
            <input type="hidden" name="job_ID"   value="#get_this_job_name.job_ID#" />
          </cfoutput>
        </table>
      </form>
      <table   border="0" cellspacing="1" cellpadding="0">
        <cfoutput>
          <tr>
            <td width="200" nowrap="nowrap"><a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="dssbutton">Back to Daily Sheet</a> </td>
            <td width="200">&nbsp;</td>
            <td><br />
            </td>
          </tr>
        </cfoutput>
      </table>
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
</body>
</html>
