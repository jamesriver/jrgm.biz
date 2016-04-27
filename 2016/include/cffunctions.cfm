<!--- GLOBAL FUNCTIONS --->
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

<cfscript>
    function preg_match(regex,str) {
    	var results = arraynew(1);
    	var match = "";
    	var x = 1;
    	if (REFind(regex, str, 1)) {
    		match = REFind(regex, str, 1, TRUE);
    		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
    			if(match.len[x])
    				results[x] = mid(str, match.pos[x], match.len[x]);
    			else
    				results[x] = '';
    		}
    	}
    	return results;
    }

    function getRowID(str) {
        return REReplace(str, "[^A-Za-z]", "", "ALL");
    }

    function getSQLField(str) {
        var matches = preg_match('"(.*?)"', str);
        return matches[1];
    }

    function getSQLToDuplicateRow(table_name, quote_start_data, quote_start_fields_raw)
    {
        var quote_start_fields = ArrayNew(1);
        var quote_start_values = '';
        for (i = 1; i lte arrayLen(quote_start_fields_raw); i = i + 1) {
            var field = quote_start_fields_raw[i];
            if (field NEQ 'ID') {
                ArrayAppend(quote_start_fields, '[' & field & ']');
                var value = quote_start_data[field];
                if (value EQ '')
                    value = "NULL";
                else if (value CONTAINS "{ts")
                    value = value;
                else
                    value = "'" & Replace(value, "'", "''", "ALL") & "'";
                if (quote_start_values NEQ '')
                    quote_start_values = quote_start_values & ',';
                quote_start_values = quote_start_values & value;
            }
        }
        return 'INSERT INTO ' & table_name & ' (' & ArrayToList(quote_start_fields) & ') VALUES (' & quote_start_values & ')';
    }

    function showErrorMessage(type, message)
    {
        switch(type) {
            case 'post':
                return Replace(message, '|FORMACTION|', FORM.formAction, 'ALL');
                break;
            case 'query':
                return Replace(Replace(message, '|QUERYNAME|', query_name, 'ALL'), '|ERRORDESCRIPTION|', error_description, 'ALL');
                break;
            default:
                return message;
                break;
        }
    }
</cfscript>