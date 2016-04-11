<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Biz Quote information to be used with project to Intacct conversion process ======= --->
<cfif IsDefined('form.opportunity_id')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT *, Grounds_Maintenance_Contract + contract_adjustment + discount_adjustment AS Adjusted_Grounds_Maintenance_Contract FROM dbo.quote_main
        WHERE opportunity_id=<cfqueryparam value="#form.opportunity_id#" CFSQLType="CF_SQL_NUMERIC">
        AND quote_approved=1
    </cfquery>
    <!--- only 1 result expected because opportunity_id is unique --->
    <cfloop query="main_query">
        <cfset output_str = opportunity_id & "|" & Adjusted_Grounds_Maintenance_Contract& "|" & Irrigation_Contract& "|" & Seasonal_Color_Contract& "|" & contract_start_date& "|" & contract_end_date& "|" & contract_installments>
    </cfloop>

    <cfquery name="main_query" datasource="jrgm">
        SELECT opportunity_field_1 FROM dbo.quote_start
        WHERE opportunity_id=<cfqueryparam value="#form.opportunity_id#" CFSQLType="CF_SQL_NUMERIC">
        AND quote_approved=1
    </cfquery>
    <cfloop query="main_query">
        <cfset output_str = output_str & "|" & opportunity_field_1>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">