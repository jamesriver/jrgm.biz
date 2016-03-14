<CFSET url.branch ='Chesterfield'>
<cfparam name="message" default="">
<cfquery name="get_employee_time_from_device" datasource="jrgm">
SELECT  * FROM app_employee_payroll_clock 
WHERE Employee_ID =#Employee_ID#  AND entry_method IS NULL
AND ds_id = #ds_id#
ORDER by ID ASC
</cfquery>
<cfif get_employee_time_from_device.recordcount GT 0>
  <cfloop query="get_employee_time_from_device">
    <cfquery name="insert_time" datasource="jrgm">
 INSERT INTO app_employee_payroll_clock_backup 
 (Employee_ID,crew_leader,supervisor,ds_id, In_Out_Status,entry_method , ds_date,time_in,time_out,CompleteHours, IsEmpInjury,time_worked) 
 VALUES (#get_employee_time_from_device.Employee_ID#,#get_employee_time_from_device.crew_leader#,#get_employee_time_from_device.supervisor#,#get_employee_time_from_device.ds_id#,#get_employee_time_from_device.In_Out_Status#,#get_employee_time_from_device.In_Out_Status#,#get_employee_time_from_device.ds_date#,'#get_employee_time_from_device.time_in#','#get_employee_time_from_device.time_out#'
 , 
 <cfif get_employee_time_from_device.CompleteHours IS "">NULL,<cfelse>
 #get_employee_time_from_device.CompleteHours#,</cfif>
 
  <cfif get_employee_time_from_device.IsEmpInjury IS "">NULL,<cfelse>
 #get_employee_time_from_device.IsEmpInjury#,</cfif>
 
  <cfif get_employee_time_from_device.time_worked IS "">NULL<cfelse>
 #get_employee_time_from_device.time_worked#</cfif>
 
 )
 </cfquery>
  </cfloop>
</cfif>
<!---  <cfabort> --->
<cfif IsDefined("url.deleteme")>
  <cfquery name="delete_employee_time" datasource="jrgm">
  DELETE FROM app_employee_payroll_clock
   WHERE  DS_ID =#url.ds_id# AND employee_ID = #url.employee_ID#
  </cfquery>
  <cfquery name="delete_employee_services" datasource="jrgm">
 DELETE FROM app_job_services_actual_employee
 WHERE  DS_ID =#url.ds_id# AND employee_ID = #url.employee_ID#
  </cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#&branch=#url.branch#">
  </cfoutput>
</cfif>
<cfif IsDefined("url.deletemerow")>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE FROM app_employee_payroll_clock
WHERE  DS_ID =#url.ds_id# AND ID = #url.rowid#
</cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&branch=#url.branch#">
  </cfoutput>
</cfif>
<!--- ------------ For  Time 1---------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.TIME_IN1")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.TIME_IN1>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.TIME_OUT1>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE app_employee_payroll_clock
SET time_In = '#string4#' ,time_out=  '#string6#' ,entry_method =2 
WHERE Employee_ID =#form.Employee_ID# AND ds_id = #form.ds_id# AND ID  = #row_ID#
   </cfquery>
  <CFSET message ="#TIME_IN1# - #TIME_OUT1# added">
</cfif>
<!--- ------------ For  Time 2---------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.TIME_IN2")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.TIME_IN2>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.TIME_OUT2>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE app_employee_payroll_clock
SET time_In = '#string4#' ,time_out=  '#string6#',entry_method =2 
WHERE Employee_ID =#form.Employee_ID# AND ds_id = #form.ds_id# AND ID  = #row_ID#
   </cfquery>
  <CFSET message ="#TIME_IN2# - #TIME_OUT2# added">
</cfif>
<!--- ------------ For  Time 3---------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.TIME_IN3")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.TIME_IN3>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.TIME_OUT3>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE app_employee_payroll_clock
SET time_In = '#string4#' ,time_out=  '#string6#',entry_method =2 
WHERE Employee_ID =#form.Employee_ID# AND ds_id = #form.ds_id# AND ID  = #row_ID#
   </cfquery>
  <CFSET message ="#TIME_IN3# - #TIME_OUT3# added">
