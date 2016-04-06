  <CFIF IsDefined("url.pay_period_number")>
  <cfset pay_period_number = url.pay_period_number>
  <cfelse>
  <cfset pay_period_number= pay_period_number>
</CFIF>
  
<cfquery name="pay_period_week1_date" datasource="jrgm">
SELECT  MIN(pay_period_week) as  pay_period_week
FROM app_pay_periods WHERE pay_period_number =#pay_period_number#
</cfquery>
<cfquery name="pay_period_week2_date" datasource="jrgm">
SELECT   MAX(pay_period_week) AS   pay_period_week
FROM app_pay_periods WHERE pay_period_number =#pay_period_number#
</cfquery>
 
<cfset pay_period_week1 =pay_period_week1_date.pay_period_week>
<cfset pay_period_week2 =pay_period_week2_date.pay_period_week> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="type""text/css" href="css/print.css" media="print" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="JavaScript"></script>
</head>
<body bgcolor="#FFFFFF">
<cfquery name="get_payroll_period_dates" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number =#pay_period_number#
 </cfquery>
<cfset pay_period_start = get_payroll_period_dates.pay_period_start>
<cfset pay_period_end =   get_payroll_period_dates.pay_period_end>
<cfset pay_period_end = dateadd("d",1,pay_period_end)>  

 <table  border="0" cellpadding="2" cellspacing="0">
 <cfoutput>
  <tr class="job_data">
 <td><strong> Payroll Period #DateFormat("#pay_period_start#", "mm/dd/yy")#-
 #DateFormat("#get_payroll_period_dates.pay_period_end#", "mm/dd/yy")#</strong></td>
    </tr>
  </cfoutput>
 </table>
 <cfquery name="get_employees_with_time" datasource="jrgm" >
SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
app_employee_payroll_clock  INNER JOIN APP_employees
ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
WHERE  app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #pay_period_end#  AND   FWW =1
ORDER by APP_employees.last_name
 </cfquery>
<cfif get_employees_with_time.recordcount EQ 0>
  <br />
  There are no employees with time for ths period.
  <cfabort>
</cfif>
<cfquery name="app_payroll_periods_Week1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>
<cfset pay_period_start_week1 = app_payroll_periods_Week1.pay_period_start>
<cfset pay_period_end_week1 =   app_payroll_periods_Week1.pay_period_end>
<cfset pay_period_end_week1 = dateadd("d",1,pay_period_end_week1)>  
<table   border="0" cellspacing="0" cellpadding="0"   class="sortable" >
  <tbody>
    <tr>
      <td>Co Code</td>
      <td>Batch ID</td>
      <td>First Name</td>
      <td>Last Name</td>
      <td>File #</td>
      <td align="center" ><span class="datesm">REG Hours</span></td>
      <td align="center" ><span class="datesm">OT Hours</span></td>
    </tr>
    <cfloop query="get_employees_with_time">
      <cfparam name="current_date" default="1">
      <tr>
        <td nowrap="nowrap">AZW</td>
        <cfoutput>
          <td nowrap="nowrap">FWW</td>
          <td nowrap="nowrap">#get_employees_with_time.first_name# </td>
          <td nowrap="nowrap">#get_employees_with_time.last_name# </td>
          <td>#get_employees_with_time.Employee_ID#</td>
        </cfoutput>
        <cfset employee_total = 0>
        <cfquery name="get_employee_time_sum_w1" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > #pay_period_start_week1# AND  app_employee_payroll_clock.Time_In < #pay_period_end_week1# AND in_out_status =2  GROUP by Employee_ID
      		   </cfquery >
        <cfif  get_employee_time_sum_w1.recordcount EQ 0>
          <cfelse>
          <cfoutput query="get_employee_time_sum_w1">
         <cfset  employee_total =  sumtime>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
          </cfoutput>
        </cfif>
        <cfif get_employee_time_sum_w1.sumtime GT 2400>
          <cfset sumtime_OT1 = (get_employee_time_sum_w1.sumtime-2400)>
          <cfset hourssum_OT1 = int(sumtime_OT1\60)>
          <cfset minutessum_OT1= int(sumtime_OT1 mod 60)>
          <cfelse>
          <cfset sumtime_OT1 = 0>
         </cfif>
        <cfset sum_ot_totals =   sumtime_OT1>
        <cfset hourssum_OT_TOTALS= int(sum_ot_totals\60)>
        <cfset minutessum_OT_TOTALS= int(sum_ot_totals mod 60)>
        
        <cfset sum_reg_totals = employee_total -sum_ot_totals>
        <cfset hourssum_reg_totals= int(SUM_REG_TOTALS\60)>
        <cfset minutessum_reg_totals= int(SUM_REG_TOTALS mod 60)>
        <cfset base60reg =  100*minutessum_reg_totals/60>
        <cfoutput>
          <td align="center">#hourssum_reg_totals#.#NumberFormat(base60reg,"09")#</td>
        </cfoutput>
        <cfset base60ot =  100*minutessum_OT_TOTALS/60>
        <cfoutput>
          <td align="center">#hourssum_OT_TOTALS#.#NumberFormat(base60ot,"09")#</td>
        </cfoutput> </tr>
      <cfquery name="app_payroll_periods_Week2" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>
  <cfset pay_period_start_week2 = app_payroll_periods_Week2.pay_period_start>
