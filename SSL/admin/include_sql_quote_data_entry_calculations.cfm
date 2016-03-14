<!--- INITIALIZE MAIN VARIABLES --->
<cfset current_quote_services_materials = StructNew()>

<!--- GET CURRENT QUOTE START --->
<cfquery name="get_quote_start" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount,
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
OPPORTUNITY_status ,
date_updated_utc,
date_due_utc,
date_quote_started,
date_quote_updated,
quote_approved,
CONVERT(varchar, [biz_approved_date], 121) AS biz_approved_date
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

<!--- APPROVE QUOTE --->
<cfif IsDefined("url.quote_approved") AND get_quote_start.quote_approved NEQ 1>
  <cfquery name="update_quote_start" datasource="jrgm">
    UPDATE quote_start SET
    date_quote_updated = GETUTCDATE(),quote_approved =1,biz_approved_date = GETUTCDATE(),
    user_id =  '#SESSION.userid#'
    WHERE opportunity_id = #url.id#
  </cfquery>
  <cfquery name="update_quote_start" datasource="jrgm">
    UPDATE quote_main SET
    date_updated = GETUTCDATE(), quote_approved =1,
    user_id =  '#SESSION.userid#'
    WHERE opportunity_id = #url.id#
  </cfquery>
  <cfmail from="alerts@jrgm.com" to="quotingapproval@jrgm.com" subject="JRGM Quote Approved" type="html">
    <style type="text/css">
   .arialfont {
  font: normal .9em Arial, Helvetica, sans-serif;
   }
  </style>
    <span class="arialfont">Quote ID: #url.id# for #get_quote_start.opportunity_name# has been approved in jrgm.biz.<br />
    <br />
    Please review the Intacct record for accuracy.</span><br />
    <br />
  </cfmail>
  <cflocation url="quote_data_entry.cfm?ID=#url.id#" />
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
        <!---cfif !structKeyExists(current_quote_services_materials, field)>
            <cfset StructInsert(current_quote_services_materials, field, current_quote_materials[i][field])>
        </cfif--->
    </cfloop>
</cfloop>

<!--- HELPER FUNCTION TO CONVERT QUERY TO STRUCT FOR EASIER USE IN HTML OUTPUT --->
<cffunction name="QueryToStruct" access="public" returntype="any" output="false"
    hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">

    <!--- Define arguments. --->
    <cfargument name="Query" type="query" required="true" />
    <cfargument name="Row" type="numeric" required="false" default="0" />

    <cfscript>
        // Define the local scope.
        var LOCAL = StructNew();
        // Determine the indexes that we will need to loop over.
        // To do so, check to see if we are working with a given row,
        // or the whole record set.
        if (ARGUMENTS.Row){
            // We are only looping over one row.
            LOCAL.FromIndex = ARGUMENTS.Row;
            LOCAL.ToIndex = ARGUMENTS.Row;
        } else {
            // We are looping over the entire query.
            LOCAL.FromIndex = 1;
            LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
        }
        // Get the list of columns as an array and the column count.
        LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
        LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
        // Create an array to keep all the objects.
        LOCAL.DataArray = ArrayNew( 1 );
        // Loop over the rows to create a structure for each row.
        for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
            // Create a new structure for this row.
            ArrayAppend( LOCAL.DataArray, StructNew() );
            // Get the index of the current data array object.
            LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
            // Loop over the columns to set the structure values.
            for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
                // Get the column value.
                LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
                // Set column value into the structure.
                LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
            }
        }
        // At this point, we have an array of structure objects that
        // represent the rows in the query over the indexes that we
        // wanted to convert. If we did not want to convert a specific
        // record, return the array. If we wanted to convert a single
        // row, then return the just that STRUCTURE, not the array.
        if (ARGUMENTS.Row){
            // Return the first array item.
            return( LOCAL.DataArray[ 1 ] );
        } else {
            // Return the entire array.
            return( LOCAL.DataArray );
        }
    </cfscript>
</cffunction>

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