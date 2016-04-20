<!---  <CFIF IsDefined("url.pay_period_number")>
  <cfset pay_period_number = #url.pay_period_number#>
  <cfelse>
  <cfset pay_period_number= #pay_period_number#>
</CFIF>
  --->

 
 
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

<cfparam name="employee_total" default="0">
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<LINK rel="stylesheet" type"text/css" href="css/print.css" media="print">
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="JavaScript"></script>

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm"> 
     <!--centre content goes here -->
    <div class="centrecontent_inner">
 <!------------------------  Week 1  ----------------------------->
 <cfquery name="app_payroll_periods_Week1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = 9
 </cfquery>  
  <CFSET pay_period_start_week1 = #app_payroll_periods_Week1.pay_period_start#>
 <CFSET pay_period_end_week1 =   #app_payroll_periods_Week1.pay_period_end#>
 <CFSET MIDPLUS1_DATE_week1 =  dateadd("d",8,app_payroll_periods_Week1.pay_period_start)>
 <CFSET pay_period_endPLUS1_DATE_week1 =  dateadd("d",1,app_payroll_periods_Week1.pay_period_end)>
  <CFSET begin_date_week1 = '#app_payroll_periods_Week1.pay_period_start#'>
<CFSET end_date_week1 = '#app_payroll_periods_Week1.pay_period_end#'>
<cfset end_date_plus1 = dateadd("d",1,end_date_week1)>  
      <table width="100%"  border="0" cellpadding="2" cellspacing="0">
 <cfoutput query="app_payroll_periods_Week1"> <tr class="job_data">
    <td><strong> Payroll Period #DateFormat("#app_payroll_periods_Week1.pay_period_start#", "mm/dd/yy")#-
     #DateFormat("#app_payroll_periods_Week1.pay_period_end#", "mm/dd/yy")#</strong></td>
    </tr>
  </cfoutput>
 </table>
  <cfquery name="get_employees_with_time" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE  app_employee_payroll_clock.Time_In > '#DateFormat(app_payroll_periods_Week1.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_week1#  AND FWW =1
		ORDER by APP_employees.last_name
 </cfquery>
  <cfif get_employees_with_time.recordcount EQ 0>
  <br />
There are no employees with time for ths period. 
 <cfabort>
  </cfif>
     <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable" >
           <cfoutput>
           <tr>
            <td>FWW</td>
              <td>Branch</td>
             <td>Code</td>
              <td>First Name</td>
          <td>Last Name</td>  
          <td>ID</td>
            <td align="center"><span class="datesm">#DateFormat("#begin_date_week1#", "ddd mm/ddyy")#</span></td>
            <CFSET current_date = '#begin_date_week1#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            
            <td align="center"  width="75"  class="yellowaltrt" ><span class="datesm">Total</span></td>
            <td align="center"  width="75" class="yellowaltrt" ><span class="datesm">Wk 1</span></td>
               <td align="center"  width="75" class="yellowaltrt" ><span class="datesm">OT Wk 1</span></td>
              <td align="center"   width="75" class="yellowaltrt" ><span class="datesm">REG Totals</span></td>
              <td align="center"   width="75" class="yellowaltrt" ><span class="datesm">OT Totals</span></td>
              <td align="center" class="yellowaltrt" ><span class="datesm">REG Totals Decimal</span></td>
              <td align="center" class="yellowaltrt" ><span class="datesm">OT Totals Decimal</span></td>
            </tr>
        </cfoutput>
   <CFSET mylist ="">
