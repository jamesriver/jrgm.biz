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
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
 <body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="header"> PTO Report for <cfoutput> #DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")#- #DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")#</cfoutput></span></td>
    <td align="right"> <a href="payrollBetty.cfm"  class="bluebutton"> Go to  Main Payroll Page </a></td>
  </tr>
</table>
  <br />
 <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
  <thead> 
         <tr>
         <th align="left">Branch</th> 
          <th align="left">First Name</th>
           <th align="left">Last Name</th>
          <th align="left">Employee ID</th>
          <th align="left">PTO Date</th>
          <th align="left">PTO Hours</th>
          </tr>
        </thead>
        <tbody>  
        
<!---cfoutput>
SELECT     ID, employee_id, branch_code, userid, pto_hours, date_entered, pto_date
FROM         payroll_pto   WHERE  
        (payroll_pto.pto_date > #dateadd('d', 0, app_payroll_periods_c .pay_period_start)# AND payroll_pto.pto_date < #pay_period_end_week_plusoneC#)
order by  pto_date asc
</cfoutput> 
<cfabort--->
<cfquery name="get_employee_pto_time" datasource="jrgm" >
SELECT     ID, employee_id, branch_code, userid, pto_hours, date_entered, pto_date
FROM         payroll_pto   WHERE  
        (payroll_pto.pto_date > #dateadd('d', 0, app_payroll_periods_c .pay_period_start)# AND payroll_pto.pto_date < #pay_period_end_week_plusoneC#)
order by  pto_date asc
</cfquery> 

 <cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT      ID, [Employee ID] AS employeeid, [Name FirstLast], First_name, Last_name FROM app_employees  
</cfquery>
 <cfoutput query="get_employee_pto_time">
 <tr>
 <cfif branch_code EQ '10' >
    <CFSET branchname ='Richmond'>
    <cfelseif branch_code EQ '20' >
    <CFSET branchname ='Portsmouth'>
    <cfelseif branch_code EQ '30'  >
    <CFSET branchname ='Charlottesville'>
    <cfelseif branch_code EQ '70'  >
    <CFSET branchname ='Williamsburg'>
    <cfelseif branch_code EQ '80'  >
    <CFSET branchname ='Chesterfield'>
    <cfelseif branch_code EQ '90' >
    <CFSET branchname ='Newport News'>
    <cfelseif  branch_code EQ '21'>
    <CFSET branchname ='Corporate'>
    <cfelseif  branch_code EQ '00'>
    <CFSET branchname ='Unknown'>
    <cfelseif branch_code EQ '' >
    <CFSET branchname ='Unknown'>
    <cfelse>
    <CFSET branchname ='Unknown'>
  </cfif>
 <td>#branchname#</td> 
 <cfquery name="get_employee_name"   dbtype="query" maxrows="1">
SELECT First_name, Last_name FROM  get_all_employee_info WHERE employeeid =#get_employee_pto_time.employee_id#
 </cfquery>
 <td>#get_employee_name.First_name#</td>
 <td>#get_employee_name.LAst_name#</td>
 <td align="left">#employee_id#</td>
 <td align="left">#DateFormat(pto_date, "mm/dd/yyyy")#</td>
 <td align="left">#pto_hours#</td>
 </tr>  
 </cfoutput>
 </tbody>
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
