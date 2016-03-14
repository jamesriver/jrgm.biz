<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<!--- <cfabort> --->
<cfif NOT IsDefined("form.Job_ID")>
  <cflocation url="default.cfm">
</cfif>
<cfif StructKeyExists(form,"job_in")>
  <cfset todaysdate = #Now()#>
  <cfquery name="make_sure_not_already_in" datasource="jrgm">
     SELECT Job_ID FROM APP_job_clock 
     WHERE  In_Out_Status =1
       </cfquery>
  <cfif make_sure_not_already_in.recordcount EQ 0>
    <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO APP_job_clock (Job_ID,Job_Time_In,In_Out_Status) VALUES ( '#form.job_ID#' ,CURRENT_TIMESTAMP,1)
   </cfquery>
  </cfif>
  <cflocation url="job_list.cfm?work_date=#work_date#&amp;job_id=#job_ID#">
</cfif>
<cfif StructKeyExists(form,"job_out")>
  <cfset todaysdate = #Now()#>
  <cfquery name="Update_TimeIn_Row" datasource="jrgm">
     SELECT  MAX(ID) AS id_to_update FROM APP_job_clock 
     WHERE  In_Out_Status =1 AND Job_time_Out is NULL AND job_ID = #job_ID#
       </cfquery>
  <cfif Update_TimeIn_Row.id_to_update NEQ "">
    <cfquery name="update_time" datasource="jrgm">
     UPDATE APP_Job_Clock SET Job_Time_Out = CURRENT_TIMESTAMP, In_Out_Status=2 WHERE ID =#Update_TimeIn_Row.id_to_update#
       </cfquery>
    <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,job_time_in,job_time_out) AS 'Duration'  FROM APP_job_clock WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
    <cfquery name="update_time" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = #calculate_time.Duration#  WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
  </cfif>
  <cflocation url="job_list.cfm?work_date=#work_date#&amp;job_id=#job_ID#">
</cfif>
