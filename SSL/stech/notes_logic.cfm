<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<cfif IsDefined("form.Employee_ID")  AND   IsDefined("form.job_id")>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_notes (Employee_ID,job_ID, Note_Date,Note_Author_ID,Note_Content) VALUES (#Employee_ID#,'#job_ID#',CURRENT_TIMESTAMP,#SESSION.userid#,'#note_content#')
  </cfquery>
</cfif>
<cfif IsDefined("form.Employee_ID")  AND NOT IsDefined("form.job_id")>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_notes (Employee_ID,Note_Date,Note_Author_ID,Note_Content) VALUES (#Employee_ID#,CURRENT_TIMESTAMP,#SESSION.userid#,'#note_content#')
  </cfquery>
</cfif>
<cfif IsDefined("form.job_id")  AND NOT IsDefined("form.employee_ID")>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_notes (job_ID,Note_Date,Note_Author_ID,Note_Content) VALUES ('#job_ID#',CURRENT_TIMESTAMP,#SESSION.userid#,'#note_content#')
  </cfquery>
</cfif>
<cfif IsDefined("form.job_id")>
  <cfoutput>
    <cflocation url="job_details.cfm?work_date=#work_date#&job_id=#form.job_ID#&note_submit=yes">
  </cfoutput>
  <cfelseif IsDefined("form.employee_id")>
  <cfoutput>
    <cflocation url="employee_details.cfm?work_date=#work_date#&note_submit=yes&employee_id=#form.employee_id#">
  </cfoutput>
  <cfelse>
  <cfoutput>
    <cflocation url="notes.cfm?work_date=#work_date#&note_submit=yes">
  </cfoutput>
</cfif>
