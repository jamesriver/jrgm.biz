<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>

<cfquery name="get_all_jobs_info" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid,branch FROM app_jobs  
</cfquery>

<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, [Name FirstLast] AS  [employee_name], first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<cfquery name="get_job_notes" datasource="jrgm" maxrows="10">
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID] FROM app_jobs WHERE  branch  IN   (#PreserveSingleQuotes(branchlist)#))
 ORDER by  Note_Date DESC
</cfquery>
        
<cfif get_job_notes.recordcount EQ 0>
          <div class="scroller" style="height:300px">No Job Notes for today</div>
          <cfelse>

        <cfquery name="get_employees_notes" datasource="jrgm"  maxrows="10">
	SELECT  ID,note_content,employee_id,Note_Author_ID, Note_Date FROM app_notes WHERE Employee_ID  
	 IN (SELECT  [Employee ID] FROM app_employees WHERE  branch IN   (#PreserveSingleQuotes(branchlist)#))
	 ORDER by  Note_Date DESC
            </cfquery>

             
                  <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  employee_name   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_notes.employee_ID#
        </cfquery>

          <div class="table-scrollable table-scrollable-borderless">
          <table class="table table-hover table-light">
            <tbody>
              <cfoutput query="get_job_notes">
                <cfquery name="get_jobs_name" dbtype="query">
		SELECT   jobname,branch FROM get_all_jobs_info WHERE  jobid  = '#get_job_notes.job_id#'
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
                  <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
                  <td><a href="job_details.cfm?job_id=#job_id#&work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                  <td><a href=""><i class="fa fa-times-circle font-red"></i></a></td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
        </cfif>