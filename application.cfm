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

<!---  <cfquery name="get_payroll_info" datasource="jrgm" >
 SELECT  pay_period_week , pay_period_number FROM app_pay_periods 
 WHERE #theDate# >=  pay_period_start  AND  #theDate# <= pay_period_end 
 </cfquery>   --->
<!--- <cfdump var="#get_payroll_info#"> --->

<!--- These 2 control Bettys page -Get this info from app_pay_periods --->
<!--- This needs to be changed  only on the Saturday Payroll Ends +1  day --->
<!--- This needs to be changed on every Saturday    --->

<!---Change This to 38 by 9/24  for 9/28 because pay_period_number 38 starts then ---> 
<!---Change This to 39 by 10/8  for 10/12 because pay_period_number 39 starts then ---> 
<!---<CFSET pay_period_number = "38"> --->
<cfif theDate GT '9/12/2015'><CFSET pay_period_number = "37"> </cfif>
<cfif theDate GT '9/26/2015'><CFSET pay_period_number = "38"> </cfif>
<cfif theDate GT '10/10/2015'><CFSET pay_period_number = "39"> </cfif>
<cfif theDate GT '10/24/2015'><CFSET pay_period_number = "40"> </cfif>
<cfif theDate GT '11/07/2015'><CFSET pay_period_number = "41"> </cfif>
<cfif theDate GT '11/21/2015'><CFSET pay_period_number = "42"> </cfif>
<cfif theDate GT '12/05/2015'><CFSET pay_period_number = "43"> </cfif>
<cfif theDate GT '12/19/2015'><CFSET pay_period_number = "44"> </cfif>
<cfif theDate GT '01/02/2016'><CFSET pay_period_number = "45"> </cfif>
<cfif theDate GT '01/16/2016'><CFSET pay_period_number = "46"> </cfif>
<cfif theDate GT '01/30/2016'><CFSET pay_period_number = "47"> </cfif>
<cfif theDate GT '02/13/2016'><CFSET pay_period_number = "48"> </cfif>
<cfif theDate GT '02/27/2016'><CFSET pay_period_number = "49"> </cfif>
<cfif theDate GT '03/12/2016'><CFSET pay_period_number = "50"> </cfif>
<cfif theDate GT '03/26/2016'><CFSET pay_period_number = "51"> </cfif>
<cfif theDate GT '04/09/2016'><CFSET pay_period_number = "52"> </cfif>
<cfif theDate GT '04/23/2016'><CFSET pay_period_number = "53"> </cfif>
<cfif theDate GT '05/07/2016'><CFSET pay_period_number = "54"> </cfif>
<cfif theDate GT '05/21/2016'><CFSET pay_period_number = "55"> </cfif>
<cfif theDate GT '06/04/2016'><CFSET pay_period_number = "56"> </cfif>
<cfif theDate GT '06/18/2016'><CFSET pay_period_number = "57"> </cfif>
<cfif theDate GT '07/02/2016'><CFSET pay_period_number = "58"> </cfif>
<cfif theDate GT '07/16/2016'><CFSET pay_period_number = "59"> </cfif>
<cfif theDate GT '07/30/2016'><CFSET pay_period_number = "60"> </cfif>
<cfif theDate GT '08/13/2016'><CFSET pay_period_number = "61"> </cfif>
<cfif theDate GT '08/27/2016'><CFSET pay_period_number = "62"> </cfif>
<cfif theDate GT '09/10/2016'><CFSET pay_period_number = "63"> </cfif>
<cfif theDate GT '09/24/2016'><CFSET pay_period_number = "64"> </cfif>
<cfif theDate GT '10/08/2016'><CFSET pay_period_number = "65"> </cfif>

<!---Change This to 75 on  9/24 before 9/28 because pay_period_week 75 starts then --->
<!---Change This to 76 on  10/1 before 10/5 because pay_period_week 76 starts then --->
<!---<CFSET pay_period_week = "75">  --->

