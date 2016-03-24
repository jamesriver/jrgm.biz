<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = '|'>

<!--- ======= insert new Insightly Opportunity into Biz ======= --->
<cfset insertKeysHeader_Master = ['[Job ID]','[Wk Loc ID]','[Wk Location Name]','[Service Address]','[Service Address2]','[Service City]','[Service State]','[Service Zip]','active_record','branch','Status','irrigation','project_details','project_type','responsible_user_Employee_ID','billing_contact_name','billing_contact_phone','billing_contact_email_address','billing_address','billing_address2','billing_city','billing_state','billing_zip','project_start_date','project_end_date','total_project_value','irrigation_services_included','department','billto_company_name']>
<cfset insertKeys_Master = ['Job ID','Wk Loc ID','Wk Location Name','Service Address','Service Address2','Service City','Service State','Service Zip','active_record','branch','Status','irrigation','project_details','project_type','responsible_user_Employee_ID','billing_contact_name','billing_contact_phone','billing_contact_email_address','billing_address','billing_address2','billing_city','billing_state','billing_zip','project_start_date','project_end_date','total_project_value','irrigation_services_included','department','billto_company_name']>
<cfset keepgoing = 1>
<cfset cv = 0>
<cfloop condition="keepgoing EQ 1 AND cv LT 50">
    <cfset insertKeysHeader = insertKeysHeader_Master>
    <cfset insertKeys = insertKeys_Master>
    <cfif structKeyExists(form, cv & '_last_quote_id')>
        <cfset ArrayAppend(insertKeysHeader, 'last_quote_id')>
        <cfset ArrayAppend(insertKeys, 'last_quote_id')>
    </cfif>
    <cfset insertList = ArrayToList(insertKeysHeader, ", ")>
    <cfif structKeyExists(form, cv & '_Job ID') AND structKeyExists(form, cv & '_project_start_date') AND structKeyExists(form, cv & '_project_end_date')>
        <cfquery name="main_query" datasource="jrgm">
            SELECT * FROM dbo.app_jobs
            WHERE [Job ID]=<cfqueryparam value="#form[cv & '_Job ID']#" CFSQLType="CF_SQL_TEXT">
        </cfquery>
        <cfif main_query.recordcount EQ 0>
            <!---cfoutput>
                INSERT INTO dbo.app_jobs
                (#insertList#)
                VALUES (
                    <cfloop from="1" to="#arrayLen(insertKeys)#" index="i">
                        <cfif i GT 1>
                            ,
                        </cfif>
                        <cfset iKey = insertKeys[i]>
                        <cfif iKey EQ 'active_record' OR iKey EQ 'irrigation' OR iKey EQ 'department'>
                            #iKey# = #form[cv & '_' & iKey]#
                        <cfelse>
                            #iKey# = '#form[cv & '_' & iKey]#'
                        </cfif>
                    </cfloop>
                )
            </cfoutput>
            <cfabort--->
            <cfquery name="insert_query" datasource="jrgm">
                INSERT INTO dbo.app_jobs
                (#insertList#)
                VALUES (
                    <cfloop from="1" to="#arrayLen(insertKeys)#" index="i">
                        <cfif i GT 1>
                            ,
                        </cfif>
                        <cfset iKey = insertKeys[i]>
                        <cfif iKey EQ 'active_record' OR iKey EQ 'irrigation' OR iKey EQ 'department'>
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
            <cfset output_str = output_str & "[" & form[cv & '_Job ID'] & "] " & form[cv & '_Wk Location Name']>
        </cfif>
    <cfelse>
        <cfset keepgoing = 0>
    </cfif>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">