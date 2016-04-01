<cfif !IsDefined('form.id')>
    An error occurred.  Please refresh this page and try again.
    <cfabort>
</cfif>
<cfset url.id = form.id>

<cfinclude template="../quoting-new/include_cffunctions.cfm">
<cfinclude template="../quoting-new/include_sql_quote_data_entry_calculations.cfm">
<cfinclude template="../quoting-new/include_sql_latest_version.cfm">

<cfoutput>
The following changes will be made to this Quote:!br!
</cfoutput>
<cfset foundonechange = 0>
<cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
    <cfset foundone = 0>
    <cfset quote_row_index = row_order_array[wrapi]>
    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
        <cfset current_row = quote_rows[quote_row_index][i]>
        <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
        <cfloop collection=#current_row# item="quote_row_field">
            <cftry>
                <cfif current_row[quote_row_field] NEQ quote_rows_temp[quote_row_index][i][quote_row_field]>
                    <cfset foundone = 1>
                    <cfset foundonechange = 1>
                </cfif>
            <cfcatch>
            </cfcatch>
            </cftry>
        </cfloop>
    </cfloop>
    <cfif foundone EQ 1>
        <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
            <cfset current_row = quote_rows[quote_row_index][i]>
            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
            <cfset service_name_index = 1>
            <cfset material_name_index = 8>
            <cfset row_label = quote_rows[quote_row_index][service_name_index]['row_defaultvalue']>
            <cfif i GT 7 AND quote_rows[quote_row_index][material_name_index]['row_defaultvalue'] NEQ ''>
                <cfset row_label = row_label & ' > ' & quote_rows[quote_row_index][material_name_index]['row_defaultvalue']>
            </cfif>
            <cfset row_label = row_label & ' [' & current_column.column_name & ']'>
            <cfloop collection=#current_row# item="quote_row_field">
                <cftry>
                    <cfif current_row[quote_row_field] NEQ quote_rows_temp[quote_row_index][i][quote_row_field]>
<cfoutput>#row_label#: #current_row[quote_row_field]# => #quote_rows_temp[quote_row_index][i][quote_row_field]#!br!!br!</cfoutput>
                    </cfif>
                <cfcatch>
                </cfcatch>
                </cftry>
            </cfloop>
        </cfloop>
    </cfif>
</cfloop>
Click OK to update this Quote.  Otherwise, click Cancel.!br!!br!