<CFSET url.branch ='Chesterfield'>
<cfif IsDefined("form.EMPLOYEEID") >
  <cfquery name="insert_app_job_services_actual_employee" datasource="jrgm">
  INSERT INTO app_job_services_actual_employee 
    (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   (#form.EMPLOYEEID#,'#form.job_ID#','0000','0','#form.dsid#','#form.CREW_LEADER#',#form.job_clock_id#) 
   </cfquery>
</cfif>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfif IsDefined("form.job_clock_id")>
  <CFSET job_clock_id= form.job_clock_id>
  <cfelseif IsDefined("url.job_clock_id")>
  <CFSET job_clock_id= url.job_clock_id>
</cfif>
<CFQUERY name="get_this_job" datasource="#request.dsn#">
SELECT * FROM app_job_clock WHERE ID = #job_clock_id#
</CFQUERY>
<cfquery name="get_DSID_info" datasource="jrgm"  >
SELECT   supervisor_id, crew_leader_id   FROM app_daily_sheets
WHERE ID =#dsid#
 </cfquery>
<cfquery name="get_branch_employees_on_DSID" datasource="jrgm"  >
SELECT   employee_id   FROM app_employee_payroll_clock
WHERE ds_id =#dsid#
 </cfquery>
<CFSET mylist ="0">
<cfloop query="get_branch_employees_on_DSID">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<cfquery name="get_branch_employees_on_DSID_on_this_job" datasource="jrgm"  >
SELECT   employee_id   FROM app_job_services_actual_employee
WHERE job_clock_id =#job_clock_id#
 </cfquery>
<CFSET mylistonjob ="0">
<cfloop query="get_branch_employees_on_DSID_on_this_job">
  <cfset mylistonjob = ListAppend(mylistonjob,Employee_ID)>
</cfloop>
<cfquery name="get_branch_employees_missing" datasource="jrgm"  >
SELECT   employee_id   FROM app_employee_payroll_clock
WHERE ds_id =#dsid# AND   employee_id  NOT IN (#mylistonjob#) 
</cfquery>

<CFSET mylistonjobmissing ="0">
<cfloop query="get_branch_employees_missing">
  <cfset mylistonjobmissing = ListAppend(mylistonjobmissing,Employee_ID)>
</cfloop>
<!--- <cfoutput>#mylistonjobmissing#</cfoutput>
 --->
<cfif get_branch_employees_missing.recordcount GT 0>
  <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#url.branch#'  AND    active_record = 1 AND  [Employee ID] IN (#mylistonjobmissing#)
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<style type="text/css">
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
</style>
<script type="text/javascript">
function closechildwindow() {
window.opener.document.location.href = 'daily_sheet_edit.cfm?dsid=<cfoutput>#dsid#&branch=#url.branch#</cfoutput>';
window.close();
}
</script>
</head>
<body onunload="closechildwindow()">
<div id="outerfull">
  <div id="centrecontent">
    <!--centre content goes here -->
    <div class="centrecontent_inner_pop">
      <div class="header">Daily Sheet Add Employee to Job</div>
      <cfif get_branch_employees_missing.recordcount EQ 0>
        <cfif IsDefined("form.EMPLOYEEID") >
          <span class="redarial">This employee has been added to this job</span><br />
        </cfif>
        <span class="arialfont">There are no other employees to add to this job. <br />
        In order to add employees to this job they must be on the Daily sheet. </span><cfoutput>
          <form>
            <button type="button" onclick="javascript:window.close()">Close</button>
          </form>
          </p>
        </cfoutput>
        <cfabort>
      </cfif>
      <form   method="post" action="daily_sheet_edit_add_employee_job.cfm?branch=#url.branch#"  >
        <table border="0" cellspacing="0" cellpadding="0" width="90%" >
          <tr>
            <td></td>
            <td><img src="images/clear.gif" width="20" height="1" /></td>
            <td valign="top"><table border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td nowrap="nowrap" class="statusTD_right"><strong>Choose employee to add:</strong></td>
                  <td class="statusTD_right"><select name="employeeID" >
              <cfoutput query="get_branch_employees">
                        <option value="#employee_id#">#fullname#</option>
                      </cfoutput>
                    </select></td>
                </tr>
              </table>
              <br />
              <div align="right"> <cfoutput>
                  <input type="hidden" name="dsid"   value="#dsid#" />
                  <input type="hidden" name="crew_leader"  value="#get_DSID_info.crew_leader_id#"  />
                  <input type="hidden" name="supervisor"   value="#get_DSID_info.supervisor_id#" />
                  <input type="hidden" name="job_clock_id"   value="#job_clock_id#" />
                  <input type="hidden" name="job_id"   value="#get_this_job.job_id#" />
                </cfoutput>
                <input type="submit" name="submit" id="submit" value="Submit" />
                <button type="button" onclick="javascript:window.close()">Close</button>
              </div>
              </p></td>
          </tr>
        </table>
      </form>
      <br />
      <cfif IsDefined("form.EMPLOYEEID")>
        <cfquery name="get_this_employee" datasource="jrgm" maxrows="1">
SELECT  [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE  [Employee ID]=  #form.EMPLOYEEID#  
</cfquery>
        <table width="90%" border="0" cellspacing="5" cellpadding="0">
          <tr class="services">
            <td colspan="2" class="alertsh" ><cfoutput>#get_this_employee.employeename#</cfoutput> has been added to this job on the daily sheet.<br />
              Please select another employee to add or close this window to go back to the daily sheet.<br />
              &nbsp; </td>
          </tr>
          <cfoutput>
            <tr>
              <td class="textbox">Please make sure to refresh the daily sheet by clicking the blue refresh icon to edit this employee.</td>
              <td></td>
            </tr>
          </cfoutput>
        </table>
      </cfif>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