<cfset pay_period_end_week2 =   app_payroll_periods_Week2.pay_period_end>
<cfset pay_period_end_week2 = dateadd("d",1,pay_period_end_week2)>  
      <cfparam name="current_date" default="1">
      <tr>
        <td nowrap="nowrap">AZW</td>
        <cfoutput>
          <td nowrap="nowrap"> FWW</td>
          <td nowrap="nowrap">#get_employees_with_time.first_name# </td>
          <td nowrap="nowrap">#get_employees_with_time.last_name# </td>
          <td>#get_employees_with_time.Employee_ID#</td>
        </cfoutput>
        <cfset employee_total = 0>
<cfquery name="get_employee_time_sum_w2" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > 	#pay_period_start_week2# AND  app_employee_payroll_clock.Time_In < #pay_period_end_week2#  AND in_out_status =2  GROUP by 				Employee_ID
</cfquery >
        <cfif  get_employee_time_sum_w2.recordcount EQ 0>
          <cfelse>
          <cfoutput query="get_employee_time_sum_w2">
           <cfset  employee_total =  sumtime>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
          </cfoutput>
        </cfif>
        <cfif get_employee_time_sum_w2.sumtime GT 2400>
          <cfset sumtime_OT2 = (get_employee_time_sum_w2.sumtime-2400)>
          <cfset hourssum_OT2 = int(sumtime_OT2\60)>
          <cfset minutessum_OT2= int(sumtime_OT2 mod 60)>
          <cfelse>
          <cfset sumtime_OT2 = 0>
        </cfif>
        <cfset sum_ot_totals =   sumtime_OT2>
        <cfset hourssum_OT_TOTALS= int(sum_ot_totals\60)>
        <cfset minutessum_OT_TOTALS= int(sum_ot_totals mod 60)>
        <cfset sum_reg_totals = employee_total -sum_ot_totals>
        <cfset hourssum_reg_totals= int(SUM_REG_TOTALS\60)>
        <cfset minutessum_reg_totals= int(SUM_REG_TOTALS mod 60)>
        <cfset base60reg =  100*minutessum_reg_totals/60>
        <cfoutput>
          <td align="center">#hourssum_reg_totals#.#NumberFormat(base60reg,"09")#</td>
        </cfoutput>
        <cfset base60ot =  100*minutessum_OT_TOTALS/60>
        <cfoutput>
          <td align="center">#hourssum_OT_TOTALS#.#NumberFormat(base60ot,"09")#</td>
        </cfoutput>
         </tr>
    </cfloop>
  </tbody>
</table>
<br />
<br />
<br />
<br />
</div>
</body>
</html>
