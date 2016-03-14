<cfapplication name="jrgm"
ClientManagement="No"
SessionManagement="Yes"
SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
<cfparam name="SESSION.loginid" default="0">
<cfparam name="SESSION.job_id" default="0000">
<cfparam name="JOB_ID" default="0000">
<cfset theDate = #Now()#>

<!--- BEN ADDED LOGIC TO AUTOMATE --->
<cfquery name="get_payroll_info" datasource="jrgm" >
 SELECT GETUTCDATE() as today_date, pay_period_week , pay_period_number FROM app_pay_periods
 WHERE GETUTCDATE() >=  pay_period_start  AND  GETUTCDATE() <= pay_period_end
</cfquery>

<cfset first_pay_period_week1 = 97>
<cfset first_date = "2016-02-27">
<cfloop query="get_payroll_info">
    <cfset today_date = DateFormat(get_payroll_info.today_date, "mm/dd/yyyy")>
    <cfset pay_period_week = get_payroll_info.pay_period_week>
    <cfset pay_period_week1 = pay_period_week - 1>
    <cfset pay_period_week2 = pay_period_week>
    <cfset pay_period_number = get_payroll_info.pay_period_number>
    <cfset blockdate = DateAdd("d", (pay_period_week1-first_pay_period_week1)*7, first_date)>
    <cfset week1_date_available = DateAdd("d", (pay_period_week1-first_pay_period_week1+1)*7, first_date)>
    <cfset week2_date_available = DateAdd("d", (pay_period_week1-first_pay_period_week1+2)*7, first_date)>

    <CFSET APPLICATION.blockdate = DateFormat(blockdate, "mm/dd/yyyy")>
    <CFSET APPLICATION.pay_period_week1 =pay_period_week1>
    <CFSET APPLICATION.pay_period_week2 =pay_period_week2>
    <CFSET APPLICATION.pay_period_number =pay_period_number>
    <CFSET APPLICATION.week1_date_available = DateFormat(week1_date_available, "mm/dd/yyyy")>
    <CFSET APPLICATION.week2_date_available = DateFormat(week2_date_available, "mm/dd/yyyy")>
    <CFSET APPLICATION.pay_period_week1_date = APPLICATION.week1_date_available>
    <CFSET APPLICATION.pay_period_week2_date = APPLICATION.week2_date_available>
</cfloop>