   <cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  *
 FROM app_pay_periods WHERE pay_period_number = #url.pay_period_number#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET MIDPLUS1_DATE =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 


<cfparam name="message" default="">

 <cfif IsDefined("form.ds_id")><CFSET Session.mydsidlist = #form.ds_id#></cfif>
   
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>

<cfset Now_Time = Now()>

<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_7PM = createDatetime(y,m,d,19,0,0)>
 <cfset timenow = Now()>

 <cfset somedate = todayDate>
 <cfset yesterday = dateadd("d",-1,somedate)>
 <cfset tomorrow = dateadd("d",1,somedate)>

 <cfif IsDefined("form.empid")>
  <CFSET Employee_ID= form.empid>
  <cfelseif IsDefined("url.empid")>
  <CFSET Employee_ID= url.empid>
</cfif>

 

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
 <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="javascript"></script>
	 
    <style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
   .search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;	
}
</style>

<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
           <td nowrap="nowrap"><div class="header">Payroll Detail, starting <cfoutput>#DateFormat("#pay_period_start#", "mm/dd/yyyy")#</cfoutput> </div>
  <div class="subheader"><cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name# 
     &nbsp; &nbsp;Branch: #get_employees_name.branch#  &nbsp;&nbsp;   Employee ID : #empid# </cfoutput></div></td>
          <td nowrap="nowrap" class="header" width="300">&nbsp;</td>
  <td nowrap="nowrap"  align="right"><a href="payroll_view_employee_detail_2week.cfm" class="btn-info">Back to List</a></td>
        </tr>
      </table> 
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
        <tr>
          <th align="left">Pay Period Totals</th>
          <th align="left">Hours</th>
         
        </tr>
        </thead>
        <tbody>
         <cfif   timenow GT today_7PM>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000'   AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         
         <cfelse>
        <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000' AND    ds_date < '#todaydate_DS#' AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         </cfif>
        <cfoutput query="get_employee_time_sum">
          <tr>
          <td>Regular</td>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td align="left">#hourssum#:#NumberFormat(minutessum,"09")#</td>
           </tr>
        </cfoutput>
        </tbody>
      </table>
      <br /> <cfif   timenow GT today_7PM>
       <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000'  AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
      
      <cfelse>
 <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' 00:00:00.000'  AND    ds_date < '#todaydate_DS#' AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
        </cfif>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
    <thead> 
         <tr>
         <th align="left">Day</th>
          <th align="left">Date</th> 
          <th align="left">DSID</th>
          <th align="left">Time<br />Worked</th>
          <th align="left">Time<br />Worked  </th>
          </tr>
        </thead>
        <tbody>
        <cfoutput query="get_employee_time_by_day">
          <tr>
           <td>#DateFormat(ds_date, "dddd")#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td> 
            <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a> </td>
              <td>#sumdailytime#</td>
            <cfset hours = int(sumdailytime\60)>
            <cfset minutes = int(sumdailytime mod 60)>
            <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
      <cfquery name="is_already_approved" datasource="jrgm">
      SELECT  payroll_approved
       FROM app_employee_payroll_clock
     WHERE Employee_ID =#empid#  AND ds_id = #ds_id#
         </cfquery>
         </tr>  
		  </cfoutput>
        
        </tbody>
      </table>
        
      
      <table width="800" border="0" cellspacing="3" cellpadding="0">
  <tr>
    <td align="right" height="40"> <cfoutput> <span class="arialfont"><strong>#message#</strong></span></cfoutput> </td>
  </tr>
</table>

   
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
