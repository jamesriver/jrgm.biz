<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= insert new Insightly Opportunity into Biz ======= --->
<cfif IsDefined('form.cron')>
    <cfinclude template="../../quoting-new/include_cffunctions.cfm">

    <cfquery name="check_quote_materials_admin" datasource="jrgm">
        SELECT qma.Item_Desc FROM quote_materials_admin qma
        LEFT JOIN quote_materials_cost qmc ON qmc.Item_ID=qma.Item_Desc
        WHERE qmc.Item_ID IS NULL
        GROUP BY qma.Item_DESC
    </cfquery>
    <cfloop query="check_quote_materials_admin">
        <cfquery name="update_from_quote_materials_admin" datasource="jrgm">
            INSERT INTO quote_materials_cost
            (Item_ID)
            VALUES
            (<cfqueryparam value="#Item_Desc#"     CFSQLType="CF_SQL_TEXT">)
        </cfquery>
        <cfset output_str = output_str & '|||' & Item_Desc>
    </cfloop>

    <cfquery name="check_app_job_materials_actual" datasource="jrgm">
        SELECT ajma.Item_ID FROM app_job_materials_actual ajma
        LEFT JOIN quote_materials_cost qmc ON qmc.Item_ID=ajma.Item_ID
        WHERE qmc.Item_ID IS NULL
        GROUP BY ajma.Item_ID
    </cfquery>
    <cfloop query="check_app_job_materials_actual">
        <cfquery name="update_from_app_job_materials_actual" datasource="jrgm">
            INSERT INTO quote_materials_cost
            (Item_ID)
            VALUES
            (<cfqueryparam value="#Item_ID#"     CFSQLType="CF_SQL_TEXT">)
        </cfquery>
        <cfset output_str = output_str & '|||' & Item_ID>
    </cfloop>
    
    <cfquery name="check_app_materials_list" datasource="jrgm">
        SELECT aml.Item_ID FROM app_materials_list aml
        LEFT JOIN quote_materials_cost qmc ON qmc.Item_ID=aml.Item_ID
        WHERE qmc.Item_ID IS NULL
        GROUP BY aml.Item_ID
    </cfquery>
    <cfloop query="check_app_materials_list">
        <cfquery name="update_from_app_materials_list" datasource="jrgm">
            INSERT INTO quote_materials_cost
            (Item_ID)
            VALUES
            (<cfqueryparam value="#Item_ID#"     CFSQLType="CF_SQL_TEXT">)
        </cfquery>
        <cfset output_str = output_str & '|||' & Item_ID>
    </cfloop>
</cfif>

<cfinclude template="include_output.cfm">