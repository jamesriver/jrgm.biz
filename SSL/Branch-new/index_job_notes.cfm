<cfquery name="get_all_jobs_info" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid FROM app_jobs  
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>

      <cfquery name="get_job_notes" datasource="jrgm" maxrows="7">
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID]  FROM app_jobs WHERE  branch = '#SESSION.branch#')
 ORDER by  Note_Date DESC
</cfquery>
        <cfif get_job_notes.recordcount EQ 0>
          <div class="scroller" style="height:300px">No Job Notes for today</div>
          <cfelse>
          <div class="table-scrollable table-scrollable-borderless">
          <table class="table table-hover table-light">
            <tbody>
              <cfoutput query="get_job_notes">
                <cfquery name="get_jobs_name" dbtype="query">
SELECT   jobname FROM get_all_jobs_info WHERE  jobid  = '#get_job_notes.job_id#'
</cfquery>
                <tr>
                  <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
                  <td><a href="job_details.cfm?job_id=#job_id#&amp;work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                  <td><a href=""><i class="fa fa-times-circle font-red"></i></a></td>
                </tr>
              </cfoutput>
            </tbody>
          </table>
        </cfif>