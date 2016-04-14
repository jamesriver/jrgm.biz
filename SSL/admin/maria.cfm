<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees 
 </cfquery>
<cfquery name="get_all_equipment_info" datasource="jrgm">
SELECT ID, Crew_assignment_last  FROM equipment  
 </cfquery>
<cfquery name="get_all_inspection_info" datasource="jrgm">
SELECT Crew_LeaderID, Inspection_Date , Inspection_Type,INSPECTION_ID    FROM  app_Inspection_Master  
 </cfquery>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_5PM = createDatetime(y,m,d,17,0,0)>
<cfset yesterday_5PM = dateAdd("d",-1,today_5PM)>
<cfset daybeforeyesterday_5PM = dateAdd("d",-2,today_5PM)>
<cfset tomorrow_5PM = dateAdd("d",1,today_5PM)>
<CFSET outtime = today_5PM>
<CFSET todays_date = #DateFormat(Now())#>
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
<style>
.bigfont {
	padding: 5px;
	background-color: #ffffff;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold .95em Arial, Helvetica, sans-serif;
}
table.sortable {
	background: #FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable thead {
	padding: 4px;
	background-color: #cde3fc;
	color: #000;
	cursor: default;
	font: bold .9em Arial, Helvetica, sans-serif;
}
table.sortable thead th {
	padding: 4px;
	background-color: #cde3fc;
	color: 000;
	font: bold .8em Arial, Helvetica, sans-serif;
}
table.sortable tbody tr {
	border: 1px solid #b3d4e5;
	padding: 3px;
}
table.sortable tbody tr.alt {
	background: #ffffff url(../images/tralt-bg.jpg) top left repeat-x;
}
table.sortable tbody tr:hover {
	background: #cde3fc none;
}
table.sortable tbody td {
	padding: 4px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable tbody td:a {
 font: bold .70em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable tbody td:a:hover {
 font: bold .7em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: bold .9em Arial, Helvetica, sans-serif;
}
</style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent">
  <div class="subbar">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="57"><a href="default.cfm"><img src="images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a></td>
        <td class="subbartxt">Welcome:
          <cfif  SESSION.screenname EQ 'Maria Candler' >
            Maria Candler
            <cfelse>
            Jason Knight
          </cfif></td>
        <td width="42"><!--<a href="supervisors/setting.cfm" class="first"><img src="images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
        <td width="20"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
      </tr>
    </table>
  </div>
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner"> <!---<img src="images/clear.gif" width="300" height="1" alt=""/>   <div class="arialfont"><a href="daily_sheet_listing_dev.cfm">Dev Daily Sheets</a> <img src="images/new2.gif" width="33" height="16" alt=""/></div>
     --->
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <cfquery name="get_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT employee_ID FROM app_employee_payroll_clock   WHERE ds_date = '#todays_date#'
 </cfquery>
    <cfquery name="get_number_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT ID FROM app_daily_sheets   WHERE ds_date = '#todays_date#'
 </cfquery>
    <cfoutput>
      <div class="subheader">#get_daily_sheets.recordcount# employees working on #get_number_daily_sheets.recordcount# crews on #DateFormat(todays_date, "mm/dd/yyyy")#</div>
    </cfoutput>
    <div class="spacer20"></div>
    <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
      <thead>
        <tr>
          <th height="25" align="left" bgcolor="#D6D6D6">ID </th>
          <th height="25" align="left" bgcolor="#D6D6D6">Date </th>
          <th height="25" align="left" bgcolor="#D6D6D6">Branch </th>
          <th height="25" align="left" bgcolor="#D6D6D6">Supervisor </th>
          <th height="25" align="left" bgcolor="#D6D6D6">Crew Leader </th>
          <th height="25" align="center" bgcolor="#D6D6D6">View </th>
          <th height="25" align="center" bgcolor="#D6D6D6">Map </th>
          <th height="25" align="left" bgcolor="#D6D6D6">Method</th>
          <th height="25" align="left" bgcolor="#D6D6D6">Morning</th>
          <th height="25" align="left" bgcolor="#D6D6D6">Evening</th>
        </tr>
      </thead>
      <!--- <cfdump var="#get_daily_sheets_for_admin#">   --->
      <cfquery name="get_daily_sheets_for_admin" datasource="jrgm"   maxrows="100"> 
SELECT  * FROM app_daily_sheets   WHERE ds_date = '#todays_date#'
 ORDER by ds_date desc
      </cfquery>
      <tbody>
        <cfoutput query="get_daily_sheets_for_admin">
          <cfquery name="get_info_CL"  dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  Employee_ID AS empid, employee_name AS employee_name
FROM   get_all_employee_info WHERE Employee_ID =#get_daily_sheets_for_admin.crew_leader_id#
        </cfquery>
          <cfquery name="get_info_S"  dbtype="query" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT Employee_ID AS empid, employee_name AS employee_name,branch AS branch_name
FROM   get_all_employee_info WHERE Employee_ID =#get_daily_sheets_for_admin.supervisor_id#
        </cfquery>
          <!---  <cfdump var="#get_info_S#"> --->
          <CFSET ds_date = #DateFormat(get_daily_sheets_for_admin.ds_date, "mm/dd/yyyy")# >
          <CFSET today_datex =#DateFormat(Now(), "mm/dd/yyyy")# >
          <tr>
            <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets_for_admin.ID#</a></td>
            <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
            <!---   <td align="left" nowrap="nowrap">#get_info_S.branch#</td> --->
            <cfif get_info_S.BRANCH_NAME EQ 'Newport News'>
              <CFSET branchnew = "NNEW" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Charlottesville'>
              <CFSET branchnew = "CVLE" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Williamsburg'>
              <CFSET branchnew = "WMBG" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Richmond'>
              <CFSET branchnew = "RICH" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Corporate'>
              <CFSET branchnew = "CORP" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Chesterfield'>
              <CFSET branchnew = "CHES" >
              <cfelseif get_info_S.BRANCH_NAME EQ 'Portsmouth'>
              <CFSET branchnew = "PORT" >
              <cfelse>
              <CFSET branchnew = #Left(get_info_S.BRANCH_NAME,4)# >
            </cfif>
            <td align="left" nowrap="nowrap">#branchnew#</td>
            <td nowrap="nowrap">#get_info_S.employee_name# -#supervisor_id#</td>
            <td nowrap="nowrap">#get_info_CL.employee_name# - #get_info_CL.empid#</td>
            <td align="center" nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#ID#">View</a></td>
            <cfif ds_date GT  yesterday>
              <cfquery name="get_gps_info" datasource="jrgm" maxrows="1">
       SELECT * FROM app_gps
      WHERE DS_ID=#get_daily_sheets_for_admin.ID#  
      ORDER by ID DESC
 			 </cfquery>
              <td align="center" nowrap="nowrap"><a href="https://maps.google.com/maps?q=#get_gps_info.gps_latitude#,#get_gps_info.gps_longitude#" target="_blank">Map</a> 
                <!---  <a href="http://maps.google.com/maps?z=15&t=m&q=loc:#get_gps_info.gps_latitude#+#get_gps_info.gps_longitude#" target="_blank">Map</a> ---></td>
              <cfelse>
              <td align="center" nowrap="nowrap">-</td>
            </cfif>
            <td><cfif get_daily_sheets_for_admin.entry_method EQ 2>
                Manual
                <cfelse>
                APP
              </cfif></td>
            <cfif get_daily_sheets_for_admin.entry_method EQ 2>
              <td>N/A</td>
              <cfelse>
              <cfquery name="get_eq_count"  dbtype="query"  >
SELECT  COUNT(ID) AS pieces
FROM         get_all_equipment_info WHERE Crew_assignment_last =#get_info_CL.empid#
        </cfquery>
              <cfquery name="get_MI" dbtype="query">
SELECT  *
FROM         get_all_inspection_info  WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
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
            <cfif get_daily_sheets_for_admin.entry_method EQ 2>
              <td>N/A</td>
              <cfelse>
              <cfquery name="get_EI" dbtype="query"  >
SELECT  *
FROM         get_all_inspection_info WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
AND Inspection_Type ='Evening'
        </cfquery>
              <cfif get_EI.recordcount EQ 1>
                <td><a href="Evening_Inspection_Form.cfm?INSPECTION_ID=#get_EI.INSPECTION_ID#">Evening</a></td>
                <cfelseif get_EI.recordcount GT 1>
                <td>See Admin</td>
                <cfelse>
                <td>#get_eq_count.pieces#</td>
              </cfif>
            </cfif>
          </tr>
        </cfoutput>
      </tbody>
    </table>
  </div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
