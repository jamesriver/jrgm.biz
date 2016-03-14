<!--- <cfset tempvariable = StructClear(session)>  
 --->
<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet" />
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION -->
<div class="page-head">
  <div class="container-fluid">
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>JRGM Duplicate Quote </h1>
    </div>
    <!-- END PAGE TITLE -->
    <!-- BEGIN PAGE TOOLBAR -->
    <div class="page-toolbar">
      <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">JRGM Duplicate Quote </li>
      </ul>
    </div>
    <!-- END PAGE TOOLBAR -->
  </div>
</div>
<div class="page-content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
<cfquery name="get_quote_ids_started" datasource="jrgm">
SELECT     opportunity_id 
FROM  quote_services WHERE  opportunity_id =#url.ID#
</cfquery>
<cfquery name="get_quote_start" datasource="jrgm">
SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount, 
opportunity_field_1 AS q_branch, 
opportunity_field_18 AS q_start_date ,
opportunity_field_19 AS q_end_date, 
stage_id, 
date_created_utc, 
 bid_currency, 
 bid_type, 
 bid_duration, 
 pipeline_id, 
 opportunity_field_2 AS q_address1, 
 opportunity_field_3 AS q_address2, 
 opportunity_field_4 AS q_city, 
 opportunity_field_5  AS q_address_state, 
 opportunity_field_6 AS q_address_zip, 
 opportunity_field_14 AS q_opportunity_type  ,OPPORTUNITY_status ,DATE_UPDATED_UTC ,
 date_quote_started,
 date_quote_updated
 FROM         quote_start  WHERE  opportunity_field_1 <> 'Williamsburg'  AND   opportunity_id =#url.ID#
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_quote_start#">


 --->
 
 <cfif IsDefined("url.duplicate") AND url.duplicate EQ 'yes'>
 <!--- Do Inserts to quote_Start--->
 <cfset duplicate_quote_id = 999 & #url.ID#>
 
<!---<cfoutput> #duplicate_quote_id#</cfoutput>
--->
<cfquery name="insert_quote_start" datasource="jrgm">
INSERT INTO quote_start (opportunity_id,opportunity_id_original,date_created_utc, date_updated_utc, user_id,duplicate_quote,  opportunity_state) VALUES ('#duplicate_quote_id#','#url.id#','#get_quote_start.date_created_utc#','#get_quote_start.date_updated_utc#','#SESSION.userid#' ,1,'#get_quote_start.opportunity_state#'  )
 </cfquery>
<!--- =, bid_amount, opportunity_field_1, opportunity_field_18, opportunity_field_19, stage_id, 
                      date_created_utc, bid_currency, bid_type, bid_duration, pipeline_id, opportunity_field_2, opportunity_field_3, opportunity_field_4, opportunity_field_5, 
                      opportunity_field_6, opportunity_field_14, opportunity_status, --->
                    
<!---date_due_utc, date_updated_utc, date_quote_started, --->
  <cfabort>
 
 <!--- Do Inserts to quote_main--->
 
  <cfquery name="insert_quote_main" datasource="jrgm">
INSERT INTO quote_main (opportunity_id,date_created, date_updated, user_id) VALUES ('#url.id#','#todayDate#','#todayDate#','#SESSION.userid#')
 </cfquery>
  <cfquery name="update_quote_start" datasource="jrgm">
UPDATE quote_start SET 
date_quote_started = '#todayDate#',
date_quote_updated = '#todayDate#',
user_id =  '#SESSION.userid#'
 WHERE opportunity_id = #url.id#
</cfquery>
 
  <!--- Do Inserts to quote_services--->
  
  <cfquery name="do_update_services" datasource="jrgm">
