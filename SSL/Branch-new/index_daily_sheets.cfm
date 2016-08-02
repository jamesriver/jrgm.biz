<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch = '#SESSION.branch#'
 </cfquery>
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
<CFSET mylistsupers ="0">
<cfloop query="get_supers">
  <cfset mylistsupers = ListAppend(mylistsupers,Employee_ID)>
</cfloop>
<cfquery name="get_UA_daily_sheets_for_RM" datasource="jrgm"  > 
SELECT  * FROM APP_daily_sheets  WHERE ((Supervisor_ID IN (#mylistsupers#)  OR  Supervisor_ID = #SESSION.userid#)) AND ds_approved IS NULL AND ds_date > '12/31/2014' ORDER by ds_date DESC , ID DESC
  </cfquery>

            <div class="portlet-title">
              <div class="caption"><span class="badge badge-portal"><cfoutput>#get_UA_daily_sheets_for_RM.RecordCount#</cfoutput></span> Daily Sheets</div>
              <div class="tools"> <a href="javascript:;" class="collapse"> </a> </div>
            </div>
            <div class="portlet-body">
              <p class="text-danger"><strong>The following Daily Sheets have NOT been approved.</strong></p>
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th>DSID</th>
                    <th>Date</th>
                    <th>Branch</th>
                    <th>Production Manager</th>
                    <th>Supervisor/Crew Leader</th>
                  </tr>
                </thead>
                <tbody>
                  <cfoutput query="get_UA_daily_sheets_for_RM">
                    <cfquery name="get_info_S"  dbtype="query" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
						SELECT  last_name AS employee_name,branch
						FROM get_all_employee_info WHERE employee_ID =#get_UA_daily_sheets_for_RM.supervisor_id#
					</cfquery>
                    <cfquery name="get_info_CL" dbtype="query" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
						SELECT   last_name AS employee_name,branch
						FROM   get_all_employee_info WHERE employee_ID =#get_UA_daily_sheets_for_RM.Crew_Leader_ID#
					</cfquery>
                    <tr>
                      <td><a href="daily_sheet.cfm?dsid=#ID#">#ID#</a></td>
                      <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                      <td >#get_info_S.branch#</td>
                      <td>#get_info_S.employee_name#</td>
                      <td>#get_info_CL.employee_name#</td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
            </div>