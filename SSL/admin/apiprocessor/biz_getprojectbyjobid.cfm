<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = '|'>

<!--- ======= get Biz project by Job ID for use in API /biz portal ======= --->
<cfif IsDefined('form.Job_ID')>
    <cfset form['Job ID'] = form.Job_ID>
</cfif>
<cfif structKeyExists(form, 'Job ID')>
    <cfquery name="main_query" datasource="jrgm">
        SELECT *, [Job ID] as Job_ID, [Wk Loc ID] as Wk_Loc_ID, [Wk Location Name] as Wk_Location_Name, [Service Address] as Service_Address, [Service Address2] as Service_Address2, [Service City] as Service_City, [Service State] as Service_State, [Service Zip] as Service_Zip FROM dbo.app_jobs
        WHERE [Job ID]=<cfqueryparam value="#form['Job ID']#" CFSQLType="CF_SQL_TEXT">
    </cfquery>
    <!--- should only be 1 result --->
    <cfloop query="main_query">
        <cfset output_str = output_str & Wk_Loc_ID & '|' & Wk_Location_Name & '|' & Service_Address & '|' & Service_Address2 & '|' & Service_City & '|' & Service_State & '|' & Service_Zip & '|' & branch & '|' & Status & '|' & project_details & '|' & project_type & '|' & responsible_user_Employee_ID & '|' & sales_contact_Employee_ID & '|' & billto_company_name & '|' & billing_contact_name & '|' & billing_contact_phone & '|' & billing_contact_email_address & '|' & billing_address & '|' & billing_address2 & '|' & billing_city & '|' & billing_state & '|' & billing_zip & '|' & project_start_date & '|' & project_end_date & '|' & total_project_value & '|' & irrigation_services_included & '|' & department & '|' & Spray_Tech_ID & '|' & Irrigation_Tech_ID>
    </cfloop>
</cfif>
<cfinclude template="include_output.cfm">