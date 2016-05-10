<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Biz quote by ID ======= --->
<cfif IsDefined('form.job_id') AND IsDefined('form.biz_approved_date')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT TOP 1 *, Grounds_Maintenance_Contract + contract_adjustment + discount_adjustment AS Adjusted_Grounds_Maintenance_Contract, [Job ID] as Job_ID FROM dbo.quote_start qs
        LEFT JOIN dbo.quote_main qm ON qm.opportunity_id=qs.opportunity_id
        LEFT JOIN dbo.quote_notes qn ON qn.opportunity_id=qs.opportunity_id AND note_type=1
        WHERE qs.[Job ID]=<cfqueryparam value="#form.job_id#" CFSQLType="CF_SQL_TEXT">
          AND qs.quote_approved=1
          AND qs.biz_approved_date>=<cfqueryparam value="#form.biz_approved_date#" CFSQLType="CF_SQL_TEXT">
        ORDER BY biz_approved_date DESC
    </cfquery>
    <!--- should only be 1 result --->
    <cfloop query="main_query">
        <cfset output_str = output_str & opportunity_id & '|' & Adjusted_Grounds_Maintenance_Contract & '|' & Irrigation_Contract & '|' & Seasonal_Color_Contract & '|' & contract_start_date & '|' & contract_end_date & '|' & contract_installments & '|' & opportunity_id_original & '|' & biz_approved_date & '|' & user_id & '|' & REPLACE(note_body, '|', ', ', 'ALL') & '|'>
    </cfloop>
</cfif>
<cfinclude template="include_output.cfm">