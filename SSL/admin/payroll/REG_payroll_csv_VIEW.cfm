<CFIF IsDefined("url.pay_period_number")>
  <cfset pay_period_number = #url.pay_period_number#>
  <cfelse>
  <cfset pay_period_number= #pay_period_number#>
</CFIF>
<cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
<CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
<CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
<CFSET MIDPLUS1_DATE =  dateadd("d",7,app_payroll_periods.pay_period_start)>
<CFSET pay_period_endPLUS1_DATE =  dateadd("d",1,pay_period_end)>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset Now_Time = Now()>
<CFSET todaydate_DS =  DateFormat(now(), "mm/ddyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<CFSET begin_date = '#pay_period_start#'>
<CFSET end_date = '#pay_period_end#'>
<cfset end_date_plus1 = dateadd("d",1,end_date)>
<cfparam name="employee_total" default="0">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="type""text/css" href="css/print.css" media="print" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<table  border="0" cellpadding="2" cellspacing="0">
  <cfoutput query="app_payroll_periods">
    <tr class="job_data">
      <td><strong> Payroll Period #DateFormat("#begin_date#", "mm/dd/yy")#- #DateFormat("#pay_period_end#", "mm/dd/yy")#</strong></td>
    </tr>
  </cfoutput>
</table>
<cfquery name="get_employees_with_time" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE  app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#  AND FWW <> 1  AND APP_employees.branch ='#url.branch#'
		ORDER by APP_employees.last_name
 </cfquery>
<cfif get_employees_with_time.recordcount EQ 0>
  <br />
  There are no employees with time for this period.
  <cfabort>
</cfif>
<table   border="0" cellspacing="0" cellpadding="0" class="sortable" >
  <tbody>
    <tr>
      <td>Co Code</td>
      <td>Batch ID</td>
      <td>First Name</td>
      <td>Last Name</td>
      <td>File #</td>
      <td align="center" class="yellowaltrt" ><span class="datesm">REG Hours</span></td>
      <td align="center" class="yellowaltrt" ><span class="datesm">OT Hours</span></td>
    </tr>
    <CFSET mylist ="">
    <cfloop query="get_employees_with_time">
      <cfset myList = ListAppend(mylist,Employee_ID)>
    </cfloop>
    <cfquery name="get_all_employee_time_for_period" datasource="jrgm" >
	SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#mylist#) AND app_employee_payroll_clock.Time_In > '#DateFormat(pay_period_start, "yyyy-mm-dd")# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
 AND in_out_status =2
  </cfquery>
    <cfparam name="current_date" default="1">
    <cfloop query="get_employees_with_time" >
      <tr>
        <td nowrap="nowrap">AZW</td>
        <cfoutput>
          <cfif BRANCH EQ 'Richmond' >
            <CFSET branchcode =10>
            <cfelseif BRANCH EQ 'Portsmouth' >
            <CFSET branchcode =20>
            <cfelseif BRANCH EQ 'Charlottesville' >
            <CFSET branchcode =30>
            <cfelseif BRANCH EQ 'Williamsburg' >
            <CFSET branchcode =70>
            <cfelseif BRANCH EQ 'Chesterfield' >
            <CFSET branchcode =80>
            <cfelseif BRANCH EQ 'Newport News' >
            <CFSET branchcode =90>
            <cfelse>
            <CFSET branchcode ='Unknown'>
          </cfif>
          <td nowrap="nowrap">#branchcode#</td>
          <td nowrap="nowrap">#get_employees_with_time.first_name# </td>
          <td nowrap="nowrap">#get_employees_with_time.last_name# </td>
            <cfif  get_employees_with_time.Employee_ID EQ  10561><td>1056</td>
              <cfelseif  get_employees_with_time.Employee_ID EQ  15971><td>1597</td>
                <cfelseif  get_employees_with_time.Employee_ID EQ  29661><td>2966</td>
              <cfelseif  get_employees_with_time.Employee_ID EQ  15761><td>1576</td>
                <cfelseif  get_employees_with_time.Employee_ID EQ  27621><td>2762</td>
                <cfelseif  get_employees_with_time.Employee_ID EQ  26871><td>2687</td>
                <cfelseif  get_employees_with_time.Employee_ID EQ  15581><td>1558</td>
                 <cfelseif  get_employees_with_time.Employee_ID EQ  10581><td>1058</td>
                   <cfelseif  get_employees_with_time.Employee_ID EQ  11261><td>1126</td>
              <cfelse>
		<td> #get_employees_with_time.Employee_ID#</td></cfif>
        </cfoutput>
        <CFSET employee_total = 0>
        <cfloop from="#begin_date#" to="#end_Date#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
          <CFSET idate = #DateFormat("#i#", "mm/ddyy")#>
          <cfquery name="get_employee_time_by_day"  dbtype="query">
				SELECT Employee_ID, SUM(time_worked) As sumdailytime, in_out_status,ds_date 
				 FROM get_all_employee_time_for_period
				 WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND ds_date = '#DateFormat(i, "mm/dd/yyyy")#'
				  AND in_out_status =2
 				GROUP by Employee_ID, ds_date, in_out_status
				 ORDER by ds_date DESC 
				</cfquery>
          <cfif  get_employee_time_by_day.recordcount EQ 0>
            <cfelse>
            <cfoutput query="get_employee_time_by_day" >
              <cfset hours = int(sumdailytime\60)>
              <cfset minutes = int(sumdailytime mod 60)>
              <cfset employee_total = sumdailytime +employee_total>
              <cfif (get_employee_time_by_day.ds_date EQ i) >
              </cfif>
            </cfoutput>
          </cfif>
        </cfloop>
        <cfoutput>
          <cfset hourst = int(employee_total\60)>
          <cfset minutest = int(employee_total mod 60)>
        </cfoutput>
        <cfquery name="get_employee_time_sum_w1" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
				app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > #begin_date#    
          		  AND app_employee_payroll_clock.Time_Out < '#DateFormat(midplus1_date, "yyyy-mm-dd")# 00:00:00.000' AND in_out_status =2  GROUP by Employee_ID
      		   </cfquery >
        <cfif  get_employee_time_sum_w1.recordcount EQ 0>
          <cfelse>
          <cfoutput query="get_employee_time_sum_w1">
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
          </cfoutput>
        </cfif>
        <cfquery name="get_employee_time_sum_w2" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
			app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > '#DateFormat(midplus1_date, "yyyy-mm-dd")# 00:00:00.000'   AND app_employee_payroll_clock.Time_Out < #pay_period_endPLUS1_DATE#   AND in_out_status =2 GROUP by Employee_ID
         </cfquery >
        <cfif  get_employee_time_sum_w2.recordcount EQ 0>
          <!---  <td align="center" class="yellowaltrt">-</td> --->
          <cfelse>
          <cfoutput query="get_employee_time_sum_w2">
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <!---  <td align="center" class="yellowaltrt">#hourssum#:#NumberFormat(minutessum,"09")#</td> --->
          </cfoutput>
        </cfif>
        <cfif get_employee_time_sum_w1.sumtime GT 2400>
          <cfset sumtime_OT1 = (get_employee_time_sum_w1.sumtime-2400)>
          <cfset hourssum_OT1 = int(sumtime_OT1\60)>
          <cfset minutessum_OT1= int(sumtime_OT1 mod 60)>
          <cfelse>
          <cfset sumtime_OT1 = 0>
          <!--- <td align="center">0</td> --->
        </cfif>
        <!---   ------------------------------------------ --->
        <cfif get_employee_time_sum_w2.sumtime GT 2400>
          <cfset sumtime_OT2 = (get_employee_time_sum_w2.sumtime-2400)>
          <cfset hourssum_OT2= int(sumtime_OT2\60)>
          <cfset minutessum_OT2= int(sumtime_OT2 mod 60)>
          <cfelse>
          <cfset sumtime_OT2 = 0>
        </cfif>
        <cfset SUM_OT_TOTALS = sumtime_OT2 +  sumtime_OT1>
        <cfset hourssum_OT_TOTALS= int(SUM_OT_TOTALS\60)>
        <cfset minutessum_OT_TOTALS= int(SUM_OT_TOTALS mod 60)>
        <cfset SUM_reg_TOTALS = employee_total -SUM_OT_TOTALS>
        <cfset hourssum_REG_TOTALS= int(SUM_REG_TOTALS\60)>
        <cfset minutessum_REG_TOTALS= int(SUM_REG_TOTALS mod 60)>
        <CFSET base60reg =  100*minutessum_REG_TOTALS/60>
        <cfoutput>
          <td align="center">#hourssum_REG_TOTALS#.#NumberFormat(base60reg,"09")#</td>
        </cfoutput>
        <CFSET base60ot =  100*minutessum_OT_TOTALS/60>
        <cfoutput>
          <td align="center">#hourssum_OT_TOTALS#.#NumberFormat(base60ot,"09")#</td>
        </cfoutput> </tr>
    </cfloop>
  </tbody>
</table><br />
<br />
<br />
<br />

</body>
</html>
