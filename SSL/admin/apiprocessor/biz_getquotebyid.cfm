<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= get Biz quote by ID ======= --->
<cfif IsDefined('form.quote_id')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT *, qm.Grounds_Maintenance_Contract + qm.contract_adjustment + qm.discount_adjustment AS Adjusted_Grounds_Maintenance_Contract, [Job ID] as Job_ID FROM dbo.quote_start qs
        LEFT JOIN dbo.quote_main qm ON qm.opportunity_id=qs.opportunity_id
        WHERE qs.ID=<cfqueryparam value="#form.quote_id#" CFSQLType="CF_SQL_INTEGER">
        <cfif IsDefined('form.quote_approved')>
            <cfif form.quote_approved EQ 1>
                AND qs.quote_approved=1
            <cfelse>
                AND (qs.quote_approved=0 OR qs.quote_approved IS NULL)
            </cfif>
        <cfelse>
            AND (qs.quote_approved=0 OR qs.quote_approved IS NULL)
        </cfif>
    </cfquery>
    <!--- should only be 1 result --->
    <cfloop query="main_query">
        <cfset output_str = output_str & opportunity_id & '|' & Adjusted_Grounds_Maintenance_Contract & '|' & Irrigation_Contract & '|' & Seasonal_Color_Contract & '|' & contract_start_date & '|' & contract_end_date & '|' & contract_installments & '|' & opportunity_name & '|' & opportunity_state & '|' & bid_amount & '|' & responsible_user_Employee_ID & '|' & opportunity_details & '|' & category_id & '|' & Job_ID & '|' & opportunity_field_1 & '|' & opportunity_field_2 & '|' & opportunity_field_3 & '|' & opportunity_field_4 & '|' & opportunity_field_5 & '|' & opportunity_field_6 & '|' & opportunity_field_7 & '|' & opportunity_field_8 & '|' & opportunity_field_9 & '|' & opportunity_field_10 & '|' & opportunity_field_11 & '|' & opportunity_field_12 & '|' & opportunity_field_14 & '|' & opportunity_field_15 & '|' & opportunity_field_16 & '|' & opportunity_field_17 & '|' & opportunity_field_18 & '|' & opportunity_field_19 & '|' & opportunity_field_20 & '|' & opportunity_field_21 & '|' & opportunity_field_22 & '|' & opportunity_field_23 & '|' & opportunity_id_original & '|' & Job_ID & '|'>
    </cfloop>
</cfif>
<cfinclude template="include_output.cfm">