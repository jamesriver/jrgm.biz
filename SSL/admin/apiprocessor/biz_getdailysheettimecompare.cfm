<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Daily Sheet Time Compare ======= --->
<!---
<cfoutput>
    SELECT ID, Supervisor_ID, Crew_Leader_ID, CONVERT(varchar, [DS_Date], 121) AS DS_Date, branch_code FROM app_daily_sheets ads
    WHERE 1=1
    <cfif IsDefined('form.start_date') AND IsDefined('form.end_date')>
        <cfif form.start_date NEQ '' AND form.end_date NEQ ''>
            AND DS_Date >='#form.start_date#'
            AND DS_Date <='#form.end_date#'
        </cfif>
    </cfif>
    <cfif IsDefined('form.supervisor')>
        <cfif form.supervisor NEQ ''>
            AND Supervisor_ID='#form.supervisor#'
        </cfif>
    </cfif>
    <cfif IsDefined('form.crew_leader')>
        <cfif form.crew_leader NEQ ''>
            AND Crew_Leader_ID='#form.crew_leader#'
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch_code')>
        <cfif form.branch_code NEQ ''>            
            AND branch_code='#branch_code#'
        </cfif>
    </cfif>
    ORDER by ds_date DESC, ID DESC
</cfoutput>
--->
<cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT ID, Supervisor_ID, Crew_Leader_ID, CONVERT(varchar, [DS_Date], 121) AS DS_Date, branch_code FROM app_daily_sheets ads
    WHERE 1=1
    <cfif IsDefined('form.start_date') AND IsDefined('form.end_date')>
        <cfif form.start_date NEQ '' AND form.end_date NEQ ''>
            AND DS_Date >=<cfqueryparam value="#form.start_date#" CFSQLType="CF_SQL_TEXT">
            AND DS_Date <=<cfqueryparam value="#form.end_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.supervisor')>
        <cfif form.supervisor NEQ ''>
            AND Supervisor_ID=<cfqueryparam value="#form.supervisor#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.crew_leader')>
        <cfif form.crew_leader NEQ ''>
            AND Crew_Leader_ID=<cfqueryparam value="#form.crew_leader#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif IsDefined('form.branch_code')>
        <cfif form.branch_code NEQ ''>            
            AND branch_code=<cfqueryparam value="#branch_code#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    ORDER by ds_date DESC, ID DESC
</cfquery>
<cfif get_daily_sheets.recordcount GT 0>
    <cfset mylist ="">
    <cfloop query="get_daily_sheets">
      <cfset myList = ListAppend(mylist,ID)>
    </cfloop>

    <cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
        SELECT ds_ID FROM app_gps WHERE   ds_ID IN (#mylist#)
    </cfquery>
    <cfquery name="get_all_employee_time_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
        SELECT * FROM app_employee_payroll_clock WHERE ds_ID IN (#mylist#)
    </cfquery>
    <cfquery name="get_all_employee_service_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
        SELECT * FROM app_job_services_actual_employee WHERE ds_ID IN (#mylist#)
    </cfquery>

    <cfset cv = 0>
    <cfloop query="get_daily_sheets">
        <cftry>
            <cfif cv GT 0>
                <cfset output_str = output_str & multi_delimiter>
            </cfif>

            <cfquery name="get_employee_minutes_for_day" dbtype="query" maxrows="1">
                SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_info WHERE ds_id =#get_daily_sheets.ID#
            </cfquery>
            <cfquery name="get_employee_service_minutes_for_day"  dbtype="query" maxrows="1">
                SELECT Sum(total_time) AS  service_minutes_worked_day FROM  get_all_employee_service_info WHERE ds_id =#get_daily_sheets.ID#
            </cfquery>
            <cfquery name="get_ds_edits" datasource="jrgm" maxrows="1" blockfactor="1">
                SELECT   ds_id FROM app_employee_payroll_clock_backup WHERE ds_id =#get_daily_sheets.ID#
            </cfquery>
            <cfquery name="nogps"   dbtype="query" maxrows="1" blockfactor="1">
                SELECT     ds_ID
                FROM        get_all_gps_info
                WHERE     ds_id =  #get_daily_sheets.ID#
             </cfquery>
             <cfif get_employee_minutes_for_day.recordcount EQ 0>
                <cfset minutes_worked_day = 0>
             <cfelse>
                <cfset minutes_worked_day = #get_employee_minutes_for_day.minutes_worked_day#>
             </cfif>
             <cfif get_employee_service_minutes_for_day.recordcount EQ 0>
                <cfset service_minutes_worked_day = 0>
             <cfelse>
                <cfset service_minutes_worked_day = #get_employee_service_minutes_for_day.service_minutes_worked_day#>
             </cfif>
             <cfif service_minutes_worked_day EQ 0 OR minutes_worked_day EQ 0>
                <cfset diffper = 0>
             <cfelse>
                <cfset diffper = 100*get_employee_service_minutes_for_day.service_minutes_worked_day/get_employee_minutes_for_day.minutes_worked_day>
             </cfif>
             <cfset diff = service_minutes_worked_day - minutes_worked_day>
             <cfif get_ds_edits.recordcount GT 0 OR nogps.recordcount EQ 0 >
                <cfset edit_type = 'M'>
             <cfelse>
                <cfset edit_type = 'A'>
             </cfif>
            <cfset output_str = output_str & ID & '|' & DS_Date & '|' & branch_code & '|' & Supervisor_ID & '|' & Crew_Leader_ID & '|' & minutes_worked_day & '|' & service_minutes_worked_day & '|' & diff & '|' & NumberFormat(diffper,"09.9") & '|' & edit_type & '|'>
            <cfcatch>
            </cfcatch>
        </cftry>
        <cfset cv++>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">