<cfquery name="max_jobs" datasource="jrgm">
   SELECT MAX(export_date) AS maxjobs   FROM   app_jobs 
</cfquery>
<cfquery name="max_jobs_test" datasource="jrgm">
   SELECT MAX(export_date) AS maxjobs   FROM   app_jobs_test 
</cfquery>
<cfquery name="max_employees" datasource="jrgm">
   SELECT MAX(export_date) AS maxemployees   FROM   app_employees 
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
<link href="css/search.css" rel="stylesheet" type="text/css" />
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
	background:#FFF;
	border: 1px solid #c0c0c0;
	border-bottom: none;
}
table.sortable thead {
	padding: 4px;
	background-color: #cde3fc;
	color:#000;
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
	font: normal .8em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: bold .9em Arial, Helvetica, sans-serif;
}
.dashboardHeader {
	margin-top: 10px;
	color: #333;
	font: bold 16px Arial, Helvetica, sans-serif;
}
ul.dashboard {
	margin-top: 4px;
	margin-left: -40px;
	margin-right: 2px;
	list-style: none; /* this removes the list marker */
}
ul.dashboard li {
	color: #006fa7;
	font: normal 14px Arial, Helvetica, sans-serif;
	padding: 4px 5px 4px 1px;
}
a {
	color: #006fa7;
	text-decoration: none;
}
a:hover {
	color: #000;
	text-decoration: none;
}
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
form {
	margin:0 auto;
}
.search {
	padding:7px 10px 9px 10px;
	margin:3px;
}
input[type=text] {
	color:#333;
}
input[type=submit], input[type=submit]:hover {
	padding:8px 20px 10px 20px;
	position:relative;
	left:-10px;
	border:1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #16705a), color-stop(100%, #00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%, #00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* W3C */
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3', GradientType=0 ); /* IE6-9 */
	color:#fff;
	cursor: pointer;
}
.centrecontent_inner {
	margin-top: 50px;
	margin-left: 10px;
	margin-right: 20px;
	padding: 20px;
}
.subbartxt {
	padding-top: 14px;
	padding-bottom: 14px;
	padding-left: 0px;
	padding-right: 40px;
	color: #fff;
	font: bold 1em Arial, Helvetica, sans-serif;
}
.subbartxt a {
	color: #fff;
	text-decoration: none;
}
.subbartxt a:hover {
	color: #fff;
	text-decoration: underline;
	table.sortable a.sortheader {
    background-color:#eee;
    color:#666666;
    font-weight: bold;
    text-decoration: none;
    display: block;
}
table.sortable span.sortarrow {
    color: black;
    text-decoration: none;
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
         <td width="100"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
        <td class="subbartxt"><a href="https://www.jrgm.biz/ssl/admin/payroll_main.cfm">Payroll</a></td>
        <td class="subbartxt"  nowrap="nowrap"><a href="https://www.jrgm.biz/ssl/admin/daily_sheet_listing.cfm">Daily Sheet</a> </td>
        <td class="subbartxt"  nowrap="nowrap" ><a href="https://www.jrgm.biz/ssl/admin/scheduler_select.cfm">Log In</a></td>
         <td class="subbartxt"  ><a href="https://www.jrgm.biz/ssl/admin/inventory.cfm">Equipment</a></td>
        <td class="subbartxt" ><a href="https://www.jrgm.biz/ssl/admin/directory.cfm">Directory</a></td>
        <td class="subbartxt"  ><a href="https://www.jrgm.biz/ssl/admin/default.cfm">Home</a></td>
        <td class="subbartxt" ><a href="https://www.jrgm.biz">Log Out</a></td>
        <td class="subbartxt"  width="100"></td>
      </tr>
    </table>
  </div>
  <div class="centrecontent_inner">
     <div class="search">
      <table width="95%" border="1" cellspacing="0" cellpadding="5"  bgcolor="#FFFFFF" bordercolor= "#6a9182"  bordercolorlight="White">
        <tr>
          <form action="pat.cfm" method="post">
            <td bgcolor="#F2F7F5" nowrap="nowrap"><input type="text" name="criteria" class="search square" placeholder="Search..." />
              <input type="submit" value="Directory" />
              &nbsp; <a href="pat.cfm" class="arialfont"><strong>Clear</strong></a></td>
          </form>
          <form action="daily_sheet_listing.cfm" method="post">
            <td bgcolor="#F2F7F5" nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..." maxlength="10" />
              <input type="hidden"  name="submitted" value="yes"/>
              <input type="submit" value="Daily Sheets" />
              &nbsp; <a href="pat.cfm" class="arialfont"><strong>Clear</strong></a></td>
          </form>
        </tr>
      </table>
      <cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
        <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position, [Ph Cell] AS cellphonep, [Employee ID] As employee_id,email, [Ph Home] AS homephone, Phone_Cell  AS cellphonew,active_record  FROM APP_employees
 WHERE      [Name FirstLast]  LIKE '%#form.criteria#%' OR First_name LIKE '%#form.criteria#%' OR Last_name LIKE '%#form.criteria#%'  OR   [Employee ID]  LIKE '%#form.criteria#%'
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
         <table class="sortable" width="95%" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <th align="left">Emp ID</th>
              <th align="left">First Name</th>
              <th align="left">Last Name</th>
              <th align="left">Position</th>
              <th align="left">Branch</th>
              <th align="left"> Work Cell Phone</th>
              <th align="left">&nbsp;</th>
              <th align="left"> Personal Cell Phone</th>
              <th align="left">&nbsp;</th>
              <th align="left">Home Phone</th>
              <th align="left">Email</th>
              <th align="left">Notes</th>
              <th align="left">Active</th>
            </tr>
          </thead>
        <!---   <tbody> --->
            <cfoutput query="get_branch_employees">
              <tr>
                <td>#employee_id#</td>
                <td>#first_name#</td>
                <td>#last_name#</td>
                <td>#Position#</td>
                <td>#branch#</td>
                <td>#cellphonew#</td>
                <td>&nbsp;</td>
                <td>#cellphonep#</td>
                <td>&nbsp;</td>
                <td>#homephone#</td>
                <td><a href="mailto:#email#">#email#</a></td>
                <td><a href="employee_details.cfm?employee_id=#get_branch_employees.Employee_ID#&amp;work_date=#todayDate#">Notes</a></td>
                <td>#active_record#</td>
              </tr>
            </cfoutput>
        <!---   </tbody> --->
        </table>
        <br />
      </cfif>
      <br />
      <table width="95%" border="1" cellspacing="0" cellpadding="4" class="arialfont"  bordercolor="#C0C0C0" bordercolorlight="White">
        <tr class="dstable_l1" bgcolor="#CCCCCC">
          <td height="25"><strong>Reports</strong></td>
          <td height="25" ><strong>Data Issues</strong></td>
          <td height="25"  ><strong>Data Loaded</strong></td>
          <td width="200" ><strong>Equipment</strong></td>
          <td   width="200"><strong>Payroll</strong></td>
        </tr>
        <tr>
          <td><a href="pat/time.cfm">Timer</a></td>
          <td nowrap="nowrap"><a href="data_load/load_adp_employees_1.cfm">Load ADP  Data-1</a></td>
          <td nowrap="nowrap">Emp  Max Date - <cfoutput>#DateFormat(max_employees.maxemployees, "mm/dd/yyyy")#</cfoutput>&nbsp;&nbsp; &nbsp;<br />
            -(app_employees )</td>
          <td nowrap="nowrap"><a href="https://www.jrgm.biz/ssl/admin/inventory.cfm">Equipment Status</a></td>
          <td  nowrap="nowrap"><a href="pat/payroll_checker.cfm">Payroll Checker</a></td>
        </tr>
        <cfdirectory
    directory="C:\inetpub\websites\jrgm.biz\SSL\admin\data_load" action="list"
    name="mydirectory" filter="*.*"
    sort="size ASC, name DESC, datelastmodified" >
        <cfquery dbtype="query" name="dirsOnly" maxrows="1">
SELECT * FROM mydirectory 
WHERE name ='ADP_JRGM.xml'
</cfquery>
        <!---  <cfdump var="#mydirectory#"> --->
        <!---  <CFSET  fileserverdate = dirsOnly.DATELASTMODIFIED>
    <CFSET  fileservername = dirsOnly.NAME>
    <CFSET  filesize = dirsOnly.size> --->
        <tr>
          <td  nowrap="nowrap"><a href="pat/timed_in_from_yesterday.cfm">Timed In Prior</a></td>
          <td><a href="data_load/load_adp_employees_2.cfm">Load ADP Data-2</a></td>
          <td nowrap="nowrap">ADP Max Date - <cfoutput>#DateFormat(dirsOnly.DATELASTMODIFIED, "mm/dd/yyyy")# -#TimeFormat(dirsOnly.DATELASTMODIFIED, "hh:mm tt")#</cfoutput> <br />
            -(ADP_JRGM.xml)</td>
          <td><a href="Inspection_List.cfm">Inspection Forms</a></td>
          <td><a href="pat/timed_in_from_prior_check.cfm">D.S. Late Sync</a></td>
        </tr>
        <tr>
          <td><a href="pat/delete_prior_crew_dates.cfm">Fix prior crew end_dates</a></td>
          <td><!--- <a href="data_load/load_jobs.cfm">Load Jobs Data</a> --->
            &nbsp;</td>
          <td nowrap="nowrap">Jobs Max Date -<cfoutput> #DateFormat(max_jobs.maxjobs, "mm/dd/yyyy")#&nbsp;&nbsp; <br />
              -(app_jobs)</cfoutput></td>
          <td>&nbsp;</td>
          <td><a href="pat/timed_in_from_prior_check_loop.cfm">10 Day Sync</a></td>
        </tr>
        <tr>
          <td><a href="pat/fix_CLID_is_NULL.cfm">Fix CL Where NOT NULL</a></td>
          <td>&nbsp;</td>
          <td nowrap="nowrap">Jobs Max Date -<cfoutput> #DateFormat(max_jobs_test.maxjobs, "mm/dd/yyyy")#&nbsp;&nbsp; <br />
              -(app_jobs_test)</cfoutput></td>
          <td>&nbsp;</td>
          <td><a href="payroll/payrollBetty.cfm">Betty Screen</a></td>
        </tr>
        <tr>
          <td><a href="pat/error_check.cfm">Errors</a></td>
          <td>&nbsp;</td>
          <td nowrap="nowrap"><a href="payroll_report_employees_multiple_ID.cfm">Employees</a> with 2 ID's&nbsp; <br />
            (Multiple Branches or Postions)</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <br />
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <table width="95%" border="1" cellpadding="0"   cellspacing="0" bordercolor="#C0C0C0" bordercolorlight="White">
        <tr>
          <th height="25" colspan="11" align="left"> <cfquery name="get_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT employee_ID FROM app_employee_payroll_clock   WHERE ds_date = '#todays_date#'
 </cfquery>
            <cfquery name="get_number_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT ID FROM app_daily_sheets   WHERE ds_date = '#todays_date#'
 </cfquery>
            <cfoutput><span class="arialfontbold">#get_daily_sheets.recordcount# employees working on #get_number_daily_sheets.recordcount# crews on #DateFormat(todays_date, "mm/dd/yyyy")#</span></cfoutput></span></th>
        </tr>
      </table>
      
      <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
            <th class="sort-number" height="25" align="left" bgcolor="#D6D6D6">ID </th>
           <th class="sort-date" height="25" align="left" bgcolor="#D6D6D6">Date </th>
            <th height="25" align="left" bgcolor="#D6D6D6">Branch </th>
            <th height="25" align="left" bgcolor="#D6D6D6">Supervisor </th>
            <th height="25" align="left" bgcolor="#D6D6D6">Crew Leader </th>
            <th height="25" align="center" bgcolor="#D6D6D6">Delete </th>
            <th height="25" align="left" bgcolor="#D6D6D6">Min Time</th>
            <th height="25" align="left" bgcolor="#D6D6D6">Max Time </th>
            <th height="25" align="left" bgcolor="#D6D6D6">Method</th>
            <th height="25" align="left" bgcolor="#D6D6D6">AM</th>
            <th height="25" align="left" bgcolor="#D6D6D6">PM</th>
          </tr>
        </thead>
        <!--- <cfdump var="#get_daily_sheets_for_supervisor#">   --->
        <cfquery name="get_daily_sheets_for_supervisor" datasource="jrgm"   maxrows="100"> 
SELECT  * FROM app_daily_sheets   WHERE ds_date = '#todays_date#'
<!---        ORDER by ds_date desc --->
      </cfquery>
        <cfquery name="get_employees_name" datasource="jrgm">
        SELECT  [Employee ID] AS empid, first_name ,  last_name,branch , [Name FirstLast] AS fullname   FROM 
        app_employees <!--- WHERE [Employee ID] = #get_employees_CompleteHours.employee_ID# --->
        </cfquery>
        <tbody>
          <cfoutput query="get_daily_sheets_for_supervisor">
            <cfquery name="get_info_CL"   dbtype="query"   cachedwithin="#createTimespan(0,8,0,0)#">
SELECT   empid, fullname AS employee_name
FROM   get_employees_name WHERE  empid =#get_daily_sheets_for_supervisor.crew_leader_id#
        </cfquery>
            <cfquery name="get_info_S"    dbtype="query"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  fullname AS employee_name,branch AS branch_name
FROM   get_employees_name WHERE empid=#get_daily_sheets_for_supervisor.supervisor_id#
        </cfquery>
            <!---  <cfdump var="#get_info_S#"> --->
            <CFSET ds_date = #DateFormat(get_daily_sheets_for_supervisor.ds_date, "mm/dd/yyyy")# >
            <CFSET today_datex =#DateFormat(Now(), "mm/dd/yyyy")# >
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets_for_supervisor.ID#</a> </td>
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
              <td align="center" nowrap="nowrap"><a href="daily_sheet_listing.cfm?delete=yes&amp;dsid=#ID#">Delete</a></td>
              <cfquery name="gettimes" datasource="jrgm" >
SELECT MIN(Time_in) AS mintimein,  MAX(Time_out)AS  maxtimeout
FROM  app_employee_payroll_clock WHERE ds_id =  #get_daily_sheets_for_supervisor.ID#
             </cfquery>
              <td align="left" nowrap="nowrap">#TimeFormat(gettimes.mintimein, "hh:mm tt")#</td>
              <td align="left" nowrap="nowrap">#TimeFormat(gettimes.maxtimeout, "hh:mm tt")#</td>
              <td><cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                  Manual
                  <cfelse>
                  APP
                </cfif>
              </td>
              <cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                <td>N/A</td>
                <cfelse>
                <cfquery name="get_eq_count" datasource="jrgm"  >
SELECT  COUNT(ID) AS pieces
FROM         equipment WHERE Crew_assignment_last =#get_info_CL.empid#
        </cfquery>
                <cfquery name="get_MI" datasource="jrgm"  >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = #ds_date# 
AND Inspection_Type ='Morning'
        </cfquery>
                <cfif get_MI.recordcount EQ 1>
                  <td><a href="Morning_Inspection_Form.cfm?INSPECTION_ID=#get_MI.INSPECTION_ID#">AM</a></td>
                  <cfelseif get_MI.recordcount GT 1>
                  <td>See Admin</td>
                  <cfelse>
                  <td>#get_eq_count.pieces#</td>
                </cfif>
              </cfif>
              <cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                <td>N/A</td>
                <cfelse>
                <cfquery name="get_EI" datasource="jrgm"  >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = #ds_date# 
AND Inspection_Type ='Evening'
        </cfquery>
                <cfif get_EI.recordcount EQ 1>
                  <td><a href="Evening_Inspection_Form.cfm?INSPECTION_ID=#get_EI.INSPECTION_ID#">PM</a></td>
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
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