<cfif theDate GT '9/18/2015'><CFSET pay_period_week = "74"> </cfif>
<cfif theDate GT '9/25/2015'><CFSET pay_period_week = "75"> </cfif>
<cfif theDate GT '10/02/2015'><CFSET pay_period_week = "76"> </cfif>
<cfif theDate GT '10/09/2015'><CFSET pay_period_week = "77"> </cfif>
<cfif theDate GT '10/16/2015'><CFSET pay_period_week = "78"> </cfif>
<cfif theDate GT '10/23/2015'><CFSET pay_period_week = "79"> </cfif>
<cfif theDate GT '10/30/2015'><CFSET pay_period_week = "80"> </cfif>
<cfif theDate GT '11/07/2015'><CFSET pay_period_week = "81"> </cfif>
<cfif theDate GT '11/14/2015'><CFSET pay_period_week = "82"> </cfif>
<cfif theDate GT '11/21/2015'><CFSET pay_period_week = "83"> </cfif>
<cfif theDate GT '11/28/2015'><CFSET pay_period_week = "84"> </cfif>
<cfif theDate GT '12/05/2015'><CFSET pay_period_week = "85"> </cfif>
<cfif theDate GT '12/12/2015'><CFSET pay_period_week = "86"> </cfif>
<cfif theDate GT '12/19/2015'><CFSET pay_period_week = "87"> </cfif>
<cfif theDate GT '12/26/2015'><CFSET pay_period_week = "88"> </cfif>
<cfif theDate GT '01/02/2016'><CFSET pay_period_week = "89"> </cfif>
<cfif theDate GT '01/09/2016'><CFSET pay_period_week = "90"> </cfif>
<cfif theDate GT '01/16/2016'><CFSET pay_period_week = "91"> </cfif>
<cfif theDate GT '01/23/2016'><CFSET pay_period_week = "92"> </cfif>
<cfif theDate GT '01/30/2016'><CFSET pay_period_week = "93"> </cfif>
<cfif theDate GT '02/06/2016'><CFSET pay_period_week = "94"> </cfif>
<cfif theDate GT '02/13/2016'><CFSET pay_period_week = "95"> </cfif>
<cfif theDate GT '02/20/2016'><CFSET pay_period_week = "96"> </cfif>
<cfif theDate GT '02/27/2016'><CFSET pay_period_week = "97"> </cfif>
<cfif theDate GT '03/05/2016'><CFSET pay_period_week = "98"> </cfif>
<cfif theDate GT '03/12/2016'><CFSET pay_period_week = "99"> </cfif>
<cfif theDate GT '03/19/2016'><CFSET pay_period_week = "100"> </cfif>
<cfif theDate GT '03/26/2016'><CFSET pay_period_week = "101"> </cfif>
<cfif theDate GT '04/02/2016'><CFSET pay_period_week = "102"> </cfif>
<cfif theDate GT '04/09/2016'><CFSET pay_period_week = "103"> </cfif>
<cfif theDate GT '04/16/2016'><CFSET pay_period_week = "104"> </cfif>
<cfif theDate GT '04/23/2016'><CFSET pay_period_week = "105"> </cfif>
<cfif theDate GT '04/30/2016'><CFSET pay_period_week = "106"> </cfif>
<cfif theDate GT '05/07/2016'><CFSET pay_period_week = "107"> </cfif>
<cfif theDate GT '05/14/2016'><CFSET pay_period_week = "108"> </cfif>
<cfif theDate GT '05/21/2016'><CFSET pay_period_week = "109"> </cfif>
<cfif theDate GT '05/28/2016'><CFSET pay_period_week = "110"> </cfif>
<cfif theDate GT '06/04/2016'><CFSET pay_period_week = "111"> </cfif>
<cfif theDate GT '06/11/2016'><CFSET pay_period_week = "112"> </cfif>
<cfif theDate GT '06/18/2016'><CFSET pay_period_week = "113"> </cfif>
<cfif theDate GT '06/25/2016'><CFSET pay_period_week = "114"> </cfif>
<cfif theDate GT '07/02/2016'><CFSET pay_period_week = "115"> </cfif>
<cfif theDate GT '07/09/2016'><CFSET pay_period_week = "116"> </cfif>
<cfif theDate GT '07/16/2016'><CFSET pay_period_week = "117"> </cfif>
<cfif theDate GT '07/23/2016'><CFSET pay_period_week = "118"> </cfif>
<cfif theDate GT '07/30/2016'><CFSET pay_period_week = "119"> </cfif>
<cfif theDate GT '08/06/2016'><CFSET pay_period_week = "120"> </cfif>
<cfif theDate GT '08/13/2016'><CFSET pay_period_week = "121"> </cfif>
<cfif theDate GT '08/20/2016'><CFSET pay_period_week = "122"> </cfif>
<cfif theDate GT '08/27/2016'><CFSET pay_period_week = "123"> </cfif>
<cfif theDate GT '09/03/2016'><CFSET pay_period_week = "124"> </cfif>
<cfif theDate GT '09/10/2016'><CFSET pay_period_week = "125"> </cfif>
<cfif theDate GT '09/17/2016'><CFSET pay_period_week = "126"> </cfif>
<cfif theDate GT '09/24/2016'><CFSET pay_period_week = "127"> </cfif>
<cfif theDate GT '10/01/2016'><CFSET pay_period_week = "128"> </cfif>


