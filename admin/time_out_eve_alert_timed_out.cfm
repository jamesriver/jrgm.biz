<cfabort>
<cfif CGI.HTTP_USER_AGENT EQ 'CFSCHEDULE' >
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>James River Grounds Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="css/styles.css" rel="stylesheet" type="text/css" />
  <link href="css/bootstrap.css" rel="stylesheet" />
  <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  </head>
  <body>
  <!--<div id="outerfull">
-->
  <div id="centrecontent">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset Now_Time = Now()>
      <cfset y = year(now())>
      <cfset m = month(now())>
      <cfset d = day(now())>
      <cfset today_5PM = createDatetime(y,m,d,17,0,0)>
      <cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
      <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
      <cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
      <CFSET outtime = today_5PM>
      <cfset mytime = timeFormat(now(), "hh:mm tt")>
      <cfquery name="get_open_CL" datasource="jrgm" >
    SELECT   DISTINCT  crew_leader,ds_id, supervisor FROM APP_Employee_Payroll_Clock  
    WHERE in_out_status=1 AND time_out IS NULL
    ORDER by crew_leader 
     </cfquery>
      <!---   These are the open crew leaders so we dot want these in this email --->
      <CFSET mylisto ="">
      <cfloop query="get_open_CL">
        <cfset myListo = ListAppend(mylisto,crew_leader)>
      </cfloop>
      <cfquery name="get_closed_CL" datasource="jrgm" >
    SELECT   DISTINCT  crew_leader,ds_id, supervisor FROM APP_Employee_Payroll_Clock  
    WHERE in_out_status=2 AND crew_leader  NOT IN (#myListo#) AND ds_date  > #yesterday_5PM#
    ORDER by crew_leader 
     </cfquery>
      <cfloop query="get_closed_CL" >
        <cfquery name="get_max_time" datasource="jrgm"  maxrows="1">
    SELECT    time_out  AS maxtimeout FROM APP_Employee_Payroll_Clock  
    WHERE in_out_status=2 AND ds_id = #get_closed_CL.ds_id#  
    ORDER by ID DESC
       </cfquery>
        <CFSET mylist ="">
        <cfquery name="get_CL_name" datasource="jrgm">
    SELECT first_name,last_name,branch FROM APP_employees
  WHERE  [Employee ID] =#get_closed_CL.crew_leader#
     </cfquery>
        <cfquery name="get_super_name" datasource="jrgm">
    SELECT firstname,lastname,email FROM app_employee_passwords
    WHERE  employee_ID =#get_closed_CL.supervisor#
     </cfquery>
        <cfquery name="get_bm_name" datasource="jrgm">
  SELECT firstname,lastname,email FROM app_employee_passwords
  WHERE employee_branch = '#get_CL_name.branch#' AND access_role = 9
  </cfquery>
        <cfset myList = ListAppend(mylist,#get_bm_name.email#)>
        <cfset myList = ListAppend(mylist,#get_super_name.email#)>
        <cfoutput>#myList#</cfoutput><br />
        <cfoutput> #get_closed_CL.ds_id# -#get_super_name.email#,#get_bm_name.email# -#TimeFormat(get_max_time.maxtimeout, "hh:mm tt")# </cfoutput><br />
        <cfmail to="#myList#"    FROM="patrick.hutchinson2@gmail.com"    subject="JRGM Employee Auto Time Out Alert" type="html">
          <!--- cc="nfirth@jrgm.com" --->
          <cfinclude   template="includes/footer.cfm">
          <br />
          This is a message from the JRGM alert system.<br />
          <br />
          #get_CL_name.first_name# #get_CL_name.last_name#'s crew timed out for today at #TimeFormat(get_max_time.maxtimeout, "hh:mm tt")# <br />
          <br />
          The daily sheet ID is #get_closed_CL.ds_id#<br />
          <br />
          This email was sent to:<br />
          #get_bm_name.firstname# #get_bm_name.lastname# - #get_bm_name.email#<br />
          #get_super_name.firstname# #get_super_name.lastname# - #get_super_name.email#<br />
          <br />
          <br />
          <br />
          You do not need to respond to this email..
        </cfmail>
      </cfloop>
      <cfmail to="patrick.hutchinson2@gmail.com" FROM="patrick.hutchinson2@gmail.com"  subject="JRGM Employee Auto Time Out Alert"  type="html">
        JRGM Employee Auto Time Out Alert Ran
      </cfmail>
    </div>
  </div>
  </div>
  </body>
  </html>
</cfif>
