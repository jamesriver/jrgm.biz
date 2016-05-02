<cfif !IsDefined('url.ID')>
    FAILED - no ID detected
    <cfabort>
</cfif>
<cfif url.ID EQ ''>
    FAILED - no ID detected
    <cfabort>
</cfif>

<cfif IsDefined('form.update_version')>
    <cfinclude template="../quoting-new/include_sql_latest_version.cfm">

    <cfset quote_services_parameters = ''>
    <cfset quote_materials_parameters = ''>
    <cfset last_sql_field = ''>

    <cfloop from="1" to="#arrayLen(row_order_array_temp)#" index="wrapi">
        <cfset quote_row_index = row_order_array_temp[wrapi]>
        <cfloop from="1" to="#arrayLen(quote_rows_temp[quote_row_index])#" index="i">
            <cfset current_row = quote_rows_temp[quote_row_index][i]>
            <cfset current_column = quote_column_headers_temp[quote_column_ID_index_temp[current_row.quote_data_entry_headers_ID]]>
            <cfif current_column.column_editable NEQ 1 AND current_column.column_formula EQ ''>
                <cfloop collection=#current_row# item="quote_row_field">
                    <cfset sql_field = ''>
                    <cfif (quote_row_field EQ 'QUOTE_SERVICES_FIELD' OR quote_row_field EQ 'QUOTE_SERVICES_FIELD_SPECSHEET') AND quote_rows_temp[quote_row_index][i][quote_row_field] NEQ ''>
                        <cfset sql_field = quote_rows_temp[quote_row_index][i][quote_row_field]>
                    </cfif>
                    <cfif sql_field NEQ '' AND sql_field NEQ last_sql_field>
                        <cfset last_sql_field = sql_field>
                        <cfif sql_field DOES NOT CONTAIN 'blank' AND sql_field DOES NOT CONTAIN '_qty'>
                            <cfset param = quote_rows_temp[quote_row_index][i][quote_row_field] & '=' & quote_rows_temp[quote_row_index][i]['ROW_DEFAULTVALUE']>
                            <cfif sql_field DOES NOT CONTAIN '_materials_'>
                                <cfif quote_services_parameters NEQ ''>
                                    <cfset quote_services_parameters = quote_services_parameters & ','>                                    
                                </cfif>
                                <cfset quote_services_parameters = quote_services_parameters & param>
                            <cfelse>
                                <cfif quote_materials_parameters NEQ ''>
                                    <cfset quote_materials_parameters = quote_materials_parameters & ','>                                    
                                </cfif>
                                <cfset quote_materials_parameters = quote_materials_parameters & param>
                            </cfif>
                        </cfif>
                    </cfif>
                </cfloop>
            </cfif>
        </cfloop>
    </cfloop>

    <!---
    <cfoutput>
        UPDATE quote_start
        SET quote_data_entry_versions_ID=#version_ID#
        WHERE opportunity_id=#url.id#
    </cfoutput>
    <br />
    <cfoutput>
        UPDATE quote_services
        SET #PreserveSingleQuotes(quote_services_parameters)#
        WHERE opportunity_id=#url.id#
    </cfoutput>
    <br />
    <cfoutput>
        UPDATE quote_materials
        SET #PreserveSingleQuotes(quote_materials_parameters)#
        WHERE opportunity_id=#url.id#
    </cfoutput>
    <cfabort>
    --->

    <cfquery name="update_quote_start" datasource="jrgm">
        UPDATE quote_start
        SET quote_data_entry_versions_ID=#version_ID#
        WHERE opportunity_id=#url.id#
    </cfquery>
    <cfquery name="update_quote_services" datasource="jrgm">
        UPDATE quote_services
        SET #PreserveSingleQuotes(quote_services_parameters)#
        WHERE opportunity_id=#url.id#
    </cfquery>
    <cfquery name="update_quote_materials" datasource="jrgm">
        UPDATE quote_materials
        SET #PreserveSingleQuotes(quote_materials_parameters)#
        WHERE opportunity_id=#url.id#
    </cfquery>
    <cflocation url="quote_data_entry.cfm?ID=#url.id#&mustsave=1" />
    <cfabort>
</cfif>

