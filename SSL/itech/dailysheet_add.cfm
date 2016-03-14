
<CFIF IsDefined("url.work_date")>
  <cfset todayDate1 = #url.work_date#>
  <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
  <cfelse>
  <cfset todayDate1 = Now()>
   <cfset todaydate =#DateFormat("#todayDate1#", "mm/dd/yyyy")#>
</CFIF>

 <cfset somedate = todayDate>
 <cfset yesterday = dateadd("d",-1,somedate)>
 <cfset tomorrow = dateadd("d",1,somedate)>
 
 
  <cfif SESSION.branch EQ 'Richmond' >
 <CFSET branchcode =10>
     <cfelseif SESSION.branch EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif SESSION.branch EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif SESSION.branch EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif SESSION.branch EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif SESSION.branch EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
   <CFSET branchcode =0>
  </cfif>
 
      
 <cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND form.ds_date LT  tomorrow AND  IsDefined("form.SUPERVISOR_ID")>
  <cfquery name="insert_ds" datasource="#request.dsn#">
 INSERT INTO  app_daily_sheets (Supervisor_ID, Crew_Leader_ID, DS_Date, record_created, entry_method,branch_code)  VALUES ( #form.Supervisor_ID#, '#form.CREW_LEADER_ID#','#form.ds_date#',CURRENT_TIMESTAMP,2,#branchcode# )
 </cfquery>
  <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM app_daily_sheets  
 </cfquery>
 <!--- <CFIF REMOTE_HOST NEQ '127.0.0.1'>
  <cfmail to="pat@1design.com" from="pat@429designs.com"  subject="JRGM Edit Supervisor DS-(#SESSION.BRANCH#)-#getmaxid.newid#"  type="html">
   Daily Sheet: #getmaxid.newid# was added (#SESSION.BRANCH#).
  </cfmail>
</CFIF> --->
 </cfif> 

<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1  
 ORDER by  Last_name ASC,first_name ASC
</cfquery>

<cfquery name="get_branch_supervisors" datasource="jrgm"  >
SELECT DISTINCT firstname,lastname,employee_branch,employee_id,employee_name  FROM  app_employee_passwords
 WHERE employee_branch = '#SESSION.branch#'  AND      employee_active  = 1   AND  access_role IN (1,2,9)
 ORDER by  Lastname ASC,firstname ASC
</cfquery>
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
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
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

.redarialbig {
	padding-top: 24px;
	font: bold 1.2em Arial, Helvetica, sans-serif;
	color: red;
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
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Create a Daily Sheet</td>
        </tr>
      </table>
      
  <cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND form.ds_date GT  somedate AND  IsDefined("form.SUPERVISOR_ID")>
 <br />
 <span class="arialfont"><strong>The Daily Sheet date must be before today. <br />
 Please <a href = "javascript:history.back()">go back</a> and select a date before today</strong></span>
 <cfabort>
 <br />
 </cfif>
      
      
    <cfif IsDefined("form.CREW_LEADER_ID") AND  IsDefined("form.submit") AND  IsDefined("form.ds_date") AND  form.ds_date NEQ "" AND  IsDefined("form.SUPERVISOR_ID")>
       <br />
 <p><span class="dailysheet_header">Daily Sheet ID : <cfoutput>#getmaxid.newid# has been created.</cfoutput></span><cfoutput><br /><br />
 
<a href="daily_sheet_edit.cfm?dsid=#getmaxid.newid#&message=yes" class="bluebutton" >Edit Daily Sheet</a> </cfoutput></strong></span><br />
        <br />
        <span class="redarialbig">Remember to add Employees to the new daily sheet before adding Jobs.<br />
        </span><br />
        <span class="arialfont">If this daily sheet was created in error please contact administrator to remove</span>.
<cfelse>
        <form class="css_form" action="dailysheet_add.cfm" method="post">
          <table border="0" cellpadding="0" cellspacing="0">
             <tr>
              <td align="right"  class="statusTD_right">Enter Daily Sheet Date</span></td>
              <td class="statusTD_right"><input type="text" id="datepicker" name="ds_date" />
              </td>
            </tr>
            <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right">Choose Supervisor&nbsp;</td>
              <td class="statusTD_right"><select name="Supervisor_ID" >
                  <cfoutput query="get_branch_supervisors">
                    <option value="#employee_id#">#employee_name#</option>
                  </cfoutput>
                </select></td>
            </tr>
            <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right">Choose Crew Leader</td>
              <td class="statusTD_right"><select name="Crew_Leader_ID" >
                  <cfoutput query="get_branch_employees">
                    <option value="#employee_id#">#fullname#</option>
                  </cfoutput>
                </select></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="right"><br />
<input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
            </tr>
            <tr>
              <td colspan="2" class="redarial">All 3 fields are required</td>
            </tr>
          </table>
        </form>
      </cfif>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
 <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
