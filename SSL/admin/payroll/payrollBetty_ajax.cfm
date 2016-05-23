<cfif !IsDefined('form.authorized')>
    <cfabort>
</cfif>

<cfset currentdate = DateFormat(DateAdd('d', -30, Now()), 'yyyy-mm-dd')>

<cfquery name="main_query" datasource="jrgm">
    SELECT * FROM app_employee_payroll_clock
    WHERE Time_In IS NOT NULL
      AND Ds_Date >= '#currentdate#'
      AND Employee_ID < 10000
    ORDER BY ds_id, Employee_ID, Time_In
</cfquery>
<cfset lastEmployee = 0>
<cfset lastDsId = 0>
<cfset lastTimeOut = 0>
<cfset overlap_ids = ''>
<cfloop query="main_query">
    <!---cfoutput>#ds_id# #Employee_ID# #Time_In# #Time_Out#</cfoutput><br /--->
    <cfif lastEmployee NEQ main_query.Employee_ID OR lastDsId NEQ main_query.Ds_ID>
        <cfset lastEmployee = main_query.Employee_ID>
        <cfset lastDsId = main_query.Ds_ID>
    <cfelse>
        <cfif lastTimeOut NEQ 0 AND lastTimeOut GT main_query.Time_In AND NOT ListContains(overlap_ids, main_query.Ds_ID)>
            <cfset overlap_ids = ListAppend(overlap_ids, main_query.Ds_ID)>
        </cfif>
    </cfif>
    <cfset lastTimeOut = main_query.Time_Out>
</cfloop>

<cfif overlap_ids EQ ''>
    <font color="#00AA00">No daily sheets detected with overlapping times in the last 30 days - all clear.</font>
    <cfabort>
</cfif>

<cfquery name="main_query" datasource="jrgm">
    SELECT aepc.ds_id, ae.[Employee ID] as Employee_ID, ae.[Name FirstLast] as Name, Time_In, Time_Out, time_worked FROM app_employee_payroll_clock aepc
    INNER JOIN app_employees ae ON ae.[Employee ID]=aepc.Employee_ID
    WHERE aepc.ds_id IN (#overlap_ids#)
    ORDER BY aepc.ds_id, aepc.Employee_ID, aepc.Time_In
</cfquery>

<table border="1">
    <tr>
        <td>Daily Sheet ID</td>
        <td>Date</td>
        <td>Employee ID</td>
        <td>Name</td>
        <td>Time In</td>
        <td>Time Out</td>
    </tr>
    <cfoutput query="main_query">
        <tr>
            <td><a href="http://jrgm.biz/ssl/admin/daily_sheet.cfm?dsid=#main_query.ds_id#" target="_blank">#main_query.ds_id#</td>
            <td>#DateFormat(main_query.Time_In, 'mm/dd/yyyy')#</td>
            <td>#main_query.Employee_ID#</td>
            <td>#main_query.Name#</td>
            <td>#TimeFormat(main_query.Time_In, 'hh:mm tt')#</td>
            <td>#TimeFormat(main_query.Time_Out, 'hh:mm tt')#</td>
        </tr>
    </cfoutput>
</table>