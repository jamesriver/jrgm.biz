<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, [Name FirstLast] AS  [employee_name], first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>


            <h4>Hours </h4>
            Employees that answered "I do not agree" to hours signout question <span class="message">Showing last 10 </span>
            <div class="table-scrollable table-scrollable-borderless">
              <table class="table table-hover table-light">
                <thead>
                  <tr class="uppercase">
                    <th>Branch</th>
                    <th> DSID </th>
                    <th> Date </th>
                    <th> employee name</th>
                    <th> supervisor </th>
                    <th>crew leader</th>
                  </tr>
                </thead>
                <cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT  DISTINCT ID,ds_date FROM APP_daily_sheets  WHERE  branch_code IN (#branchcodelist#)  AND ds_date > '2015-09-30' ORDER by ds_date DESC
    </cfquery>
                <CFSET mylistds ="0">
                <cfloop query="get_daily_sheets">
                  <cfset mylistds = ListAppend(mylistds,ID)>
                </cfloop>
                <cfquery name="get_employees_CompleteHours" datasource="jrgm" maxrows="10">
        SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0 AND ds_id In (#mylistds#)  
       ORDER by ds_date desc
          </cfquery>
                <cfoutput query="get_employees_CompleteHours">
                  <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_CompleteHours.employee_ID#
        </cfquery>
                  <cfquery name="get_info_CL"  dbtype="query">
SELECT employee_name,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.crew_leader#
        </cfquery>
                  <cfquery name="get_info_S"  dbtype="query">
SELECT employee_name,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.supervisor#
        </cfquery>
                  <tr>
                    <cfif get_employees_name.branch EQ 'Newport News'>
                      <CFSET branchnew = "NEW" >
                      <cfelseif get_employees_name.branch EQ 'Charlottesville'>
                      <CFSET branchnew = "CVL" >
                      <cfelseif get_employees_name.branch EQ 'Williamsburg'>
                      <CFSET branchnew = "WMB" >
                      <cfelseif get_employees_name.branch EQ 'Richmond'>
                      <CFSET branchnew = "RIC" >
                      <cfelseif get_employees_name.branch EQ 'Portsmouth'>
                      <CFSET branchnew = "POR" >
                      <cfelseif get_employees_name.branch EQ 'Chesterfield'>
                      <CFSET branchnew = "CHE" >
                      <cfelseif get_employees_name.branch EQ 'Corporate'>
                      <CFSET branchnew = "CORP" >
                      <cfelse>
                      <CFSET branchnew = #Left(get_employees_name.branch,4)# >
                    </cfif>
                    <td nowrap="nowrap">#branchnew#</td>
                    <td><a href="daily_sheet.cfm?dsid=#get_employees_CompleteHours.ds_id#" target="_blank">#ds_id#</a></td>
                    <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                    <td>#get_employees_name.employee_name#</td>
                    <td>#get_info_S.last_name#</td>
                    <td>#get_info_CL.last_name#</td>
                  </tr>
                </cfoutput>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><a href="report_signout_questions_hours.cfm" class="btn btn-circle btn-sm blue-madison"> View All </a></td>
                </tr>
              </table>
              <div class="spacer20"></div>
              <h4>Injury </h4>
              Employees that answered "I do not agree" to injury signout question <span class="message">Showing last 10 </span>
              <div class="table-scrollable table-scrollable-borderless">
                <table class="table table-hover table-light">
                  <thead>
                    <tr class="uppercase">
                      <th>Branch</th>
                      <th> DSID </th>
                      <th> Date </th>
                      <th> employee name</th>
                      <th> supervisor </th>
                      <th>crew leader</th>
                    </tr>
                  </thead>
                  <cfquery name="get_employees_injury" datasource="jrgm" maxrows="10">
        SELECT ds_id,IsEmpInjury,employee_ID,CREW_LEADER,supervisor ,DS_DATE FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND ds_id In (#mylistds#)
       ORDER by ds_date desc
          </cfquery>
                  <cfoutput query="get_employees_injury">
                    <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_injury.employee_ID#
        </cfquery>
                    <cfquery name="get_info_CL"  dbtype="query">
SELECT employee_name,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.crew_leader#
        </cfquery>
                    <cfquery name="get_info_S"  dbtype="query">
SELECT employee_name,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.supervisor#
        </cfquery>
                    <tr>
                      <cfif get_employees_name.branch EQ 'Newport News'>
                        <CFSET branchnew = "NEW" >
                        <cfelseif get_employees_name.branch EQ 'Charlottesville'>
                        <CFSET branchnew = "CVL" >
                        <cfelseif get_employees_name.branch EQ 'Williamsburg'>
                        <CFSET branchnew = "WMB" >
                        <cfelseif get_employees_name.branch EQ 'Richmond'>
                        <CFSET branchnew = "RIC" >
                        <cfelseif get_employees_name.branch EQ 'Portsmouth'>
                        <CFSET branchnew = "POR" >
                        <cfelseif get_employees_name.branch EQ 'Chesterfield'>
                        <CFSET branchnew = "CHE" >
                        <cfelseif get_employees_name.branch EQ 'Corporate'>
                        <CFSET branchnew = "CORP" >
                        <cfelse>
                        <CFSET branchnew = #Left(get_employees_name.branch,4)# >
                      </cfif>
                      <td nowrap="nowrap">#branchnew#</td>
                      <td><a href="daily_sheet.cfm?dsid=#get_employees_injury.ds_id#" target="_blank">#ds_id#</a></td>
                      <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                      <td>#get_employees_name.employee_name#</td>
                      <td>#get_info_S.last_name#</td>
                      <td>#get_info_CL.last_name#</td>
                    </tr>
                  </cfoutput>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a href="report_signout_questions_injury.cfm" class="btn btn-circle btn-sm blue-madison"> Show All </a></td>
                  </tr>
                </table>
              </div>

        