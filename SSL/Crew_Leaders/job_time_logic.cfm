<cfparam name="total_time" default="0">

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

<cfif StructKeyExists(form,"JOB_IN.X")>
  <cfset todaysdate = #Now()#>
  <cfquery name="make_sure_not_already_in" datasource="jrgm">
     SELECT Job_ID FROM job_clock 
     WHERE  In_Out_Status =1 AND Crew_Leader_ID = #SESSION.userid#
       </cfquery>
  <cfif make_sure_not_already_in.recordcount EQ 0>
    ,
    <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO job_clock (Job_ID,Job_Time_In,In_Out_Status,Crew_Leader_ID,ds_id) VALUES ( '#form.job_ID#' ,CURRENT_TIMESTAMP,1,#SESSION.userid#,#SESSION.DS_ID#)
   </cfquery>
  </cfif> 
  <CFSET SESSION.JOB_ID = #form.job_ID#>
  <!---   <cfabort> --->
  <cfquery name="get_max" datasource="jrgm">
 Select ID from job_clock where id=IDENT_CURRENT('job_clock') 
 </cfquery>
  <cflocation url="job_list.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#get_max.ID#">
</cfif>
<cfif StructKeyExists(form,"JOB_OUT.X")>
  <cfset todaysdate = #Now()#>
  <cfquery name="Update_TimeIn_Row" datasource="jrgm">
     SELECT  MAX(ID) AS id_to_update FROM Job_Clock 
     WHERE  In_Out_Status =1 AND Job_time_Out is NULL AND job_ID = '#job_ID#'  AND crew_leader_id = #SESSION.userid#
       </cfquery>
  <cfif Update_TimeIn_Row.id_to_update NEQ "">
    <cfquery name="update_time" datasource="jrgm">
     UPDATE job_clock SET Job_Time_Out = CURRENT_TIMESTAMP, In_Out_Status=2 WHERE ID =#Update_TimeIn_Row.id_to_update#
       </cfquery>
    <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,job_time_in,job_time_out) AS 'Duration'  FROM  job_clock WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
    <cfquery name="update_time" datasource="jrgm">
    UPDATE job_clock SET job_time_worked = #calculate_time.Duration#  WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
  </cfif>
  <CFSET SESSION.job_services_entered = 0>
  <cflocation url="services.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#ID#&Job_Time_worked=#calculate_time.Duration#">
</cfif>
