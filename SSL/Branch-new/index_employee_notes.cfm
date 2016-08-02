<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>

<cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE branch = '#SESSION.branch#'
 </cfquery>

        <cfquery name="get_employees_notes" datasource="jrgm">
SELECT  ID,note_content,employee_id,Note_Author_ID, Note_Date FROM app_notes WHERE Employee_ID  
 IN (SELECT Employee_ID FROM app_crews WHERE  Employee_branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
            </cfquery>
          <cfif get_employees_notes.recordcount EQ 0>
            <div class="scroller" style="height:300px"> No employee notes. </div>
            <cfelse>
            <div class="table-scrollable table-scrollable-borderless">
            <table class="table table-hover table-light">
              <tbody>
                <cfoutput query="get_employees_notes">
                  <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_notes.employee_ID#
        </cfquery>
                  <tr>
                    <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
                    <td><a href="employee_details.cfm?employee_id=#employee_id#&amp;work_date=#todayDate#">#get_employees_name.employee_name#</a> : #note_content#</td>
                    <td><a href=""><i class="fa fa-times-circle font-red"></i></a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
          </cfif>
        </div>