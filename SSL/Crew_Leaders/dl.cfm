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
SELECT DISTINCT event_name,job_id FROM events WHERE branch = '#Session.branch#'  <!--- AND export_id =1  --->
ORDER by event_name 
</cfquery>
  <cfelse>
  <cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  <!--- AND export_id =1  --->
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
    <td class="jlbar_img" width="135"></td>
      <td class="jlbar_img"><a href="dl.cfm"><img src="images/icon_daily_joblist.png" width="27" height="29" /></a></td>
      <td class="jlbar_img"><a href="dl.cfm?job_id=9999"><img src="images/icon_daily_alljobs.png" width="29" height="29" /></a></td>
    </tr>
  </table>

</div>
           <ul class="jllist">
         <cfif job_id EQ "9999">  <li class="jlbar_header">All Branch Jobs</li> <cfelse> <li class="jlbar_header">Todays Jobs</li></cfif>
              <cfoutput query="get_todays_jobs"> 
			 
                <li><a href="/ssl/crew_leaders/job_list.cfm?Job_ID=#Job_ID#&work_date=#todayDate#" target="_top">#event_name#</a></li>
              </cfoutput>
           
              <li><cfoutput><a href="dl.cfm?Job_ID=9999&work_date=#todayDate#"></cfoutput> 
               <br>
<br>
Show Me All Branch Jobs</a> </li>
          
          </ul></body>
</html>
