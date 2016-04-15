<!---
 <cfif IsDefined("form.ds_date") ><CFSET todays_date = #form.ds_date#></cfif>
 
<cfoutput> #todays_date#</cfoutput>--->
<cfquery name="max_jobs" datasource="jrgm">
SELECT MAX(last_modified_date) AS jobs_last_modified_date   FROM   app_jobs 
</cfquery>
<!---<cfquery name="max_jobs_test" datasource="jrgm">
SELECT MAX(export_date) AS maxjobs   FROM   app_jobs_test 
</cfquery>
--->
<cfquery name="max_employees" datasource="jrgm">
   SELECT MAX(export_date) AS max_export_date_emp, MAX(last_modified_date) AS  max_last_modified_date_emp   FROM   app_employees 
</cfquery>
<cfquery name="get_employees_name" datasource="jrgm">
SELECT  [Employee ID] AS empid, first_name ,  last_name,branch , [Name FirstLast] AS fullname   FROM 
app_employees 
</cfquery>
<cfquery name="get_creds_all" datasource="jrgm">
  SELECT     ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch, email, 
    app_language, password_date, color, textcolor
FROM         app_employee_passwords
<!---WHERE Employee_ID =#get_branch_employees.Employee_ID#--->
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
<!---<CFSET todays_date   = dateAdd("d",-1,todays_date)>--->

<cfif IsDefined("form.ds_date") >
  <CFSET todays_date = #form.ds_date#>
</cfif>
<cfquery name="get_all_ei" datasource="jrgm"> 
 SELECT  *  FROM app_Inspection_Master WHERE   Inspection_Date = '#todays_date#'
 </cfquery>
<cfquery name="get_all_equipment_info" datasource="jrgm"  >
SELECT  ID, Branch_name,   Crew_assignment_last
FROM equipment
</cfquery>
<cfquery name="get_all_times" datasource="jrgm" >
SELECT *
FROM  app_employee_payroll_clock WHERE ds_date =  '#todays_date#'
 </cfquery>