<cfif IsDefined('form.contract_installments')>
    <!--- ========================= clean the variables before putting them into the SQL query ======================== --->
    <cfset opportunity_id = form.opportunity_id>
    <cfset query_quote_start_parameters = "">
    <cfset query_quote_services_parameters = "">
    <cfset query_quote_materials_parameters = "">
    <cfset query_quote_main_parameters = "">
    <cfset query_parameters = "">

    <!--- ====================== build SQL insert query based on form POST variables ======================= --->
    <cfloop collection=#form# item="form_element_name">
      <cfset query_parameters = "">
      <cfset field_name = LCase(form_element_name)>
      <cfif field_name neq "fieldnames" AND field_name neq 'submittedform'>
        <cfset field_value = Replace(form[form_element_name], "'", "''", "ALL")>
        <cfif field_name EQ 'Job_ID'>
            <cfset query_quote_start_parameters = query_quote_start_parameters & '[Job ID]' & "='" & field_value & "', ">
        <cfelse>
            <cfif field_name CONTAINS 'date' OR field_name CONTAINS '_unit' OR field_name CONTAINS '_service'>
                <cfif field_value eq "">
                  <cfset query_parameters = query_parameters & field_name & "=NULL, ">
                <cfelse>
                  <cfif field_name CONTAINS 'date'>
                    <cfset query_parameters = query_parameters & field_name & "='" & dateformat(field_value,"yyyy-mm-dd") & "', ">
                  <cfelse>
                    <cfset query_parameters = query_parameters & field_name & "='" & field_value & "', ">
                  </cfif>
                </cfif>
                <cfset query_quote_services_parameters = query_quote_services_parameters & query_parameters>
                <cfif field_name EQ 'contract_start_date' OR field_name EQ 'contract_end_date'>
                    <cfset query_quote_main_parameters = query_quote_main_parameters & query_parameters>
                </cfif>
            <cfelse>
                <cfif field_name CONTAINS 'opportunity' OR field_name CONTAINS '_contract_price' OR field_name CONTAINS '_Contract' OR field_name CONTAINS '_sqft'>
                    <cfif field_name CONTAINS '_contract_price' OR field_name CONTAINS '_Contract' OR field_name CONTAINS '_sqft'>
                        <cfif field_value eq "">
                          <cfset query_quote_main_parameters = query_quote_main_parameters & field_name & "=0.00" & ", ">
                        <cfelse>
                          <cfset query_quote_main_parameters = query_quote_main_parameters & field_name & "=" & field_value & "" & ", ">
                        </cfif>
                    </cfif>
                <cfelse>
                    <cfif field_value eq "">
                      <cfset query_parameters = query_parameters & field_name & "=0.00" & ", ">
                    <cfelse>
                      <cfset query_parameters = query_parameters & field_name & "=" & field_value & "" & ", ">
                    </cfif>
                    <cfif field_name CONTAINS 'materials'>
                        <cfset query_quote_materials_parameters = query_quote_materials_parameters & query_parameters>
                    <cfelse>
                        <cfif field_name CONTAINS '_approved'>
                        <cfelse>
                            <cfset query_quote_services_parameters = query_quote_services_parameters & query_parameters>
                        </cfif>
                    </cfif>
                    <cfif field_name EQ 'contract_installments' OR field_name EQ 'contract_adjustment' OR field_name EQ 'discount_adjustment'>
                        <cfset query_quote_main_parameters = query_quote_main_parameters & query_parameters>
                    </cfif>
                </cfif>
            </cfif>
        </cfif>
      </cfif>
    </cfloop>

    <!---cfoutput>
        UPDATE quote_main
        SET #preserveSingleQuotes(query_quote_main_parameters)#
            opportunity_id=opportunity_id
        WHERE opportunity_id=#opportunity_id#
    </cfoutput>
    <cfabort--->

    <!--- Quote Main Insert --->
    <cfquery name="check_for_quote_main" datasource="jrgm">
        SELECT opportunity_id FROM quote_main  WHERE  opportunity_id =#opportunity_id#
    </cfquery>
    <cfif check_for_quote_main.recordcount EQ 0>
      <cfquery name="insert_quote_main" datasource="jrgm">
        INSERT INTO quote_main (opportunity_id,date_created, date_updated, user_id) VALUES ('#opportunity_id#',GETUTCDATE(),GETUTCDATE(),'#SESSION.userid#')
     </cfquery>
     <cfquery name="update_quote_start" datasource="jrgm">
        UPDATE quote_start SET
        date_quote_started = GETUTCDATE(),
        date_quote_updated = GETUTCDATE(),
        user_id =  '#SESSION.userid#'
        WHERE opportunity_id = #opportunity_id#
     </cfquery>
     <cfquery name="insert_quote_services" datasource="jrgm">
        INSERT INTO quote_services (opportunity_id) VALUES ('#opportunity_id#')
     </cfquery>
     <cfquery name="insert_quote_materials" datasource="jrgm">
        INSERT INTO quote_materials (opportunity_id) VALUES ('#opportunity_id#')
     </cfquery>
    </cfif>

    <cfquery name="update_quote_start" datasource="jrgm">
        <cfoutput>
            UPDATE quote_start
            SET #preserveSingleQuotes(query_quote_start_parameters)#
                opportunity_field_18='#dateformat(form.contract_start_date, "yyyy-mm-dd")#',
                opportunity_field_19='#dateformat(form.contract_end_date, "yyyy-mm-dd")#',
                bid_amount='#form.adjusted_contract_price#'
            WHERE opportunity_id=#opportunity_id#
        </cfoutput>
    </cfquery>
    <cfquery name="update_quote_main" datasource="jrgm">
        <cfoutput>
            UPDATE quote_main
            SET #preserveSingleQuotes(query_quote_main_parameters)#
                opportunity_id=opportunity_id
            WHERE opportunity_id=#opportunity_id#
        </cfoutput>
    </cfquery>
    <cfquery name="update_quote_services" datasource="jrgm">
        <cfoutput>
            UPDATE quote_services
            SET #preserveSingleQuotes(query_quote_services_parameters)#
                opportunity_id=opportunity_id
            WHERE opportunity_id=#opportunity_id#
        </cfoutput>
    </cfquery>
    <cfquery name="update_quote_services_hoursperocc" datasource="jrgm">
        <cfoutput>
            UPDATE quote_services SET opportunity_id=opportunity_id , push_mow_hoursperocc=push_mow_qty/nullif(push_mow_rate, 0) , walk_behind_hoursperocc=walk_behind_qty/nullif(walk_behind_rate, 0) , ride_mow_hoursperocc=ride_mow_qty/nullif(ride_mow_rate, 0) , hard_edge_hoursperocc=hard_edge_qty/nullif(hard_edge_rate, 0) , bed_edge_hoursperocc=bed_edge_qty/nullif(bed_edge_rate, 0) , trim_o_hoursperocc=trim_o_qty/nullif(trim_o_rate, 0) , trim_s_hoursperocc=trim_s_qty/nullif(trim_s_rate, 0) , spraying_hoursperocc=spraying_qty/nullif(spraying_rate, 0) , weeding_hoursperocc=weeding_qty/nullif(weeding_rate, 0) , blowing_hoursperocc=blowing_qty/nullif(blowing_rate, 0) , trash_s_hoursperocc=trash_s_qty/nullif(trash_s_rate, 0) , traveltime_hoursperocc=traveltime_qty/nullif(traveltime_rate, 0) , trash_o_hoursperocc=trash_o_qty/nullif(trash_o_rate, 0) , leafrem_hoursperocc=leafrem_qty/nullif(leafrem_rate, 0) , cleanup_hoursperocc=cleanup_qty/nullif(cleanup_rate, 0) , turf_preg_hoursperocc=turf_preg_qty/nullif(turf_preg_rate, 0) , turf_prel_hoursperocc=turf_prel_qty/nullif(turf_prel_rate, 0) , turf_post_hoursperocc=turf_post_qty/nullif(turf_post_rate, 0) , turf_fert_hoursperocc=turf_fert_qty/nullif(turf_fert_rate, 0) , turf_lime_hoursperocc=turf_lime_qty/nullif(turf_lime_rate, 0) , turf_aer_h_hoursperocc=turf_aer_h_qty/nullif(turf_aer_h_rate, 0) , turf_aer_t_hoursperocc=turf_aer_t_qty/nullif(turf_aer_t_rate, 0) , turf_seed_hoursperocc=turf_seed_qty/nullif(turf_seed_rate, 0) , Turf_nutsedge_hoursperocc=Turf_nutsedge_qty/nullif(Turf_nutsedge_rate, 0) , Turf_fungicide_hoursperocc=Turf_fungicide_qty/nullif(Turf_fungicide_rate, 0) , Turf_insecticide_hoursperocc=Turf_insecticide_qty/nullif(Turf_insecticide_rate, 0) , pruning_tp_hoursperocc=pruning_tp_qty/nullif(pruning_tp_rate, 0) , pruning_s_hoursperocc=pruning_s_qty/nullif(pruning_s_rate, 0) , TS_Fert_hoursperocc=TS_Fert_qty/nullif(TS_Fert_rate, 0) , TS_Insect_hoursperocc=TS_Insect_qty/nullif(TS_Insect_rate, 0) , TS_hort_oil_hoursperocc=TS_hort_oil_qty/nullif(TS_hort_oil_rate, 0) , Mulch_pre_hoursperocc=Mulch_pre_qty/nullif(Mulch_pre_rate, 0) , Mulch_edging_hoursperocc=Mulch_edging_qty/nullif(Mulch_edging_rate, 0) , Mulch_s_dyed_hoursperocc=Mulch_s_dyed_qty/nullif(Mulch_s_dyed_rate, 0) , Mulch_f_dyed_hoursperocc=Mulch_f_dyed_qty/nullif(Mulch_f_dyed_rate, 0) , Mulch_S_Reg_hoursperocc=Mulch_S_Reg_qty/nullif(Mulch_S_Reg_rate, 0) , Mulch_F_Reg_hoursperocc=Mulch_F_Reg_qty/nullif(Mulch_F_Reg_rate, 0) , Playground_mulch_hoursperocc=Playground_mulch_qty/nullif(Playground_mulch_rate, 0) , Pine_Tags_hoursperocc=Pine_Tags_qty/nullif(Pine_Tags_rate, 0) , Annuals_S_hoursperocc=Annuals_S_qty/nullif(Annuals_S_rate, 0) , Annuals_F_hoursperocc=Annuals_F_qty/nullif(Annuals_F_rate, 0) , Irrigation_SU_hoursperocc=Irrigation_SU_qty/nullif(Irrigation_SU_rate, 0) , Irrigation_W_hoursperocc=Irrigation_W_qty/nullif(Irrigation_W_rate, 0) , Irrigation_I_hoursperocc=Irrigation_I_qty/nullif(Irrigation_I_rate, 0) , Irrigation_TM_hoursperocc=Irrigation_TM_qty/nullif(Irrigation_TM_rate, 0) , Irrigation_BFI_hoursperocc=Irrigation_BFI_qty/nullif(Irrigation_BFI_rate, 0) , Pond_maint_hoursperocc=Pond_maint_qty/nullif(Pond_maint_rate, 0) , Trim_Hillside_hoursperocc=Trim_Hillside_qty/nullif(Trim_Hillside_rate, 0) , Addtl_Mowing_hoursperocc=Addtl_Mowing_qty/nullif(Addtl_Mowing_rate, 0) , Day_Porter_hoursperocc=Day_Porter_qty/nullif(Day_Porter_rate, 0) , Bush_Hog_hoursperocc=Bush_Hog_qty/nullif(Bush_Hog_rate, 0) , Trail_Maint_hoursperocc=Trail_Maint_qty/nullif(Trail_Maint_rate, 0) , Natural_Area_hoursperocc=Natural_Area_qty/nullif(Natural_Area_rate, 0) , Trash_Receptacle_hoursperocc=Trash_Receptacle_qty/nullif(Trash_Receptacle_rate, 0) , Lot_Sweeping_hoursperocc=Lot_Sweeping_qty/nullif(Lot_Sweeping_rate, 0) , blank1_hoursperocc=blank1_qty/nullif(blank1_rate, 0) , blank2_hoursperocc=blank2_qty/nullif(blank2_rate, 0) , blank3_hoursperocc=blank3_qty/nullif(blank3_rate, 0)
            WHERE opportunity_id=#opportunity_id#
        </cfoutput>
    </cfquery>
    <cfquery name="update_quote_materials" datasource="jrgm">
        <cfoutput>
            UPDATE quote_materials
            SET #preserveSingleQuotes(query_quote_materials_parameters)#
                opportunity_id=opportunity_id
            WHERE opportunity_id=#opportunity_id#
        </cfoutput>
    </cfquery>

    <cfif IsDefined('form.opportunity_name') AND IsDefined('form.opportunity_state')>
      <cfquery name="update_quote_start" datasource="jrgm">
        UPDATE quote_start SET
        date_quote_updated = GETUTCDATE(),
        user_id =  '#SESSION.userid#',
        opportunity_name = <cfqueryparam value="#form.opportunity_name#"     CFSQLType="CF_SQL_VARCHAR">,
        opportunity_state = <cfqueryparam value="#form.opportunity_state#"     CFSQLType="CF_SQL_VARCHAR">
        WHERE opportunity_id = #opportunity_id#
        </cfquery>
    <cfelse>
      <cfquery name="update_quote_start" datasource="jrgm">
            UPDATE quote_start SET
            date_quote_updated = GETUTCDATE(),
            user_id =  '#SESSION.userid#'
            WHERE opportunity_id = #opportunity_id#
        </cfquery>
    </cfif>
    <cflocation url="quote_data_entry.cfm?ID=#opportunity_id#" />
