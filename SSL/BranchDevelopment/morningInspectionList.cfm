<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   

   <div class="header">Morning Inspection Form List</div>
   
        
          
   <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
            <th align="left">ID</th>
            <th align="left">Date</th>
            <th align="left">Branch</th>
            <th align="left">Supervisor</th>
            <th align="left">Crew Leader</th>
            <th align="left">View</th>
          </tr>
        </thead>
  <!---  <cfquery name="get_branch_employees_PW" datasource="jrgm"  >
SELECT   ID, Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, employee_branch, email
FROM app_employee_passwords
WHERE employee_branch = '#SESSION.branch#'  AND    employee_active = 1
ORDER by  lastname ASC,firstname ASC
</cfquery> --->
    <tbody>
 <!--- <cfif get_daily_sheets.recordcount EQ 0>
        <div class="dailysheet_none">There are currently no Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div>
        <cfabort>
      </cfif>
      
 <CFSET startrow = #url.start#>
 <CFSET endrow = startrow+50>
 <CFSET mylist ="">
 <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>
           <cfoutput query="get_daily_sheets" startrow="#url.start#" maxrows="#perpage#">
            <cfquery name="get_info_CL" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets.crew_leader_id#
        </cfquery>
            <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets.supervisor_id#
        </cfquery> --->
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11522</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Marco Tolentino</td>
              <td>Leonides Moreno-Rosales</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11514</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Trevor Atkins</td>
              <td>William Swiney</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11492</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Brian Sutton</td>
              <td>Miguel Maldonado</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11488</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Marco Tolentino</td>
              <td>Henry Argueta</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11485</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Justin Vanlandingham</td>
              <td>Henry Argueta</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11483</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Marco Tolentino</td>
              <td>Rafael Osornio</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11479</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Justin Vanlandingham</td>
              <td>Carlos Murcia-Peraza</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11465</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Trevor Atkins</td>
              <td>Oscar Gil</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11443</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Brian Sutton</td>
              <td>Bon Ouk</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">11440</a></td>
              <td nowrap="nowrap">09/30/2014</td>
              <td align="left">Chesterfield</td>
              <td>Mark Cannon</td>
              <td>Michael Layne</td>
              <td><a href="Morning_Inspection_Form.cfm" target="_blank">View</a></td>
            </tr>
        </tbody>
      </table>
          
  </div>  </div>
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
