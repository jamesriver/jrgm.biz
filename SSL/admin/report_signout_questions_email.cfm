<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset Now_Time = Now()>
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
<style type="text/css">
.dstable_l1 {
	padding: 10px;
	background-color: #aac9c1;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold 1.05em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
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
      <cfset y = year(now())>
      <cfset m = month(now())>
      <cfset d = day(now())>
      <cfset today_5PM = createDatetime(y,m,d,17,0,0)>
      <cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
      <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
      <cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
      <CFSET outtime = today_5PM>
      <CFSET todays_date = #DateFormat(Now())#>
      
      
 <!-------------------------Hours Question-------------------------------- --->
      <cfquery name="get_disagreed_workers_hours" datasource="jrgm">
     SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0
       AND ds_date = '#todays_date#'
       ORDER by ds_date desc
          </cfquery>
      <cfloop query="get_disagreed_workers_hours" >
        <cfquery name="get_emp_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_disagreed_workers_hours.employee_id#
     </cfquery>
        <cfquery name="get_CL_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_disagreed_workers_hours.crew_leader#
     </cfquery>
        <cfquery name="get_info_S" datasource="jrgm"  >
SELECT  [Name FirstLast] AS employee_name,branch,email
FROM   app_employees WHERE [Employee ID] =#get_disagreed_workers_hours.supervisor#
        </cfquery>
        <cfmail to="patrick.hutchinson2@gmail.com,#get_info_S.email#"    from="patrick.hutchinson2@gmail.com"  subject="JRGM Employee Sign-Out Question - HOURS" type="html"><br />
       <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
          <cfinclude   template="includes/footer.cfm">
          <br />
          <span class="arialfont">#get_emp_name.first_name# #get_emp_name.last_name# - Employee ID: #get_disagreed_workers_hours.ID# of #get_cl_name.first_name# #get_cl_name.last_name#'s crew answered "I do not agree" to HOURS sign-out question today (#DateFormat(todays_date,"mm/dd/yyyy")#).<br />
          The daily sheet ID is #get_disagreed_workers_hours.ds_id#<br />
          <br />
          Please contact the employee to see why they answered "I do not agree" to HOURS sign-out question today.</span><br />
          <br />
        </cfmail>
      </cfloop>
      <br />
<br />
 <!-------------------------Injury Question-------------------------------- --->
      <cfquery name="get_disagreed_workers_injury" datasource="jrgm">
     SELECT * FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0
       AND ds_date = '#todays_date#'
       ORDER by ds_date desc
          </cfquery>
      <cfloop query="get_disagreed_workers_injury" >
        <cfquery name="get_emp_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_disagreed_workers_injury.employee_id#
     </cfquery>
        <cfquery name="get_CL_name" datasource="jrgm">
    SELECT first_name,last_name FROM APP_employees
    WHERE [employee ID] =#get_disagreed_workers_injury.crew_leader#
     </cfquery>
         <cfquery name="get_info_S" datasource="jrgm"  >
SELECT  [Name FirstLast] AS employee_name,branch,email
FROM   app_employees WHERE [Employee ID] =#get_disagreed_workers_injury.supervisor#
        </cfquery>
        <cfmail to="patrick.hutchinson2@gmail.com,#get_info_S.email#"   from="patrick.hutchinson2@gmail.com"  subject="JRGM Employee Sign-Out Question - INJURY" type="html"><br />
       <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
          <cfinclude   template="includes/footer.cfm">
          <br />
          <span class="arialfont">#get_emp_name.first_name# #get_emp_name.last_name# - Employee ID: #get_disagreed_workers_injury.ID# of #get_cl_name.first_name# #get_cl_name.last_name#'s crew answered "I do not agree" to INJURY sign-out question today (#DateFormat(todays_date,"mm/dd/yyyy")#).<br />
          The daily sheet ID is #get_disagreed_workers_injury.ds_id#<br />
          <br />
          Please contact the employee to see why they answered "I do not agree" to INJURY sign-out question today.</span><br />
          <br />
        </cfmail>
      </cfloop>
      It Ran 2
      <!--- cc="nfirth@jrgm.com" --->
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
