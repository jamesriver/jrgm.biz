<!--- ======= get project info from database ======= --->
<cfquery name="get_project_info" datasource="jrgm">
SELECT [Job ID] AS ProjectID, last_quote_id, branch
FROM app_jobs  WHERE [Job ID] ='#ProjectID#'
</cfquery>

<!--- ======= get active quotes for dropdown ======= --->
<cfset activequotes = ArrayNew(1)>
<cfquery name="get_active_quotes" datasource="jrgm">
SELECT qs.ID, qs.opportunity_name, qs.opportunity_id, qm.adjusted_contract_price, qm.contract_installments FROM quote_start qs
INNER JOIN quote_main qm ON qm.opportunity_id=qs.opportunity_id
WHERE qs.opportunity_field_1=<cfqueryparam value="#get_project_info.branch#"     CFSQLType="CF_SQL_VARCHAR">
  AND qs.date_quote_deleted IS NULL
ORDER BY qs.opportunity_name
</cfquery>

<!--- ======= start output ======= --->
<select name="last_quote_id">
<option value="0">[ No Quote ]</option>
<cfset last_quote = StructNew()>
<cfloop query="get_active_quotes">
    <option value="<cfoutput>#get_active_quotes.ID#</cfoutput>"><cfoutput>#get_active_quotes.opportunity_name#</cfoutput> [<cfoutput>#get_active_quotes.opportunity_id#</cfoutput>]: $<cfoutput>#get_active_quotes.adjusted_contract_price#</cfoutput></option>
</cfloop>
</select>