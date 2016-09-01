<cfif !IsDefined('url.ID')>
FAILED - no ID detected
  <cfabort>
</cfif>
<cfif url.ID EQ ''>
  FAILED - no ID detected
  <cfabort>
</cfif>

<cfinclude template="../quoting-new/include_cffunctions.cfm">

<!--- INITIALIZE MAIN VARIABLES --->
<cfset current_quote_services_materials = StructNew()>

<!--- GET CURRENT QUOTE START --->
<cfquery name="get_quote_start" datasource="jrgm">
 SELECT    *,
opportunity_field_1 AS q_branch,
CONVERT(date, [contract_start_date], 121) AS q_start_date ,
CONVERT(date, [contract_end_date], 121) AS q_end_date,
opportunity_field_2 AS q_address1,
opportunity_field_3 AS q_address2,
opportunity_field_4 AS q_city,
opportunity_field_5  AS q_address_state,
opportunity_field_6 AS q_address_zip,
opportunity_field_14 AS q_opportunity_type
FROM         quote_start qs
LEFT JOIN quote_main qm ON qm.opportunity_id=qs.opportunity_id
where qs.opportunity_id  =#url.id#
</cfquery>
<cfif !IsDefined('get_quote_start.ID')>
  <cfoutput>FAILED - could not resolve ID#url.ID#</cfoutput>
  <cfabort>
</cfif>
<cfif get_quote_start.ID EQ ''>
  <cfoutput>FAILED - could not resolve ID#url.ID#</cfoutput>
  <cfabort>
</cfif>

<!--- GET QUOTE MAIN --->
<cfquery name="get_quote_main" datasource="jrgm">
    SELECT *
    FROM quote_main
    WHERE opportunity_id=<cfqueryparam value="#url.ID#" CFSQLType="CF_SQL_INT">
</cfquery>
<cfset current_quote_main = QueryToStruct(get_quote_main)>
<cfset current_quote_main = current_quote_main[1]>

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
<!---<cfdump var="#current_quote_services#">--->
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
    <cfif !structKeyExists(current_quote_services_materials, field)>
      <cfset StructInsert(current_quote_services_materials, field, current_quote_materials[i][field])>
    </cfif>
  </cfloop>
</cfloop>

<!--- *** NEED TO APPLY CURRENT VERSION'S VALUES (NOT THE CLEANEST METHOD BUT AT LEAST A METHOD THAT CAN BE APPLIED) *** --->
<!--- GET QUOTE COLUMN HEADERS AND ROWS FROM VERSIONS CACHE --->
<cfif get_quote_start.quote_data_entry_versions_ID GT 0>
    <cfquery name="get_quote_column_headers_cache" datasource="jrgm">
        SELECT ID, date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
        WHERE ID=#get_quote_start.quote_data_entry_versions_ID#
    </cfquery>
<cfelse>
    <cfquery name="get_quote_column_headers_cache" datasource="jrgm">
        SELECT TOP 1 ID, date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
        ORDER BY ID DESC
    </cfquery>
</cfif>

<cfloop query="get_quote_column_headers_cache">
    <cfset quote_column_headers_cache = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_headers)))>
    <cfset quote_rows_raw_cache = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_row)))>
    <cfset version_ID = ID>
    <cfset version_date_created = date_created>
</cfloop>
<!---cfdump var="#quote_column_headers#">
<cfdump var="#quote_rows_raw#">
<cfabort--->

<!--- CREATE COLUMNS BASED ON CACHED VERSION --->
<cfset quote_column_ID_index_cache = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers_cache)#" index="i">
    <cfset StructInsert(quote_column_ID_index_cache, quote_column_headers_cache[i].ID, i)>
</cfloop>

<!--- CREATE ROWS BASED ON CACHED VERSION --->
<cfset quote_rows_cache = StructNew()>
<cfset row_order_array_cache = ArrayNew(1)>
<cfloop from="1" to="#arrayLen(quote_rows_raw_cache)#" index="i">
    <cfset row_ID = quote_rows_raw_cache[i].row_order>
    <cfif !structKeyExists(quote_rows_cache, row_ID)>
        <cfset quote_rows_cache[row_ID] = ArrayNew(1)>
        <cfset ArrayAppend(row_order_array_cache, row_ID)>
    </cfif>
    <cfset ArrayAppend(quote_rows_cache[row_ID], quote_rows_raw_cache[i])>
