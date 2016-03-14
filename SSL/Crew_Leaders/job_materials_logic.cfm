<cfif MATERIALS_QUANTITY_USED EQ "">
  <CFSET MATERIALS_QUANTITY_USED = 0>
</cfif>
<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<cfif NOT IsDefined("form.Job_ID")>
  <cflocation url="default.cfm">
</cfif>
<cfif StructKeyExists(form,"materials_used")>
  <cfquery name="This_Job" datasource="jrgm">
     SELECT * FROM Job_Clock 
     WHERE  ID= #form.ID#
       </cfquery>
  <cfset todaysdate = #Now()#>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO job_materials_actual 
   (Job_ID,Job_clock_ID, Item_ID,Quantity_used,Unit_used,job_time_out,crew_leader,ds_id) 
   VALUES 
   ('#form.job_ID#',#form.ID#,'#MATERIALS_NAME_USED#',#MATERIALS_QUANTITY_USED#,'#materials_unit#',#CreateODBCDateTime(This_Job.Job_Time_Out)#,#Session.userid#,#SESSION.DS_ID#)
   </cfquery>
  <!---    <cfabort> --->
  <cflocation url="materials.cfm?work_date=#work_date#&job_id=#job_ID#&ID=#ID#">
</cfif>
