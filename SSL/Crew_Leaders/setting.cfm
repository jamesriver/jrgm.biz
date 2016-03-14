<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfif job_id EQ "9999">
  <cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE branch = '#Session.branch#'  AND export_id =1 
ORDER by event_name,start_date
</cfquery>
  <cfelse>
  <cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  AND export_id =1 
ORDER by start_date,event_name
</cfquery>
</cfif>


<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<link href="css/styles_dl.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
</head>

<body>
<div class="jlbar">
  <table border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td><span class="jlbar_header">Settings</span></td>
    <td class="jlbar_img"><img src="images/clear.gif" width="29" height="29" /></td>

    </tr>
  </table>

</div>
           <ul class="jllist">
            <li><a href="">Espa&ntilde;ol</a></li>
            <li><a href="password.cfm" target="_top">Change Password</a></li>
           <li><a href="email.cfm" target="_top">Change Email Address</a></li>
</ul></body>
</html>
