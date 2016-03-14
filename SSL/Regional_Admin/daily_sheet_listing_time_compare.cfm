<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>

 
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>


<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>

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
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
 <style type="text/css">
 
  input { text-align:left; }
  .arialfont {font: normal .9em Arial, Helvetica, sans-serif;}
 .redarial {font: normal .9em Arial, Helvetica, sans-serif;color: red;}
  .greenarial {font: normal .9em Arial, Helvetica, sans-serif;color: green;}

 .redarial {
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
.redtype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: bold 1em Arial, Helvetica, sans-serif;
	color: red;
}
.greentype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: normal 1em Arial, Helvetica, sans-serif;
	color: #00573d;
}
.notesh2 {
	margin-left: 20px;
	padding: 20px;
	border: 1px solid #dce9e5;
	font: bold 14px Arial, Helvetica, sans-serif;
	color: #00573d;
	background-color: #dce9e5;
}
form{
	margin:0 auto;
}
.search { 
	padding:7px 5px 9px 10px;
	margin:3px; 
}
input[type=text]{
	color:#333;
}
input[type=submit], input[type=submit]:hover {
	padding:8px 10px 10px 10px;
	position:relative; 
	left:-10px;
	border:1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#16705a), color-stop(100%,#00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%,#00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3',GradientType=0 ); /* IE6-9 */
	color:#fff;
	cursor: pointer;
}

</style>
 </head>
<body>
<!--<div id="outerfull">-->
<div id="centrecontent">
 <cfinclude template="includes/subbar.cfm">  
  <cfinclude template="includes/topbar.cfm">  
<!--centre content goes here -->
<div class="centrecontent_inner">
   <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>  
  
 <form action="daily_sheet_listing_time_compare.cfm" method="post"> 
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap"><div class="header">Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div></td>
         <td   align="left" nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..."><input type="submit" value="Daily Sheets"> 
         </td>
         </tr>
      </table>
     <input type="hidden"  name="submitted" value="yes"/>
</form> <br />

  <cfquery name="get_daily_sheets" datasource="jrgm"   >
 SELECT  ID, Supervisor_ID, Crew_Leader_ID, DS_Date,ds_approved FROM app_daily_sheets 
WHERE ds_date < '#todaydate_DS#'   AND    (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#)
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
ORDER by ID DESC
 </cfquery> 
   <cfif  get_daily_sheets.recordcount EQ 0>
 <span class="arialfont">No Daily Sheets Match Your Criteria.</span>
 <cfabort>
 </cfif>
 <cfset perpage = 50>
 <cfparam name="url.start" default="1">
<cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
</cfif>
 <cfset totalPages = ceiling(get_daily_sheets.recordCount / perpage)>
<cfset thisPage = ceiling(url.start / perpage)>
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
    <td>[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets  </a></cfoutput>
<cfelse>
 <!---   Newer Daily Sheets --->
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
   <!--- Older Daily Sheets --->
</cfif>
]
 </td> 
  <td><cfoutput>
 You are on page #thisPage# of #totalPages#.
 </cfoutput>
 </td>
  </tr>
</table> 
 <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>
       <tr>
        <th align="left">ID
          </td>        </th>
        <th align="left">Date
          </td>        </th>
        <th align="left">Branch
          </td>        </th>
        <th align="left">Supervisor
          </td>        </th>
        <th align="left">Crew Leader
          </td>        </th>
        <th align="left">View
          </td>        </th>
        <th align="right">Day <br />
         Time</th>
        <th align="right">Service <br />
         Time</th>
        <th align="right">Minute<br />
         Difference</th>
        <th align="right">%<br />
         Accounted<br />
         For</th>
        <th align="center">Type</th>
         <th align="center">Edit</th>
      </tr>
    </thead>
    <tbody>
    
 <CFSET startrow = #url.start#>
 <CFSET endrow = startrow+50>
 <CFSET mylist ="">
 <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>

<cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT ds_ID FROM app_gps WHERE   ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_time_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT * FROM app_employee_payroll_clock WHERE ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_service_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT * FROM app_job_services_actual_employee WHERE ds_ID IN (#mylist#) 
</cfquery>
       <cfoutput query="get_daily_sheets" startrow="#url.start#" maxrows="#perpage#">
        <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.crew_leader_id#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.supervisor_id#
        </cfquery>
        <tr>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">#get_daily_sheets.ID#</a></td>
          <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td align="left">#get_info_S.branch#</td>
          <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">View</a></td>
           <cfquery name="get_employee_minutes_for_day"   dbtype="query" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                 <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                
                 <cfif get_employee_minutes_for_day.recordcount EQ 0>
                <CFSET minutes_worked_day = 0>
                <cfelse>
                <CFSET minutes_worked_day = #get_employee_minutes_for_day.minutes_worked_day#>
                </cfif>
                
                
          <td align="right">#minutes_worked_day#</td>
            <cfquery name="get_employee_service_minutes_for_day"  dbtype="query" maxrows="1">
SELECT Sum(total_time) AS  service_minutes_worked_day FROM  get_all_employee_service_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                <cfif get_employee_service_minutes_for_day.recordcount EQ 0>
                <CFSET service_minutes_worked_day = 0>
                <cfelse>
                <CFSET service_minutes_worked_day = #get_employee_service_minutes_for_day.service_minutes_worked_day#>
                </cfif>
          <td align="right">#service_minutes_worked_day#</td>
          <cfset diff =service_minutes_worked_day- minutes_worked_day>
          <td align="right">#diff#</td>
          <cfif service_minutes_worked_day EQ 0 OR  minutes_worked_day EQ 0>
          <CFSET diffper = 0>
           <cfelse>
           <cfset diffper=100*get_employee_service_minutes_for_day.service_minutes_worked_day/get_employee_minutes_for_day.minutes_worked_day> </cfif>
        <cfif diffper GT 100  OR diffper LT 80>  
        <td align="right"  class="redarial">#NumberFormat(diffper,"09.9")#</td>
        <cfelse>
        <td align="right">#NumberFormat(diffper,"09.9")#</td>
        </cfif>
         <td align="center">
  <cfquery name="get_ds_edits" datasource="jrgm" maxrows="1" blockfactor="1">
SELECT   ds_id FROM app_employee_payroll_clock_backup WHERE ds_id =#get_daily_sheets.ID#
 </cfquery>  
  <cfquery name="nogps"   dbtype="query" maxrows="1" blockfactor="1">
SELECT     ds_ID
FROM        get_all_gps_info
WHERE     ds_id =  #get_daily_sheets.ID#
 </cfquery>
  <cfif get_ds_edits.recordcount GT 0  OR nogps.recordcount EQ 0 >
 Manual 
 <cfelse>
 APK
  </cfif>
 </td> 
 
 
    <cfif       ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM)) >
                <cfif get_daily_sheets.ds_approved EQ 1>
                  <td><a href="daily_sheet.cfm?dsid=#ID#" class="greenarial">Approved</a></td>
                  <cfelse>
                  <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">Edit</a> </td>
                </cfif>
                <cfelse>
                <td> -</td>
              </cfif>
 
 
 
 <!---  <td align="center"> <a href="daily_sheet_edit.cfm?dsid=#ID#">Edit</a> </td>  --->

    </tr>
      </cfoutput>
    </tbody>
  </table>
   <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
     <td> 
 </td><td align="right">[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets</a></cfoutput>
<cfelse>
    Newer Daily Sheets
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
  Older Daily Sheets
</cfif>
]
 </td> 
 
  
  </tr>
</table> 
  
</div>
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
