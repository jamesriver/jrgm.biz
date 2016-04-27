<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = '|'>

<!--- ======= insert new Insightly Opportunity into Biz ======= --->
<cfset insertKeys = ['opportunity_id','opportunity_name','opportunity_state','bid_amount','opportunity_field_1','opportunity_field_18','opportunity_field_19','stage_id','date_created_utc','bid_currency','bid_type','bid_duration','pipeline_id','opportunity_field_2','opportunity_field_3','opportunity_field_4','opportunity_field_5','opportunity_field_6','opportunity_field_14','date_due_utc','date_updated_utc','opportunity_details','probability','responsible_user_Employee_ID','opportunity_field_7','opportunity_field_8','opportunity_field_9','opportunity_field_10','opportunity_field_11','opportunity_field_12','opportunity_field_15','opportunity_field_16','opportunity_field_17','opportunity_field_20','opportunity_field_21','opportunity_field_22','opportunity_field_23','category_id']>
<cfset insertList = ArrayToList(insertKeys, ", ")>
<cfset keepgoing = 1>
<cfset cv = 0>
<cfloop condition="keepgoing EQ 1 AND cv LT 50">
    <cfif structKeyExists(form, cv & '_opportunity_id')>
        <cfquery name="main_query" datasource="jrgm">
            SELECT * FROM dbo.quote_start
            WHERE opportunity_id=<cfqueryparam value="#form[cv & '_opportunity_id']#" CFSQLType="CF_SQL_NUMERIC">
        </cfquery>
        <cfif main_query.recordcount EQ 0>
            <!---cfoutput>
                INSERT INTO dbo.quote_start
                (#insertList#)
                VALUES (
                    <cfloop from="1" to="#arrayLen(insertKeys)#" index="i">
                        <cfif i GT 1>
                            ,
                        </cfif>
                        <cfif insertKeys[i] EQ 'responsible_user_Employee_ID' OR insertKeys[i] EQ 'opportunity_id'>
                            #form[cv & '_' & insertKeys[i]]#
                        <cfelse>
                            '#form[cv & '_' & insertKeys[i]]#'
                        </cfif>
                    </cfloop>
                )
            </cfoutput>
            <cfabort--->
            <cfquery name="insert_query" datasource="jrgm">
                INSERT INTO dbo.quote_start
                (#insertList#)
                VALUES (
                    <cfloop from="1" to="#arrayLen(insertKeys)#" index="i">
                        <cfif i GT 1>
                            ,
                        </cfif>
                        <cfif insertKeys[i] EQ 'opportunity_id'>
                            <cfqueryparam value="#form[cv & '_' & insertKeys[i]]#" CFSQLType="CF_SQL_NUMERIC">
                        <cfelse>
                            <cfqueryparam value="#form[cv & '_' & insertKeys[i]]#" CFSQLType="CF_SQL_TEXT">
                        </cfif>
                    </cfloop>
                )
            </cfquery>
            <cfif cv GT 0>
                <cfset output_str = output_str & multi_delimiter>
            </cfif>
            <cfset output_str = output_str & "[" & form[cv & '_opportunity_id'] & "] " & form[cv & '_opportunity_name']>
        </cfif>
    <cfelse>
        <cfset keepgoing = 0>
    </cfif>
    <cfset cv++>
</cfloop>

<cfquery name="fixer_query" datasource="jrgm">
    UPDATE quote_start
    SET quote_data_entry_versions_ID=3
    WHERE quote_data_entry_versions_ID=1
</cfquery>

<cfinclude template="include_output.cfm">