</cfloop>
<!--- ****** --->

<!--- GET QUOTE COLUMN HEADERS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT ID, column_name, column_displayformat, column_multiplier, column_precision, column_options, column_formula, column_editable, column_displayalign, column_totalable, column_visibleonspecsheet FROM quote_data_entry_headers
    WHERE <!---column_active=1 AND---> column_visibleonspecsheet > 0
    ORDER BY column_visibleonspecsheet
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset column_order_array = ArrayNew(1)>
<cfloop query="get_quote_column_headers">
  <cfset ArrayAppend(column_order_array, get_quote_column_headers)>
</cfloop>

<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows" datasource="jrgm">
    SELECT qder.ID, qder.row_defaultvalue, qder.quote_data_entry_headers_ID, qder.quote_services_field_specsheet AS quote_services_field, qder.row_order, qder.row_active, qder.row_totaltype, qder.row_formula FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE <!---qdeh.column_active=1 AND---> column_visibleonspecsheet > 0
    ORDER BY qder.row_order, qdeh.column_visibleonspecsheet
</cfquery>

<!---<cfdump  var="#get_quote_rows.columnList#">--->

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_rows = StructNew()>
<cfloop query="get_quote_rows">
  <cfset row_order = get_quote_rows.row_order>
  <cfif !structKeyExists(quote_rows, row_order)>
    <cfset quote_rows[row_order] = ArrayNew(1)>
  </cfif>
  <cfset value = get_quote_rows.row_defaultvalue>
  <cfif get_quote_rows.quote_services_field NEQ ''>
    <cfset value = '<span id="' & LCase(get_quote_rows.quote_services_field) & '"></span>'>
    <!---cfoutput>#get_quote_rows.quote_services_field#<br /></cfoutput--->
  </cfif>
  <cfset ArrayAppend(quote_rows[row_order], value)>
</cfloop>

<!--- GET QUOTE SPECSHEET --->
<cfquery name="get_quote_specsheet" datasource="jrgm">
    SELECT ID, specsheet_group, quote_data_entry_row_orders, specsheet_order FROM quote_specsheet
    ORDER BY specsheet_order
</cfquery>
<cfset quote_specsheet = ArrayNew(1)>
<cfloop query="get_quote_specsheet">
  <cfset ArrayAppend(quote_specsheet, [get_quote_specsheet.specsheet_group, get_quote_specsheet.quote_data_entry_row_orders])>
</cfloop>
<cfquery name="get_project_info" datasource="jrgm">
SELECT       ID, [Job ID] AS ProjectID, [Wk Loc ID], [Wk Location Name] AS projectname, [Service Address] as project_work_location_address, [Service Address2]   AS project_work_location_address2, [Service City] as project_work_location_city, [Service State] as project_work_location_state, [Service Zip] as project_work_location_zip, project_type,
                       active_record, branch, Responsible_User_Employee_ID, Supervisor_ID, Spray_Tech_ID, Irrigation_Tech_ID, Status, irrigation,
                      sales_contact_Employee_ID, billing_contact_name, billing_contact_phone, billing_contact_email_address, billing_address, billing_address2, billing_city,
                      billing_state, billing_zip, project_start_date, project_end_date, total_project_value, irrigation_services_included,   
                      Crew_Leader_ID, billto_company_name,contract_installments, last_quote_id, project_status_checkbox, [Wk Loc ID] as insightly_id, project_details, irrigation_services_included
FROM         app_jobs  WHERE last_quote_id  = '#get_quote_start.ID#'
</cfquery>

<cfset service_descriptions_row = 19>
<cfif get_quote_start.quote_data_entry_versions_ID GE 16>
    <cfset service_descriptions_row = 20>
</cfif>