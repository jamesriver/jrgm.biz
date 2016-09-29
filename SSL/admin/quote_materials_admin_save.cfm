<cfif IsDefined('form.action') AND IsDefined('form.id') AND IsDefined('form.value')>
    <cfif form.action EQ 'item'>
        <cfquery name="update_quote_materials_cost" datasource="jrgm">
            UPDATE quote_materials_cost
            SET #form.field#='#Replace(form.value, "'", "''", "ALL")#'
            WHERE ID=<cfqueryparam value="#form.id#"     CFSQLType="CF_SQL_INT">
        </cfquery>
        <!---cfoutput>
            UPDATE quote_materials_cost
            SET Item_Cost='#Replace(form.value, "'", "''", "ALL")#'
            WHERE ID=#form.id#
        </cfoutput--->
    <cfelseif form.action EQ 'mat'>
        <cfquery name="update_app_materials_list" datasource="jrgm">
            UPDATE app_materials_list
            SET #form.field#='#Replace(form.value, "'", "''", "ALL")#'
            WHERE ID=<cfqueryparam value="#form.id#"     CFSQLType="CF_SQL_INT">
        </cfquery>
        <!---cfoutput>
            UPDATE app_materials_list
            SET #form.field#='#Replace(form.value, "'", "''", "ALL")#'
            WHERE ID=#form.id#
        </cfoutput--->
    </cfif>
</cfif>