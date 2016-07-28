<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>
<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >
<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>

<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, [Name FirstLast] AS  [employee_name], first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal">1</span> Payroll</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
                      
            <div class="portlet-body"> 

              <!---   Check Pay Period 1 --->
              <cfquery name="app_payroll_periods1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>
              <CFSET pay_period_end_week1 =  dateadd("d",7,app_payroll_periods1.pay_period_start)>
              <cfquery name="get_employees_with_time_Week1" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)  AND  
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week1">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif SESSION.branch EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week1" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
              <cfif  todaydate GT APPLICATION.week1_date_available  AND get_employees_with_time_unapproved_Week1.recordcount GT 0>
                <p class="text-danger"><strong>You have unapproved Week 1 payroll.</strong></p>
                <a href="payroll_main.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>" class="btn btn-primary">Approve week 1 payroll</a>
                <cfelse>
                <p class="text-success"><strong>All Week 1 payroll is approved.</strong></p>
              </cfif>
              
              <!---   Check Pay Period 2 --->
              <cfquery name="app_payroll_periods2" datasource="jrgm">
 SELECT   pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>
              <CFSET pay_period_end_week2 =  dateadd("d",7,app_payroll_periods2.pay_period_start)>
              <cfquery name="get_employees_with_time_Week2" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)  AND   
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week2, "yyyy-mm-dd")# 00:00:00.000')
		ORDER by APP_employees.last_name
  </cfquery>
              <CFSET mylist ="0">
              <cfloop query="get_employees_with_time_Week2">
                <cfset myList = ListAppend(mylist,Employee_ID)>
              </cfloop>
              <cfif SESSION.branch EQ 'Test'>
                <CFSET mylist ="0">
              </cfif>
              <cfquery name="get_employees_with_time_unapproved_Week2" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week2, "yyyy-mm-dd")# 00:00:00.000')
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL
		ORDER by APP_employees.last_name
 </cfquery>
              <cfif  todaydate GT APPLICATION.week2_date_available AND get_employees_with_time_unapproved_Week2.recordcount GT 0>
                <p class="text-danger"><br>
                  <strong>You have unapproved Week 2 payroll.</strong></p>
                <a href="payroll_main.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>" class="btn btn-primary">Approve week 2 payroll</a>
                <cfelse>
                <p class="text-success"><br>
                  <strong>All Week 2 payroll is approved.</strong></p>
              </cfif>
              <cfquery name="get_many_hours" datasource="jrgm">
 SELECT employee_ID,ds_date,COUNT(DISTINCT ds_id) AS Count 
 FROM  app_employee_payroll_clock
 WHERE     (ds_date > '#APPLICATION.blockdate#')     AND Employee_ID IN (#mylist#)
 GROUP BY Employee_ID, ds_date
 HAVING   COUNT(DISTINCT ds_id) > 1
 </cfquery>
              <cfif  get_many_hours.recordcount GT 0>
                <br>
                <p class="text-danger"><br>
                  <strong>These employees are on more than 1 daily sheet  in 1 day. Please review to make sure that this is correct.</strong></p>
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th> Branch</th>
                      <th> Employee ID</th>
                      <th> Date</th>
                      <th> Employee Name</th>
                      <th> DSID #1</th>
                      <th> DSID #2</th>
                    </tr>
                  </thead>
                  <cfoutput query="get_many_hours">
                    <cfquery name="get_many_hours_name"   dbtype="query">
SELECT   employee_name ,branch AS branch_name FROM get_all_employee_info
WHERE  employee_ID = #Employee_ID#
 </cfquery>
                    <cfif  get_many_hours_name.BRANCH_NAME EQ 'Richmond' >
                      <CFSET branchnew = "RIC" >
                      <cfelseif  get_many_hours_name.BRANCH_NAME EQ 'Portsmouth' >
                      <CFSET branchnew = "POR" >
                      <cfelseif  get_many_hours_name.BRANCH_NAME EQ 'Charlottesville' >
                      <CFSET branchnew = "CVL" >
                      <cfelseif  get_many_hours_name.BRANCH_NAME EQ 'Williamsburg' >
                      <CFSET branchnew = "WMB" >
                      <cfelseif  get_many_hours_name.BRANCH_NAME EQ 'Chesterfield' >
                      <CFSET branchnew = "CHE" >
                      <cfelseif get_many_hours_name.BRANCH_NAME EQ 'Newport News' >
                      <CFSET branchnew = "NEW" >
                      <cfelse>
                      <CFSET branchcode =00>
                    </cfif>
                    <tbody>
                      <tr>
                        <td>#branchnew#</td>
                        <td>#Employee_ID#</td>
                        <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td>
                        <cfquery name="get_many_hours_name"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID = #Employee_ID#
 </cfquery>
                        <td>#get_many_hours_name.employee_name#</td>
                        <!---    <td>#get_many_hours_name.branch#</td> --->
                        <cfquery name="get_ds_id" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,time_in,time_out
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#
ORDER by time_IN ASC
 </cfquery>
                        <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id.ds_id#"  target="_blank">#get_ds_id.ds_id#</a><br>
                          #TimeFormat(get_ds_id.time_in, "HH:mm")# - #TimeFormat(get_ds_id.time_out, "HH:mm")#</td>
                        <cfquery name="get_ds_id_other" datasource="jrgm">
SELECT     Employee_ID, ds_date, ID,ds_id,time_in,time_out
FROM         app_employee_payroll_clock
WHERE    ds_date ='#DateFormat(ds_date, "yyyy-mm-dd")#'  AND Employee_ID = #Employee_ID#  AND ds_id <> #get_ds_id.ds_id#
 </cfquery>
                        <td> DSID: <a href="daily_sheet.cfm?dsid=#get_ds_id_other.ds_id#"  target="_blank">#get_ds_id_other.ds_id#</a><br>
                          #TimeFormat(get_ds_id_other.time_in, "HH:mm")# - #TimeFormat(get_ds_id_other.time_out, "HH:mm")#</td>
                      </tr>
                    </tbody>
                  </cfoutput>
                </table>
              </cfif>
             <div>