      <cfquery name="get_daily_sheets_tech" datasource="jrgm"  >
		SELECT  * FROM app_daily_sheets  WHERE Crew_Leader_ID =#session.userid#  
		ORDER by ds_date DESC, ID DESC 
 		</cfquery>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<LINK rel="stylesheet" type"text/css" href="css/print.css" media="print">

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
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
.redtype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: bold 1em Arial, Helvetica, sans-serif;
	color: red;
}
.greentype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: normal 1em Arial, Helvetica, sans-serif;
	color: #00573d;
}
.notesh2 {
	margin-left: 20px;
	padding: 20px;
	border: 1px solid #dce9e5;
	font: bold 14px Arial, Helvetica, sans-serif;
	color: #00573d;
	background-color: #dce9e5;
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
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <cfif IsDefined("url.message") >
        <table width="100%" border="0" cellspacing="3" cellpadding="4">
          <tr   >
            <td class="notesh2">Daily Sheet ID: <cfoutput>#url.dsid#</cfoutput> has been approved.</td>
          </tr>
        </table>
        <br />
      </cfif>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div class="header">Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div></td>
          <td align="right"><a href="dailysheet_add.cfm" class="greenbutton">+&nbsp;&nbsp;Add Daily Sheet</a></td>
        </tr>
      </table>
   
      <cfif get_daily_sheets_tech.recordcount EQ 0>
        <div class="arialfont">There are currently no Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div>
        <cfabort>
      </cfif>
        <cfset perpage = 50>
 <cfparam name="url.start" default="1">
<cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets_tech.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
</cfif>
 <cfset totalPages = ceiling(get_daily_sheets_tech.recordCount / perpage)>
<cfset thisPage = ceiling(url.start / perpage)>
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
    <td>[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets  </a></cfoutput>
<cfelse>
  
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets_tech.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
</cfif>
]
 </td> 
  <td><cfoutput>
 You are on page #thisPage# of #totalPages#.
 </cfoutput>
 </td>
   </tr>
</table> 
      <table class="sortable" cellpadding="0" cellspacing="0" width="98%">
        <thead>
          <tr>
            <th align="left">ID
              </td>
            </th>
            <th align="left">Date
              </td>
            </th>
            <th align="left">Branch
              </td>
            </th>
            <th align="left">Supervisor
              </td>
            </th>
            <th align="left">Crew Leader
              </td>
            </th>
            <th align="left">View
              </td>
            </th>
            <th align="left">Map
              </td>
            </th>
            <th align="left">Edit
              </td>
            </th>
         <th align="left">Approved
              </td>
            </th> 
          </tr>
        </thead>
      <CFSET startrow = #url.start#>
 <CFSET endrow = startrow+50>
 <CFSET mylist ="">
 <cfloop query="get_daily_sheets_tech"  startrow="#startrow#" endrow="#endrow#">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>
           <cfoutput query="get_daily_sheets_tech" startrow="#url.start#" maxrows="#perpage#">
             <cfquery name="get_info_supervisor" datasource="jrgm">
			SELECT  [Name FirstLast] AS employee_name
			FROM app_employees
 			WHERE [Employee ID] =#get_daily_sheets_tech.supervisor_id#
        </cfquery>
            <tr>
              <td>#get_daily_sheets_tech.ID#</td>
              <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
              <td align="left">#SESSION.branch#</td>
              <td>#get_info_supervisor.employee_name#</td>
               <td>#SESSION.screenname#</td>
             
              <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets_tech.ID#">View</a></td>
              <cfif ds_date GT  yesterday>
                <cfquery name="get_gps_info" datasource="jrgm" maxrows="1">
				SELECT gps_latitude,gps_longitude FROM app_gps
				    WHERE DS_ID=#get_daily_sheets_tech.ID#  
                    ORDER by ID DESC
 			 </cfquery>
                <td align="left" nowrap="nowrap"><a href="https://maps.google.com/maps?q=#get_gps_info.gps_latitude#,#get_gps_info.gps_longitude#&amp;z=15" target="_blank">Map</a></td>
                <cfelse>
                <td nowrap="nowrap">-</td>
              </cfif>
              <cfquery name="get_open_workers" datasource="jrgm" >
       SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
    WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #ID#
      </cfquery>
              <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  ))  AND  ds_approved NEQ 1 AND get_open_workers.recordcount  EQ 0>
                <td><a href="daily_sheet_edit.cfm?dsid=#ID#&email=yes">Edit</a> </td>
                <cfelse>
                <td> -</td>
              </cfif>
                 <cfif get_daily_sheets_tech.ds_approved EQ 1>
                  <td><a href="daily_sheet.cfm?dsid=#ID#" class="redtype">Approved</a></td>
                  <cfelse>
                  <td>-</td>
                </cfif>
             </tr>
          </cfoutput>
        </tbody>
      </table>
       <p>&nbsp;</p>
    </div>
  </div>
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
