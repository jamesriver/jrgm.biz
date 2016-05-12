<!--- INITIALIZE MAIN VARIABLES --->
<cfset current_quote_services_materials = StructNew()>

<!--- GET CURRENT QUOTE START --->
<cfquery name="get_quote_start" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, opportunity_id_original, bid_amount,
opportunity_field_1 AS q_branch,
CONVERT(varchar, [opportunity_field_18], 121) AS q_start_date ,
CONVERT(varchar, [opportunity_field_19], 121) AS q_end_date,
stage_id,
date_created_utc,
bid_currency,
bid_type,
bid_duration,
pipeline_id,
opportunity_field_2 AS q_address1,
opportunity_field_3 AS q_address2,
opportunity_field_4 AS q_city,
opportunity_field_5  AS q_address_state,
opportunity_field_6 AS q_address_zip,
opportunity_field_14 AS q_opportunity_type  ,
opportunity_field_23 AS q_bill_to_company,
opportunity_field_20 AS q_billing_contact,
opportunity_field_21 AS q_billing_contact_phone,
opportunity_field_22 AS q_billing_contact_email,
OPPORTUNITY_status ,
date_updated_utc,
date_due_utc,
date_quote_started,
date_quote_updated,
quote_approved,
CONVERT(varchar, [biz_approved_date], 121) AS biz_approved_date,
[Job ID] as job_id,
quote_data_entry_versions_ID
FROM         quote_start
where opportunity_id  =#url.id#
</cfquery>
<cfif !IsDefined('get_quote_start.ID')>
    <cfoutput>
    FAILED - could not resolve ID #url.ID#
    </cfoutput>
    <cfabort>
</cfif>
<cfif get_quote_start.ID EQ ''>
    <cfoutput>
    FAILED - could not resolve ID #url.ID#
    </cfoutput>
    <cfabort>
</cfif>

<!--- GET QUOTE MAIN --->
<cfquery name="get_quote_main" datasource="jrgm">
    SELECT *
    FROM quote_main
    WHERE opportunity_id=<cfqueryparam value="#url.ID#" CFSQLType="CF_SQL_INT">
</cfquery>

<!--- GET QUOTE SERVICES --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_services" datasource="jrgm">
    SELECT * FROM quote_services
    WHERE opportunity_id=<cfqueryparam value="#url.ID#"     CFSQLType="CF_SQL_INT">
</cfquery>
<cfset current_quote_services_names = get_quote_services.getMetaData().getColumnLabels()>
<cfset current_quote_services_nameassoc = StructNew()>
<cfloop from="1" to="#arrayLen(current_quote_services_names)#" index="i">
    <cfset StructInsert(current_quote_services_nameassoc, UCase(current_quote_services_names[i]), current_quote_services_names[i])>
</cfloop>
<cfset current_quote_services = QueryToStruct(get_quote_services)>
<cfloop from="1" to="#arrayLen(current_quote_services)#" index="i">
    <cfloop collection=#current_quote_services[i]# item="index">
        <cfset field = current_quote_services_nameassoc[index]>
        <cfif !structKeyExists(current_quote_services_materials, field)>
            <!---<cfoutput>#field# = #current_quote_services[i][field]#</cfoutput><br />--->
            <cfset StructInsert(current_quote_services_materials, field, current_quote_services[i][field])>
        </cfif>
    </cfloop>
</cfloop>

<!--- GET QUOTE MATERIALS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_materials" datasource="jrgm">
    SELECT * FROM quote_materials
    WHERE opportunity_id=<cfqueryparam value="#url.ID#"     CFSQLType="CF_SQL_INT">
</cfquery>
<cfset current_quote_materials_names = get_quote_materials.getMetaData().getColumnLabels()>
<cfset current_quote_materials_nameassoc = StructNew()>
<cfloop from="1" to="#arrayLen(current_quote_materials_names)#" index="i">
    <cfset StructInsert(current_quote_materials_nameassoc, UCase(current_quote_materials_names[i]), current_quote_materials_names[i])>
</cfloop>
<cfset current_quote_materials = QueryToStruct(get_quote_materials)>
<cfloop from="1" to="#arrayLen(current_quote_materials)#" index="i">
    <cfloop collection=#current_quote_materials[i]# item="index">
        <cfset field = current_quote_materials_nameassoc[index]>
        <cfif field CONTAINS 'blank' AND !structKeyExists(current_quote_services_materials, field)>
            <cfset StructInsert(current_quote_services_materials, field, current_quote_materials[i][field])>
        </cfif>
    </cfloop>
</cfloop>

<!--- GET QUOTE COLUMN HEADERS AND ROWS FROM VERSIONS CACHE --->
<cfquery name="get_highest_version" datasource="jrgm">
    SELECT TOP 1 ID, date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
    ORDER BY ID DESC
</cfquery>
<cfloop query="get_highest_version">
    <cfset highest_version_ID = ID>
    <cfset highest_version_date_created = date_created>
</cfloop>

<cfif get_quote_start.quote_data_entry_versions_ID EQ highest_version_ID>
    <cfloop query="get_highest_version">
        <cfset quote_column_headers = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_headers)))>
        <cfset quote_rows_raw = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_row)))>
        <cfset version_ID = ID>
        <cfset version_date_created = date_created>
    </cfloop>
<cfelse>
    <cfquery name="get_current_version" datasource="jrgm">
        SELECT ID, date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
        WHERE ID=#get_quote_start.quote_data_entry_versions_ID#
    </cfquery>
    <cfloop query="get_current_version">
        <cfset quote_column_headers = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_headers)))>
        <cfset quote_rows_raw = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_row)))>
        <cfset version_ID = ID>
        <cfset version_date_created = date_created>
    </cfloop>
</cfif>

<!---cfdump var="#quote_column_headers#">
<cfdump var="#quote_rows_raw#">
<cfabort--->

<!--- CREATE COLUMNS BASED ON CACHED VERSION --->
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>
<cfset total_columns = arrayLen(quote_column_headers) - 5>

<!--- CREATE ROWS BASED ON CACHED VERSION --->
<cfset quote_rows = StructNew()>
<cfset row_order_array = ArrayNew(1)>
<cfloop from="1" to="#arrayLen(quote_rows_raw)#" index="i">
    <cfset row_ID = quote_rows_raw[i].row_order>
    <cfif !structKeyExists(quote_rows, row_ID)>
        <cfset quote_rows[row_ID] = ArrayNew(1)>
        <cfset ArrayAppend(row_order_array, row_ID)>
    </cfif>
    <cfset ArrayAppend(quote_rows[row_ID], quote_rows_raw[i])>
</cfloop>

