 
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<CFSET begindate_DS =  '01/01/2014'>

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM app_jobs_all  WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
<!--- <cfdump var="#get_job_info#"> --->



<cfif IsDefined("form.DS_DATE_START") AND form.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= form.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelseif IsDefined("url.DS_DATE_START") AND url.DS_DATE_START NEQ "">
<CFSET DS_DATE_START= url.DS_DATE_START>
<CFSET DS_DATE_START =  dateadd("d",0,DS_DATE_START)>
<cfelse>
<CFSET DS_DATE_START= begindate_DS>
<!---<CFSET DS_DATE_START =  dateadd("d",365,DS_DATE_START)>--->
 </cfif>

<cfif IsDefined("form.DS_DATE_END")  AND form.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= form.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
<cfelseif IsDefined("url.DS_DATE_END") AND url.DS_DATE_END NEQ "">
<CFSET DS_DATE_END= url.DS_DATE_END>
<CFSET DS_DATE_END =  dateadd("d",0,DS_DATE_END)>
<cfelse>
<CFSET DS_DATE_END = todaydate_DS>
<CFSET DS_DATE_END =  dateadd("d",1,DS_DATE_END)>
 </cfif>

 
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
    
    <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
  
  <script>
  $(function() {
    $( "#datepicker2" ).datepicker();
  });
  </script>
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
	font: normal 1.2em Arial, Helvetica, sans-serif;
}

.bluebutton {
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
	margin-right: 40px;
	margin-bottom: 10px;
}
.bluebutton a {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #496a99), color-stop(1, #8299bb) );
	background:-moz-linear-gradient( center top, #496a99 5%, #8299bb 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#496a99', endColorstr='#8299bb');
	background-color:#496a99;
	text-decoration: none;
}
.bluebutton a:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #496a99), color-stop(1, #8299bb) );
	background:-moz-linear-gradient( center top, #496a99 5%, #8299bb 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#496a99', endColorstr='#8299bb');
	background-color:#496a99;
	text-decoration: none;
}.bluebutton:active {
	position:relative;
	top:1px;
}
  </style>
 <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script> 
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap="nowrap"><span class="header"> Job Materials &amp; Labor Detail</span> </td>
    <td align="right"  width="200">&nbsp;</td>
    <td align="right"><img src="images/clear.png" width="300" height="1" />
     <a href="select_branch_j.cfm" class="bluebutton">Choose Another Branch or Job</a></td>
  </tr>
</table>

 <form class="css_form" action="job_labor_materials.cfm?Job_id=<cfoutput>#url.job_id#</cfoutput>" method="post">
   <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> Start Date</strong></td>
         <td class="statusTD_right">
         <input type="text" id="datepicker" name="ds_date_start"  
		 <cfif IsDefined("form.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>"<cfelseif IsDefined("url.DS_DATE_START") >value="<cfoutput>#DateFormat(DS_DATE_START, "mm/dd/yyyy")#</cfoutput>">
         <cfelse>value="01/01/2014"</cfif>/> 
            </td> 
              <td nowrap="nowrap" class="statusTD_right"><strong class="lgaddress"> End Date</strong></td>
          <td class="statusTD_right"><input type="text" id="datepicker2" name="ds_date_end" 
		  <cfif IsDefined("form.ds_date_end") >value="<cfoutput>#DateFormat(form.ds_date_end, "mm/dd/yyyy")#</cfoutput>"
		  <cfelseif IsDefined("url.ds_date_end") >value="<cfoutput>#DateFormat(url.ds_date_end, "mm/dd/yyyy")#</cfoutput>">
          
              <cfelse>value="<cfoutput>#DateFormat(todaydate_DS, "mm/dd/yyyy")#</cfoutput>"</cfif>/> 
              </td>   
          <td class="statusTD_right"> </td>
              <td class="statusTD_right">
 <input type="hidden" name="Job_ID"  <cfoutput> value="#Job_ID#"</cfoutput> /> 
<!---  <input type="hidden" name="branch"  <cfoutput> value="#branch#"</cfoutput> /> --->
<input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
            </tr>
        </table> 
       </form> 
       <cfoutput query="get_job_info">
       <div class="subheader">#locationname#</div>
         <span class="arialfont"><!--- Job ID&##8212; #ID# <br /> --->
          <strong>James River ID&##8212;#Job_ID#<br />
          Job Location&##8212;#locationname#<br />
         Address&##8212;#jobaddress1#<br />
       City&##8212;#jobcity#, #jobstate#  #jobzip#</strong></span><br />
         </cfoutput>
   <p>
    <!-- to clear footer -->
    <span class="dailysheet_header"> 
   <br />
   Job Labor</span>  <br />
  <cfquery name="get_job_labor" datasource="jrgm"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee WHERE job_id = '#url.Job_ID#'
 
  <cfif IsDefined("DS_DATE_START")>AND Service_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Time_In< #DS_DATE_END#</cfif>
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
   <cfif IsDefined("DS_DATE_START")>AND Service_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Time_In < #DS_DATE_END#</cfif>
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
   <cfif IsDefined("DS_DATE_START")>AND job_Time_In > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND job_Time_Out < #DS_DATE_END#</cfif>
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
    <cfif IsDefined("DS_DATE_START")>AND Service_Date > #DS_DATE_START#</cfif>
  <cfif IsDefined("DS_DATE_END")>AND Service_Date < #DS_DATE_END#</cfif>
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
