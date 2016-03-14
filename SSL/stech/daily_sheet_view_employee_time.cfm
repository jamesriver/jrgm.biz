 
 
  
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
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID],  [Employee ID] AS empid, [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]= #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] AS empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]= #get_ds_info.crew_leader_id#  
</cfquery> 

  
  
 
<cfquery name="get_employee_time" datasource="jrgm">
SELECT  ID,time_In,  time_Out FROM app_employee_payroll_clock 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
ORDER by time_IN ASC
</cfquery>
  
 

  
  
<CFSET getrowcount =#get_employee_time.recordcount#>
<!--- <cfdump var="#get_employee_time#"> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
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
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Employee Time <br />
      </div>
      <table   border="0" cellpadding="3" cellspacing="3" class="dailysheet_table_top" >
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont">Date : </span></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput><span class="arialfont">#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</span></cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont">&nbsp;&nbsp; &nbsp; </span></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont">DSID:</span></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput><span class="arialfont">#DS_ID#</span></cfoutput></td>
        </tr>
        <tr>
          <td align="left" class="dailysheetEditTop"><span class="arialfont">Supervisor : </span></td>
          <td align="left" class="dailysheetEditTop"><cfoutput><span class="arialfont">#get_supervisor.employeename#</span></cfoutput></td>
          <td align="left" class="dailysheetEditTop">&nbsp;</td>
          <td align="left" class="dailysheetEditTop" ><span class="arialfont">Crew Leader : </span></td>
          <td align="left" class="dailysheetEditTop" ><cfoutput><span class="arialfont">#get_crew_leader.employeename#</span></cfoutput></td>
        </tr>
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont"><strong>Employee Name: </strong></span></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont"><strong><cfoutput>#get_employee.employeename# -#Employee_ID#</cfoutput></strong></span></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><span class="arialfont">Daily Total Hours :</span></td>
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
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput><span class="arialfont">#hours#:#NumberFormat(minutes,"09")#</span></cfoutput></td>
</tr>
      </table>
      <table border="0" cellspacing="0" cellpadding="2">
        <tr>
          <td valign="top"><table border="0" cellpadding="5" cellspacing="0" >
              
                <cfoutput query="get_employee_time" >
                  <tr class="arialfont">
                    <td align="right" nowrap="nowrap" class="dailysheetEdit">Time In:</td>
                    <td class="dailysheetEdit"> 
          #TimeFormat(time_In,"short")#
                     </td>
                     <td align="right" nowrap="nowrap" class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
                    <td align="right" nowrap="nowrap" class="dailysheetEdit">Time Out :</td>
                    <td class="dailysheetEdit">
                     #TimeFormat(time_Out,"short")#
 				</td>
                    <td class="dailysheetEdit"><img src="images/clear.gif" alt="" width="20" height="1" /></td>
                    <td align="right"valign="top" class="dailysheetEdit">&nbsp;</td>
                    <td align="right"valign="top" class="dailysheetEdit">&nbsp;</td>
                  </tr>
              </cfoutput>
            
              <tr>
          </table></td>
          
        </tr>
      </table>
        <br />
       <table border="0" cellspacing="5" cellpadding="0">
        <tr>
    <cfoutput>  
    
    <td><a href="daily_sheet.cfm?dsid=#ds_id#" class="dssbutton" >Back to Daily Sheet</a></td></cfoutput>
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

 
 

 
</body>
</html>
