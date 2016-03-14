<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter='|'>

<!--- ======= get recently modified projects to see if any Insightly/Intacct projects have been changed outside of Biz ======= --->
<cfquery name="main_query" datasource="jrgm">
    SELECT *, [Job ID] as Job_ID, [Wk Loc ID] as Wk_Loc_ID, [Wk Location Name] as Wk_Location_Name, [Service Address] as Service_Address, [Service Address2] as Service_Address2, [Service City] as Service_City, [Service State] as Service_State, [Service Zip] as Service_Zip FROM dbo.app_jobs
    <cfif IsDefined('form.last_modified_date')>
        <cfif form.last_modified_date NEQ ''>
            WHERE last_modified_date>=<cfqueryparam value="#form.last_modified_date#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
    <cfif structKeyExists(form, 'Wk Loc ID')>
        <cfif form['Wk Loc ID'] NEQ ''>
            WHERE [Wk Loc ID]=<cfqueryparam value="#form['Wk Loc ID']#" CFSQLType="CF_SQL_TEXT">
        </cfif>
    </cfif>
</cfquery>
<cfset cv = 0>
<cfloop query="main_query">
    <cfif cv GT 0>
        <cfset output_str = output_str & multi_delimiter>
    </cfif>
    <cfset output_str = output_str & Job_ID & '^' & Wk_Loc_ID & '^' & Wk_Location_Name & '^' & Service_Address & '^' & Service_Address2 & '^' & Service_City & '^' & Service_State & '^' & Service_Zip & '^' & branch & '^' & Status & '^' & project_details & '^' & project_type & '^' & responsible_user_Employee_ID & '^' & sales_contact_Employee_ID & '^' & billto_company_name & '^' & billing_contact_name & '^' & billing_contact_phone & '^' & billing_contact_email_address & '^' & billing_address & '^' & billing_address2 & '^' & billing_city & '^' & billing_state & '^' & billing_zip & '^' & project_start_date & '^' & project_end_date & '^' & total_project_value & '^' & irrigation_services_included & '^' & department & '^' & last_modified_date>
    <cfset cv++>
</cfloop>

<cfinclude template="include_output.cfm">