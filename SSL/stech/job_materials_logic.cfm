<cfif StructKeyExists(form,"add_another_job")>
  <cflocation url="services.cfm?ds_date=#ds_date#&ds_id=#ds_id#&CREW_LEADER_ID=#CREW_LEADER_ID#&materialq=yes">
</cfif>
<!--- <cfabort> --->
<cfif MATERIALS_QUANTITY_USED EQ "">
  <CFSET MATERIALS_QUANTITY_USED = 0>
</cfif>
<cfif IsDefined("url.ds_date")>
  <CFSET work_date=url.ds_date>
</cfif>
<cfif IsDefined("form.ds_date")>
  <CFSET work_date=form.ds_date>
</cfif>
 
<cfif StructKeyExists(form,"materials_used")>
  
  <cfset todaysdate = #Now()#>
  <cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_job_materials_actual 
   (Job_ID,ds_id, Item_ID,Quantity_used,Unit_used,crew_leader) 
   VALUES 
   ('#form.job_ID#',#form.ds_id#,'#MATERIALS_NAME_USED#',#MATERIALS_QUANTITY_USED#,'#materials_unit#',#CREW_LEADER_ID#)
   </cfquery>
  <cflocation url="materials.cfm?ds_date=#ds_date#&job_id=#job_ID#&ds_id=#ds_id#&CREW_LEADER_ID=#CREW_LEADER_ID#&materialq=yes">
</cfif>
