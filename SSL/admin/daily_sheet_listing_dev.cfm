<CFSET request.dsn = 'agilist2'>
<cfparam name="dsid"     default="100">
<cfparam name="form.dsid"     default="100">
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
.YesNoButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background:-moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color:#8299bb;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #3f4b5b;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	text-align: center;
	padding:6px 24px;
	text-decoration:none;
	width: 200px;
	margin-right: 40px;
	margin-top: 20px;
}
.YesNoButton:hover {
	color:#ffffff;
	text-decoration:none;
}
.removebutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#b92723;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	text-align: center;
	padding:6px 24px;
	text-decoration:none;
	width: 350px;
	margin-right: 40px;
	margin-top: 20px;
}
.removebutton:hover {
	color:#ffffff;
	text-decoration:none;
}
.search {
	padding:7px 15px 9px 10px;
	margin:3px;
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
  <cfif IsDefined("url.delete") AND url.delete EQ 'yes'>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="dailysheet_header">Are you sure you want to delete Daily Sheet ID <cfoutput>#url.dsid#</cfoutput>?<br />
          <cfoutput><a href="daily_sheet_listing.cfm?dsid=#url.dsid#&amp;deleteme=yes" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_listing.cfm" class="YesNoButton">No. Go back to list</a>
            <p  class="redarial"> <br />
              Choosing yes will delete this daily sheet. </p>
          </cfoutput>
          <cfabort>
        </td>
      </tr>
    </table>
  </cfif>
  <cfif IsDefined("url.deleteme") AND url.deleteme EQ 'yes'>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM app_daily_sheets WHERE ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM APP_job_services_clock  WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE  FROM  app_employee_payroll_clock WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE  FROM  app_lunch WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM APP_job_clock WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM   APP_job_materials_actual WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="#request.dsn#" >
   DELETE   FROM APP_Lunch WHERE DS_ID =#url.dsid#
    </cfquery>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="dailysheet_header">This daily sheet has been deleted.
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <br />
          <a href="daily_sheet_listing.cfm" class="YesNoButton"> Go back to list</a>
          <cfabort>
        </td>
      </tr>
    </table>
  </cfif>
  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  
   <table width="100%" border="0" cellspacing="10" cellpadding="0">
      <tr class="arialfont">
        <td class="header">DEV DAILY SHEETS</td>
      </tr>
    </table>
 
  <cfquery name="get_daily_sheets" datasource="#request.dsn#" >  
 SELECT  * FROM app_daily_sheets WHERE ID  > 32717 
ORDER by ID DESC
 </cfquery>
  <cfset perpage = 50>
  <cfparam name="url.start" default="1">
  <cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
  </cfif>
  <cfset totalPages = ceiling(get_daily_sheets.recordCount / perpage)>
  <cfset thisPage = ceiling(url.start / perpage)>
  <cfif  NOT IsDefined("form.submitted") >
    <table width="100%" border="0" cellspacing="10" cellpadding="0">
      <tr class="arialfont">
        <td> [
          <cfif url.start gt 1>
            <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
            <cfoutput><a href="#link#">Newer Daily Sheets </a></cfoutput>
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
          ] </td>
        <td width="50%">&nbsp;</td>
      </tr>
    </table>
  </cfif>
  <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>
      <tr>
        <th align="left">ID
          </td>
        </th>
        <th align="left">Date
          </td>
        </th>
        <th align="left">Branch
          </td>
        </th>
        <th align="left">Supervisor
          </td>
        </th>
        <th align="left">Crew Leader
          </td>
        </th>
        <th align="left">View
          </td>
        </th>
       <!--- <th align="left">Approve
          </td>
        </th>--->
      <!---  <th align="left">Delete</th>--->
        <td>Method</td>
      <!---  <th align="left">Morning</th>
        <th align="left">Evening</th>--->
      </tr>
    </thead>
    <tbody>
      <CFSET startrow = #url.start#>
      <CFSET endrow = startrow+50>
      <CFSET mylist ="">
      <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
        <cfset myList = ListAppend(mylist,ID)>
      </cfloop>
      <cfoutput query="get_daily_sheets" startrow="#url.start#" maxrows="#perpage#">
        <cfquery name="get_info_CL" datasource="#request.dsn#"   cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.crew_leader_id#
        </cfquery>
        <cfquery name="get_info_S" datasource="#request.dsn#"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.supervisor_id#
        </cfquery>
        <tr>
          <td><a href="../dailysheet/daily_sheet.cfm?dsid=#get_daily_sheets.ID#" target="_blank">#get_daily_sheets.ID#</a> </td>
          <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td align="left">#get_info_S.branch#</td>
          <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
          <td><a href="../dailysheet/daily_sheet.cfm?dsid=#get_daily_sheets.ID#" target="_blank">View</a></td>
        <!---  <cfif get_daily_sheets.ds_approved EQ 1>
            <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
            <cfelse>
            <td><a href="daily_sheet.cfm?dsid=#ID#&amp;email=yes">-</a> </td>
          </cfif>--->
         <!--- <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  >
            <td><a href="daily_sheet_listing.cfm?delete=yes&dsid=#get_daily_sheets.ID#">Delete</a></td>
            <cfelse>
            <td> -</td>
          </cfif>--->
          <td><cfif get_daily_sheets.entry_method EQ 2>
              Manual
              <cfelse>
              APP
            </cfif>
          </td>
          <!---<cfif get_daily_sheets.entry_method EQ 2>
            <td>N/A</td>
            <cfelse>
            <cfquery name="get_eq_count" datasource="#request.dsn#"   >
SELECT  COUNT(ID) AS pieces
FROM         equipment WHERE Crew_assignment_last =#get_daily_sheets.crew_leader_id#  
        </cfquery>
            <cfquery name="get_MI" datasource="#request.dsn#"   >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_daily_sheets.crew_leader_id# AND Inspection_Date = #ds_date# 
AND Inspection_Type ='Morning'
        </cfquery>
            <cfif get_MI.recordcount EQ 1>
              <td><a href="Morning_Inspection_Form.cfm?INSPECTION_ID=#get_MI.INSPECTION_ID#">Morning</a></td>
              <cfelseif get_MI.recordcount GT 1>
              <td>See Admin</td>
              <cfelse>
              <td>#get_eq_count.pieces#</td>
            </cfif>
          </cfif>
          <cfif get_daily_sheets.entry_method EQ 2>
            <td>N/A</td>
            <cfelse>
            <cfquery name="get_EI" datasource="#request.dsn#"   >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_daily_sheets.crew_leader_id# AND Inspection_Date = #ds_date# 
AND Inspection_Type ='Evening'
        </cfquery>
            <cfif get_EI.recordcount EQ 1>
              <td><a href="Evening_Inspection_Form.cfm?INSPECTION_ID=#get_EI.INSPECTION_ID#">Evening</a></td>
              <cfelseif get_EI.recordcount GT 1>
              <td>See Admin</td>
              <cfelse>
              <td>#get_eq_count.pieces#</td>
            </cfif>
          </cfif>--->
        </tr>
      </cfoutput>
    </tbody>
  </table>
  <!--  </div>-->
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
