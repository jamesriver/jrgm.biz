<!--- GET QUOTE COLUMN HEADERS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_column_headers_temp" datasource="jrgm">
    SELECT * FROM quote_data_entry_headers
    WHERE column_active=1 OR column_visibleonspecsheet > 0
    ORDER BY column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_column_headers_temp = QueryToStruct(get_quote_column_headers_temp)>
<cfset quote_column_ID_index_temp = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers_temp)#" index="i">
    <cfset StructInsert(quote_column_ID_index_temp, quote_column_headers_temp[i].ID, i)>
</cfloop>

<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows_temp" datasource="jrgm">
    SELECT * FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE qdeh.column_active=1 OR qdeh.column_visibleonspecsheet > 0
    ORDER BY qder.row_order, qdeh.column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_rows_raw_temp = QueryToStruct(get_quote_rows_temp)>
<cfset quote_rows_temp = StructNew()>
<cfset row_order_array_temp = ArrayNew(1)>
<cfloop from="1" to="#arrayLen(quote_rows_raw_temp)#" index="i">
    <cfset row_ID = quote_rows_raw_temp[i].row_order>
    <cfif !structKeyExists(quote_rows_temp, row_ID)>
        <cfset quote_rows_temp[row_ID] = ArrayNew(1)>
        <cfset ArrayAppend(row_order_array_temp, row_ID)>
    </cfif>
    <cfset ArrayAppend(quote_rows_temp[row_ID], quote_rows_raw_temp[i])>
</cfloop>


<!--- GET QUOTE COLUMN HEADERS AND ROWS FROM VERSIONS CACHE --->
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT TOP 1 ID, date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
    ORDER BY ID DESC
</cfquery>

<cfloop query="get_quote_column_headers">
    <cfset quote_column_headers = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_headers)))>
    <cfset quote_rows_raw = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_row)))>
    <cfset version_ID = ID>
    <cfset version_date_created = date_created>
</cfloop>

<!--- CREATE COLUMNS BASED ON CACHED VERSION --->
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>

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