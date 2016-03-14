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
}
.dstable_l5 {
	padding: 5px;
	padding-left: 10px;
	background-color: #F9FBFB;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold .75em Arial, Helvetica, sans-serif;
}
.dstable_l6 {
	padding: 5px;
	padding-left:10px;
	background-color: #FFFFFF;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: .70em Arial, Helvetica, sans-serif;
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
    <div class="header"> Administrative &#8212; Branch Listing: <cfoutput>#idx#</cfoutput>&nbsp; &nbsp; <br />
    </div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dailysheet_table" >
      <tr>
        <td class="dstable_l1">Position</td>
        <td class="dstable_l1">First Name</td>
        <td class="dstable_l1">Last Name</td>
        <td class="dstable_l1">Branch</td>
        <td align="center" class="dstable_l1">Employee ID</td>
        <td class="dstable_l1">Supervisor</td>
        <td align="center" class="dstable_l1">Jobs</td>
        <!---   <td class="dstable_header">Position</td> --->
      </tr>
      <cfquery name="get_branch_employees" datasource="jrgm">
SELECT DISTINCT APP_crews.Employee_ID,APP_employees.First_name, APP_employees.Last_name,
 Branch,position,[Direct Supervisor] AS directsupervisor
FROM   app_employees INNER JOIN app_crews
ON APP_crews.Employee_ID=APP_employees.[Employee ID] WHERE APP_employees.Branch = '#idx#' AND APP_crews.Employee_Position_ID= 1   AND  [Name FirstLast] NOT In ('General Richmond','General Williamsburg','General Charlottesville','General Newport News','General Chesterfield')
</cfquery>
      <!---   <cfdump var="#get_branch_employees#">   --->
      <cfloop query="get_branch_employees">
        <cfoutput>
          <tr>
            <td class="dstable_l2">#position#</td>
            <td class="dstable_l2">#first_name#</td>
            <td class="dstable_l2">#last_name#</td>
            <td class="dstable_l2">#branch#</td>
            <td align="center"  class="dstable_l2">#Employee_ID#</td>
            <td class="dstable_l2">#directsupervisor#</td>
            <cfquery name="get_CL_events" datasource="jrgm">
SELECT DISTINCT Job_ID FROM app_events  
WHERE crew_leader_id= #get_branch_employees.Employee_ID#  AND  export_id =1  
 </cfquery>
            <td align="center" class="dstable_l2">#get_CL_events.recordcount#</td>
          </tr>
        </cfoutput>
        <cfquery name="get_CL_events_list" datasource="jrgm">
SELECT * FROM app_events  
WHERE crew_leader_id= #get_branch_employees.Employee_ID#  AND  export_id =1  
 </cfquery>
        <cfif get_CL_events_list.recordcount GT 0 AND get_branch_employees.recordcount GT 0>
          <tr>
            <td class="dstable_l5">Job Name</td>
            <td class="dstable_l5">Job Address</td>
            <td class="dstable_l5">Job ID</td>
            <td class="dstable_l5">-</td>
            <td align="center" class="dstable_l5">- </td>
            <td class="dstable_l5">-</td>
            <td align="center" class="dstable_l5">-</td>
            <!---   <td class="dstable_header">Position</td> --->
          </tr>
          <cfoutput query="get_CL_events_list">
            <tr>
              <td class="dstable_l6">#event_name#</td>
              <td class="dstable_l6">#event_location#</td>
              <td class="dstable_l6">#job_id#</td>
              <td class="dstable_l6">#branch#</td>
              <td class="dstable_l6" align="left">#get_branch_employees.first_name# #get_branch_employees.last_name#</td>
              <td class="dstable_l6">-</td>
              <td align="center" class="dstable_l6">&nbsp;</td>
            </tr>
          </cfoutput>
        </cfif>
        <cfquery name="get_crew_employees_CL" datasource="jrgm">
SELECT DISTINCT APP_crews.Employee_ID,APP_employees.First_name, APP_employees.Last_name,
 Branch,position,[Direct Supervisor] AS directsupervisor
FROM   app_employees INNER JOIN app_crews
ON APP_crews.Employee_ID=APP_employees.[Employee ID] WHERE APP_employees.Branch ='#idx#' AND APP_crews.supervisor_id= #get_branch_employees.Employee_ID#  AND APP_crews.export_id =1  
AND APP_crews.Employee_Position_ID= 2
</cfquery>
        <cfif get_crew_employees_CL.recordcount GT 0>
          <cfloop query="get_crew_employees_CL">
            <cfoutput>
              <tr>
                <td class="dstable_l3">#position#</td>
                <td class="dstable_l3">#first_name#</td>
                <td class="dstable_l3">#last_name#</td>
                <td class="dstable_l3">#branch#</td>
                <td class="dstable_l3" align="center">#Employee_ID#</td>
                <td class="dstable_l3">#directsupervisor#</td>
                <cfquery name="get_CL_events" datasource="jrgm">
SELECT DISTINCT Job_ID FROM app_events  
WHERE crew_leader_id= #get_crew_employees_CL.Employee_ID#  AND  export_id =1  
 </cfquery>
                <td align="center" class="dstable_l3">#get_CL_events.recordcount#</td>
              </tr>
            </cfoutput>
            <cfquery name="get_CL_events_list" datasource="jrgm">
SELECT * FROM app_events  
WHERE crew_leader_id= #get_crew_employees_CL.Employee_ID#  AND  export_id =1  
 </cfquery>
            <cfif get_CL_events_list.recordcount GT 0 AND get_crew_employees_CL.recordcount GT 0>
              <tr>
                <td class="dstable_l5">Job Name</td>
                <td class="dstable_l5">Job Address</td>
                <td class="dstable_l5">Job ID</td>
                <td class="dstable_l5">-</td>
                <td align="center" class="dstable_l5">- </td>
                <td class="dstable_l5">-</td>
                <td align="center" class="dstable_l5">-</td>
                <!---   <td class="dstable_header">Position</td> --->
              </tr>
              <cfoutput query="get_CL_events_list">
                <tr>
                  <td class="dstable_l6">#event_name#</td>
                  <td class="dstable_l6">#event_location#</td>
                  <td class="dstable_l6">#job_id#</td>
                  <td class="dstable_l6">#branch#</td>
                  <td class="dstable_l6" align="left">#get_crew_employees_CL.first_name# #get_crew_employees_CL.last_name#</td>
                  <td class="dstable_l6">-</td>
                  <td align="center" class="dstable_l6">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
          </cfloop>
          <cfelse>
          <tr>
            <td   class="dstable_l4" align="left" colspan="7">No Crew Leaders</td>
          </tr>
        </cfif>
        <!---  <cfquery name="get_CL_events_list" datasource="jrgm">
SELECT * FROM app_events  
WHERE crew_leader_id= #get_crew_employees_CL.Employee_ID#  AND  export_id =1  
 </cfquery>
      <cfif get_CL_events_list.recordcount GT 0 AND get_crew_employees_CL.recordcount GT 0><tr>
        <td class="dstable_l5">Job Name</td>
        <td class="dstable_l5">Job Address</td>
          <td class="dstable_l5">Job ID</td>
             <td class="dstable_l5">-</td>
             <td align="center" class="dstable_l5">- </td>
        <td class="dstable_l5">-</td>
         <td align="center" class="dstable_l5">-</td>
       <!---   <td class="dstable_header">Position</td> --->
      </tr>
      
   
 
 
 <cfoutput query="get_CL_events_list"> <tr>
        <td class="dstable_l6">#event_name#</td>
        <td class="dstable_l6">#event_location#</td>
           <td class="dstable_l6">#job_id#</td>
            <td class="dstable_l6">#branch#</td>
            <td class="dstable_l6" align="center">#get_crew_employees_CL.firstname#  #get_crew_employees_CL.lastname#</td>
        <td class="dstable_l6">-</td>
        <td align="center" class="dstable_l6">&nbsp;</td>
       </tr> </cfoutput></cfif> --->
        <!---  <cfelse>
        <tr>
          <td   class="dstable_l4" align="left" colspan="7">No Jobs</td>
        </tr></cfif> --->
      </cfloop>
    </table>
    <div class="page-break"></div>
  </cfloop>
  <!---  
    <table width="100%" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td bgcolor="#F9FBFB">&nbsp;</td>
  </tr>
</table> --->
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
