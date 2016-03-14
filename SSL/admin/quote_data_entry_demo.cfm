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
    SELECT ID, column_name, column_displayformat, column_multiplier, column_precision, column_options, column_formula, column_editable, column_displayalign FROM quote_data_entry_headers
    WHERE column_active=1
    ORDER BY column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_column_headers = QueryToStruct(get_quote_column_headers)>
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>

<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows" datasource="jrgm">
    SELECT qder.ID, qder.row_defaultvalue, qder.quote_data_entry_headers_ID, qder.quote_services_field, qder.row_order, qder.row_active FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE qdeh.column_active=1
    AND qder.row_order BETWEEN 1 AND 8
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
<!--- BEGIN OUTPUT --->
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
          <thead>
            <tr>
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <th align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><cfoutput>#quote_column_headers[i].column_name#</cfoutput></th>
                </cfloop>
            </tr>
          </thead>
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfset quote_row_index = row_order_array[wrapi]>
                <tr>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <cfset current_row = quote_rows[quote_row_index][i]>
                        <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                        <cfif current_row.row_active EQ 1>
                            <td>
                                <cfif current_column.column_editable GT 0>
                                    <cfoutput><input id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" onChange="recalculate()" /></cfoutput>
                                <cfelse>
                                    <cfoutput><span id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                                    <cfoutput><input type="hidden" id="row#current_row.ID#_numeric" value="0"></cfoutput>
                                </cfif>
                            </td>
                        <cfelse>
                            <td>&nbsp;</td>
                            <cfoutput><input type="hidden" id="row#current_row.ID#_numeric" value="0"></cfoutput>
                        </cfif>
                    </cfloop>
                </tr>
            </cfloop>
          </tbody>
        </table>
      </td>
    </tr>
  </table>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/2.6.0/math.min.js"></script>
  <script>
    function recalculate()
    {
        var equation;
        var regexp = /\[(\d+)\]/g;
        var matches;
        var index;
        var rowcol_element_ids;
        var column_ID;
        var column_ID_raw;
        var value_raw;
        var value_rounded;
        var value_formatted;
        <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
            <cfset quote_row_index = row_order_array[wrapi]>
            rowcol_element_ids = {};
            <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                <cfset current_row = quote_rows[quote_row_index][i]>
                <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                <cfif current_row.quote_services_field NEQ ''>
                    rowcol_element_ids['[<cfoutput>#current_column.ID#</cfoutput>]'] = '<cfoutput>#current_row.quote_services_field#</cfoutput>';
                <cfelse>
                    rowcol_element_ids['[<cfoutput>#current_column.ID#</cfoutput>]'] = '<cfoutput>row#current_row.ID#_numeric</cfoutput>';
                </cfif>
            </cfloop>
            <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                <cfset current_row = quote_rows[quote_row_index][i]>
                <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                <cfif current_column.column_formula NEQ ''>
                    equation = '<cfoutput>#current_column.column_formula#</cfoutput>';
                    console.log(equation);
                    matches = equation.match(regexp);
                    for(var index in matches)
                    {
                        column_ID = matches[index];
                        console.log(column_ID);
                        var extracted_value;
                        if (document.getElementById(rowcol_element_ids[column_ID]))
                        {
                            console.log(rowcol_element_ids[column_ID]);
                            extracted_value = 1*document.getElementById(rowcol_element_ids[column_ID]).value;
                        }
                        else
                        {
                            column_ID_raw = column_ID.replace('[', '').replace(']', '');
                            console.log('row'+column_ID_raw+'_numeric');
                            extracted_value = 1*document.getElementById('row'+column_ID_raw+'_numeric').value;
                        }
                        equation = equation.replace(matches[index], extracted_value);
                    }
                    console.log(equation);
                    value_raw = math.eval(equation);
                    value_rounded = (Math.round(value_raw * Math.pow(10, <cfoutput>#current_column.column_precision#</cfoutput>))/Math.pow(10, <cfoutput>#current_column.column_precision#</cfoutput>)).toFixed(<cfoutput>#current_column.column_precision#</cfoutput>);
                    <cfif current_column.column_displayformat NEQ ''>
                        value_formatted = '<cfoutput>#current_column.column_displayformat#</cfoutput>'.replace('__', value_rounded);
                    <cfelse>
                        value_formatted = value_rounded;
                    </cfif>
                    document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>_numeric').value = value_raw;
                    console.log(value_raw);
                    console.log(document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>_numeric').value);
                    if (document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>'))
                    {
                        document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>').innerHTML = value_formatted;
                    }
                </cfif>
            </cfloop>
        </cfloop>
    }

    window.onload = function(){
        recalculate();
    }
  </script>
<!--- END OUTPUT --->