<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM app_jobs  WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
<!--- <cfdump var="#get_job_info#"> --->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
$('#selectElementId').change(
    function(){
         $(this).closest('form').trigger('submit');
         /* or:
         $('#formElementId').trigger('submit');
            or:
         $('#formElementId').submit();
         */
    });</script>
 <style type="text/css">
input {
	text-align:left;
	font: bold 18px Arial, Helvetica, sans-serif;
	color: #333333;
	padding: 4px 6px 3px 6px;
}
input2 {
	text-align:right;
	font: bold 16px Arial, Helvetica, sans-serif;
	color: #333333;
	padding: 4px 3px 3px 3px;
}
.arialfont {
	font: normal 1.0em Arial, Helvetica, sans-serif;
}
  </style>
 <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script> 

</head>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap="nowrap"><span class="header"> Job Materials &amp; Labor Detail</span> </td>
    <td align="right"><img src="images/clear.png" width="100" height="1" />
     <a href="select_branch_j.cfm" class="bluebutton">Choose Another Branch or Job</a></td>
  </tr>
</table>
       <cfoutput query="get_job_info">
       <div class="subheader">#locationname#</div>
         <span class="arialfont"><!--- Job ID&##8212; #ID# <br /> --->
          James River ID&##8212;#Job_ID#<br />
          Job Location&##8212;#locationname#<br />
         Address&##8212;#jobaddress1#<br />
       City&##8212;#jobcity#, #jobstate#  #jobzip#</span><br />
         </cfoutput>
   <p>
    <!-- to clear footer -->
    <span class="dailysheet_header"> 
   Job Labor</span>  <br />
  <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 order by  Service_Time_In DESC
  </cfquery>
  
 <CFSET mylist ="0">
 <cfloop query="get_job_labor">
 <cfset myList = ListAppend(mylist,ds_id)>
 </cfloop>
 <table class="sortable" width="80%" border="0" cellspacing="0" cellpadding="0"  > 
  <thead> 
 <tr>
   <th align="left">Date</th>
   <th align="left">DSID</th>
   <th align="left">Employee ID</th>
   <th align="left">Employee Name</th>
   <th align="left">Service ID</th>
   <th align="left">Time Worked<br />
     Minutes</th>
   <th align="left">CLID</th>
    <th align="left">Crew Leader Name</th>
   <th align="left">Job Clock ID</th>
  </tr>
    </thead> 
    <cfquery name="get_employee_info" datasource="jrgm"   >
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
     <tbody>  
 <cfoutput query="get_job_labor"> 
 <tr>
 <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
 <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
  <td>#Employee_ID#</td>
   <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
  <td>#get_employee_info2.report_name#</td>
    <td>#Service_ID#</td>
    <td>#Total_Time#</td>
    <td>#crew_leader# </td>
      <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
  <td>#get_employee_info3.report_name#</td>
    <td> #job_clock_id#</td>
    </tr>  
	</cfoutput>
      <cfquery name="get_job_labor_total" datasource="jrgm"  >
 SELECT SUM(Total_Time) AS totaljobtime FROM  app_job_services_actual_employee  WHERE job_id = '#url.Job_ID#'
   </cfquery>
 <tr>
   <td><strong>Totals</strong></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td><td>&nbsp;</td>
 <cfoutput>  <td><strong>#get_job_labor_total.totaljobtime#</strong></td></cfoutput>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 <thead>
 <tr>
   <th colspan="4" align="left">Daily Sheets with missing service information</th>
   <th>&nbsp;</th>
   <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
  </tr>
    </thead> 

 
  <cfquery name="get_job_labor_missing" datasource="jrgm"  >
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id = '#url.Job_ID#' AND ds_id NOT IN  (#myList#)
 order by  job_Time_In DESC
   </cfquery>
   
   <cfif  get_job_labor_missing.recordcount EQ 0>
    <tr>
   <td colspan="9" class="arialfont"> All Service Time is Accounted for</td>
 </tr>
 <cfelse>
<cfoutput query="get_job_labor_missing">
 <tr>
   <td>#DateFormat(job_Time_In, "mm/dd/yyyy")#</td>
 <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
    <td>#Job_Time_worked#</td>
      <td>#Crew_Leader_ID# </td>
      <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
  <td>#get_employee_info4.report_name#</td>
    <td> #ID#</td>
 </tr></cfoutput>
 </cfif>

    </tbody>
</table><br />
<br />
   <span class="dailysheet_header">Job Materials</span> <br />
   <br />
 <cfquery name="get_job_materials" datasource="jrgm"  >
  SELECT     TOP (2000) ID, Service_Date, Job_ID, Job_clock_ID, Item_ID, Quantity_used, Unit_used, Item_grouping, job_time_out, ds_id, crew_leader
  FROM         app_job_materials_actual WHERE job_id = '#url.Job_ID#'
  order by  Service_Date DESC
  </cfquery>
   <table class="sortable" width="80%" border="0" cellspacing="0" cellpadding="0"  >
    <thead> 
   <tr>
    <th align="left">Date</th>
    <th align="left">DSID</th>
    <th align="left">Job Clock ID</th>
    <th align="left">Item ID</th>
    <th align="left">Quantity Used</th>
    <th align="left">Unit Used</th>
    </tr>
  </thead>  <tbody>  
   <cfoutput query="get_job_materials"> 
   <tr>
     <td>#DateFormat(Service_Date, "mm/dd/yyyy")#</td>
     <td>#ds_id#</td>
    <td>#Job_clock_ID#</td>
    <td>#Item_ID#</td>
    <td>#Quantity_used#</td>
    <td>#Unit_used#</td>
    </tr>
  </cfoutput>
   </tbody>
</table><br />
<br /></div></div></div>
 </body>
</html>
