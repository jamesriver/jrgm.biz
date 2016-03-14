
<cfparam name="dsid"     default="100">
<cfparam name="form.dsid"     default="100">

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<CFSET allchecked ='Yes'>
<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>
 
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
 
 <cfparam name="page" default="0">
<!--- <cfoutput>#myList#</cfoutput> --->
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
		padding:7px 5px 9px 10px;
	margin:3px; 
}
input[type=text]{
	color:#333;
}
input[type=submit], input[type=submit]:hover {
	padding:8px 10px 10px 10px;
	position:relative; 
	left:-5px;
	border:1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#16705a), color-stop(100%,#00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%,#00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3',GradientType=0 ); /* IE6-9 */
	color:#fff;
	cursor: pointer;
}</style>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfif IsDefined("url.delete") AND url.delete EQ 'yes'>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="dailysheet_header">Are you sure you want to delete Daily Sheet ID <cfoutput>#url.dsid#</cfoutput>?<br />
          <cfoutput><a href="dailysheet_select.cfm?dsid=#url.dsid#&deleteme=yes" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="dailysheet_select.cfm" class="YesNoButton">No. Go back to list</a>
            <p  class="redarial"> <br />
              Choosing yes will delete this daily sheet. </p>
          </cfoutput>
          <cfabort>
        </td>
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
      <cfmail to="pat@1design.com"    FROM="JRGM Alerts <alerts@jrgm.com>"  subject="Daily Sheet Deleted"  type="html">
  DSID : #url.dsid# was deleted by  #SESSION.screenname#
    </cfmail> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="dailysheet_header">This daily sheet has been deleted.
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <br />
          <a href="dailysheet_select.cfm" class="YesNoButton"> Go back to list</a>
          <cfabort>
        </td>
      </tr>
    </table>
  </cfif>
  
  
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
       <cfquery name="get_daily_sheets" datasource="jrgm"   >
 SELECT  * FROM app_daily_sheets 
WHERE ds_date < '#todaydate_DS#'   AND  (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#) 
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
 ORDER by ID DESC
 </cfquery>  
      <form action="dailysheet_select.cfm" method="post"> 
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap"><div class="header">Daily Sheets for <cfoutput>#regionname#</cfoutput> Region</div></td>
         <td   align="left" nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..."><input type="submit" value="Daily Sheets"> 
         </td>
              <td align="right" width="50%"><a href="dailysheet_add.cfm" class="greenbutton">+&nbsp;&nbsp;Add Daily Sheet</a></td>
        </tr>
      </table>
     <input type="hidden"  name="submitted" value="yes"/>
</form>

 <br />
  
 <cfset perpage = 50>
 <cfparam name="url.start" default="1">
<cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
</cfif>
 <cfset totalPages = ceiling(get_daily_sheets.recordCount / perpage)>
<cfset thisPage = ceiling(url.start / perpage)>
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
    <td>[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets  </a></cfoutput>
<cfelse>
 <!---   Newer Daily Sheets --->
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
   <!--- Older Daily Sheets --->
</cfif>
]
 </td> 
  <td><cfoutput>
 You are on page #thisPage# of #totalPages#.
 </cfoutput>
 </td>
  
  </tr>
</table> 
<table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>
        <tr>
          <th align="left">ID
            </td>          </th>
          <th align="left">Date
            </td>          </th>
          <th align="left">Branch
            </td>          </th>
          <th align="left">Supervisor
            </td>          </th>
          <th align="left">Crew Leader
            </td>          </th>
          <th align="left">View
            </td>          </th>
       
          <th align="left">Edit
              </td>
            </th>
            <th align="left">Approve
              </td>
            </th>
              <th align="left">Delete
              </td>
            </th>
        </tr>
      </thead>
      <tbody>
      
<CFSET startrow = #url.start#>
 <CFSET endrow = startrow+50>
 <CFSET mylist ="">
 <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>

<!--- <cfoutput query="get_daily_sheets" startrow="#url.start#" maxrows="#perpage#"> --->
 
         <cfoutput query="get_daily_sheets"  startrow="#url.start#" maxrows="#perpage#">
          <cfquery name="get_info_CL" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets.crew_leader_id#
        </cfquery>
          <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets.supervisor_id#
        </cfquery>
          <tr>
            <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets.ID#</a></td>
            <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
            <td align="left">#get_info_S.branch#</td>
            <td>#get_info_S.employee_name#</td>
            <td>#get_info_CL.employee_name#</td>
            <td><a href="daily_sheet.cfm?dsid=#ID#">View</a></td>
             <cfquery name="get_open_workers" datasource="jrgm" >
           SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
        WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #ID#
         </cfquery>
              <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  AND  ds_approved NEQ 1 AND get_open_workers.recordcount  EQ 0>
                <td><a href="daily_sheet_edit.cfm?dsid=#ID#&email=yes&branch=#get_info_S.branch#">Edit</a> </td>
                <cfelse>
                <td> -</td>
              </cfif>
              <cfif       ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM)) AND get_open_workers.recordcount  EQ 0>
                <cfif get_daily_sheets.ds_approved EQ 1>
                  <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                  <cfelse>
                  <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">Approve</a> </td>
                </cfif>
                <cfelse>
                <td> -</td>
              </cfif>
                <cfif  (ds_date GT #APPLICATION.blockdate#)>
            <td><a href="dailysheet_select.cfm?delete=yes&dsid=#get_daily_sheets.ID#">Delete</a></td>
            <cfelse>
            <td> -</td>
          </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
          </tr>
      
      </tbody>
    </table>
    <p>&nbsp;</p>
  </div> </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
