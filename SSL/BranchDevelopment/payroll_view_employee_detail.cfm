<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>

<cfset Now_Time = Now()>

 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name    FROM 
app_employees WHERE [Employee ID] = #url.empid#
 </cfquery>


<cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM app_employee_payroll_clock 
    WHERE in_out_status = 1 AND   Employee_ID =#url.empid#
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="jrgm">
    UPDATE App_Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
  </cfoutput>
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
<!--- <script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
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
 ---><!--[if lt IE 9]>
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
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap" class="header">Payroll Detail for <cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name# <br />
 Branch:#Session.branch#  &nbsp;&nbsp;   Employee ID : #url.empid# </cfoutput></td>
        </tr>
      </table>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
        <tr>
          <th align="left">Pay Period Totals</th>
          <th align="left">Hours</th>
          <th>(+/-) Edits</th>
          <th>Total</th>
        </tr>
        </thead>
         <tbody>
        <cfquery name="get_employee_time_sum" datasource="jrgm" maxrows="30">
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#url.empid#
GROUP by Employee_ID
         </cfquery>
        <cfoutput query="get_employee_time_sum">
          <tr>
            <td>Regular</td>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td align="left">#hourssum#:#NumberFormat(minutessum,"09")#</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </cfoutput>
        </tbody>
      </table>
      <br />
      <cfquery name="get_employee_time" datasource="jrgm" maxrows="30">
SELECT * FROM 
app_employee_payroll_clock WHERE Employee_ID =#url.empid#
 ORDER by ds_date DESC
        </cfquery>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
        <tr>
          <th align="left">Day</th>
          <th align="left">Date</th>
          <th align="left">DSID</th>
          <th align="left">Time In</th>
          <th align="left">Time Out</th>
          <th align="left">Time<br />Worked</span></th>
          <th align="left">Time<br />Worked</span></th>
          <th align="center">Approve</th>
          <th align="center">Edit</th>
        </tr>
        </thead> 
        <tbody>
        <cfoutput query="get_employee_time">
          <tr>
            <td>#DateFormat(ds_date, "dddd")#</span></td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</span></td>
            <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></span></td>
            <td>#TimeFormat(time_in, "hh:mm tt")#</span></td>
                  <cfif In_Out_Status EQ 1>
                  <td>#TimeFormat(Now_Time, "hh:mm tt")# *</span></td>
                    <td>#time_worked_current#</span></td>
                   <cfset hours = int(time_worked_current\60)>
            <cfset minutes = int(time_worked_current mod 60)>
            <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
            <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td>
              <td align="center">Edit</td>
              <cfelse>
             <td>#TimeFormat(time_out, "hh:mm tt")#</span></td>
            <td>#time_worked#</span></td>
           
            <cfset hours = int(time_worked\60)>
            <cfset minutes = int(time_worked mod 60)>
            <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
            <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td> 
            <td align="center">Edit</td></cfif>
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