<cfquery name="get_all_daily_sheets" datasource="jrgm"   >
SELECT  * FROM app_daily_sheets   WHERE ds_date = '#todays_date#' 
 </cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet" />
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets/admin/layout3/css/custom-pat.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style>
.bigfont {
	padding: 5px;
	background-color: #ffffff;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold .95em Arial, Helvetica, sans-serif;
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
	margin: 0 auto;
}
.search {
	padding: 7px 10px 9px 10px;
	margin: 3px;
}
input[type=text] {
	color: #333;
}
input[type=submit], input[type=submit]:hover {
	padding: 8px 20px 10px 10px;
	position: relative;
	left: -10px;
	border: 1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #16705a), color-stop(100%, #00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%, #00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* W3C */
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3', GradientType=0 ); /* IE6-9 */
	color: #fff;
	cursor: pointer;
}
.red {
	color: red;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include-pat.cfm">
  <cfinclude template="header-menu-pat.cfm">
  <table width="100%" cellpadding="5">
    <tr  bgcolor="#BCDAF3">
      <td width="50" height="25" align="center" nowrap="nowrap"><strong><a href="/ssl/admin/payroll_main.cfm">Payroll</a></strong></td>
      <td width="100" height="25" align="center" nowrap="nowrap"><strong><a href="/ssl/admin/daily_sheet_listing.cfm">Daily Sheet</a></strong></td>
   <!---   <td align="center"><strong><a href="/ssl/admin/scheduler_select.cfm">Log In</a></strong></td>--->
      <td width="100" height="25" align="center" nowrap="nowrap"><strong><a href="/ssl/admin/scheduler_select-new.cfm">Log In New</a></strong></td>
      <td width="100" height="25" align="center" nowrap="nowrap"><strong><a href="/ssl/admin/inventory.cfm">Equipment</a></strong></td>
      <td width="100" height="25" align="center" nowrap="nowrap"><strong><a href="/ssl/admin/directory.cfm">Directory</a></strong></td>
        <td width="50%">&nbsp; </td>
    </tr>
  </table>
</div>
<cfif IsDefined("url.fixtheid")  AND IsDefined("url.supervisor_id")    >
  <cfquery name="update_missing_super_ID" datasource="jrgm"   >
UPDATE app_daily_sheets SET  Supervisor_ID = #url.supervisor_id#
WHERE ID=#url.dsid#  AND   Supervisor_ID  =0
</cfquery>
</cfif>
<cfquery name="get_missing_super_daily_sheets" datasource="jrgm"  maxrows="1"  >
SELECT  ID,crew_leader_id FROM app_daily_sheets   WHERE Supervisor_ID =0
 </cfquery>
<cfif  get_missing_super_daily_sheets.recordcount GT 0>
  <cfquery name="get_missing_super_ID" datasource="jrgm"   >
SELECT  Supervisor_ID, crew_leader_id,ds_date FROM app_daily_sheets   
WHERE crew_leader_id =#get_missing_super_daily_sheets.crew_leader_id# AND Supervisor_ID <> 0
ORDER by ID DESC 
 </cfquery>
  <br />
  <cfoutput>
    <div class="alert-danger">&nbsp;&nbsp;&nbsp;DSID: #get_missing_super_daily_sheets.id# is missing Supervisor ID.  The Supervisor ID for  Crew Leader #get_missing_super_ID.crew_leader_id# last Daily Sheet  was #get_missing_super_ID.Supervisor_ID# on #DateFormat(get_missing_super_ID.ds_date, "mm/dd/yyyy")#. &nbsp;&nbsp;&nbsp;<a href="pat_new.cfm?fixtheid=yes&supervisor_id=#get_missing_super_ID.Supervisor_ID#&dsid=#get_missing_super_daily_sheets.ID#">FIX</a></div>
  </cfoutput>
</cfif>
<!-- END HEADER SECTION --> 
<br />
<div class="search">
  <table width="97%"   cellspacing="0" cellpadding="5"  bgcolor="#FFFFFF" bordercolor= "White"  bordercolorlight="White">
    <tr>
      <td  width="75%">&nbsp;</td>
      <form action="pat_new.cfm" method="post">
        <td  nowrap="nowrap"><input type="text" name="criteria" class="search square" placeholder="Search..." />
          <input type="submit" value="Directory" /></td>
      </form>
      <td  width="5%">&nbsp;</td>
      <form action="daily_sheet_listing.cfm" method="post">
        <td nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..." maxlength="10" />
          <input type="hidden"  name="submitted" value="yes"/>
          <input type="submit" value="Daily Sheets" /></td>
        <td width="5%"  align="right">&nbsp; <a href="pat_new.cfm" class="arialfont"><strong>Clear</strong></a></td>
      </form>
    </tr>
  </table>
</div>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><cfif IsDefined("form.criteria")  AND form.criteria NEQ ""  >
        <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position, [Ph Cell] AS cellphonep, [Employee ID] As employee_id,email, [Ph Home] AS homephone, Phone_Cell  AS cellphonew,active_record  FROM APP_employees
 WHERE      [Name FirstLast]  LIKE '%#form.criteria#%' OR First_name LIKE '%#form.criteria#%' OR Last_name LIKE '%#form.criteria#%'  OR   [Employee ID]  LIKE '%#form.criteria#%'
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th align="left">Emp ID</th>
              <th align="left">First Name</th>
              <th align="left">Last Name</th>
              <th align="left">Position</th>
              <th align="left">Branch</th>
              <th align="left"> Work Cell Phone</th>
              <th align="left"> Personal Cell Phone</th>
              <th align="left">UN</th>
              <th align="left">PW</th>
              <th align="left">Email</th>
              <th align="left">Notes</th>
              <th align="left">Active</th>
            </tr>
          </thead>
          <tbody>
            <cfoutput query="get_branch_employees">
              <tr>
                <td>#employee_id#</td>
                <td>#first_name#</td>
                <td>#last_name#</td>
                <td>#Position#</td>
                <cfif get_branch_employees.BRANCH EQ 'Newport News'>
                  <CFSET branchnew = "NNEW" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Charlottesville'>
                  <CFSET branchnew = "CVLE" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Williamsburg'>
                  <CFSET branchnew = "WMBG" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Richmond'>
                  <CFSET branchnew = "RICH" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Corporate'>
                  <CFSET branchnew = "CORP" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Chesterfield'>
                  <CFSET branchnew = "CHES" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Portsmouth'>
                  <CFSET branchnew = "PORT" >
                  <cfelseif get_branch_employees.BRANCH EQ 'Test'>
                  <CFSET branchnew = "Test" >
                  <cfelse>
                  <CFSET branchnew = #Left(get_branch_employees.BRANCH_NAME,4)# >
                </cfif>
                <td align="left" nowrap="nowrap">#branchnew#</td>
                <td>#cellphonew#</td>
                <td>#cellphonep#</td>
                <cfquery name="get_creds"  dbtype="query">
  SELECT     ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch, email, 
    app_language, password_date, color, textcolor
FROM         get_creds_all
WHERE Employee_ID =#get_branch_employees.Employee_ID#
</cfquery>
                <td>#get_creds.username#</td>
                <td>#get_creds.password#</td>
                <td><a href="mailto:#email#">#email#</a></td>
                <td><a href="employee_details.cfm?employee_id=#get_branch_employees.Employee_ID#&work_date=#todayDate#">Notes</a></td>
                <td>#active_record#</td>
              </tr>
            </cfoutput>
          </tbody>
        </table>
        <br />
      </cfif>
      <br /></td>
  </tr>
</table>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table class="table table-bordered">
        <thead>
          <tr>
            <td height="25"><strong>Reports</strong></td>
            <td height="25" ><strong>Load Data </strong></td>
            <td height="25"  ><strong>Data Loaded</strong></td>
            <td ><strong>Equipment</strong></td>
            <td><strong>Payroll</strong></td>
          </tr>
        </thead>
        <tr >
          <td><a href="pat/time.cfm">Timer</a></td>
          <td nowrap="nowrap"><cfif IsDefined("SESSION.ADP")>
              <a href="data_load/load_adp_employees_1.cfm">Load ADP  Data-1</a>
            </cfif></td>
          <td nowrap="nowrap">Max Export Date - <cfoutput>#DateFormat(max_employees.max_export_date_emp, "mm/dd/yyyy")#</cfoutput>&nbsp;<br />
            (app_employees) Last Employee Added from ADP</td>
          <td nowrap="nowrap"><a href="/ssl/admin/inventory.cfm">Equipment Status</a></td>
          <td  nowrap="nowrap"><a href="payroll/payrollBetty.cfm">Neil Payroll Screen</a></td>
        </tr>
        <tr>
          <cfdirectory
    directory="C:\inetpub\websites\jrgm.biz\SSL\admin\data_load" action="list"
    name="mydirectory" filter="*.*"
    sort="size ASC, name DESC, datelastmodified" >
          <cfquery dbtype="query" name="dirsOnly" maxrows="1">
SELECT * FROM mydirectory 
WHERE name ='ADP_JRGM.xml'
</cfquery>
          <td  nowrap="nowrap"><a href="pat/timed_in_from_yesterday.cfm">Timed In Prior</a></td>
          <td><cfif IsDefined("SESSION.ADP")>
              <a href="data_load/load_adp_employees_2.cfm">Load ADP Data-2</a>
            </cfif></td>
          <td nowrap="nowrap">Max LM Date - <cfoutput>#DateFormat(max_employees.max_last_modified_date_emp, "mm/dd/yyyy")#</cfoutput> <br />
            (app_employees)</td>
          <td><a href="Inspection_List.cfm">Inspection Forms</a></td>
          <td  nowrap="nowrap"><a href="payroll_manager.cfm">Payroll Manager</a></td>
        </tr>
        <tr>
          <td><a href="pat/delete_prior_crew_dates.cfm">Fix prior crew end_dates</a></td>
          <td><a href="data_load/update_employee_info.cfm">Update Employee Info</a></td>
          <td nowrap="nowrap">ADP Max Date - <cfoutput>#DateFormat(dirsOnly.DATELASTMODIFIED, "mm/dd/yyyy")# -#TimeFormat(dirsOnly.DATELASTMODIFIED, "hh:mm tt")#</cfoutput> <br />
            (ADP_JRGM.xml)</td>
          <td><a href="../../admin/equipment_date_updates.cfm">Update Eq Dates</a></td>
          <td><a href="pat/timed_in_from_prior_check.cfm">D.S. Late Sync</a></td>
        </tr>
        <tr>
          <td><a href="pat/fix_CLID_is_NULL.cfm">Fix CL Where NOT NULL</a></td>
          <td><a href="https://workforcenow.adp.com/public/index.htm">ADP</a></td>
          <td nowrap="nowrap">APP Jobs Max LM Date -<cfoutput>#DateFormat(max_jobs.jobs_last_modified_date,"mm/dd/yy")# #TimeFormat(max_jobs.jobs_last_modified_date,"hh:mm tt")# </cfoutput></td>
          <td>&nbsp;</td>
          <td><a href="timed_in_from_prior_check_loop.cfm">10 Day Sync</a></td>
        </tr>
        <tr>
          <td><a href="pat/error_check.cfm">Errors</a></td>
          <td><a href="https://googleapps.insight.ly/Home/Tags">Insightly</a></td>
          <td nowrap="nowrap"><a href="payroll_report_employees_multiple_ID.cfm">Employees</a> with 2 ID's&nbsp;<br />
            (Multiple Branches or Postions)</td>
          <td>&nbsp;</td>
          <td>manage_crew_leaders.cfm</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td nowrap="nowrap"><a href="http://api.jrgm.com/test.php">api.jrgm.com/test.php</a>&nbsp;&nbsp;&nbsp;  jrgm.user</td>
          <td>&nbsp;</td>
          <td><a href="daily_sheet_listing_corp_only.cfm">Daily Sheet CORP</a></td>
        </tr>
      </table></td>
  </tr>
</table>
<div class="page-content">
  <div class="container-fluid">
    <cfquery name="get_daily_sheets"  dbtype="query">
SELECT  DISTINCT employee_ID FROM get_all_times   WHERE ds_date = '#todays_date#'
 </cfquery>
    <cfquery name="get_number_daily_sheets"   dbtype="query">
SELECT  DISTINCT ID FROM get_all_daily_sheets   WHERE ds_date = '#todays_date#'
 </cfquery>
    <cfoutput><strong>#get_daily_sheets.recordcount# employees working on #get_number_daily_sheets.recordcount# crews on #DateFormat(todays_date, "mm/dd/yyyy")#</strong></cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <form action="pat_new.cfm" method="post">
      <td  nowrap="nowrap"><input type="text" name="ds_date" class="search square" placeholder="Enter Date..." />
        <input type="submit"   value="Date" /></td>
    </form>
    <div class="row">
      <div class="col-md-12">
        <table class="table table-striped table-hover" id="sample_3">
          <thead>
            <tr bgcolor="#DBEBF8">
              <th  height="25" align="left" ><strong>ID </strong></th>
              <th height="25" align="left" ><strong>Date </strong></th>
              <th height="25" align="left"><strong>Branch </strong></th>
              <th height="25" align="left"><strong>Type </strong></th>
              <th height="25" align="left"><strong>Supervisor </strong></th>
              <th height="25" align="left"><strong>Crew Leader </strong></th>
              <th height="25" align="left"><strong>Approved<br />
                Delete </strong></th>
              <th height="25" align="left"><strong>Min Time</strong></th>
              <th height="25" align="left"><strong>Max Time </strong></th>
              <th height="25" align="left"><strong>Time Last</strong></th>
              <th height="25" align="left"><strong>#</strong></th>
              <th height="25" align="left"><strong>Day <br />
                Time</strong></th>
              <th height="25" align="left"><strong>Job Clock <br />
                Time</strong></th>
              <th height="25" align="left"><strong>Service <br />
                Time</strong></th>
              <th height="25" align="left"><strong>Diff</strong> </th>
              <th height="25" align="left"><strong>Method</strong></th>
              <th height="25" align="left"><strong>AM</strong></th>
              <th height="25" align="left"><strong>PM</strong></th>
            </tr>
          </thead>
          <!--- <cfdump var="#get_daily_sheets_for_supervisor#">   --->
          <cfquery name="get_daily_sheets_for_supervisor"  dbtype="query">
SELECT  * FROM get_all_daily_sheets   WHERE ds_date = '#todays_date#'
 </cfquery>
          <CFSET startrow = 1>
          <CFSET endrow = get_daily_sheets_for_supervisor.recordcount>
          <CFSET mylist ="">
          <cfloop query="get_daily_sheets_for_supervisor"  startrow="#startrow#" endrow="#endrow#">
            <cfset myList = ListAppend(mylist,ID)>
          </cfloop>
          <cfquery name="get_all_employee_time_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_employee_payroll_clock WHERE ds_ID IN (#mylist#) 
</cfquery>
          <cfquery name="get_all_job_clock_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_job_clock WHERE ds_ID IN (#mylist#) 
</cfquery>
          <cfquery name="get_all_employee_service_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_job_services_actual_employee WHERE ds_ID IN (#mylist#) 
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
              <CFSET ds_date = #DateFormat(get_daily_sheets_for_supervisor.ds_date, "mm/dd/yyyy")# >
              <CFSET today_datex =#DateFormat(Now(), "mm/dd/yyyy")# >
              <tr>
                <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets_for_supervisor.ID#</a></td>
                <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
                <!---   <td align="left" nowrap="nowrap">#get_info_S.branch#</td> --->
                <cfif branch_code EQ '10' >
                  <CFSET branchname ='Richmond'>
                  <cfelseif branch_code EQ '20' >
                  <CFSET branchname ='Portsmouth'>
                  <cfelseif branch_code EQ '30'  >
                  <CFSET branchname ='Charlottesville'>
                  <cfelseif branch_code EQ '70'  >
                  <CFSET branchname ='Williamsburg'>
                  <cfelseif branch_code EQ '80'  >
                  <CFSET branchname ='Chesterfield'>
                  <cfelseif branch_code EQ '90' >
                  <CFSET branchname ='Newport News'>
                  <cfelseif  branch_code EQ '12'>
                  <CFSET branchname ='Corporate'>
                  <cfelseif  branch_code EQ '00'>
                  <CFSET branchname ='Unknown'>
                  <cfelseif branch_code EQ '' >
                  <CFSET branchname ='Unknown'>
                  <cfelse>
                  <CFSET branchname ='Unknown'>
                </cfif>
                <td>#branchname#</td>
                <!---   <td align="left" nowrap="nowrap">#branch_code#</td>--->
                <cfquery name="get_creds"  dbtype="query">
  SELECT       access_role 
FROM         get_creds_all
WHERE Employee_ID =#get_info_CL.empid#
</cfquery>
                <td align="left" nowrap="nowrap"><cfif get_creds.access_role EQ 7>
                    <span class="red"><u>ST</u></span>
                    <cfelseif get_creds.access_role EQ 6>
                    <span class="red"><u>IT</u></span>
                    <cfelse>
                    R
                  </cfif></td>
                <cfif  supervisor_id EQ 0>
                  <td nowrap="nowrap" bgcolor="##FF0000">#get_info_S.employee_name# -#supervisor_id#</td>
                  <cfelse>
                  <td nowrap="nowrap">#get_info_S.employee_name# -#supervisor_id#</td>
                </cfif>
                <td nowrap="nowrap">#get_info_CL.employee_name# - #get_info_CL.empid#</td>
                <cfif  get_daily_sheets_for_supervisor.ds_approved EQ 1>
                  <td align="left" nowrap="nowrap"><span class="red">Approved</span></td>
                  <cfelse>
                  <td align="left" nowrap="nowrap"><a href="daily_sheet_listing.cfm?delete=yes&dsid=#ID#">Delete</a></td>
                </cfif>
                <cfquery name="gettimes"  dbtype="query"  >
SELECT MIN(Time_in) AS mintimein,  MAX(Time_out) AS  maxtimeout
FROM  get_all_times WHERE ds_id =  #get_daily_sheets_for_supervisor.ID#
             </cfquery>
                <td align="left" nowrap="nowrap">#TimeFormat(gettimes.mintimein, "hh:mm tt")#</td>
                <td align="left" nowrap="nowrap">#TimeFormat(gettimes.maxtimeout, "hh:mm tt")#</td>
                <td align="left" nowrap="nowrap">#DateFormat(get_daily_sheets_for_supervisor.ds_date_last,"mm/dd/yy")# #TimeFormat(get_daily_sheets_for_supervisor.ds_date_last,"hh:mm tt")#</td>
                <cfquery name="get_all_employees_on_ds" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT DISTINCT employee_id FROM app_employee_payroll_clock WHERE ds_id =#ID#
</cfquery>
                <CFSET crew_on_ds = get_all_employees_on_ds.recordcount>
                <td align="left" nowrap="nowrap">#crew_on_ds#</td>
                <cfquery name="get_employee_minutes_for_day"   dbtype="query" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_info WHERE ds_id =#ID#
                </cfquery>
                <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                  <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                <cfif get_employee_minutes_for_day.recordcount EQ 0>
                  <CFSET minutes_worked_day = 0>
                  <cfelse>
                  <CFSET minutes_worked_day = #get_employee_minutes_for_day.minutes_worked_day#>
                </cfif>
                <td align="left">#minutes_worked_day#</td>
                <cfquery name="get_job_clock_for_day"  dbtype="query" maxrows="1">
SELECT Sum(Job_Time_worked)* #crew_on_ds# AS  job_clock_service_minutes_worked_day FROM  get_all_job_clock_info WHERE ds_id =#ID#
                </cfquery>
                <cfif get_job_clock_for_day.recordcount EQ 0>
                  <CFSET get_job_clock_minutes_for_day = 0>
                  <cfelse>
                  <CFSET get_job_clock_minutes_for_day = #get_job_clock_for_day.job_clock_service_minutes_worked_day#>
                </cfif>
                <td align="left">#get_job_clock_minutes_for_day#</td>
                <cfquery name="get_employee_service_minutes_for_day"  dbtype="query" maxrows="1">
SELECT  Sum(total_time) AS  service_minutes_worked_day FROM  get_all_employee_service_info WHERE ds_id =#ID#
                </cfquery>
                <cfif get_employee_service_minutes_for_day.recordcount EQ 0>
                  <CFSET service_minutes_worked_day = 0>
                  <cfelse>
                  <CFSET service_minutes_worked_day = #get_employee_service_minutes_for_day.service_minutes_worked_day#>
                </cfif>
                <td align="left">#service_minutes_worked_day#</td>
                <cfset diff =service_minutes_worked_day- minutes_worked_day>
                <td align="left">#diff#</td>
                <td><cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                    Manual
                    <cfelse>
                    APP
                  </cfif></td>
                <cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                  <td>N/A</td>
                  <cfelse>
                  <cfquery name="get_eq_count"  dbtype="query"  >
SELECT  COUNT(ID) AS pieces
FROM         get_all_equipment_info WHERE Crew_assignment_last =#get_info_CL.empid#
        </cfquery>
                  <cfquery name="get_MI"   dbtype="query"  >
SELECT  *
FROM         get_all_ei WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
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
                  <cfquery name="get_EI"  dbtype="query"  >
SELECT  *
FROM         get_all_ei WHERE Crew_LeaderID =#get_info_CL.empid# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
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
        <!-- end outer div --> 
      </div>
    </div>
  </div>
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --> 
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]--> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
<!-- END BODY -->
</html>
