 <CFSET session.Crew_Leader_IDR = 0>
 
  <cfif IsDefined("form.submitted2")>
 <CFSET session.Crew_Leader_IDR = form.Crew_Leader_ID>
  </cfif>
  
  
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
<cfquery name="get_BM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<!--- get clid formds --->

<cfquery name="get_clid_branch_ds" datasource="jrgm">
SELECT Crew_Leader_ID FROM 
APP_daily_sheets WHERE supervisor_id IN (#mylist#)
</cfquery>

<CFSET mylist2 ="">
<cfloop query="get_clid_branch_ds">
  <cfset myList2= ListAppend(mylist2,Crew_Leader_ID)>
</cfloop>



<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
 <cfquery name="get_daily_sheets" datasource="jrgm"   > 
 SELECT  * FROM app_daily_sheets 
WHERE  (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#)
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
<cfif IsDefined("form.submitted2")  AND CREW_LEADER_ID NEQ 'All'   >AND    Crew_Leader_ID = #form.Crew_Leader_ID#</cfif>
  ORDER by ID DESC
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
form{
	margin:0 auto;
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
}

select{
    background:transparent;
    width: 250px;
    padding: 2px;
    font-family:Arial, Helvetica, sans-serif;
    font-size:20px;
    font-weight:300;
      line-height: 1;
    border: 0;
    border-radius: 0;
    height: 32px;
    -webkit-appearance: none;

    }

 .select-div{
width: 250px;
height: 50px;
overflow: hidden;
 border-top:#575757 1px solid;
-webkit-border-radius: 4px 4px 4px 4px;
 -moz-border-radius: 4px 4px 4px 4px;
      border-radius: 4px 4px 4px 4px;
-webkit-box-shadow: inset 0 2px 4px rgba(107, 105, 105, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
 -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
      box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
      -moz-box-shadow:    0px 8px 3px -9px #000000;
      -webkit-box-shadow: 0px 8px 3px -9px #000000;
      box-shadow:         0px 8px 3px -9px #000000;
   }

</style>

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
  
 <div class="header">Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div>
 <table   border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>   <form action="dailysheet_select.cfm" method="post"> 
         <table   border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td  nowrap="nowrap"><span class="arialfont"><strong>Search by Crew Leader&nbsp;:</strong></span>&nbsp;</td>
          <td nowrap="nowrap"> 
     <cfquery name="get_clid" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees
<!--- <cfif  session.Crew_Leader_IDR NEQ 'All'> --->WHERE  [Employee ID]  IN  (#mylist2#)<!--- </cfif> --->
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
   <select  class="a" name="Crew_Leader_ID"   tabindex="5" onchange='this.form.submit()'>
    <option value="All" <cfif session.crew_leader_idr EQ 'All'> selected="selected"</cfif>>All</option>
 	  <cfoutput query="get_clid">
   <option   value="#employee_id#" <cfif session.crew_leader_idr EQ #get_clid.employee_id#> selected="selected"</cfif>>#fullname#</option>
   </cfoutput> 
   </select> 
          </td>
        </tr>
      </table>
     <input type="hidden"  name="submitted2" value="yes"/>
</form></td>
    <td nowrap="nowrap">&nbsp;<span class="arialfont"><strong>or by DSID :</strong></span></td>
    <td> <form action="dailysheet_select.cfm" method="post"> 
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap"></td>
         <td   align="left" nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..."><input type="submit" value="Daily Sheets"> 
         </td>  <td align="right" width="200"> &nbsp;&nbsp </td>
              <td align="right" width="50%"><a href="dailysheet_add.cfm" class="greenbutton">+&nbsp;&nbsp;Add Daily Sheet</a></td>
        </tr>
      </table>
     <input type="hidden"  name="submitted" value="yes"/>
</form> <br /></td>
  </tr>
</table>

       
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
  
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
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
           <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
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
            <th align="left">Map </th>
            <th align="left">Edit
              </td>
            </th>
            <th align="left">Approve
              </td>
            </th>
          </tr>
        </thead>
        <tbody>
        <cfif get_daily_sheets.recordcount EQ 0>
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
        </cfquery>
            <tr>
              <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets.ID#</a></td>
              <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
              <td align="left">#SESSION.branch#</td>
              <td>#get_info_S.employee_name#</td>
              <td>#get_info_CL.employee_name#</td>
              <td><a href="daily_sheet.cfm?dsid=#ID#">View</a></td>
              <cfif ds_date GT  yesterday>
                <cfquery name="get_gps_info" datasource="jrgm" maxrows="1">
				SELECT * FROM app_gps
				    WHERE DS_ID=#get_daily_sheets.ID#  
                    ORDER by ID DESC
 			 </cfquery>
                <td nowrap="nowrap"><a href="https://maps.google.com/maps?q=#get_gps_info.gps_latitude#,#get_gps_info.gps_longitude#&z=13" target="_blank">Map</a></td>
                <cfelse>   
                <td nowrap="nowrap">-</td>
              </cfif>
                <cfquery name="get_open_workers" datasource="jrgm" >
           SELECT   ds_id, supervisor FROM APP_Employee_Payroll_Clock  
        WHERE in_out_status=1 AND time_out IS NULL AND ds_id = #ID#
         </cfquery>
              <cfif ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM))  AND  ds_approved NEQ 1 AND get_open_workers.recordcount  EQ 0>
                <td><a href="daily_sheet_edit.cfm?dsid=#ID#&amp;email=yes">Edit</a> </td>
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
