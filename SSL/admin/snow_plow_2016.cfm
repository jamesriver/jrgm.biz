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
FROM  app_employee_payroll_clock    WHERE ds_date > '1/20/2016'
 </cfquery>
<cfquery name="get_all_daily_sheets" datasource="jrgm"   >
SELECT  * FROM app_daily_sheets   WHERE ds_date > '1/20/2016'
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
  <div class="page-header-top">
  <div class="container-fluid">
    <div class="page-logo"><a href="default.cfm"><img src="assets/global/img/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a> Welcome: Admin</span></div>
    <div class="top-menu"> <span class="separator"></span> <a href="do_loginnew.cfm?employee_ID=1009&schedchoice=home"  class="btn btn-default" target="_blank"><i class="fa fa-list fa-fw"></i> Quoting </a> <a href="default.cfm" class="btn btn-default"><i class="fa fa-home"></i> Home </a> <a href="http://www.jrgm.biz/indexnew.cfm" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout </a> </div>
  </div>
</div>
  <div class="page-header-menu">
    <div class="container-fluid">
      <div id="hor-menu-default" class="hor-menu">
        <ul class="nav navbar-nav">
          <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/payroll_main.cfm">Payroll</a> </li>
          <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/daily_sheet_listing.cfm">Daily Sheet</a> </li>
          <!--- <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/scheduler_select.cfm">Log In</a></li>--->
          
          <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/inventory.cfm">Equipment</a> </li>
          <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/directory.cfm">Directory</a> </li>
          <!--- <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz/ssl/admin/default.cfm">Home</a> </li>
          <li class="menu-dropdown classic-menu-dropdown clearfix"><a href="https://www.jrgm.biz">Log Out</a> </li>--->
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- END HEADER SECTION --> 
<br />
<div class="page-content">
  <div class="container-fluid">
    <cfquery name="get_daily_sheets"  dbtype="query">
SELECT  DISTINCT employee_ID FROM get_all_times   WHERE ds_date > '1/20/2016'
 </cfquery>
    <cfquery name="get_number_daily_sheets"   dbtype="query">
SELECT  DISTINCT ID FROM get_all_daily_sheets    WHERE ds_date > '1/20/2016'
 </cfquery>
    
    <div class="row">
      <div class="col-md-12"><table width="95%" border="0">
  <tbody>
    <tr>
      <td><strong>Daily sheets since January 20, 2016 that still show  time out of 5:00 PM </strong><br />
<i>(These were probably auto-timed out and still need editing before approval)</i></td>
    </tr>
  </tbody>
</table>

        <table class="table table-striped table-hover" id="sample_2">
          <thead>
            <tr bgcolor="#DBEBF8">
              <th align="left" >#</th>
              <th  height="25" align="left" ><strong>ID </strong></th>
              <th height="25" align="left" ><strong>Date </strong></th>
              <th height="25" align="left"><strong>Branch </strong></th>
              <th height="25" align="left"><strong>Type </strong></th>
              <th height="25" align="left"><strong>Supervisor </strong></th>
              <th height="25" align="left"><strong>Crew Leader </strong></th>
               <th height="25" align="left"><strong>Print </strong></th>
            
              <th height="25" align="left"><strong>Approved/ Delete </strong></th>
              <th height="25" align="left"><strong>Min Time</strong></th>
              <th height="25" align="left"><strong>Max Time </strong></th>
              <th height="25" align="left"><strong>Method</strong></th>
              
            </tr>
          </thead>
          <!--- <cfdump var="#get_daily_sheets_for_supervisor#">   --->
          <cfquery name="get_daily_sheets_for_supervisor"  dbtype="query">
SELECT  * FROM get_all_daily_sheets      WHERE ds_date > '1/20/2016'
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
            <CFSET rownumber = 0>
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
              <cfquery name="gettimes"  dbtype="query"  >
SELECT MIN(Time_in) AS mintimein,  MAX(Time_out) AS  maxtimeout
FROM  get_all_times WHERE ds_id =  #get_daily_sheets_for_supervisor.ID#
             </cfquery>
              <CFSET maxtimeout_day =#TimeFormat(gettimes.maxtimeout, "hh:mm tt")#>
              <cfif  maxtimeout_day EQ '17:00:00.0'>
                <CFSET rownumber = rownumber +1>
                <tr>
                  <td>#rownumber#</td>
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
                     <td><a href="daily_sheet2_print.cfm?dsid=#ID#" target="_blank">Print</a></td> 
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
                  <td><cfif get_daily_sheets_for_supervisor.entry_method EQ 2>
                      Manual
                      <cfelse>
                      APP
                    </cfif></td>
                  
                </tr>
              </cfif>
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
