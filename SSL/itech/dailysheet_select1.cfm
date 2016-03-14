<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
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
     
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td> <div class="header"> Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div></td>
            <td align="center" valign="top"><img src="images/add-ds-button.gif" alt="Add Daily Sheet" width="163" height="29" /></td>
          </tr>
        </table>
     
      <cfquery name="get_daily_sheets_for_supervisor" datasource="jrgm"   maxrows="100">
SELECT  * FROM app_daily_sheets  WHERE supervisor_id =#session.userid#  
ORDER by ds_date ASC, ID ASC 
 </cfquery>
      <cfif get_daily_sheets_for_supervisor.recordcount EQ 0>
        <div class="dailysheet_none">There are currently no Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div>
        <cfabort>
      </cfif>
      <table class="sortable" cellpadding="0" cellspacing="0" width="98%">
        <thead>
          <tr>
            <th align="left">ID
              </td>            </th>
            <th align="left">Date
              </td>            </th>
            <th align="left">Branch
              </td>            </th>
            <th align="left">Supervisor
              </td>            </th>
            <th align="left">Crew Leader
              </td>            </th>
            <th align="left">View
              </td>            </th>
            <th align="left">Map            </th>
            <th align="left">Edit
              </td>          </th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="get_daily_sheets_for_supervisor" >
            <cfquery name="get_info_CL" datasource="jrgm">
SELECT  [Name FirstLast] AS employee_name
FROM app_employees
 WHERE [Employee ID] =#get_daily_sheets_for_supervisor.crew_leader_id#
        </cfquery>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets_for_supervisor.ID#">#get_daily_sheets_for_supervisor.ID#</a></td>
              <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
              <td align="left">#SESSION.branch#</td>
              <td>#SESSION.screenname#</td>
              <td>#get_info_CL.employee_name#</td>
              <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets_for_supervisor.ID#">View</a></td>
              <cfif ds_date GT  yesterday>
                <cfquery name="get_gps_info" datasource="jrgm" maxrows="1">
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_daily_sheets_for_supervisor.ID#  
                    ORDER by ID DESC
 			 </cfquery>
                <td nowrap="nowrap"><a href="http://maps.google.com/maps?z=15&amp;t=m&amp;q=loc:#get_gps_info.gps_latitude#+#get_gps_info.gps_longitude#" target="_blank">Map</a></td>
                <cfelse>
                <td nowrap="nowrap">-</td>
              </cfif>
              <td><a href="daily_sheet_edit.cfm?dsid=#ID#">Edit</a> </td>
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
