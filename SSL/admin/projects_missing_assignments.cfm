<cfquery name="get_all_jobs" datasource="jrgm"  >
SELECT [Job ID] AS job_id, [Wk Loc ID] as insightly_id, [Wk Location Name] AS job_name, responsible_user_Employee_ID, sales_contact_Employee_ID, branch
FROM app_jobs
WHERE 0=0 <!---branch =  '#url.BRANCH_NAME#'   --->
AND Status = 'IN PROGRESS'
 ORDER by branch, job_name ASC
</cfquery>

<cfoutput  query="get_all_jobs">
  <cfif get_all_jobs.responsible_user_Employee_ID GT 0>
  <cfelse>
    [#get_all_jobs.branch#] #get_all_jobs.job_name#<br />
  </cfif>
</cfoutput>