</cfif>
<!--- ------------ For  Time 4---------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.TIME_IN4")>
  <CFSET string1 =FORM.DS_DATE>
  <CFSET string2 =" ">
  <CFSET string3 =FORM.TIME_IN4>
  <cfset string4 =  string1 &  string2 &  string3>
  <CFSET string5 =FORM.TIME_OUT4>
  <cfset string6 =  string1 &  string2 &  string5>
  <cfquery name="update_employee_time" datasource="jrgm">
UPDATE app_employee_payroll_clock
SET time_In = '#string4#' ,time_out=  '#string6#' ,entry_method =2  
WHERE Employee_ID =#form.Employee_ID# AND ds_id = #form.ds_id# AND ID  = #row_ID#
   </cfquery>
  <CFSET message ="#TIME_IN4# - #TIME_OUT4# added">
</cfif>
<cfquery name="update_employee_time" datasource="jrgm">
UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out)  WHERE ds_id = #ds_id#
 </cfquery>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfif IsDefined("form.Employee_ID")>
  <CFSET Employee_ID= form.Employee_ID>
  <cfelseif IsDefined("url.Employee_ID")>
  <CFSET Employee_ID= url.Employee_ID>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
  <CFSET ds_date = get_ds_info.ds_date>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID],  [Employee ID] AS empid, [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]= #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] AS empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]= #get_ds_info.crew_leader_id#  
