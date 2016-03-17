<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= insert new Insightly Opportunity into Biz ======= --->
<cfif structKeyExists(form, 'Wk Loc ID')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT * FROM dbo.app_jobs
        WHERE [Wk Loc ID]=<cfqueryparam value="#form['Wk Loc ID']#" CFSQLType="CF_SQL_TEXT">
    </cfquery>
    <cfif main_query.recordcount GT 0>
        <!---cfoutput>
            UPDATE app_jobs
            SET last_modified_date_external=GETUTCDATE()
            , last_modified_date=GETUTCDATE()
            , last_modified_by=NULL
            , [Job ID]='#form['Job ID']#'
            , project_start_date='#form['project_start_date']#'
            , project_end_date='#form['project_end_date']#'
            , project_type='#form['project_type']#'
            , project_details='#form['project_details']#'
            , Responsible_User_Employee_ID=#form['Responsible_User_Employee_ID']#
            , sales_contact_Employee_ID=#form['sales_contact_Employee_ID']#
            , total_project_value='#form['total_project_value']#'
            <cfif structKeyExists(form, 'renewal')>
                , last_renewed_date=GETUTCDATE()
            </cfif>
            <cfif structKeyExists(form, 'quote_id')>
                , last_quote_id=#form['quote_id']#
            </cfif>
            WHERE [Wk Loc ID]='#form['Wk Loc ID']#'
        </cfoutput>
        <cfabort--->
        <cfquery name="update_query" datasource="jrgm">
            UPDATE app_jobs
            SET last_modified_date_external=GETUTCDATE()
            , last_modified_by=NULL
            , [Job ID]=<cfqueryparam value="#form['Job ID']#" CFSQLType="CF_SQL_TEXT">
            , project_start_date=<cfqueryparam value="#form['project_start_date']#" CFSQLType="CF_SQL_TEXT">
            , project_end_date=<cfqueryparam value="#form['project_end_date']#" CFSQLType="CF_SQL_TEXT">
            , project_type=<cfqueryparam value="#form['project_type']#" CFSQLType="CF_SQL_TEXT">
            , project_details=<cfqueryparam value="#form['project_details']#" CFSQLType="CF_SQL_TEXT">
            , Responsible_User_Employee_ID=<cfqueryparam value="#form['Responsible_User_Employee_ID']#" CFSQLType="CF_SQL_TEXT">
            , sales_contact_Employee_ID=<cfqueryparam value="#form['sales_contact_Employee_ID']#" CFSQLType="CF_SQL_TEXT">
            , total_project_value=<cfqueryparam value="#form['total_project_value']#" CFSQLType="CF_SQL_TEXT">
            <cfif structKeyExists(form, 'renewal')>
                , last_renewed_date=GETUTCDATE()
            </cfif>
            <cfif structKeyExists(form, 'quote_id')>
                , last_quote_id=<cfqueryparam value="#form['quote_id']#" CFSQLType="CF_SQL_TEXT">
            </cfif>
            WHERE [Wk Loc ID]=<cfqueryparam value="#form['Wk Loc ID']#" CFSQLType="CF_SQL_TEXT">
        </cfquery>
        <cfset output_str = output_str & "[" & form['Wk Loc ID'] & "]">
    </cfif>
</cfif>

<cfinclude template="include_output.cfm">