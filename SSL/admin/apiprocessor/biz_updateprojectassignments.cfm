<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= insert new Insightly Opportunity into Biz ======= --->
<cfif structKeyExists(form, 'Wk Loc ID') AND structKeyExists(form, 'Employee ID') AND structKeyExists(form, 'Responsible_User_Employee_ID') AND structKeyExists(form, 'Crew_Leader_ID') AND structKeyExists(form, 'total_project_value') AND structKeyExists(form, 'project_end_date')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT * FROM dbo.app_jobs
        WHERE [Wk Loc ID]=<cfqueryparam value="#form['Wk Loc ID']#" CFSQLType="CF_SQL_TEXT">
    </cfquery>
    <cfif main_query.recordcount GT 0>
        <!---cfoutput>
            UPDATE app_jobs
            SET last_modified_date_external=GETUTCDATE()
            , last_modified_date=GETUTCDATE()
            , last_modified_by=#form['Employee ID']#
            , Responsible_User_Employee_ID=#form['Responsible_User_Employee_ID']#
            , Crew_Leader_ID=#form['Crew_Leader_ID']#
            , total_project_value='#form['total_project_value']#'
            , project_end_date='#form['project_end_date']#'
            WHERE [Wk Loc ID]='#form['Wk Loc ID']#'
        </cfoutput>
        <cfabort--->
        <cfquery name="update_query" datasource="jrgm">
            UPDATE app_jobs
            SET last_modified_date_external=GETUTCDATE()
            , last_modified_date=GETUTCDATE()
            , last_modified_by=<cfqueryparam value="#form['Employee ID']#" CFSQLType="CF_SQL_NUMERIC">
            , Responsible_User_Employee_ID=<cfqueryparam value="#form['Responsible_User_Employee_ID']#" CFSQLType="CF_SQL_TEXT">
            , Crew_Leader_ID=<cfqueryparam value="#form['Crew_Leader_ID']#" CFSQLType="CF_SQL_TEXT">
            , total_project_value=<cfqueryparam value="#form['total_project_value']#" CFSQLType="CF_SQL_TEXT">
            , project_end_date=<cfqueryparam value="#form['project_end_date']#" CFSQLType="CF_SQL_TEXT">
            WHERE [Wk Loc ID]='#form['Wk Loc ID']#'
        </cfquery>
        <cfset output_str = output_str & "[" & form['Wk Loc ID'] & "]">
    </cfif>
</cfif>

<cfinclude template="include_output.cfm">