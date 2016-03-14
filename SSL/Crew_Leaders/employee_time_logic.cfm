<!--- <cfoutput>#SESSION.DS_ID#</cfoutput><cfabort> --->
<!---   <cfdump var='#cgi#'>
<cfdump var="#session#" />   --->
<cfscript>
/**
 * Delete items from a list.
 * 
 * @param variable      An item, or a list of items, to remove from the list. (Required)
 * @param qs      The actual list to parse. Can be blank. (Optional)
 * @return Returns a string. 
 * @author Alessandro Chisari (ruchizzy@hotmail.com) 
 * @version 1, May 17, 2006 
 */
function listdelete(variable){
        //var to hold the final string
        var string = "";
        //vars for use in the loop, so we don't have to evaluate lists and arrays more than once
        var ii = 1;
        var thisVar = "";
        var thisIndex = "";
        var array = "";
        var qs = "";
        if(arrayLen(arguments) GT 1)
                qs = arguments[2];
        //put the query string into an array for easier looping
        array = listToArray(qs,",");            
        //now, loop over the array and rebuild the string
        for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
                thisIndex = array[ii];
                thisVar = thisIndex;
                //if this is the var, edit it to the value, otherwise, just append
                if(not listFindnocase(variable,thisVar))
                        string = listAppend(string,thisIndex,",");
        }
        //return the string
        return string;
}
</cfscript>


<!--- <cfoutput> #Session.userid#</cfoutput><cfabort> --->

<cfif NOT IsDefined("SESSION.DS_ID") OR   SESSION.DS_ID IS ""  >

<cfif Session.supervisor_id IS ""><CFSET Session.supervisor_id = 9999></cfif>

  <cfquery name="insert_DS" datasource="jrgm">
  INSERT INTO DAILY_SHEETS 
  (supervisor_id,crew_leader_id,record_created,ds_date) VALUES (#SESSION.supervisor_id#, #Session.userid#,CURRENT_TIMESTAMP,'#DateFormat(now(),"mm/dd/yyyy")#')
   </cfquery>
  <cfquery name="get_max_ds" datasource="jrgm">
     SELECT MAX(ID) AS ds_id FROM DAILY_SHEETS 
     WHERE crew_leader_id =#Session.userid#   
       </cfquery>
  <CFSET SESSION.DS_ID=get_max_ds.ds_id>
</cfif>
<cfif IsDefined("url.work_date")>
  <CFSET work_date=url.work_date>
</cfif>
<cfif IsDefined("form.work_date")>
  <CFSET work_date=form.work_date>
</cfif>
<cfif NOT IsDefined("form.Employee_ID")>
  <cflocation url="default.cfm">
</cfif>
<cfif StructKeyExists(form,"TIME_IN.X")>
  <cfset todaysdate = #Now()#>
  <CFSET employee_ID_list  ="#form.Employee_ID#">
  <cfloop  list = "#employee_ID_list#"   index = "i" >
    <!--- Make sure employees are not already logged in --->
    <cfquery name="make_sure_not_already_in" datasource="jrgm">
     SELECT Employee_ID FROM Employee_Payroll_Clock 
     WHERE Employee_ID =#i#  AND In_Out_Status =1
       </cfquery>
    <cfif make_sure_not_already_in.recordcount EQ 0>
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO Employee_Payroll_Clock (Employee_ID,Time_In,In_Out_Status,crew_leader,supervisor,ds_id) 
   VALUES ('#i#',CURRENT_TIMESTAMP,1,#Session.userid#,#SESSION.supervisor_id#,#SESSION.DS_ID#)
   </cfquery>
    </cfif>
  </cfloop>
  <!--- <cfabort> --->
  <cflocation url="default.cfm?work_date=#work_date#">
</cfif>
<cfif StructKeyExists(form,"TIME_OUT.X")>
  <cfset todaysdate = #Now()#>
  <CFSET employee_ID_list  ="#form.Employee_ID#">
  <cfif get_active_jobs.recordcount GT 0>
    <CFSET employee_ID_list  = #listdelete("#Session.userid#","#employee_ID_list#")#>
     <CFSET cl_warn  = "The Crew Leader may not time out until all jobs are clocked out.">
  </cfif>
  <!---<cfoutput>#employee_ID_list#</cfoutput>
    <cfabort>--->
  <cfloop  list = "#employee_ID_list#"   index = "i" >
    <cfquery name="Update_TimeIn_Row" datasource="jrgm">
     SELECT MAX(ID) AS id_to_update FROM Employee_Payroll_Clock 
     WHERE Employee_ID =#i#  AND In_Out_Status =1 AND time_Out is NULL
       </cfquery>
    <cfif Update_TimeIn_Row.recordcount EQ 0>
      <cflocation url="default.cfm?work_date=#work_date#">
    </cfif>
    <cfif Update_TimeIn_Row.id_to_update EQ "">
      <cflocation url="default.cfm?work_date=#work_date#">
    </cfif>
    <cfquery name="update_time" datasource="jrgm">
     UPDATE Employee_Payroll_Clock SET Time_Out = CURRENT_TIMESTAMP, In_Out_Status=2 WHERE ID =#Update_TimeIn_Row.id_to_update#   
       </cfquery>
    <cfquery name="calculate_time" datasource="jrgm">
    SELECT DATEDIFF(mi,time_in,time_out) AS 'Duration'  FROM  employee_payroll_clock WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
    <cfquery name="update_time" datasource="jrgm">
    UPDATE Employee_Payroll_Clock SET time_worked = #calculate_time.Duration#  WHERE ID =#Update_TimeIn_Row.id_to_update#
    </cfquery>
  </cfloop>
  
  <cfif IsDefined("cl_warn")>
  <cflocation url="default.cfm?work_date=#work_date#&warn=yes">
  <cfelse>
   <cflocation url="default.cfm?work_date=#work_date#">
 </cfif>


 </cfif>