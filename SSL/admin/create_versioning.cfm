<cfinclude template="../quoting-new/include_cffunctions.cfm">

<!--- GET QUOTE COLUMN HEADERS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT ID, column_name, column_displayformat, column_multiplier, column_precision, column_options, column_formula, column_editable, column_displayalign, column_totalable FROM quote_data_entry_headers
    WHERE column_active=1
    ORDER BY column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_column_headers = QueryToStruct(get_quote_column_headers)>
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>
<cfset total_columns = arrayLen(quote_column_headers) - 5 + 1>

<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows" datasource="jrgm">
    SELECT qder.ID, qder.row_defaultvalue, qder.quote_data_entry_headers_ID, qder.quote_services_field, qder.row_order, qder.row_active, qder.row_totaltype, qder.row_formula FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE qdeh.column_active=1
    ORDER BY qder.row_order, qdeh.column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_rows_raw = ArrayNew(1)>
<cfset quote_rows_raw = QueryToStruct(get_quote_rows)>
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

<cfdump var = "#ToBase64(SerializeJSON(quote_column_headers))#">
<cfdump var = "#ToBase64(SerializeJSON(quote_rows_raw))#">