<cfinclude template="../quoting-new/include_cffunctions.cfm">

<!--- GET QUOTE COLUMN HEADERS AND ROWS FROM VERSIONS CACHE --->
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT cache_quote_data_entry_headers, cache_quote_data_entry_row FROM quote_data_entry_versions
</cfquery>

<cfloop query="get_quote_column_headers">
    <cfset quote_column_headers = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_headers)))>
    <cfset quote_rows_raw = DeserializeJSON(ToString(ToBinary(cache_quote_data_entry_row)))>
</cfloop>

<!--- CREATE COLUMNS BASED ON CACHED VERSION --->
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>
<cfset total_columns = arrayLen(quote_column_headers) - 5 + 1>

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

<cfdump var="#quote_column_headers#">
<cfdump var="#quote_rows_raw#">