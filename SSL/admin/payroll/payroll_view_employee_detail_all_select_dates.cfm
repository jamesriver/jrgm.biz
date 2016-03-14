 <cfparam name="message" default="">

<!--- <CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<CFSET DS_DATE_START_Begin=  dateadd("d",-365,todaydate_DS)>
 <cfparam name="DS_DATE_START" default="DS_DATE_START_Begin"> --->
 
 
<cfset Now_Time = Now()>

<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_7PM = createDatetime(y,m,d,19,0,0)>
 <cfset timenow = Now()>
 
 <cfif IsDefined("form.empid")>
  <CFSET Employee_ID= form.empid>
  <cfelseif IsDefined("url.empid")>
  <CFSET Employee_ID= url.empid>
</cfif>

<cfif IsDefined("form.branch")>
  <CFSET branch= form.branch>
  <cfelseif IsDefined("url.branch")>
  <CFSET branch= url.branch>
</cfif>

<cfif IsDefined("form.DS_DATE_START") AND form.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= form.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelseif IsDefined("url.DS_DATE_START") AND url.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= url.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelse>
<CFSET DS_DATE_START= todaydate_DS>
<CFSET DS_DATE_START =  dateadd("d",365,DS_DATE_START)>
 </cfif>

<cfif IsDefined("form.DS_DATE_END")  AND form.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= form.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
<cfelseif IsDefined("url.DS_DATE_END") AND url.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= url.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",0,DS_DATE_END)>
<cfelse>
<CFSET DS_DATE_END = todaydate_DS>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
 </cfif>

  <cfquery name="get_all_branch_ds" datasource="jrgm"     >
 SELECT ID, branch_code
FROM         app_daily_sheets<!---  WHERE branch_code = 70 --->
 </cfquery>
 
 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name,branch    FROM 
app_employees WHERE [Employee ID] = #empid#
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
  
  <script>
  $(function() {
    $( "#datepicker2" ).datepicker();
  });
  </script>

<style type="text/css">
input {
	text-align:left;
	font: bold 16px Arial, Helvetica, sans-serif;
	color: #333333;	
	padding: 4px 6px 3px 6px;
	width: 150px;
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
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="header">Employee Payroll Detail<br /><br />
 <cfoutput query="get_employees_name"><span class="lgaddress">#get_employees_name.first_name# #get_employees_name.last_name# &nbsp;&nbsp;
 Branch:#get_employees_name.branch#  &nbsp;&nbsp;   Employee ID : #empid# </span></cfoutput></td>
          <td nowrap="nowrap" class="header" width="100">&nbsp;</td>
  <td nowrap="nowrap"  align="right"><a href="select_branch.cfm?branch_name=<cfoutput>#branch#</cfoutput>" class="btn-info">Back to List</a></td> 
        </tr>
      </table> 
    <form class="css_form" action="payroll_view_employee_detail_all_select_dates.cfm" method="post">
   <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> Start Date</strong></td>
         <td class="statusTD_right">
         <input type="text" id="datepicker" name="ds_date_start"  <cfif IsDefined("form.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"</cfif> <cfif IsDefined("url.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"</cfif>/> 
            </td> 
              <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> End Date</strong></td>
          <td class="statusTD_right"><input type="text" id="datepicker2" name="ds_date_end" <cfif IsDefined("form.ds_date_end") >value="<cfoutput>#DateFormat(form.ds_date_end, "mm/dd/yyyy")#</cfoutput>"</cfif><cfif IsDefined("url.ds_date_end") >value="<cfoutput>#DateFormat(url.ds_date_end, "mm/dd/yyyy")#</cfoutput>"</cfif>/> </td>
          <td class="statusTD_right"> </td>
              <td class="statusTD_right">
 <input type="hidden" name="empid"  <cfoutput> value="#empid#"</cfoutput> /> 
  <input type="hidden" name="branch"  <cfoutput> value="#branch#"</cfoutput> /> 
<input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
            </tr>
        </table> 
       </form>
        <cfif   timenow GT today_7PM>
       <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
  GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date desc ,ds_id desc
        </cfquery>
       <cfelse>
 <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date desc ,ds_id desc
        </cfquery>
        </cfif>
     <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
    <thead> 
         <tr>
         <th align="left">Day</th>
          <th align="left">Date</th> 
          <th align="left">DSID</th>
          <th align="left">Time<br />Worked</th>
          <th align="left">Time<br />Worked</th>
           <th align="left">Branch</th>
          </tr>
        </thead>
        <tbody>
        <cfoutput query="get_employee_time_by_day">
          <tr>
           <td>#DateFormat(ds_date, "dddd")#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td> 
            <td><a href="../daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a> </td>
             <td>#sumdailytime#</td>
            <cfset hours = int(sumdailytime\60)>
            <cfset minutes = int(sumdailytime mod 60)>
            <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
            
  <cfquery name="get_branch_id"   dbtype="query">
SELECT  branch_code FROM get_all_branch_ds
WHERE  ID = #ds_id#
 </cfquery>
            
              <td align="left">#get_branch_id.branch_code#</td>
          </tr>  
		  </cfoutput>
               <tr>
           <td><strong>Pay Period Totals</strong></td>
            <td></td> 
            <td></td>
  <cfif   timenow GT today_7PM>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#      AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
          <cfelse>
        <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#     AND in_out_status =2
  <cfif IsDefined("DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
         </cfif>
             <td align="left">
             <cfoutput query="get_employee_time_sum">
             <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td align="left"><strong>#hourssum#:#NumberFormat(minutessum,"09")#</strong></td>
         </cfoutput></td>
          </tr>  
         </tbody>
      </table>
     </div>
   </div>
</div>
 </div>
<!-- end outer div -->
  <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
