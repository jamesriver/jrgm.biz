<cfif IsDefined('form.id') AND IsDefined('form.value')>
    <cfquery name="update_quote_materials_cost" datasource="jrgm">
        UPDATE quote_materials_cost
        SET Item_Cost='#Replace(form.value, "'", "''", "ALL")#'
        WHERE ID=<cfqueryparam value="#form.id#"     CFSQLType="CF_SQL_INT">
    </cfquery>
    <!---cfoutput>
        UPDATE quote_materials_cost
        SET Item_Cost='#Replace(form.value, "'", "''", "ALL")#'
        WHERE ID=#form.id#
    </cfoutput--->
</cfif>