</cfif>

<cfinclude template="../quoting-new/include_cffunctions.cfm">
<cfinclude template="../quoting-new/include_sql_quote_data_entry_calculations.cfm">

<!--- FORCE EDIT AN APPROVED QUOTE --->
<cfset force_edit = 1>
<!---cfif IsDefined('url.edit')>
    <cfset force_edit = 1>
</cfif--->

<!--- GET LIST OF JOBS TO SHOW ASSOCIATION --->
<cfquery name="get_all_jobs" datasource="jrgm"  >
    SELECT aj.[Job ID] as Job_ID, aj.[Wk Location Name] as Project_Name, aj.Status FROM app_jobs aj
    WHERE (aj.Status='IN PROGRESS'
      AND aj.branch='#get_quote_start.q_branch#') OR aj.[Job ID]='#get_quote_start.job_id#'
    ORDER BY aj.[Wk Location Name]
</cfquery>
<cfset active_jobs = ArrayNew(1)>
<cfloop query="get_all_jobs">
    <cfset ArrayAppend(active_jobs, [Job_ID, Project_Name, Status])>
</cfloop>

<!--- APPROVE QUOTE --->
<cfif IsDefined("url.quote_approved") AND get_quote_start.quote_approved NEQ 1>
  <cfhttp url="http://api.jrgm.com/external_api/insightly.php?auth=jrgmAPI!&type=contractapproved&quote_id=#get_quote_start.ID#" method="get" result="httpResp" timeout="30">
  </cfhttp>
  <!---cfoutput>http://api.jrgm.com/external_api/insightly.php?auth=jrgmAPI!&type=contractapproved&quote_id=#get_quote_start.ID#<br /></cfoutput>
  <cfdump var="#httpResp.filecontent#">
  <cfabort--->

  <cfquery name="get_new_job" datasource="jrgm">
      SELECT [Job ID] as Job_ID FROM app_jobs
      WHERE last_quote_id=#get_quote_start.ID#
  </cfquery>
  <cfif get_new_job.recordcount GT 0>
      <cfloop query="get_new_job">
          <cfquery name="update_quote_start" datasource="jrgm">
              UPDATE quote_start SET
              date_quote_updated = GETUTCDATE(),quote_approved =1,biz_approved_date = GETUTCDATE(),
              opportunity_state='WON',
              user_id =  '#SESSION.userid#',
              [Job ID] = '#get_new_job.Job_ID#'
              WHERE opportunity_id = #url.id#
          </cfquery>
          <cfquery name="update_quote_main" datasource="jrgm">
              UPDATE quote_main SET
              date_updated = GETUTCDATE(), quote_approved =1,
              user_id =  '#SESSION.userid#'
              WHERE opportunity_id = #url.id#
          </cfquery>

          <cfmail from="alerts@jrgm.com" to="quotingapproval@jrgm.com" subject="JRGM Quote Approved" type="html">
              <style type="text/css">
             .arialfont {
            font: normal .9em Arial, Helvetica, sans-serif;
             }
            </style>
              <span class="arialfont">Quote ID: #url.id# for #get_quote_start.opportunity_name# has been approved in jrgm.biz.<br />
              <br />
              Please review the Intacct record for accuracy.</span><br />
              <br />
          </cfmail>
      </cfloop>
  <cfelse>
      Something went wrong!  Please contact Ben Chan @ benchanviolin@gmail.com to find out why.
      <cfabort>
  </cfif>

  <cflocation url="quote_data_entry.cfm?ID=#url.id#" />
