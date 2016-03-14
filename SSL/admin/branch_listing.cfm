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
<link href="css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
.red {
	color: #F00;
}
.dstable_l1 {
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: bold .70em Arial, Helvetica, sans-serif;
}

.dstable_headersuper {
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: bold 1.0em Arial, Helvetica, sans-serif;
}
.dstable_regcrew {
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: .8em Arial, Helvetica, sans-serif;
}

@media all {
.page-break {
	display: none;
}
}
 @media print {
.page-break {
	display: block;
	page-break-before: always;
}
.dstable_l4 {
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: normal .75em Arial, Helvetica, sans-serif;
}
 
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<!--<div id="outerfull">-->
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
<cfinclude template="includes/topbar.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">
  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  <cfloop list="Charlottesville,Chesterfield,Newport News,Portsmouth,Richmond,Williamsburg" index="idx"> 
    <div class="header"> Administrative &#8212; Branch Listing: <cfoutput>#idx#</cfoutput>
    </div>
    <cfquery name="get_supervisors" datasource="jrgm">
SELECT  * FROM   app_crews   WHERE  employee_branch = '#idx#' AND  Employee_Position_ID= 1    AND active_record =1
</cfquery>
      <cfloop query="get_supervisors">
        <cfoutput>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
               <tr class="dstable_headersuper" height="40">
              <td align="left">&nbsp;&nbsp;SUPERVISOR</td>
            <td>#First_name#</td>
            <td>#Last_name#</td>
            <td align="center">#Employee_ID#</td>
 <cfquery name="get_supervisor_jobs" datasource="jrgm">
SELECT DISTINCT Job_ID FROM app_events  
WHERE crew_leader_id= #get_supervisors.Employee_ID# 
 </cfquery>
            <td align="center" >#get_supervisor_jobs.recordcount#</td>
          </tr>
        </cfoutput>
       
        <cfquery name="get_crew_leaders" datasource="jrgm">
SELECT  * FROM   app_crews   WHERE  employee_branch = '#idx#' AND  Employee_Position_ID= 2    AND supervisor_id =#get_supervisors.Employee_ID# AND active_record =1
 </cfquery>
        <cfif get_crew_leaders.recordcount GT 0>
          <cfloop query="get_crew_leaders">
            <cfoutput>
              <tr class="dstable_headersm" height="30">
                <td>&nbsp;&nbsp;Crew Leader</td>
                <td>#First_name#</td>
                <td>#Last_name#</td>
                 <td align="center"  >#Employee_ID#</td>
        
                <cfquery name="get_supervisor_jobs" datasource="jrgm">
SELECT DISTINCT Job_ID FROM app_events  
WHERE crew_leader_id= #get_crew_leaders.Employee_ID# </cfquery>
                <td align="center">#get_supervisor_jobs.recordcount#</td>
              </tr>
            </cfoutput>

            <cfquery name="get_crew_employees" datasource="jrgm">
SELECT  * FROM   app_crews   WHERE  employee_branch = '#idx#' AND  Employee_Position_ID= 0    AND crew_leader_id =#get_crew_leaders.Employee_ID# AND active_record =1
AND end_date > #tomorrow#
ORDER by last_name ASC
</cfquery>
           
            <cfif get_crew_employees.recordcount GT 0>
              <cfoutput query="get_crew_employees">
                <tr class="dstable_regcrew" height="20">
                  <td></td>
                  <td>#First_name#</td>
                  <td>#Last_name#</td>
                  <td align="center" >#Employee_ID#</td>
                  <td align="center" >&nbsp;</td>
                </tr>
              </cfoutput>
              <tr class="dstable_regcrew" height="20"><td  colspan="7">&nbsp;</td></tr>
              <cfelse>
         <tr class="dstable_regcrew" height="20"><td align="center" colspan="7">No Crew Members</td></tr>  
            </cfif>
          </cfloop>
          <cfelse>
        <tr class="dstable_regcrew" height="20" ><td align="center" colspan="7">No Crew Leaders</td></tr>
        </cfif> 
         </table>
      </cfloop>

  
  <div class="page-break"></div>
  </cfloop>

</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
