<cfinclude template="include_authorization.cfm">

<!--- ======= get Biz Materials Costs ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT * FROM quote_materials_cost
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Item_ID & '|' & Item_Cost>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">