</cfif>

<!--- ////////////////////////////////////////////////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ///////////////////////// CREATE HTML PAGE /////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ////////////////////////////////////////////////////////////////////// --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />
<link href="css/styles_pricing_sheet_1.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style type="text/css">
.noMargin {
	margin: -2px;
}
.headbig {
	font-size: 14px;
	font-weight: bold;
}
.th {
	border: thick;
	border-bottom: thin
}
i.mysize {
	font-size: 14px;
	font-weight: bold
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="../quoting-new/header-include.cfm">
  <div class="page-header-menu">
    <div class="container-fluid">
      <div id="hor-menu-default" class="hor-menu"> </div>
    </div>
  </div>
</div>
<!-- END HEADER SECTION -->
<div class="page-head">
  <div class="container-fluid">
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>Quote Pricing Sheet</h1>
    </div>
    <cfoutput>
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
         <li class="active"><i class="fa fa-circle"></i> <a href="quote_data_entry_specsheet.cfm?ID=#url.id#"  target="_blank">Spec Sheet</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="ServicesSummary.cfm?ID=#url.id#"  target="_blank">Summary(MSS)</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="definition_of_services.cfm?ID=#url.id#"  target="_blank">Services(DOS)</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="ContractTerms.cfm?ID=#url.id#"  target="_blank">Terms</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href=""  target="_blank">All Contract Docs</a></li>
        </ul>
      </div>
    </cfoutput></div>
</div>

<form id="form_updateversion" method="post">
 <input type="hidden" name="update_version" value="1">
 <input type="hidden" name="opportunity_id" value="#url.id#">
</form>

<div class="page-content">
  <div class="container-fluid">
    <form   name="quoteform" method="post" action="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" onSubmit="return validate()">
      <div class="button-boxer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_data_entry_print.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success blue-chambray" target="_blank">Print Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" target="_blank">Dimensions Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.id#&opportunity_id=#url.id#</cfoutput>" class="btn btn-success purple" >Notes</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="hidden" name="submittedForm" value="1">
        <input type="hidden" name="opportunity_id" value="<cfoutput>#url.id#</cfoutput>">
        <cfif get_quote_start.quote_approved NEQ 1 OR force_edit EQ 1>
            <input type="submit" class="btn btn-primary" id="btnSumit" value="Save Changes"/>
        </cfif>
      </div>
      <br />
      <br />
      <div class="container-table"
      <cfif get_quote_start.quote_approved EQ 1 AND force_edit EQ 0>
        style="pointer-events: none"
      </cfif>
      >
        <div class="left-table">
        <cfoutput query="get_quote_start">
          <cfset curated_opportunity_id = 0>
          <cfif opportunity_id_original GT 0>
            <cfset curated_opportunity_id = opportunity_id_original>
          <cfelse>
              <cfif opportunity_id GT 999999>
                <cfset curated_opportunity_id = opportunity_id>
              </cfif>
          </cfif>
          <table class="table">
            <tr>
              <td>Quote ID : </td>
              <td>
                #opportunity_id#
                <cfif get_quote_start.quote_approved EQ 1>
                    <font color=##00AA00><b>APPROVED ON #dateformat(get_quote_start.biz_approved_date,"mm/dd/yyyy")#</b></font>
                </cfif>
              </td>
              <td>&nbsp;</td>
              <td>Branch : #q_branch#</td>
              <td><!---#opportunity_state#---></td>
            </tr>
            <tr>
              <td>Customer : </td>
              <td colspan="4">
                <!--input name="opportunity_name" value="#opportunity_name#" size="35"  class="form-control"-->
                #opportunity_name#
              </td>
            </tr>
            <tr>
              <td>Job Location : </td>
              <td colspan="4">#q_address1#, <cfif q_address2 NEQ ''>#q_address2#, </cfif>#q_city#, #q_address_state#, #q_address_zip#</td>
            </tr>
            <tr>
              <td>Estimator :</td>
              <td colspan="4">#SESSION.screenname#</td>
            </tr>
            <tr>
              <td>Quote Status : </td>
              <td>
                #UCASE(opportunity_state)#
              </td>
              <td>&nbsp;</td>
              <cfif curated_opportunity_id NEQ 0>
                  <td><a href="https://googleapps.insight.ly/Opportunities/Details/#curated_opportunity_id#"  target="_blank">Insightly Link</a></td>
              </cfif>
              <cfif quote_approved NEQ 1>
                <td><a href="quote_edit_opportunity.cfm?ID=#opportunity_id#"  target="_blank">Edit Quote Information</a></td>
              </cfif>
            </tr>
          </table>
          </div>
          <div class="right-table">
          <table class="table">
            <tr>
              <td  nowrap="nowrap">Date Opportunty Created : #dateformat(date_created_utc,"mm/dd/yyyy")#</td>
              <td>&nbsp;</td>
              <td  nowrap="nowrap">Date Opportunty Modified : #dateformat(date_updated_utc,"mm/dd/yyyy")#</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Date Quote Created : #dateformat(date_quote_started,"mm/dd/yyyy")#</td>
              <td>&nbsp;</td>
              <td>Date Quote Modified : #dateformat(date_quote_updated,"mm/dd/yyyy")#</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td  nowrap="nowrap">Contract Start Date :
                <input name="contract_start_date" type="text" class="form_buttons" id="contract_start_date"  size="10"  value="#dateformat(get_quote_services.contract_start_date,"mm/dd/yyyy")#"/></td>
              <td>&nbsp;</td>
              <td nowrap="nowrap"   colspan="2"  align="left">Contract End Date :
                <input name="contract_end_date" type="text" class="form_buttons" id="contract_end_date"  size="10"  value="#dateformat(get_quote_services.contract_end_date,"mm/dd/yyyy")#"/>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments :
                <input name="contract_installments" type="text" class="form_buttons" id="contract_installments"  size="2"  value="#get_quote_services.contract_installments#" oninput="recalculate_totals()" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td  nowrap="nowrap">Annual Contract Price :  <span class="adjusted_contract_price_formatted"></span></td>
              <td>&nbsp;</td>
              <td nowrap="nowrap">Monthly Contract Price :  <span id="monthly_contract_price_formatted"></span></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Calculations Version: #version_ID# (created #dateformat(version_date_created,"mm/dd/yyyy")#)</td>
              <td>&nbsp;</td>
              <td colspan="4">Associated Project:
                <select name="Job_ID">
                    <option value="0">[ Create a new one when quote is approved ]</option>
                    <cfloop from="1" to="#arrayLen(active_jobs)#" index="i">
                        <option value="#active_jobs[i][1]#"<cfif get_quote_start.job_id EQ active_jobs[i][1]> selected</cfif>>#active_jobs[i][2]#<cfif LCase(active_jobs[i][3]) NEQ 'in progress'> (#active_jobs[i][3]#)</cfif></option>
                    </cfloop>
                </select>
              </td>
            </tr>
            <cfif (get_quote_start.quote_approved NEQ 1 OR force_edit EQ 1) AND highest_version_ID GT version_ID>
                <tr>
                    <td colspan="6">
                        <span style="color: ##00AA00">(optional) New Calculations Version: #highest_version_ID# (created #dateformat(highest_version_date_created,"mm/dd/yyyy")#) is available!</span>  <input id="btn_previewversionupdate" type="button" value="Preview Update">&nbsp;<span id="icon_ajaxloading" style="display: none"><i>Loading... please wait.</i></span>
                    </td>
                </tr>
            </cfif>
          </table>
        </cfoutput></div>

<!--- BEGIN OUTPUT --->
  <table width="98%" border="0" cellspacing="0" cellpadding="0"
  <cfif get_quote_start.quote_approved EQ 1 AND force_edit EQ 0>
      style="pointer-events: none"
  </cfif>
  >
    <tr>
      <td valign="top">
        <table class="table table-striped" cellpadding="5" cellspacing="0">
          <thead>
           <tr>
             <th colspan="2"   align="left" bgcolor="#FFFFFF"  bordercolor="#000000">&nbsp;<strong class="headbig">Service</strong></th>
             <th colspan="5" align="center"  bgcolor="#FFFFFF"><strong class="headbig">Labor</strong></th>
             <th colspan="5" align="center" bgcolor="#FFFFFF"><strong class="headbig">Materials</strong></th>
             <th width="25">&nbsp;</th>
             <th colspan="7" align="center" bgcolor="#FFFFFF"><strong class="headbig">Totals</strong></th>
           </tr>
            <tr bgcolor="#EDF3F8">
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfif quote_column_headers[i].column_active EQ 1>
                        <th align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><cfoutput>#quote_column_headers[i].column_name#</cfoutput></th>
                        <cfif i EQ 9>
                            <th align="left">Formula</th>
                        </cfif>
                    </cfif>
                </cfloop>
            </tr>
          </thead>
          <cfoutput>
          <tbody>
            <tr>
                <td align="right" colspan="#(total_columns+3)#"><!--i>Profit Margin must be greater than 50%</i--></td>
                <td align="right"><input id="gross_margin" name="gross_margin" oninput="apply_profit_margin(this.value)" size="6" value="#get_quote_main.gross_margin#"></td>
                <td align="left">&nbsp;</td>
            </tr>
            <cfset alternator = 1>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfset quote_row_index = row_order_array[wrapi]>
                <cfset tr_class = (alternator % 2?' bgcolor="##e5e5e5"':'')>
                <cfset alternator = 1-alternator>
                <tr #tr_class#>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <cfset current_row = quote_rows[quote_row_index][i]>
                        <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                        <cfif current_column.column_active EQ 1>
                            <cfif current_row.row_active EQ 1>
                                <td align="#quote_column_headers[i].column_displayalign#">
                                    <cfif current_column.ID EQ 20>
                                        <span class="column#current_column.ID#" id="row#current_row.ID#">#current_row.row_defaultvalue#</span>
                                        <input class="column#current_column.ID# #current_row.quote_services_field# subtotal#current_row.row_order# totaltype_#current_row.row_totaltype#" type="hidden" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#">
                                    <cfelse>
                                        <cfif current_row.quote_services_field NEQ ''>
                                            <cfif (current_column.column_editable EQ 1 AND (current_column.ID NEQ 18 OR current_row.row_defaultvalue NEQ 40)) OR (current_row.row_order GT 55 AND (current_column.ID EQ 1 OR current_column.ID EQ 3 OR current_column.ID EQ 4 OR current_column.ID EQ 6))>
                                                <input class="column#current_column.ID#" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" oninput="recalculate_row#quote_row_index#(); recalculate_totals();" />
                                            <cfelse>
                                                <input disabled="true" class="column#current_column.ID# #current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" />
                                                <input type="hidden" class="column#current_column.ID# #current_row.quote_services_field# totaltype_#current_row.row_totaltype#" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" value="#current_row.row_defaultvalue#" />
                                            </cfif>
                                        <cfelse>
                                            <span class="column#current_column.ID#" id="row#current_row.ID#">#current_row.row_defaultvalue#</span>
                                            <input class="column#current_column.ID# totaltype_#current_row.row_totaltype#" type="hidden" id="row#current_row.ID#_numeric" value="#current_row.row_defaultvalue#">
                                        </cfif>
                                    </cfif>
                                </td>
                            <cfelse>
                                <td align="#quote_column_headers[i].column_displayalign#"><span class="column#current_column.ID#" id="row#current_row.ID#"></span></td>
                                <input type="hidden" class="column#current_column.ID#" id="row#current_row.ID#_numeric" value="0"></td>
                            </cfif>
                            <cfif current_column.ID EQ 9>
                                <td align="left">#Replace(current_row.row_formula, '[2]', '[Qty/SqFt]', 'ALL')#</td>
                            </cfif>
                        </cfif>
                    </cfloop>
                </tr>
            </cfloop>
            <tr bgcolor="##EDF3F8">
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                        <cfset current_column = quote_column_headers[i]>
                        <cfif current_column.column_active EQ 1>
                            <cfif current_column.ID EQ 1 OR current_column.ID EQ 2>
                                <cfif current_column.ID EQ 1>
                                    <th align="#current_column.column_displayalign#" colspan="2">
                                        Totals (Unadjusted)
                                    </th>
                                </cfif>
                            <cfelse>
                                <cfif current_column.ID EQ 6 OR current_column.ID EQ 7 OR current_column.ID EQ 5>
                                    <cfif current_column.ID EQ 6>
                                        <th align="left" colspan="2">
                                            Seasonal Hours
                                        </th>
                                        <th></th>
                                    <cfelse>
                                        <cfif current_column.ID EQ 5>

                                                <th align="#current_column.column_displayalign#">
                                                    <span id="seasonal_hours_formatted"></span>
                                                </th>

                                        </cfif>
                                    </cfif>
                                <cfelse>
                                    <th align="#current_column.column_displayalign#">
                                    <cfif current_column.column_totalable EQ 1>

                                            <span class="total#current_column.ID#"></span>

                                    <cfelse>
                                        <cfif current_column.column_totalable EQ 2>

                                                <span class="avg#current_column.ID#"></span>

                                        <cfelse>
                                            &nbsp;
                                        </cfif>
                                    </cfif>
                                </cfif>
                            </cfif>
                        </cfif>
                    </th>
                </cfloop>
            </tr>            
            <tr>
                <td align="right" colspan="#total_columns#">&nbsp;</td>
                <td align="right" colspan="4"><a href="quote_notes.cfm?opportunity_id_original=#url.id#&opportunity_id=#url.id#&note_type=5"><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp; <strong>Contract Adjustment</strong></td>
                <td align="left">
                  <input id="contract_adjustment" name="contract_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
            </tr>
            <tr>
                <td align="left" colspan="#total_columns#">
                    <table>
                        <tr>
                            <td>Turf Sq. Footage:&nbsp;</td>
                            <td><input  name="turf_sqft"  type="text" size="5"  value="#get_quote_main.turf_sqft#" /></td>
                            <td width="100">&nbsp;</td>
                            <td>Bed Sq. Footage:&nbsp;</td>
                            <td><input  name="bed_sqft"  type="text" size="5"  value="#get_quote_main.bed_sqft#" /></td>
                            <td width="100">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td align="right" colspan="4"><a href="quote_notes.cfm?opportunity_id_original=#url.id#&opportunity_id=#url.id#&note_type=6"><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp; <strong>Discount Adjustment</strong></td>
                <td align="left">
                  <input id="discount_adjustment" name="discount_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
            </tr>
            <tr bgcolor="##EDF3F8" style="font-weight: bold">
                <td align="right" colspan="#total_columns#">&nbsp;</td>
                <td align="right" colspan="4"><strong>Total Adjusted Contract Price</strong></td>
                <td align="left">
                  <span class="adjusted_contract_price_formatted" style="font-weight: bold" /></span>
                </td>
            </tr>
            </cfoutput>
            <input type="hidden" id="total_contract_price" name="total_contract_price">
          </tbody>
        </table>
      </td>
    </tr>
  </table>

  <cfinclude template="../quoting-new/include_js_quote_data_entry_calculations.cfm">
<!--- END OUTPUT --->

<script>
    function init_before()
    {
        var ajax_locked = false;
        $(document).ready(function(){
            $('#btn_previewversionupdate').click(function(){
                ajax_locked = true;
                $('#icon_ajaxloading').show();
                $.ajax({
                    url: 'quote_data_entry_previewversionupdate.cfm',
                    type: 'post',
                    data: { 'id': <cfoutput>#url.id#</cfoutput> },
                    success: function(data) {
                        ajax_locked = false;
                        $('#icon_ajaxloading').hide();
                        if (confirm(data.trim().replace(new RegExp('!br!', 'g'), '\n'))) {
                            $('#form_updateversion').submit();
                        }
                    }
                });
            });
        });

        <cfif IsDefined('url.mustsave')>
            alert('PLEASE SAVE THIS QUOTE IMMEDIATELY RIGHT NOW TO APPLY ALL THE NEW CALCULATIONS TO THE DATABASE.  FAILURE TO DO SO WILL RESULT IN OUTDATED CALCULATIONS IN OTHER PAGES.');
        </cfif>
    }
</script>

<table   width="98%"border="0" cellspacing="0" cellpadding="0"
<cfif get_quote_start.quote_approved EQ 1 AND force_edit EQ 0>
    style="pointer-events: none"
</cfif>
>
        <tr>
          <td><table class="table"  >
              <cfoutput>
                <tr>
                  <td colspan="2" align="center" nowrap="nowrap"><strong>CONTRACT INFO</strong></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td colspan="2" align="center" nowrap="nowrap"><strong>BILLING INFO</strong></td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Suggested Contract Price</td>
                  <td align="right" nowrap="nowrap"><span class="total20"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Grounds Maintenance Contract</td>
                  <td  align="right" nowrap="nowrap"><span id="grounds_maintenance_contract_formatted"></span><input type="hidden" id="Grounds_Maintenance_Contract" name="Grounds_Maintenance_Contract"></td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Contract Adjustment</td>
                  <td align="right" nowrap="nowrap"><span id="contract_adjustment_formatted"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Irrigation Contract</td>
                  <td  align="right" nowrap="nowrap"><span id="irrigation_contract_formatted"></span><input type="hidden" id="Irrigation_Contract" name="Irrigation_Contract"></td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Discount Adjustment</td>
                  <td align="right" nowrap="nowrap"><span id="discount_adjustment_formatted"></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap"><strong>Total Adjusted Contract Price</strong></td>
                  <td align="right" nowrap="nowrap"><strong><span class="adjusted_contract_price_formatted"></span></strong><input type="hidden" id="adjusted_contract_price" name="adjusted_contract_price"></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Bill To Company</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td align="right" nowrap="nowrap"></td>
                  <td width="150" align="right" nowrap="nowrap"></td>
                  <td>Billing Contact</td>
                  <td align="right" nowrap="nowrap"></td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Total Labor</td>
                  <td align="right" nowrap="nowrap"><span id="total_labor_formatted" class="total14"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing Contact Phone</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Total Materials</td>
                  <td align="right" nowrap="nowrap"><span id="total_materials_formatted"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Billing Contact Email Address</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap"><strong>Total Direct Costs</strong></td>
                  <td align="right" nowrap="nowrap"><strong><span id="total_direct_costs_formatted"></span></strong></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td align="right" nowrap="nowrap"></td>
                  <td width="150" align="right" nowrap="nowrap"></td>
                  <td>Billing Address</td>
                  <td align="right" nowrap="nowrap"></td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Gross Profit</td>
                  <td align="right" nowrap="nowrap"><span id="gross_profit_formatted"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing Address2</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">OH Recovery (40%)</td>
                  <td align="right" nowrap="nowrap"><span id="margin_formatted"></span></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing City </td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap"><strong>Operating Profit</strong></td>
                  <td align="right" nowrap="nowrap"><strong><span id="operating_profit_formatted"></span></strong></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing State</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Operating Profit %</td>
                  <td align="right" nowrap="nowrap"><span id="net_cash_flow_percentage_formatted"></span></td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing Zip</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                  <td width="150"  align="right" nowrap="nowrap">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
              </cfoutput>
            </table>
            <p>&nbsp;</p></td>
          <td  width="60%">&nbsp;</td>
          <td align="top"><br />
            <br />
            <br />
            <br />
            <div class="container-buttons">
              <div class="left-buttons">
                <cfif get_quote_start.quote_approved EQ 1>
                    <cfoutput>
                        <font color=##00AA00><b>APPROVED #dateformat(get_quote_start.biz_approved_date,"mm/dd/yyyy")#</b></font>
                    </cfoutput>
                <cfelse>
                    <cfif get_quote_main.recordcount NEQ 0>
                        <cfoutput>

                            <a class="btn btn-warning" href="quote_data_entry_approve_contract.cfm?ID=#url.id#">Preview Contract Approval</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="button-box"><a href="create_duplicate_quote.cfm?ID=#url.id#" class="btn btn-success" >Duplicate this Quote</a> </div>
                        </cfoutput>
                    </cfif>
                </cfif>
              </div>
            </div>
            </td>
        </tr>
      </table>
    </form>
    <table width="95%" border="0">
          <tbody>
            <tr   bgcolor="#EDF3F8">
              <td height="50" valign="bottom"><H2>NOTES: </H2></td>
            </tr>
          </tbody>
        </table>
        <br />
        <cfquery name="get_all_notes"   datasource="jrgm">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         quote_notes WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id#
    </cfquery>
        <table width="95%" border="0">
          <!--tbody>
            <tr    bgcolor="#EDF3F8">
              <td><strong>Developer Notes : (Temporary, will be removed prior to production)</strong></td>
            </tr>
            <tr>
              <td valign="top"><p> Ben: Is Billing Contact Info done like this? <br />
                  /ssl/admin/project_Edit_Project_Information.cfm?ProjectID=J3769-316</p></td>
            </tr>
          </tbody>
        </table>
        <br /-->
        <cfquery name="get_all_notes_5"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 5
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Contract Adjustment Notes: </strong></td>
            </tr>
            <CFIF get_all_notes_5.recordcount GT 0>
              <cfoutput query="get_all_notes_5">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Contract Adjustment Notes</td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <cfquery name="get_all_notes_6"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 6
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Discount Adjustment  Notes: </strong></td>
            </tr>
            <CFIF get_all_notes_6.recordcount GT 0>
              <cfoutput query="get_all_notes_6">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Discount Adjustment Notes</td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <cfquery name="get_all_notes_1"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 1
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Billing Notes: </strong></td>
            </tr>
            <CFIF get_all_notes_1.recordcount GT 0>
              <cfoutput query="get_all_notes_1">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Billing Notes</td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <cfquery name="get_all_notes_2"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 2
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Quote Notes :</strong></td>
            </tr>
            <CFIF get_all_notes_2.recordcount GT 0>
              <cfoutput query="get_all_notes_2">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Quote Notes </td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <cfquery name="get_all_notes_3"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 3
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Spec Sheet Notes :</strong></td>
            </tr>
            <CFIF get_all_notes_3.recordcount GT 0>
              <cfoutput query="get_all_notes_3">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Spec Sheet Notes</td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <cfquery name="get_all_notes_4"  dbtype="query">
        SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
    FROM         get_all_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 4
    </cfquery>
        <table width="95%" border="0"  >
          <tbody>
            <tr      bgcolor="#EDF3F8">
              <td height="30" colspan="3"><strong>Proposal/Contract Notes</strong></td>
            </tr>
            <CFIF get_all_notes_4.recordcount GT 0>
              <cfoutput query="get_all_notes_4">
                <tr>
                  <td valign="top">#dateformat(note_date,"mm/dd/yyyy")#</td>
                  <td valign="top" width="20">&nbsp;</td>
                  <td valign="top" align="left">#note_body#</td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img  src="images/clear.png" width="100%" height="5" alt=""/></td>
                </tr>
                <tr>
                  <td valign="top" colspan="3"><img src="../images/dkgrey.gif" width="100%" height="2" alt=""/></td>
                </tr>
              </cfoutput>

                <cfelse>
              <tr>
                <td valign="top" colspan="3">No Proposal/Contract Notes</td>

              </tr>
            </cfif>

            <td></tbody>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
      </div>
    </div>
<!--Html-->
</div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="../quoting-new/footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/admin/pages/scripts/table-advanced2.js"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   ComponentsPickers.init();

});
</script>
</body>
<!-- END BODY -->
</html>