<!---Get accurate dates--->
<!--- END These 2 control Bettys page  --->

<!--- This info is for the current pay period  for ALL non Betty--->
<!--- Implement this after all payroll is approved --->
<!---Once every 2 weeks --->
 

 


<!---
<CFSET APPLICATION.blockdate ='03/12/2016'>
<CFSET APPLICATION.pay_period_week1 =99>
<CFSET APPLICATION.pay_period_week2 =100>
<CFSET APPLICATION.pay_period_number =50>
<CFSET APPLICATION.week1_date_available ='03/19/2016'>
<CFSET APPLICATION.week2_date_available ='03/26/2016'>
<CFSET APPLICATION.pay_period_week1_date ='03/19/2016'>
<CFSET APPLICATION.pay_period_week2_date ='03/26/2016'>--->

<CFSET APPLICATION.pay_period_number_current_calendar = #pay_period_number#>
<cfquery name="get_block_info" datasource="jrgm"   maxrows="1">
SELECT         ID, block_date, date_changed, pay_period_week1, pay_period_week2, pay_period_number, week1_date_available, week2_date_available, pay_period_week1_date, pay_period_week2_date
FROM            payroll_block
ORDER BY ID DESC
 </cfquery>
<cfoutput  query="get_block_info">
   <!---<CFSET APPLICATION.blockdate ='03/26/2016'> 
<CFSET APPLICATION.pay_period_week1 =101>
<CFSET APPLICATION.pay_period_week2 =102>
<CFSET APPLICATION.pay_period_number =51>
<CFSET APPLICATION.week1_date_available ='04/02/2016'>
<CFSET APPLICATION.week2_date_available ='04/09/2016'>
<CFSET APPLICATION.pay_period_week1_date ='04/02/2016'>
<CFSET APPLICATION.pay_period_week2_date ='04/09/2016'>--->
   
   <CFSET APPLICATION.blockdate  =#DateFormat(block_date, "mm/dd/yyyy")#>
   <CFSET APPLICATION.pay_period_week1 =#pay_period_week1#>
   <CFSET APPLICATION.pay_period_week2 =#pay_period_week2#>
   <CFSET APPLICATION.pay_period_number = #pay_period_number#>
   <CFSET APPLICATION.week1_date_available =#DateFormat(week1_date_available, "mm/dd/yyyy")#>
   <CFSET APPLICATION.week2_date_available = #DateFormat(week2_date_available, "mm/dd/yyyy")#>
   <CFSET APPLICATION.pay_period_week1_date =#DateFormat(pay_period_week1_date, "mm/dd/yyyy")#>
   <CFSET APPLICATION.pay_period_week2_date = #DateFormat(pay_period_week2_date, "mm/dd/yyyy")#>
 </cfoutput>

 

 