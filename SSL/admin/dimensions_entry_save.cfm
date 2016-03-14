<cfif IsDefined('form.quote_start_id') AND IsDefined('form.id') AND IsDefined('form.values') AND (IsDefined('form.total') OR (IsDefined('form.ot_total') AND IsDefined('form.slope_total')))>
    <cfif IsDefined('form.is_new_dimensions') EQ 1>
        <cfquery name="get_quote_services_dimensions" datasource="jrgm">
            SELECT *
            FROM quote_services_dimensions
            where quote_start_id=#form.quote_start_id#
        </cfquery>
        <cfif get_quote_services_dimensions.recordcount EQ 0>
            <cfquery name="insert_quote_services_dimensions" datasource="jrgm">
                INSERT INTO quote_services_dimensions
                (date_created, quote_start_id)
                VALUES (GETUTCDATE(), #form.quote_start_id#)
            </cfquery>
        </cfif>
    </cfif>

    <cfquery name="update_quote_services_dimensions" datasource="jrgm">
        UPDATE quote_services_dimensions
        SET #form.id#=<cfqueryparam value="#form.values#"     CFSQLType="CF_SQL_TEXT">,
            <cfif form.id EQ 'ot_slope'>
                ot_total=#form.ot_total#,
                slope_total=#form.slope_total#,
            <cfelse>
                #form.id#_total=#form.total#,
            </cfif>
            date_updated=GETUTCDATE(),
            user_id=#SESSION.userid#
        WHERE quote_start_id=<cfqueryparam value="#form.quote_start_id#"     CFSQLType="CF_SQL_INT">
    </cfquery>
    Saved.
</cfif>