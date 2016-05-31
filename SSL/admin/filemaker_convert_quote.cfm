<!--- UPDATE quote_start
      SET date_quote_deleted=GETUTCDATE()
      WHERE opportunity_id IN (1178) --->
<!--- SELECT * FROM quote_start
      ORDER BY ID DESC --->
<cfif IsDefined('form.project_id')>
    <cfset count = 0>
    <cfset fields_quote_services = ArrayNew(1)>
    <cfset fields_quote_materials = ArrayNew(1)>
    <cfloop collection=#form# item="elem">
        <cfif elem CONTAINS 'QUOTE_SERVICES' AND elem DOES NOT CONTAIN 'FILEMAKER'>
            <cfset count++>
            <cfset ArrayAppend(fields_quote_services, LCase(Replace(elem, "QUOTE_SERVICES_", "", "ALL")))>
        </cfif>
        <cfif elem CONTAINS 'QUOTE_MATERIALS' AND elem DOES NOT CONTAIN 'FILEMAKER'>
            <cfset count++>
            <cfset ArrayAppend(fields_quote_materials, LCase(Replace(elem, "QUOTE_MATERIALS_", "", "ALL")))>
        </cfif>
    </cfloop>

    <cfset app_jobs_query_string = '[Job ID] as job_id,
        [Wk Loc ID] as project_id,
        [Wk Location Name] as opportunity_name,
        [Service Address] as opportunity_field_2,
        [Service Address2] as opportunity_field_3,
        [Service City] as opportunity_field_4,
        [Service State] as opportunity_field_5,
        [Service Zip] as opportunity_field_6,
        [branch] as opportunity_field_1,
        [Responsible_User_Employee_ID] as responsible_user_id,
        [project_type] as opportunity_field_14,
        [billing_contact_name] as opportunity_field_20,
        [billing_contact_phone] as opportunity_field_21,
        [billing_contact_email_address] as opportunity_field_22,
        [billto_company_name] as opportunity_field_23,
        [Responsible_User_Employee_ID] as responsible_user_employee_id,
        [billing_address] opportunity_field_8,
        [billing_address2] opportunity_field_9,
        [billing_city] as opportunity_field_10,
        [billing_state] as opportunity_field_11,
        [billing_zip] as opportunity_field_12,
        CONVERT(varchar, [project_start_date], 121) as opportunity_field_18,
        CONVERT(varchar, [project_end_date], 121) as opportunity_field_19,
        [total_project_value] as bid_amount'>
    <cfset initial_project = StructNew()>
    <cfquery name="get_app_jobs_by_project_id" datasource="jrgm">
        SELECT #app_jobs_query_string#
        FROM app_jobs
        WHERE [Job ID] = '#form.project_id#'
    </cfquery>
    <cfif get_app_jobs_by_project_id.recordcount EQ 0>
        <cfoutput>COULD NOT FIND #form.project_id#</cfoutput>
        <cfabort>
    </cfif>
    <cfloop query="get_app_jobs_by_project_id">
        <cfset cols    = ListToArray(get_app_jobs_by_project_id.columnList)>
        <cfloop from="1" to="#arrayLen(cols)#" index="i">
          <cfset initial_project[cols[i]] = get_app_jobs_by_project_id[cols[i]][1]>
          <cfoutput>#cols[i]# = #initial_project[cols[i]]#<br /></cfoutput>
        </cfloop>
    </cfloop>

    <!--- ========================= clean the variables before putting them into the SQL query ======================== --->
    <cfset project_id = form.project_id>
    <cfset query_parameters = "">
    <cfset query_keys = "">

    <!--- ====================== build SQL insert query based on form POST variables ======================= --->
    <cfloop collection=#initial_project# item="form_element_name">
      <cfset field_name = LCase(form_element_name)>
      <cfif field_name neq "fieldnames" && field_name neq "submit_form_create_quote" && field_name neq "project_id" && field_name neq "job_id" && field_name neq "responsible_user_id">
        <cfset field_value = Replace(initial_project[form_element_name], "'", "''", "ALL")>
        <cfif field_name eq "bid_amount">
          <cfset field_value = Replace(Replace(field_value, "$", "", "ALL"), ",", "", "ALL")>
        </cfif>
        <cfif field_name eq "opportunity_name">
          <cfset field_value = '[FM] ' & field_value>
        </cfif>
        <cfif field_value eq "">
          <cfset query_parameters = query_parameters & field_name & "=NULL" & ", ">
          <cfelse>
          <cfset query_parameters = query_parameters & field_name & "='" & field_value & "'" & ", ">
        </cfif>
        <cfset query_keys = query_keys & field_name & ", ">
      </cfif>
    </cfloop>

    <!--- ===================== insert a new quote_start entry =================== --->
    <cfquery name="insert_quote_start" datasource="jrgm" result="result_insert_quote_start">
        INSERT INTO quote_start
        ([Job ID], quote_data_entry_versions_ID)
        VALUES (<cfqueryparam value="#project_id#"     CFSQLType="CF_SQL_VARCHAR">, 2)
    </cfquery>

    <!--- ===================== insert a new quote_main entry =================== --->
    <cfquery name="insert_quote_main" datasource="jrgm">
        INSERT INTO quote_main (opportunity_id,date_created, date_updated) VALUES ('#result_insert_quote_start["GENERATEDKEY"]#',GETUTCDATE(),GETUTCDATE())
    </cfquery>

    <!--- ===================== update the new quote_start entry with the rest of the data =================== --->
    <cfquery name="update_quote_start_remaining_data" datasource="jrgm">
        UPDATE quote_start
        SET #preserveSingleQuotes(query_parameters)#
            opportunity_state='OPEN',
            opportunity_id=ID
        WHERE ID=#result_insert_quote_start["GENERATEDKEY"]#
    </cfquery>

    <!--- ===================== update the new quote_start entry with the rest of the data =================== --->
    <cfquery name="update_app_jobs" datasource="jrgm">
        UPDATE app_jobs
        SET last_quote_id=#result_insert_quote_start["GENERATEDKEY"]#
        WHERE [Job ID]=<cfqueryparam value="#project_id#"     CFSQLType="CF_SQL_VARCHAR">
          AND (last_quote_id IS NULL OR last_quote_id=0)
    </cfquery>

    <!--- ===================== create a new quote_services entry ========================= --->
    <cfquery name="insert_quote_services" datasource="jrgm">
        INSERT INTO quote_services
        (quote_id,
            opportunity_id,
            gross_margin,
            travel_time_gm,
            lot_sweeping_gm,
            blank1_gm,
            blank2_gm,
            blank3_gm,
            blank4_gm,
            blank5_gm
            <cfloop from="1" to="#arrayLen(fields_quote_services)#" index="i">
                <cfoutput>, #fields_quote_services[i]#</cfoutput>
            </cfloop>
        )
        VALUES (<cfoutput>#result_insert_quote_start["GENERATEDKEY"]#</cfoutput>,
            <cfoutput>#result_insert_quote_start["GENERATEDKEY"]#</cfoutput>,
            57.000,
            0.00,
            0.00,
            0.00,
            0.00,
            0.00,
            0.00,
            0.00
            <cfloop from="1" to="#arrayLen(fields_quote_services)#" index="i">
                <cfoutput>, #form['QUOTE_SERVICES_' & UCase(fields_quote_services[i])]#</cfoutput>
            </cfloop>
        )
    </cfquery>

    <!--- ===================== create a new quote_materials entry ========================= --->
    <cfquery name="insert_quote_materials" datasource="jrgm">
        INSERT INTO quote_materials
        (quote_id,
            opportunity_id
            <cfloop from="1" to="#arrayLen(fields_quote_materials)#" index="i">
                <cfoutput>, #fields_quote_materials[i]#</cfoutput>
            </cfloop>
        )
        VALUES (<cfoutput>#result_insert_quote_start["GENERATEDKEY"]#</cfoutput>,
            <cfoutput>#result_insert_quote_start["GENERATEDKEY"]#</cfoutput>
            <cfloop from="1" to="#arrayLen(fields_quote_materials)#" index="i">
                <cfoutput>, #form['QUOTE_MATERIALS_' & UCase(fields_quote_materials[i])]#</cfoutput>
            </cfloop>
        )
    </cfquery>

    <cflocation url="/SSL/quoting-new/quote_data_entry.cfm?ID=#result_insert_quote_start["GENERATEDKEY"]#">
</cfif>