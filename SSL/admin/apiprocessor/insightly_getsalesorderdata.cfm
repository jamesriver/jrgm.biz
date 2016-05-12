<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Biz Quote information to be used with project to Intacct conversion process ======= --->
<cfif IsDefined('form.project_id')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT qm.*, qm.Grounds_Maintenance_Contract + qm.contract_adjustment + qm.discount_adjustment AS Adjusted_Grounds_Maintenance_Contract, qs.opportunity_field_1 FROM dbo.quote_main qm
        INNER JOIN quote_start qs ON qs.opportunity_id=qm.opportunity_id
        WHERE qs.[Job ID]=<cfqueryparam value="#form.project_id#" CFSQLType="CF_SQL_TEXT">
        AND qs.quote_approved=1
    </cfquery>
    <!--- only 1 result expected because opportunity_id is unique --->
    <cfloop query="main_query">
        <cfset output_str = opportunity_id & "|" & Adjusted_Grounds_Maintenance_Contract & "|" & Irrigation_Contract & "|" & Seasonal_Color_Contract & "|" & contract_start_date & "|" & contract_end_date & "|" & contract_installments & "|" & opportunity_field_1>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">