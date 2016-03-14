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
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
html {
	position: relative;
	min-height: 100%;
}
body {
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 100px;
	width: 100%;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.arialfont 2 {
font: normal .8em Arial, Helvetica, sans-serif;
}
.centrecontent_inner {
	padding: 20px;
}
</style>
</head>
<body>
<!--<div id="outerfull">-->
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
<cfinclude template="includes/topbar.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">    <div class="header"> Tablet Sync Report </div>
    <span class="arialfont"><strong> This report shows crew leaders / tablets that havent synced at least one day in the past 30 days</strong></span>.<br />
    <span class="arialfont">Click on the header to sort/group together.</span> <br />
    <br />
    <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td><cfset todayDate = Now()>
          <cfset today_datex = #DateFormat(todayDate, "mm/dd/yyyy")#>
          <cfset y = year(now())>
          <cfset m = month(now())>
          <cfset d = day(now())>
          <cfset today_5PM = createDatetime(y,m,d,17,0,0)>
          <cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
          <cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
          <cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
          <CFSET outtime = today_5PM>
          <cfset mytime = timeFormat(now(), "hh:mm tt")>
          <cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees 
 </cfquery>
           <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
            <thead>
              <tr>
                <th align="left">DSID</th>
                <th align="left">ID </th>
                <th align="left">Date</th>
                <th align="left">DS Date </th>
                <th align="left">Days Late</th>
                <th align="left">Branch </th>
                <th align="left">Supervisor </th>
                <th align="left">Crew Leader </th>
                <th align="left">Approved </th>
              </tr>
            </thead>
            <tbody>
              <CFSET mylistused ="0">
              <cfset startDate = Now()-30>
              <cfset endDate = Now() >
              <cfloop from="#startDate#" to="#endDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
                <!---<cfoutput>#dateformat(i, "mm/dd/yyyy")#<br /></cfoutput>   --->
                <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date =
 '#DateFormat(i, "mm/dd/yyyy")#'
  </cfquery>
                <cfif get_first_time_in.first_id_oftheday NEQ "">
                  <cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#DateFormat(i, "mm/dd/yyyy")#' AND ID > #get_first_time_in.first_id_oftheday#
  </cfquery>
                  <CFSET mylist ="0">
                  <cfloop query="get_APK_time_after_DSID" >
                    <cfset myList = ListAppend(mylist,ds_id)>
                  </cfloop>
                  <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#) AND ID NOT In (#mylistused#)      
 ORDER by ID DESC
 </cfquery>
                  <cfoutput query="get_APK_time_after" >
                    <cfquery name="get_info_CL"  dbtype="query"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID   =#get_APK_time_after.CREW_LEADER_ID#
        </cfquery>
                    <cfquery name="get_info_S"  dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID=#get_APK_time_after.supervisor_ID#
        </cfquery>
                    <cfquery name="get_sync_date"  datasource="jrgm"   >
 SELECT   MAX(record_created)   AS sync_date
FROM         app_employee_payroll_clock
WHERE     (ds_id = #get_APK_time_after.ID#) 
        </cfquery>
                    <CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#>
                    <cfif  var LT 0>
                      <tr>
                        <td><a href="daily_sheet.cfm?dsid=#get_APK_time_after.ID#">#get_APK_time_after.ID#</a></td>
                        <td>#get_APK_time_after.ID#</td>
                        <td nowrap="nowrap">#DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#</td>
                        <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                        <CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#>
                        <td align="left">#var#</td>
                        <td align="left">#get_info_S.branch#</td>
                        <td>#get_info_S.employee_name#</td>
                        <td>#get_info_CL.employee_name#</td>
                        <cfif get_APK_time_after.ds_approved EQ 1>
                          <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                          <cfelse>
                          <td><a href="daily_sheet.cfm?dsid=#ID#&amp;email=yes">-</a></td>
                        </cfif>
                      </tr>
                    </cfif>
                    <cfset mylistused = ListAppend(mylistused,get_APK_time_after.ID)>
                  </cfoutput>
                </cfif>
              </cfloop>
            </tbody>
          </table></td>
      </tr>
    </table>
    
    <!---    <!---    
    Get the first time in of today --->
        <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
          <thead>
            <tr>
              <th align="left">DSID</th>
              <th align="left">ID </th>
              <th align="left">Date</th>
              <th align="left">DS Date </th>
              <th align="left">Days</th>
              <th align="left">Branch </th>
              <th align="left">Supervisor </th>
              <th align="left">Crew Leader </th>
              <th align="left">Approved </th>
            </tr>
          </thead>
          <tbody>
             <CFSET mylistused ="0">
            <cfset startDate = Now()-10>
            <cfset endDate = Now() >
            <cfloop from="#startDate#" to="#endDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
              <!--- <cfoutput>#dateformat(i, "mm/dd/yyyy")#<br /></cfoutput>  --->
   <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date =
 '#DateFormat(i, "mm/dd/yyyy")#'
  </cfquery>
              <cfif get_first_time_in.first_id_oftheday NEQ "">
<cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#DateFormat(i, "mm/dd/yyyy")#' AND ID > #get_first_time_in.first_id_oftheday#
  </cfquery>
                <CFSET mylist ="0">
                <cfloop query="get_APK_time_after_DSID" >
                  <cfset myList = ListAppend(mylist,ds_id)>
                </cfloop>
                <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#) AND ID NOT In (#mylistused#) 
 ORDER by ID DESC
 </cfquery>
 
                <cfoutput query="get_APK_time_after" >
                  <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_APK_time_after.CREW_LEADER_ID#
        </cfquery>
                  <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_APK_time_after.supervisor_ID#
        </cfquery>
                  <tr>
                    <td><a href="../daily_sheet.cfm?dsid=#get_APK_time_after.ID#">#get_APK_time_after.ID#</a></td>
                    <td>#get_APK_time_after.ID#</td>
                    <td nowrap="nowrap">#DateFormat(i, "mm/dd/yyyy")#</td>
                    <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                    <!---<CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(i, "mm/dd/yyyy")#>--->
                    <CFSET var =  #dateformat(ds_date,"mm/dd/yyyy")#- #DateFormat(get_sync_date.sync_date, "mm/dd/yyyy")#>
                    <td align="left">#var#</td>
                    <td align="left">#get_info_S.branch#</td>
                    <td>#get_info_S.employee_name#</td>
                    <td>#get_info_CL.employee_name#</td>
                    <cfif get_APK_time_after.ds_approved EQ 1>
                      <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                      <cfelse>
                      <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">-</a> </td>
                    </cfif>
                  </tr>     
          <cfset mylistused = ListAppend(mylistused,get_APK_time_after.ID)>
        <!---       #mylistused#   --->
                </cfoutput>
              </cfif>
         
            </cfloop>
          </tbody>
        </table></td>
    </tr>
  </table>---> 
    <br />
    <br />
    
    <!--- <cfabort> ---> 
  </div>
</div>
<!-- to clear footer --> 
<!--</div>--> 
<!-- end outer div -->
<cfinclude template="includes/footer.cfm">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