<cfloop query="get_employees_with_time">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
   <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
	SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#mylist#) AND app_employee_payroll_clock.Time_In > '#DateFormat(app_payroll_periods_Week1.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_week1#
 AND in_out_status =2
  </cfquery> 
        <cfparam name="current_date" default="1">
        <cfloop query="get_employees_with_time" >
          <tr>
            <td nowrap="nowrap">FWW</td>
            <cfoutput>  
            <td nowrap="nowrap">#get_employees_with_time.BRANCH#&nbsp;</td>
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
               <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#" target="_blank">#get_employees_with_time.first_name#
              </a></td>  
                <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#" target="_blank">
               #get_employees_with_time.last_name# </a></td>  
              <TD>#get_employees_with_time.Employee_ID#</TD>
             </cfoutput>
             <CFSET employee_total = 0>
            <cfloop from="#begin_date_week1#" to="#end_Date_week1#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
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
                <td align="center">-</td>
                <cfelse>
                <cfoutput query="get_employee_time_by_day" >
                  <cfset hours = int(sumdailytime\60)>
                  <cfset minutes = int(sumdailytime mod 60)>
                  <cfset employee_total = sumdailytime +employee_total>
                  <cfif (get_employee_time_by_day.ds_date EQ i) >
                    <td align="center">#hours#:#NumberFormat(minutes,"09")# </td>
                  </cfif>
                 </cfoutput>
              </cfif>
            </cfloop>
            <cfoutput>
              <cfset hourst = int(employee_total\60)>
              <cfset minutest = int(employee_total mod 60)>
               <td align="center" class="yellowaltrt" >#hourst#:#NumberFormat(minutest,"09")# </td>
            </cfoutput> 
              <cfquery name="get_employee_time_sum_w1" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
				app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > '#DateFormat(app_payroll_periods_Week1.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_week1# AND in_out_status =2  GROUP by Employee_ID
      		   </cfquery >
           <cfif  get_employee_time_sum_w1.recordcount EQ 0>
             <td align="center" class="yellowaltrt">-</td>
                <cfelse>
          <cfoutput query="get_employee_time_sum_w1"> 
		  <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
           <td align="center" class="yellowaltrt">#hourssum#:#NumberFormat(minutessum,"09")#</td></cfoutput>
           </cfif>
             <cfif get_employee_time_sum_w1.sumtime GT 2400>
             <cfset sumtime_OT1 = (get_employee_time_sum_w1.sumtime-2400)>
              <cfset hourssum_OT1 = int(sumtime_OT1\60)>
            <cfset minutessum_OT1= int(sumtime_OT1 mod 60)>
           <cfoutput> <td align="center">#hourssum_OT1#:#NumberFormat(minutessum_OT1,"09")#</td></cfoutput><cfelse>  <cfset sumtime_OT1 = 0><td align="center">0</td></cfif>
             <cfset SUM_OT_TOTALS =   sumtime_OT1>
              <cfset hourssum_OT_TOTALS= int(SUM_OT_TOTALS\60)>
            <cfset minutessum_OT_TOTALS= int(SUM_OT_TOTALS mod 60)>
              <cfset SUM_reg_TOTALS = employee_total -SUM_OT_TOTALS>
              <cfset hourssum_REG_TOTALS= int(SUM_REG_TOTALS\60)>
            <cfset minutessum_REG_TOTALS= int(SUM_REG_TOTALS mod 60)>
             <cfoutput> <td align="center">#hourssum_REG_TOTALS#:#NumberFormat(minutessum_REG_TOTALS,"09")#</td></cfoutput>
            <cfoutput>    <td align="center">#hourssum_OT_TOTALS#:#NumberFormat(minutessum_OT_TOTALS,"09")#</td></cfoutput>            
           <CFSET base60reg =  100*minutessum_REG_TOTALS/60> 
                <cfoutput>    <td align="center">#hourssum_REG_TOTALS#:#NumberFormat(base60reg,"09")#</td></cfoutput>
             <CFSET base60ot =  100*minutessum_OT_TOTALS/60> 
           <cfoutput>    <td align="center">#hourssum_OT_TOTALS#:#NumberFormat(base60ot,"09")#</td></cfoutput>
              </tr>
        </cfloop>
          </tbody> 
      </table>
      <p>&nbsp;</p>
  <!------------------------  Week 2  ----------------------------->
  <cfquery name="app_payroll_periods_Week2" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = 10
 </cfquery>  
  <CFSET pay_period_start_Week2 = #app_payroll_periods_Week2.pay_period_start#>
 <CFSET pay_period_end_Week2 =   #app_payroll_periods_Week2.pay_period_end#>
 <CFSET MIDPLUS1_DATE_Week2 =  dateadd("d",8,app_payroll_periods_Week2.pay_period_start)>
 <CFSET pay_period_endPLUS1_DATE_Week2 =  dateadd("d",1,app_payroll_periods_Week2.pay_period_end)>
  <CFSET begin_date_Week2 = '#app_payroll_periods_Week2.pay_period_start#'>
<CFSET end_date_Week2 = '#app_payroll_periods_Week2.pay_period_end#'>
<cfset end_date_plus1 = dateadd("d",1,end_date_Week2)>  
      <table width="100%"  border="0" cellpadding="2" cellspacing="0">
 <cfoutput query="app_payroll_periods_Week2"> <tr class="job_data">
    <td><strong> Payroll Period #DateFormat("#app_payroll_periods_Week2.pay_period_start#", "mm/dd/yy")#-
     #DateFormat("#app_payroll_periods_Week2.pay_period_end#", "mm/dd/yy")#</strong></td>
    </tr>
  </cfoutput>
 </table>
  <cfquery name="get_employees_with_time" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE  app_employee_payroll_clock.Time_In > #app_payroll_periods_Week2.pay_period_start# AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_Week2#  AND FWW =1
		ORDER by APP_employees.last_name
 </cfquery>
  <cfif get_employees_with_time.recordcount EQ 0>
  <br />
There are no employees with time for ths period. 
 <cfabort>
  </cfif>
     <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable" >
           <cfoutput>
           <tr>
            <td>AZW</td>
              <td>Branch</td>
             <td>Code</td>
              <td>First Name</td>
          <td>Last Name</td>  
          <td>ID</td>
            <td align="center"><span class="datesm">#DateFormat("#begin_date_Week2#", "ddd mm/ddyy")#</span></td>
            <CFSET current_date = '#begin_date_Week2#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd")#</span></td>
            <CFSET current_date = '#current_date#' +1>
            
            <td align="center"  width="75"  class="yellowaltrt" ><span class="datesm">Total</span></td>
            <td align="center"  width="75" class="yellowaltrt" ><span class="datesm">Wk 1</span></td>
               <td align="center"  width="75" class="yellowaltrt" ><span class="datesm">OT Wk 1</span></td>
              <td align="center"   width="75" class="yellowaltrt" ><span class="datesm">REG Totals</span></td>
              <td align="center"   width="75" class="yellowaltrt" ><span class="datesm">OT Totals</span></td>
              <td align="center" class="yellowaltrt" ><span class="datesm">REG Totals Decimal</span></td>
              <td align="center" class="yellowaltrt" ><span class="datesm">OT Totals Decimal</span></td>
            </tr>
        </cfoutput>
   <CFSET mylist ="">