UPDATE quote_services SET 
gross_margin = '50.00', 
push_mow_qty = '#push_mow_qty#', 
push_mow_times =  '#push_mow_times#',
push_mow_rate = '#SESSION.push_mow_rate#',
push_mow_cost = '#SESSION.push_mow_cost#' ,
walk_behind_qty = '#walk_behind_qty#', 
walk_behind_times =  '#walk_behind_times#',
walk_behind_rate = '#SESSION.walk_behind_rate#',
walk_behind_cost = '#SESSION.walk_behind_cost#',
ride_mow_qty = '#ride_mow_qty#', 
ride_mow_times =  '#ride_mow_times#',
ride_mow_rate = '#SESSION.ride_mow_rate#',
ride_mow_cost = '#SESSION.ride_mow_cost#' ,
hard_edge_qty = '#hard_edge_qty#', 
hard_edge_times =  '#hard_edge_times#',
hard_edge_rate = '#SESSION.hard_edge_rate#',
hard_edge_cost ='#SESSION.hard_edge_cost#', 
bed_edge_times =  '#bed_edge_times#',
bed_edge_rate = '#SESSION.bed_edge_rate#',
bed_edge_cost = '#SESSION.bed_edge_cost#',
bed_edge_qty = '#bed_edge_qty#',
Trim_O_qty = '#TRIM(Trim_O_qty)#', 
Trim_O_Times =  '#Trim_O_Times#',
Trim_O_rate = '#SESSION.Trim_O_rate#',
Trim_O_cost= '#SESSION.Trim_O_cost#',
Trim_S_qty = '#Trim_S_qty#', 
trim_S_times =  '#trim_S_times#',
Trim_S_rate = '#SESSION.Trim_S_rate#',
Trim_S_cost= '#SESSION.Trim_S_cost#',
spraying_qty = '#spraying_qty#', 
spraying_times =  '#spraying_times#',
spraying_rate = '#SESSION.spraying_rate#',  
spraying_cost = '#SESSION.spraying_cost#',  
weeding_qty = '#weeding_qty#', 
weeding_times =  '#weeding_times#',
weeding_rate = '#SESSION.weeding_rate#',
weeding_cost = '#SESSION.weeding_cost#',
blowing_qty = '#blowing_qty#', 
blowing_times =  '#blowing_times#',
blowing_rate = '#SESSION.blowing_rate#', 
blowing_cost = '#SESSION.blowing_cost#', 
Trash_S_Qty = '#Trash_S_Qty#', 
Trash_S_Times =  '#Trash_S_Times#',
Trash_S_Rate = '#SESSION.Trash_S_Rate#',
Trash_S_Cost = '#SESSION.Trash_S_Cost#', 
traveltime_qty = '#traveltime_qty#', 
traveltime_times =  '#traveltime_times#',
traveltime_rate = '#SESSION.traveltime_rate#',
traveltime_cost = '#SESSION.traveltime_cost#',
Trash_O_Qty = '#Trash_O_Qty#', 
Trash_O_Times =  '#Trash_O_Times#',
Trash_O_rate = '#SESSION.Trash_O_rate#',
Trash_O_cost = '#SESSION.Trash_O_cost#',
leafrem_qty = '#leafrem_qty#', 
leafrem_times =  '#leafrem_times#',
leafrem_rate = '#SESSION.leafrem_rate#',
leafrem_cost = '#SESSION.leafrem_cost#',
cleanup_qty = '#cleanup_qty#', 
cleanup_times =  '#cleanup_times#',
cleanup_rate = '#SESSION.cleanup_rate#', 
cleanup_cost = '#SESSION.cleanup_cost#', 
turf_preg_qty = '#turf_preg_qty#', 
turf_preg_times =  '#turf_preg_times#',
turf_preg_rate =  '#SESSION.turf_preg_rate#',
turf_preg_cost =  '#SESSION.turf_preg_cost#' ,
turf_prel_qty = '#turf_prel_qty#', 
turf_prel_times =  '#turf_prel_times#',
turf_prel_rate =  '#SESSION.turf_prel_rate#',
turf_prel_cost =  '#SESSION.turf_prel_cost#' ,
turf_post_qty = '#turf_post_qty#', 
turf_post_times =  '#turf_post_times#',
turf_post_rate =  '#SESSION.turf_post_rate#',
turf_post_cost =  '#SESSION.turf_post_cost#' ,
turf_fert_qty = '#turf_fert_qty#', 
turf_fert_times =  '#turf_fert_times#',
turf_fert_rate =  '#SESSION.turf_fert_rate#',
turf_fert_cost =  '#SESSION.turf_fert_cost#' ,
turf_lime_qty = '#turf_lime_qty#', 
turf_lime_times =  '#turf_lime_times#',
turf_lime_rate =  '#SESSION.turf_lime_rate#',
turf_lime_cost =  '#SESSION.turf_lime_cost#' ,
Turf_Aer_H_qty = '#Turf_Aer_H_qty#', 
Turf_Aer_H_times =  '#Turf_Aer_H_times#',
Turf_Aer_H_rate =  '#SESSION.Turf_Aer_H_rate#',
Turf_Aer_H_cost =  '#SESSION.Turf_Aer_H_cost#' ,
Turf_Aer_T_qty = '#Turf_Aer_T_qty#', 
Turf_Aer_T_times =  '#Turf_Aer_T_times#',
Turf_Aer_T_rate =  '#SESSION.Turf_Aer_T_rate#',
Turf_Aer_T_cost =  '#SESSION.Turf_Aer_T_cost#' ,
Turf_Seed_qty = '#Turf_Seed_qty#', 
Turf_Seed_times =  '#Turf_Seed_times#',
Turf_Seed_rate =  '#SESSION.Turf_Seed_rate#',
Turf_Seed_cost =  '#SESSION.Turf_Seed_cost#' ,
Pruning_TP_qty = '#Pruning_TP_qty#', 
Pruning_TP_times =  '#Pruning_TP_times#',
Pruning_TP_rate =  '#SESSION.Pruning_TP_rate#',
Pruning_TP_cost =  '#SESSION.Pruning_TP_cost#' ,
Pruning_S_qty = '#Pruning_S_qty#', 
Pruning_S_times =  '#Pruning_S_times#',
Pruning_S_rate =  '#SESSION.Pruning_S_rate#',
Pruning_S_cost =  '#SESSION.Pruning_S_cost#' ,
TS_Fert_qty = '#TS_Fert_qty#', 
TS_Fert_times =  '#TS_Fert_times#',
TS_Fert_rate =  '#SESSION.TS_Fert_rate#',
TS_Fert_cost =  '#SESSION.TS_Fert_cost#' ,
TS_Insect_qty = '#TS_Insect_qty#', 
TS_Insect_times =  '#TS_Insect_times#',
TS_Insect_rate =  '#SESSION.TS_Insect_rate#',
TS_Insect_cost =  '#SESSION.TS_Insect_cost#' ,
Mulch_pre_qty = '#Mulch_pre_qty#', 
Mulch_pre_times =  '#Mulch_pre_times#',
Mulch_pre_rate =  '#SESSION.Mulch_pre_rate#',
Mulch_pre_cost =  '#SESSION.Mulch_pre_cost#' ,
Mulch_edging_qty = '#Mulch_edging_qty#', 
Mulch_edging_times =  '#Mulch_edging_times#',
Mulch_edging_rate =  '#SESSION.Mulch_edging_rate#',
Mulch_edging_cost =  '#SESSION.Mulch_edging_cost#' ,
mulch_s_dyed_qty = '#mulch_s_dyed_qty#', 
mulch_s_dyed_times =  '#mulch_s_dyed_times#',
mulch_s_dyed_rate =  '#SESSION.mulch_s_dyed_rate#',
mulch_s_dyed_cost =  '#SESSION.mulch_s_dyed_cost#' ,
mulch_f_dyed_qty = '#mulch_f_dyed_qty#', 
mulch_f_dyed_times =  '#mulch_f_dyed_times#',
mulch_f_dyed_rate =  '#SESSION.mulch_f_dyed_rate#',
mulch_f_dyed_cost =  '#SESSION.mulch_f_dyed_cost#' ,
Annuals_S_qty = '#Annuals_S_qty#', 
Annuals_S_times =  '#Annuals_S_times#',
Annuals_S_rate =  '#SESSION.Annuals_S_rate#',
Annuals_S_cost =  '#SESSION.Annuals_S_cost#' ,
Annuals_F_qty = '#Annuals_F_qty#', 
Annuals_F_times =  '#Annuals_F_times#',
Annuals_F_rate =  '#SESSION.Annuals_F_rate#',
Annuals_F_cost =  '#SESSION.Annuals_F_cost#' ,
Irrigation_SU_qty = '#Irrigation_SU_qty#', 
Irrigation_SU_times =  '#Irrigation_SU_times#',
Irrigation_SU_rate =  '#SESSION.Irrigation_SU_rate#',
Irrigation_SU_cost =  '#SESSION.Irrigation_SU_cost#' ,
Irrigation_W_qty = '#Irrigation_W_qty#', 
Irrigation_W_times =  '#Irrigation_W_times#',
Irrigation_W_rate =  '#SESSION.Irrigation_W_rate#',
Irrigation_W_cost =  '#SESSION.Irrigation_W_cost#' ,
Irrigation_I_qty = '#Irrigation_I_qty#', 
Irrigation_I_times =  '#Irrigation_I_times#',
Irrigation_I_rate =  '#SESSION.Irrigation_I_rate#',
Irrigation_I_cost =  '#SESSION.Irrigation_I_cost#' , 
Mulch_F_Reg_qty = '#Mulch_F_Reg_qty#', 
Mulch_F_Reg_times =  '#Mulch_F_Reg_times#',
Mulch_F_Reg_rate =  '#SESSION.Mulch_F_Reg_rate#',
Mulch_F_Reg_cost =  '#SESSION.Mulch_F_Reg_cost#' ,
Mulch_S_Reg_qty = '#Mulch_S_Reg_qty#', 
Mulch_S_Reg_times =  '#Mulch_S_Reg_times#',
Mulch_S_Reg_rate =  '#SESSION.Mulch_S_Reg_rate#',
Mulch_S_Reg_cost =  '#SESSION.Mulch_S_Reg_cost#' ,
Pond_Maint_qty = '#Pond_Maint_qty#', 
Pond_Maint_times =  '#Pond_Maint_times#',
Pond_Maint_rate =  '#SESSION.Pond_Maint_rate#',
Pond_Maint_cost =  '#SESSION.Pond_Maint_cost#' ,
Trim_Hillside_qty = '#Trim_Hillside_qty#', 
Trim_Hillside_times =  '#Trim_Hillside_times#',
Trim_Hillside_rate =  '#SESSION.Trim_Hillside_rate#',
Trim_Hillside_cost =  '#SESSION.Trim_Hillside_cost#' ,
Pine_Tags_qty = '#Pine_Tags_qty#', 
Pine_Tags_times =  '#Pine_Tags_times#',
Pine_Tags_rate =  '#SESSION.Pine_Tags_rate#',
Pine_Tags_cost =  '#SESSION.Pine_Tags_cost#' ,
TS_hort_oil_qty = '#TS_hort_oil_qty#', 
TS_hort_oil_times =  '#TS_hort_oil_times#',
TS_hort_oil_rate =  '#SESSION.TS_hort_oil_rate#',
TS_hort_oil_cost =  '#SESSION.TS_hort_oil_cost#' ,
Addtl_Mowing_qty = '#Addtl_Mowing_qty#', 
Addtl_Mowing_times =  '#Addtl_Mowing_times#',
Addtl_Mowing_rate =  '#SESSION.Addtl_Mowing_rate#',
Addtl_Mowing_cost =  '#SESSION.Addtl_Mowing_cost#' ,
Day_Porter_qty = '#Day_Porter_qty#', 
Day_Porter_times =  '#Day_Porter_times#',
Day_Porter_rate =  '#SESSION.Day_Porter_rate#',
Day_Porter_cost =  '#SESSION.Day_Porter_cost#' ,
Bush_Hog_qty = '#Bush_Hog_qty#', 
Bush_Hog_times =  '#Bush_Hog_times#',
Bush_Hog_rate =  '#SESSION.Bush_Hog_rate#',
Bush_Hog_cost =  '#SESSION.Bush_Hog_cost#' ,
Lot_Sweeping_qty = '#Lot_Sweeping_qty#', 
Lot_Sweeping_times =  '#Lot_Sweeping_times#',
Lot_Sweeping_rate =  '#SESSION.Lot_Sweeping_rate#',
Lot_Sweeping_cost =  '#SESSION.Lot_Sweeping_cost#' ,
Trail_Maint_qty = '#Trail_Maint_qty#', 
Trail_Maint_times =  '#Trail_Maint_times#',
Trail_Maint_rate =  '#SESSION.Trail_Maint_rate#',
Trail_Maint_cost =  '#SESSION.Trail_Maint_cost#' ,
Irrigation_TM_qty = '#Irrigation_TM_qty#', 
Irrigation_TM_times =  '#Irrigation_TM_times#',
Irrigation_TM_rate =  '#SESSION.Irrigation_TM_rate#',
Irrigation_TM_cost =  '#SESSION.Irrigation_TM_cost#' ,
Irrigation_BFI_qty = '#Irrigation_BFI_qty#', 
Irrigation_BFI_times =  '#Irrigation_BFI_times#',
Irrigation_BFI_rate =  '#SESSION.Irrigation_BFI_rate#',
Irrigation_BFI_cost =  '#SESSION.Irrigation_BFI_cost#' ,
Natural_Area_qty = '#Natural_Area_qty#', 
Natural_Area_times =  '#Natural_Area_times#',
Natural_Area_rate =  '#SESSION.Natural_Area_rate#',
Natural_Area_cost =  '#SESSION.Natural_Area_cost#' ,
Trash_Receptacle_qty = '#Trash_Receptacle_qty#', 
Trash_Receptacle_times =  '#Trash_Receptacle_times#',
Trash_Receptacle_rate =  '#SESSION.Trash_Receptacle_rate#',
Trash_Receptacle_cost =  '#SESSION.Trash_Receptacle_cost#' ,
Playground_mulch_qty = '#Playground_mulch_qty#', 
Playground_mulch_times =  '#Playground_mulch_times#',
Playground_mulch_rate =  '#SESSION.Playground_mulch_rate#',
Playground_mulch_cost =  '#SESSION.Playground_mulch_cost#',
Turf_Nutsedge_qty = '#Turf_Nutsedge_qty#', 
Turf_Nutsedge_times =  '#Turf_Nutsedge_times#',
Turf_Nutsedge_rate =  '#SESSION.Turf_Nutsedge_rate#',
Turf_Nutsedge_cost =  '#SESSION.Turf_Nutsedge_cost#' ,
Turf_Fungicide_qty = '#Turf_Fungicide_qty#', 
Turf_Fungicide_times =  '#Turf_Fungicide_times#',
Turf_Fungicide_rate =  '#SESSION.Turf_Fungicide_rate#',
Turf_Fungicide_cost =  '#SESSION.Turf_Fungicide_cost#' ,
Turf_Insecticide_qty = '#Turf_Insecticide_qty#', 
Turf_Insecticide_times =  '#Turf_Insecticide_times#',
Turf_Insecticide_rate =  '#SESSION.Turf_Insecticide_rate#',
Turf_Insecticide_cost =  '#SESSION.Turf_Insecticide_cost#' ,
Blank1_service = '#Blank1_service#', 
<!---Blank1_service_rate = '#Blank1_service_rate#', --->
Blank1_unit = '#Blank1_unit#', 
blank1_qty = '#blank1_qty#', 
blank1_times =  '#blank1_times#',
blank1_rate =  '#blank1_rate#',
blank1_cost =  '#SESSION.blank1_cost#' ,
Blank2_service = '#Blank2_service#', 
Blank2_unit = '#Blank2_unit#', 
blank2_qty = '#blank2_qty#', 
blank2_times =  '#blank2_times#',
blank2_rate =  '#blank2_rate#',
blank2_cost =  '#SESSION.blank2_cost#' ,
blank3_service = '#blank3_service#', 
blank3_unit = '#blank3_unit#', 
blank3_qty = '#blank3_qty#', 
blank3_times =  '#blank3_times#',
blank3_rate =  '#blank3_rate#',
blank3_cost =  '#SESSION.blank3_cost#' ,
contract_installments= '#SESSION.contract_installments#',
travel_time_gm =  '#NumberFormat(Session.travel_time_gm,"999999.99")#',  
lot_sweeping_gm = '#NumberFormat(Session.lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(Session.blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(Session.blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(Session.blank3_gm,"999999.99")#'

