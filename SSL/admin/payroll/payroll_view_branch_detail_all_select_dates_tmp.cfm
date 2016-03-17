 <cfparam name="message" default="">
 <cfparam name="branchtime" default="0">
  
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
<cfelse>
<CFSET DS_DATE_START= todaydate_DS>
<CFSET DS_DATE_START =  dateadd("d",365,DS_DATE_START)>

 </cfif>

<cfif IsDefined("form.DS_DATE_END")  AND form.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= form.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
<cfelse>
<CFSET DS_DATE_END = todaydate_DS>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
 </cfif>
  
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
 <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>

</head>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="header">Branch Payroll Totals for <cfoutput>#branch#</cfoutput><br /><br />
 </td>
          <td nowrap="nowrap" class="header" width="100">&nbsp;</td>
  <td nowrap="nowrap"  align="right"><a href="select_branch_all_employees.cfm" class="btn-info">Choose Another Branch</a></td> 
        </tr>
      </table> 
    <form class="css_form" action="payroll_view_branch_detail_all_select_dates.cfm" method="post">
   <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> Start Date</strong></td>
         <td class="statusTD_right">
         <input type="text" id="datepicker" name="ds_date_start"  <cfif IsDefined("form.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"</cfif>/> 
            </td> 
              <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> End Date</strong></td>
          <td class="statusTD_right"><input type="text" id="datepicker2" name="ds_date_end" <cfif IsDefined("form.ds_date_end") >value="<cfoutput>#DateFormat(form.ds_date_end, "mm/dd/yyyy")#</cfoutput>"</cfif>/> </td>
          <td class="statusTD_right"> </td>
              <td class="statusTD_right">
   <input type="hidden" name="branch"  <cfoutput> value="#branch#"</cfoutput> /> 
<input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
            </tr>
        </table> 
       </form>
       
       <cfif IsDefined("form.DS_DATE_START")  AND  IsDefined("form.DS_DATE_END") >
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
       <thead> 
 <tr class="dstable_top1">
 <td height="30">&nbsp; Employee ID</td>
 <td>First Name</td>
 <td>Last Name</td>
 <td align="right">Total Hours</td>
 <td align="right"> </td>
   </tr>
 </thead>

           <cfoutput>
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE
        <cfif IsDefined("form.DS_DATE_START")> Time_In > #DS_DATE_START# AND</cfif>
  <cfif IsDefined("form.DS_DATE_END")> Time_Out < #DS_DATE_END# AND</cfif>  APP_employees.branch ='#branch#'
		ORDER by APP_employees.last_name
 </cfoutput>
<cfabort>
           <cfquery name="get_employees_with_time" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE
        <cfif IsDefined("form.DS_DATE_START")> Time_In > #DS_DATE_START# AND</cfif>
  <cfif IsDefined("form.DS_DATE_END")> Time_Out < #DS_DATE_END# AND</cfif>  APP_employees.branch ='#branch#'
		ORDER by APP_employees.last_name
 </cfquery>
              <cfloop query="get_employees_with_time"> 
              <tr>
          <cfoutput>
             <td><a href="payroll_view_employee_detail_all_select_dates.cfm?empid=#get_employees_with_time.Employee_ID#&branch=#branch#
             <cfif IsDefined("form.DS_DATE_START")>&DS_DATE_START=#DS_DATE_START# </cfif> <cfif IsDefined("form.DS_DATE_END")>&DS_DATE_END=#DS_DATE_END#></cfif>
             ">#get_employees_with_time.Employee_ID#</a></td> 
            <td> #get_employees_with_time.first_name#</td> 
            <td> #get_employees_with_time.last_name#</td></cfoutput>
  <cfif   timenow GT today_7PM>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#Employee_ID#      AND in_out_status =2
  <cfif IsDefined("form.DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("form.DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
          <cfelse>
        <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#Employee_ID#     AND in_out_status =2
  <cfif IsDefined("form.DS_DATE_START")>AND Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("form.DS_DATE_END")>AND Time_Out < #DS_DATE_END#</cfif>
GROUP by Employee_ID
         </cfquery>
         </cfif>
               <cfoutput query="get_employee_time_sum"> 
			   <CFSET branchtime = branchtime+sumtime>
             <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
             <CFSET base60reg =  100*minutessum/60>
      
             <td align="right"> #hourssum#.#NumberFormat(base60reg,"09")#</td>
         </cfoutput> 
          </tr> 
                </cfloop>
                <tr>
                <td><strong>Totals</strong></td>
                <td>&nbsp;</td>
                     <td align="right"></td>
             <cfset hourssum = int(branchtime\60)>
            <cfset minutessum = int(branchtime mod 60)>
     <cfoutput> <td align="right"><strong>#hourssum#:#NumberFormat(minutessum,"09")#</strong></td>
        </cfoutput>    
                <td align="right"></td>
              </tr>
          </tbody>
      </table>
      </cfif>
     </div>
   </div>
</div>
 </div>
<!-- end outer div -->
  <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
