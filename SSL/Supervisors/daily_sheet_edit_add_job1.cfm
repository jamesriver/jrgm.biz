
<cfparam name="Job_Time_In" default="00:00">
<cfparam name="Job_Time_Out" default="00:00">

<cfparam name="Lunch_start" default="00:00">
<cfparam name="Lunch_end" default="00:00">




<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
 <cfif  Job_Time_Out LTE Job_Time_In><!---  <cfabort> --->
 <cfoutput>  
 <cflocation url="daily_sheet_edit_add_job1.cfm?ds_id=#ds_id#&error=time">
</cfoutput>  
</cfif></cfif>

<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.job_clock_name")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.Job_Time_In>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.Job_Time_Out>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO APP_job_clock (Job_ID,Job_Time_In,Job_Time_Out,In_Out_Status,Crew_Leader_ID,ds_id) VALUES ('#form.job_ID#','#string4#','#string6#',1,#form.Crew_Leader_ID#,#form.ds_id#)
    </cfquery>
     <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM APP_job_clock  
    </cfquery>
   
  <cfquery name="get_employees_for_DS" datasource="jrgm">
 SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position  FROM APP_employees
WHERE [Employee ID] IN 
(SELECT Employee_ID FROM  app_employee_payroll_clock WHERE  ds_id = #form.ds_id#) 
 ORDER by [Employee ID] ASC
 </cfquery>

 <cfloop query="get_employees_for_DS">     
    <cfquery name="insert_app_job_services_actual_employee" datasource="jrgm">
  INSERT INTO app_job_services_actual_employee 
    (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   (#get_employees_for_DS.employee_id#,'#form.job_ID#','0000','0','#form.ds_id#','#form.crew_leader_id#','#getmaxid.newid#') 
   </cfquery> 
   
 <cfquery name="update_job_clock" datasource="jrgm">
 UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2
 WHERE ID = #getmaxid.newid#
 </cfquery>
      
   </cfloop>
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
   input { text-align:right; }
  .arialfont {font: normal .9em Arial, Helvetica, sans-serif;}
 .redarial {padding-top: 20px; font: normal .9em Arial, Helvetica, sans-serif;color: red;}

</style>

 </head>
<body onload="prettyPrint()" data-target=".subnav" data-spy="scroll" data-twttr-rendered="true" >

<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Job Editor</div>
      <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") AND  IsDefined("form.JOB_TIME_IN")>
         <table   border="0" cellpadding="3" cellspacing="0" class="arialfont" >
        <tr>
          <td align="left" nowrap="nowrap" >The job has been aded to the daily sheet.<br />
          Dont forget to enter service time for each employee.<br />
          <cfoutput>
           <p><a href="daily_sheet_edit.cfm?dsid=#form.ds_id#"  class="dssbutton">Back to Daily Sheet</a>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;<a href="daily_sheet_edit_add_job1.cfm?ds_id=#form.ds_id#" class="dssbutton">Add Another Job</a>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;<a href="daily_sheet_edit_add_lunch1.cfm?ds_id=#form.ds_id#&job_clock_id=#getmaxid.newid#" class="dssbutton">Add Lunch to this Job</a></p>
        </cfoutput>
        </td>
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
      </table>
      <form  method="post" action="daily_sheet_edit_add_job1.cfm" >
        <cfquery name="get_all_branch_jobs" datasource="jrgm">
		SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id FROM APP_jobs
		WHERE branch= '#SESSION.branch#'
        ORDER by [Wk Location Name] ASC
		</cfquery>
       
        <table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td nowrap="nowrap" class="dailysheetEditTop">Select Job</td>
            <td class="dailysheetEditTop" colspan="6"><div class="stylededit-select">
                <select name="Job_ID"  >
                  <cfoutput query="get_all_branch_jobs">
                    <option value="#job_id#">#work_loc_name#</option>
                  </cfoutput>
                </select>
              </div></td>
          </tr>
         <cfoutput> <tr>
            <td align="right" nowrap="nowrap" class="dailysheetEdit">Job Start Time In:</td>
            <td class="dailysheetEdit">
            <div class="input-append bootstrap-timepicker">
          <input id="timepicker1" type="text" class="input-small" name="Job_Time_In" value="#TimeFormat(Job_Time_In,"short")#" />
          <span class="add-on"><i class="icon-time"></i></span> </div>
         </td>
            <td align="right" nowrap="nowrap" class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
            <td align="right" nowrap="nowrap" class="dailysheetEdit">Job End Time  :</td>
            <td class="dailysheetEdit">
             <div class="input-append bootstrap-timepicker">
          <input id="timepicker2" type="text" class="input-small" name="Job_Time_Out" value="#TimeFormat(Job_Time_Out,"short")#" />
          <span class="add-on"><i class="icon-time"></i></span> </div>
            
           </td>
            <td class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
            <td align="right"valign="top" class="dailysheetEdit"> <input name="submit" type="submit" class="materialsbutton"  value="Submit" /> </td>
        
          </tr>
         <cfif IsDefined("url.error")>
         <tr>
             <td colspan="7" align="right" nowrap="nowrap" class="dailysheetEdit"> 
	    <span class="redarial">The Job End Time MUST be after the Job Start Time</span>

         </td>
            </tr></cfif>
		  <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Crew_Leader_ID"   value="#get_crew_leader.empid#" />
            <input type="hidden" name="job_clock_name"   value="1" /> 
          </cfoutput>
        </table>
        </form> 
    
     <table   border="0" cellspacing="1" cellpadding="0">
   <cfoutput><tr>
    <td width="200" nowrap="nowrap"> 
      <a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="dssbutton">Back to Daily Sheet</a> 
      </td>
    <td width="200">&nbsp;</td>
    <td><br />    <!---   <input name="submit" type="submit" class="materialsbutton"  value="Submit" / ---></td>
    </tr>  </cfoutput>
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

 
 </body>
</html>