WHERE opportunity_id = #url.id#
</cfquery>
 
 
 
 <!--- Do Inserts to quote_materials--->
 
 <cfquery name="insert_quote_main" datasource="jrgm">
INSERT INTO quote_materials (opportunity_id) VALUES ('#url.id#')
</cfquery>
<cfquery name="do_update_materials" datasource="jrgm">
UPDATE quote_materials SET 
turf_preg_materials_qty = '#SESSION.turf_preg_materials_qty#', turf_preg_materials_rate = '#SESSION.turf_preg_materials_rate#'  ,
spraying_materials_qty = '#SESSION.spraying_materials_qty#', spraying_materials_rate = '#SESSION.spraying_materials_rate#'  ,
turf_prel_materials_qty = '#SESSION.turf_prel_materials_qty#', turf_prel_materials_rate = '#SESSION.turf_prel_materials_rate#'  ,
turf_post_materials_qty = '#SESSION.turf_post_materials_qty#', turf_post_materials_rate = '#SESSION.turf_post_materials_rate#'   ,
turf_fert_materials_qty = '#SESSION.turf_fert_materials_qty#', turf_fert_materials_rate = '#SESSION.turf_fert_materials_rate#'   ,
turf_lime_materials_qty = '#SESSION.turf_lime_materials_qty#', turf_lime_materials_rate = '#SESSION.turf_lime_materials_rate#' ,
Turf_Seed_materials_qty = '#SESSION.Turf_Seed_materials_qty#', Turf_Seed_materials_rate = '#SESSION.Turf_Seed_materials_rate#' ,
TS_Fert_materials_qty = '#SESSION.TS_Fert_materials_qty#', TS_Fert_materials_rate = '#SESSION.TS_Fert_materials_rate#'    ,
TS_Insect_materials_qty = '#SESSION.TS_Insect_materials_qty#', TS_Insect_materials_rate = '#SESSION.TS_Insect_materials_rate#'   ,
Mulch_pre_materials_qty = '#SESSION.Mulch_pre_materials_qty#', Mulch_pre_materials_rate = '#SESSION.Mulch_pre_materials_rate#'   ,
mulch_s_dyed_materials_qty = '#SESSION.mulch_s_dyed_materials_qty#', mulch_s_dyed_materials_rate = '#SESSION.mulch_s_dyed_materials_rate#' ,
mulch_f_dyed_materials_qty = '#SESSION.mulch_f_dyed_materials_qty#', mulch_f_dyed_materials_rate = '#SESSION.mulch_f_dyed_materials_rate#'   ,
Annuals_S_materials_qty = '#SESSION.Annuals_S_materials_qty#', Annuals_S_materials_rate = '#SESSION.Annuals_S_materials_rate#'  ,
Annuals_F_materials_qty = '#SESSION.Annuals_F_materials_qty#', Annuals_F_materials_rate = '#SESSION.Annuals_F_materials_rate#' ,
Mulch_F_Reg_materials_qty = '#SESSION.Mulch_F_Reg_materials_qty#', Mulch_F_Reg_materials_rate = '#SESSION.Mulch_F_Reg_materials_rate#'  ,
Mulch_S_Reg_materials_qty = '#SESSION.Mulch_S_Reg_materials_qty#', Mulch_S_Reg_materials_rate = '#SESSION.Mulch_S_Reg_materials_rate#' ,
Pine_Tags_materials_qty = '#SESSION.Pine_Tags_materials_qty#', Pine_Tags_materials_rate = '#SESSION.Pine_Tags_materials_rate#'   ,
TS_hort_oil_materials_qty = '#SESSION.TS_hort_oil_materials_qty#', TS_hort_oil_materials_rate = '#SESSION.TS_hort_oil_materials_rate#'  ,
Playground_mulch_materials_qty = '#SESSION.Playground_mulch_materials_qty#', Playground_mulch_materials_rate = '#SESSION.Playground_mulch_materials_rate#' ,
Turf_Nutsedge_materials_qty = '#SESSION.Turf_Nutsedge_materials_qty#', Turf_Nutsedge_materials_rate = '#SESSION.Turf_Nutsedge_materials_rate#'   , Turf_Fungicide_materials_qty = '#SESSION.Turf_Fungicide_materials_qty#', Turf_Fungicide_materials_rate = '#SESSION.Turf_Fungicide_materials_rate#'   ,
Turf_Insecticide_materials_qty = '#SESSION.Turf_Insecticide_materials_qty#', Turf_Insecticide_materials_rate = '#SESSION.Turf_Insecticide_materials_rate#'   
WHERE opportunity_id  =#url.id#
</cfquery> 
 
  <!--- Do Inserts to quote_services_blank--->

 <cflocation url="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>">
 </cfif>
<table  align="center"  width="95%">
<thead>
  <tr>
    <td>&nbsp;</td>
    <td> Are you sure you want to create a  duplicate quote for  <cfoutput>#get_quote_start.opportunity_name#</cfoutput>?<br />
<br />
<div class="container-buttons"> 
<div class="right-buttons">
<div class="button-box">
<a href="create_duplicate_quote.cfm?ID=<cfoutput>#url.id#</cfoutput>&duplicate=yes" class="btn btn-success" >Yes</a> 
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" >No</a> 
</div>
 </div>
</div></td>
  </tr>
  </thead>
</table>        <!-- end outer div -->
</div>
    </div>
  </div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
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
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced2.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
<!-- END BODY -->
</html>
