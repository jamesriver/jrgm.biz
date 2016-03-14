<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<CFQUERY name="is_employee_in_password_table" datasource="#request.dsn#">
SELECT * FROM app_employee_passwords  WHERE employee_id=#url.employee_id#
</CFQUERY>
<cfif is_employee_in_password_table.recordcount EQ 0>
  <CFSET pwneeded = 'yes'>
  <cfelse>
  <CFSET pwneeded = 'no'>
</cfif>
<cfif IsDefined("url.remove")>
  <CFQUERY name="get_this_job" datasource="#request.dsn#">
UPDATE app_crews SET   Employee_Position_ID= 0   WHERE employee_id=#url.employee_id#
</CFQUERY>
  <CFQUERY name="get_this_job" datasource="#request.dsn#">
UPDATE app_employee_passwords SET   employee_active =0  WHERE employee_id=#url.employee_id#
</CFQUERY>
</cfif>
<cfif IsDefined("url.add")>
  <CFQUERY name="get_this_job" datasource="#request.dsn#">
UPDATE app_crews SET   Employee_Position_ID= 2,crew_leader_id = NULL   WHERE employee_id=#url.employee_id#
</CFQUERY>
  <CFQUERY name="getnumber_rowsincrews" datasource="#request.dsn#" maxrows="1">
SELECT ID   FROM app_crews    WHERE employee_id=#url.employee_id#
ORDER by end_date DESC
</CFQUERY>
  <CFQUERY name="delete_getnumber_rowsincrews" datasource="#request.dsn#" >
DELETE FROM app_crews   WHERE employee_id=#url.employee_id# AND ID NOT IN (#getnumber_rowsincrews.ID#)
</CFQUERY>
  <cfif pwneeded EQ 'yes'>
    <CFQUERY name="get_emp_info" datasource="#request.dsn#">
SELECT first_name,last_name, branch, [Name FirstLast] AS employee_name,email,[Employee ID] AS EmployeeID FROM app_employees  WHERE [Employee ID]=#url.employee_id#
</CFQUERY>
    <CFSET usernamef = LEFT(get_emp_info.first_name,1)>
    <cfset usernamel = ListLast(get_emp_info.last_name, " -")>
    <!--- <CFSET usernamel = get_emp_info.last_name> --->
    <CFSET username3 = get_emp_info.EmployeeID>
    <CFSET username = usernamef&usernamel&username3>
    <CFSET password = 'jrgm'>
    <cfquery name="insert_user_pwtable" datasource="#request.dsn#">
 INSERT INTO  app_employee_passwords (Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch,password_date,email) VALUES (#url.Employee_ID#, '#username#', '#password#', '#get_emp_info.employee_name#', 2, 1, '#get_emp_info.first_name#', '#get_emp_info.last_name#', #todayDate#, '#get_emp_info.branch#',#todayDate#,'#get_emp_info.email#' )
</cfquery>
    <cfelse>
    <CFQUERY name="get_this_job" datasource="#request.dsn#">
UPDATE app_employee_passwords SET   employee_active =1  WHERE employee_id=#url.employee_id#
</CFQUERY>
  </cfif>
</cfif>
<cfquery name="get_employee_creds" datasource="jrgm"  maxrows="1">
SELECT * FROM app_employee_passwords WHERE Employee_ID=  #url.Employee_ID#  
</cfquery>
<cfset username =get_employee_creds.username>
<cfset password =get_employee_creds.password>
<cfquery name="get_employee_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone FROM APP_employees WHERE [Employee ID]=  #url.Employee_ID#  
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfif IsDefined("url.remove")>
  <cfmail to="pat@1design.com,nfirth@jrgm.com"   from="pat@429designs.com"  subject="JRGM Crew Leader Change-Remove"  type="html">
#get_employee_info.employeename# has been removed as a crew leader.
  </cfmail>
</cfif>
<cfif IsDefined("url.add")>
  <cfmail to="pat@1design.com,nfirth@jrgm.com"   from="pat@429designs.com"  subject="JRGM Crew Leader Change -Add"  type="html">
#get_employee_info.employeename# has been added as a crew leader.
  </cfmail>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 10px;
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
	width: 100px;
	margin-right: 40px;
	margin-top: 20px;
}
.YesNoButton:hover {
	color:#ffffff;
	text-decoration:none;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Employee Detail - Change Position</td>
        </tr>
      </table>
      <cfif IsDefined("url.remove")>
        <br />
        <span class="redarial"><cfoutput><strong>#get_employee_info.employeename# </strong></cfoutput><strong>has been removed as a crew leader.</strong></span><br />
        <br />
        <span class="arialfont">The current login credentials for <cfoutput>#get_employee_info.employeename#</cfoutput> have been inactivated and they will not have access to the JRGM APP. <br />
        <cfoutput>#get_employee_info.employeename#</cfoutput> is still in the branch as a regular crewman.<br />
        <br />
        <a href="manage_crew_leaders.cfm">Go back to Manage Crew Managers</a>.</span>
        <cfabort>
      </cfif>
      <cfif IsDefined("url.add")>
        <br />
        <span class="redarial"> <cfoutput><strong>#get_employee_info.employeename#</cfoutput> is now listed as a crew leader in the branch</strong>.</strong></span> <br />
        <span class="arialfont"><br />
        The current login credentials for <cfoutput>#get_employee_info.employeename#</cfoutput> have been activated and they now have access to the JRGM APP.<br />
        <cfoutput>#get_employee_info.employeename#</cfoutput> user name is <cfoutput><u>#username#</u></cfoutput> and the password is <cfoutput><u>#password#</u></cfoutput><br />
        <br />
        <a href="manage_crew_leaders.cfm">Go back to Manage Crew Managers</a><br />
        </span>
        <cfabort>
      </cfif>
      <cfoutput query="get_employee_info">
        <div class="subheader">#employeename#</div>
        <ul class="crew">
        </ul>
        <cfif IsDefined("url.clalready") AND url.clalready EQ 'No'>
          <span class="arialfont">Do you want to make #employeename# a crew leader?</span> <br />
          <cfoutput><a href="employee_details_change_position.cfm?add=yes&employee_id=#url.employee_id#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="employee_details_change_position.cfm?employee_id=#url.employee_id#&clalready=no" class="YesNoButton">No</a>
            <p  class="redarial"> Choosing yes will make <strong>#employeename#</strong> a crew leader.</p>
            <span class="arialfont">A username and password to access the JRGM APP wil be generated.</span></cfoutput>
          <cfelse>
          <span class="arialfont"> Do you want to remove <cfoutput>#employeename#</cfoutput> as a crew leader?</span> <br />
          <cfoutput><a href="employee_details_change_position.cfm?remove=yes&employee_id=#url.employee_id#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="employee_details_change_position.cfm?employee_id=#url.employee_id#" class="YesNoButton">No</a>
            <p  class="redarial">Choosing yes will remove <strong>#get_employee_info.employeename#</strong> as a crew leader.</span> </p>
            <span class="arialfont">The current login credentials will be inactivated and they will not have access to the JRGM APP.<br />
            <strong>#get_employee_info.employeename#</strong> will remain in the branch as a regular crewman.<br />
            Remember if they are logged in as a crew leader today they can contnue working but they will not be able to log back into the APP if they have logged out. <br />
            Crew members that were allocted to #get_employee_info.employeename# will now be allocated to his production manager(supervisor). </span> </span></cfoutput>
        </cfif>
      </cfoutput><br />
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="js/jquery.pageslide.min.js"></script>
<script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
