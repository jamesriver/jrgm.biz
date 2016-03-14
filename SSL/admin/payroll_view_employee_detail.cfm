<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset  date2015 = '12/31/2014'>
<cfset Now_Time = Now()>
<cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name,branch    FROM 
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
<style type="text/css">
.thistext {
	font-family: Arial, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif;
	font-size: 12px;
	font-style: italic;
}
table.sortable {
	background: #FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable thead {
	padding: 5px;
	background-color: #cde3fc;
	color: #000;
	cursor: default;
	font: bold .8em Arial, Helvetica, sans-serif;
}
table.sortable thead th {
	padding: 5px;
	background-color: #cde3fc;
	color: 000;
	font: bold 1em Arial, Helvetica, sans-serif;
}
table.sortable tbody tr {
	border: 1px solid #b3d4e5;
	padding: 5px;
}
table.sortable tbody tr.alt {
	background: #ffffff url(../images/tralt-bg.jpg) top left repeat-x;
}
table.sortable tbody tr:hover {
	background: #cde3fc none;
}
table.sortable tbody td {
	padding: 5px;
	font: normal .85em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
</style>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap"><span class="header">Payroll Detail for <cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name# <br />
              Branch:#get_employees_name.branch# &nbsp;&nbsp;   Employee ID : #url.empid# </cfoutput></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="payroll_view_employee_detail2.cfm?empid=<cfoutput>#url.empid#</cfoutput>">Get Daily Totals</a></td>
        </tr>
      </table>
      <p><strong>Payroll for 2015/2016</strong></p>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"  >
        <thead>
          <tr>
            <th align="left">Pay Period Totals</th>
            <th align="left">Hours</th>
            <th align="left">(+/-) Edits</th>
            <th align="left">Total</th>
          </tr>
        </thead>
        <tbody>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#url.empid# AND ds_date > '12/31/2014'
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
      <cfquery name="get_employee_time" datasource="jrgm" >
SELECT * FROM 
app_employee_payroll_clock WHERE Employee_ID =#url.empid#
AND ds_date > '12/31/2014'
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
            <th align="left">Time<br />
              Worked</th>
            <th align="left">Time<br />
              Worked</th>
            <!---  <th align="center">Approve</td>
           <th align="center">Edit</td> ---> 
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
                <!---  <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td>
              <td align="center">Edit</td> --->
                <cfelse>
                <td>#TimeFormat(time_out, "hh:mm tt")#</span></td>
                <td>#time_worked#</span></td>
                <cfset hours = int(time_worked\60)>
                <cfset minutes = int(time_worked mod 60)>
                <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
                <!---    <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td> 
            <td align="center">Edit</td> --->
              </cfif>
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
