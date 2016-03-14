
<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>

<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >

<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >

 
<CFSET pay_period_end_week_L  =  pay_period_number-1>
 <CFSET pay_period_week_L  =  pay_period_week-1>
 
 
  <cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_L#
 </cfquery>  
 <!---  <cfdump var="#app_payroll_periods_W#">
 ---> 
<CFSET pay_period_end_week_Now  =  pay_period_number>
<CFSET pay_period_week_Now  =  pay_period_week>
  <cfquery name="app_payroll_periods_Now" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_Now#
 </cfquery>  
 <!---  <cfdump var="#app_payroll_periods_Now#"> --->
 
 <cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
 
  <cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
 
   
  <CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 </head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Payroll</div>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable" >
  <tbody>
 <cfif todaydate GT APPLICATION.week1_date_available>       
            <tr>
    <td nowrap="nowrap"><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>">Approve Weekly Payroll Week 1</a></td>
    <td nowrap="nowrap">Week Ending <cfoutput>#pay_period_week1_date# </cfoutput></td>
    <td nowrap="nowrap">&nbsp;</td>
  </tr>
  </cfif>
<cfif todaydate GT APPLICATION.week2_date_available>
  <tr>
          <td nowrap="nowrap"><a href="payroll_view_employee_detail_1week.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>">Approve Weekly Payroll Week 2</a></td>
          <td nowrap="nowrap">Week Ending <cfoutput>#pay_period_week2_date#</cfoutput></td>
          <td nowrap="nowrap">&nbsp;</td>
        </tr> 
 </cfif>       
 
        <tr>
           <td nowrap="nowrap"><a href="payroll_view_employee_detail_2week.cfm">View Current Payroll Period</a></td>
           <td nowrap="nowrap">Pay Period <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_C.pay_period_end, "mm/dd/yyyy")#</cfoutput></td>
            <td nowrap="nowrap">2 Week Period</td>
        </tr>
        <tr>
            <td nowrap="nowrap"><a href="payroll_view_employee_detail_2week.cfm?pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">View Prior Payroll Period</a></td>
            <td nowrap="nowrap">Pay Period <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_start, "mm/dd/yyyy")#</cfoutput>- <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_end, "mm/dd/yyyy")#</cfoutput></td>
           <td nowrap="nowrap">2 Week Period</td>
        </tr>
         <cfif todaydate GT APPLICATION.week1_date_available>       
        <tr>
          <td nowrap="nowrap"><a href="payroll_view_employee_detail_2week_unapproved.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>">View Unapproved Payroll</a> </td>
          <td nowrap="nowrap">Week Ending <cfoutput>#pay_period_week1_date# </cfoutput></td>
          <td nowrap="nowrap">1 Week Period</td>
        </tr>
       </cfif>
        </tbody>
      </table>
      <div class="spacer10"></div>
      <div class="job_data_header">Other Payroll</div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable" >
  <tbody>           <tr>
          <td nowrap="nowrap"> <a href="pto_add.cfm">Add PTO Time</a></td>
          </tr>
    <tr>
      <td nowrap="nowrap"><a href="pto_payroll_view_employee_detail.cfm">View PTO Report</a></td>
    </tr>
        </tbody>
      </table>
     </div>
   </div>
</div>
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