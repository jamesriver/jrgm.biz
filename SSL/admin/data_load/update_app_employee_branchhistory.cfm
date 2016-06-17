<cfquery name="get_missing_app_employee_branchhistory" datasource="jrgm">
    SELECT ae.*, [Employee ID] as employee_id FROM app_employees ae
    LEFT JOIN app_employee_branchhistory aebh ON aebh.employee_id=ae.[Employee ID]
    WHERE aebh.employee_id IS NULL
    AND active_record=1
</cfquery>

<cfloop query="get_missing_app_employee_branchhistory">
    <cfquery name="insert_app_employee_branchhistory" datasource="jrgm">
        INSERT INTO app_employee_branchhistory
        (employee_id, branch, asofdate, untildate)
        VALUES
        (<cfqueryparam value="#get_missing_app_employee_branchhistory.employee_id#" cfsqltype="CF_SQL_INTEGER">
        , <cfqueryparam value="#get_missing_app_employee_branchhistory.branch#" cfsqltype="CF_SQL_TEXT">
        , '2000-01-01 00:00:00.000'
        , '2099-12-31 00:00:00.000'
        )
    </cfquery>
</cfloop>