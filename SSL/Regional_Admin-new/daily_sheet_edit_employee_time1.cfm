<!---  Apply to All Starts  Here --->
<cfif IsDefined("url.all") >
  <!---   Get times for one person --->
  <cfquery name="get_one_time" datasource="jrgm">
SELECT *  FROM app_employee_payroll_clock
 WHERE  ds_id = #url.ds_id# AND  Employee_ID = #url.Employee_ID#
  </cfquery>
  <cfquery name="get_all_employees_onthisDS" datasource="jrgm">
SELECT DISTINCT employee_id  FROM app_employee_payroll_clock
 WHERE  ds_id = #url.ds_id# AND  employee_id <> #url.Employee_ID#
  </cfquery>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_employee_payroll_clock
 WHERE   Employee_ID <>#url.Employee_ID#  AND  ds_id = #url.ds_id#
    </cfquery>
  <cfloop query="get_all_employees_onthisDS">
    <cfquery name="get_one_time" datasource="jrgm">
SELECT *  FROM app_employee_payroll_clock
 WHERE  ds_id = #url.ds_id# AND  Employee_ID = #url.Employee_ID#
  </cfquery>
    SUPERVISOR ,TIME_IN ,TIME_OUT, TIME_WORKED
    <cfloop query="get_one_time">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_employee_payroll_clock 
   (Employee_ID,ds_id,crew_leader,DS_DATE,SUPERVISOR ,TIME_IN ,	TIME_OUT, 	TIME_WORKED,ENTRY_METHOD, In_Out_Status) VALUES 
   ('#get_all_employees_onthisDS.employee_id#',#get_one_time.ds_id#,#get_one_time.CREW_LEADER#,'#get_one_time.ds_date#',
   #get_one_time.SUPERVISOR#,
   '#get_one_time.TIME_IN#',
   '#get_one_time.TIME_OUT#',
   #get_one_time.TIME_WORKED# ,
  2 ,2
   )
   </cfquery>
    </cfloop>
  </cfloop>
  <cflocation url="daily_sheet_edit.cfm?dsid=#url.ds_id#">