<cfloop query="get_employees_with_time">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
   <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
	SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#mylist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week2.pay_period_start# AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_Week2#
 AND in_out_status =2
  </cfquery> 
        <cfparam name="current_date" default="1">
        <cfloop query="get_employees_with_time" >
          <tr>
            <td nowrap="nowrap">AZW</td>
            <cfoutput>  
            <td nowrap="nowrap">#get_employees_with_time.BRANCH#&nbsp;</td>
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
               <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#" target="_blank">#get_employees_with_time.first_name#
              </a></td>  
                <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#" target="_blank">
               #get_employees_with_time.last_name# </a></td>  
              <TD>#get_employees_with_time.Employee_ID#</TD>
             </cfoutput>
             <CFSET employee_total = 0>
            <cfloop from="#begin_date_Week2#" to="#end_Date_Week2#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
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
                <td align="center">-</td>
                <cfelse>
                <cfoutput query="get_employee_time_by_day" >
                  <cfset hours = int(sumdailytime\60)>
                  <cfset minutes = int(sumdailytime mod 60)>
                  <cfset employee_total = sumdailytime +employee_total>
                  <cfif (get_employee_time_by_day.ds_date EQ i) >
                    <td align="center">#hours#:#NumberFormat(minutes,"09")# </td>
                  </cfif>
                 </cfoutput>
              </cfif>
            </cfloop>
            <cfoutput>
              <cfset hourst = int(employee_total\60)>
              <cfset minutest = int(employee_total mod 60)>
               <td align="center" class="yellowaltrt" >#hourst#:#NumberFormat(minutest,"09")# </td>
            </cfoutput> 
              <cfquery name="get_employee_time_sum_w1" datasource="jrgm" >
				SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
				app_employee_payroll_clock WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week2.pay_period_start# AND  app_employee_payroll_clock.Time_In < #pay_period_endPLUS1_DATE_Week2# AND in_out_status =2  GROUP by Employee_ID
      		   </cfquery >
           <cfif  get_employee_time_sum_w1.recordcount EQ 0>
             <td align="center" class="yellowaltrt">-</td>
                <cfelse>
          <cfoutput query="get_employee_time_sum_w1"> 
		  <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
           <td align="center" class="yellowaltrt">#hourssum#:#NumberFormat(minutessum,"09")#</td></cfoutput>
           </cfif>
             <cfif get_employee_time_sum_w1.sumtime GT 2400>
             <cfset sumtime_OT1 = (get_employee_time_sum_w1.sumtime-2400)>
              <cfset hourssum_OT1 = int(sumtime_OT1\60)>
            <cfset minutessum_OT1= int(sumtime_OT1 mod 60)>
           <cfoutput> <td align="center">#hourssum_OT1#:#NumberFormat(minutessum_OT1,"09")#</td></cfoutput><cfelse>  <cfset sumtime_OT1 = 0><td align="center">0</td></cfif>
             <cfset SUM_OT_TOTALS =   sumtime_OT1>
              <cfset hourssum_OT_TOTALS= int(SUM_OT_TOTALS\60)>
            <cfset minutessum_OT_TOTALS= int(SUM_OT_TOTALS mod 60)>
              <cfset SUM_reg_TOTALS = employee_total -SUM_OT_TOTALS>
              <cfset hourssum_REG_TOTALS= int(SUM_REG_TOTALS\60)>
            <cfset minutessum_REG_TOTALS= int(SUM_REG_TOTALS mod 60)>
             <cfoutput> <td align="center">#hourssum_REG_TOTALS#:#NumberFormat(minutessum_REG_TOTALS,"09")#</td></cfoutput>
            <cfoutput>    <td align="center">#hourssum_OT_TOTALS#:#NumberFormat(minutessum_OT_TOTALS,"09")#</td></cfoutput>            
           <CFSET base60reg =  100*minutessum_REG_TOTALS/60> 
                <cfoutput>    <td align="center">#hourssum_REG_TOTALS#:#NumberFormat(base60reg,"09")#</td></cfoutput>
             <CFSET base60ot =  100*minutessum_OT_TOTALS/60> 
           <cfoutput>    <td align="center">#hourssum_OT_TOTALS#:#NumberFormat(base60ot,"09")#</td></cfoutput>
              </tr>
        </cfloop>
          </tbody> 
      </table>
    </div>
    <!--Html-->
  </div>
</div>
 </div>
  </body>
</html>
 