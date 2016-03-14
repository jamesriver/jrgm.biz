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
<link href="pagination/pagination.css" rel="stylesheet" type="text/css" />
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
    <div class="headernp">Daily Sheets for <cfoutput>#regionname#</cfoutput> Region</div>
    
   <cfset records_per_page = 300>
 <cfparam name="url.page" default="0">
 <!---    <cfquery name="get_daily_sheets_for_supervisor" datasource="jrgm"  maxrows="1000" > 
SELECT  * FROM APP_daily_sheets  WHERE (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#) ORDER by ds_date DESC
  </cfquery> --->
  
 <CFSET startrow = (#page#*300) +1>
 <CFSET endrow = startrow +300>
 <cfquery name="get_daily_sheets_for_supervisor" datasource="jrgm"     >
 SELECT * FROM
 (SELECT ROW_NUMBER() 
 OVER (ORDER BY ID DESC) AS Row, 
 *
 FROM app_daily_sheets) AS EMP
 WHERE (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#)  AND Row BETWEEN #startrow# AND #endrow#
 </cfquery> 
 <table width="90%" border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td><div class="pagination">
		<a href="#" class="page gradient">first</a>
        <a href="#" class="page gradient">2</a>
        <a href="#" class="page gradient">3</a>
        <span class="page active">4</span>
        <a href="#" class="page gradient">5</a>
        <a href="#" class="page gradient">6</a>
        <a href="#" class="page gradient">last</a>
	</div></td>
     <td align="right"><a href="dailysheet_add.cfm" class="greenbutton">+&nbsp;&nbsp;Add Daily Sheet</a></td>
   </tr>
 </table>
 
 <!---  <cfdump var="#get_daily_sheets_for_supervisor#" > --->
     <cfif get_daily_sheets_for_supervisor.recordcount EQ 0>
      <div class="dailysheet_none">There are currently no Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div>
      <cfabort>
    </cfif>
    
   <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>

  <cfquery name="total_count"  datasource="jrgm"   >
SELECT COUNT(id) AS records FROM app_daily_sheets WHERE (Supervisor_ID IN (#myList#)  OR  Supervisor_ID = #SESSION.userid#)
  </cfquery>

  
  
  <cfparam name="url_of_page" default="1">
<cfset start_record = url.page * records_per_page - records_per_page>
    <tr bgcolor="#FFFFFF" height="30"> 
   <td  colspan="3">&nbsp;</td>
    <td colspan="2" align="right">
     <cfif page EQ 1>
  <cfelse>
<cfoutput> <a href="dailysheet_select.cfm?page=#page-1#" >< Previous 300 Daily Sheets</a></cfoutput>
    </cfif></td>
     <td colspan="2" align="right"><cfif page * records_per_page LT total_count.records>
 <cfoutput><a href="dailysheet_select.cfm?page=#page+1#" >> Next 300 Daily Sheets</a></cfoutput>  &nbsp; &nbsp; &nbsp;  
 <cfelse>
  </cfif></td>
  </tr>
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
        </tr>
      </thead>
      <tbody>
 
         <cfoutput query="get_daily_sheets_for_supervisor">
          <cfquery name="get_info_CL" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets_for_supervisor.crew_leader_id#
        </cfquery>
          <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_daily_sheets_for_supervisor.supervisor_id#
        </cfquery>
          <tr>
            <td><a href="daily_sheet.cfm?dsid=#ID#">#get_daily_sheets_for_supervisor.ID#</a></td>
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
                <cfif get_daily_sheets_for_supervisor.ds_approved EQ 1>
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
