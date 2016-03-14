<!---   <cfabort>   --->
<cfloop index="i" list="#form.fieldnames#">
  <cfset DB_field = listfirst("#i#", "_")>
  <cfset employee_id = ListLast("#i#","_") />
  <cfif Left(DB_field,4) is "TIME">
    <CFSET dte = DS_DATE>
    <CFSET tim = #evaluate(i)#>
    <CFSET newtime = #parsedatetime(dte&tim)#>
    <!------------------------------------------------------------------>
    <cfif Left(DB_field,7) is "TIMEINA">
      <cfquery name="jrgm_time" datasource="jrgm">
    INSERT INTO APP_Employee_Payroll_Clock (employee_id,time_in,
  ds_id,CREW_LEADER,record_created,entry_method,ds_date) VALUES (#employee_id#,#newtime#,#ds_id#,#CREW_LEADER_ID#,CURRENT_TIMESTAMP,1,'#DS_DATE#')
    </cfquery>
    </cfif>
    <!------------------------------------------------------------------>
    <cfquery name="get_max" datasource="jrgm">
 Select ID from APP_Employee_Payroll_Clock where id=IDENT_CURRENT('Employee_Payroll_Clock') 
 </cfquery>
    <cfif Left(DB_field,8) is "TIMEOUTA">
      <CFSET dte = DS_DATE>
      <CFSET tim = #evaluate(i)#>
      <CFSET newtime = #parsedatetime(dte&tim)#>
      <cfquery name="jrgm_time" datasource="jrgm">  
    UPDATE APP_Employee_Payroll_Clock 
    SET employee_id = #employee_id#,time_out =#newtime#,In_Out_Status=2,CREW_LEADER=#CREW_LEADER_ID#
   WHERE ID = #get_max.ID#
    </cfquery>
      <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,time_in,time_out) AS 'Duration'  from APP_Employee_Payroll_Clock WHERE ID =#get_max.ID#
    </cfquery>
      <cfquery name="update_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = #calculate_time.Duration#  WHERE ID =#get_max.ID#
    </cfquery>
    </cfif>
    <!------------------------------------------------------------------>
    <cfif Left(DB_field,7) is "TIMEINB">
      <CFSET dte = DS_DATE>
      <CFSET tim = #evaluate(i)#>
      <CFSET newtime = #parsedatetime(dte&tim)#>
      <cfquery name="jrgm_time" datasource="jrgm">
    INSERT INTO APP_Employee_Payroll_Clock (employee_id,time_in,ds_id,CREW_LEADER,record_created,entry_method,ds_date) VALUES (#employee_id#,#newtime#,#ds_id#,#CREW_LEADER_ID#,CURRENT_TIMESTAMP,1,'#DS_DATE#') 
    </cfquery>
    </cfif>
    <!------------------------------------------------------------------>
    <cfquery name="get_max_B" datasource="jrgm">
 Select ID from APP_Employee_Payroll_Clock where id=IDENT_CURRENT('Employee_Payroll_Clock') 
 </cfquery>
    <cfif Left(DB_field,8) is "TIMEOUTB">
      <CFSET dte = DS_DATE>
      <CFSET tim = #evaluate(i)#>
      <CFSET newtime = #parsedatetime(dte&tim)#>
      <cfquery name="jrgm_time" datasource="jrgm">   
    UPDATE APP_Employee_Payroll_Clock 
    SET employee_id = #employee_id#,time_out =#newtime#, In_Out_Status=2,CREW_LEADER=#CREW_LEADER_ID#
   WHERE ID = #get_max_B.ID#
    </cfquery>
      <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,time_in,time_out) AS 'Duration'  from APP_Employee_Payroll_Clock WHERE ID =#get_max.ID#
    </cfquery>
      <cfquery name="update_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = #calculate_time.Duration#  WHERE ID =#get_max.ID#
    </cfquery>
    </cfif>
    <!------------------------------------------------------------------>
  </cfif>
</cfloop>
<cflocation url="services.cfm?ds_date=#ds_date#&amp;ds_id=#ds_id#&amp;crew_leader_id=#CREW_LEADER_ID#">
<cfabort>
<cfabort>
