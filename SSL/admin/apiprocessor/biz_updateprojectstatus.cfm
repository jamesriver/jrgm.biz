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
            , Status='#form['Status']#'
            WHERE [Wk Loc ID]='#form['Wk Loc ID']#'
        </cfoutput>
        <cfabort--->
        <cfquery name="update_query" datasource="jrgm">
            UPDATE app_jobs
            SET last_modified_date_external=GETUTCDATE()
            , last_modified_by=NULL
            , Status=<cfqueryparam value="#form['Status']#" CFSQLType="CF_SQL_TEXT">
            WHERE [Wk Loc ID]='#form['Wk Loc ID']#'
        </cfquery>
        <cfset output_str = output_str & "[" & form['Wk Loc ID'] & "]">
    </cfif>
</cfif>

<cfinclude template="include_output.cfm">