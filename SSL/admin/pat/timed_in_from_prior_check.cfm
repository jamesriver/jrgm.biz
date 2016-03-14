<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent">
  <!--centre content goes here -->
<!---   <div class="centrecontent_inner"> ---><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>    
	<cfset todayDate = Now()>
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
    <!---    
    Get the first time in of today --->
  <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date = '#today_datex#'
 </cfquery>
 
  <!--- <cfdump var="#get_first_time_in#"> --->
  <span class="bluebutton">These Daily Sheets came in after the first daily sheet of today. They didnt sync until today.</span><br />
  <br />
<cfquery name="get_APK_time_after_DSID" datasource="jrgm">
 SELECT  DISTINCT ds_id   FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#today_datex#' AND ID > #get_first_time_in.first_id_oftheday#
  </cfquery>
     <CFSET mylist ="0">
 <cfloop query="get_APK_time_after_DSID" >
  <cfset myList = ListAppend(mylist,ds_id)>
</cfloop>
      <cfquery name="get_APK_time_after" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets WHERE ID in (#mylist#)
 ORDER by ID DESC
 </cfquery>  
 
<span class="dashboardHeader"> Daily Sheets</span><br />
<br />
<table class="sortable" cellpadding="0" cellspacing="0" width="90%">
  <thead>
 
      <tr>
        <th align="left">DSID</th>
        <th align="left">ID
 </th>
        <th align="left">Date
              </th>
        <th align="left">Branch
              </th>
        <th align="left">Supervisor
          </th>
        <th align="left">Crew Leader
            </th>
        <th align="left">Approved
              </th>
       </tr>
    </thead>
    <tbody>
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
           <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td align="left">#get_info_S.branch#</td>
          <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
       <cfif get_APK_time_after.ds_approved EQ 1>
                  <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                  <cfelse>
                  <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">-</a> </td>
                </cfif>
            </tr>
      </cfoutput>
    </tbody>
</table><br />
<br />
<br />

<!---    
    Get the first time in of today --->
    
  <cfquery name="get_first_time_in" datasource="jrgm">
 SELECT MIN(ID) AS  first_id_oftheday  FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date = '#today_datex#'
 </cfquery>
 
 <!--- <cfdump var="#get_first_time_in#"> --->
    
   <cfquery name="get_APK_time_after" datasource="jrgm">
 SELECT * FROM APP_Employee_Payroll_Clock WHERE entry_method IS NULL AND ds_date < '#today_datex#' AND ID > #get_first_time_in.first_id_oftheday#
 </cfquery>
 
<!---   
    <cfdump  var="#get_APK_time_after#"> --->
    
<span class="dashboardHeader"> Payroll ROWS Affected</span><br />
<br />
<table class="sortable" cellpadding="0" cellspacing="0" width="90%">
  <thead>
 
      <tr>
        <th align="left">DSID</th>
        <th align="left">ID
           </th>
        <th align="left">Date
           </th>
        <th align="left">Branch
         </th>
        <th align="left">Supervisor
          </th>
        <th align="left">Crew Leader
        </th>
        <th align="left">Approved
             </th>
       </tr>
    </thead>
    <tbody>
        <cfoutput query="get_APK_time_after" >
        <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_APK_time_after.crew_leader#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_APK_time_after.supervisor#
        </cfquery>
        <tr>
            <td><a href="../daily_sheet.cfm?dsid=#get_APK_time_after.ds_id#">#get_APK_time_after.ds_id#</a></td>
          <td>#get_APK_time_after.ID#</td>
           <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td align="left">#get_info_S.branch#</td>
          <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
          <td>#approved_by#</td>
          </tr>
      </cfoutput>
    </tbody>
</table>
     <br />
  <!---   <br />
    <cfif  time_me_out.recordcount GT 0>
      <cfloop query="time_me_out">
        <cfset y = year(time_me_out.ds_date)>
        <cfset m = month(time_me_out.ds_date)>
        <cfset d = day(time_me_out.ds_date)>
        <cfset thatday_5PM = createDatetime(y,m,d,17,0,0)>
        <CFSET outtime = thatday_5PM>
      
      </cfloop>
    </cfif> ---></td>
  </tr>
</table>


    </div>
</div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div -->
<cfinclude template="../includes/footer.cfm">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
