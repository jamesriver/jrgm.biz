<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
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
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="header">Payroll Detail for <cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name# <br />
              Branch:#get_employees_name.branch# &nbsp;&nbsp;   Employee ID : #url.empid# </cfoutput></td>
        </tr>
      </table>
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
      <cfquery name="get_employee_time_summed" datasource="jrgm" >
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#url.empid#
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
        <thead>
          <tr>
            <th align="left">Day</th>
            <th align="left">Date</th>
            <th align="left">DSID</th>
            <th align="left">Time<br />
              Worked</th>
            <th align="left">Time<br />
              Worked</th>
            <!---    <th align="center">Approve</td> --->
          </tr>
        </thead>
        <tbody>
          <cfoutput query="get_employee_time_summed">
            <tr>
              <td>#DateFormat(ds_date, "dddd")#</span></td>
              <td>#DateFormat(ds_date, "mm/dd/yyyy")#</span></td>
              <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></span></td>
              <cfif In_Out_Status EQ 1>
                <td>Currently Working</td>
                <!---  <cfset hours = int(time_worked_current\60)>
            <cfset minutes = int(time_worked_current mod 60)>--->
               <td>&nbsp;</td>
                <!--- <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td> --->
                <cfelse>
                <td>#sumdailytime#</span></td>
                <cfset hours = int(sumdailytime\60)>
                <cfset minutes = int(sumdailytime mod 60)>
                <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
                <!---  <td align="center"><input type="checkbox" name="checkbox" id="checkbox" /></td>  --->
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
