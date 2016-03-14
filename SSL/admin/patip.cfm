<cfquery name="max_jobs" datasource="jrgm">
   SELECT MAX(export_date) AS maxjobs   FROM   app_jobs 
</cfquery>
<cfquery name="max_employees" datasource="jrgm">
   SELECT MAX(export_date) AS maxemployees   FROM   app_employees 
</cfquery>
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
	background:#FFF;
	border: .8px solid #c0c0c0;
	border-bottom: none;
}
table.sortable thead {
	padding: 5px;
	background-color: #cde3fc;
	color:#000;
	cursor: default;
	font: bold .8em Arial, Helvetica, sans-serif;
}
table.sortable thead th {
	padding: 5px;
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
	padding: 3px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
</style>
</head>
<body>
 
<!--- <div id="centrecontent">
 <div class="centrecontent_inner"> --->
  <table width="95%" border="0" cellpadding="0" cellspacing="0" class="bigfont">
       <tr>
        <td><a href="employee_one_dsid_check.cfm">Todays Crews</a></td>
        <td nowrap="nowrap">&nbsp;</td>
        <td height="30" nowrap="nowrap"><a href="pat/time.cfm">Timer</a></td>
        <td height="30" nowrap="nowrap"><a href="pat/dstest.cfm">DSTest</a></td>
      </tr>
</table>
  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  <table class="sortable" cellpadding="3" cellspacing="0" width="95%" align="center">
    <thead>
      <tr>
        <th align="left">ID
          </td>        </th>
        <th align="left">Date
          </td>        </th>
        <th align="left">Branch
          </td>        </th>
        <th align="left">Super
          </td>        </th>
        <th align="left">Crew
          </td>        </th>
        
        <th align="left">Map
          </td>        </th>
      
        <th align="left">Min 
          </td>        </th>
        <th align="left">Max</th>
      </tr>
    </thead>
    <tbody>
      <!--- <cfdump var="#get_daily_sheets_for_supervisor#">   --->
      <cfquery name="get_daily_sheets_for_supervisor" datasource="jrgm"   maxrows="35"> 
SELECT  * FROM app_daily_sheets    ORDER by ds_date DESC,ID DESC
      </cfquery>
    </tbody>
    <cfoutput query="get_daily_sheets_for_supervisor">
      <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Employee ID] AS empid, [Last_name] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets_for_supervisor.crew_leader_id#
        </cfquery>
      <cfquery name="get_info_S" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Last_name] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets_for_supervisor.supervisor_id#
        </cfquery>
      <CFSET ds_date = #DateFormat(get_daily_sheets_for_supervisor.ds_date, "mm/dd/yyyy")# >
      <CFSET today_datex =#DateFormat(Now(), "mm/dd/yyyy")# >
         </tr>
        <tr>
       <td><h4><a href="daily_sheet_ip.cfm?dsid=#get_daily_sheets_for_supervisor.ID#">#ID#</a></h4></td>
         <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
         <cfif get_info_S.branch EQ 'Newport News'>
          <CFSET branchnew = "NN" >
          <cfelseif get_info_S.branch EQ 'Charlottesville'>
          <CFSET branchnew = "CVL" >
           <cfelseif get_info_S.branch EQ 'Williamsburg'>
          <CFSET branchnew = "WMB" >
          <cfelseif get_info_S.branch EQ 'Richmond'>
          <CFSET branchnew = "RIC" >
          <cfelse>
         <CFSET branchnew = #Left(get_info_S.branch,3)# >
         </cfif>
        <td align="left" nowrap="nowrap">#branchnew#</td>
        <td nowrap="nowrap">#get_info_S.employee_name# -#supervisor_id# </td>
        <td nowrap="nowrap">#get_info_CL.employee_name# - #get_info_CL.empid#</td>
         <cfif ds_date GT  yesterday>
          <cfquery name="get_gps_info" datasource="jrgm" maxrows="1">
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_daily_sheets_for_supervisor.ID#  
                    ORDER by ID DESC
 			 </cfquery>
          <td nowrap="nowrap"><a href="http://maps.google.com/maps?z=15&t=m&q=loc:#get_gps_info.gps_latitude#+#get_gps_info.gps_longitude#" target="_blank">Map</a></td>
          <cfelse>
          <td nowrap="nowrap">-</td>
        </cfif>
     
      
        <cfquery name="gettimes" datasource="jrgm" >
SELECT MIN(Time_in) mintimein,  MAX(Time_out) maxtimeout
FROM  app_employee_payroll_clock WHERE ds_id =  #get_daily_sheets_for_supervisor.ID#
             </cfquery>
        <td nowrap="nowrap">#TimeFormat(gettimes.mintimein, "H:mm")#</td>
        <td nowrap="nowrap">#TimeFormat(gettimes.maxtimeout, "H:mm")#</td>
      </tr>
    </cfoutput>
    
  </table>
<!--- </div>
</div> ---><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
