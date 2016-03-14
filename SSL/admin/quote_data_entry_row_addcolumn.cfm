<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows" datasource="jrgm">
    SELECT qder.* FROM quote_data_entry_row qder
    WHERE quote_data_entry_headers_ID=2
</cfquery>
<cfset count_row_order = 0>

UPDATE quote_services
SET opportunity_id=opportunity_id
<cfloop query="get_quote_rows">
    <cfoutput>
    , #Replace(get_quote_rows.quote_services_field, '_qty', '_hoursperocc', 'ALL')#=#get_quote_rows.quote_services_field#/nullif(#Replace(get_quote_rows.quote_services_field, '_qty', '_rate', 'ALL')#, 0)
    </cfoutput>
</cfloop>
WHERE opportunity_id=7714265

<!---
<cfloop query="get_quote_rows">
    <cfset count_row_order++>
    <cfset SQL_field = Replace(get_quote_rows.quote_services_field, '_qty', '_hoursperocc', 'ALL')>
    <cfoutput>
        ALTER TABLE dbo.quote_services ADD #SQL_field# decimal(18,1) NULL;
        <br />
        UPDATE dbo.quote_data_entry_row SET quote_services_field='#SQL_field#' WHERE quote_data_entry_headers_ID=5 AND row_order=#count_row_order#;
        <br />
    </cfoutput>
</cfloop>
--->

<!---
<cfloop query="get_quote_rows">
    <cfset count_row_order++>
    <cfset SQL_field = Replace(get_quote_rows.quote_services_field, '_qty', '_hoursperocc', 'ALL')>
    <cfoutput>
        UPDATE dbo.quote_data_entry_row SET quote_services_field_specsheet='#SQL_field#' WHERE quote_data_entry_headers_ID=5 AND row_order=#count_row_order#;
        <br />
    </cfoutput>
</cfloop>
--->

<!---
<cfloop query="get_quote_rows">
    <cfset count_row_order++>
    <cfset SQL_field = Replace(get_quote_rows.quote_services_field, '_qty', '_hoursperocc', 'ALL')>
    <cfoutput>
        , #SQL_field#
    </cfoutput>
</cfloop>
--->