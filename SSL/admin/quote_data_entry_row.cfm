<!---test--->
<cfif IsDefined('form.submitted')>
    <cfset row_iterator = StructNew()>
    <cfloop collection=#form# item="field">
        <cfset val = form[field]>
        <cfif val EQ ''>
            <cfset val = 'NULL'>
        <cfelse>
            <cfif !IsNumeric(val)>
                <cfset val = "'" & val & "'">
            </cfif>
        </cfif>
        <cfset splitter = field.split('_')>
        <cfset row_iterator_key = splitter[1]>
        <cfif IsNumeric(row_iterator_key)>
            <cfset row_iterator_field = ''>
            <cfloop from="2" to="#arrayLen(splitter)#" index="i">
                <cfif row_iterator_field NEQ ''>
                    <cfset row_iterator_field = row_iterator_field & '_'>
                </cfif>
                <cfset row_iterator_field = row_iterator_field & splitter[i]>
            </cfloop>
            <cfif !structKeyExists(row_iterator, row_iterator_key)>
                <cfset row_iterator[row_iterator_key] = StructNew()>
            </cfif>
            <cfif !structKeyExists(row_iterator[row_iterator_key], row_iterator_field)>
                <cfset row_iterator[row_iterator_key][row_iterator_field] = val>
            </cfif>
            <!---<cfoutput>ID #row_iterator_key#: #row_iterator_field# = #row_iterator[row_iterator_key][row_iterator_field]#</cfoutput><br />--->
        </cfif>
        <!---<cfoutput>#field# = #val#</cfoutput><br />--->
    </cfloop>

    <cfloop collection=#row_iterator# item="row">
        <cfset query_string = 'UPDATE quote_data_entry_row SET '>
        <cfset count = 0>
        <cfloop collection=#row_iterator[row]# item="field">
            <cfif count NEQ 0>
                <cfset query_string = query_string & ', '>
            </cfif>
            <cfset query_string = query_string & field & ' = ' & row_iterator[row][field]>
            <cfset count++>
        </cfloop>
        <cfset query_string = query_string & ' WHERE ID = ' & row>
        <cfquery name="update_quote_data_entry_row" datasource="jrgm">
            #preserveSingleQuotes(query_string)#
        </cfquery>
    </cfloop>
    <cflocation url="quote_data_entry_row_admin.cfm">
</cfif>

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
    SELECT * FROM quote_data_entry_headers
    WHERE (column_active=1 OR column_visibleonspecsheet > 0)
    <cfif IsDefined('url.ids')><cfoutput>AND ID IN (#url.ids#)</cfoutput></cfif>
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
    SELECT qder.*, qdeh.column_formula, qdeh.column_editable FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE (qdeh.column_active=1 OR qdeh.column_visibleonspecsheet > 0)
    <cfif IsDefined('url.ids')><cfoutput>AND qdeh.ID IN (#url.ids#)</cfoutput></cfif>
    ORDER BY qder.row_order, qdeh.column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_rows_raw = QueryToStruct(get_quote_rows)>
<cfset quote_rows = StructNew()>
<cfset row_order_array = ArrayNew(1)>
<cfset row_order_name = ArrayNew(1)>
<cfloop from="1" to="#arrayLen(quote_rows_raw)#" index="i">
    <cfset row_ID = quote_rows_raw[i].row_order>
    <cfif !structKeyExists(quote_rows, row_ID)>
        <cfset quote_rows[row_ID] = ArrayNew(1)>
        <cfset ArrayAppend(row_order_array, row_ID)>
    </cfif>
    <cfset ArrayAppend(quote_rows[row_ID], quote_rows_raw[i])>
</cfloop>
<cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
    <cfset quote_row_index = row_order_array[wrapi]>
    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
        <cfif quote_rows[quote_row_index][i].quote_data_entry_headers_ID EQ 1>
            <cfset ArrayAppend(row_order_name, quote_rows[quote_row_index][i].row_defaultvalue)>
        </cfif>
    </cfloop>
</cfloop>

<!--- BEGIN OUTPUT --->
<form method="post">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table style="width: 2000px">
          <thead>
            <tr>
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfoutput>
                        <th>[#quote_column_headers[i].ID#] #quote_column_headers[i].column_name#</th>
                    </cfoutput>
                </cfloop>
                <th>Contract Type</th>
            </tr>
          </thead>
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfoutput>
                <tr bgcolor="<cfif wrapi % 2 EQ 1>##e5e5e5</cfif>">
                    <cfset quote_row_index = row_order_array[wrapi]>
                    <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="column_ID">
                        <td style="min-width: 100px" align="<cfif column_ID EQ 1>left<cfelse>center</cfif>">
                            <cfif quote_rows[quote_row_index][column_ID].column_editable EQ 1 OR (quote_rows[quote_row_index][column_ID].row_order GT 55 AND (column_ID EQ 1 OR column_ID EQ 3 OR column_ID EQ 4 OR column_ID EQ 6))>
                                userinput
                            <cfelse>
                                <cfif quote_rows[quote_row_index][column_ID].row_formula NEQ ''>
                                    #quote_rows[quote_row_index][column_ID].row_formula#
                                <cfelse>
                                    <cfif quote_rows[quote_row_index][column_ID].row_defaultvalue NEQ ''>
                                        #quote_rows[quote_row_index][column_ID].row_defaultvalue#
                                    <cfelse>
                                        <cfif quote_rows[quote_row_index][column_ID].column_formula NEQ ''>
                                            #quote_rows[quote_row_index][column_ID].column_formula#
                                        <cfelse>
                                        </cfif>
                                    </cfif>
                                </cfif>
                            </cfif>
                        </td>
                    </cfloop>
                    <td align="center">#quote_rows[quote_row_index][column_ID].row_#</td>
                </tr>
                </cfoutput>
            </cfloop>
          </tbody>
        </table>
      </td>
    </tr>
  </table>

<!---input type="hidden" name="submitted" value="1">
<input type="submit" value="Save Changes"--->
</form>
<!--- END OUTPUT --->

<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>