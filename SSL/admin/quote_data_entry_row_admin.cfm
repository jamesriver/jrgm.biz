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

<cfinclude template="../quoting-new/include_cffunctions.cfm">

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
    SELECT qder.* FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE (qdeh.column_active=1 OR qdeh.column_visibleonspecsheet > 0)
    <cfif IsDefined('url.ids')><cfoutput>AND qdeh.ID IN (#url.ids#)</cfoutput></cfif>
    ORDER BY qder.row_order, qdeh.column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
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
<form method="post">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
          <thead>
            <tr>
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfoutput>
                        <th align="left">(#quote_column_headers[i].ID#) #quote_column_headers[i].column_name#</th>
                    </cfoutput>
                </cfloop>
            </tr>
          </thead>
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfset quote_row_index = row_order_array[wrapi]>
                <tr>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <td>
                            <cfset current_row = quote_rows[quote_row_index][i]>
                            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                            <table border="1">
                            <cfloop collection=#current_row# item="quote_row_field">
                                <cfif quote_row_field NEQ 'ID'><!--- AND quote_row_field EQ 'QUOTE_SERVICES_FIELD' OR quote_row_field EQ 'ROW_DEFAULTVALUE' OR quote_row_field EQ 'ROW_ACTIVE'>--->
                                    <cfoutput>
                                    <tr>
                                        <td>#quote_row_field#</td>
                                        <td><input name="#current_row.ID#_#quote_row_field#" value="#encodeForHTML(current_row[quote_row_field])#" onChange="saveInput(#current_row.ID#, '#quote_row_field#', this.value)"></td>
                                    </tr>
                                    </cfoutput>
                                </cfif>
                            </cfloop>
                            </table>
                        </td>
                    </cfloop>
                </tr>
            </cfloop>
          </tbody>
        </table>
      </td>
    </tr>
  </table>
<!---input type="hidden" name="submitted" value="1">
<input type="submit" value="Save Changes"--->
</form>

  <script>
    function saveInput(id, field, value)
    {
        $.ajax({
            url: 'quote_data_entry_row_admin_save.cfm',
            type: 'post',
            data: { 'id': id, 'field': field, 'value': value },
            success: function(data) {
            }
        });
    }
  </script>
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