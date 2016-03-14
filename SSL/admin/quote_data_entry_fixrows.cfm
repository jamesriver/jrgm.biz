<cfquery name="get_hour_rows" datasource="jrgm">
    SELECT * FROM quote_data_entry_row
    WHERE quote_data_entry_headers_ID IN (5)
</cfquery>
<cfloop query="get_hour_rows">
    <cfoutput>
        UPDATE quote_data_entry_row SET quote_services_field='#get_hour_rows.quote_services_field#' WHERE ID=#(get_hour_rows.ID+11)#;
        <br />
        UPDATE quote_data_entry_row SET quote_services_field=NULL WHERE ID=#(get_hour_rows.ID)#;
        <br />
    </cfoutput>
</cfloop>

