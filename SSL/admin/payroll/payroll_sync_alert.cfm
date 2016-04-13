<CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_week1  =  pay_period_week-1>
<CFSET pay_period_end_week  =  pay_period_number>
<cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week#
 </cfquery>
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
<cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
<CFSET pay_period_end_week_plusone =  dateadd("d",1,app_payroll_periods_L.pay_period_end)>
<CFSET pay_period_end_week_plusoneC =  dateadd("d",1,app_payroll_periods_C.pay_period_end)>
<cfquery name="app_payroll_periods_Week1" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_week1#
 </cfquery>
 <CFSET pay_period_end_week1_plusone =  dateadd("d",1,app_payroll_periods_Week1.pay_period_end)>
<CFSET pay_period_number_for_csv = pay_period_number -1>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style type="text/css">
.greenText {
 	color: green;
}
</style>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="header"> Payroll</div>
    
    
   <cfquery name="get_all_employee_time_for_period_late" datasource="jrgm" >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE <!---Employee_ID IN (#employeelist#) AND---> app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
    
    
    <cfdump  var="#get_all_employee_time_for_period_late#">
    <cfif get_all_employee_time_for_period_late.recordcount GT 0>z
    <cfmail from="pat@1design.com" to="pat@1design.com" subject="Late Payroll" type="html">   
       <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
       
          <span class="arialfont">Late Payroll has just synced to the server. Please review.</span><br />
          <br />
        </cfmail>
</cfif>
    
    <cfabort>
    
    
    
    
    
    <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
      <thead>
        <tr>
          <th align="left">Branch</th>
          <th   align="left">Approved?<br />
            <cfoutput>Pay Period<br />
              #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#-<br />
              #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
          <th align="center">DOWNLOAD <br />
            Approved CSV<br />
            <cfoutput> Pay Period<br />
              #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
          <th align="center" nowrap="nowrap">DOWNLOAD <br />
            Unnapproved CSV<br />
            <cfoutput> Pay Period<br />
              #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
          <th align="center">VIEW <br />
            Approved CSV<br />
            <cfoutput> Pay Period<br />
#DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")#    </cfoutput></th>
          <th align="center"  nowrap="nowrap">VIEW<br />
            Unnapproved CSV<br />
            <cfoutput> Pay Period<br />
#DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")#    </cfoutput></th>
          <th align="center">View<br />
            by<br />
            Employee</th>
          <th align="center">View by Current<br />
            <cfoutput> Pay Period<br />
              #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
          <th align="center">View by Prior<br />
            <cfoutput> Pay Period<br />
              #DateFormat("#app_payroll_periods_L.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_L.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
          <th align="center">View<br />
            Employee <br />
            Dates</th>
          <th align="center">Pay Week<br />
            Approved<br />
            <cfoutput>#DateFormat("#app_payroll_periods_Week1.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_Week1.pay_period_end#", "mm/dd/yyyy")# </cfoutput></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Charlottesville </td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Charlottesville'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm" >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20" alt="Download CSV" /></a>
            </cfif>
           &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20" alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
         
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
           &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
         
          <td align="center" ><a href="payroll_view_employee.cfm?branch=Charlottesville">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Charlottesville">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Charlottesville&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Charlottesville">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Charlottesville'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Charlottesville&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr>
        <tr>
          <td >Chesterfield</td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Chesterfield'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm" >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
         
         
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
         
         
          <td align="center" ><a href="payroll_view_employee.cfm?branch=Chesterfield">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Chesterfield">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Chesterfield&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Chesterfield">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Chesterfield'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Chesterfield&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr>
        <tr>
          <td >Newport News</td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Newport News'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
           <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><a href="payroll_view_employee.cfm?branch=Newport News">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Newport News">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Newport News&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Newport News">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Newport News'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Newport News&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr>
        <tr>
          <td >Portsmouth</td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Portsmouth'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
<!---   <cfdump var="#get_all_employee_time_for_period#"> --->
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
           &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
        <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
           &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><a href="payroll_view_employee.cfm?branch=Portsmouth">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Portsmouth">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Portsmouth&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Portsmouth">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Portsmouth'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery><!--- <cfdump var="#get_employees_with_time#"> --->
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
  
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Portsmouth&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr>
        <tr>
          <td >Richmond</td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Richmond'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
       
       <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
       
       
          <td align="center" ><a href="payroll_view_employee.cfm?branch=Richmond">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Richmond">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Richmond&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Richmond">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Richmond'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Richmond&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr>
      <!---   <tr>
          <td >Williamsburg</td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Williamsburg'  AND (app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#')
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_L.pay_period_start# AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')#'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="left" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_2week_unapproved.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">No</a></span>
            </cfif></td>
          <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>
            </cfif>
          &nbsp;</td>
           
             <td align="center"><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <a href="REG_payroll_csv_view.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount GT 0>
              <a href="REG_payroll_csv_view.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>">View</a>
            </cfif>
          &nbsp;</td>
          
           <td align="center" ><a href="payroll_view_employee.cfm?branch=Williamsburg">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Williamsburg">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week.cfm?branch=Williamsburg&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center"><a href="payroll_view_employee_dates.cfm?branch=Williamsburg">View</a></td>
          <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = 'Williamsburg'  AND 
        (app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#)
		ORDER by APP_employees.last_name
 	</cfquery>
          <CFSET employeelist ="0">
          <cfloop query="get_employees_with_time">
            <cfset employeelist = ListAppend(employeelist,Employee_ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > #app_payroll_periods_Week1.pay_period_start# AND  app_employee_payroll_clock.Time_Out < #pay_period_end_week1_plusone#
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
          <td align="center" ><cfif get_all_employee_time_for_period.recordcount EQ 0>
              <span class="greenText">Approved</span>
              <cfelse>
              <a style="color:#CC0000" href="payroll_view_employee_detail_1week_unapproved.cfm?branch=Williamsburg&pay_period_week=<cfoutput>#pay_period_week_week1#</cfoutput>">No</a></span>
          </cfif></td>
        </tr> --->
         <tr>
          <td colspan="2" nowrap="nowrap" >ALL FWW Employees (Approved &amp; Unapproved)</td>
          <td align="center"><a href="FWW_payroll_csv.cfm?pay_period_number=<cfoutput>#pay_period_number_for_csv#</cfoutput>"><img src="images/downloadCSV.gif" width="104" height="20"alt="Download CSV" /></a>&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" > </td>
          <td align="center"><a href="payroll_view_employee_detail_2week_FWW.cfm">View</a></td>
          <td align="center"><a href="payroll_view_employee_detail_2week_FWW.cfm?pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View</a></td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" nowrap="nowrap"  height="35">PTO Hours</td>
          <td align="center">&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" ><a href="pto_payroll_view_employee_detail.cfm"></a></td>
          <td align="center" >&nbsp;</td>
          <td align="center" ></td>
          <td align="center"><a href="pto_payroll_view_employee_detail.cfm">View</a></td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
        </tr>
        <tr class="dailysheet_header">
          <td colspan="11" nowrap="nowrap" ><strong>Payroll Tasks &amp; Reports</strong></td>
        </tr>
        <tr>
          <td colspan="2" nowrap="nowrap" ><p><a href="pto_add.cfm">Add PTO Time</a></p>
          <p><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></p>
          <p><a href="select_branch.cfm">View Employee Payroll by Date Report</a></p>
          <p><a href="select_branch_all_employees.cfm">View Branch Employee Payroll by Dates</a></p>
          <p><a href="../payroll_report_employees_multiple_ID_betty.cfm">Employees Working in 2 Branches</a></p>
          <p><a href="../payroll_manager.cfm">Employees on more than 1 Daily Sheet</a></p></td>
          <td align="center">&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" >&nbsp;</td>
          <td align="center" ></td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
        </tr>
      </tbody>
    </table><br />
<br />
<br />
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
