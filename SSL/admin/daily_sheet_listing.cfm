<cfif  IsDefined("SESSION.access_role")  AND SESSION.access_role EQ  '94'    OR    SESSION.access_role EQ  '97' >
<cfset referringPage = #CGI.HTTP_REFERER#>

Click <a href="<cfoutput>#referringPage#</cfoutput>">Here</a> to go back to the page you just came from.
<br />
This does not mean you are going back but rather being forwarded on to the page you came from..
<br />
You get it?
<cflocation url="#referringPage#"> 
   
   <cfelse>
   <cfinclude template="#APPLICATION.basePath#include/init.cfm">

   <cfparam name="dsid"     default="100">
<cfparam name="form.dsid"     default="100">
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>

<cfquery name="get_all_employees" datasource="#CONFIG_DATABASENAME#">
  SELECT ae.[Employee ID] as employee_id, ae.[Name FirstLast] as full_name, ae.first_name, ae.last_name, CASE WHEN ac.employee_position_id IS NULL OR ac.employee_position_id=2 THEN 0 ELSE CASE WHEN ar.is_admin > 0 THEN 1 ELSE ac.employee_position_id END END as access_role, ac.crew_leader_id, ae.branch FROM app_employees ae
  INNER JOIN app_crews ac ON ac.employee_id=ae.[Employee ID]
  LEFT JOIN access_roles ar ON ar.access_role_id=ac.employee_position_id
  WHERE ae.[Employee ID] < 9500
  GROUP BY ae.[Employee ID], ae.[Name FirstLast], ae.first_name, ae.last_name, ac.crew_leader_id, ae.branch, ac.employee_position_id, ar.is_admin
  ORDER BY ae.last_name
</cfquery>
<cfset employees = ArrayNew(1)>
<cfset employees_used = StructNew()>
<cfloop query="get_all_employees">
    <cfif !StructKeyExists(employees_used, employee_id)>
        <cfset StructInsert(employees_used, employee_id, 1)>
        <cfset ArrayAppend(employees, { 'id': employee_id, 'name': full_name , 'first_name': first_name, 'last_name': last_name, 'access_role': access_role, 'crew_leader_id': crew_leader_id, 'branch': branch })>
    </cfif>
</cfloop>

<cfquery name="get_branches" datasource="#CONFIG_DATABASENAME#">
  SELECT * FROM branches
  WHERE branch_active=1
  AND branch_visible_to_select=1
  ORDER BY branch_name
</cfquery>

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
	text-align: right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
.YesNoButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8299bb), color-stop(1, #496a99) );
	background: -moz-linear-gradient( center top, #8299bb 5%, #496a99 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8299bb', endColorstr='#496a99');
	background-color: #8299bb;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #3f4b5b;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 6px 24px;
	text-decoration: none;
	width: 200px;
	margin-right: 40px;
	margin-top: 20px;
}
.YesNoButton:hover {
	color: #ffffff;
	text-decoration: none;
}
.removebutton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background: -moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color: #b92723;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #4a0c0d;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 6px 24px;
	text-decoration: none;
	width: 350px;
	margin-right: 40px;
	margin-top: 20px;
}
.removebutton:hover {
	color: #ffffff;
	text-decoration: none;
}
.search {
	padding: 7px 15px 9px 10px;
	margin: 3px;
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
          <cfabort></td>
      </tr>
    </table>
  </cfif>
  <cfif IsDefined("url.deleteme") AND url.deleteme EQ 'yes'>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM app_daily_sheets WHERE ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_clock  WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE  FROM  app_employee_payroll_clock WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE  FROM  app_lunch WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_clock WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM   APP_job_materials_actual WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID =#url.dsid#
    </cfquery>
    <cfquery name="delete_ds" datasource="jrgm">
   DELETE   FROM APP_Lunch WHERE DS_ID =#url.dsid#
    </cfquery>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="dailysheet_header">This daily sheet has been deleted.
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <br />
          <a href="daily_sheet_listing.cfm" class="YesNoButton"> Go back to list</a>
          <cfabort></td>
      </tr>
    </table>
  </cfif>
  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  <form action="daily_sheet_listing.cfm" method="post">
    <table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><div class="header"> Administrative &#8212; Daily Sheet Listing </div></td>
        <td bgcolor="#F2F7F5" align="right"><input type="text" name="dsid" class="search square" placeholder="Search..." />
          <input type="submit" value="Daily Sheets" /></td>
      </tr>
    </table>
    <br />
    <table align="center">
        <tr>
          <td nowrap="nowrap" align="right">Branch:&nbsp;</td>
          <td><span id="span_main_branch"></span></td>
          <td>&nbsp;&nbsp;&nbsp;</td>
          <td nowrap="nowrap" align="right">Production Manager:&nbsp;</td>
          <td><span id="span_production_manager_employee"></span></td>
          <td>&nbsp;&nbsp;&nbsp;</td>
          <td nowrap="nowrap" align="right">Crew Leader:&nbsp;</td>
          <td><span id="span_crew_leader_employee"></span></td>
          <td>&nbsp;&nbsp;&nbsp;</td>
          <td><input type="button" value="Apply Filters" onClick="applyFilters()"></td>
        </tr>
      </table>
    <input type="hidden"  name="submitted" value="yes"/>
  </form>
  <br />

  <!--- GET FILTER VARIABLES --->
  <cfif IsDefined('url.branch') AND IsDefined('url.production_manager') AND IsDefined('url.crew_leader')>
    <cfset SESSION.dailysheet_branch = url.branch>
    <cfset SESSION.production_manager = url.production_manager>
    <cfset SESSION.crew_leader = url.crew_leader>
    <cfset url.start = 1>
  </cfif>
  <cfset dailysheet_branch = SESSION.dailysheet_branch>
  <cfset production_manager = SESSION.production_manager>
  <cfset crew_leader = SESSION.crew_leader>
  <cfif dailysheet_branch NEQ ''>
      <cfquery name="get_daily_sheets" datasource="jrgm">
        SELECT  * FROM app_daily_sheets ads
        <cfif dailysheet_branch NEQ ''>
            INNER JOIN branches b ON b.branch_code=ads.branch_code AND b.branch_name='#dailysheet_branch#'
        </cfif>
        WHERE 1=1
        <cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >
            AND ads.ID = #form.dsid#
        <cfelse>
            <cfif production_manager NEQ ''>
                AND ads.supervisor_id = '#production_manager#'
            </cfif>
            <cfif crew_leader NEQ ''>
                AND ads.crew_leader_id = '#crew_leader#'
            </cfif>
        </cfif>
        ORDER by ads.ID DESC
      </cfquery>
  <cfelse>
      <cfquery name="get_daily_sheets" datasource="jrgm"   >
        SELECT  * FROM app_daily_sheets
        <cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >WHERE ID = #form.dsid#</cfif>
        ORDER by ID DESC
      </cfquery>
  </cfif>
  <cfset perpage = 50>
  <cfif !IsDefined('url.start') AND IsDefined('SESSION.dailysheet_start')>
    <cfset url.start = SESSION.dailysheet_start>
  </cfif>
  <cfparam name="url.start" default="1">
  <cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
  </cfif>
  <cfset SESSION.dailysheet_start = url.start>
  <cfset pagestart = url.start>
  <cfset totalPages = ceiling(get_daily_sheets.recordCount / perpage)>
  <cfset thisPage = ceiling(pagestart / perpage)>
  <cfif  NOT IsDefined("form.submitted") >
    <table width="100%" border="0" cellspacing="10" cellpadding="0">
      <tr class="arialfont">
        <td> [
          <cfif pagestart gt 1>
            <cfset link = cgi.script_name & "?start=" & (pagestart - perpage)>
            <cfoutput><a href="#link#">Newer Daily Sheets </a></cfoutput>
            <cfelse>
            Newer Daily Sheets
          </cfif>
          /
          <cfif (pagestart + perpage - 1) lt get_daily_sheets.recordCount>
            <cfset link = cgi.script_name & "?start=" & (pagestart + perpage)>
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
        <th align="left">ID </th>
        <th align="left">Date </th>
        <th align="left">Branch </th>
        <th align="left">Production Manager </th>
        <th align="left">Crew Leader
          </td>
          /Supervisor</th>
        <th align="left">Print</th>
        <th align="left">View </th>
        <th align="left">Edit </th>
        <th align="left">Approve </th>
        <th align="left">Delete</th>
        <td>Method</td>
        <th align="left">Morning</th>
        <th align="left">Evening</th>
      </tr>
    </thead>
    <tbody>
      <CFSET startrow = #pagestart#>
      <CFSET endrow = startrow+50>
      <CFSET mylist ="">
      <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
        <cfset myList = ListAppend(mylist,ID)>
      </cfloop>
      <cfoutput query="get_daily_sheets" startrow="#pagestart#" maxrows="#perpage#">
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
         <td><a href="daily_sheet2_print.cfm?dsid=#get_daily_sheets.ID#" target="_blank">Print</a></td>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">View</a></td>
          <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  AND  ds_approved NEQ 1 <!--- AND get_open_workers.recordcount  EQ 0 --->>
            <td><a href="daily_sheet_edit2.cfm?dsid=#ID#&email=yes">Edit</a></td>
            <cfelse>
            <td> -</td>
          </cfif>
          <cfif get_daily_sheets.ds_approved EQ 1>
            <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
            <cfelse>
            <td><a href="daily_sheet.cfm?dsid=#ID#&amp;email=yes">-</a></td>
          </cfif>
          <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  >
            <td><a href="daily_sheet_listing.cfm?delete=yes&dsid=#get_daily_sheets.ID#">Delete</a></td>
            <cfelse>
            <td> -</td>
          </cfif>
          <td><cfif get_daily_sheets.entry_method EQ 2>
              Manual
              <cfelse>
              APP
            </cfif></td>
          <cfif get_daily_sheets.entry_method EQ 2>
            <td>N/A</td>
            <cfelse>
            <cfquery name="get_eq_count" datasource="jrgm"  >
SELECT  COUNT(ID) AS pieces
FROM         equipment WHERE Crew_assignment_last =#get_daily_sheets.crew_leader_id#  
        </cfquery>
            <cfquery name="get_MI" datasource="jrgm"  >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_daily_sheets.crew_leader_id# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
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
            <cfquery name="get_EI" datasource="jrgm"  >
SELECT  *
FROM         app_Inspection_Master WHERE Crew_LeaderID =#get_daily_sheets.crew_leader_id# AND Inspection_Date = '#DateFormat(ds_date, 'yyyy-mm-dd')#'
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
  <!--  </div>--> 
  <!-- to clear footer --> 
</div>
<!-- end outer div --> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script type='text/javascript'>
    <cfoutput>
    var dailysheet_branch = '#SESSION.dailysheet_branch#';
    var production_manager = '#SESSION.production_manager#';
    var crew_leader = '#SESSION.crew_leader#';

    var employees = {};
    var employees_select = {};
    <cfloop from="1" to="#arrayLen(employees)#" index="i">
        <cfset employee = employees[i]>
        var employee = { full_name: '#employee.id# - #Replace(employee.name, "'", "\\'", "ALL")#', first_name: '#Replace(employee.first_name, "'", "\\'", "ALL")#', last_name: '#Replace(employee.last_name, "'", "\\'", "ALL")#', employee_id: '#employee.id#', branch: '#employee.branch#', 'access_role': '#employee.access_role#', 'crew_leader_id': '#employee.crew_leader_id#' };
        employees[#employee.id#] = employee;
        if (!employees_select[employee.branch])
            employees_select[employee.branch] = [];
        employees_select[employee.branch].push([employee.employee_id, employee.full_name]);
    </cfloop>
    </cfoutput>

    var branches = {};
    var branches_select = [];
    var jobs = {};
    var jobs_select = [];
    <cfoutput query="get_branches">
        branches['#branch_name#'] = { name: '#branch_name#', branch_abbr: '#branch_abbr#'};
        branches_select.push(['#branch_name#', '#branch_name#']);</cfoutput>

    function populateBranchSelect(spanId, branch) {
        var html = '';
        user_branch = '';
        html += '<select id="'+spanId+'_branch" class="bs-select form-control" onChange="populateEmployeeSelect(\'crew_leader\', this.value); populateEmployeeSelect(\'production_manager\', this.value)">';
        html += '<option value="">[ All ]</option>';
        for(var i=0; i<branches_select.length; i++) {
            var b = branches[branches_select[i][0]];
            if (b.name == branch)
                user_branch = branch;
            html += '<option value="'+b.name+'"'+(b.name == branch?' selected':'')+'>'+b.name+'</option>';
        }
        html += '</select>';
        $('#span_'+spanId+'_branch').html(html);

        populateEmployeeSelect('main', user_branch);
    }

    function populateEmployeeSelect(spanId, branch, employee_id)
    {
        var html = '';
        html += '<select id="'+spanId+'_employee" class="bs-select form-control">';
        html += '<option value="">[ All ]</option>';
        if (employees_select[branch])
        {
            for(var i=0; i<employees_select[branch].length; i++) {
                var e = employees[employees_select[branch][i][0]];
                html += '<option value="'+e.employee_id+'"'+(e.employee_id==employee_id?' selected':'')+'>'+e.last_name+', '+e.first_name+'</option>';
            }
        }
        html += '</select>';
        $('#span_'+spanId+'_employee').html(html);
    }

    function applyFilters()
    {
        var url = 'daily_sheet_listing.cfm?branch='+$('#main_branch').val();
        url += '&production_manager='+$('#production_manager_employee').val();
        url += '&crew_leader='+$('#crew_leader_employee').val();
        window.location = url;
    }

    $( document ).ready(function() {
        populateBranchSelect('main', dailysheet_branch);
        populateEmployeeSelect('production_manager', dailysheet_branch, production_manager);
        populateEmployeeSelect('crew_leader', dailysheet_branch, crew_leader);
    });
</script>
</body>
</html>
</cfif>