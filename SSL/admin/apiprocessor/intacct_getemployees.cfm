<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter='|'>

<!--- ======= get Biz employees ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT [ID], [Employee ID] as Employee_ID, [First_name], [Last_name], [Position], [Ph Home] as Ph_Home, [Phone_Cell], [Ph Cell] as Ph_Cell, [Branch], [active_record], [Middle_name], [email], [employee_address], [employee_city], [employee_state], [employee_zip_code], CONVERT(varchar, [employee_dob], 121) as employee_dob, [employee_phone], CONVERT(varchar, [employee_hire_date], 121) as employee_hire_date, CONVERT(varchar, [employee_rehire_date], 121) as employee_rehire_date, [regular_pay_rate] FROM dbo.app_employees
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & ID & '^' & Employee_ID & '^' & First_name & '^' & Last_name & '^' & Position & '^' & Ph_Home & '^' & Phone_Cell & '^' & Ph_Cell & '^' & Branch & '^' & active_record & '^' & Middle_name & '^' & email & '^' & employee_address & '^' & employee_city & '^' & employee_state & '^' & employee_zip_code & '^' & employee_dob & '^' & employee_phone & '^' & employee_hire_date & '^' & employee_rehire_date & '^' & regular_pay_rate>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">