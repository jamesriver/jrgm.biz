

<cfif IsDefined("form.EMPLOYEEID") >
 <cfquery name="insert_time" datasource="jrgm">
 INSERT INTO app_employee_payroll_clock (Employee_ID,crew_leader,supervisor,ds_id, In_Out_Status, time_worked,ds_date,entry_method) 
 VALUES (#form.EMPLOYEEID#,#form.crew_leader#,#form.supervisor#,#dsid#,2,0,'#form.ds_date#',2)
 </cfquery>
 <cfquery name="get_this_employee" datasource="jrgm">
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1 AND  [Employee ID] =#form.EMPLOYEEID#
</cfquery>
<!--- Get all Job_clock_ids for this DS --->
 <cfquery name="get_job_clock_ids" datasource="jrgm"  >
SELECT   *  FROM app_job_clock WHERE ds_id =#dsid#
 </cfquery>

 <cfloop   query="get_job_clock_ids">
<cfquery name="insert_app_job_services_actual_employee" datasource="jrgm">
  INSERT INTO app_job_services_actual_employee 
    (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id) 
   VALUES 
   (#form.EMPLOYEEID#,'#get_job_clock_ids.job_ID#','0000','0','#form.dsid#','#form.CREW_LEADER#',#get_job_clock_ids.ID#) 
   </cfquery> 
</cfloop>
<!--- Get all Job_clock_ids for this DS --->
<!--- <cfabort> --->

</cfif>




<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>


<cfquery name="get_DSID_info" datasource="jrgm"  >
SELECT   ds_date,supervisor_id, crew_leader_id   FROM app_daily_sheets
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

<!--- Get Employee List --->
<cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1 AND  [Employee ID] NOT IN (#mylist#)
 ORDER by  Last_name ASC,first_name ASC
</cfquery>

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

<script type="text/javascript">
function closechildwindow() {
window.opener.document.location.href = 'daily_sheet_edit.cfm?dsid=<cfoutput>#dsid#</cfoutput>';
window.close();
}
</script>
</head>
<body onunload="closechildwindow()" >
<div id="outerfull">
<div id="centrecontent"><!--centre content goes here -->
  <div class="centrecontent_inner_pop">  
     <div class="header">Daily Sheet Add Employee</div>
     
     <form   method="post" action="daily_sheet_edit_add_employee.cfm"   onsubmit="setTimeout('window.close()',1000)">
    <table border="0" cellspacing="0" cellpadding="0" width="90%" ><tr>
      <td>
      </td>
       <td><img src="images/clear.gif" width="20" height="1" /></td>
       <td valign="top">
       <table border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td nowrap="nowrap" class="statusTD_right"><strong>Choose employee to add:</strong></td>
                  <td class="statusTD_right"><select name="employeeID" >
             <cfoutput query="get_branch_employees">
                        <option value="#employee_id#">#fullname#</option>
                      </cfoutput>
                  </select></td>
                </tr>
              </table><br />

          <div align="right"> 
	            <cfoutput>
                  <input type="hidden" name="ds_date"   value="#DateFormat(get_DSID_info.ds_date, "yyyy-mm-dd")#" />
                  <input type="hidden" name="dsid"   value="#dsid#" />
                  <input type="hidden" name="crew_leader"  value="#get_DSID_info.crew_leader_id#"  />
                  <input type="hidden" name="supervisor"   value="#get_DSID_info.supervisor_id#" />
                </cfoutput>
                <input type="submit" name="submit" id="submit" value="Submit" />
        <button type="button" onclick="javascript:window.close()">Close</button>   
   
              </div>
        </p></td></tr></table>
        </form>
       
      <br />
      <cfif IsDefined("form.EMPLOYEEID")> 

    <table width="90%" border="0" cellspacing="5" cellpadding="0">
  <tr class="services">
    <td colspan="2" class="alertsh" ><cfoutput>#get_this_employee.fullname#</cfoutput> has been added to the daily sheet.<br />
      Please select another employee to add or close this window to go back to the daily sheet.<br />      &nbsp;  </td>
  </tr>
<cfoutput>  <tr>
    <td class="textbox">Please make sure to refresh the daily sheet by clicking the blue refresh icon to edit this employee.</td>
    <td><!--- <img src="images/refresh.gif" alt="Refresh Page" width="60" height="42" /> ---></td>
  </tr>  
  </cfoutput>
       </table> 
</cfif>
 </div>  </div>
  <!-- to clear footer -->
</div>

 <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
