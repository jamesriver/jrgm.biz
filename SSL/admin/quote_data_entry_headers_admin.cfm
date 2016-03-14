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
        <cfset query_string = 'UPDATE quote_data_entry_headers SET '>
        <cfset count = 0>
        <cfloop collection=#row_iterator[row]# item="field">
            <cfif count NEQ 0>
                <cfset query_string = query_string & ', '>
            </cfif>
            <cfset query_string = query_string & field & ' = ' & row_iterator[row][field]>
            <cfset count++>
        </cfloop>
        <cfset query_string = query_string & ' WHERE ID = ' & row>
        <cfquery name="update_quote_data_entry_headers" datasource="jrgm">
            #preserveSingleQuotes(query_string)#
        </cfquery>
    </cfloop>
    <cflocation url="quote_data_entry_headers_admin.cfm">
</cfif>

<cfinclude template="../quoting-new/include_cffunctions.cfm">

<!--- GET QUOTE COLUMN HEADERS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT * FROM quote_data_entry_headers
    ORDER BY column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_column_headers = QueryToStruct(get_quote_column_headers)>
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>

<!--- BEGIN OUTPUT --->
<form method="post">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
            <tbody>
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfset row_ID = quote_column_headers[i].ID>
                    <tr>
                        <td colspan="2"><hr /><br /><cfoutput>ID=#row_ID#</cfoutput></td>
                    </tr>
                    <cfloop collection=#quote_column_headers[i]# item="column_header">
                        <cfif column_header NEQ 'ID'>
                            <tr>
                                <td><cfoutput>#column_header#</cfoutput></td>
                                <td><input name="<cfoutput>#row_ID#_#column_header#</cfoutput>" value="<cfoutput>#quote_column_headers[i][column_header]#</cfoutput>"></td>
                            </tr>
                        </cfif>
                    </cfloop>
                </cfloop>
            </tbody>
            <!---
            <cfloop collection=#quote_rows# item="quote_row_index">
                <tr>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <td>
                            <cfset current_row = quote_rows[quote_row_index][i]>
                            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                            <cfif current_column.column_editable GT 0>
                                <cfoutput><input id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" onChange="recalculate()" /></cfoutput>
                            <cfelse>
                                <cfoutput><span id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                            </cfif>
                        </td>
                    </cfloop>
                </tr>
            </cfloop>
            --->
        </table>
      </td>
    </tr>
  </table>
  <input type="hidden" name="submitted" value="1">
  <input type="submit" value="Save Changes">
</form>

  <script>
  </script>
<!--- END OUTPUT --->