</cfif>
<!---  Apply to All ENDS  Here --->
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
 VALUES (#get_employee_time_from_device.Employee_ID#,#get_employee_time_from_device.crew_leader#,#get_employee_time_from_device.supervisor#,#get_employee_time_from_device.ds_id#,#get_employee_time_from_device.In_Out_Status#,#get_employee_time_from_device.In_Out_Status#,'#get_employee_time_from_device.ds_date#','#get_employee_time_from_device.time_in#','#get_employee_time_from_device.time_out#'
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
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<cfif IsDefined("url.deletemerow")>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE FROM app_employee_payroll_clock
WHERE  DS_ID =#url.ds_id# AND ID = #url.rowid#
</cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#">
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
 VALUES (#url.Employee_ID#,#get_crew_leader.empid#,#get_supervisor.empid#,#url.ds_id#,2,0,2,'#ds_date#')
 </cfquery>
</cfif>
<cfquery name="get_employee_time" datasource="jrgm">
SELECT  ID,time_In,  time_Out FROM app_employee_payroll_clock 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
ORDER by time_in ASC<!--- time_Out DESC --->
</cfquery>
<CFSET getrowcount =#get_employee_time.recordcount#>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/dsicons.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
</head>
<body>

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 


<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Employee Time Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="dailysheet_select.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
        <li><a href="daily_sheet_edit.cfm?dsid=<cfoutput>#ds_id#</cfoutput>">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
        <li class="active">Employee Time Editor</li>
      </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
   <div class="page-content">
		<div class="container-fluid">
			
			
			<!-- BEGIN PAGE CONTENT INNER -->
			
					
					
					<div class="row">
					  <div class="col-md-12">
                     <table  class="table large">
        <tr>
          <td><strong>Date: <cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput> </strong></td>
          <td><strong>DSID: <cfoutput>#DS_ID#</cfoutput></strong></td>
        </tr>
        <tr>
          <td><strong>Supervisor: <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
          <td><strong>Crew Leader: <cfoutput>#get_crew_leader.employeename#</cfoutput> </strong></td>
        </tr>
        <tr>
          <td><strong>Employee Name:<cfoutput>#get_employee.employeename# -#Employee_ID#</cfoutput></strong></td>
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
          <td><strong>Daily Total Hours: <cfoutput>#hours#:#NumberFormat(minutes,"09")#</cfoutput></strong></td>
                 </tr>
      </table></div></div>
      
      
      <cfif IsDefined("url.delete")>
      <div class="row">
	<div class="col-md-12">
        Are you sure you want to delete <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet? <br />
              <cfoutput><a href="daily_sheet_edit_employee_time1.cfm?deleteme=yes&Employee_ID=#url.Employee_ID#&ds_id=#ds_id#" class="btn btn-primary"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#" class="btn btn-primary">No</a>
                <h4  class="text-danger"> Choosing yes will delete <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet. </h4>
              </cfoutput> 
        <cfabort>
        </div></div>
      </cfif>
      <cfif IsDefined("url.deleterow")>
        <div class="row">
	<div class="col-md-12">
        Are you sure you want to delete this row for <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet? <br />
              <cfoutput><a href="daily_sheet_edit_employee_time1.cfm?deletemerow=yes&Employee_ID=#url.Employee_ID#&ds_id=#ds_id#&rowid=#rowid#" class="btn btn-primary"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_employee_time1.cfm?Employee_ID=#url.Employee_ID#&ds_id=#ds_id#" class="btn btn-primary">No</a>
                <h4  class="text-danger"> Choosing yes will delete this row for <cfoutput>#get_employee.employeename#</cfoutput> from this daily sheet. </h4>
              </cfoutput> 
        <cfabort>
         </div></div>
      </cfif>
     
       <div class="row">
	<div class="col-md-12">
      <table class="table large">
              <form  method="post" action="daily_sheet_edit_employee_time1.cfm"   >
                <cfoutput query="get_employee_time" startrow="1" maxrows="1">
                  <tr>
                    <td align="right" nowrap="nowrap">Time In:</td>
                    <td>
                    <div class="input-group">
					<input id="timepicker1"  type="text" class="form-control timepicker timepicker-no-seconds" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#">
					<span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
					 </span> </div></td>
                    <td align="right" nowrap="nowrap"></td>
                    <td align="right" nowrap="nowrap">Time Out :</td>
                    <td><div class="input-group">
                        <input id="timepicker2" type="text" class="form-control timepicker timepicker-no-seconds" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button></span> </div></td>
                    <td ></td>
                    <td align="right"valign="top"><input name="submit" type="submit" class="btn btn-primary" id="submit" value="Submit" /></td>
                    <td align="right"valign="top"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#" class="btn red">Delete</a></td>
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
                    <td align="right" nowrap="nowrap">Time In:</td>
                    <td>
                    <div class="input-group">
					<input id="timepicker3"  type="text" class="form-control timepicker timepicker-no-seconds" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#">
					<span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
					 </span> </div></td>
                    <td align="right" nowrap="nowrap"></td>
                    <td align="right" nowrap="nowrap">Time Out :</td>
                    <td><div class="input-group">
                        <input id="timepicker4" type="text" class="form-control timepicker timepicker-no-seconds" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button></span> </div></td>
                    <td>&nbsp;</td>
                    <td align="right"valign="top"><input type="submit" name="submit" class="btn btn-primary" id="submit" value="Submit" /></td>
                    <td align="right"valign="top"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#" class="btn red">Delete</a></td>
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
                      <td align="right" nowrap="nowrap">Time Out:</td>
                      <td>
                    <div class="input-group">
					<input id="timepicker5"  type="text" class="form-control timepicker timepicker-no-seconds" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#">
					<span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
					 </span> </div></td>
                    <td align="right" nowrap="nowrap"></td>
                    <td align="right" nowrap="nowrap">Time Out :</td>
                    <td><div class="input-group">
                        <input id="timepicker6" type="text" class="form-control timepicker timepicker-no-seconds" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button></span> </div></td>
                      <td>&nbsp;</td>
                      <td align="right"valign="top"><input type="submit" name="submit" class="btn btn-primary" id="submit" value="Submit" /></td>
                      <td align="right"valign="top"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#" class="btn red">Delete</a></td>
                    </tr>
                    <input type="hidden" name="row_ID"   value="#get_employee_time.ID#" />
                    <input type="hidden" name="ds_date"   value="#DateFormat(get_ds_info.ds_date, "yyyy-mm-dd")#" />
                    <input type="hidden" name="ds_id"   value="#DS_ID#" />
                    <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
                  </cfoutput>
                </form>
              </cfif>
              <cfif get_employee_time.recordcount GT 3>
                <form  method="post" action="daily_sheet_edit_employee_time1.cfm"   >
                  <cfoutput query="get_employee_time" startrow="4" maxrows="1">
                    <tr>
                      <td align="right" nowrap="nowrap">Time In:</td>
                      <td>
                    <div class="input-group">
					<input id="timepicker7"  type="text" class="form-control timepicker timepicker-no-seconds" name="time_In#currentrow#" value="#TimeFormat(time_In,"short")#">
					<span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
					 </span> </div></td>
                    <td align="right" nowrap="nowrap"></td>
                    <td align="right" nowrap="nowrap">Time Out :</td>
                    <td><div class="input-group">
                        <input id="timepicker8" type="text" class="form-control timepicker timepicker-no-seconds" name="time_Out#currentrow#" value="#TimeFormat(time_Out,"short")#" />
                        <span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button></span> </div></td>
                      <td>&nbsp;</td>
                      <td align="right"valign="top"><input type="submit" name="submit" class="btn btn-primary" id="submit" value="Submit" /></td>
                      <td align="right"valign="top"><a href="daily_sheet_edit_employee_time1.cfm?deleterow=yes&rowid=#get_employee_time.id#&ds_id=#ds_id#&EMPLOYEE_ID=#EMPLOYEE_ID#" class="btn red">Delete</a></td>
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
                  <td colspan="6" align="left" nowrap="nowrap"><a href="daily_sheet_edit_employee_time1.cfm?addrow=yes&ds_id=#ds_id#&Employee_ID=#Employee_ID#" class="text-dsadd"><i class="fa-green fa-plus-square"></i>Add
                    <cfif get_employee_time.recordcount EQ 0>
                      a new
                      <cfelse>
                      another
                    </cfif>
                    row</a></td>
                </cfoutput> </tr>
            </table></div></div>
            
            
    <div class="row">
	<div class="col-md-4">
   <cfoutput><a href="daily_sheet_edit_employee_time1.cfm?ds_id=#ds_id#&Employee_ID=#Employee_ID#&delete=yes"  class="btn red">Remove this Employee</a></cfoutput>
   </div>
   
   <div class="col-md-4">
   <cfoutput><a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="btn btn-primary" >Back to Daily Sheet</a></cfoutput>
   </div>
 
<!---  <cfif  Session.userid EQ 1433  OR  Session.userid EQ 1001026> --->
  <div class="col-md-4">
   <cfoutput>
          <a href="daily_sheet_edit_employee_time1.cfm?ds_id=#ds_id#&Employee_ID=#Employee_ID#&all=yes" class="btn btn-primary" >Use for ALL Employees on this Daily Sheet</a>
        </cfoutput></div></div>
     <!---    </cfif> --->
        
         <div class="row">
	<div class="col-md-4">
	<cfoutput><span class="redarial"><strong>#message#</strong></span></cfoutput>
    </div></div>
        

                       
					
			</div>			
		</div>
	  </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
        jQuery(document).ready(function() {       
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>