</cfquery>
<cfif IsDefined("url.addrow") >
  <cfquery name="insert_time" datasource="jrgm">
 INSERT INTO app_employee_payroll_clock (Employee_ID,crew_leader,supervisor,ds_id, In_Out_Status, time_worked,entry_method,ds_date) 
 VALUES (#url.Employee_ID#,#get_crew_leader.empid#,#get_supervisor.empid#,#url.ds_id#,2,0,2,#ds_date#)
 </cfquery>
</cfif>
 <cfquery name="get_employee_time" datasource="jrgm">
SELECT  ID,time_In,  time_Out FROM app_employee_payroll_clock 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
ORDER by time_in ASC<!--- time_Out DESC --->
</cfquery>
<CFSET getrowcount =#get_employee_time.recordcount#>
<!--- <cfdump var="#get_employee_time#"> --->
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
 .greentype {
	 padding-top: 10px;
	 padding-bottom: 10px;
	font: normal 1em Arial, Helvetica, sans-serif;color: #588302;
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
      <div class="header">Employee Time Editor<br />
      </div>
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
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Employee Name: </strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_employee.employeename# -#Employee_ID#</cfoutput></strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Daily Total Hours :</td>
          <cfquery name="get_employee_minutes_for_day" datasource="jrgm" maxrows="1">
          	SELECT Sum(time_worked) AS  minutes_worked_day FROM app_employee_payroll_clock 
			WHERE Employee_ID =#Employee_ID# AND ds_id = #ds_id#
                </cfquery>
          <cfquery name="get_employee_minutes_for_day_inprogress" datasource="jrgm" maxrows="1">
			SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM app_employee_payroll_clock 
			WHERE Employee_ID =#Employee_ID# AND ds_id = #ds_id# AND in_out_status =1
             </cfquery>
          <cfif get_employee_minutes_for_day.minutes_worked_day EQ "" AND get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress EQ "">
            <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
          </cfif>
          <cfif get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress NEQ "">
            <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
              <CFSET get_employee_minutes_for_day.minutes_worked_day =0>
            </cfif>
            <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day#+#get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress# >
            <cfelse>
            <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day# >
          </cfif>
          <cfset hours = int(totalminutes\60)>
          <cfset minutes = int(totalminutes mod 60)>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#hours#:#NumberFormat(minutes,"09")#</cfoutput></td>
        </tr>
      </table>
      <cfif IsDefined("url.delete")>
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td align="left" class="dailysheetEdit"> Are you sure you want to delete <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet? <br />
              <cfoutput><a href="daily_sheet_edit_employee_time1.cfm?deleteme=yes&Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&branch=#url.branch#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&branch=#url.branch#" class="YesNoButton">No</a>
                <p  class="redarial"> Choosing yes will delete <strong><cfoutput>#get_employee.employeename#</cfoutput></strong> from this daily sheet. </p>
              </cfoutput> </td>
          </tr>
        </table>
        <cfabort>
      </cfif>
      <cfif IsDefined("url.deleterow")>
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td align="left" class="dailysheetEdit"> Are you sure you want to delete this row for <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet? <br />
              <cfoutput><a href="daily_sheet_edit_employee_time1.cfm?deletemerow=yes&Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&rowid=#rowid#&branch=#url.branch#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&branch=#url.branch#" class="YesNoButton">No</a>
                <p  class="redarial"> Choosing yes will delete this row for <strong><cfoutput>#get_employee.employeename#</cfoutput></strong> from this daily sheet. </p>
              </cfoutput> </td>
          </tr>
        </table>
        <cfabort>
      </cfif>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><table border="0" cellpadding="0" cellspacing="0" >
              <form  method="post" action="daily_sheet_edit_employee_time1.cfm?branch=<cfoutput>#url.branch#</cfoutput>"   >
                <cfoutput query="get_employee_time" startrow="1" maxrows="1">
                  <tr>
                    <td align="right" nowrap="nowrap" class="dailysheetEdit">Time In:</td>
                    <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                        <input id="timepicker1" type="text" class="input-small" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#" />
                        <span class="add-on"><i class="icon-time"></i></span> </div></td>
                    <td align="right" nowrap="nowrap" class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
                    <td align="right" nowrap="nowrap" class="dailysheetEdit">Time Out :</td>
                    <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                        <input id="timepicker2" type="text" class="input-small" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="add-on"><i class="icon-time"></i></span> </div></td>
                    <td class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
                    <td align="right"valign="top" class="dailysheetEdit"><input name="submit" type="submit" class="materialsbutton" id="submit" value="Submit" /></td>
                    <td align="right"valign="top" class="dailysheetEdit"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#&branch=#url.branch#"><img src="images/deleteButton.gif" width="40" height="36" alt="Delete" /></a></td>
                  </tr>
                  <input type="hidden" name="row_ID"   value="#get_employee_time.ID#" />
                  <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                  <input type="hidden" name="ds_id"   value="#DS_ID#" />
                  <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
                </cfoutput>
              </form>
              <form  method="post" action="daily_sheet_edit_employee_time1.cfm"  >
                <cfoutput query="get_employee_time" startrow="2" maxrows="1">
                  <tr>
                    <td align="right" nowrap="nowrap" class="dailysheetEdit">Time In:</td>
                    <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                        <input id="timepicker3" type="text" class="input-small" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#" />
                        <span class="add-on"><i class="icon-time"></i></span> </div></td>
                    <td align="right" nowrap="nowrap" class="statusTD">&nbsp;</td>
                    <td align="right" nowrap="nowrap" class="statusTD">Time Out :</td>
                    <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                        <input id="timepicker4" type="text" class="input-small" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="add-on"><i class="icon-time"></i></span> </div></td>
                    <td class="dailysheetEdit">&nbsp;</td>
                    <td align="right"valign="top" class="dailysheetEdit"><input type="submit" name="submit" class="materialsbutton" id="submit" value="Submit" /></td>
                    <td align="right"valign="top" class="dailysheetEdit"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#&branch=#url.branch#"><img src="images/deleteButton.gif" width="40" height="36" alt="Delete" /></a></td>
                  </tr>
                  <input type="hidden" name="row_ID"   value="#get_employee_time.ID#" />
                  <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                  <input type="hidden" name="ds_id"   value="#DS_ID#" />
                  <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
                </cfoutput>
              </form>
              <cfif get_employee_time.recordcount GT 2>
                <form  method="post" action="daily_sheet_edit_employee_time1.cfm"   onsubmit="setTimeout('window.close()',1000)">
                  <cfoutput query="get_employee_time" startrow="3" maxrows="1">
                    <tr>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">Time Out:</td>
                      <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                          <input id="timepicker5" type="text" class="input-small" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#" />
                          <span class="add-on"><i class="icon-time"></i></span> </div></td>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">&nbsp;</td>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">Time Out :</td>
                      <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                          <input id="timepicker6" type="text" class="input-small" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                          <span class="add-on"><i class="icon-time"></i></span> </div></td>
                      <td class="dailysheetEdit">&nbsp;</td>
                      <td align="right"valign="top" class="dailysheetEdit"><input type="submit" name="submit" class="materialsbutton" id="submit" value="Submit" /></td>
                      <td align="right"valign="top" class="dailysheetEdit"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#&branch=#url.branch#"><img src="images/deleteButton.gif" width="40" height="36" alt="Delete" /></a></td>
                    </tr>
                    <input type="hidden" name="row_ID"   value="#get_employee_time.ID#" />
                    <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                    <input type="hidden" name="ds_id"   value="#DS_ID#" />
                    <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
                  </cfoutput>
                </form>
              </cfif>
              <cfif get_employee_time.recordcount GT 3>
                <form  method="post" action="daily_sheet_edit_employee_time1.cfm?branch=<cfoutput>#url.branch#</cfoutput>"   >
                  <cfoutput query="get_employee_time" startrow="4" maxrows="1">
                    <tr>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">Time In:</td>
                      <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                          <input id="timepicker7" type="text" class="input-small" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#" />
                          <span class="add-on"><i class="icon-time"></i></span> </div></td>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">&nbsp;</td>
                      <td align="right" nowrap="nowrap" class="dailysheetEdit">Time Out :</td>
                      <td class="dailysheetEdit"><div class="input-append bootstrap-timepicker">
                          <input id="timepicker8" type="text" class="input-small" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                          <span class="add-on"><i class="icon-time"></i></span> </div></td>
                      <td class="dailysheetEdit">&nbsp;</td>
                      <td align="right"valign="top" class="dailysheetEdit"><input type="submit" name="submit" class="materialsbutton" id="submit" value="Submit" /></td>
                      <td align="right"valign="top" class="dailysheetEdit"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#&branch=#url.branch#"><img src="images/deleteButton.gif" width="40" height="36" alt="Delete" /></a></td>
                    </tr>
                    <input type="hidden" name="row_ID"   value="#get_employee_time.ID#" />
                    <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                    <input type="hidden" name="ds_id"   value="#DS_ID#" />
                    <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
                  </cfoutput>
                </form>
              </cfif>
              <tr> </tr>
              <tr> <cfoutput>
                  <td colspan="6" align="left" nowrap="nowrap" class="greentype"><a href="daily_sheet_edit_employee_time1.cfm?addrow=yes&ds_id=#ds_id#&Employee_ID=#Employee_ID#&branch=#url.branch#"><img src="images/add.png" width="20" height="20" /></a>&nbsp;&nbsp;Add
                    <cfif get_employee_time.recordcount EQ 0>
                      a new
                      <cfelse>
                      another
                    </cfif>
                    row</td>
                </cfoutput> </tr>
            </table></td>
          <td valign="top" class="details_desc"><img src="images/clear.gif" alt="" width="60" height="1" /> </td>
          <td valign="top" class="details_desc"><div class="details_title">
             </div>
            <p><br />
            </p></td>
        </tr>
      </table>
      <table border="0" cellspacing="5" cellpadding="0">
        <tr> <cfoutput>
            <td><a href="daily_sheet_edit_employee_time1.cfm?ds_id=#ds_id#&Employee_ID=#Employee_ID#&delete=yes&branch=#url.branch#"  class="removebutton">Remove this Employee</a></td>
            <td>&nbsp;</td>
            <td><a href="daily_sheet_edit.cfm?dsid=#ds_id#&branch=#url.branch#" class="dssbutton" >Back to Daily Sheet</a></td>
          </cfoutput> </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" align="center"><cfoutput><span class="redarial"><strong>#message#</strong></span></cfoutput>&nbsp;</td>
        </tr>
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
<script type="text/javascript">
$('#timepicker7').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker8').timepicker({
   defaultTime: false
});
 </script>
<script type="text/javascript">
$('#timepicker9').timepicker();
</script>
<script type="text/javascript">
$('#timepicker10').timepicker();
</script>
</body>
</html>
