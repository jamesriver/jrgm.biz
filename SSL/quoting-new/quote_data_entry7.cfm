<!---total_contract_price,contract_installments are  FROM quote_main--->

<!--- <cfset exists= structdelete(session, 'Session.Irrigation_SU_cost', true)/>  
   --->
<!---  <cfabort>   --->

<!--- <cfif  IsDefined("form.btnSumit2")  >
 <cflocation url="quote_data_entry_print.cfm?ID=#url.id#">
  </cfif>
  
  <cfif  IsDefined("form.btnSumit2")  >
 <cflocation url="create_duplicate_quote.cfm?ID=#url.id#">
  </cfif>
 --->

<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<cfset StructDelete(Session,"push_mow_rate")>
<cfset StructDelete(Session,"push_mow_cost")>
<cfset StructDelete(Session,"Walk_Behind_cost")>
<cfset StructDelete(Session,"Walk_Behind_rate")>
<cfset StructDelete(Session,"Ride_Mow_cost")>
<cfset StructDelete(Session,"Ride_Mow_rate")>
<cfset StructDelete(Session,"Hard_Edge_cost")>
<cfset StructDelete(Session,"Hard_Edge_rate")>
<cfset StructDelete(Session,"Bed_Edge_cost")>
<cfset StructDelete(Session,"Bed_Edge_rate")>
<cfset StructDelete(Session,"Trim_O_cost")>
<cfset StructDelete(Session,"Trim_O_rate")>
<cfset StructDelete(Session,"Trim_S_cost")>
<cfset StructDelete(Session,"Trim_S_rate")>
<cfset StructDelete(Session,"Spraying_cost")>
<cfset StructDelete(Session,"Spraying_rate")>
<cfset StructDelete(Session,"Weeding_cost")>
<cfset StructDelete(Session,"Weeding_rate")>
<cfset StructDelete(Session,"Blowing_cost")>
<cfset StructDelete(Session,"Blowing_rate")>
<cfset StructDelete(Session,"Trash_S_cost")>
<cfset StructDelete(Session,"Trash_S_rate")>
<cfset StructDelete(Session,"traveltime_rate")>
<cfset StructDelete(Session,"traveltime_cost")>
<cfset StructDelete(Session,"Trash_O_cost")>
<cfset StructDelete(Session,"Trash_O_rate")>
<cfset StructDelete(Session,"LeafRem_cost")>
<cfset StructDelete(Session,"LeafRem_rate")>
<cfset StructDelete(Session,"turf_preg_cost")>
<cfset StructDelete(Session,"turf_preg_rate")>
<cfset StructDelete(Session,"Turf_prel_cost")>
<cfset StructDelete(Session,"Turf_prel_rate")>
<cfset StructDelete(Session,"Turf_Post_cost")>
<cfset StructDelete(Session,"Turf_Post_rate")>
<cfset StructDelete(Session,"Turf_Fert_cost")>
<cfset StructDelete(Session,"Turf_Fert_rate")>
<cfset StructDelete(Session,"Turf_Lime_cost")>
<cfset StructDelete(Session,"Turf_Lime_rate")>
<cfset StructDelete(Session,"Turf_Aer_H_cost")>
<cfset StructDelete(Session,"Turf_Aer_H_rate")>
<cfset StructDelete(Session,"Turf_Aer_T_cost")>
<cfset StructDelete(Session,"Turf_Aer_T_rate")>
<cfset StructDelete(Session,"Turf_Seed_cost")>
<cfset StructDelete(Session,"Turf_Seed_rate")>
<cfset StructDelete(Session,"Pruning_TP_cost")>
<cfset StructDelete(Session,"Pruning_TP_rate")>
<cfset StructDelete(Session,"Pruning_S_cost")>
<cfset StructDelete(Session,"Pruning_S_rate")>
<cfset StructDelete(Session,"TS_Fert_cost")>
<cfset StructDelete(Session,"TS_Fert_rate")>
<cfset StructDelete(Session,"TS_Insect_cost")>
<cfset StructDelete(Session,"TS_Insect_rate")>
<cfset StructDelete(Session,"Mulch_Pre_cost")>
<cfset StructDelete(Session,"Mulch_Pre_rate")>
<cfset StructDelete(Session,"Mulch_Edging_cost")>
<cfset StructDelete(Session,"Mulch_Edging_rate")>
<cfset StructDelete(Session,"Mulch_S_dyed_cost")>
<cfset StructDelete(Session,"Mulch_S_dyed_rate")>
<cfset StructDelete(Session,"Mulch_F_dyed_cost")>
<cfset StructDelete(Session,"Mulch_F_dyed_rate")>
<cfset StructDelete(Session,"Annuals_S_cost")>
<cfset StructDelete(Session,"Annuals_S_rate")>
<cfset StructDelete(Session,"Annuals_F_cost")>
<cfset StructDelete(Session,"Annuals_F_rate")>
<cfset StructDelete(Session,"Irrigation_SU_cost")>
<cfset StructDelete(Session,"Irrigation_SU_rate")>
<cfset StructDelete(Session,"Irrigation_W_cost")>
<cfset StructDelete(Session,"Irrigation_W_rate")>
<cfset StructDelete(Session,"Irrigation_I_cost")>
<cfset StructDelete(Session,"Irrigation_I_rate")>
<cfset StructDelete(Session,"Mulch_F_Reg_cost")>
<cfset StructDelete(Session,"Mulch_F_Reg_rate")>
<cfset StructDelete(Session,"Mulch_S_Reg_cost")>
<cfset StructDelete(Session,"Mulch_S_Reg_rate")>
<cfset StructDelete(Session,"Pond_Maint_cost")>
<cfset StructDelete(Session,"Pond_Maint_rate")>
<cfset StructDelete(Session,"Trim_Hillside_cost")>
<cfset StructDelete(Session,"Trim_Hillside_rate")>
<cfset StructDelete(Session,"Pine_Tags_cost")>
<cfset StructDelete(Session,"Pine_Tags_rate")>
<cfset StructDelete(Session,"TS_hort_oil_cost")>
<cfset StructDelete(Session,"TS_hort_oil_rate")>
<cfset StructDelete(Session,"Addtl_Mowing_cost")>
<cfset StructDelete(Session,"Addtl_Mowing_rate")>
<cfset StructDelete(Session,"Day_Porter_cost")>
<cfset StructDelete(Session,"Day_Porter_rate")>
<cfset StructDelete(Session,"Bush_Hog_cost")>
<cfset StructDelete(Session,"Bush_Hog_rate")>
<cfset StructDelete(Session,"Lot_Sweeping_cost")>
<cfset StructDelete(Session,"Lot_Sweeping_rate")>
<cfset StructDelete(Session,"Insect_cost")>
<cfset StructDelete(Session,"Insect_rate")>
<cfset StructDelete(Session,"cleanup_cost")>
<cfset StructDelete(Session,"cleanup_rate")>
<cfset StructDelete(Session,"Trail_Maint_cost")>
<cfset StructDelete(Session,"Trail_Maint_rate")>
<cfset StructDelete(Session,"Irrigation_TM_cost")>
<cfset StructDelete(Session,"Irrigation_TM_rate")>
<cfset StructDelete(Session,"Irrigation_BFI_cost")>
<cfset StructDelete(Session,"Irrigation_BFI_rate")>
<cfset StructDelete(Session,"Janitorial_cost")>
<cfset StructDelete(Session,"Janitorial_rate")>
<cfset StructDelete(Session,"3080_cost")>
<cfset StructDelete(Session,"3080_rate")>
<cfset StructDelete(Session,"4080_cost")>
<cfset StructDelete(Session,"4080_rate")>
<cfset StructDelete(Session,"Natural_Area_cost")>
<cfset StructDelete(Session,"Natural_Area_rate")>
<cfset StructDelete(Session,"Trash_Receptacle_cost")>
<cfset StructDelete(Session,"Trash_Receptacle_rate")>
<cfset StructDelete(Session,"Playground_mulch_cost")>
<cfset StructDelete(Session,"Playground_mulch_rate")>
<cfset StructDelete(Session,"Turf_Nutsedge_cost")>
<cfset StructDelete(Session,"Turf_Nutsedge_rate")>
<cfset StructDelete(Session,"Turf_Fungicide_cost")>
<cfset StructDelete(Session,"Turf_Fungicide_rate")>
<cfset StructDelete(Session,"Turf_Insecticide_cost")>
<cfset StructDelete(Session,"Turf_Insecticide_rate")>
<cfset StructDelete(Session,"blank1_service")>
<cfset StructDelete(Session,"Blank1_unit")>
<cfset StructDelete(Session,"blank1_cost")>
<cfset StructDelete(Session,"blank1_rate")>
<cfset StructDelete(Session,"blank2_service")>
<cfset StructDelete(Session,"Blank2_unit")>
<cfset StructDelete(Session,"blank2_cost")>
<cfset StructDelete(Session,"blank2_rate")>
<cfset StructDelete(Session,"blank3_service")>
<cfset StructDelete(Session,"Blank3_unit")>
<cfset StructDelete(Session,"blank3_cost")>
<cfset StructDelete(Session,"blank3_rate")>
<cfset StructDelete(Session,"contract_start_date")>
<cfset StructDelete(Session,"contract_end_date")>
<cfset StructDelete(Session,"contract_installments")>
<cfset StructDelete(Session,"sales_tax")>
<cfset StructDelete(Session,"seasonal_hours")>
<cfset StructDelete(Session,"travel_time_gm")>
<cfset StructDelete(Session,"lot_sweeping_gm")>
<cfset StructDelete(Session,"blank1_gm")>
<cfset StructDelete(Session,"blank2_gm")>
<cfset StructDelete(Session,"blank3_gm")>
<cfset StructDelete(Session,"contract_adjustment")>

<!---------------------------- Materials Session variables------------------------------->
<cfset StructDelete(Session,"spraying_materials_rate")>
<cfset StructDelete(Session,"spraying_materials_qty")>
<cfset StructDelete(Session,"TURF_PREG_materials_rate")>
<cfset StructDelete(Session,"turf_preg_materials_qty")>
<cfset StructDelete(Session,"TURF_prel_materials_rate")>
<cfset StructDelete(Session,"turf_prel_materials_qty")>
<cfset StructDelete(Session,"TURF_post_materials_rate")>
<cfset StructDelete(Session,"TURF_post_materials_qty")>
<cfset StructDelete(Session,"TURF_fert_materials_rate")>
<cfset StructDelete(Session,"TURF_fert_materials_qty")>
<cfset StructDelete(Session,"Turf_Lime_materials_rate")>
<cfset StructDelete(Session,"Turf_Lime_materials_qty")>
<cfset StructDelete(Session,"mulch_f_dyed_materials_qty")>
<cfset StructDelete(Session,"mulch_f_dyed_materials_rate")>
<cfset StructDelete(Session,"mulch_s_dyed_materials_qty")>
<cfset StructDelete(Session,"mulch_s_dyed_materials_rate")>
<cfset StructDelete(Session,"Mulch_F_Reg_materials_qty")>
<cfset StructDelete(Session,"Mulch_F_Reg_materials_rate")>
<cfset StructDelete(Session,"Mulch_S_Reg_materials_qty")>
<cfset StructDelete(Session,"Mulch_S_Reg_materials_rate")>
<cfset StructDelete(Session,"Annuals_F_materials_rate")>
<cfset StructDelete(Session,"Annuals_F_materials_qty")>
<cfset StructDelete(Session,"Annuals_S_materials_rate")>
<cfset StructDelete(Session,"Annuals_S_materials_qty")>
<cfset StructDelete(Session,"Turf_Seed_materials_rate")>
<cfset StructDelete(Session,"Turf_Seed_materials_qty")>
<cfset StructDelete(Session,"TS_Insect_materials_rate")>
<cfset StructDelete(Session,"TS_Insect_materials_qty")>
<cfset StructDelete(Session,"Mulch_pre_materials_rate")>
<cfset StructDelete(Session,"Mulch_pre_materials_qty")>
<cfset StructDelete(Session,"TS_Fert_materials_rate")>
<cfset StructDelete(Session,"TS_Fert_materials_qty")>
<cfset StructDelete(Session,"Pine_Tags_materials_rate")>
<cfset StructDelete(Session,"Pine_Tags_materials_qty")>
<cfset StructDelete(Session,"TS_hort_oil_materials_rate")>
<cfset StructDelete(Session,"TS_hort_oil_materials_qty")>
<cfset StructDelete(Session,"Playground_mulch_materials_rate")>
<cfset StructDelete(Session,"Playground_mulch_materials_qty")>
<cfset StructDelete(Session,"Turf_Nutsedge_materials_rate")>
<cfset StructDelete(Session,"Turf_Nutsedge_materials_qty")>
<cfset StructDelete(Session,"Turf_Fungicide_materials_rate")>
<cfset StructDelete(Session,"Turf_Fungicide_materials_qty")>
<cfset StructDelete(Session,"Turf_Insecticide_materials_rate")>
<cfset StructDelete(Session,"Turf_Insecticide_materials_qty")>
<cfset StructDelete(Session,"gross_margin")><!---  ZZZ --->
<cfquery name="get_distinct_material_ID" datasource="jrgm">
SELECT     DISTINCT item_desc
FROM         quote_materials_admin    WHERE    For_Quoting_Purposes=2
</cfquery>
<cfloop query="get_distinct_material_ID">
  <cfquery name="get_material_admin_info" datasource="jrgm">
SELECT     ID,  Item_Desc,Item_unit, Selling_Price, Cost_Opening,  For_Quoting_Purposes,  For_Time_Entry
FROM         quote_materials_admin  WHERE item_desc = '#get_distinct_material_ID.item_desc#'
</cfquery>
  <!--- <cfdump var="#get_material_admin_info#">  --->
  
  <cfif  item_desc EQ 'Non-Sel. Herbicide (oz)'>
    <cfparam  name="Session.spraying_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Barricade liquid pre-em (oz)'>
    <cfparam  name="Session.TURF_prel_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Trimec Selective Herbicide (oz)'>
    <cfparam  name="Session.TURF_post_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ '10-10-1 Starter Fert'>
    <cfparam  name="Session.TURF_fert_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Pelletized Lime (lb)'>
    <cfparam  name="Session.Turf_Lime_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Granular pre-em w 16-4-8 Fert (lb)'>
    <cfparam  name="Session.TURF_PREG_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, S (dyed) (CY)'>
    <cfparam  name="Session.mulch_s_dyed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, F (dyed) (CY)'>
    <cfparam  name="Session.mulch_f_dyed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, F (non-dyed) (CY)'>
    <cfparam  name="Session.Mulch_F_Reg_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, S (non-dyed) (CY)'>
    <cfparam  name="Session.Mulch_S_Reg_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Spring Flowers (6 in pots)'>
    <cfparam  name="Session.ANNUALS_S_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fall Flowers (6 in pots)'>
    <cfparam  name="Session.Annuals_F_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fescue Seed 50lb bag'>
    <cfparam  name="Session.Turf_Seed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Bifenthrin Tree & Shrub Insecticide (oz)'>
    <cfparam  name="Session.TS_Insect_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fertilizer 14-14-14  (lbs)'>
    <cfparam  name="Session.TS_Fert_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Pre-em 0-0-7 w/ 0.86 Pendemethaline (lbs)'>
    <cfparam  name="Session.Mulch_pre_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Pine Tags (bales)'>
    <cfparam  name="Session.Pine_Tags_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Hort/Dormant Oil (oz)'>
    <cfparam  name="Session.TS_hort_oil_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Playground Mulch'>
    <cfparam  name="Session.Playground_Mulch_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Nutsedge'>
    <cfparam  name="Session.Turf_Nutsedge_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Fungicide '>
    <cfparam  name="Session.Turf_Fungicide_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Insecticide '>
    <cfparam  name="Session.Turf_Insecticide_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
</cfloop>
<!--------------------------Get Service Rates and Costs---------------------------------->
<cfquery name="get_distinct_service_ID" datasource="jrgm">
SELECT     DISTINCT Service_ID 
FROM         quote_services_admin  
</cfquery>
<cfloop query="get_distinct_service_ID">
  <cfquery name="get_service_admin_info" datasource="jrgm">
SELECT      ID, Service_ID, Service_Name, Sq_Ft, Service_Unit, Service_Rate, Service_Type, Service_Type_Sub_Group
FROM         quote_services_admin  WHERE Service_ID = '#get_distinct_service_ID.Service_ID#'
</cfquery>
  <!--- <cfdump var="#get_service_admin_info#">     --->
  <cfif  service_id EQ 'Push Mow'>
    <cfparam  name="Session.push_mow_cost" default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.push_mow_rate" default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Walk Behind'>
    <cfparam  name="Session.Walk_Behind_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Walk_Behind_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Ride Mow'>
    <cfparam  name="Session.Ride_Mow_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Ride_Mow_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Hard Edge (s)'>
    <cfparam  name="Session.Hard_Edge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Hard_Edge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Bed Edge'>
    <cfparam  name="Session.Bed_Edge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Bed_Edge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, O'>
    <cfparam  name="Session.Trim_O_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trim_O_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, S'>
    <cfparam  name="Session.Trim_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trim_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Spraying'>
    <cfparam  name="Session.Spraying_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Spraying_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Weeding'>
    <cfparam  name="Session.Weeding_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Weeding_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Blowing'>
    <cfparam  name="Session.Blowing_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Blowing_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash, S'>
    <cfparam  name="Session.Trash_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trash_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash, Off'>
    <cfparam  name="Session.Trash_O_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trash_O_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Traveltime'>
    <cfparam  name="Session.Traveltime_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Traveltime_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Leaf Rem'>
    <cfparam  name="Session.LeafRem_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.LeafRem_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Pre (G)'>
    <cfparam  name="Session.turf_preg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.turf_preg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Pre (L)'>
    <cfparam  name="Session.Turf_prel_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_prel_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Post'>
    <cfparam  name="Session.Turf_Post_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Post_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Fert'>
    <cfparam  name="Session.Turf_Fert_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Fert_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Lime'>
    <cfparam  name="Session.Turf_Lime_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Lime_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Aer (H)'>
    <cfparam  name="Session.Turf_Aer_H_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Aer_H_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Aer (T)'>
    <cfparam  name="Session.Turf_Aer_T_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Aer_T_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Seed'>
    <cfparam  name="Session.Turf_Seed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Seed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pruning, T/P'>
    <cfparam  name="Session.Pruning_TP_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Pruning_TP_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pruning, S'>
    <cfparam  name="Session.Pruning_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Pruning_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, Fert'>
    <cfparam  name="Session.TS_Fert_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.TS_Fert_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, Insect'>
    <cfparam  name="Session.TS_Insect_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.TS_Insect_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, Pre'>
    <cfparam  name="Session.Mulch_Pre_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_Pre_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, Edging'>
    <cfparam  name="Session.Mulch_Edging_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_Edging_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, S (dyed)'>
    <cfparam  name="Session.Mulch_S_dyed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_S_dyed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, F (dyed)'>
    <cfparam  name="Session.Mulch_F_dyed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_F_dyed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Annuals, S'>
    <cfparam  name="Session.Annuals_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Annuals_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Annuals, F'>
    <cfparam  name="Session.Annuals_F_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Annuals_F_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, SU'>
    <cfparam  name="Session.Irrigation_SU_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_SU_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, W'>
    <cfparam  name="Session.Irrigation_W_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_W_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, I'>
    <cfparam  name="Session.Irrigation_I_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_I_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, F (reg)'>
    <cfparam  name="Session.Mulch_F_Reg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_F_Reg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, S (reg)'>
    <cfparam  name="Session.Mulch_S_reg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_S_reg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pond Maint.'>
    <cfparam  name="Session.Pond_Maint_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Pond_Maint_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, Hillside'>
    <cfparam  name="Session.Trim_Hillside_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trim_Hillside_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pine Tags'>
    <cfparam  name="Session.Pine_Tags_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Pine_Tags_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, hort oil'>
    <cfparam  name="Session.TS_hort_oil_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.TS_hort_oil_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Addtl. Mowing'>
    <cfparam  name="Session.Addtl_Mowing_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Addtl_Mowing_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Day Porter'>
    <cfparam  name="Session.Day_Porter_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Day_Porter_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Bush Hog'>
    <cfparam  name="Session.Bush_Hog_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Bush_Hog_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Lot Sweeping'>
    <cfparam  name="Session.Lot_Sweeping_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Lot_Sweeping_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Insect'>
    <cfparam  name="Session.Insect_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Insect_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Cleanup'>
    <cfparam  name="Session.cleanup_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.cleanup_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trail Maint'>
    <cfparam  name="Session.Trail_Maint_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trail_Maint_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, T/M'>
    <cfparam  name="Session.Irrigation_TM_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_TM_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Janitorial'>
    <cfparam  name="Session.Janitorial_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Janitorial_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <!---  <cfif  service_id EQ '3080'>
    <cfparam  name="Session.3080_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.3080_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ '4080'>
    <cfparam  name="Session.4080_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.4080_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
--->
  <cfif  service_id EQ 'Irrigation, BFI'>
    <cfparam  name="Session.Irrigation_BFI_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_BFI_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <!--- <cfif  service_id EQ 'Fertilization'>
    <cfparam  name="Session.Fertilization_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Fertilization_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Seasonal Color'>
    <cfparam  name="Session.Seasonal_Color_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Seasonal_Color_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation'>
    <cfparam  name="Session.Irrigation_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Maintenance'>
    <cfparam  name="Session.Maintenance_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Maintenance_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Enhancement'>
    <cfparam  name="Session.Enhancement_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Enhancement_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Construction'>
    <cfparam  name="Session.Construction_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Construction_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch'>
    <cfparam  name="Session.Mulch_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Mulch_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>--->
  <cfif  service_id EQ 'Natural Area'>
    <cfparam  name="Session.Natural_Area_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Natural_Area_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash Receptacle'>
    <cfparam  name="Session.Trash_Receptacle_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Trash_Receptacle_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Playground mulch'>
    <cfparam  name="Session.Playground_mulch_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Playground_mulch_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Nutsedge'>
    <cfparam  name="Session.Turf_Nutsedge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Nutsedge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Fungicide'>
    <cfparam  name="Session.Turf_Fungicide_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Fungicide_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Insecticide'>
    <cfparam  name="Session.Turf_Insecticide_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Turf_Insecticide_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
</cfloop>
<cfparam  name="Session.gross_margin" default="50.000"  >
<cfparam  name="gross_margin" default="50.000"  >
<cfparam  name="Session.push_mow_qty" default="0"  >
<cfparam  name="Session.push_mow_times" default="0">
<cfparam  name="push_mow_qty" default="0"  >
<cfparam  name="push_mow_times" default="0">
<cfparam  name="Session.walk_behind_qty" default="0"  >
<cfparam  name="Session.walk_behind_times" default="0">
<cfparam  name="walk_behind_qty" default="0"  >
<cfparam  name="walk_behind_times" default="0">
<cfparam  name="Session.ride_mow_qty" default="0"  >
<cfparam  name="Session.ride_mow_times" default="0">
<cfparam  name="ride_mow_qty" default="0"  >
<cfparam  name="ride_mow_times" default="0">
<cfparam  name="Session.hard_edge_qty" default="0"  >
<cfparam  name="Session.hard_edge_times" default="0">
<cfparam  name="hard_edge_qty" default="0"  >
<cfparam  name="hard_edge_times" default="0">
<cfparam  name="Session.bed_edge_qty" default="0"  >
<cfparam  name="Session.bed_edge_times" default="0">
<cfparam  name="bed_edge_qty" default="0"  >
<cfparam  name="bed_edge_times" default="0">
<cfparam  name="Session.Trim_O_qty" default="0"  >
<cfparam  name="Session.Trim_O_Times" default="0">
<cfparam  name="Trim_O_qty" default="0"  >
<cfparam  name="Trim_O_Times" default="0">
<cfparam  name="Session.Trim_S_qty" default="0"  >
<cfparam  name="Session.trim_S_times" default="0">
<cfparam  name="Trim_S_qty" default="0"  >
<cfparam  name="trim_S_times" default="0">
<cfparam  name="Session.spraying_qty" default="0"  >
<cfparam  name="Session.spraying_times" default="0">
<cfparam  name="Session.spraying_materials_qty" default="0">
<cfparam  name="spraying_qty" default="0"  >
<!--- <cfparam  name="Session.spraying_materials_rate" default="0"> --->
<cfparam  name="spraying_times" default="0">
<cfparam  name="spraying_materials_qty" default="0">
<!--- <cfparam  name="spraying_materials_rate" default="0"> --->
<cfparam  name="Session.weeding_qty" default="0"  >
<cfparam  name="Session.weeding_times" default="0">
<cfparam  name="weeding_qty" default="0"  >
<cfparam  name="weeding_times" default="0">
<cfparam  name="Session.blowing_qty" default="0"  >
<cfparam  name="Session.blowing_times" default="0">
<cfparam  name="blowing_qty" default="0"  >
<cfparam  name="blowing_times" default="0">
<cfparam  name="Session.Trash_S_Qty" default="0"  >
<cfparam  name="Session.Trash_S_Times" default="0">
<cfparam  name="Trash_S_Qty" default="0"  >
<cfparam  name="Trash_S_Times" default="0">
<cfparam  name="Session.traveltime_qty" default="0"  >
<cfparam  name="Session.traveltime_times" default="0">
<cfparam  name="traveltime_qty" default="0"  >
<cfparam  name="traveltime_times" default="0">
<cfparam  name="Session.Trash_O_Qty" default="0"  >
<cfparam  name="Session.Trash_O_Times" default="0">
<cfparam  name="Trash_O_Qty" default="0"  >
<cfparam  name="Trash_O_Times" default="0">
<cfparam  name="Session.leafrem_qty" default="0"  >
<cfparam  name="Session.leafrem_times" default="0">
<cfparam  name="leafrem_qty" default="0"  >
<cfparam  name="leafrem_times" default="0">
<cfparam  name="Session.cleanup_qty" default="0"  >
<cfparam  name="Session.cleanup_times" default="0">
<cfparam  name="cleanup_qty" default="0"  >
<cfparam  name="cleanup_times" default="0">
<cfparam  name="Session.turf_preg_qty" default="0"  >
<cfparam  name="Session.turf_preg_times" default="0">
<cfparam  name="Session.turf_preg_materials_qty" default="0">
<!--- <cfparam  name="Session.TURF_PREG_materials_rate" default="0"> --->
<cfparam  name="turf_preg_qty" default="0"  >
<cfparam  name="turf_preg_times" default="0">
<cfparam  name="turf_preg_materials_qty" default="0">
<!--- <cfparam  name="TURF_PREG_materials_rate" default="0"> --->
<cfparam  name="Session.turf_prel_qty" default="0"  >
<cfparam  name="Session.turf_prel_times" default="0">
<cfparam  name="Session.turf_prel_materials_qty" default="0">
<!--- <cfparam  name="Session.TURF_prel_materials_rate" default="0"> --->
<cfparam  name="turf_prel_qty" default="0"  >
<cfparam  name="turf_prel_times" default="0">
<cfparam  name="turf_prel_materials_qty" default="0">
<!--- <cfparam  name="TURF_PREL_materials_rate" default="0"> --->
<cfparam  name="Session.turf_post_qty" default="0"  >
<cfparam  name="Session.turf_post_times" default="0">
<cfparam  name="Session.turf_post_materials_qty" default="0">
<!--- <cfparam  name="Session.TURF_post_materials_rate" default="0"> --->
<cfparam  name="turf_post_qty" default="0"  >
<cfparam  name="turf_post_times" default="0">
<cfparam  name="turf_post_materials_qty" default="0">
<!--- <cfparam  name="TURF_post_materials_rate" default="0"> --->
<cfparam  name="Session.turf_fert_qty" default="0"  >
<cfparam  name="Session.turf_fert_times" default="0">
<cfparam  name="Session.turf_fert_materials_qty" default="0">
<!---<cfparam  name="Session.turf_fert_materials_rate" default="0"> Z--->
<cfparam  name="turf_fert_qty" default="0"  >
<cfparam  name="turf_fert_times" default="0">
<cfparam  name="turf_fert_materials_qty" default="0">
<!---<cfparam  name="turf_fert_materials_rate" default="0" Z>--->
<cfparam  name="Session.turf_lime_qty" default="0"  >
<cfparam  name="Session.turf_lime_times" default="0">
<cfparam  name="Session.turf_lime_materials_qty" default="0">
<!--- <cfparam  name="Session.turf_lime_materials_rate" default="0"> --->
<cfparam  name="turf_lime_qty" default="0"  >
<cfparam  name="turf_lime_times" default="0">
<cfparam  name="turf_lime_materials_qty" default="0">
<!--- <cfparam  name="turf_lime_materials_rate" default="0"> --->
<cfparam  name="Session.Turf_Aer_H_qty" default="0"  >
<cfparam  name="Session.Turf_Aer_H_times" default="0">
<cfparam  name="Session.Turf_Aer_H_materials_qty" default="0">
<!--- <cfparam  name="Session.Turf_Aer_H_materials_rate" default="0"> --->
<cfparam  name="Turf_Aer_H_qty" default="0"  >
<cfparam  name="Turf_Aer_H_times" default="0">
<cfparam  name="Turf_Aer_H_materials_qty" default="0">
<!--- <cfparam  name="Turf_Aer_H_materials_rate" default="0"> --->
<cfparam  name="Session.Turf_Aer_T_qty" default="0"  >
<cfparam  name="Session.Turf_Aer_T_times" default="0">
<cfparam  name="Session.Turf_Aer_T_materials_qty" default="0">
<!--- <cfparam  name="Session.Turf_Aer_T_materials_rate" default="0"> --->
<cfparam  name="Turf_Aer_T_qty" default="0"  >
<cfparam  name="Turf_Aer_T_times" default="0">
<cfparam  name="Turf_Aer_T_materials_qty" default="0">
<!--- <cfparam  name="Turf_Aer_T_materials_rate" default="0"> --->
<cfparam  name="Session.Turf_Seed_qty" default="0"  >
<cfparam  name="Session.Turf_Seed_times" default="0">
<cfparam  name="Session.Turf_Seed_materials_qty" default="0">
<!--- <cfparam  name="Session.Turf_Seed_materials_rate" default="0"> --->
<cfparam  name="Turf_Seed_qty" default="0"  >
<cfparam  name="Turf_Seed_times" default="0">
<cfparam  name="Turf_Seed_materials_qty" default="0">
<!--- <cfparam  name="Turf_Seed_materials_rate" default="0"> --->
<cfparam  name="Session.Pruning_TP_qty" default="0"  >
<cfparam  name="Session.Pruning_TP_times" default="0">
<cfparam  name="Session.Pruning_TP_materials_qty" default="0">
<!--- <cfparam  name="Session.Pruning_TP_materials_rate" default="0"> --->
<cfparam  name="Pruning_TP_qty" default="0"  >
<cfparam  name="Pruning_TP_times" default="0">
<cfparam  name="Pruning_TP_materials_qty" default="0">
<!--- <cfparam  name="Pruning_TP_materials_rate" default="0"> --->
<cfparam  name="Session.Pruning_S_qty" default="0"  >
<cfparam  name="Session.Pruning_S_times" default="0">
<cfparam  name="Session.Pruning_S_materials_qty" default="0">
<!--- <cfparam  name="Session.Pruning_S_materials_rate" default="0"> --->
<cfparam  name="Pruning_S_qty" default="0"  >
<cfparam  name="Pruning_S_times" default="0">
<cfparam  name="Pruning_S_materials_qty" default="0">
<!--- <cfparam  name="Pruning_S_materials_rate" default="0"> --->
<cfparam  name="Session.TS_Fert_qty" default="0"  >
<cfparam  name="Session.TS_Fert_times" default="0">
<cfparam  name="Session.TS_Fert_materials_qty" default="0">
<!---<cfparam  name="Session.TS_Fert_materials_rate" default="0">--->
<cfparam  name="TS_Fert_qty" default="0"  >
<cfparam  name="TS_Fert_times" default="0">
<cfparam  name="TS_Fert_materials_qty" default="0">
<!---<cfparam  name="TS_Fert_materials_rate" default="0">--->
<cfparam  name="Session.TS_Insect_qty" default="0"  >
<cfparam  name="Session.TS_Insect_times" default="0">
<cfparam  name="Session.TS_Insect_materials_qty" default="0">
<!--- <cfparam  name="Session.TS_Insect_materials_rate" default="0"> --->
<cfparam  name="TS_Insect_qty" default="0"  >
<cfparam  name="TS_Insect_times" default="0">
<cfparam  name="TS_Insect_materials_qty" default="0">
<!--- <cfparam  name="TS_Insect_materials_rate" default="0"> --->
<cfparam  name="Session.Mulch_pre_qty" default="0"  >
<cfparam  name="Session.Mulch_pre_times" default="0">
<cfparam  name="Session.Mulch_pre_materials_qty" default="0">
<!---<cfparam  name="Session.Mulch_pre_materials_rate" default="0">--->
<cfparam  name="Mulch_pre_qty" default="0"  >
<cfparam  name="Mulch_pre_times" default="0">
<cfparam  name="Mulch_pre_materials_qty" default="0">
<!---<cfparam  name="Mulch_pre_materials_rate" default="0">--->
<cfparam  name="Session.Mulch_edging_qty" default="0"  >
<cfparam  name="Session.Mulch_edging_times" default="0">
<cfparam  name="Session.Mulch_edging_materials_qty" default="0">
<!--- <cfparam  name="Session.Mulch_edging_materials_rate" default="0"> --->
<cfparam  name="Mulch_edging_qty" default="0"  >
<cfparam  name="Mulch_edging_times" default="0">
<cfparam  name="Mulch_edging_materials_qty" default="0">
<!--- <cfparam  name="Mulch_edging_materials_rate" default="0"> --->
<cfparam  name="Session.mulch_s_dyed_qty" default="0"  >
<cfparam  name="Session.mulch_s_dyed_times" default="0">
<cfparam  name="Session.mulch_s_dyed_materials_qty" default="0">
<!--- <cfparam  name="Session.mulch_s_dyed_materials_rate" default="0"> --->
<cfparam  name="mulch_s_dyed_qty" default="0"  >
<cfparam  name="mulch_s_dyed_times" default="0">
<cfparam  name="mulch_s_dyed_materials_qty" default="0">
<!--- <cfparam  name="mulch_s_dyed_materials_rate" default="0"> --->
<cfparam  name="Session.mulch_f_dyed_qty" default="0"  >
<cfparam  name="Session.mulch_f_dyed_times" default="0">
<cfparam  name="Session.mulch_f_dyed_materials_qty" default="0">
<!--- <cfparam  name="Session.mulch_f_dyed_materials_rate" default="0"> --->
<cfparam  name="mulch_f_dyed_qty" default="0"  >
<cfparam  name="mulch_f_dyed_times" default="0">
<cfparam  name="mulch_f_dyed_materials_qty" default="0">
<!--- <cfparam  name="mulch_f_dyed_materials_rate" default="0"> --->
<cfparam  name="Session.Annuals_S_qty" default="0"  >
<cfparam  name="Session.Annuals_S_times" default="0">
<cfparam  name="Session.Annuals_S_materials_qty" default="0">
<!--- <cfparam  name="Session.Annuals_S_materials_rate" default="0"> --->
<cfparam  name="Annuals_S_qty" default="0"  >
<cfparam  name="Annuals_S_times" default="0">
<cfparam  name="Annuals_S_materials_qty" default="0">
<!--- <cfparam  name="Annuals_S_materials_rate" default="0"> --->
<cfparam  name="Session.Annuals_F_qty" default="0"  >
<cfparam  name="Session.Annuals_F_times" default="0">
<cfparam  name="Session.Annuals_F_materials_qty" default="0">
<!--- <cfparam  name="Session.Annuals_F_materials_rate" default="0"> --->
<cfparam  name="Annuals_F_qty" default="0"  >
<cfparam  name="Annuals_F_times" default="0">
<cfparam  name="Annuals_F_materials_qty" default="0">
<!--- <cfparam  name="Annuals_F_materials_rate" default="0"> --->
<cfparam  name="Session.Irrigation_SU_qty" default="0"  >
<cfparam  name="Session.Irrigation_SU_times" default="0">
<cfparam  name="Session.Irrigation_SU_materials_qty" default="0">
<!--- <cfparam  name="Session.Irrigation_SU_materials_rate" default="0"> --->
<cfparam  name="Irrigation_SU_qty" default="0"  >
<cfparam  name="Irrigation_SU_times" default="0">
<cfparam  name="Irrigation_SU_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_SU_materials_rate" default="0"> --->
<cfparam  name="Session.Irrigation_W_qty" default="0"  >
<cfparam  name="Session.Irrigation_W_times" default="0">
<cfparam  name="Session.Irrigation_W_materials_qty" default="0">
<!--- <cfparam  name="Session.Irrigation_W_materials_rate" default="0"> --->
<cfparam  name="Irrigation_W_qty" default="0"  >
<cfparam  name="Irrigation_W_times" default="0">
<cfparam  name="Irrigation_W_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_W_materials_rate" default="0"> --->
<cfparam  name="Session.Irrigation_I_qty" default="0"  >
<cfparam  name="Session.Irrigation_I_times" default="0">
<cfparam  name="Session.Irrigation_I_materials_qty" default="0">
<!--- <cfparam  name="Session.Irrigation_I_materials_rate" default="0"> --->
<cfparam  name="Irrigation_I_qty" default="0"  >
<cfparam  name="Irrigation_I_times" default="0">
<cfparam  name="Irrigation_I_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_I_materials_rate" default="0"> --->
<cfparam  name="Session.Mulch_F_Reg_qty" default="0"  >
<cfparam  name="Session.Mulch_F_Reg_times" default="0">
<cfparam  name="Session.Mulch_F_Reg_materials_qty" default="0">
<!--- <cfparam  name="Session.Mulch_F_Reg_materials_rate" default="0">  --->
<cfparam  name="Mulch_F_Reg_qty" default="0"  >
<cfparam  name="Mulch_F_Reg_times" default="0">
<cfparam  name="Mulch_F_Reg_materials_qty" default="0">
<!--- <cfparam  name="Mulch_F_Reg_materials_rate" default="0">  --->
<cfparam  name="Session.Mulch_S_Reg_qty" default="0"  >
<cfparam  name="Session.Mulch_S_Reg_times" default="0">
<cfparam  name="Session.Mulch_S_Reg_materials_qty" default="0">
<!--- <cfparam  name="Session.Mulch_S_Reg_materials_rate" default="0">  --->
<cfparam  name="Mulch_S_Reg_qty" default="0"  >
<cfparam  name="Mulch_S_Reg_times" default="0">
<cfparam  name="Mulch_S_Reg_materials_qty" default="0">
<!--- <cfparam  name="Mulch_S_Reg_materials_rate" default="0">  --->
<cfparam  name="Session.Pond_Maint_qty" default="0"  >
<cfparam  name="Session.Pond_Maint_times" default="0">
<cfparam  name="Session.Pond_Maint_materials_qty" default="0">
<!---  <cfparam  name="Session.Pond_Maint_materials_rate" default="0">  --->
<cfparam  name="Pond_Maint_qty" default="0"  >
<cfparam  name="Pond_Maint_times" default="0">
<cfparam  name="Pond_Maint_materials_qty" default="0">
<!---   <cfparam  name="Pond_Maint_materials_rate" default="0">  --->
<cfparam  name="Session.Trim_Hillside_qty" default="0"  >
<cfparam  name="Session.Trim_Hillside_times" default="0">
<!--- <cfparam  name="Session.Trim_Hillside_materials_qty" default="0"> --->
<!---  <cfparam  name="Session.Trim_Hillside_materials_rate" default="0">  --->
<cfparam  name="Trim_Hillside_qty" default="0"  >
<cfparam  name="Trim_Hillside_times" default="0">
<!--- <cfparam  name="Trim_Hillside_materials_qty" default="0"> --->
<!---   <cfparam  name="Trim_Hillside_materials_rate" default="0">  --->
<cfparam  name="Session.Pine_Tags_qty" default="0"  >
<cfparam  name="Session.Pine_Tags_times" default="0">
<cfparam  name="Session.Pine_Tags_materials_qty" default="0">
<!---  <cfparam  name="Session.Pine_Tags_materials_rate" default="0">  --->
<cfparam  name="Pine_Tags_qty" default="0"  >
<cfparam  name="Pine_Tags_times" default="0">
<cfparam  name="Pine_Tags_materials_qty" default="0">
<!---<cfparam  name="Pine_Tags_materials_rate" default="0">--->
<cfparam  name="Session.TS_hort_oil_qty" default="0"  >
<cfparam  name="Session.TS_hort_oil_times" default="0">
<cfparam  name="Session.TS_hort_oil_materials_qty" default="0">
<!---  <cfparam  name="Session.TS_hort_oil_MATERIALS_RATE" default="0">  --->
<cfparam  name="TS_hort_oil_qty" default="0"  >
<cfparam  name="TS_hort_oil_times" default="0">
<cfparam  name="TS_hort_oil_materials_qty" default="0">
<!---<cfparam  name="TS_hort_oil_MATERIALS_RATE" default="0">--->
<cfparam  name="Session.Addtl_Mowing_qty" default="0"  >
<cfparam  name="Session.Addtl_Mowing_times" default="0">
<!--- <cfparam  name="Session.Addtl_Mowing_materials_qty" default="0">
 <cfparam  name="Session.Addtl_Mowing_MATERIALS_RATE" default="0">  --->
<cfparam  name="Addtl_Mowing_qty" default="0"  >
<cfparam  name="Addtl_Mowing_times" default="0">
<!--- <cfparam  name="Addtl_Mowing_materials_qty" default="0">
  <cfparam  name="Addtl_Mowing_MATERIALS_RATE" default="0">  --->
<cfparam  name="Session.Day_Porter_qty" default="0"  >
<cfparam  name="Session.Day_Porter_times" default="0">
<!--- <cfparam  name="Session.Day_Porter_materials_qty" default="0">
 <cfparam  name="Session.Day_Porter_MATERIALS_RATE" default="0">  --->
<cfparam  name="Day_Porter_qty" default="0"  >
<cfparam  name="Day_Porter_times" default="0">
<cfparam  name="Session.Bush_Hog_qty" default="0"  >
<cfparam  name="Session.Bush_Hog_times" default="0">
<cfparam  name="Bush_Hog_qty" default="0"  >
<cfparam  name="Bush_Hog_times" default="0">
<cfparam  name="Session.Lot_Sweeping_qty" default="0"  >
<cfparam  name="Session.Lot_Sweeping_times" default="0">
<cfparam  name="Lot_Sweeping_qty" default="0"  >
<cfparam  name="Lot_Sweeping_times" default="0">
<cfparam  name="Session.Trail_Maint_qty" default="0"  >
<cfparam  name="Session.Trail_Maint_times" default="0">
<!--- <cfparam  name="Session.Trail_Maint_materials_qty" default="0">
 <cfparam  name="Session.Trail_Maint_MATERIALS_RATE" default="0">  --->
<cfparam  name="Trail_Maint_qty" default="0"  >
<cfparam  name="Trail_Maint_times" default="0">
<!--- <cfparam  name="Trail_Maint_materials_qty" default="0">
  <cfparam  name="Trail_Maint_MATERIALS_RATE" default="0">  --->
<cfparam  name="Session.Irrigation_TM_qty" default="0"  >
<cfparam  name="Session.Irrigation_TM_times" default="0">
<!--- <cfparam  name="Session.Irrigation_TM_materials_qty" default="0">
 <cfparam  name="Session.Irrigation_TM_MATERIALS_RATE" default="0">  --->
<cfparam  name="Irrigation_TM_qty" default="0"  >
<cfparam  name="Irrigation_TM_times" default="0">
<!--- <cfparam  name="Irrigation_TM_materials_qty" default="0">
  <cfparam  name="Irrigation_TM_MATERIALS_RATE" default="0">  --->
<cfparam  name="Session.Irrigation_BFI_qty" default="0"  >
<cfparam  name="Session.Irrigation_BFI_times" default="0">
<!--- <cfparam  name="Session.Irrigation_BFI_materials_qty" default="0">
 <cfparam  name="Session.Irrigation_BFI_MATERIALS_RATE" default="0">  --->
<cfparam  name="Irrigation_BFI_qty" default="0"  >
<cfparam  name="Irrigation_BFI_times" default="0">
<!--- <cfparam  name="Irrigation_BFI_materials_qty" default="0">
<cfparam  name="Irrigation_BFI_MATERIALS_RATE" default="0">  --->
<cfparam  name="Session.Natural_Area_qty" default="0"  >
<cfparam  name="Session.Natural_Area_times" default="0">
<!--- <cfparam  name="Session.Natural_Area_materials_qty" default="0">
 <cfparam  name="Session.Natural_Area_MATERIALS_RATE" default="0">  --->
<cfparam  name="Natural_Area_qty" default="0"  >
<cfparam  name="Natural_Area_times" default="0">
<!--- <cfparam  name="Natural_Area_materials_qty" default="0">
  <cfparam  name="Natural_Area_MATERIALS_RATE" default="0">  --->
<cfparam  name="Session.Trash_Receptacle_qty" default="0"  >
<cfparam  name="Session.Trash_Receptacle_times" default="0">
<cfparam  name="Trash_Receptacle_qty" default="0"  >
<cfparam  name="Trash_Receptacle_times" default="0">
<cfparam  name="Session.Playground_mulch_qty" default="0"  >
<cfparam  name="Session.Playground_mulch_times" default="0">
<cfparam  name="Session.Playground_mulch_materials_qty" default="0">
<cfparam  name="Session.Playground_mulch_MATERIALS_RATE" default="0">
<cfparam  name="Playground_mulch_qty" default="0"  >
<cfparam  name="Playground_mulch_times" default="0">
<cfparam  name="Playground_mulch_materials_qty" default="0">
<cfparam  name="Playground_mulch_MATERIALS_RATE" default="0">
<cfparam  name="Session.Turf_Nutsedge_qty" default="0"  >
<cfparam  name="Session.Turf_Nutsedge_times" default="0">
<cfparam  name="Session.Turf_Nutsedge_materials_qty" default="0">
<!---<cfparam  name="Session.Turf_Nutsedge_MATERIALS_RATE" default="0">--->
<cfparam  name="Turf_Nutsedge_qty" default="0"  >
<cfparam  name="Turf_Nutsedge_times" default="0">
<cfparam  name="Turf_Nutsedge_materials_qty" default="0">
<!---<cfparam  name="Turf_Nutsedge_MATERIALS_RATE" default="0"> Z--->

<cfparam  name="Session.Turf_Fungicide_qty" default="0"  >
<cfparam  name="Session.Turf_Fungicide_times" default="0">
<cfparam  name="Session.Turf_Fungicide_materials_qty" default="0">
<!---<cfparam  name="Session.Turf_Fungicide_MATERIALS_RATE" default="0">--->
<cfparam  name="Turf_Fungicide_qty" default="0"  >
<cfparam  name="Turf_Fungicide_times" default="0">
<cfparam  name="Turf_Fungicide_materials_qty" default="0">
<!---<cfparam  name="Turf_Fungicide_MATERIALS_RATE" default="0">--->
<cfparam  name="Session.Turf_Insecticide_qty" default="0"  >
<cfparam  name="Session.Turf_Insecticide_times" default="0">
<cfparam  name="Session.Turf_Insecticide_materials_qty" default="0">
<!---<cfparam  name="Session.Turf_Insecticide_MATERIALS_RATE" default="0">--->
<cfparam  name="Turf_Insecticide_qty" default="0"  >
<cfparam  name="Turf_Insecticide_times" default="0">
<cfparam  name="Turf_Insecticide_materials_qty" default="0">
<!---<cfparam  name="Turf_Insecticide_MATERIALS_RATE" default="0">--->
<cfparam  name="Session.blank1_qty" default="0"  >
<cfparam  name="Session.blank1_times" default="0">
<cfparam  name="Session.blank1_materials_qty" default="0">
<cfparam  name="Session.blank1_MATERIALS_RATE" default="0">
<cfparam  name="blank1_qty" default="0"  >
<cfparam  name="blank1_times" default="0">
<cfparam  name="blank1_materials_qty" default="0">
<cfparam  name="blank1_MATERIALS_RATE" default="0">
<cfparam  name="Session.blank1_rate" default="1"  >
<cfif IsDefined("form.BLANK1_COST")>
  <cfparam  name="Session.BLANK1_COST" default="#form.BLANK1_COST#"  >
  <cfelse>
  <cfparam  name="Session.BLANK1_COST" default="10.50"  >
</cfif>
<cfparam  name="Session.blank1_unit" default=""  >
<cfparam  name="Session.BLANK1_SERVICE" default=""  >
<cfparam  name="BLANK1_SERVICE" default=""  >
<cfparam  name="BLANK1_unit" default=""  >
<cfparam  name="BLANK1_rate" default="1"  >
<cfparam  name="Session.blank2_qty" default="0"  >
<cfparam  name="Session.blank2_times" default="0">
<cfparam  name="Session.blank2_materials_qty" default="0">
<cfparam  name="Session.blank2_MATERIALS_RATE" default="0">
<cfparam  name="blank2_qty" default="0"  >
<cfparam  name="blank2_times" default="0">
<cfparam  name="blank2_materials_qty" default="0">
<cfparam  name="blank2_MATERIALS_RATE" default="0">
<cfparam  name="Session.blank2_rate" default="1"  >
<cfif IsDefined("form.BLANK2_COST")>
  <cfparam  name="Session.BLANK2_COST" default="#form.BLANK2_COST#"  >
  <cfelse>
  <cfparam  name="Session.BLANK2_COST" default="10.50"  >
</cfif>
<cfparam  name="Session.blank2_unit" default=""  >
<cfparam  name="Session.BLANK2_SERVICE" default=""  >
<cfparam  name="BLANK2_SERVICE" default=""  >
<cfparam  name="BLANK2_unit" default=""  >
<cfparam  name="BLANK2_rate" default="1"  >
<cfparam  name="Session.blank3_qty" default="0"  >
<cfparam  name="Session.blank3_times" default="0">
<cfparam  name="Session.blank3_materials_qty" default="0">
<cfparam  name="Session.blank3_MATERIALS_RATE" default="0">
<cfparam  name="blank3_qty" default="0"  >
<cfparam  name="blank3_times" default="0">
<cfparam  name="blank3_materials_qty" default="0">
<cfparam  name="blank3_MATERIALS_RATE" default="0">
<cfparam  name="Session.blank3_rate" default="1"  >
<cfif IsDefined("form.BLANK3_COST")>
  <cfparam  name="Session.BLANK3_COST" default="#form.BLANK3_COST#"  >
  <cfelse>
  <cfparam  name="Session.BLANK3_COST" default="10.50"  >
</cfif>
<cfparam  name="Session.blank3_unit" default=""  >
<cfparam  name="Session.blank3_SERVICE" default=""  >
<cfparam  name="blank3_SERVICE" default=""  >
<cfparam  name="blank3_unit" default=""  >
<cfparam  name="blank3_rate" default="1"  >
<cfparam  name= "Session.Irrigation_Contract" default="0">
<cfparam  name= "Session.Seasonal_Color_Contract" default="0">
<cfparam  name= "Session.Grounds_Maintenance_Contract" default="0">
<cfparam  name="Session.contract_start_date" default="">
<cfparam  name="Session.contract_end_date" default="">
<cfparam  name="Session.contract_installments" default="">
<cfparam  name="form.contract_start_date" default="">
<cfparam  name="form.contract_end_date" default="">
<cfparam  name="Session.seasonal_hours" default="0">
<cfparam  name="Session.travel_time_gm" default="0"  >
<cfparam  name="Session.lot_sweeping_gm" default="0"  >
<cfparam  name="Session.blank1_gm" default="0"  >
<cfparam  name="Session.blank2_gm" default="0"  >
<cfparam  name="Session.blank3_gm" default="0"  >
<cfparam  name="Session.TAXRATEPLUSONE" default="0"  >
<cfparam  name="Session.TAXRATE" default="0"  >
 <cfparam  name="Session.contract_adjustment" default="0"  > 
<cfparam  name="contract_adjustment" default="0"  >
<cfquery name="get_quote_info" datasource="jrgm">
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
opportunity_field_14 AS q_opportunity_type  ,
OPPORTUNITY_status ,
date_updated_utc, 
date_due_utc,
date_quote_started,
date_quote_updated
FROM         quote_start
where opportunity_id  =#url.id#
</cfquery>
<!--- Quote Main Insert --->
<cfquery name="check_for_quote_main" datasource="jrgm">
SELECT opportunity_id FROM quote_main  WHERE  opportunity_id =#url.id#
</cfquery>
<cfif check_for_quote_main.recordcount EQ 0>
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
</cfif>
<!--- Quote Main Insert --->
<!--- Quote Services Insert --->
<cfquery name="check_for_quote_services" datasource="jrgm">
SELECT opportunity_id FROM quote_services  WHERE  opportunity_id =#url.id#
</cfquery>
<cfif check_for_quote_services.recordcount EQ 0>
  <cfquery name="insert_quote_main" datasource="jrgm">
INSERT INTO quote_services (opportunity_id) VALUES ('#url.id#')
</cfquery>
  <cfquery name="do_update_services" datasource="jrgm">
UPDATE quote_services SET 
gross_margin = '50.000', 
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
<!---travel_time_gm =  '#NumberFormat(Session.travel_time_gm,"999999.99")#',  --->
lot_sweeping_gm = '#NumberFormat(Session.lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(Session.blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(Session.blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(Session.blank3_gm,"999999.99")#',
contract_adjustment ='#NumberFormat(contract_adjustment,"999999.99")#'


WHERE opportunity_id = #url.id#
</cfquery>
</cfif>

<!--- Quote Services Insert --->
<!--- Quote Materials Insert --->
<cfquery name="check_for_quote_materials" datasource="jrgm">
SELECT opportunity_id FROM quote_materials  WHERE  opportunity_id =#url.id#
</cfquery>
<cfif check_for_quote_materials.recordcount EQ 0>
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
</cfif>

<!--- Quote Materials Insert --->
<cfif IsDefined("form.btnSumit")  >
  <cfquery name="get_service_info" datasource="jrgm">
SELECT * FROM quote_services   WHERE opportunity_id  =#url.id#
</cfquery>
  <CFSET spraying_qty_pre =  get_service_info.spraying_qty>
  <CFSET turf_preg_qty_pre =  get_service_info.turf_preg_qty>
  <CFSET turf_prel_qty_pre =  get_service_info.turf_prel_qty>
  <CFSET turf_post_qty_pre =  get_service_info.turf_post_qty>
  <CFSET turf_fert_qty_pre =  get_service_info.turf_fert_qty>
  <CFSET turf_lime_qty_pre =  get_service_info.turf_lime_qty>
  <CFSET TS_Fert_qty_pre =  get_service_info.TS_Fert_qty>
  <CFSET TS_insect_qty_pre =  get_service_info.TS_insect_qty>
  <CFSET TS_hort_oil_qty_pre =  get_service_info.TS_hort_oil_qty>
  <CFSET Turf_Insecticide_qty_pre =  get_service_info.Turf_Insecticide_qty>
  <CFSET Turf_Seed_qty_pre =  get_service_info.turf_seed_qty>
  <CFSET Turf_Fungicide_qty_pre =  get_service_info.Turf_Fungicide_qty>
  <CFSET Turf_Nutsedge_qty_pre =  get_service_info.Turf_Nutsedge_qty>
  <CFSET Mulch_Pre_qty_pre =  get_service_info.Mulch_Pre_qty>
  <CFSET mulch_s_dyed_qty_pre =  get_service_info.mulch_s_dyed_qty>
  <CFSET mulch_f_dyed_qty_pre =  get_service_info.mulch_f_dyed_qty>
  <CFSET mulch_s_reg_qty_pre =  get_service_info.mulch_s_reg_qty>
  <CFSET mulch_f_reg_qty_pre =  get_service_info.mulch_f_reg_qty>
  <CFSET Playground_mulch_qty_pre =  get_service_info.Playground_mulch_qty>
  <CFSET Pine_Tags_qty_pre =  get_service_info.Pine_Tags_qty>
  <CFSET Annuals_S_qty_pre =  get_service_info.Annuals_S_qty>
  <CFSET Annuals_F_qty_pre =  get_service_info.Annuals_F_qty>
  <cfquery name="do_update_services" datasource="jrgm">  
UPDATE quote_services SET 
gross_margin = '#NumberFormat(gross_margin,"999999.999")#',
push_mow_qty = '#push_mow_qty#', 
push_mow_times =  '#push_mow_times#',
push_mow_rate = '#push_mow_rate#', 
walk_behind_qty = '#walk_behind_qty#', 
walk_behind_times =  '#walk_behind_times#',
walk_behind_rate =  '#walk_behind_rate#',
ride_mow_qty = '#ride_mow_qty#', 
ride_mow_times =  '#ride_mow_times#',
ride_mow_rate =  '#ride_mow_rate#',
hard_edge_qty = '#hard_edge_qty#', 
hard_edge_times =  '#hard_edge_times#',
hard_edge_rate =  '#hard_edge_rate#',
bed_edge_qty = '#bed_edge_qty#', 
bed_edge_times =  '#bed_edge_times#',
bed_edge_rate =  '#bed_edge_rate#',
Trim_O_qty = '#TRIM(Trim_O_qty)#', 
Trim_O_Times =  '#Trim_O_Times#',
Trim_O_rate =  '#Trim_O_rate#',
Trim_S_qty = '#Trim_S_qty#', 
trim_S_times =  '#trim_S_times#',
Trim_S_rate =  '#Trim_S_rate#',
spraying_qty = '#spraying_qty#', 
spraying_times =  '#spraying_times#',
spraying_rate =  '#spraying_rate#',
weeding_qty = '#weeding_qty#', 
weeding_times =  '#weeding_times#',
weeding_rate =  '#weeding_rate#',
blowing_qty = '#blowing_qty#', 
blowing_times =  '#blowing_times#',
blowing_rate =  '#blowing_rate#',
Trash_S_Qty = '#Trash_S_Qty#', 
Trash_S_Times =  '#Trash_S_Times#',
traveltime_qty = '#traveltime_qty#', 
traveltime_times =  '#traveltime_times#',
traveltime_rate = '#SESSION.traveltime_rate#',
traveltime_cost = '#SESSION.traveltime_cost#',
Trash_O_Qty = '#Trash_O_Qty#', 
Trash_O_Times =  '#Trash_O_Times#',
Trash_O_rate =  '#Trash_O_rate#',
leafrem_qty = '#leafrem_qty#', 
leafrem_times =  '#leafrem_times#',
leafrem_rate =  '#leafrem_rate#',
cleanup_qty = '#cleanup_qty#', 
cleanup_times =  '#cleanup_times#',
cleanup_rate =  '#cleanup_rate#',
turf_preg_qty = '#turf_preg_qty#', 
turf_preg_times =  '#turf_preg_times#',
turf_preg_rate =  '#turf_preg_rate#',
turf_prel_qty = '#turf_prel_qty#', 
turf_prel_times =  '#turf_prel_times#',
turf_prel_rate =  '#turf_prel_rate#',
turf_prel_cost =  '#SESSION.turf_prel_cost#' ,
turf_post_qty = '#turf_post_qty#', 
turf_post_times =  '#turf_post_times#',
turf_post_rate =  '#turf_post_rate#',
turf_post_cost =  '#SESSION.turf_post_cost#' ,
turf_fert_qty = '#turf_fert_qty#', 
turf_fert_times =  '#turf_fert_times#',
turf_fert_rate =  '#turf_fert_rate#',
turf_fert_cost =  '#SESSION.turf_fert_cost#' ,
turf_lime_qty = '#turf_lime_qty#', 
turf_lime_times =  '#turf_lime_times#',
turf_lime_rate =  '#turf_lime_rate#',
turf_lime_cost =  '#SESSION.turf_lime_cost#' ,
Turf_Aer_H_qty = '#Turf_Aer_H_qty#', 
Turf_Aer_H_times =  '#Turf_Aer_H_times#',
Turf_Aer_H_rate =  '#Turf_Aer_H_rate#',
Turf_Aer_H_cost =  '#SESSION.Turf_Aer_H_cost#' ,
Turf_Aer_T_qty = '#Turf_Aer_T_qty#', 
Turf_Aer_T_times =  '#Turf_Aer_T_times#',
Turf_Aer_T_rate =  '#Turf_Aer_T_rate#',
Turf_Aer_T_cost =  '#SESSION.Turf_Aer_T_cost#' ,
Turf_Seed_qty = '#Turf_Seed_qty#', 
Turf_Seed_times =  '#Turf_Seed_times#',
Turf_Seed_rate =  '#Turf_Seed_rate#',
Turf_Seed_cost =  '#SESSION.Turf_Seed_cost#' ,
Pruning_TP_qty = '#Pruning_TP_qty#', 
Pruning_TP_times =  '#Pruning_TP_times#',
Pruning_TP_rate =  '#Pruning_TP_rate#',
Pruning_TP_cost =  '#SESSION.Pruning_TP_cost#' ,
Pruning_S_qty = '#Pruning_S_qty#', 
Pruning_S_times =  '#Pruning_S_times#',
Pruning_S_rate =  '#Pruning_S_rate#',
Pruning_S_cost =  '#SESSION.Pruning_S_cost#' ,
TS_Fert_qty = '#TS_Fert_qty#', 
TS_Fert_times =  '#TS_Fert_times#',
TS_Fert_rate =  '#TS_Fert_rate#',
TS_Fert_cost =  '#SESSION.TS_Fert_cost#' ,
TS_Insect_qty = '#TS_Insect_qty#', 
TS_Insect_times =  '#TS_Insect_times#',
TS_Insect_rate =  '#TS_Insect_rate#',
TS_Insect_cost =  '#SESSION.TS_Insect_cost#' ,
Mulch_pre_qty = '#Mulch_pre_qty#', 
Mulch_pre_times =  '#Mulch_pre_times#',
Mulch_pre_rate =  '#Mulch_pre_rate#',
Mulch_pre_cost =  '#SESSION.Mulch_pre_cost#' ,
Mulch_edging_qty = '#Mulch_edging_qty#', 
Mulch_edging_times =  '#Mulch_edging_times#',
Mulch_edging_rate =  '#Mulch_edging_rate#',
Mulch_edging_cost =  '#SESSION.Mulch_edging_cost#' ,
mulch_s_dyed_qty = '#mulch_s_dyed_qty#', 
mulch_s_dyed_times =  '#mulch_s_dyed_times#',
mulch_s_dyed_rate =  '#mulch_s_dyed_rate#',
mulch_s_dyed_cost =  '#SESSION.mulch_s_dyed_cost#' ,
mulch_f_dyed_qty = '#mulch_f_dyed_qty#', 
mulch_f_dyed_times =  '#mulch_f_dyed_times#',
mulch_f_dyed_rate =  '#mulch_f_dyed_rate#',
mulch_f_dyed_cost =  '#SESSION.mulch_f_dyed_cost#' ,
Annuals_S_qty = '#Annuals_S_qty#', 
Annuals_S_times =  '#Annuals_S_times#',
Annuals_S_rate =  '#Annuals_S_rate#',
Annuals_S_cost =  '#SESSION.Annuals_S_cost#' ,
Annuals_F_qty = '#Annuals_F_qty#', 
Annuals_F_times =  '#Annuals_F_times#',
Annuals_F_rate =  '#Annuals_F_rate#',
Annuals_F_cost =  '#SESSION.Annuals_F_cost#' ,
Irrigation_SU_qty = '#Irrigation_SU_qty#', 
Irrigation_SU_times =  '#Irrigation_SU_times#',
Irrigation_SU_rate =  '#Irrigation_SU_rate#',
Irrigation_SU_cost =  '#SESSION.Irrigation_SU_cost#' ,
Irrigation_W_qty = '#Irrigation_W_qty#', 
Irrigation_W_times =  '#Irrigation_W_times#',
Irrigation_W_rate =  '#Irrigation_W_rate#',
Irrigation_W_cost =  '#SESSION.Irrigation_W_cost#' ,
Irrigation_I_qty = '#Irrigation_I_qty#', 
Irrigation_I_times =  '#Irrigation_I_times#',
Irrigation_I_rate =  '#Irrigation_I_rate#',
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
Irrigation_BFI_cost =  '#SESSION.Irrigation_BFI_cost#',
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
Playground_mulch_cost =  '#SESSION.Playground_mulch_cost#' ,
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

<cfif form.contract_start_date NEQ "">
contract_start_date = '#dateformat(form.contract_start_date,"mm/dd/yyyy")#',
</cfif>
<cfif form.contract_end_date NEQ "">
contract_end_date = '#dateformat(form.contract_end_date,"mm/dd/yyyy")#',
</cfif>

<cfif form.contract_installments NEQ "">
contract_installments= '#form.contract_installments#',
</cfif>
<!---<cfif form.contract_adjustment NEQ "">
contract_adjustment= '#form.contract_adjustment#',
</cfif>--->

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
blank3_cost =  '#SESSION.blank3_cost#',
<!--- travel_time_gm =  '#NumberFormat(travel_time_gm,"999999.99")#',  --->
lot_sweeping_gm = '#NumberFormat(lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(blank3_gm,"999999.99")#',
contract_adjustment ='#NumberFormat(contract_adjustment,"999999.99")#' 

WHERE opportunity_id = #url.id#
</cfquery>
  
  <!---  <CFSET spraying_qty_post =  get_service_info.spraying_qty> 
  --->
  
  <cfquery name="do_update_materials" datasource="jrgm">
UPDATE quote_materials SET 
turf_preg_materials_qty = '#form.turf_preg_materials_qty#', turf_preg_materials_rate = '#form.turf_preg_materials_rate#'  ,
spraying_materials_qty = '#form.spraying_materials_qty#', spraying_materials_rate = '#form.spraying_materials_rate#'  ,
turf_prel_materials_qty = '#form.turf_prel_materials_qty#', turf_prel_materials_rate = '#form.turf_prel_materials_rate#'  ,
 turf_post_materials_qty = '#form.turf_post_materials_qty#', turf_post_materials_rate = '#form.turf_post_materials_rate#'   ,
 turf_fert_materials_qty = '#form.turf_fert_materials_qty#', turf_fert_materials_rate = '#form.turf_fert_materials_rate#'   ,
 turf_lime_materials_qty = '#form.turf_lime_materials_qty#', turf_lime_materials_rate = '#form.turf_lime_materials_rate#' ,
Turf_Seed_materials_qty = '#form.Turf_Seed_materials_qty#', Turf_Seed_materials_rate = '#form.Turf_Seed_materials_rate#' ,
TS_Fert_materials_qty = '#form.TS_Fert_materials_qty#', TS_Fert_materials_rate = '#form.TS_Fert_materials_rate#'    ,
TS_Insect_materials_qty = '#form.TS_Insect_materials_qty#', TS_Insect_materials_rate = '#form.TS_Insect_materials_rate#'   ,
Mulch_pre_materials_qty = '#form.Mulch_pre_materials_qty#', Mulch_pre_materials_rate = '#form.Mulch_pre_materials_rate#'   ,
mulch_s_dyed_materials_qty = '#form.mulch_s_dyed_materials_qty#', mulch_s_dyed_materials_rate = '#form.mulch_s_dyed_materials_rate#' ,
mulch_f_dyed_materials_qty = '#form.mulch_f_dyed_materials_qty#', mulch_f_dyed_materials_rate = '#form.mulch_f_dyed_materials_rate#'   ,
Annuals_S_materials_qty = '#form.Annuals_S_materials_qty#', Annuals_S_materials_rate = '#form.Annuals_S_materials_rate#'  ,
Annuals_F_materials_qty = '#form.Annuals_F_materials_qty#', Annuals_F_materials_rate = '#form.Annuals_F_materials_rate#' ,
Mulch_F_Reg_materials_qty = '#form.Mulch_F_Reg_materials_qty#', Mulch_F_Reg_materials_rate = '#form.Mulch_F_Reg_materials_rate#'  ,
Mulch_S_Reg_materials_qty = '#form.Mulch_S_Reg_materials_qty#', Mulch_S_Reg_materials_rate = '#form.Mulch_S_Reg_materials_rate#' ,
Pine_Tags_materials_qty = '#form.Pine_Tags_materials_qty#', Pine_Tags_materials_rate = '#form.Pine_Tags_materials_rate#'   ,
TS_hort_oil_materials_qty = '#form.TS_hort_oil_materials_qty#', TS_hort_oil_materials_rate = '#form.TS_hort_oil_materials_rate#'  ,
Playground_mulch_materials_qty = '#form.Playground_mulch_materials_qty#', Playground_mulch_materials_rate = '#form.Playground_mulch_materials_rate#' ,
Turf_Nutsedge_materials_qty = '#form.Turf_Nutsedge_materials_qty#', Turf_Nutsedge_materials_rate = '#form.Turf_Nutsedge_materials_rate#'   , Turf_Fungicide_materials_qty = '#form.Turf_Fungicide_materials_qty#', Turf_Fungicide_materials_rate = '#form.Turf_Fungicide_materials_rate#'   ,
Turf_Insecticide_materials_qty = '#form.Turf_Insecticide_materials_qty#', Turf_Insecticide_materials_rate = '#form.Turf_Insecticide_materials_rate#'   
 WHERE opportunity_id  =#url.id#
</cfquery>
</cfif>
<cfquery name="get_quote_main" datasource="jrgm">
SELECT * FROM quote_main  WHERE  opportunity_id  =#url.id#
</cfquery>
<cfquery name="get_service_info" datasource="jrgm">
SELECT * FROM quote_services   WHERE opportunity_id  =#url.id#
</cfquery>
<cfquery name="get_materials_info" datasource="jrgm">
SELECT * FROM quote_materials  WHERE opportunity_id  =#url.id#
</cfquery>
<cfset Session.overtime_adjustment_rate = 1.10>
<cfset Session.gross_margin = get_service_info.gross_margin>
<cfset Session.gross_margin_diff = (100-Session.gross_margin)/100>

<cfset Session.CONTRACT_ADJUSTMENT = get_service_info.CONTRACT_ADJUSTMENT>

<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset Session.push_mow_service_rate = 10.50>  --->
<cfset Session.push_mow_qty  = get_service_info.push_mow_qty >
<cfset Session.push_mow_cost  = get_service_info.push_mow_cost>
<cfset Session.push_mow_rate = get_service_info.push_mow_rate>
<cfset Session.push_mow_hours  = Session.push_mow_qty/Session.push_mow_rate>
<cfset Session.push_mow_hoursA = #NumberFormat(Session.push_mow_hours,"999,999.9")#>
<cfset Session.push_mow_actualprice  = Session.push_mow_hours*Session.push_mow_cost>
<cfset Session.push_mow_materials_rate  = 0>
<cfset Session.push_mow_service_materials  = Session.push_mow_actualprice+Session.push_mow_materials_rate >
<cfset Session.push_mow_times  = get_service_info.push_mow_times>
<cfset Session.push_mow_actual_extended  = Session.push_mow_times* #NumberFormat(Session.push_mow_service_materials,"999999.99")#>
<cfset Session.push_mow_actual_extended  =  #ROUND(Session.push_mow_actual_extended)#>
<cfset Session.push_mow_total_hours = Session.push_mow_hoursA*Session.push_mow_times>
<cfset Session.push_mow_overtime_adjustment =
Session.push_mow_actual_extended -
(Session.push_mow_total_hours*0.10* Session.push_mow_cost)+
(Session.push_mow_total_hours*0.10* Session.push_mow_cost*1.5)>
<cfset Session.push_mow_contract_price = Session.push_mow_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset Session.walk_behind_service_rate = 11.50>   --->
<cfset Session.walk_behind_qty  = get_service_info.walk_behind_qty >
<cfset Session.walk_behind_cost  = get_service_info.walk_behind_cost>
<cfset Session.walk_behind_rate = get_service_info.walk_behind_rate>
<cfset Session.walk_behind_hours  = Session.walk_behind_qty/Session.walk_behind_rate>
<cfset Session.walk_behind_hoursA = #NumberFormat(Session.walk_behind_hours,"999,999.9")#>
<cfset Session.walk_behind_actualprice  = Session.walk_behind_hours*Session.walk_behind_cost>
<cfset Session.walk_behind_materials_rate  = 0>
<cfset Session.walk_behind_service_materials  = Session.walk_behind_actualprice+Session.walk_behind_materials_rate >
<cfset Session.walk_behind_times  = get_service_info.walk_behind_times>
<cfset Session.walk_behind_actual_extended  = Session.walk_behind_times* #NumberFormat(Session.walk_behind_service_materials,"999999.99")#>
<cfset Session.walk_behind_actual_extended  =  #ROUND(Session.walk_behind_actual_extended)#>
<cfset Session.walk_behind_total_hours = Session.walk_behind_hoursA*Session.walk_behind_times>
<cfset Session.walk_behind_overtime_adjustment =
Session.walk_behind_actual_extended -
(Session.walk_behind_total_hours*0.10* Session.walk_behind_cost)+
(Session.walk_behind_total_hours*0.10* Session.walk_behind_cost*1.5)>
<cfset Session.walk_behind_contract_price = Session.walk_behind_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  - <cfset Session.ride_mow_service_rate = 11.50>    --->
<cfset Session.ride_mow_qty  = get_service_info.ride_mow_qty >
<cfset Session.ride_mow_cost  = get_service_info.ride_mow_cost>
<cfset Session.ride_mow_rate = get_service_info.ride_mow_rate>
<cfset Session.ride_mow_hours  = Session.ride_mow_qty/Session.ride_mow_rate>
<cfset Session.ride_mow_hoursA = #NumberFormat(Session.ride_mow_hours,"999,999.9")#>
<cfset Session.ride_mow_actualprice  = Session.ride_mow_hours*Session.ride_mow_cost>
<cfset Session.ride_mow_materials_rate  = 0>
<cfset Session.ride_mow_service_materials  = Session.ride_mow_actualprice+Session.ride_mow_materials_rate >
<cfset Session.ride_mow_times  = get_service_info.ride_mow_times>
<cfset Session.ride_mow_actual_extended  = Session.ride_mow_times* #NumberFormat(Session.ride_mow_service_materials,"999999.99")#>
<cfset Session.ride_mow_actual_extended  =  #ROUND(Session.ride_mow_actual_extended)#>
<cfset Session.ride_mow_total_hours = Session.ride_mow_hoursA*Session.ride_mow_times>
<cfset Session.ride_mow_overtime_adjustment =
Session.ride_mow_actual_extended -
(Session.ride_mow_total_hours*0.10* Session.ride_mow_cost)+
(Session.ride_mow_total_hours*0.10* Session.ride_mow_cost*1.5)>
<cfset Session.ride_mow_contract_price = Session.ride_mow_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---    <cfset Session.hard_edge_service_rate = 11.50>   --->
<cfset Session.hard_edge_qty  = get_service_info.hard_edge_qty >
<cfset Session.hard_edge_cost  = get_service_info.hard_edge_cost>
<cfset Session.hard_edge_rate = get_service_info.hard_edge_rate>
<cfset Session.hard_edge_hours  = Session.hard_edge_qty/Session.hard_edge_rate>
<cfset Session.hard_edge_hoursA = #NumberFormat(Session.hard_edge_hours,"999,999.9")#>
<cfset Session.hard_edge_actualprice  = Session.hard_edge_hours*Session.hard_edge_cost>
<cfset Session.hard_edge_materials_rate  = 0>
<cfset Session.hard_edge_service_materials  = Session.hard_edge_actualprice+Session.hard_edge_materials_rate >
<cfset Session.hard_edge_times  = get_service_info.hard_edge_times>
<cfset Session.hard_edge_actual_extended  = Session.hard_edge_times* #NumberFormat(Session.hard_edge_service_materials,"999999.99")#>
<cfset Session.hard_edge_actual_extended  =  #ROUND(Session.hard_edge_actual_extended)#>
<cfset Session.hard_edge_total_hours = Session.hard_edge_hoursA*Session.hard_edge_times>
<cfset Session.hard_edge_overtime_adjustment =
Session.hard_edge_actual_extended -
(Session.hard_edge_total_hours*0.10* Session.hard_edge_cost)+
(Session.hard_edge_total_hours*0.10* Session.hard_edge_cost*1.5)>
<cfset Session.hard_edge_contract_price = Session.hard_edge_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---    <cfset Session.bed_edge_service_rate = 11.50>  --->
<cfset Session.bed_edge_qty  = get_service_info.bed_edge_qty >
<cfset Session.bed_edge_cost  = get_service_info.bed_edge_cost>
<cfset Session.bed_edge_rate = get_service_info.bed_edge_rate>
<cfset Session.bed_edge_hours  = Session.bed_edge_qty/Session.bed_edge_rate>
<cfset Session.bed_edge_hoursA = #NumberFormat(Session.bed_edge_hours,"999,999.9")#>
<cfset Session.bed_edge_actualprice  = Session.bed_edge_hours*Session.bed_edge_cost>
<cfset Session.bed_edge_materials_rate  = 0>
<cfset Session.bed_edge_service_materials  = Session.bed_edge_actualprice+Session.bed_edge_materials_rate >
<cfset Session.bed_edge_times  = get_service_info.bed_edge_times>
<cfset Session.bed_edge_actual_extended  = Session.bed_edge_times* #NumberFormat(Session.bed_edge_service_materials,"999999.99")#>
<cfset Session.bed_edge_actual_extended  =  #ROUND(Session.bed_edge_actual_extended)#>
<cfset Session.bed_edge_total_hours = Session.bed_edge_hoursA*Session.bed_edge_times>
<cfset Session.bed_edge_overtime_adjustment =
Session.bed_edge_actual_extended -
(Session.bed_edge_total_hours*0.10* Session.bed_edge_cost)+
(Session.bed_edge_total_hours*0.10* Session.bed_edge_cost*1.5)>
<cfset Session.bed_edge_contract_price = Session.bed_edge_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset Session.TRIM_O_service_rate = 11.50>   --->
<cfset Session.Trim_O_qty  = get_service_info.Trim_O_qty >
<cfset Session.TRIM_O_cost  = get_service_info.TRIM_O_cost>
<cfset Session.Trim_O_rate = get_service_info.Trim_O_rate>
<cfset Session.TRIM_O_hours  = Session.Trim_O_qty/Session.Trim_O_rate>
<cfset Session.TRIM_O_hoursA = #NumberFormat(Session.TRIM_O_hours,"999999.9")#>
<cfset Session.TRIM_O_actualprice  = Session.TRIM_O_hours*Session.TRIM_O_cost>
<cfset Session.TRIM_O_materials_rate  = 0>
<cfset Session.TRIM_O_service_materials  = Session.TRIM_O_actualprice+Session.TRIM_O_materials_rate >
<cfset Session.Trim_O_Times  = get_service_info.Trim_O_Times>
<cfset Session.TRIM_O_actual_extended  = Session.TRIM_O_times* #NumberFormat(Session.TRIM_O_service_materials,"999999.99")#>
<cfset Session.TRIM_O_actual_extended  =  #ROUND(Session.TRIM_O_actual_extended)#>
<cfset Session.TRIM_O_total_hours = Session.TRIM_O_hoursA*Session.TRIM_O_times>
<cfset Session.TRIM_O_overtime_adjustment =
Session.TRIM_O_actual_extended -
(Session.TRIM_O_total_hours*0.10* Session.TRIM_O_cost)+
(Session.TRIM_O_total_hours*0.10* Session.TRIM_O_cost*1.5)>
<cfset Session.TRIM_O_contract_price = Session.TRIM_O_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset Session.TRIM_S_service_rate = 11.50>  --->
<cfset Session.Trim_S_qty  = get_service_info.Trim_S_qty >
<cfset Session.Trim_S_Cost  = get_service_info.Trim_S_Cost>
<cfset Session.Trim_S_Rate = get_service_info.Trim_S_Rate>
<cfset Session.TRIM_S_hours  = Session.Trim_S_qty/Session.Trim_S_Rate>
<cfset Session.TRIM_S_hoursA = #NumberFormat(Session.TRIM_S_hours,"999,999.9")#>
<cfset Session.TRIM_S_actualprice  = Session.TRIM_S_hours*Session.Trim_S_Cost>
<cfset Session.TRIM_S_materials_rate  = 0>
<cfset Session.TRIM_S_service_materials  = Session.TRIM_S_actualprice+Session.TRIM_S_materials_rate >
<cfset Session.trim_S_times  = get_service_info.trim_S_times>
<cfset Session.TRIM_S_actual_extended  = Session.TRIM_S_times* #NumberFormat(Session.TRIM_S_service_materials,"999999.99")#>
<cfset Session.TRIM_S_actual_extended  =  #ROUND(Session.TRIM_S_actual_extended)#>
<cfset Session.TRIM_S_total_hours = Session.TRIM_S_hoursA*Session.TRIM_S_times>
<cfset Session.TRIM_S_overtime_adjustment =
Session.TRIM_S_actual_extended -
(Session.TRIM_S_total_hours*0.10* Session.TRIM_S_cost)+
(Session.TRIM_S_total_hours*0.10* Session.TRIM_S_cost*1.5)>
<cfset Session.TRIM_S_contract_price = Session.TRIM_S_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset Session.spraying_service_rate = 11.50>    --->
<cfset Session.spraying_qty  = get_service_info.spraying_qty >
<cfset Session.spraying_cost  = get_service_info.spraying_cost>
<cfset Session.spraying_rate = get_service_info.spraying_rate>
<cfset Session.spraying_hours  = Session.spraying_qty/Session.spraying_rate>
<cfset Session.spraying_hoursA = #NumberFormat(Session.spraying_hours,"999,999.9")#>
<cfset Session.spraying_actualprice  = Session.spraying_hours*Session.spraying_cost>
<cfset Session.spraying_materials_rate  = get_materials_info.spraying_materials_rate>
<!---<cfparam name="form.spraying_materials_qty" default="0">--->
<!---<br />
SESSION.spraying_materials_qty_actual :<cfoutput> #SESSION.spraying_materials_qty_actual#</cfoutput>
<br />SESSION.spraying_materials_qty :<cfoutput> #SESSION.spraying_materials_qty#</cfoutput><br />

get_materials_info.spraying_materials_qty--<cfoutput>#get_materials_info.spraying_materials_qty#</cfoutput><br /><br />
<br />

 <cfif  IsDefined("form.spraying_materials_qty")>
form.spraying_materials_qty =<cfoutput>#form.spraying_materials_qty#</cfoutput> 
</cfif><br />
<br />
<cfif  IsDefined("form.spraying_qty_pre")>
spraying_qty_pre  : <cfoutput>#spraying_qty_pre#</cfoutput>
</cfif>
<br />
<cfif  IsDefined("form.spraying_qty")>
spraying_qty_post  : <cfoutput>#form.spraying_qty#</cfoutput>
</cfif>
<!---<CFSET spraying_qty_pre =  get_service_info.spraying_qty>--->
--->

<cfif  IsDefined("form.spraying_qty")>
  <CFSET spraying_qty_post  =form.spraying_qty>
</cfif>
<cfset Session.spraying_materials_qty_actual=(get_service_info.spraying_qty /166)>
<cfset Session.spraying_materials_qty_actual=#NumberFormat(Session.spraying_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.spraying_materials_qty")    AND  get_materials_info.spraying_materials_qty  EQ Session.spraying_materials_qty_actual  AND Session.spraying_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif   IsDefined("form.spraying_materials_qty")    AND get_materials_info.spraying_materials_qty  EQ form.spraying_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")   <!---AND  form.spraying_materials_qty NEQ 0 --->  AND   IsDefined("spraying_qty_pre")   AND   IsDefined("spraying_qty_post") AND spraying_qty_pre NEQ  spraying_qty_post>
  <cfset Session.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif  IsDefined("form.spraying_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.spraying_materials_qty=(form.SPRAYING_MATERIALS_QTY)>
  <cfelseif   NOT IsDefined("form.spraying_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
  <cfelse>
  <cfset Session.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
</cfif>
<cfset Session.spraying_materials_qty = #NumberFormat(Session.spraying_materials_qty,"999999.99")#>
<cfset Session.spraying_materials_actualprice = Session.spraying_materials_rate*Session.spraying_materials_qty>
<cfset Session.spraying_service_materials  = Session.spraying_actualprice+Session.spraying_materials_actualprice >
<cfset Session.spraying_times  = get_service_info.spraying_times>
<cfset Session.spraying_actual_extended  = Session.spraying_times* #NumberFormat(Session.spraying_service_materials,"999999.99")#>
<cfset Session.spraying_actual_extended  =  #ROUND(Session.spraying_actual_extended)#>
<cfset Session.spraying_total_hours = Session.spraying_hoursA*Session.spraying_times>
<cfset Session.spraying_overtime_adjustment =
Session.spraying_actual_extended -
(Session.spraying_total_hours*0.10* Session.spraying_cost)+
(Session.spraying_total_hours*0.10* Session.spraying_cost*1.5)>
<cfset Session.spraying_contract_price = Session.spraying_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset Session.weeding_service_rate = 11.50>  --->
<cfset Session.weeding_qty  = get_service_info.weeding_qty >
<cfset Session.weeding_cost  = get_service_info.weeding_cost>
<cfset Session.weeding_rate = get_service_info.weeding_rate>
<cfset Session.weeding_hours  = Session.weeding_qty/Session.weeding_rate>
<cfset Session.weeding_hoursA = #NumberFormat(Session.weeding_hours,"999,999.9")#>
<cfset Session.weeding_actualprice  = Session.weeding_hours*Session.weeding_cost>
<cfset Session.weeding_materials_rate  = 0>
<cfset Session.weeding_service_materials  = Session.weeding_actualprice+Session.weeding_materials_rate >
<cfset Session.weeding_times  = get_service_info.weeding_times>
<cfset Session.weeding_actual_extended  = Session.weeding_times* #NumberFormat(Session.weeding_service_materials,"999999.99")#>
<cfset Session.weeding_actual_extended  =  #ROUND(Session.weeding_actual_extended)#>
<cfset Session.weeding_total_hours = Session.weeding_hoursA*Session.weeding_times>
<cfset Session.weeding_overtime_adjustment =
Session.weeding_actual_extended -
(Session.weeding_total_hours*0.10* Session.weeding_cost)+
(Session.weeding_total_hours*0.10* Session.weeding_cost*1.5)>
<cfset Session.weeding_contract_price = Session.weeding_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset Session.blowing_service_rate = 11.50>   --->
<cfset Session.blowing_qty  = get_service_info.blowing_qty >
<cfset Session.blowing_cost  = get_service_info.blowing_cost>
<cfset Session.blowing_rate = get_service_info.blowing_rate>
<cfset Session.blowing_hours  = Session.blowing_qty/Session.blowing_rate>
<cfset Session.blowing_hoursA = #NumberFormat(Session.blowing_hours,"999,999.9")#>
<cfset Session.blowing_actualprice  = Session.blowing_hours*Session.blowing_cost>
<cfset Session.blowing_materials_rate  = 0>
<cfset Session.blowing_service_materials  = Session.blowing_actualprice+Session.blowing_materials_rate >
<cfset Session.blowing_times  = get_service_info.blowing_times>
<cfset Session.blowing_actual_extended  = Session.blowing_times* #NumberFormat(Session.blowing_service_materials,"999999.99")#>
<cfset Session.blowing_actual_extended  =  #ROUND(Session.blowing_actual_extended)#>
<cfset Session.blowing_total_hours = Session.blowing_hoursA*Session.blowing_times>
<cfset Session.blowing_overtime_adjustment =
Session.blowing_actual_extended -
(Session.blowing_total_hours*0.10* Session.blowing_cost)+
(Session.blowing_total_hours*0.10* Session.blowing_cost*1.5)>
<cfset Session.blowing_contract_price = Session.blowing_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Trash_S_service_rate = 11.50> --->
<cfset Session.Trash_S_Qty  = get_service_info.Trash_S_Qty >
<cfset Session.Trash_S_Cost  = get_service_info.Trash_S_Cost>
<cfset Session.Trash_S_Rate = get_service_info.Trash_S_Rate>
<cfset Session.trash_s_hours  = Session.Trash_S_Qty/Session.Trash_S_Rate>
<cfset Session.trash_s_hoursA = #NumberFormat(Session.trash_s_hours,"999,999.9")#>
<cfset Session.Trash_S_actualprice  = Session.trash_s_hours*Session.Trash_S_Cost>
<cfset Session.Trash_s_materials_rate  = 0>
<cfset Session.Trash_s_service_materials  = Session.Trash_S_actualprice+Session.Trash_S_materials_rate >
<cfset Session.Trash_S_Times  = get_service_info.Trash_S_Times>
<cfset Session.Trash_S_actual_extended  = Session.Trash_S_times* #NumberFormat(Session.Trash_S_service_materials,"999999.99")#>
<cfset Session.Trash_S_actual_extended  =  #ROUND(Session.Trash_S_actual_extended)#>
<cfset Session.Trash_S_total_hours = Session.Trash_S_hoursA*Session.Trash_S_times>
<cfset Session.Trash_S_overtime_adjustment =
Session.Trash_S_actual_extended -
(Session.Trash_S_total_hours*0.10* Session.Trash_S_cost)+
(Session.Trash_S_total_hours*0.10* Session.Trash_S_cost*1.5)>
<cfset Session.Trash_S_contract_price = Session.Trash_S_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset Session.traveltime_service_rate = 11.50>--->
<cfset Session.traveltime_qty  = get_service_info.traveltime_qty >
<cfset Session.traveltime_cost  = get_service_info.traveltime_cost>
<cfset Session.traveltime_rate = get_service_info.traveltime_rate>
<cfset Session.traveltime_hours  = Session.traveltime_qty/Session.traveltime_rate>
<cfset Session.traveltime_hoursA = #NumberFormat(Session.traveltime_hours,"999,999.9")#>
<cfset Session.traveltime_actualprice  = Session.traveltime_hours*Session.traveltime_cost>
<cfset Session.traveltime_materials_rate  = 0>
<cfset Session.traveltime_service_materials  = Session.traveltime_actualprice+Session.traveltime_materials_rate >
<cfset Session.traveltime_times  = get_service_info.traveltime_times>
<cfset Session.traveltime_actual_extended  = Session.traveltime_times* #NumberFormat(Session.traveltime_service_materials,"999999.99")#>
<cfset Session.traveltime_actual_extended  =  #ROUND(Session.traveltime_actual_extended)#>
<cfset Session.traveltime_total_hours = Session.traveltime_hoursA*Session.traveltime_times>
<!--- <cfset Session.travel_time_gm  = get_service_info.travel_time_gm >
<cfset Session.gross_margin_diff_travel_time = (100-SESSION.travel_time_gm)/100>--->
<cfset Session.traveltime_overtime_adjustment =
Session.traveltime_actual_extended -
(Session.traveltime_total_hours*0.10* Session.traveltime_cost)+
(Session.traveltime_total_hours*0.10* Session.traveltime_cost*1.5)>
<!---<cfoutput>#Session.traveltime_overtime_adjustment# -#Session.gross_margin_diff_travel_time#</cfoutput>--->

<cfset Session.traveltime_contract_price = Session.traveltime_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Trash_O_service_rate = 11.50> --->
<cfset Session.Trash_O_Qty  = get_service_info.Trash_O_Qty >
<cfset Session.Trash_O_cost  = get_service_info.Trash_O_cost>
<cfset Session.Trash_O_rate = get_service_info.Trash_O_rate>
<cfset Session.Trash_O_hours  = Session.Trash_O_Qty/Session.Trash_O_rate>
<cfset Session.Trash_O_hoursA = #NumberFormat(Session.Trash_O_hours,"999,999.9")#>
<cfset Session.Trash_O_actualprice  = Session.Trash_O_hours*Session.Trash_O_cost>
<cfset Session.Trash_O_materials_rate  = 0>
<cfset Session.Trash_O_service_materials  = Session.Trash_O_actualprice+Session.Trash_O_materials_rate >
<cfset Session.Trash_O_Times  = get_service_info.Trash_O_Times>
<cfset Session.Trash_O_actual_extended  = Session.Trash_O_times* #NumberFormat(Session.Trash_O_service_materials,"999999.99")#>
<cfset Session.Trash_O_actual_extended  =  #ROUND(Session.Trash_O_actual_extended)#>
<cfset Session.Trash_O_total_hours = Session.Trash_O_hoursA*Session.Trash_O_times>
<cfset Session.Trash_O_overtime_adjustment =
Session.Trash_O_actual_extended -
(Session.Trash_O_total_hours*0.10* Session.Trash_O_cost)+
(Session.Trash_O_total_hours*0.10* Session.Trash_O_cost*1.5)>
<cfset Session.Trash_O_contract_price = Session.Trash_O_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.leafrem_service_rate = 11.50> --->
<cfset Session.leafrem_qty  = get_service_info.leafrem_qty >
<cfset Session.leafrem_cost  = get_service_info.leafrem_cost>
<cfset Session.leafrem_rate = get_service_info.leafrem_rate>
<cfset Session.leafrem_hours  = Session.leafrem_qty/Session.leafrem_rate>
<cfset Session.leafrem_hoursA = #NumberFormat(Session.leafrem_hours,"999,999.9")#>
<cfset Session.leafrem_actualprice  = Session.leafrem_hours*Session.leafrem_cost>
<cfset Session.leafrem_materials_rate  = 0>
<cfset Session.leafrem_service_materials  = Session.leafrem_actualprice+Session.leafrem_materials_rate >
<cfset Session.leafrem_times  = get_service_info.leafrem_times>
<cfset Session.leafrem_actual_extended  = Session.leafrem_times* #NumberFormat(Session.leafrem_service_materials,"999999.99")#>
<cfset Session.leafrem_actual_extended  =  #ROUND(Session.leafrem_actual_extended)#>
<cfset Session.leafrem_total_hours = Session.leafrem_hoursA*Session.leafrem_times>
<cfset Session.leafrem_overtime_adjustment =
Session.leafrem_actual_extended -
(Session.leafrem_total_hours*0.10* Session.leafrem_cost)+
(Session.leafrem_total_hours*0.10* Session.leafrem_cost*1.5)>
<cfset Session.leafrem_contract_price = Session.leafrem_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.cleanup_service_rate = 11.50> --->
<cfset Session.cleanup_qty  = get_service_info.cleanup_qty >
<cfset Session.cleanup_cost  = get_service_info.cleanup_cost>
<cfset Session.cleanup_rate = get_service_info.cleanup_rate>
<cfset Session.cleanup_hours  = Session.cleanup_qty/Session.cleanup_rate>
<cfset Session.cleanup_hoursA = #NumberFormat(Session.cleanup_hours,"999,999.9")#>
<cfset Session.cleanup_actualprice  = Session.cleanup_hours*Session.cleanup_cost>
<cfset Session.cleanup_materials_rate  = 0>
<cfset Session.cleanup_service_materials  = Session.cleanup_actualprice+Session.cleanup_materials_rate >
<cfset Session.cleanup_times  = get_service_info.cleanup_times>
<cfset Session.cleanup_actual_extended  = Session.cleanup_times* #NumberFormat(Session.cleanup_service_materials,"999999.99")#>
<cfset Session.cleanup_actual_extended  =  #ROUND(Session.cleanup_actual_extended)#>
<cfset Session.cleanup_total_hours = Session.cleanup_hoursA*Session.cleanup_times>
<cfset Session.cleanup_overtime_adjustment =
Session.cleanup_actual_extended -
(Session.cleanup_total_hours*0.10* Session.cleanup_cost)+
(Session.cleanup_total_hours*0.10* Session.cleanup_cost*1.5)>
<cfset Session.cleanup_contract_price = Session.cleanup_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.turf_preg_service_rate = 20.50>  --->
<cfset Session.turf_preg_qty  = get_service_info.turf_preg_qty >
<cfset Session.turf_preg_cost  = get_service_info.turf_preg_cost>
<cfset Session.turf_preg_rate = get_service_info.turf_preg_rate>
<cfset Session.turf_preg_hours  = Session.turf_preg_qty/Session.turf_preg_rate>
<cfset Session.turf_preg_hoursA = #NumberFormat(Session.turf_preg_hours,"999,999.9")#>
<cfset Session.turf_preg_actualprice  = Session.turf_preg_hours*Session.turf_preg_cost>
<cfset Session.turf_preg_materials_rate  = get_materials_info.turf_preg_materials_rate>
<cfif  IsDefined("form.turf_preg_qty")>
  <CFSET turf_preg_qty_post  =form.turf_preg_qty>
</cfif>
<cfset Session.turf_preg_materials_qty_actual=(get_service_info.turf_preg_qty /207)>
<cfset Session.turf_preg_materials_qty_actual=#NumberFormat(Session.turf_preg_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_preg_materials_qty")    AND  get_materials_info.turf_preg_materials_qty  EQ Session.turf_preg_materials_qty_actual  AND Session.turf_preg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif   IsDefined("form.turf_preg_materials_qty")    AND get_materials_info.turf_preg_materials_qty  EQ form.turf_preg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")       AND   IsDefined("turf_preg_qty_pre")   AND   IsDefined("turf_preg_qty_post") AND turf_preg_qty_pre NEQ  turf_preg_qty_post>
  <cfset Session.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif  IsDefined("form.turf_preg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_preg_materials_qty=(form.turf_preg_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_preg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
  <cfelse>
  <cfset Session.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
</cfif>
<cfset Session.turf_preg_materials_qty = #NumberFormat(Session.turf_preg_materials_qty,"999999.99")#>
<cfset Session.turf_preg_materials_actualprice = Session.turf_preg_materials_rate*Session.turf_preg_materials_qty>
<cfset Session.turf_preg_service_materials  = Session.turf_preg_actualprice+Session.turf_preg_materials_actualprice >
<cfset Session.turf_preg_times  = get_service_info.turf_preg_times>
<cfset Session.turf_preg_actual_extended  = Session.turf_preg_times* #NumberFormat(Session.turf_preg_service_materials,"999999.99")#>
<cfset Session.turf_preg_actual_extended  =  #ROUND(Session.turf_preg_actual_extended)#>
<cfset Session.turf_preg_total_hours = Session.turf_preg_hoursA*Session.turf_preg_times>
<cfset Session.turf_preg_overtime_adjustment =
Session.turf_preg_actual_extended -
(Session.turf_preg_total_hours*0.10* Session.turf_preg_cost)+
(Session.turf_preg_total_hours*0.10* Session.turf_preg_cost*1.5)>
<cfset Session.turf_preg_contract_price = Session.turf_preg_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.turf_prel_service_rate = 20.50>  --->
<cfset Session.turf_prel_qty  = get_service_info.turf_prel_qty >
<cfset Session.turf_prel_cost  = get_service_info.turf_prel_cost>
<cfset Session.turf_prel_rate = get_service_info.turf_prel_rate>
<cfset Session.turf_prel_hours  = Session.turf_prel_qty/Session.turf_prel_rate>
<cfset Session.turf_prel_hoursA = #NumberFormat(Session.turf_prel_hours,"999,999.9")#>
<cfset Session.turf_prel_actualprice  = Session.turf_prel_hours*Session.turf_prel_cost>
<cfset Session.turf_prel_materials_rate  = get_materials_info.turf_prel_materials_rate>
<cfif  IsDefined("form.turf_prel_qty")>
  <CFSET turf_prel_qty_post  =form.turf_prel_qty>
</cfif>
<cfset Session.turf_prel_materials_qty_actual=(get_service_info.turf_prel_qty /10000)>
<cfset Session.turf_prel_materials_qty_actual=#NumberFormat(Session.turf_prel_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_prel_materials_qty")    AND  get_materials_info.turf_prel_materials_qty  EQ Session.turf_prel_materials_qty_actual  AND Session.turf_prel_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif   IsDefined("form.turf_prel_materials_qty")    AND get_materials_info.turf_prel_materials_qty  EQ form.turf_prel_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_prel_qty_pre")   AND   IsDefined("turf_prel_qty_post") AND turf_prel_qty_pre NEQ  turf_prel_qty_post>
  <cfset Session.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif  IsDefined("form.turf_prel_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_prel_materials_qty=(form.turf_prel_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_prel_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
  <cfelse>
  <cfset Session.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
</cfif>
<cfset Session.turf_prel_materials_qty = #NumberFormat(Session.turf_prel_materials_qty,"999999.99")#>
<cfset Session.turf_prel_materials_actualprice = Session.turf_prel_materials_rate*Session.turf_prel_materials_qty>
<cfset Session.turf_prel_service_materials  = Session.turf_prel_actualprice+Session.turf_prel_materials_actualprice >
<cfset Session.turf_prel_times  = get_service_info.turf_prel_times>
<cfset Session.turf_prel_actual_extended  = Session.turf_prel_times* #NumberFormat(Session.turf_prel_service_materials,"999999.99")#>
<cfset Session.turf_prel_actual_extended  =  #ROUND(Session.turf_prel_actual_extended)#>
<cfset Session.turf_prel_total_hours = Session.turf_prel_hoursA*Session.turf_prel_times>
<cfset Session.turf_prel_overtime_adjustment =
Session.turf_prel_actual_extended -
(Session.turf_prel_total_hours*0.10* Session.turf_prel_cost)+
(Session.turf_prel_total_hours*0.10* Session.turf_prel_cost*1.5)>
<cfset Session.turf_prel_contract_price = Session.turf_prel_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.turf_post_service_rate = 20.50>  --->
<cfset Session.turf_post_qty  = get_service_info.turf_post_qty >
<cfset Session.turf_post_cost  = get_service_info.turf_post_cost>
<cfset Session.turf_post_rate = get_service_info.turf_post_rate>
<cfset Session.turf_post_hours  = Session.turf_post_qty/Session.turf_post_rate>
<cfset Session.turf_post_hoursA = #NumberFormat(Session.turf_post_hours,"999,999.9")#>
<cfset Session.turf_post_actualprice  = Session.turf_post_hours*Session.turf_post_cost>
<cfset Session.turf_post_materials_rate  = get_materials_info.turf_post_materials_rate>
<cfif  IsDefined("form.turf_post_qty")>
  <CFSET turf_post_qty_post  =form.turf_post_qty>
</cfif>
<cfset Session.turf_post_materials_qty_actual=(get_service_info.turf_post_qty /580)>
<cfset Session.turf_post_materials_qty_actual=#NumberFormat(Session.turf_post_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_post_materials_qty")    AND  get_materials_info.turf_post_materials_qty  EQ Session.turf_post_materials_qty_actual  AND Session.turf_post_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif   IsDefined("form.turf_post_materials_qty")    AND get_materials_info.turf_post_materials_qty  EQ form.turf_post_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_post_qty_pre")   AND   IsDefined("turf_post_qty_post") AND turf_post_qty_pre NEQ  turf_post_qty_post>
  <cfset Session.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif  IsDefined("form.turf_post_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_post_materials_qty=(form.turf_post_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_post_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
  <cfelse>
  <cfset Session.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
</cfif>
<cfset Session.turf_post_materials_qty = #NumberFormat(Session.turf_post_materials_qty,"999999.99")#>
<cfset Session.turf_post_materials_actualprice = Session.turf_post_materials_rate*Session.turf_post_materials_qty>
<cfset Session.turf_post_service_materials  = Session.turf_post_actualprice+Session.turf_post_materials_actualprice >
<cfset Session.turf_post_times  = get_service_info.turf_post_times>
<cfset Session.turf_post_actual_extended  = Session.turf_post_times* #NumberFormat(Session.turf_post_service_materials,"999999.99")#>
<cfset Session.turf_post_actual_extended  =  #ROUND(Session.turf_post_actual_extended)#>
<cfset Session.turf_post_total_hours = Session.turf_post_hoursA*Session.turf_post_times>
<cfset Session.turf_post_overtime_adjustment =
Session.turf_post_actual_extended -
(Session.turf_post_total_hours*0.10* Session.turf_post_cost)+
(Session.turf_post_total_hours*0.10* Session.turf_post_cost*1.5)>
<cfset Session.turf_post_contract_price = Session.turf_post_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.turf_fert_service_rate = 20.50>  --->
<cfset Session.turf_fert_qty  = get_service_info.turf_fert_qty >
<cfset Session.turf_fert_cost  = get_service_info.turf_fert_cost>
<cfset Session.turf_fert_rate = get_service_info.turf_fert_rate>
<cfset Session.turf_fert_hours  = Session.turf_fert_qty/Session.turf_fert_rate>
<cfset Session.turf_fert_hoursA = #NumberFormat(Session.turf_fert_hours,"999,999.9")#>
<cfset Session.turf_fert_actualprice  = Session.turf_fert_hours*Session.turf_fert_cost>
<cfset Session.turf_fert_materials_rate  = get_materials_info.turf_fert_materials_rate>
<cfif  IsDefined("form.turf_fert_qty")>
  <CFSET turf_fert_qty_post  =form.turf_fert_qty>
</cfif>
<cfset Session.turf_fert_materials_qty_actual=(get_service_info.turf_fert_qty /240)>
<cfset Session.turf_fert_materials_qty_actual=#NumberFormat(Session.turf_fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_fert_materials_qty")    AND  get_materials_info.turf_fert_materials_qty  EQ Session.turf_fert_materials_qty_actual  AND Session.turf_fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif   IsDefined("form.turf_fert_materials_qty")    AND get_materials_info.turf_fert_materials_qty  EQ form.turf_fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("turf_fert_qty_pre")   AND   IsDefined("turf_fert_qty_post") AND turf_fert_qty_pre NEQ  turf_fert_qty_post>
  <cfset Session.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif  IsDefined("form.turf_fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_fert_materials_qty=(form.turf_fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
  <cfelse>
  <cfset Session.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
</cfif>
<cfset Session.turf_fert_materials_qty = #NumberFormat(Session.turf_fert_materials_qty,"999999.99")#>
<cfset Session.turf_fert_materials_actualprice = Session.turf_fert_materials_rate*Session.turf_fert_materials_qty>
<cfset Session.turf_fert_service_materials  = Session.turf_fert_actualprice+Session.turf_fert_materials_actualprice >
<cfset Session.turf_fert_times  = get_service_info.turf_fert_times>
<cfset Session.turf_fert_actual_extended  = Session.turf_fert_times* #NumberFormat(Session.turf_fert_service_materials,"999999.99")#>
<cfset Session.turf_fert_actual_extended  =  #ROUND(Session.turf_fert_actual_extended)#>
<cfset Session.turf_fert_total_hours = Session.turf_fert_hoursA*Session.turf_fert_times>
<cfset Session.turf_fert_overtime_adjustment =
Session.turf_fert_actual_extended -
(Session.turf_fert_total_hours*0.10* Session.turf_fert_cost)+
(Session.turf_fert_total_hours*0.10* Session.turf_fert_cost*1.5)>
<cfset Session.turf_fert_contract_price = Session.turf_fert_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.turf_lime_service_rate = 20.50>  --->
<cfset Session.turf_lime_qty  = get_service_info.turf_lime_qty >
<cfset Session.turf_lime_cost  = get_service_info.turf_lime_cost>
<cfset Session.turf_lime_rate = get_service_info.turf_lime_rate>
<cfset Session.turf_lime_hours  = Session.turf_lime_qty/Session.turf_lime_rate>
<cfset Session.turf_lime_hoursA = #NumberFormat(Session.turf_lime_hours,"999,999.9")#>
<cfset Session.turf_lime_actualprice  = Session.turf_lime_hours*Session.turf_lime_cost>
<cfset Session.turf_lime_materials_rate  = get_materials_info.turf_lime_materials_rate>
<cfif  IsDefined("form.turf_lime_qty")>
  <CFSET turf_lime_qty_post  =form.turf_lime_qty>
</cfif>
<cfset Session.turf_lime_materials_qty_actual=(get_service_info.turf_lime_qty /40)>
<cfset Session.turf_lime_materials_qty_actual=#NumberFormat(Session.turf_lime_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_lime_materials_qty")    AND  get_materials_info.turf_lime_materials_qty  EQ Session.turf_lime_materials_qty_actual  AND Session.turf_lime_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif   IsDefined("form.turf_lime_materials_qty")    AND get_materials_info.turf_lime_materials_qty  EQ form.turf_lime_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_lime_qty_pre")   AND   IsDefined("turf_lime_qty_post") AND turf_lime_qty_pre NEQ  turf_lime_qty_post>
  <cfset Session.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif  IsDefined("form.turf_lime_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_lime_materials_qty=(form.turf_lime_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_lime_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
  <cfelse>
  <cfset Session.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
</cfif>
<cfset Session.turf_lime_materials_qty = #NumberFormat(Session.turf_lime_materials_qty,"999999.99")#>
<cfset Session.turf_lime_materials_actualprice = Session.turf_lime_materials_rate*Session.turf_lime_materials_qty>
<cfset Session.turf_lime_service_materials  = Session.turf_lime_actualprice+Session.turf_lime_materials_actualprice >
<cfset Session.turf_lime_times  = get_service_info.turf_lime_times>
<cfset Session.turf_lime_actual_extended  = Session.turf_lime_times* #NumberFormat(Session.turf_lime_service_materials,"999999.99")#>
<cfset Session.turf_lime_actual_extended  =  #ROUND(Session.turf_lime_actual_extended)#>
<cfset Session.turf_lime_total_hours = Session.turf_lime_hoursA*Session.turf_lime_times>
<cfset Session.turf_lime_overtime_adjustment =
Session.turf_lime_actual_extended -
(Session.turf_lime_total_hours*0.10* Session.turf_lime_cost)+
(Session.turf_lime_total_hours*0.10* Session.turf_lime_cost*1.5)>
<cfset Session.turf_lime_contract_price = Session.turf_lime_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Aer_H_service_rate = 20.50>  --->
<cfset Session.Turf_Aer_H_qty  = get_service_info.Turf_Aer_H_qty >
<cfset Session.Turf_Aer_H_cost  = get_service_info.Turf_Aer_H_cost>
<cfset Session.Turf_Aer_H_rate = get_service_info.Turf_Aer_H_rate>
<cfset Session.Turf_Aer_H_hours  = Session.Turf_Aer_H_qty/Session.Turf_Aer_H_rate>
<cfset Session.Turf_Aer_H_hoursA = #NumberFormat(Session.Turf_Aer_H_hours,"999,999.9")#>
<cfset Session.Turf_Aer_H_actualprice  = Session.Turf_Aer_H_hours*Session.Turf_Aer_H_cost>
<cfset Session.Turf_Aer_H_materials_rate  = 0>
<cfset Session.Turf_Aer_H_materials_qty = 0>
<cfset Session.Turf_Aer_H_materials_actualprice = Session.Turf_Aer_H_materials_rate*Session.Turf_Aer_H_materials_qty>
<cfset Session.Turf_Aer_H_service_materials  = Session.Turf_Aer_H_actualprice+Session.Turf_Aer_H_materials_actualprice >
<cfset Session.Turf_Aer_H_times  = get_service_info.Turf_Aer_H_times>
<cfset Session.Turf_Aer_H_actual_extended  = Session.Turf_Aer_H_times* #NumberFormat(Session.Turf_Aer_H_service_materials,"999999.99")#>
<cfset Session.Turf_Aer_H_actual_extended  =  #ROUND(Session.Turf_Aer_H_actual_extended)#>
<cfset Session.Turf_Aer_H_total_hours = Session.Turf_Aer_H_hoursA*Session.Turf_Aer_H_times>
<cfset Session.Turf_Aer_H_overtime_adjustment =
Session.Turf_Aer_H_actual_extended -
(Session.Turf_Aer_H_total_hours*0.10* Session.Turf_Aer_H_cost)+
(Session.Turf_Aer_H_total_hours*0.10* Session.Turf_Aer_H_cost*1.5)>
<cfset Session.Turf_Aer_H_contract_price = Session.Turf_Aer_H_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Aer_T_service_rate = 20.50>  --->
<cfset Session.Turf_Aer_T_qty  = get_service_info.Turf_Aer_T_qty >
<cfset Session.Turf_Aer_T_cost  = get_service_info.Turf_Aer_T_cost>
<cfset Session.Turf_Aer_T_rate = get_service_info.Turf_Aer_T_rate>
<cfset Session.Turf_Aer_T_hours  = Session.Turf_Aer_T_qty/Session.Turf_Aer_T_rate>
<cfset Session.Turf_Aer_T_hoursA = #NumberFormat(Session.Turf_Aer_T_hours,"999999.9")#>
<cfset Session.Turf_Aer_T_actualprice  = Session.Turf_Aer_T_hours*Session.Turf_Aer_T_cost>
<cfset Session.Turf_Aer_T_materials_rate  = 0>
<cfset Session.Turf_Aer_T_materials_qty =0>
<cfset Session.Turf_Aer_T_materials_actualprice = Session.Turf_Aer_T_materials_rate*Session.Turf_Aer_T_materials_qty>
<cfset Session.Turf_Aer_T_service_materials  = Session.Turf_Aer_T_actualprice+Session.Turf_Aer_T_materials_actualprice >
<cfset Session.Turf_Aer_T_times  = get_service_info.Turf_Aer_T_times>
<cfset Session.Turf_Aer_T_actual_extended  = Session.Turf_Aer_T_times* #NumberFormat(Session.Turf_Aer_T_service_materials,"999999.99")#>
<cfset Session.Turf_Aer_T_actual_extended  =  #ROUND(Session.Turf_Aer_T_actual_extended)#>
<cfset Session.Turf_Aer_T_total_hours = Session.Turf_Aer_T_hoursA*Session.Turf_Aer_T_times>
<cfset Session.Turf_Aer_T_overtime_adjustment =
Session.Turf_Aer_T_actual_extended -
(Session.Turf_Aer_T_total_hours*0.10* Session.Turf_Aer_T_cost)+
(Session.Turf_Aer_T_total_hours*0.10* Session.Turf_Aer_T_cost*1.5)>
<cfset Session.Turf_Aer_T_contract_price = Session.Turf_Aer_T_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Seed_service_rate = 20.50>  --->
<cfset Session.Turf_Seed_qty  = get_service_info.Turf_Seed_qty >
<cfset Session.Turf_Seed_cost  = get_service_info.Turf_Seed_cost>
<cfset Session.Turf_Seed_rate = get_service_info.Turf_Seed_rate>
<cfset Session.Turf_Seed_hours  = Session.Turf_Seed_qty/Session.Turf_Seed_rate>
<cfset Session.Turf_Seed_hoursA = #NumberFormat(Session.Turf_Seed_hours,"999999.9")#>
<cfset Session.Turf_Seed_actualprice  = Session.Turf_Seed_hours*Session.Turf_Seed_cost>
<cfset Session.Turf_Seed_materials_rate  = get_materials_info.Turf_Seed_materials_rate>
<!---<cfset Session.Turf_Seed_materials_qty = get_materials_info.Turf_Seed_materials_qty>
<cfset Session.Turf_Seed_materials_qty=(get_service_info.Turf_Seed_qty /250)>
<cfset Session.Turf_Seed_materials_qty = #NumberFormat(Session.Turf_Seed_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.turf_seed_qty")>
  <CFSET turf_seed_qty_post  =form.turf_seed_qty>
</cfif>
<cfset Session.turf_seed_materials_qty_actual=(get_service_info.turf_seed_qty /250)>
<cfset Session.turf_seed_materials_qty_actual=#NumberFormat(Session.turf_seed_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_seed_materials_qty")    AND  get_materials_info.turf_seed_materials_qty  EQ Session.turf_seed_materials_qty_actual  AND Session.turf_seed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif   IsDefined("form.turf_seed_materials_qty")    AND get_materials_info.turf_seed_materials_qty  EQ form.turf_seed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_seed_qty_pre")   AND   IsDefined("turf_seed_qty_post") AND turf_seed_qty_pre NEQ  turf_seed_qty_post>
  <cfset Session.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif  IsDefined("form.turf_seed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_seed_materials_qty=(form.turf_seed_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_seed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
  <cfelse>
  <cfset Session.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
</cfif>
<cfset Session.turf_seed_materials_qty = #NumberFormat(Session.turf_seed_materials_qty,"999999.99")#>
<cfset Session.Turf_Seed_materials_actualprice = Session.Turf_Seed_materials_rate*Session.Turf_Seed_materials_qty>
<cfset Session.Turf_Seed_service_materials  = Session.Turf_Seed_actualprice+Session.Turf_Seed_materials_actualprice >
<cfset Session.Turf_Seed_times  = get_service_info.Turf_Seed_times>
<cfset Session.Turf_Seed_actual_extended  = Session.Turf_Seed_times* #NumberFormat(Session.Turf_Seed_service_materials,"999999.99")#>
<cfset Session.Turf_Seed_actual_extended  =  #ROUND(Session.Turf_Seed_actual_extended)#>
<cfset Session.Turf_Seed_total_hours = Session.Turf_Seed_hoursA*Session.Turf_Seed_times>
<cfset Session.Turf_Seed_overtime_adjustment =
Session.Turf_Seed_actual_extended -
(Session.Turf_Seed_total_hours*0.10* Session.Turf_Seed_cost)+
(Session.Turf_Seed_total_hours*0.10* Session.Turf_Seed_cost*1.5)>
<cfset Session.Turf_Seed_contract_price = Session.Turf_Seed_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Pruning_TP_service_rate = 20.50>  --->
<cfset Session.Pruning_TP_qty  = get_service_info.Pruning_TP_qty >
<cfset Session.Pruning_TP_cost  = get_service_info.Pruning_TP_cost>
<cfset Session.Pruning_TP_rate = get_service_info.Pruning_TP_rate>
<cfset Session.Pruning_TP_hours  = Session.Pruning_TP_qty/Session.Pruning_TP_rate>
<cfset Session.Pruning_TP_hoursA = #NumberFormat(Session.Pruning_TP_hours,"999999.9")#>
<cfset Session.Pruning_TP_actualprice  = Session.Pruning_TP_hours*Session.Pruning_TP_cost>
<cfset Session.Pruning_TP_materials_rate  = 0>
<cfset Session.Pruning_TP_materials_qty =0>
<cfset Session.Pruning_TP_materials_actualprice = Session.Pruning_TP_materials_rate*Session.Pruning_TP_materials_qty>
<cfset Session.Pruning_TP_service_materials  = Session.Pruning_TP_actualprice+Session.Pruning_TP_materials_actualprice >
<cfset Session.Pruning_TP_times  = get_service_info.Pruning_TP_times>
<cfset Session.Pruning_TP_actual_extended  = Session.Pruning_TP_times* #NumberFormat(Session.Pruning_TP_service_materials,"999999.99")#>
<cfset Session.Pruning_TP_actual_extended  =  #ROUND(Session.Pruning_TP_actual_extended)#>
<cfset Session.Pruning_TP_total_hours = Session.Pruning_TP_hoursA*Session.Pruning_TP_times>
<cfset Session.Pruning_TP_overtime_adjustment =
Session.Pruning_TP_actual_extended -
(Session.Pruning_TP_total_hours*0.10* Session.Pruning_TP_cost)+
(Session.Pruning_TP_total_hours*0.10* Session.Pruning_TP_cost*1.5)>
<cfset Session.Pruning_TP_contract_price = Session.Pruning_TP_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Pruning_S_service_rate = 20.50>  --->
<cfset Session.Pruning_S_qty  = get_service_info.Pruning_S_qty >
<cfset Session.Pruning_S_cost  = get_service_info.Pruning_S_cost>
<cfset Session.Pruning_S_rate = get_service_info.Pruning_S_rate>
<cfset Session.Pruning_S_hours  = Session.Pruning_S_qty/Session.Pruning_S_rate>
<cfset Session.Pruning_S_hoursA = #NumberFormat(Session.Pruning_S_hours,"999999.9")#>
<cfset Session.Pruning_S_actualprice  = Session.Pruning_S_hours*Session.Pruning_S_cost>
<cfset Session.Pruning_S_materials_rate  =0>
<cfset Session.Pruning_S_materials_qty = 0>
<cfset Session.Pruning_S_materials_actualprice = Session.Pruning_S_materials_rate*Session.Pruning_S_materials_qty>
<cfset Session.Pruning_S_service_materials  = Session.Pruning_S_actualprice+Session.Pruning_S_materials_actualprice >
<cfset Session.Pruning_S_times  = get_service_info.Pruning_S_times>
<cfset Session.Pruning_S_actual_extended  = Session.Pruning_S_times* #NumberFormat(Session.Pruning_S_service_materials,"999999.99")#>
<cfset Session.Pruning_S_actual_extended  =  #ROUND(Session.Pruning_S_actual_extended)#>
<cfset Session.Pruning_S_total_hours = Session.Pruning_S_hoursA*Session.Pruning_S_times>
<cfset Session.Pruning_S_overtime_adjustment =
Session.Pruning_S_actual_extended -
(Session.Pruning_S_total_hours*0.10* Session.Pruning_S_cost)+
(Session.Pruning_S_total_hours*0.10* Session.Pruning_S_cost*1.5)>
<cfset Session.Pruning_S_contract_price = Session.Pruning_S_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.TS_Fert_service_rate = 20.50>  --->
<cfset Session.TS_Fert_qty  = get_service_info.TS_Fert_qty >
<cfset Session.TS_Fert_cost  = get_service_info.TS_Fert_cost>
<cfset Session.TS_Fert_rate = get_service_info.TS_Fert_rate>
<cfset Session.TS_Fert_hours  = Session.TS_Fert_qty/Session.TS_Fert_rate>
<cfset Session.TS_Fert_hoursA = #NumberFormat(Session.TS_Fert_hours,"999999.9")#>
<cfset Session.TS_Fert_actualprice  = Session.TS_Fert_hours*Session.TS_Fert_cost>
<cfset Session.TS_Fert_materials_rate  = get_materials_info.TS_Fert_materials_rate>
<!--- <cfset Session.TS_Fert_materials_qty = get_materials_info.TS_Fert_materials_qty> --->
<!---<cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.33)>
<cfset Session.TS_Fert_materials_qty = #NumberFormat(Session.TS_Fert_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.TS_Fert_qty")>
  <CFSET TS_Fert_qty_post  =form.TS_Fert_qty>
</cfif>
<cfset Session.TS_Fert_materials_qty_actual=(get_service_info.TS_Fert_qty /33.3)>
<cfset Session.TS_Fert_materials_qty_actual=#NumberFormat(Session.TS_Fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Fert_materials_qty")    AND  get_materials_info.TS_Fert_materials_qty  EQ Session.TS_Fert_materials_qty_actual  AND Session.TS_Fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif   IsDefined("form.TS_Fert_materials_qty")    AND get_materials_info.TS_Fert_materials_qty  EQ form.TS_Fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Fert_qty_pre")   AND   IsDefined("TS_Fert_qty_post") AND TS_Fert_qty_pre NEQ  TS_Fert_qty_post>
  <cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif  IsDefined("form.TS_Fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Fert_materials_qty=(form.TS_Fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
  <cfelse>
  <cfset Session.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
</cfif>
<cfset Session.TS_Fert_materials_qty = #NumberFormat(Session.TS_Fert_materials_qty,"999999.99")#>
<cfset Session.TS_Fert_materials_actualprice = Session.TS_Fert_materials_rate*Session.TS_Fert_materials_qty>
<cfset Session.TS_Fert_service_materials  = Session.TS_Fert_actualprice+Session.TS_Fert_materials_actualprice >
<cfset Session.TS_Fert_times  = get_service_info.TS_Fert_times>
<cfset Session.TS_Fert_actual_extended  = Session.TS_Fert_times* #NumberFormat(Session.TS_Fert_service_materials,"999999.99")#>
<cfset Session.TS_Fert_actual_extended  =  #ROUND(Session.TS_Fert_actual_extended)#>
<cfset Session.TS_Fert_total_hours = Session.TS_Fert_hoursA*Session.TS_Fert_times>
<cfset Session.TS_Fert_overtime_adjustment =
Session.TS_Fert_actual_extended -
(Session.TS_Fert_total_hours*0.10* Session.TS_Fert_cost)+
(Session.TS_Fert_total_hours*0.10* Session.TS_Fert_cost*1.5)>
<cfset Session.TS_Fert_contract_price = Session.TS_Fert_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.TS_Insect_service_rate = 20.50>  --->
<cfset Session.TS_Insect_qty  = get_service_info.TS_Insect_qty >
<cfset Session.TS_Insect_cost  = get_service_info.TS_Insect_cost>
<cfset Session.TS_Insect_rate = get_service_info.TS_Insect_rate>
<cfset Session.TS_Insect_hours  = Session.TS_Insect_qty/Session.TS_Insect_rate>
<cfset Session.TS_Insect_hoursA = #NumberFormat(Session.TS_Insect_hours,"999999.9")#>
<cfset Session.TS_Insect_actualprice  = Session.TS_Insect_hours*Session.TS_Insect_cost>
<cfset Session.TS_Insect_materials_rate  = get_materials_info.TS_Insect_materials_rate>
<!--- <cfset Session.TS_Insect_materials_qty = get_materials_info.TS_Insect_materials_qty> --->
<!---<cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
<cfset Session.TS_Insect_materials_qty = #NumberFormat(Session.TS_Insect_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.TS_Insect_qty")>
  <CFSET TS_Insect_qty_post  =form.TS_Insect_qty>
</cfif>
<cfset Session.TS_Insect_materials_qty_actual=(get_service_info.TS_Insect_qty*2)>
<cfset Session.TS_Insect_materials_qty_actual=#NumberFormat(Session.TS_Insect_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Insect_materials_qty")    AND  get_materials_info.TS_Insect_materials_qty  EQ Session.TS_Insect_materials_qty_actual  AND Session.TS_Insect_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif   IsDefined("form.TS_Insect_materials_qty")    AND get_materials_info.TS_Insect_materials_qty  EQ form.TS_Insect_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Insect_qty_pre")   AND   IsDefined("TS_Insect_qty_post") AND TS_Insect_qty_pre NEQ  TS_Insect_qty_post>
  <cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif  IsDefined("form.TS_Insect_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Insect_materials_qty=(form.TS_Insect_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Insect_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
  <cfelse>
  <cfset Session.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
</cfif>
<cfset Session.TS_Insect_materials_qty = #NumberFormat(Session.TS_Insect_materials_qty,"999999.99")#>
<cfset Session.TS_Insect_materials_actualprice = Session.TS_Insect_materials_rate*Session.TS_Insect_materials_qty>
<cfset Session.TS_Insect_service_materials  = Session.TS_Insect_actualprice+Session.TS_Insect_materials_actualprice >
<cfset Session.TS_Insect_times  = get_service_info.TS_Insect_times>
<cfset Session.TS_Insect_actual_extended  = Session.TS_Insect_times* #NumberFormat(Session.TS_Insect_service_materials,"999999.99")#>
<cfset Session.TS_Insect_actual_extended  =  #ROUND(Session.TS_Insect_actual_extended)#>
<cfset Session.TS_Insect_total_hours = Session.TS_Insect_hoursA*Session.TS_Insect_times>
<cfset Session.TS_Insect_overtime_adjustment =
Session.TS_Insect_actual_extended -
(Session.TS_Insect_total_hours*0.10* Session.TS_Insect_cost)+
(Session.TS_Insect_total_hours*0.10* Session.TS_Insect_cost*1.5)>
<cfset Session.TS_Insect_contract_price = Session.TS_Insect_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Mulch_pre_service_rate = 20.50>  --->
<cfset Session.Mulch_pre_qty  = get_service_info.Mulch_pre_qty >
<cfset Session.Mulch_pre_cost  = get_service_info.Mulch_pre_cost>
<cfset Session.Mulch_pre_rate = get_service_info.Mulch_pre_rate>
<cfset Session.Mulch_pre_hours  = Session.Mulch_pre_qty/Session.Mulch_pre_rate>
<cfset Session.Mulch_pre_hoursA = #NumberFormat(Session.Mulch_pre_hours,"999999.9")#>
<cfset Session.Mulch_pre_actualprice  = Session.Mulch_pre_hours*Session.Mulch_pre_cost>
<cfset Session.Mulch_pre_materials_rate  = get_materials_info.Mulch_pre_materials_rate>
<!--- <cfset Session.Mulch_pre_materials_qty = get_materials_info.Mulch_pre_materials_qty> --->
<!---<cfset Session.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
<cfset Session.Mulch_pre_materials_qty = #NumberFormat(Session.Mulch_pre_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.Mulch_pre_qty")>
  <CFSET Mulch_pre_qty_post  =form.Mulch_pre_qty>
</cfif>
<cfset Session.Mulch_pre_materials_qty_actual=(get_service_info.Mulch_pre_qty /8000)>
<cfset Session.Mulch_pre_materials_qty_actual=#NumberFormat(Session.Mulch_pre_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Mulch_pre_materials_qty")    AND  get_materials_info.Mulch_pre_materials_qty  EQ Session.Mulch_pre_materials_qty_actual  AND Session.Mulch_pre_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif   IsDefined("form.Mulch_pre_materials_qty")    AND get_materials_info.Mulch_pre_materials_qty  EQ form.Mulch_pre_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Mulch_pre_qty_pre")   AND   IsDefined("Mulch_pre_qty_post") AND Mulch_pre_qty_pre NEQ  Mulch_pre_qty_post>
  <cfset Session.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif  IsDefined("form.Mulch_pre_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Mulch_pre_materials_qty=(form.Mulch_pre_materials_qty)>
  <cfelseif   NOT IsDefined("form.Mulch_pre_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
  <cfelse>
  <cfset Session.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
</cfif>
<cfset Session.Mulch_pre_materials_qty = #NumberFormat(Session.Mulch_pre_materials_qty,"999999.9")#>
<cfset Session.Mulch_pre_materials_actualprice = Session.Mulch_pre_materials_rate*Session.Mulch_pre_materials_qty>
<cfset Session.Mulch_pre_service_materials  = Session.Mulch_pre_actualprice+Session.Mulch_pre_materials_actualprice >
<cfset Session.Mulch_pre_times  = get_service_info.Mulch_pre_times>
<cfset Session.Mulch_pre_actual_extended  = Session.Mulch_pre_times* #NumberFormat(Session.Mulch_pre_service_materials,"999999.99")#>
<cfset Session.Mulch_pre_actual_extended  =  #ROUND(Session.Mulch_pre_actual_extended)#>
<cfset Session.Mulch_pre_total_hours = Session.Mulch_pre_hoursA*Session.Mulch_pre_times>
<cfset Session.Mulch_pre_overtime_adjustment =
Session.Mulch_pre_actual_extended -
(Session.Mulch_pre_total_hours*0.10* Session.Mulch_pre_cost)+
(Session.Mulch_pre_total_hours*0.10* Session.Mulch_pre_cost*1.5)>
<cfset Session.Mulch_pre_contract_price = Session.Mulch_pre_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Mulch_edging_service_rate = 20.50>  --->
<cfset Session.Mulch_edging_qty  = get_service_info.Mulch_edging_qty >
<cfset Session.Mulch_edging_cost  = get_service_info.Mulch_edging_cost>
<cfset Session.Mulch_edging_rate = get_service_info.Mulch_edging_rate>
<cfset Session.Mulch_edging_hours  = Session.Mulch_edging_qty/Session.Mulch_edging_rate>
<cfset Session.Mulch_edging_hoursA = #NumberFormat(Session.Mulch_edging_hours,"999999.9")#>
<cfset Session.Mulch_edging_actualprice  = Session.Mulch_edging_hours*Session.Mulch_edging_cost>
<cfset Session.Mulch_edging_materials_rate  = 0>
<cfset Session.Mulch_edging_materials_qty = 0>
<cfset Session.Mulch_edging_materials_actualprice = Session.Mulch_edging_materials_rate*Session.Mulch_edging_materials_qty>
<cfset Session.Mulch_edging_service_materials  = Session.Mulch_edging_actualprice+Session.Mulch_edging_materials_actualprice >
<cfset Session.Mulch_edging_times  = get_service_info.Mulch_edging_times>
<cfset Session.Mulch_edging_actual_extended  = Session.Mulch_edging_times* #NumberFormat(Session.Mulch_edging_service_materials,"999999.99")#>
<cfset Session.Mulch_edging_actual_extended  =  #ROUND(Session.Mulch_edging_actual_extended)#>
<cfset Session.Mulch_edging_total_hours = Session.Mulch_edging_hoursA*Session.Mulch_edging_times>
<cfset Session.Mulch_edging_overtime_adjustment =
Session.Mulch_edging_actual_extended -
(Session.Mulch_edging_total_hours*0.10* Session.Mulch_edging_cost)+
(Session.Mulch_edging_total_hours*0.10* Session.Mulch_edging_cost*1.5)>
<cfset Session.Mulch_edging_contract_price = Session.Mulch_edging_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.mulch_s_dyed_service_rate = 20.50>  --->
<cfset Session.mulch_s_dyed_qty  = get_service_info.mulch_s_dyed_qty >
<cfset Session.mulch_s_dyed_cost  = get_service_info.mulch_s_dyed_cost>
<cfset Session.mulch_s_dyed_rate = get_service_info.mulch_s_dyed_rate>
<cfset Session.mulch_s_dyed_hours  = Session.mulch_s_dyed_qty/Session.mulch_s_dyed_rate>
<cfset Session.mulch_s_dyed_hoursA = #NumberFormat(Session.mulch_s_dyed_hours,"999999.9")#>
<cfset Session.mulch_s_dyed_actualprice  = Session.mulch_s_dyed_hours*Session.mulch_s_dyed_cost>
<cfset Session.mulch_s_dyed_materials_rate  = get_materials_info.mulch_s_dyed_materials_rate>
<!--- <cfset Session.mulch_s_dyed_materials_qty = get_materials_info.mulch_s_dyed_materials_qty> --->
<!---<cfset Session.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
<cfset Session.mulch_s_dyed_materials_qty = #NumberFormat(Session.mulch_s_dyed_materials_qty,"999999.9")#>--->

<cfif  IsDefined("form.mulch_s_dyed_qty")>
  <CFSET mulch_s_dyed_qty_post  =form.mulch_s_dyed_qty>
</cfif>
<cfset Session.mulch_s_dyed_materials_qty_actual=(get_service_info.mulch_s_dyed_qty /162)>
<cfset Session.mulch_s_dyed_materials_qty_actual=#NumberFormat(Session.mulch_s_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_dyed_materials_qty")    AND  get_materials_info.mulch_s_dyed_materials_qty  EQ Session.mulch_s_dyed_materials_qty_actual  AND Session.mulch_s_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_dyed_materials_qty")    AND get_materials_info.mulch_s_dyed_materials_qty  EQ form.mulch_s_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_dyed_qty_pre")   AND   IsDefined("mulch_s_dyed_qty_post") AND mulch_s_dyed_qty_pre NEQ  mulch_s_dyed_qty_post>
  <cfset Session.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_dyed_materials_qty=(form.mulch_s_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
  <cfelse>
  <cfset Session.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
</cfif>
<cfset Session.mulch_s_dyed_materials_qty = #NumberFormat(Session.mulch_s_dyed_materials_qty,"999999.9")#>
<cfset Session.mulch_s_dyed_materials_actualprice = Session.mulch_s_dyed_materials_rate*Session.mulch_s_dyed_materials_qty>
<cfset Session.mulch_s_dyed_service_materials  = Session.mulch_s_dyed_actualprice+Session.mulch_s_dyed_materials_actualprice >
<cfset Session.mulch_s_dyed_times  = get_service_info.mulch_s_dyed_times>
<cfset Session.mulch_s_dyed_actual_extended  = Session.mulch_s_dyed_times* #NumberFormat(Session.mulch_s_dyed_service_materials,"999999.99")#>
<cfset Session.mulch_s_dyed_actual_extended  =  #ROUND(Session.mulch_s_dyed_actual_extended)#>
<cfset Session.mulch_s_dyed_total_hours = Session.mulch_s_dyed_hoursA*Session.mulch_s_dyed_times>
<cfset Session.mulch_s_dyed_overtime_adjustment =
Session.mulch_s_dyed_actual_extended -
(Session.mulch_s_dyed_total_hours*0.10* Session.mulch_s_dyed_cost)+
(Session.mulch_s_dyed_total_hours*0.10* Session.mulch_s_dyed_cost*1.5)>
<cfset Session.mulch_s_dyed_contract_price = Session.mulch_s_dyed_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.mulch_f_dyed_service_rate = 20.50>  --->
<cfset Session.mulch_f_dyed_qty  = get_service_info.mulch_f_dyed_qty >
<cfset Session.mulch_f_dyed_cost  = get_service_info.mulch_f_dyed_cost>
<cfset Session.mulch_f_dyed_rate = get_service_info.mulch_f_dyed_rate>
<cfset Session.mulch_f_dyed_hours  = Session.mulch_f_dyed_qty/Session.mulch_f_dyed_rate>
<cfset Session.mulch_f_dyed_hoursA = #NumberFormat(Session.mulch_f_dyed_hours,"999999.9")#>
<cfset Session.mulch_f_dyed_actualprice  = Session.mulch_f_dyed_hours*Session.mulch_f_dyed_cost>
<cfset Session.mulch_f_dyed_materials_rate  = get_materials_info.mulch_f_dyed_materials_rate>
<!--- <cfset Session.mulch_f_dyed_materials_qty = get_materials_info.mulch_f_dyed_materials_qty> --->
<!---<cfset Session.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
<cfset Session.mulch_f_dyed_materials_qty = #NumberFormat(Session.mulch_f_dyed_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.mulch_f_dyed_qty")>
  <CFSET mulch_f_dyed_qty_post  =form.mulch_f_dyed_qty>
</cfif>
<cfset Session.mulch_f_dyed_materials_qty_actual=(get_service_info.mulch_f_dyed_qty /324)>
<cfset Session.mulch_f_dyed_materials_qty_actual=#NumberFormat(Session.mulch_f_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_dyed_materials_qty")    AND  get_materials_info.mulch_f_dyed_materials_qty  EQ Session.mulch_f_dyed_materials_qty_actual  AND Session.mulch_f_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_dyed_materials_qty")    AND get_materials_info.mulch_f_dyed_materials_qty  EQ form.mulch_f_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_dyed_qty_pre")   AND   IsDefined("mulch_f_dyed_qty_post") AND mulch_f_dyed_qty_pre NEQ  mulch_f_dyed_qty_post>
  <cfset Session.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_dyed_materials_qty=(form.mulch_f_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
  <cfelse>
  <cfset Session.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
</cfif>
<cfset Session.mulch_f_dyed_materials_qty = #NumberFormat(Session.mulch_f_dyed_materials_qty,"999999.9")#>
<cfset Session.mulch_f_dyed_materials_actualprice = Session.mulch_f_dyed_materials_rate*Session.mulch_f_dyed_materials_qty>
<cfset Session.mulch_f_dyed_service_materials  = Session.mulch_f_dyed_actualprice+Session.mulch_f_dyed_materials_actualprice >
<cfset Session.mulch_f_dyed_times  = get_service_info.mulch_f_dyed_times>
<cfset Session.mulch_f_dyed_actual_extended  = Session.mulch_f_dyed_times* #NumberFormat(Session.mulch_f_dyed_service_materials,"999999.99")#>
<cfset Session.mulch_f_dyed_actual_extended  =  #ROUND(Session.mulch_f_dyed_actual_extended)#>
<cfset Session.mulch_f_dyed_total_hours = Session.mulch_f_dyed_hoursA*Session.mulch_f_dyed_times>
<cfset Session.mulch_f_dyed_overtime_adjustment =
Session.mulch_f_dyed_actual_extended -
(Session.mulch_f_dyed_total_hours*0.10* Session.mulch_f_dyed_cost)+
(Session.mulch_f_dyed_total_hours*0.10* Session.mulch_f_dyed_cost*1.5)>
<cfset Session.mulch_f_dyed_contract_price = Session.mulch_f_dyed_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Annuals_S_service_rate = 20.50>  --->
<cfset Session.Annuals_S_qty  = get_service_info.Annuals_S_qty >
<cfset Session.Annuals_S_cost  = get_service_info.Annuals_S_cost>
<cfset Session.Annuals_S_rate = get_service_info.Annuals_S_rate>
<cfset Session.Annuals_S_hours  = Session.Annuals_S_qty/Session.Annuals_S_rate>
<cfset Session.Annuals_S_hoursA = #NumberFormat(Session.Annuals_S_hours,"999,999.9")#>
<cfset Session.Annuals_S_actualprice  = Session.Annuals_S_hours*Session.Annuals_S_cost>
<cfset Session.Annuals_S_actualprice  = 0>
<cfset Session.Annuals_S_materials_rate  = get_materials_info.Annuals_S_materials_rate>
<cfset Session.Annuals_S_materials_qty = get_materials_info.Annuals_S_materials_qty>
<cfset Session.Annuals_S_materials_qty=(get_service_info.Annuals_S_qty /1)>
<cfset Session.Annuals_S_materials_qty = #NumberFormat(Session.Annuals_S_materials_qty,"999999.9")#>
<cfset Session.Annuals_S_materials_actualprice = Session.Annuals_S_materials_rate*Session.Annuals_S_materials_qty>
<cfset Session.Annuals_S_service_materials  = Session.Annuals_S_actualprice+Session.Annuals_S_materials_actualprice >
<cfset Session.Annuals_S_times  = get_service_info.Annuals_S_times>
<cfset Session.Annuals_S_actual_extended  = Session.Annuals_S_times* #NumberFormat(Session.Annuals_S_service_materials,"999999.99")#>
<cfset Session.Annuals_S_actual_extended  =  #ROUND(Session.Annuals_S_actual_extended)#>
<cfset Session.Annuals_S_total_hours = Session.Annuals_S_hoursA*Session.Annuals_S_times>

<!---<cfset Session.Annuals_S_overtime_adjustment =
Session.Annuals_S_actual_extended -
(Session.Annuals_S_total_hours*0.10* Session.Annuals_S_cost)+
(Session.Annuals_S_total_hours*0.10* Session.Annuals_S_cost*1.5)>--->
<cfset Session.Annuals_S_overtime_adjustment =Session.Annuals_S_actual_extended>
<cfset Session.Annuals_S_contract_price = Session.Annuals_S_overtime_adjustment >
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Annuals_F_service_rate = 20.50>  --->
<cfset Session.Annuals_F_qty  = get_service_info.Annuals_F_qty >
<cfset Session.Annuals_F_cost  = get_service_info.Annuals_F_cost>
<cfset Session.Annuals_F_rate = get_service_info.Annuals_F_rate>
<cfset Session.Annuals_F_hours  = Session.Annuals_F_qty/Session.Annuals_F_rate>
<cfset Session.Annuals_F_hoursA = #NumberFormat(Session.Annuals_F_hours,"999999.9")#>
<cfset Session.Annuals_F_actualprice  = Session.Annuals_F_hours*Session.Annuals_F_cost>
<cfset Session.Annuals_F_actualprice  = 0>
<cfset Session.Annuals_F_materials_rate  = get_materials_info.Annuals_F_materials_rate>
<!--- <cfset Session.Annuals_F_materials_qty = get_materials_info.Annuals_F_materials_qty> --->
<cfset Session.Annuals_F_materials_qty=(get_service_info.Annuals_F_qty /1)>
<cfset Session.Annuals_F_materials_qty = #NumberFormat(Session.Annuals_F_materials_qty,"999999.9")#>
<cfset Session.Annuals_F_materials_actualprice = Session.Annuals_F_materials_rate*Session.Annuals_F_materials_qty>
<cfset Session.Annuals_F_service_materials  = Session.Annuals_F_actualprice+Session.Annuals_F_materials_actualprice >
<cfset Session.Annuals_F_times  = get_service_info.Annuals_F_times>
<cfset Session.Annuals_F_actual_extended  = Session.Annuals_F_times* #NumberFormat(Session.Annuals_F_service_materials,"999999.99")#>
<cfset Session.Annuals_F_actual_extended  =  #ROUND(Session.Annuals_F_actual_extended)#>
<!---<cfoutput>#Session.Annuals_F_hoursA#</cfoutput>--->
<cfset Session.Annuals_F_total_hours = Session.Annuals_F_hoursA*Session.Annuals_F_times>
<!---<cfset Session.Annuals_F_overtime_adjustment =
Session.Annuals_F_actual_extended -
(Session.Annuals_F_total_hours*0.10* Session.Annuals_F_cost)+
(Session.Annuals_F_total_hours*0.10* Session.Annuals_F_cost*1.5)>--->
<cfset Session.Annuals_F_overtime_adjustment = Session.Annuals_F_actual_extended>
<cfset Session.Annuals_F_contract_price = Session.Annuals_F_overtime_adjustment >
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Irrigation_SU_service_rate = 20.50>  --->
<cfset Session.Irrigation_SU_qty  = get_service_info.Irrigation_SU_qty >
<cfset Session.Irrigation_SU_cost  = get_service_info.Irrigation_SU_cost>
<cfset Session.Irrigation_SU_rate = get_service_info.Irrigation_SU_rate>
<cfset Session.Irrigation_SU_hours  = Session.Irrigation_SU_qty/Session.Irrigation_SU_rate>
<cfset Session.Irrigation_SU_hoursA = #NumberFormat(Session.Irrigation_SU_hours,"999,999.9")#>
<cfset Session.Irrigation_SU_actualprice  = Session.Irrigation_SU_hours*Session.Irrigation_SU_cost>
<cfset Session.Irrigation_SU_materials_rate  = 0>
<cfset Session.Irrigation_SU_materials_qty = 0>
<cfset Session.Irrigation_SU_materials_actualprice = Session.Irrigation_SU_materials_rate*Session.Irrigation_SU_materials_qty>
<cfset Session.Irrigation_SU_service_materials  = Session.Irrigation_SU_actualprice+Session.Irrigation_SU_materials_actualprice >
<cfset Session.Irrigation_SU_times  = get_service_info.Irrigation_SU_times>
<cfset Session.Irrigation_SU_actual_extended  = Session.Irrigation_SU_times* #NumberFormat(Session.Irrigation_SU_service_materials,"999999.99")#>
<cfset Session.Irrigation_SU_actual_extended  =  #ROUND(Session.Irrigation_SU_actual_extended)#>
<cfset Session.Irrigation_SU_total_hours = Session.Irrigation_SU_hoursA*Session.Irrigation_SU_times>

<!--- <cfset Session.Irrigation_SU_overtime_adjustment =
Session.Irrigation_SU_actual_extended -
(Session.Irrigation_SU_total_hours*0.10* Session.Irrigation_SU_cost)+
(Session.Irrigation_SU_total_hours*0.10* Session.Irrigation_SU_cost*1.5)> --->

<!---Changed 7/25/15
<cfset Session.Irrigation_SU_overtime_adjustment = Session.Irrigation_SU_actual_extended >
<cfset Session.Irrigation_SU_contract_price = Session.Irrigation_SU_overtime_adjustment >--->
<cfset Session.Irrigation_SU_overtime_adjustment = 0>
<cfset Session.Irrigation_SU_contract_price = Session.Irrigation_SU_actual_extended >

<!---<cfset Session.Irrigation_SU_overtime_adjustment = Session.Irrigation_SU_actual_extended>
<cfset Session.Irrigation_SU_contract_price = Session.Irrigation_SU_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Irrigation_W_service_rate = 20.50>  --->
<cfset Session.Irrigation_W_qty  = get_service_info.Irrigation_W_qty >
<cfset Session.Irrigation_W_cost  = get_service_info.Irrigation_W_cost>
<cfset Session.Irrigation_W_rate = get_service_info.Irrigation_W_rate>
<cfset Session.Irrigation_W_hours  = Session.Irrigation_W_qty/Session.Irrigation_W_rate>
<cfset Session.Irrigation_W_hoursA = #NumberFormat(Session.Irrigation_W_hours,"999,999.9")#>
<cfset Session.Irrigation_W_actualprice  = Session.Irrigation_W_hours*Session.Irrigation_W_cost>
<cfset Session.Irrigation_W_materials_rate  = 0>
<cfset Session.Irrigation_W_materials_qty = 0>
<cfset Session.Irrigation_W_materials_actualprice = Session.Irrigation_W_materials_rate*Session.Irrigation_W_materials_qty>
<cfset Session.Irrigation_W_service_materials  = Session.Irrigation_W_actualprice+Session.Irrigation_W_materials_actualprice >
<cfset Session.Irrigation_W_times  = get_service_info.Irrigation_W_times>
<cfset Session.Irrigation_W_actual_extended  = Session.Irrigation_W_times* #NumberFormat(Session.Irrigation_W_service_materials,"999999.99")#>
<cfset Session.Irrigation_W_actual_extended  =  #ROUND(Session.Irrigation_W_actual_extended)#>
<cfset Session.Irrigation_W_total_hours = Session.Irrigation_W_hoursA*Session.Irrigation_W_times>
<!---<cfset Session.Irrigation_W_overtime_adjustment =
Session.Irrigation_W_actual_extended -
(Session.Irrigation_W_total_hours*0.10* Session.Irrigation_W_cost)+
(Session.Irrigation_W_total_hours*0.10* Session.Irrigation_W_cost*1.5)>--->
<!---Changed 7/25/15 
<cfset Session.Irrigation_W_overtime_adjustment = Session.Irrigation_W_actual_extended >
<cfset Session.Irrigation_W_contract_price = Session.Irrigation_W_overtime_adjustment >--->
<cfset Session.Irrigation_W_overtime_adjustment = 0 >
<cfset Session.Irrigation_W_contract_price =Session.Irrigation_W_actual_extended>

<!---<cfset Session.Irrigation_W_overtime_adjustment = Session.Irrigation_W_actual_extended>
<cfset Session.Irrigation_W_contract_price = Session.Irrigation_W_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Irrigation_I_service_rate = 20.50>  --->
<cfset Session.Irrigation_I_qty  = get_service_info.Irrigation_I_qty >
<cfset Session.Irrigation_I_cost  = get_service_info.Irrigation_I_cost>
<cfset Session.Irrigation_I_rate = get_service_info.Irrigation_I_rate>
<cfset Session.Irrigation_I_hours  = Session.Irrigation_I_qty/Session.Irrigation_I_rate>
<cfset Session.Irrigation_I_hoursA = #NumberFormat(Session.Irrigation_I_hours,"999,999.9")#>
<cfset Session.Irrigation_I_actualprice  = Session.Irrigation_I_hours*Session.Irrigation_I_cost>
<cfset Session.Irrigation_I_materials_rate  = 0>
<cfset Session.Irrigation_I_materials_qty = 0>
<cfset Session.Irrigation_I_materials_actualprice = Session.Irrigation_I_materials_rate*Session.Irrigation_I_materials_qty>
<cfset Session.Irrigation_I_service_materials  = Session.Irrigation_I_actualprice+Session.Irrigation_I_materials_actualprice >
<cfset Session.Irrigation_I_times  = get_service_info.Irrigation_I_times>
<cfset Session.Irrigation_I_actual_extended  = Session.Irrigation_I_times* #NumberFormat(Session.Irrigation_I_service_materials,"999999.99")#>
<cfset Session.Irrigation_I_actual_extended  =  #ROUND(Session.Irrigation_I_actual_extended)#>
<cfset Session.Irrigation_I_total_hours = Session.Irrigation_I_hoursA*Session.Irrigation_I_times>
<!---<cfset Session.Irrigation_I_overtime_adjustment =
Session.Irrigation_I_actual_extended -
(Session.Irrigation_I_total_hours*0.10* Session.Irrigation_I_cost)+
(Session.Irrigation_I_total_hours*0.10* Session.Irrigation_I_cost*1.5)>--->

<!---Changed 7/25/15 <cfset Session.Irrigation_I_overtime_adjustment = Session.Irrigation_I_actual_extended>
<cfset Session.Irrigation_I_contract_price = Session.Irrigation_I_overtime_adjustment >--->
<cfset Session.Irrigation_I_overtime_adjustment = 0>
<cfset Session.Irrigation_I_contract_price = Session.Irrigation_I_actual_extended >

<!---<cfset Session.Irrigation_I_overtime_adjustment = Session.Irrigation_I_actual_extended>
<cfset Session.Irrigation_I_contract_price = Session.Irrigation_I_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Mulch_F_Reg_service_rate = 20.50>  --->
<cfset Session.Mulch_F_Reg_qty  = get_service_info.Mulch_F_Reg_qty >
<cfset Session.Mulch_F_Reg_cost  = get_service_info.Mulch_F_Reg_cost>
<cfset Session.Mulch_F_Reg_rate = get_service_info.Mulch_F_Reg_rate>
<cfset Session.Mulch_F_Reg_hours  = Session.Mulch_F_Reg_qty/Session.Mulch_F_Reg_rate>
<cfset Session.Mulch_F_Reg_hoursA = #NumberFormat(Session.Mulch_F_Reg_hours,"999,999.9")#>
<cfset Session.Mulch_F_Reg_actualprice  = Session.Mulch_F_Reg_hours*Session.Mulch_F_Reg_cost>
<cfset Session.Mulch_F_Reg_materials_rate  = get_materials_info.Mulch_F_Reg_materials_rate>
<!--- <cfset Session.Mulch_F_Reg_materials_qty = get_materials_info.Mulch_F_Reg_materials_qty>
 --->
<!---<cfset Session.Mulch_F_Reg_materials_qty=(get_service_info.Mulch_F_Reg_qty /324)>
<cfset Session.Mulch_F_Reg_materials_qty = #NumberFormat(Session.Mulch_F_Reg_materials_qty,"999999.9")#>--->

<cfif  IsDefined("form.mulch_f_reg_qty")>
  <CFSET mulch_f_reg_qty_post  =form.mulch_f_reg_qty>
</cfif>
<cfset Session.mulch_f_reg_materials_qty_actual=(get_service_info.mulch_f_reg_qty /324)>
<cfset Session.mulch_f_reg_materials_qty_actual=#NumberFormat(Session.mulch_f_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_reg_materials_qty")    AND  get_materials_info.mulch_f_reg_materials_qty  EQ Session.mulch_f_reg_materials_qty_actual  AND Session.mulch_f_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_reg_materials_qty")    AND get_materials_info.mulch_f_reg_materials_qty  EQ form.mulch_f_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_reg_qty_pre")   AND   IsDefined("mulch_f_reg_qty_post") AND mulch_f_reg_qty_pre NEQ  mulch_f_reg_qty_post>
  <cfset Session.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_reg_materials_qty=(form.mulch_f_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
  <cfelse>
  <cfset Session.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
</cfif>
<cfset Session.mulch_f_reg_materials_qty = #NumberFormat(Session.mulch_f_reg_materials_qty,"999999.9")#>
<cfset Session.Mulch_F_Reg_materials_actualprice = Session.Mulch_F_Reg_materials_rate*Session.Mulch_F_Reg_materials_qty>
<cfset Session.Mulch_F_Reg_service_materials  = Session.Mulch_F_Reg_actualprice+Session.Mulch_F_Reg_materials_actualprice >
<cfset Session.Mulch_F_Reg_times  = get_service_info.Mulch_F_Reg_times>
<cfset Session.Mulch_F_Reg_actual_extended  = Session.Mulch_F_Reg_times* #NumberFormat(Session.Mulch_F_Reg_service_materials,"999999.99")#>
<cfset Session.Mulch_F_Reg_actual_extended  =  #ROUND(Session.Mulch_F_Reg_actual_extended)#>
<cfset Session.Mulch_F_Reg_total_hours = Session.Mulch_F_Reg_hoursA*Session.Mulch_F_Reg_times>
<cfset Session.Mulch_F_Reg_overtime_adjustment =
Session.Mulch_F_Reg_actual_extended -
(Session.Mulch_F_Reg_total_hours*0.10* Session.Mulch_F_Reg_cost)+
(Session.Mulch_F_Reg_total_hours*0.10* Session.Mulch_F_Reg_cost*1.5)>
<cfset Session.Mulch_F_Reg_contract_price = Session.Mulch_F_Reg_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Mulch_S_Reg_service_rate = 20.50>  --->
<cfset Session.Mulch_S_Reg_qty  = get_service_info.Mulch_S_Reg_qty >
<cfset Session.Mulch_S_Reg_cost  = get_service_info.Mulch_S_Reg_cost>
<cfset Session.Mulch_S_Reg_rate = get_service_info.Mulch_S_Reg_rate>
<cfset Session.Mulch_S_Reg_hours  = Session.Mulch_S_Reg_qty/Session.Mulch_S_Reg_rate>
<cfset Session.Mulch_S_Reg_hoursA = #NumberFormat(Session.Mulch_S_Reg_hours,"999999.9")#>
<cfset Session.Mulch_S_Reg_actualprice  = Session.Mulch_S_Reg_hours*Session.Mulch_S_Reg_cost>
<cfset Session.Mulch_S_Reg_materials_rate  = get_materials_info.Mulch_S_Reg_materials_rate>
<!--- <cfset Session.Mulch_S_Reg_materials_qty = get_materials_info.Mulch_S_Reg_materials_qty> --->
<!---<cfset Session.Mulch_S_Reg_materials_qty=(get_service_info.Mulch_S_Reg_qty /162)>
<cfset Session.Mulch_S_Reg_materials_qty = #NumberFormat(Session.Mulch_S_Reg_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.mulch_s_reg_qty")>
  <CFSET mulch_s_reg_qty_post  =form.mulch_s_reg_qty>
</cfif>
<cfset Session.mulch_s_reg_materials_qty_actual=(get_service_info.mulch_s_reg_qty /162)>
<cfset Session.mulch_s_reg_materials_qty_actual=#NumberFormat(Session.mulch_s_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_reg_materials_qty")    AND  get_materials_info.mulch_s_reg_materials_qty  EQ Session.mulch_s_reg_materials_qty_actual  AND Session.mulch_s_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_reg_materials_qty")    AND get_materials_info.mulch_s_reg_materials_qty  EQ form.mulch_s_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_reg_qty_pre")   AND   IsDefined("mulch_s_reg_qty_post") AND mulch_s_reg_qty_pre NEQ  mulch_s_reg_qty_post>
  <cfset Session.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_reg_materials_qty=(form.mulch_s_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
  <cfelse>
  <cfset Session.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
</cfif>
<cfset Session.mulch_s_reg_materials_qty = #NumberFormat(Session.mulch_s_reg_materials_qty,"999999.9")#>
<cfset Session.Mulch_S_Reg_materials_actualprice = Session.Mulch_S_Reg_materials_rate*Session.Mulch_S_Reg_materials_qty>
<cfset Session.Mulch_S_Reg_service_materials  = Session.Mulch_S_Reg_actualprice+Session.Mulch_S_Reg_materials_actualprice >
<cfset Session.Mulch_S_Reg_times  = get_service_info.Mulch_S_Reg_times>
<cfset Session.Mulch_S_Reg_actual_extended  = Session.Mulch_S_Reg_times* #NumberFormat(Session.Mulch_S_Reg_service_materials,"999999.99")#>
<cfset Session.Mulch_S_Reg_actual_extended  =  #ROUND(Session.Mulch_S_Reg_actual_extended)#>
<cfset Session.Mulch_S_Reg_total_hours = Session.Mulch_S_Reg_hoursA*Session.Mulch_S_Reg_times>
<cfset Session.Mulch_S_Reg_overtime_adjustment =
Session.Mulch_S_Reg_actual_extended -
(Session.Mulch_S_Reg_total_hours*0.10* Session.Mulch_S_Reg_cost)+
(Session.Mulch_S_Reg_total_hours*0.10* Session.Mulch_S_Reg_cost*1.5)>
<cfset Session.Mulch_S_Reg_contract_price = Session.Mulch_S_Reg_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Pond_Maint_service_rate = 20.50>  --->
<cfset Session.Pond_Maint_qty  = get_service_info.Pond_Maint_qty >
<cfset Session.Pond_Maint_cost  = get_service_info.Pond_Maint_cost>
<cfset Session.Pond_Maint_rate = get_service_info.Pond_Maint_rate>
<cfset Session.Pond_Maint_hours  = Session.Pond_Maint_qty/Session.Pond_Maint_rate>
<cfset Session.Pond_Maint_hoursA = #NumberFormat(Session.Pond_Maint_hours,"999,999.9")#>
<cfset Session.Pond_Maint_actualprice  = Session.Pond_Maint_hours*Session.Pond_Maint_cost>
<cfset Session.Pond_Maint_materials_rate  = 0>
<cfset Session.Pond_Maint_materials_qty =0>
<cfset Session.Pond_Maint_materials_actualprice = Session.Pond_Maint_materials_rate*Session.Pond_Maint_materials_qty>
<cfset Session.Pond_Maint_service_materials  = Session.Pond_Maint_actualprice+Session.Pond_Maint_materials_actualprice >
<cfset Session.Pond_Maint_times  = get_service_info.Pond_Maint_times>
<cfset Session.Pond_Maint_actual_extended  = Session.Pond_Maint_times* #NumberFormat(Session.Pond_Maint_service_materials,"999999.99")#>
<cfset Session.Pond_Maint_actual_extended  =  #ROUND(Session.Pond_Maint_actual_extended)#>
<cfset Session.Pond_Maint_total_hours = Session.Pond_Maint_hoursA*Session.Pond_Maint_times>
<cfset Session.Pond_Maint_overtime_adjustment =
Session.Pond_Maint_actual_extended -
(Session.Pond_Maint_total_hours*0.10* Session.Pond_Maint_cost)+
(Session.Pond_Maint_total_hours*0.10* Session.Pond_Maint_cost*1.5)>
<cfset Session.Pond_Maint_contract_price = Session.Pond_Maint_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Trim_Hillside_service_rate = 20.50>  --->
<cfset Session.Trim_Hillside_qty  = get_service_info.Trim_Hillside_qty >
<cfset Session.Trim_Hillside_cost  = get_service_info.Trim_Hillside_cost>
<cfset Session.Trim_Hillside_rate = get_service_info.Trim_Hillside_rate>
<cfset Session.Trim_Hillside_hours  = Session.Trim_Hillside_qty/Session.Trim_Hillside_rate>
<cfset Session.Trim_Hillside_hoursA = #NumberFormat(Session.Trim_Hillside_hours,"999,999.9")#>
<cfset Session.Trim_Hillside_actualprice  = Session.Trim_Hillside_hours*Session.Trim_Hillside_cost>
<cfset Session.Trim_Hillside_materials_rate  = 0>
<cfset Session.Trim_Hillside_materials_qty = 0>
<cfset Session.Trim_Hillside_materials_actualprice = Session.Trim_Hillside_materials_rate*Session.Trim_Hillside_materials_qty>
<cfset Session.Trim_Hillside_service_materials  = Session.Trim_Hillside_actualprice+Session.Trim_Hillside_materials_actualprice >
<cfset Session.Trim_Hillside_times  = get_service_info.Trim_Hillside_times>
<cfset Session.Trim_Hillside_actual_extended  = Session.Trim_Hillside_times* #NumberFormat(Session.Trim_Hillside_service_materials,"999999.99")#>
<cfset Session.Trim_Hillside_actual_extended  =  #ROUND(Session.Trim_Hillside_actual_extended)#>
<cfset Session.Trim_Hillside_total_hours = Session.Trim_Hillside_hoursA*Session.Trim_Hillside_times>
<cfset Session.Trim_Hillside_overtime_adjustment =
Session.Trim_Hillside_actual_extended -
(Session.Trim_Hillside_total_hours*0.10* Session.Trim_Hillside_cost)+
(Session.Trim_Hillside_total_hours*0.10* Session.Trim_Hillside_cost*1.5)>
<cfset Session.Trim_Hillside_contract_price = Session.Trim_Hillside_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Pine_Tags_service_rate = 20.50>  --->
<cfset Session.Pine_Tags_qty  = get_service_info.Pine_Tags_qty >
<cfset Session.Pine_Tags_cost  = get_service_info.Pine_Tags_cost>
<cfset Session.Pine_Tags_rate = get_service_info.Pine_Tags_rate>
<cfset Session.Pine_Tags_hours  = Session.Pine_Tags_qty/Session.Pine_Tags_rate>
<cfset Session.Pine_Tags_hoursA = #NumberFormat(Session.Pine_Tags_hours,"999999.9")#>
<cfset Session.Pine_Tags_actualprice  = Session.Pine_Tags_hours*Session.Pine_Tags_cost>
<cfset Session.Pine_Tags_materials_rate  = get_materials_info.Pine_Tags_materials_rate>
<!---  <cfset Session.Pine_Tags_materials_qty = get_materials_info.Pine_Tags_materials_qty> --->
<cfif  IsDefined("form.Pine_Tags_qty")>
  <CFSET Pine_Tags_qty_post  =form.Pine_Tags_qty>
</cfif>
<cfset Session.Pine_Tags_materials_qty_actual=(get_service_info.Pine_Tags_qty /65)>
<cfset Session.Pine_Tags_materials_qty_actual=#NumberFormat(Session.Pine_Tags_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Pine_Tags_materials_qty")    AND  get_materials_info.Pine_Tags_materials_qty  EQ Session.Pine_Tags_materials_qty_actual  AND Session.Pine_Tags_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif   IsDefined("form.Pine_Tags_materials_qty")    AND get_materials_info.Pine_Tags_materials_qty  EQ form.Pine_Tags_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Pine_Tags_qty_pre")   AND   IsDefined("Pine_Tags_qty_post") AND Pine_Tags_qty_pre NEQ  Pine_Tags_qty_post>
  <cfset Session.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif  IsDefined("form.Pine_Tags_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Pine_Tags_materials_qty=(form.Pine_Tags_materials_qty)>
  <cfelseif   NOT IsDefined("form.Pine_Tags_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
  <cfelse>
  <cfset Session.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
</cfif>
<cfset Session.Pine_Tags_materials_qty = #NumberFormat(Session.Pine_Tags_materials_qty,"999999.9")#>

<!---<cfset Session.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
<cfset Session.Pine_Tags_materials_qty = #NumberFormat(Session.Pine_Tags_materials_qty,"999999.9")#>--->
<cfset Session.Pine_Tags_materials_actualprice = Session.Pine_Tags_materials_rate*Session.Pine_Tags_materials_qty>
<cfset Session.Pine_Tags_service_materials  = Session.Pine_Tags_actualprice+Session.Pine_Tags_materials_actualprice >
<cfset Session.Pine_Tags_times  = get_service_info.Pine_Tags_times>
<cfset Session.Pine_Tags_actual_extended  = Session.Pine_Tags_times* #NumberFormat(Session.Pine_Tags_service_materials,"999999.99")#>
<cfset Session.Pine_Tags_actual_extended  =  #ROUND(Session.Pine_Tags_actual_extended)#>
<cfset Session.Pine_Tags_total_hours = Session.Pine_Tags_hoursA*Session.Pine_Tags_times>
<cfset Session.Pine_Tags_overtime_adjustment =
Session.Pine_Tags_actual_extended -
(Session.Pine_Tags_total_hours*0.10* Session.Pine_Tags_cost)+
(Session.Pine_Tags_total_hours*0.10* Session.Pine_Tags_cost*1.5)>
<cfset Session.Pine_Tags_contract_price = Session.Pine_Tags_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.TS_hort_oil_service_rate = 20.50>  --->
<cfset Session.TS_hort_oil_qty  = get_service_info.TS_hort_oil_qty >
<cfset Session.TS_hort_oil_cost  = get_service_info.TS_hort_oil_cost>
<cfset Session.TS_hort_oil_rate = get_service_info.TS_hort_oil_rate>
<cfset Session.TS_hort_oil_hours  = Session.TS_hort_oil_qty/Session.TS_hort_oil_rate>
<cfset Session.TS_hort_oil_hoursA = #NumberFormat(Session.TS_hort_oil_hours,"999999.9")#>
<cfset Session.TS_hort_oil_actualprice  = Session.TS_hort_oil_hours*Session.TS_hort_oil_cost>
<cfset Session.TS_hort_oil_materials_rate  = get_materials_info.TS_hort_oil_materials_rate>
<!---  <cfset Session.TS_hort_oil_materials_qty = get_materials_info.TS_hort_oil_materials_qty> --->
<!---<cfset Session.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
<cfset Session.TS_hort_oil_materials_qty = #NumberFormat(Session.TS_hort_oil_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.TS_hort_oil_qty")>
  <CFSET TS_hort_oil_qty_post  =form.TS_hort_oil_qty>
</cfif>
<cfset Session.TS_hort_oil_materials_qty_actual=(get_service_info.TS_hort_oil_qty *128)>
<cfset Session.TS_hort_oil_materials_qty_actual=#NumberFormat(Session.TS_hort_oil_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_hort_oil_materials_qty")    AND  get_materials_info.TS_hort_oil_materials_qty  EQ Session.TS_hort_oil_materials_qty_actual  AND Session.TS_hort_oil_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif   IsDefined("form.TS_hort_oil_materials_qty")    AND get_materials_info.TS_hort_oil_materials_qty  EQ form.TS_hort_oil_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_hort_oil_qty_pre")   AND   IsDefined("TS_hort_oil_qty_post") AND TS_hort_oil_qty_pre NEQ  TS_hort_oil_qty_post>
  <cfset Session.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif  IsDefined("form.TS_hort_oil_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_hort_oil_materials_qty=(form.TS_hort_oil_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_hort_oil_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
  <cfelse>
  <cfset Session.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
</cfif>
<cfset Session.TS_hort_oil_materials_qty = #NumberFormat(Session.TS_hort_oil_materials_qty,"999999.99")#>
<cfset Session.TS_hort_oil_materials_actualprice = Session.TS_hort_oil_materials_rate*Session.TS_hort_oil_materials_qty>
<cfset Session.TS_hort_oil_service_materials  = Session.TS_hort_oil_actualprice+Session.TS_hort_oil_materials_actualprice >
<cfset Session.TS_hort_oil_times  = get_service_info.TS_hort_oil_times>
<cfset Session.TS_hort_oil_actual_extended  = Session.TS_hort_oil_times* #NumberFormat(Session.TS_hort_oil_service_materials,"999999.99")#>
<cfset Session.TS_hort_oil_actual_extended  =  #ROUND(Session.TS_hort_oil_actual_extended)#>
<cfset Session.TS_hort_oil_total_hours = Session.TS_hort_oil_hoursA*Session.TS_hort_oil_times>
<cfset Session.TS_hort_oil_overtime_adjustment =
Session.TS_hort_oil_actual_extended -
(Session.TS_hort_oil_total_hours*0.10* Session.TS_hort_oil_cost)+
(Session.TS_hort_oil_total_hours*0.10* Session.TS_hort_oil_cost*1.5)>
<cfset Session.TS_hort_oil_contract_price = Session.TS_hort_oil_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Addtl_Mowing_service_rate = 20.50>  --->
<cfset Session.Addtl_Mowing_qty  = get_service_info.Addtl_Mowing_qty >
<cfset Session.Addtl_Mowing_cost  = get_service_info.Addtl_Mowing_cost>
<cfset Session.Addtl_Mowing_rate = get_service_info.Addtl_Mowing_rate>
<cfset Session.Addtl_Mowing_hours  = Session.Addtl_Mowing_qty/Session.Addtl_Mowing_rate>
<cfset Session.Addtl_Mowing_hoursA = #NumberFormat(Session.Addtl_Mowing_hours,"999999.9")#>
<cfset Session.Addtl_Mowing_actualprice  = Session.Addtl_Mowing_hours*Session.Addtl_Mowing_cost>
<cfset Session.Addtl_Mowing_materials_rate  = 0>
<cfset Session.Addtl_Mowing_materials_qty = 0>
<cfset Session.Addtl_Mowing_materials_actualprice = Session.Addtl_Mowing_MATERIALS_rate*Session.Addtl_Mowing_materials_qty>
<cfset Session.Addtl_Mowing_service_materials  = Session.Addtl_Mowing_actualprice+Session.Addtl_Mowing_materials_actualprice >
<cfset Session.Addtl_Mowing_times  = get_service_info.Addtl_Mowing_times>
<cfset Session.Addtl_Mowing_actual_extended  = Session.Addtl_Mowing_times* #NumberFormat(Session.Addtl_Mowing_service_materials,"999999.99")#>
<cfset Session.Addtl_Mowing_actual_extended  =  #ROUND(Session.Addtl_Mowing_actual_extended)#>
<cfset Session.Addtl_Mowing_total_hours = Session.Addtl_Mowing_hoursA*Session.Addtl_Mowing_times>
<cfset Session.Addtl_Mowing_overtime_adjustment =
Session.Addtl_Mowing_actual_extended -
(Session.Addtl_Mowing_total_hours*0.10* Session.Addtl_Mowing_cost)+
(Session.Addtl_Mowing_total_hours*0.10* Session.Addtl_Mowing_cost*1.5)>
<cfset Session.Addtl_Mowing_contract_price = Session.Addtl_Mowing_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Day_Porter_service_rate = 20.50>  --->
<cfset Session.Day_Porter_qty  = get_service_info.Day_Porter_qty >
<cfset Session.Day_Porter_cost  = get_service_info.Day_Porter_cost>
<cfset Session.Day_Porter_rate = get_service_info.Day_Porter_rate>
<cfset Session.Day_Porter_hours  = Session.Day_Porter_qty/Session.Day_Porter_rate>
<cfset Session.Day_Porter_hoursA = #NumberFormat(Session.Day_Porter_hours,"999999.9")#>
<cfset Session.Day_Porter_actualprice  = Session.Day_Porter_hours*Session.Day_Porter_cost>
<cfset Session.Day_Porter_materials_rate  = 0>
<cfset Session.Day_Porter_materials_qty = 0>
<cfset Session.Day_Porter_materials_actualprice = Session.Day_Porter_MATERIALS_rate*Session.Day_Porter_materials_qty>
<cfset Session.Day_Porter_service_materials  = Session.Day_Porter_actualprice+Session.Day_Porter_materials_actualprice >
<cfset Session.Day_Porter_times  = get_service_info.Day_Porter_times>
<cfset Session.Day_Porter_actual_extended  = Session.Day_Porter_times* #NumberFormat(Session.Day_Porter_service_materials,"999999.99")#>
<cfset Session.Day_Porter_actual_extended  =  #ROUND(Session.Day_Porter_actual_extended)#>
<cfset Session.Day_Porter_total_hours = Session.Day_Porter_hoursA*Session.Day_Porter_times>
<cfset Session.Day_Porter_overtime_adjustment =
Session.Day_Porter_actual_extended -
(Session.Day_Porter_total_hours*0.10* Session.Day_Porter_cost)+
(Session.Day_Porter_total_hours*0.10* Session.Day_Porter_cost*1.5)>
<cfset Session.Day_Porter_contract_price = Session.Day_Porter_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Bush_Hog_service_rate = 20.50>  --->
<cfset Session.Bush_Hog_qty  = get_service_info.Bush_Hog_qty >
<cfset Session.Bush_Hog_cost  = get_service_info.Bush_Hog_cost>
<cfset Session.Bush_Hog_rate = get_service_info.Bush_Hog_rate>
<cfset Session.Bush_Hog_hours  = Session.Bush_Hog_qty/Session.Bush_Hog_rate>
<cfset Session.Bush_Hog_hoursA = #NumberFormat(Session.Bush_Hog_hours,"999,999.9")#>
<cfset Session.Bush_Hog_actualprice  = Session.Bush_Hog_hours*Session.Bush_Hog_cost>
<cfset Session.Bush_Hog_materials_rate  =0>
<cfset Session.Bush_Hog_materials_qty = 0>
<cfset Session.Bush_Hog_materials_actualprice = Session.Bush_Hog_MATERIALS_rate*Session.Bush_Hog_materials_qty>
<cfset Session.Bush_Hog_service_materials  = Session.Bush_Hog_actualprice+Session.Bush_Hog_materials_actualprice >
<cfset Session.Bush_Hog_times  = get_service_info.Bush_Hog_times>
<cfset Session.Bush_Hog_actual_extended  = Session.Bush_Hog_times* #NumberFormat(Session.Bush_Hog_service_materials,"999999.99")#>
<cfset Session.Bush_Hog_actual_extended  =  #ROUND(Session.Bush_Hog_actual_extended)#>
<cfset Session.Bush_Hog_total_hours = Session.Bush_Hog_hoursA*Session.Bush_Hog_times>
<cfset Session.Bush_Hog_overtime_adjustment =
Session.Bush_Hog_actual_extended -
(Session.Bush_Hog_total_hours*0.10* Session.Bush_Hog_cost)+
(Session.Bush_Hog_total_hours*0.10* Session.Bush_Hog_cost*1.5)>
<cfset Session.Bush_Hog_contract_price = Session.Bush_Hog_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Lot_Sweeping_service_rate = 20.50>  --->
<cfset Session.Lot_Sweeping_qty  = get_service_info.Lot_Sweeping_qty >
<cfset Session.Lot_Sweeping_cost  = get_service_info.Lot_Sweeping_cost>
<cfset Session.Lot_Sweeping_rate = get_service_info.Lot_Sweeping_rate>
<cfset Session.Lot_Sweeping_hours  = Session.Lot_Sweeping_qty/Session.Lot_Sweeping_rate>
<cfset Session.Lot_Sweeping_hoursA = #NumberFormat(Session.Lot_Sweeping_hours,"999,999.9")#>
<cfset Session.Lot_Sweeping_actualprice  = Session.Lot_Sweeping_hours*Session.Lot_Sweeping_cost>
<cfset Session.Lot_Sweeping_materials_rate  = 0>
<cfset Session.Lot_Sweeping_materials_qty = 0>
<cfset Session.Lot_Sweeping_materials_actualprice = Session.Lot_Sweeping_MATERIALS_rate*Session.Lot_Sweeping_materials_qty>
<cfset Session.Lot_Sweeping_service_materials  = Session.Lot_Sweeping_actualprice+Session.Lot_Sweeping_materials_actualprice >
<cfset Session.Lot_Sweeping_times  = get_service_info.Lot_Sweeping_times>
<cfset Session.Lot_Sweeping_actual_extended  = Session.Lot_Sweeping_times* #NumberFormat(Session.Lot_Sweeping_service_materials,"999999.99")#>
<cfset Session.Lot_Sweeping_actual_extended  =  #ROUND(Session.Lot_Sweeping_actual_extended)#>
<cfset Session.Lot_Sweeping_total_hours = Session.Lot_Sweeping_hoursA*Session.Lot_Sweeping_times>
<cfset Session.Lot_Sweeping_gm  = get_service_info.Lot_Sweeping_gm >
<cfset Session.gross_margin_diff_lot_sweeping = (100-SESSION.lot_sweeping_gm)/100>
<cfset Session.Lot_Sweeping_overtime_adjustment =
Session.Lot_Sweeping_actual_extended -
(Session.Lot_Sweeping_total_hours*0.10* Session.Lot_Sweeping_cost)+
(Session.Lot_Sweeping_total_hours*0.10* Session.Lot_Sweeping_cost*1.5)>
<cfset Session.Lot_Sweeping_contract_price = Session.Lot_Sweeping_overtime_adjustment / Session.gross_margin_diff_Lot_Sweeping>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Trail_Maint_service_rate = 20.50>  --->
<cfset Session.Trail_Maint_qty  = get_service_info.Trail_Maint_qty >
<cfset Session.Trail_Maint_cost  = get_service_info.Trail_Maint_cost>
<cfset Session.Trail_Maint_rate = get_service_info.Trail_Maint_rate>
<cfset Session.Trail_Maint_hours  = Session.Trail_Maint_qty/Session.Trail_Maint_rate>
<cfset Session.Trail_Maint_hoursA = #NumberFormat(Session.Trail_Maint_hours,"999999.9")#>
<cfset Session.Trail_Maint_actualprice  = Session.Trail_Maint_hours*Session.Trail_Maint_cost>
<cfset Session.Trail_Maint_materials_rate  =0>
<cfset Session.Trail_Maint_materials_qty =0>
<cfset Session.Trail_Maint_materials_actualprice = Session.Trail_Maint_MATERIALS_rate*Session.Trail_Maint_materials_qty>
<cfset Session.Trail_Maint_service_materials  = Session.Trail_Maint_actualprice+Session.Trail_Maint_materials_actualprice >
<cfset Session.Trail_Maint_times  = get_service_info.Trail_Maint_times>
<cfset Session.Trail_Maint_actual_extended  = Session.Trail_Maint_times* #NumberFormat(Session.Trail_Maint_service_materials,"999999.99")#>
<cfset Session.Trail_Maint_actual_extended  =  #ROUND(Session.Trail_Maint_actual_extended)#>
<cfset Session.Trail_Maint_total_hours = Session.Trail_Maint_hoursA*Session.Trail_Maint_times>
<cfset Session.Trail_Maint_overtime_adjustment =
Session.Trail_Maint_actual_extended -
(Session.Trail_Maint_total_hours*0.10* Session.Trail_Maint_cost)+
(Session.Trail_Maint_total_hours*0.10* Session.Trail_Maint_cost*1.5)>
<cfset Session.Trail_Maint_contract_price = Session.Trail_Maint_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Irrigation_TM_service_rate = 20.50>  --->
<cfset Session.Irrigation_TM_qty  = get_service_info.Irrigation_TM_qty >
<cfset Session.Irrigation_TM_cost  = get_service_info.Irrigation_TM_cost>
<cfset Session.Irrigation_TM_rate = get_service_info.Irrigation_TM_rate>
<cfset Session.Irrigation_TM_hours  = Session.Irrigation_TM_qty/Session.Irrigation_TM_rate>
<cfset Session.Irrigation_TM_hoursA = #NumberFormat(Session.Irrigation_TM_hours,"999,999.9")#>
<cfset Session.Irrigation_TM_actualprice  = Session.Irrigation_TM_hours*Session.Irrigation_TM_cost>
<cfset Session.Irrigation_TM_materials_rate  = 0>
<cfset Session.Irrigation_TM_materials_qty =0>
<cfset Session.Irrigation_TM_materials_actualprice = Session.Irrigation_TM_MATERIALS_rate*Session.Irrigation_TM_materials_qty>
<cfset Session.Irrigation_TM_service_materials  = Session.Irrigation_TM_actualprice+Session.Irrigation_TM_materials_actualprice >
<cfset Session.Irrigation_TM_times  = get_service_info.Irrigation_TM_times>
<cfset Session.Irrigation_TM_actual_extended  = Session.Irrigation_TM_times* #NumberFormat(Session.Irrigation_TM_service_materials,"999999.99")#>
<cfset Session.Irrigation_TM_actual_extended  =  #ROUND(Session.Irrigation_TM_actual_extended)#>
<cfset Session.Irrigation_TM_total_hours = Session.Irrigation_TM_hoursA*Session.Irrigation_TM_times>
<!---<cfset Session.Irrigation_TM_overtime_adjustment =
Session.Irrigation_TM_actual_extended -
(Session.Irrigation_TM_total_hours*0.10* Session.Irrigation_TM_cost)+
(Session.Irrigation_TM_total_hours*0.10* Session.Irrigation_TM_cost*1.5)>--->

<!---Changed 7/25/15
<cfset Session.Irrigation_TM_overtime_adjustment =Session.Irrigation_TM_actual_extended >
<cfset Session.Irrigation_TM_contract_price = Session.Irrigation_TM_overtime_adjustment>--->

<cfset Session.Irrigation_TM_overtime_adjustment =0 >
<cfset Session.Irrigation_TM_contract_price = Session.Irrigation_TM_actual_extended>

<!---<cfset Session.Irrigation_TM_overtime_adjustment = Session.Irrigation_TM_actual_extended>
<cfset Session.Irrigation_TM_contract_price = Session.Irrigation_TM_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Irrigation_BFI_service_rate = 20.50>  --->
<cfset Session.Irrigation_BFI_qty  = get_service_info.Irrigation_BFI_qty >
<cfset Session.Irrigation_BFI_cost  = get_service_info.Irrigation_BFI_cost>
<cfset Session.Irrigation_BFI_rate = get_service_info.Irrigation_BFI_rate>
<cfset Session.Irrigation_BFI_hours  = Session.Irrigation_BFI_qty/Session.Irrigation_BFI_rate>
<cfset Session.Irrigation_BFI_hoursA = #NumberFormat(Session.Irrigation_BFI_hours,"999,999.9")#>
<cfset Session.Irrigation_BFI_actualprice  = Session.Irrigation_BFI_hours*Session.Irrigation_BFI_cost>
<cfset Session.Irrigation_BFI_materials_rate  = 0>
<cfset Session.Irrigation_BFI_materials_qty = 0>
<cfset Session.Irrigation_BFI_materials_actualprice = Session.Irrigation_BFI_MATERIALS_rate*Session.Irrigation_BFI_materials_qty>
<cfset Session.Irrigation_BFI_service_materials  = Session.Irrigation_BFI_actualprice+Session.Irrigation_BFI_materials_actualprice >
<cfset Session.Irrigation_BFI_times  = get_service_info.Irrigation_BFI_times>
<cfset Session.Irrigation_BFI_actual_extended  = Session.Irrigation_BFI_times* #NumberFormat(Session.Irrigation_BFI_service_materials,"999999.99")#>
<cfset Session.Irrigation_BFI_actual_extended  =  #ROUND(Session.Irrigation_BFI_actual_extended)#>
<cfset Session.Irrigation_BFI_total_hours = Session.Irrigation_BFI_hoursA*Session.Irrigation_BFI_times>
<!---<cfset Session.Irrigation_BFI_overtime_adjustment =
Session.Irrigation_BFI_actual_extended -
(Session.Irrigation_BFI_total_hours*0.10* Session.Irrigation_BFI_cost)+
(Session.Irrigation_BFI_total_hours*0.10* Session.Irrigation_BFI_cost*1.5)>--->

<!---Changed 7/25/15
<cfset Session.Irrigation_BFI_overtime_adjustment = Session.Irrigation_BFI_actual_extended>
<cfset Session.Irrigation_BFI_contract_price = Session.Irrigation_BFI_overtime_adjustment >--->

<cfset Session.Irrigation_BFI_overtime_adjustment = 0>
<cfset Session.Irrigation_BFI_contract_price = Session.Irrigation_BFI_actual_extended >

<!---<cfset Session.Irrigation_BFI_overtime_adjustment = Session.Irrigation_BFI_actual_extended>
<cfset Session.Irrigation_BFI_contract_price = Session.Irrigation_BFI_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Natural_Area_service_rate = 20.50>  --->
<cfset Session.Natural_Area_qty  = get_service_info.Natural_Area_qty >
<cfset Session.Natural_Area_cost  = get_service_info.Natural_Area_cost>
<cfset Session.Natural_Area_rate = get_service_info.Natural_Area_rate>
<cfset Session.Natural_Area_hours  = Session.Natural_Area_qty/Session.Natural_Area_rate>
<cfset Session.Natural_Area_hoursA = #NumberFormat(Session.Natural_Area_hours,"999,999.9")#>
<cfset Session.Natural_Area_actualprice  = Session.Natural_Area_hours*Session.Natural_Area_cost>
<cfset Session.Natural_Area_materials_rate  = 0>
<cfset Session.Natural_Area_materials_qty = 0>
<cfset Session.Natural_Area_materials_actualprice = Session.Natural_Area_MATERIALS_rate*Session.Natural_Area_materials_qty>
<cfset Session.Natural_Area_service_materials  = Session.Natural_Area_actualprice+Session.Natural_Area_materials_actualprice >
<cfset Session.Natural_Area_times  = get_service_info.Natural_Area_times>
<cfset Session.Natural_Area_actual_extended  = Session.Natural_Area_times* #NumberFormat(Session.Natural_Area_service_materials,"999999.99")#>
<cfset Session.Natural_Area_actual_extended  =  #ROUND(Session.Natural_Area_actual_extended)#>
<cfset Session.Natural_Area_total_hours = Session.Natural_Area_hoursA*Session.Natural_Area_times>
<cfset Session.Natural_Area_overtime_adjustment =
Session.Natural_Area_actual_extended -
(Session.Natural_Area_total_hours*0.10* Session.Natural_Area_cost)+
(Session.Natural_Area_total_hours*0.10* Session.Natural_Area_cost*1.5)>
<cfset Session.Natural_Area_contract_price = Session.Natural_Area_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Trash_Receptacle_service_rate = 20.50>  --->
<cfset Session.Trash_Receptacle_qty  = get_service_info.Trash_Receptacle_qty >
<cfset Session.Trash_Receptacle_cost  = get_service_info.Trash_Receptacle_cost>
<cfset Session.Trash_Receptacle_rate = get_service_info.Trash_Receptacle_rate>
<cfset Session.Trash_Receptacle_hours  = Session.Trash_Receptacle_qty/Session.Trash_Receptacle_rate>
<cfset Session.Trash_Receptacle_hoursA = #NumberFormat(Session.Trash_Receptacle_hours,"999,999.9")#>
<cfset Session.Trash_Receptacle_actualprice  = Session.Trash_Receptacle_hours*Session.Trash_Receptacle_cost>
<cfset Session.Trash_Receptacle_materials_rate  = 0>
<cfset Session.Trash_Receptacle_materials_qty = 0>
<cfset Session.Trash_Receptacle_materials_actualprice = Session.Trash_Receptacle_MATERIALS_rate*Session.Trash_Receptacle_materials_qty>
<cfset Session.Trash_Receptacle_service_materials  = Session.Trash_Receptacle_actualprice+Session.Trash_Receptacle_materials_actualprice >
<cfset Session.Trash_Receptacle_times  = get_service_info.Trash_Receptacle_times>
<cfset Session.Trash_Receptacle_actual_extended  = Session.Trash_Receptacle_times* #NumberFormat(Session.Trash_Receptacle_service_materials,"999999.99")#>
<cfset Session.Trash_Receptacle_actual_extended  =  #ROUND(Session.Trash_Receptacle_actual_extended)#>
<cfset Session.Trash_Receptacle_total_hours = Session.Trash_Receptacle_hoursA*Session.Trash_Receptacle_times>
<cfset Session.Trash_Receptacle_overtime_adjustment =
Session.Trash_Receptacle_actual_extended -
(Session.Trash_Receptacle_total_hours*0.10* Session.Trash_Receptacle_cost)+
(Session.Trash_Receptacle_total_hours*0.10* Session.Trash_Receptacle_cost*1.5)>
<cfset Session.Trash_Receptacle_contract_price = Session.Trash_Receptacle_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Playground_mulch_service_rate = 20.50>  --->
<cfset Session.Playground_mulch_qty  = get_service_info.Playground_mulch_qty >
<cfset Session.Playground_mulch_cost  = get_service_info.Playground_mulch_cost>
<cfset Session.Playground_mulch_rate = get_service_info.Playground_mulch_rate>
<cfset Session.Playground_mulch_hours  = Session.Playground_mulch_qty/Session.Playground_mulch_rate>
<cfset Session.Playground_mulch_hoursA = #NumberFormat(Session.Playground_mulch_hours,"999999.9")#>
<cfset Session.Playground_mulch_actualprice  = Session.Playground_mulch_hours*Session.Playground_mulch_cost>
<cfset Session.Playground_mulch_materials_rate  = get_materials_info.Playground_mulch_materials_rate>
<!---  <cfset Session.Playground_mulch_materials_qty = get_materials_info.Playground_mulch_materials_qty>  --->
<!---<cfset Session.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty /162)>
<cfset Session.Playground_mulch_materials_qty = #NumberFormat(Session.Playground_mulch_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.Playground_mulch_qty")>
  <CFSET Playground_mulch_qty_post  =form.Playground_mulch_qty>
</cfif>
<cfset Session.Playground_mulch_materials_qty_actual=(get_service_info.Playground_mulch_qty /162)>
<cfset Session.Playground_mulch_materials_qty_actual=#NumberFormat(Session.Playground_mulch_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Playground_mulch_materials_qty")    AND  get_materials_info.Playground_mulch_materials_qty  EQ Session.Playground_mulch_materials_qty_actual  AND Session.Playground_mulch_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif   IsDefined("form.Playground_mulch_materials_qty")    AND get_materials_info.Playground_mulch_materials_qty  EQ form.Playground_mulch_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Playground_mulch_qty_pre")   AND   IsDefined("Playground_mulch_qty_post") AND Playground_mulch_qty_pre NEQ  Playground_mulch_qty_post>
  <cfset Session.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif  IsDefined("form.Playground_mulch_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Playground_mulch_materials_qty=(form.Playground_mulch_materials_qty)>
  <cfelseif   NOT IsDefined("form.Playground_mulch_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
  <cfelse>
  <cfset Session.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
</cfif>
<cfset Session.Playground_mulch_materials_qty = #NumberFormat(Session.Playground_mulch_materials_qty,"999999.9")#>
<cfset Session.Playground_mulch_materials_actualprice = Session.Playground_mulch_MATERIALS_rate*Session.Playground_mulch_materials_qty>
<cfset Session.Playground_mulch_service_materials  = Session.Playground_mulch_actualprice+Session.Playground_mulch_materials_actualprice >
<cfset Session.Playground_mulch_times  = get_service_info.Playground_mulch_times>
<cfset Session.Playground_mulch_actual_extended  = Session.Playground_mulch_times* #NumberFormat(Session.Playground_mulch_service_materials,"999999.99")#>
<cfset Session.Playground_mulch_actual_extended  =  #ROUND(Session.Playground_mulch_actual_extended)#>
<cfset Session.Playground_mulch_total_hours = Session.Playground_mulch_hoursA*Session.Playground_mulch_times>
<cfset Session.Playground_mulch_overtime_adjustment =
Session.Playground_mulch_actual_extended -
(Session.Playground_mulch_total_hours*0.10* Session.Playground_mulch_cost)+
(Session.Playground_mulch_total_hours*0.10* Session.Playground_mulch_cost*1.5)>
<cfset Session.Playground_mulch_contract_price = Session.Playground_mulch_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Nutsedge_service_rate = 20.50>  --->
<cfset Session.Turf_Nutsedge_qty  = get_service_info.Turf_Nutsedge_qty >
<cfset Session.Turf_Nutsedge_cost  = get_service_info.Turf_Nutsedge_cost>
<cfset Session.Turf_Nutsedge_rate = get_service_info.Turf_Nutsedge_rate>
<cfset Session.Turf_Nutsedge_hours  = Session.Turf_Nutsedge_qty/Session.Turf_Nutsedge_rate>
<cfset Session.Turf_Nutsedge_hoursA = #NumberFormat(Session.Turf_Nutsedge_hours,"999999.9")#>
<cfset Session.Turf_Nutsedge_actualprice  = Session.Turf_Nutsedge_hours*Session.Turf_Nutsedge_cost>
<cfset Session.Turf_Nutsedge_materials_rate  = get_materials_info.Turf_Nutsedge_materials_rate>
<!--- <cfset Session.Turf_Nutsedge_materials_qty = get_materials_info.Turf_Nutsedge_materials_qty>--->
<!---<cfset Session.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty /10000)>
<cfset Session.Turf_Nutsedge_materials_qty= #NumberFormat(Session.Turf_Nutsedge_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Nutsedge_qty")>
  <CFSET Turf_Nutsedge_qty_post  =form.Turf_Nutsedge_qty>
</cfif>
<cfset Session.Turf_Nutsedge_materials_qty_actual=(get_service_info.Turf_Nutsedge_qty/10000)>
<cfset Session.Turf_Nutsedge_materials_qty_actual=#NumberFormat(Session.Turf_Nutsedge_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Nutsedge_materials_qty")    AND  get_materials_info.Turf_Nutsedge_materials_qty  EQ Session.Turf_Nutsedge_materials_qty_actual  AND Session.Turf_Nutsedge_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Nutsedge_materials_qty")    AND get_materials_info.Turf_Nutsedge_materials_qty  EQ form.Turf_Nutsedge_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Nutsedge_qty_pre")   AND   IsDefined("Turf_Nutsedge_qty_post") AND Turf_Nutsedge_qty_pre NEQ  Turf_Nutsedge_qty_post>
  <cfset Session.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Nutsedge_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Nutsedge_materials_qty=(form.Turf_Nutsedge_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Nutsedge_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
  <cfelse>
  <cfset Session.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
</cfif>
<cfset Session.Turf_Nutsedge_materials_qty = #NumberFormat(Session.Turf_Nutsedge_materials_qty,"999999.99")#>
<cfset Session.Turf_Nutsedge_materials_actualprice = Session.Turf_Nutsedge_MATERIALS_rate*Session.Turf_Nutsedge_materials_qty>
<cfset Session.Turf_Nutsedge_service_materials  = Session.Turf_Nutsedge_actualprice+Session.Turf_Nutsedge_materials_actualprice >
<cfset Session.Turf_Nutsedge_times  = get_service_info.Turf_Nutsedge_times>
<cfset Session.Turf_Nutsedge_actual_extended  = Session.Turf_Nutsedge_times* #NumberFormat(Session.Turf_Nutsedge_service_materials,"999999.99")#>
<cfset Session.Turf_Nutsedge_actual_extended  =  #ROUND(Session.Turf_Nutsedge_actual_extended)#>
<cfset Session.Turf_Nutsedge_total_hours = Session.Turf_Nutsedge_hoursA*Session.Turf_Nutsedge_times>
<cfset Session.Turf_Nutsedge_overtime_adjustment =
Session.Turf_Nutsedge_actual_extended -
(Session.Turf_Nutsedge_total_hours*0.10* Session.Turf_Nutsedge_cost)+
(Session.Turf_Nutsedge_total_hours*0.10* Session.Turf_Nutsedge_cost*1.5)>
<cfset Session.Turf_Nutsedge_contract_price = Session.Turf_Nutsedge_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Fungicide_service_rate = 20.50>  --->
<cfset Session.Turf_Fungicide_qty  = get_service_info.Turf_Fungicide_qty >
<cfset Session.Turf_Fungicide_cost  = get_service_info.Turf_Fungicide_cost>
<cfset Session.Turf_Fungicide_rate = get_service_info.Turf_Fungicide_rate>
<cfset Session.Turf_Fungicide_hours  = Session.Turf_Fungicide_qty/Session.Turf_Fungicide_rate>
<cfset Session.Turf_Fungicide_hoursA = #NumberFormat(Session.Turf_Fungicide_hours,"999999.9")#>
<cfset Session.Turf_Fungicide_actualprice  = Session.Turf_Fungicide_hours*Session.Turf_Fungicide_cost>
<cfset Session.Turf_Fungicide_materials_rate  = get_materials_info.Turf_Fungicide_materials_rate>
<!--- <cfset Session.Turf_Fungicide_materials_qty = get_materials_info.Turf_Fungicide_materials_qty>--->
<!---<cfset Session.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty /10000)>
<cfset Session.Turf_Fungicide_materials_qty= #NumberFormat(Session.Turf_Fungicide_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Fungicide_qty")>
  <CFSET Turf_Fungicide_qty_post  =form.Turf_Fungicide_qty>
</cfif>
<cfset Session.Turf_Fungicide_materials_qty_actual=(get_service_info.Turf_Fungicide_qty/10000)>
<cfset Session.Turf_Fungicide_materials_qty_actual=#NumberFormat(Session.Turf_Fungicide_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Fungicide_materials_qty")    AND  get_materials_info.Turf_Fungicide_materials_qty  EQ Session.Turf_Fungicide_materials_qty_actual  AND Session.Turf_Fungicide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Fungicide_materials_qty")    AND get_materials_info.Turf_Fungicide_materials_qty  EQ form.Turf_Fungicide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Fungicide_qty_pre")   AND   IsDefined("Turf_Fungicide_qty_post") AND Turf_Fungicide_qty_pre NEQ  Turf_Fungicide_qty_post>
  <cfset Session.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Fungicide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Fungicide_materials_qty=(form.Turf_Fungicide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Fungicide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
  <cfelse>
  <cfset Session.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
</cfif>
<cfset Session.Turf_Fungicide_materials_qty = #NumberFormat(Session.Turf_Fungicide_materials_qty,"999999.99")#>
<cfset Session.Turf_Fungicide_materials_actualprice = Session.Turf_Fungicide_MATERIALS_rate*Session.Turf_Fungicide_materials_qty>
<cfset Session.Turf_Fungicide_service_materials  = Session.Turf_Fungicide_actualprice+Session.Turf_Fungicide_materials_actualprice >
<cfset Session.Turf_Fungicide_times  = get_service_info.Turf_Fungicide_times>
<cfset Session.Turf_Fungicide_actual_extended  = Session.Turf_Fungicide_times* #NumberFormat(Session.Turf_Fungicide_service_materials,"999999.99")#>
<cfset Session.Turf_Fungicide_actual_extended  =  #ROUND(Session.Turf_Fungicide_actual_extended)#>
<cfset Session.Turf_Fungicide_total_hours = Session.Turf_Fungicide_hoursA*Session.Turf_Fungicide_times>
<cfset Session.Turf_Fungicide_overtime_adjustment =
Session.Turf_Fungicide_actual_extended -
(Session.Turf_Fungicide_total_hours*0.10* Session.Turf_Fungicide_cost)+
(Session.Turf_Fungicide_total_hours*0.10* Session.Turf_Fungicide_cost*1.5)>
<cfset Session.Turf_Fungicide_contract_price = Session.Turf_Fungicide_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset Session.Turf_Insecticide_service_rate = 20.50>  --->
<cfset Session.Turf_Insecticide_qty  = get_service_info.Turf_Insecticide_qty >
<cfset Session.Turf_Insecticide_cost  = get_service_info.Turf_Insecticide_cost>
<cfset Session.Turf_Insecticide_rate = get_service_info.Turf_Insecticide_rate>
<cfset Session.Turf_Insecticide_hours  = Session.Turf_Insecticide_qty/Session.Turf_Insecticide_rate>
<cfset Session.Turf_Insecticide_hoursA = #NumberFormat(Session.Turf_Insecticide_hours,"999999.9")#>
<cfset Session.Turf_Insecticide_actualprice  = Session.Turf_Insecticide_hours*Session.Turf_Insecticide_cost>
<cfset Session.Turf_Insecticide_materials_rate  = get_materials_info.Turf_Insecticide_materials_rate>
<!---<cfset Session.Turf_Insecticide_materials_qty = get_materials_info.Turf_Insecticide_materials_qty> --->
<!---<cfset Session.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty /10000)>
<cfset Session.Turf_Insecticide_materials_qty = #NumberFormat(Session.Turf_Insecticide_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Insecticide_qty")>
  <CFSET Turf_Insecticide_qty_post  =form.Turf_Insecticide_qty>
</cfif>
<cfset Session.Turf_Insecticide_materials_qty_actual=(get_service_info.Turf_Insecticide_qty/10000)>
<cfset Session.Turf_Insecticide_materials_qty_actual=#NumberFormat(Session.Turf_Insecticide_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Insecticide_materials_qty")    AND  get_materials_info.Turf_Insecticide_materials_qty  EQ Session.Turf_Insecticide_materials_qty_actual  AND Session.Turf_Insecticide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Insecticide_materials_qty")    AND get_materials_info.Turf_Insecticide_materials_qty  EQ form.Turf_Insecticide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Insecticide_qty_pre")   AND   IsDefined("Turf_Insecticide_qty_post") AND Turf_Insecticide_qty_pre NEQ  Turf_Insecticide_qty_post>
  <cfset Session.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Insecticide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Insecticide_materials_qty=(form.Turf_Insecticide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Insecticide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
  <cfelse>
  <cfset Session.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
</cfif>
<cfset Session.Turf_Insecticide_materials_qty = #NumberFormat(Session.Turf_Insecticide_materials_qty,"999999.99")#>
<cfset Session.Turf_Insecticide_materials_actualprice = Session.Turf_Insecticide_MATERIALS_rate*Session.Turf_Insecticide_materials_qty>
<cfset Session.Turf_Insecticide_service_materials  = Session.Turf_Insecticide_actualprice+Session.Turf_Insecticide_materials_actualprice >
<cfset Session.Turf_Insecticide_times  = get_service_info.Turf_Insecticide_times>
<cfset Session.Turf_Insecticide_actual_extended  = Session.Turf_Insecticide_times* #NumberFormat(Session.Turf_Insecticide_service_materials,"999999.99")#>
<cfset Session.Turf_Insecticide_actual_extended  =  #ROUND(Session.Turf_Insecticide_actual_extended)#>
<cfset Session.Turf_Insecticide_total_hours = Session.Turf_Insecticide_hoursA*Session.Turf_Insecticide_times>
<cfset Session.Turf_Insecticide_overtime_adjustment =
Session.Turf_Insecticide_actual_extended -
(Session.Turf_Insecticide_total_hours*0.10* Session.Turf_Insecticide_cost)+
(Session.Turf_Insecticide_total_hours*0.10* Session.Turf_Insecticide_cost*1.5)>
<cfset Session.Turf_Insecticide_contract_price = Session.Turf_Insecticide_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset Session.blank1_service_rate =get_service_info.blank1_service_rate>  --->
<cfset Session.blank1_service  = get_service_info.blank1_service>
<cfset Session.blank1_unit  = get_service_info.blank1_unit>
<cfset Session.blank1_qty  = get_service_info.blank1_qty>
<cfset Session.blank1_cost  =  get_service_info.blank1_cost>
<cfset Session.blank1_rate =get_service_info.blank1_rate>
<cfset Session.blank1_hours  = Session.blank1_qty/Session.blank1_rate>
<cfset Session.blank1_hoursA = #NumberFormat(Session.blank1_hours,"999999.9")#>
<cfset Session.blank1_actualprice  = Session.blank1_hours*Session.blank1_cost>
<cfset Session.blank1_materials_rate  = 0>
<cfset Session.blank1_materials_qty = 0>
<cfset Session.blank1_materials_actualprice = Session.blank1_MATERIALS_rate*Session.blank1_materials_qty>
<cfset Session.blank1_service_materials  = Session.blank1_actualprice+Session.blank1_materials_actualprice >
<cfset Session.blank1_times  = get_service_info.blank1_times>
<cfset Session.blank1_actual_extended  = Session.blank1_times* #NumberFormat(Session.blank1_service_materials,"999999.99")#>
<cfset Session.blank1_actual_extended  =  #ROUND(Session.blank1_actual_extended)#>
<cfset Session.blank1_total_hours = Session.blank1_hoursA*Session.blank1_times>
<cfset Session.blank1_gm  = get_service_info.blank1_gm >
<cfset Session.gross_margin_diff_blank1 = (100-SESSION.blank1_gm)/100>
<cfset Session.blank1_overtime_adjustment =
Session.blank1_actual_extended -
(Session.blank1_total_hours*0.10* Session.blank1_cost)+
(Session.blank1_total_hours*0.10* Session.blank1_cost*1.5)>
<cfset Session.blank1_contract_price = Session.blank1_overtime_adjustment / Session.gross_margin_diff_blank1>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset Session.blank2_service_rate =get_service_info.blank2_service_rate>  --->
<cfset Session.blank2_service  = get_service_info.blank2_service>
<cfset Session.blank2_unit  = get_service_info.blank2_unit>
<cfset Session.blank2_qty  = get_service_info.blank2_qty>
<cfset Session.blank2_cost  =  get_service_info.blank2_cost>
<cfset Session.blank2_rate =get_service_info.blank2_rate>
<cfset Session.blank2_hours  = Session.blank2_qty/Session.blank2_rate>
<cfset Session.blank2_hoursA = #NumberFormat(Session.blank2_hours,"999999.9")#>
<cfset Session.blank2_actualprice  = Session.blank2_hours*Session.blank2_cost>
<cfset Session.blank2_materials_rate  = 0>
<cfset Session.blank2_materials_qty = 0>
<cfset Session.blank2_materials_actualprice = Session.blank2_MATERIALS_rate*Session.blank2_materials_qty>
<cfset Session.blank2_service_materials  = Session.blank2_actualprice+Session.blank2_materials_actualprice >
<cfset Session.blank2_times  = get_service_info.blank2_times>
<cfset Session.blank2_actual_extended  = Session.blank2_times* #NumberFormat(Session.blank2_service_materials,"999999.99")#>
<cfset Session.blank2_actual_extended  =  #ROUND(Session.blank2_actual_extended)#>
<cfset Session.blank2_total_hours = Session.blank2_hoursA*Session.blank2_times>
<cfset Session.blank2_gm  = get_service_info.blank2_gm >
<cfset Session.gross_margin_diff_blank2 = (100-SESSION.blank2_gm)/100>
<cfset Session.blank2_overtime_adjustment =
Session.blank2_actual_extended -
(Session.blank2_total_hours*0.10* Session.blank2_cost)+
(Session.blank2_total_hours*0.10* Session.blank2_cost*1.5)>
<cfset Session.blank2_contract_price = Session.blank2_overtime_adjustment / Session.gross_margin_diff_blank2>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset Session.blank3_service_rate =get_service_info.blank3_service_rate>  --->
<cfset Session.blank3_service  = get_service_info.blank3_service>
<cfset Session.blank3_unit  = get_service_info.blank3_unit>
<cfset Session.blank3_qty  = get_service_info.blank3_qty>
<cfset Session.blank3_cost  =  get_service_info.blank3_cost>
<cfset Session.blank3_rate =get_service_info.blank3_rate>
<cfset Session.blank3_hours  = Session.blank3_qty/Session.blank3_rate>
<cfset Session.blank3_hoursA = #NumberFormat(Session.blank3_hours,"999999.9")#>
<cfset Session.blank3_actualprice  = Session.blank3_hours*Session.blank3_cost>
<cfset Session.blank3_materials_rate  = 0>
<cfset Session.blank3_materials_qty = 0>
<cfset Session.blank3_materials_actualprice = Session.blank3_MATERIALS_rate*Session.blank3_materials_qty>
<cfset Session.blank3_service_materials  = Session.blank3_actualprice+Session.blank3_materials_actualprice >
<cfset Session.blank3_times  = get_service_info.blank3_times>
<cfset Session.blank3_actual_extended  = Session.blank3_times* #NumberFormat(Session.blank3_service_materials,"999999.99")#>
<cfset Session.blank3_actual_extended  =  #ROUND(Session.blank3_actual_extended)#>
<cfset Session.blank3_total_hours = Session.blank3_hoursA*Session.blank3_times>
<cfset Session.blank3_gm  = get_service_info.blank3_gm >
<cfset Session.gross_margin_diff_blank3 = (100-SESSION.blank3_gm)/100>
<cfset Session.blank3_overtime_adjustment =
Session.blank3_actual_extended -
(Session.blank3_total_hours*0.10* Session.blank3_cost)+
(Session.blank3_total_hours*0.10* Session.blank3_cost*1.5)>
<cfset Session.blank3_contract_price = Session.blank3_overtime_adjustment / Session.gross_margin_diff_blank3>

<!------------------------------------------------------------------------------------------------------------->
<!---Start & End Dates & Installments  --->
<cfset Session.contract_start_date   = get_service_info.contract_start_date  >
<cfset Session.contract_end_date  = get_service_info.contract_end_date>
<cfset Session.contract_installments = get_service_info.contract_installments>

<!--- Totals 1 --->
<cfset Session.total_actual_extended = 
Session.push_mow_actual_extended  
+Session.walk_behind_actual_extended
+Session.ride_mow_actual_extended
+Session.hard_edge_actual_extended
+Session.bed_edge_actual_extended
+Session.TRIM_O_actual_extended
+Session.TRIM_S_actual_extended
+Session.spraying_actual_extended
+Session.weeding_actual_extended
+Session.blowing_actual_extended
+Session.Trash_S_actual_extended
+Session.traveltime_actual_extended  
+Session.Trash_O_actual_extended
+Session.leafrem_actual_extended
+Session.cleanup_actual_extended
+Session.turf_preg_actual_extended 
+Session.turf_prel_actual_extended  
+Session.turf_post_actual_extended 
+Session.turf_fert_actual_extended
+Session.turf_lime_actual_extended
+Session.Turf_Aer_H_actual_extended
+Session.Turf_Aer_T_actual_extended
+Session.Turf_Seed_actual_extended
+Session.Pruning_TP_actual_extended
+Session.Pruning_S_actual_extended
+Session.TS_Fert_actual_extended 
+Session.TS_Insect_actual_extended  
+Session.Annuals_S_actual_extended 
+Session.Annuals_F_actual_extended 
+Session.Irrigation_SU_actual_extended 
+Session.Irrigation_W_actual_extended 
+Session.Irrigation_I_actual_extended 
+Session.Mulch_F_Reg_actual_extended 
+Session.Mulch_S_Reg_actual_extended 
+Session.mulch_s_dyed_actual_extended 
+Session.mulch_f_dyed_actual_extended 
+Session.mulch_edging_actual_extended 
+Session.mulch_pre_actual_extended
+Session.Pond_maint_actual_extended 
+Session.Trim_Hillside_actual_extended 
+Session.Pine_Tags_actual_extended
+Session.TS_hort_oil_actual_extended
+Session.Addtl_Mowing_actual_extended
+Session.Day_Porter_actual_extended
+Session.Bush_Hog_actual_extended
+Session.Lot_Sweeping_actual_extended
+Session.Trail_Maint_actual_extended
+Session.Irrigation_TM_actual_extended
+Session.Irrigation_BFI_actual_extended
+Session.Natural_Area_actual_extended
+Session.Trash_Receptacle_actual_extended
+Session.Playground_mulch_actual_extended
+Session.Turf_Nutsedge_actual_extended
+Session.Turf_Fungicide_actual_extended
+Session.Turf_Insecticide_actual_extended
+Session.blank1_actual_extended
+Session.blank2_actual_extended
+Session.blank3_actual_extended
 >
<!--- Totals 2 --->
<cfset Session.total_hours = 
Session.push_mow_total_hours 
+Session.walk_behind_total_hours 
+Session.ride_mow_total_hours
+Session.hard_edge_total_hours
+Session.bed_edge_total_hours
+Session.TRIM_O_total_hours
+Session.TRIM_S_total_hours
+Session.spraying_total_hours
+Session.weeding_total_hours
+Session.blowing_total_hours
+Session.Trash_S_total_hours
+Session.traveltime_total_hours
+Session.Trash_O_total_hours
+Session.leafrem_total_hours
+Session.cleanup_total_hours
+Session.turf_preg_total_hours 
+Session.turf_prel_total_hours 
+Session.turf_post_total_hours
+Session.turf_fert_total_hours
+Session.turf_lime_total_hours
+Session.Turf_Aer_H_total_hours
+Session.Turf_Aer_T_total_hours
+Session.Turf_Seed_total_hours
+Session.Pruning_TP_total_hours
+Session.Pruning_S_total_hours
+Session.TS_Fert_total_hours
+Session.TS_Insect_total_hours
+Session.Annuals_S_total_hours
+Session.Annuals_F_total_hours
+Session.Irrigation_SU_total_hours
+Session.Irrigation_W_total_hours
+Session.Irrigation_I_total_hours
+Session.Mulch_F_Reg_total_hours 
+Session.Mulch_S_Reg_total_hours 
+Session.mulch_s_dyed_total_hours 
+Session.mulch_f_dyed_total_hours 
+Session.mulch_edging_total_hours
+Session.mulch_pre_total_hours
+Session.Pond_maint_total_hours 
+Session.Trim_Hillside_total_hours  
+Session.Pine_Tags_total_hours 
+Session.TS_hort_oil_total_hours 
+Session.Addtl_Mowing_total_hours 
+Session.Day_Porter_total_hours 
+Session.Bush_Hog_total_hours 
+Session.Lot_Sweeping_total_hours 
+Session.Trail_Maint_total_hours 
+Session.Irrigation_TM_total_hours 
+Session.Irrigation_BFI_total_hours 
+Session.Natural_Area_total_hours 
+Session.Trash_Receptacle_total_hours
+Session.Playground_mulch_total_hours
+Session.Turf_Nutsedge_total_hours
+Session.Turf_Fungicide_total_hours
+Session.Turf_Insecticide_total_hours
+Session.blank1_total_hours
+Session.blank2_total_hours
+Session.blank3_total_hours
 >
<!--- Totals 3 --->
<cfset Session.total_overtime_adjustment = 
Session.push_mow_overtime_adjustment 
+Session.walk_behind_overtime_adjustment
+Session.ride_mow_overtime_adjustment
+Session.hard_edge_overtime_adjustment
+Session.bed_edge_overtime_adjustment
+Session.TRIM_O_overtime_adjustment
+Session.TRIM_S_overtime_adjustment
+Session.spraying_overtime_adjustment
+Session.weeding_overtime_adjustment
+Session.blowing_overtime_adjustment
+Session.Trash_S_overtime_adjustment
+Session.traveltime_overtime_adjustment 
+Session.Trash_O_overtime_adjustment 
+Session.leafrem_overtime_adjustment
+Session.cleanup_overtime_adjustment
+Session.turf_preg_overtime_adjustment
+Session.turf_prel_overtime_adjustment
+Session.turf_post_overtime_adjustment
+Session.turf_fert_overtime_adjustment
+Session.turf_lime_overtime_adjustment
+Session.Turf_Aer_H_overtime_adjustment 
+Session.Turf_Aer_T_overtime_adjustment
+Session.Turf_Seed_overtime_adjustment
+Session.Pruning_TP_overtime_adjustment
+Session.Pruning_S_overtime_adjustment  
+Session.TS_Fert_overtime_adjustment 
+Session.TS_Insect_overtime_adjustment 
+Session.Annuals_S_overtime_adjustment
+Session.Annuals_F_overtime_adjustment
+Session.Irrigation_SU_overtime_adjustment
+Session.Irrigation_W_overtime_adjustment
+Session.Irrigation_I_overtime_adjustment
+Session.Mulch_F_Reg_overtime_adjustment
+Session.Mulch_S_Reg_overtime_adjustment
+Session.mulch_s_dyed_overtime_adjustment
+Session.mulch_f_dyed_overtime_adjustment
+Session.mulch_edging_overtime_adjustment
+Session.Mulch_pre_overtime_adjustment
+Session.Pond_maint_overtime_adjustment 
+Session.Trim_Hillside_overtime_adjustment
+Session.Pine_Tags_overtime_adjustment 
+Session.TS_hort_oil_overtime_adjustment  
+Session.Addtl_Mowing_overtime_adjustment
+Session.Day_Porter_overtime_adjustment
+Session.Bush_Hog_overtime_adjustment
+Session.Lot_Sweeping_overtime_adjustment
+Session.Trail_Maint_overtime_adjustment  
+Session.Irrigation_TM_overtime_adjustment   
+Session.Irrigation_BFI_overtime_adjustment   
+Session.Natural_Area_overtime_adjustment  
+Session.Trash_Receptacle_overtime_adjustment
+Session.Playground_mulch_overtime_adjustment
+Session.Turf_Nutsedge_overtime_adjustment
+Session.Turf_Fungicide_overtime_adjustment
+Session.Turf_Insecticide_overtime_adjustment
+Session.blank1_overtime_adjustment
+Session.blank2_overtime_adjustment
+Session.blank3_overtime_adjustment
>

<!---<cfoutput>#ROUND(Session.push_mow_contract_price)#</cfoutput>--->
<!--- Totals 4 --->
<cfset Session.total_contract_price = 
 ROUND(Session.push_mow_contract_price)
 + ROUND(Session.walk_behind_contract_price)
+ ROUND(Session.ride_mow_contract_price)
+ ROUND(Session.hard_edge_contract_price)
+ ROUND(Session.bed_edge_contract_price)
+ ROUND(Session.TRIM_O_contract_price)
+ ROUND(Session.TRIM_S_contract_price)
+ ROUND(Session.spraying_contract_price)
+ ROUND(Session.weeding_contract_price)
+ ROUND(Session.blowing_contract_price)
+ ROUND(Session.Trash_S_contract_price)
+ ROUND(Session.traveltime_contract_price) 
+ ROUND(Session.Trash_O_contract_price)
+ ROUND(Session.leafrem_contract_price)
+ ROUND(Session.cleanup_contract_price)
+ ROUND(Session.turf_preg_contract_price)
+ ROUND(Session.turf_prel_contract_price)
+ ROUND(Session.turf_post_contract_price)
+ ROUND(Session.turf_fert_contract_price)
+ ROUND(Session.turf_lime_contract_price)
+ ROUND(Session.Turf_Aer_H_contract_price)
+ ROUND(Session.Turf_Aer_T_contract_price)
+ ROUND(Session.Turf_Seed_contract_price)
+ ROUND(Session.Pruning_TP_contract_price)
+ ROUND(Session.Pruning_S_contract_price)
+ ROUND(Session.TS_Fert_contract_price)
+ ROUND(Session.TS_Insect_contract_price)
+ ROUND(Session.Annuals_S_contract_price)
+ ROUND(Session.Annuals_F_contract_price)
+ ROUND(Session.Irrigation_SU_contract_price)
+ ROUND(Session.Irrigation_W_contract_price)
+ ROUND(Session.Irrigation_I_contract_price)
+ ROUND(Session.Mulch_F_Reg_contract_price)
+ ROUND(Session.Mulch_S_Reg_contract_price)
+ ROUND(Session.mulch_s_dyed_contract_price)
+ ROUND(Session.mulch_f_dyed_contract_price)
+ ROUND(Session.mulch_edging_contract_price) 
+ ROUND(Session.Mulch_pre_contract_price) 
+ ROUND(Session.Pond_maint_contract_price) 
+ ROUND(Session.Trim_Hillside_contract_price) 
+ ROUND(Session.Pine_Tags_contract_price) 
+ ROUND(Session.TS_hort_oil_contract_price)   
+ ROUND(Session.Addtl_Mowing_contract_price)
+ ROUND(Session.Day_Porter_contract_price)
+ ROUND(Session.Bush_Hog_contract_price)
+ ROUND(Session.Lot_Sweeping_contract_price)
+ ROUND(Session.Trail_Maint_contract_price)
+ ROUND(Session.Irrigation_TM_contract_price)  
+ ROUND(Session.Irrigation_BFI_contract_price)   
+ ROUND(Session.Natural_Area_contract_price)
+ ROUND(Session.Trash_Receptacle_contract_price)
+ ROUND(Session.Playground_mulch_contract_price)
+ ROUND(Session.Turf_Nutsedge_contract_price)
+ ROUND(Session.Turf_Fungicide_contract_price)
+ ROUND(Session.Turf_Insecticide_contract_price)
+ ROUND(Session.blank1_contract_price)
+ ROUND(Session.blank2_contract_price)
+ ROUND(Session.blank3_contract_price)
+ ROUND(Session.Contract_Adjustment)>

<!--- Seasonal Hours  --->
<cfset Session.seasonal_hours = 
Session.push_mow_hoursa 
+Session.walk_behind_hoursa
+Session.ride_mow_hoursa
+Session.hard_edge_hoursa
+Session.bed_edge_hoursa
+Session.TRIM_O_hoursa
+Session.TRIM_S_hoursa
+Session.spraying_hoursa
+Session.weeding_hoursa
+Session.blowing_hoursa
+Session.Trash_S_hoursa
+Session.traveltime_hoursa>

<!--- Sales Tax  --->
<cfif get_quote_info.q_branch EQ 'Richmond' OR get_quote_info.q_branch EQ 'Chesterfield' OR  get_quote_info.q_branch EQ 'Charlottesville'>
  <cfset SESSION.taxrate = .000>
  <cfset SESSION.taxrateplusone = 1.000>
</cfif>
<!--- Sales Tax  --->
<cfif get_quote_info.q_branch EQ 'Newport News' OR get_quote_info.q_branch EQ 'Portstmouth' OR  get_quote_info.q_branch EQ 'Newport News'>
  <cfset SESSION.taxrate = .000>
  <cfset SESSION.taxrateplusone = 1.000>
</cfif>
<cfset Session.Irrigation_Contract = + ROUND(Session.Irrigation_SU_contract_price)+ ROUND(Session.Irrigation_W_contract_price)+ ROUND(Session.Irrigation_I_contract_price) +  ROUND(Session.Irrigation_TM_contract_price) + ROUND(Session.Irrigation_BFI_contract_price)>
<!--- <cfset Session.Seasonal_Color_Contract = (4.5*(SESSION.Annuals_F_materials_qty +SESSION.Annuals_S_materials_qty))> --->
<cfset Session.Grounds_Maintenance_Contract =  ROUND(Session.total_contract_price) - 
(ROUND(Session.Irrigation_Contract) <!---+ (SESSION.taxrateplusone *ROUND(Session.Seasonal_Color_Contract))--->)>

<!---<cfoutput>#NumberFormat(Session.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput><br />


 <cfoutput>#ROUND(Session.total_contract_price)# - (#ROUND(Session.Irrigation_Contract)#) + (#SESSION.taxrateplusone# * #ROUND(Session.Seasonal_Color_Contract)#)<br>
 </cfoutput><br />--->

<cfset SESSION.sales_tax =  SESSION.taxrate *ROUND(Session.Seasonal_Color_Contract) >
<cfset Session.Total_materials_cost = 
SESSION.spraying_materials_actualprice + SESSION.turf_preg_materials_actualprice+SESSION.turf_prel_materials_actualprice+Session.turf_post_materials_actualprice+Session.turf_fert_materials_actualprice+Session.turf_lime_materials_actualprice+
Session.Turf_Seed_materials_actualprice+Session.TS_Fert_materials_actualprice+Session.TS_Insect_materials_actualprice+Session.Mulch_pre_materials_actualprice+Session.mulch_s_dyed_materials_actualprice+Session.mulch_f_dyed_materials_actualprice+SESSION.Annuals_S_materials_actualprice+SESSION.Annuals_F_materials_actualprice+Session.Mulch_F_Reg_materials_actualprice+Session.Mulch_S_Reg_materials_actualprice+
Session.Pine_Tags_materials_actualprice+Session.TS_hort_oil_materials_actualprice+Session.Playground_mulch_materials_actualprice+Session.Turf_Nutsedge_materials_actualprice +Session.Turf_Fungicide_materials_actualprice+Session.Turf_Insecticide_materials_actualprice>
<cfquery name="update_quote_main" datasource="jrgm">
UPDATE quote_main SET 
date_updated = '#todayDate#',
user_id = '#SESSION.userid#',
push_mow_contract_price =  '#SESSION.push_mow_contract_price#',
walk_behind_contract_price =  '#SESSION.walk_behind_contract_price#',
ride_mow_contract_price =  '#SESSION.ride_mow_contract_price#',
hard_edge_contract_price =  '#SESSION.hard_edge_contract_price#',
bed_edge_contract_price =  '#SESSION.bed_edge_contract_price#',
TRIM_O_contract_price =  '#SESSION.TRIM_O_contract_price#',
TRIM_S_contract_price =  '#SESSION.TRIM_S_contract_price#',
spraying_contract_price =  '#SESSION.spraying_contract_price#',
weeding_contract_price =  '#SESSION.weeding_contract_price#',
blowing_contract_price =  '#SESSION.blowing_contract_price#',
Trash_S_contract_price =  '#SESSION.Trash_S_contract_price#',
traveltime_contract_price  =  '#SESSION.traveltime_contract_price#',
Trash_O_contract_price =  '#SESSION.Trash_O_contract_price#',
leafrem_contract_price =  '#SESSION.leafrem_contract_price#',
cleanup_contract_price =  '#SESSION.cleanup_contract_price#',
turf_preg_contract_price =  '#SESSION.turf_preg_contract_price#',
turf_prel_contract_price =  '#SESSION.turf_prel_contract_price#',
turf_post_contract_price =  '#SESSION.turf_post_contract_price#',
turf_fert_contract_price =  '#SESSION.turf_fert_contract_price#',
turf_lime_contract_price =  '#SESSION.turf_lime_contract_price#',
Turf_Aer_H_contract_price =  '#SESSION.Turf_Aer_H_contract_price#',
Turf_Aer_T_contract_price =  '#SESSION.Turf_Aer_T_contract_price#',
Turf_Seed_contract_price =  '#SESSION.Turf_Seed_contract_price#',
Pruning_TP_contract_price =  '#SESSION.Pruning_TP_contract_price#',
Pruning_S_contract_price =  '#SESSION.Pruning_S_contract_price#',
TS_Fert_contract_price =  '#SESSION.TS_Fert_contract_price#',
TS_Insect_contract_price =  '#SESSION.TS_Insect_contract_price#',
Annuals_S_contract_price =  '#SESSION.Annuals_S_contract_price#',
Annuals_F_contract_price =  '#SESSION.Annuals_F_contract_price#',
Irrigation_SU_contract_price =  '#SESSION.Irrigation_SU_contract_price#',
Irrigation_W_contract_price =  '#SESSION.Irrigation_W_contract_price#',
Irrigation_I_contract_price =  '#SESSION.Irrigation_I_contract_price#',
Mulch_F_Reg_contract_price =  '#SESSION.Mulch_F_Reg_contract_price#',
Mulch_S_Reg_contract_price =  '#SESSION.Mulch_S_Reg_contract_price#',
mulch_s_dyed_contract_price =  '#SESSION.mulch_s_dyed_contract_price#',
mulch_f_dyed_contract_price =  '#SESSION.mulch_f_dyed_contract_price#',
mulch_edging_contract_price =  '#SESSION.mulch_edging_contract_price#',
mulch_pre_contract_price =  '#SESSION.mulch_pre_contract_price#',
Pond_maint_contract_price  =  '#SESSION.Pond_maint_contract_price #',
Trim_Hillside_contract_price  =  '#SESSION.Trim_Hillside_contract_price#',
Pine_Tags_contract_price  =  '#SESSION.Pine_Tags_contract_price#',
TS_hort_oil_contract_price    =  '#SESSION.TS_hort_oil_contract_price#',
Addtl_Mowing_contract_price =  '#SESSION.Addtl_Mowing_contract_price#',
Day_Porter_contract_price =  '#SESSION.Day_Porter_contract_price#',
Bush_Hog_contract_price =  '#SESSION.Bush_Hog_contract_price#',
Lot_Sweeping_contract_price =  '#SESSION.Lot_Sweeping_contract_price#',
Trail_Maint_contract_price =  '#SESSION.Trail_Maint_contract_price#',
Irrigation_TM_contract_price   =  '#SESSION.Irrigation_TM_contract_price#',
Irrigation_BFI_contract_price    =  '#SESSION.Irrigation_BFI_contract_price#',
Natural_Area_contract_price =  '#SESSION.Natural_Area_contract_price#',
Trash_Receptacle_contract_price =  '#SESSION.Trash_Receptacle_contract_price#',
Playground_mulch_contract_price =  '#SESSION.Playground_mulch_contract_price#',
Turf_Nutsedge_contract_price =  '#SESSION.Turf_Nutsedge_contract_price#',
Turf_Fungicide_contract_price =  '#SESSION.Turf_Fungicide_contract_price#',
Turf_Insecticide_contract_price =  '#SESSION.Turf_Insecticide_contract_price#',
blank1_contract_price =  '#SESSION.blank1_contract_price#',
blank2_contract_price =  '#SESSION.blank2_contract_price#',
blank3_contract_price =  '#SESSION.blank3_contract_price#',
total_contract_price =  '#SESSION.total_contract_price#',

<cfif  IsDefined("form.contract_start_date")  AND form.contract_start_date NEQ "">
contract_start_date = '#dateformat(form.contract_start_date,"mm/dd/yyyy")#',
</cfif>
<cfif  IsDefined("form.contract_end_date")  AND  form.contract_end_date NEQ "">
contract_end_date = '#dateformat(form.contract_end_date,"mm/dd/yyyy")#',
</cfif>

<cfif  IsDefined("form.contract_installments")  AND  form.contract_installments NEQ "">
contract_installments= '#form.contract_installments#',
</cfif>

Irrigation_Contract = '#Session.Irrigation_Contract#',
Seasonal_Color_Contract = '#Session.Seasonal_Color_Contract#',
Grounds_Maintenance_Contract ='#Session.Grounds_Maintenance_Contract#'
WHERE opportunity_id = #url.id#
</cfquery>

<!---Added 6/22/2015--->
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
<!---END Added 6/22/2015--->

<!---Added 7/20/2015--->

<cfquery name="do_update_services_hours" datasource="jrgm">
UPDATE quote_services SET 
push_mow_hours = '#SESSION.push_mow_total_hours#', 
walk_behind_hours = '#SESSION.walk_behind_total_hours#',
ride_mow_hours = '#SESSION.ride_mow_total_hours#',
hard_edge_hours = '#SESSION.hard_edge_total_hours#',
bed_edge_hours = '#SESSION.bed_edge_total_hours#',
Trim_O_hours = '#SESSION.Trim_O_total_hours#',
Trim_S_hours = '#SESSION.Trim_S_total_hours#',
spraying_hours = '#SESSION.spraying_total_hours#',  
weeding_hours = '#SESSION.weeding_total_hours#',
blowing_hours = '#SESSION.blowing_total_hours#', 
Trash_S_hours = '#SESSION.Trash_S_total_hours#',
traveltime_hours = '#SESSION.traveltime_total_hours#',
Trash_O_hours = '#SESSION.Trash_O_total_hours#',
leafrem_hours = '#SESSION.leafrem_total_hours#',
cleanup_hours = '#SESSION.cleanup_total_hours#', 
turf_preg_hours =  '#SESSION.turf_preg_total_hours#',
turf_prel_hours =  '#SESSION.turf_prel_total_hours#',
turf_post_hours =  '#SESSION.turf_post_total_hours#',
turf_fert_hours =  '#SESSION.turf_fert_total_hours#',
turf_lime_hours =  '#SESSION.turf_lime_total_hours#',
Turf_Aer_H_hours =  '#SESSION.Turf_Aer_H_total_hours#',
Turf_Aer_T_hours =  '#SESSION.Turf_Aer_T_total_hours#',
Turf_Seed_hours =  '#SESSION.Turf_Seed_total_hours#',
Pruning_TP_hours =  '#SESSION.Pruning_TP_total_hours#',
Pruning_S_hours =  '#SESSION.Pruning_S_total_hours#',
TS_Fert_hours =  '#SESSION.TS_Fert_total_hours#',
TS_Insect_hours =  '#SESSION.TS_Insect_total_hours#',
Mulch_pre_hours =  '#SESSION.Mulch_pre_total_hours#',
Mulch_edging_hours =  '#SESSION.Mulch_edging_total_hours#',
mulch_s_dyed_hours =  '#SESSION.mulch_s_dyed_total_hours#',
mulch_f_dyed_hours =  '#SESSION.mulch_f_dyed_total_hours#',
Annuals_S_hours =  '#SESSION.Annuals_S_total_hours#',
Annuals_F_hours =  '#SESSION.Annuals_F_total_hours#',
Irrigation_SU_hours =  '#SESSION.Irrigation_SU_total_hours#',
Irrigation_W_hours =  '#SESSION.Irrigation_W_total_hours#',
Irrigation_I_hours =  '#SESSION.Irrigation_I_total_hours#',
Mulch_F_Reg_hours =  '#SESSION.Mulch_F_Reg_total_hours#',
Mulch_S_Reg_hours =  '#SESSION.Mulch_S_Reg_total_hours#',
Pond_Maint_hours =  '#SESSION.Pond_Maint_total_hours#',
Trim_Hillside_hours =  '#SESSION.Trim_Hillside_total_hours#',
Pine_Tags_hours =  '#SESSION.Pine_Tags_total_hours#',
TS_hort_oil_hours =  '#SESSION.TS_hort_oil_total_hours#',
Addtl_Mowing_hours =  '#SESSION.Addtl_Mowing_total_hours#',
Day_Porter_hours =  '#SESSION.Day_Porter_total_hours#',
Bush_Hog_hours =  '#SESSION.Bush_Hog_total_hours#',
Lot_Sweeping_hours =  '#SESSION.Lot_Sweeping_total_hours#',
Trail_Maint_hours =  '#SESSION.Trail_Maint_total_hours#',
Irrigation_TM_hours =  '#SESSION.Irrigation_TM_total_hours#',
Irrigation_BFI_hours =  '#SESSION.Irrigation_BFI_total_hours#',
Natural_Area_hours =  '#SESSION.Natural_Area_total_hours#',
Trash_Receptacle_hours =  '#SESSION.Trash_Receptacle_total_hours#',
Playground_mulch_hours =  '#SESSION.Playground_mulch_total_hours#',
Turf_Nutsedge_hours =  '#SESSION.Turf_Nutsedge_total_hours#',
Turf_Fungicide_hours =  '#SESSION.Turf_Fungicide_total_hours#',
Turf_Insecticide_hours =  '#SESSION.Turf_Insecticide_total_hours#',
blank1_hours =  '#SESSION.blank1_total_hours#',
blank2_hours =  '#SESSION.blank2_total_hours#',
blank3_hours =  '#SESSION.blank3_total_hours#',
contract_adjustment ='#NumberFormat(Session.contract_adjustment,"999999.99")#' 
WHERE opportunity_id = #url.id#
</cfquery>

<!---END Added 7/20/2015--->

<cfif IsDefined('Form.opportunity_name') AND IsDefined('Form.opportunity_state')>
    <cfquery name="update_quote_start" datasource="jrgm">
    UPDATE quote_start SET
    date_quote_updated = '#todayDate#',
    user_id =  '#SESSION.userid#',
    opportunity_name = <cfqueryparam value="#Form.opportunity_name#"     CFSQLType="CF_SQL_VARCHAR">,
    opportunity_state = <cfqueryparam value="#Form.opportunity_state#"     CFSQLType="CF_SQL_VARCHAR">
    WHERE opportunity_id = #url.id#
    </cfquery>
    <cflocation url="quote_data_entry.cfm?ID=#url.id#" />
<cfelse>
    <cfquery name="update_quote_start" datasource="jrgm">
        UPDATE quote_start SET
        date_quote_updated = '#todayDate#',
        user_id =  '#SESSION.userid#'
        WHERE opportunity_id = #url.id#
        </cfquery>
</cfif>

<!---<cfoutput>#NumberFormat(Session.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput>--->
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
 .noMargin { margin: -2px; }
 

</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
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
          <li class="active"><i class="fa fa-circle"></i> <a href="ServicesSummary.cfm?ID=#url.id#"  target="_blank">Summary</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="ContractTerms.cfm?ID=#url.id#"  target="_blank">Terms</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="definition_of_services.cfm?ID=#url.id#"  target="_blank">Services</a></li>
        </ul>
      </div>
    </cfoutput></div>
</div>
<div class="page-content">
  <div class="container-fluid">
    <cfif IsDefined("form.btnSumit")   AND form.btnSumit EQ 'Contract Approved'>
      <cfquery name="update_quote_start" datasource="jrgm">
UPDATE quote_start SET 
date_quote_updated = '#todayDate#',quote_approved =1,biz_approved_date = '#todayDate#',
user_id =  '#SESSION.userid#'
WHERE opportunity_id = #url.id#
</cfquery>
      <cfquery name="update_quote_start" datasource="jrgm">
UPDATE quote_main SET 
date_updated = '#todayDate#', quote_approved =1,
user_id =  '#SESSION.userid#'
WHERE opportunity_id = #url.id#
</cfquery>
      <cfmail from="alerts@jrgm.com" to="quotingapproval@jrgm.com" subject="JRGM Quote Approved" type="html">
        <style type="text/css">
       .arialfont {
	  font: normal .9em Arial, Helvetica, sans-serif;
       }
      </style>
        <span class="arialfont">Quote ID: #url.id# for #get_quote_info.opportunity_name# has been approved in jrgm.biz.<br />
        <br />
        Please review the Intacct record for accuracy.</span><br />
        <br />
      </cfmail>
      <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div class="alert alert-success"> Contract Approved</div></td>
        </tr>
      </table>
      <cfabort>
    </cfif>
    <form method="post" action="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>">
      <div class="button-boxer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_data_entry_print.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success blue-chambray" target="_blank">Print Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" target="_blank">Dimensions Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.id#&opportunity_id=#url.id#</cfoutput>" class="btn btn-success purple" >Notes</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="btnSumit" type="submit" class="btn btn-primary" id="btnSumit" value="Calculate &amp; Save"/>
      </div>
      <br />
      <br />
      <div class="container-table">
        <div class="left-table">
        <!--- <cfoutput> #Session.traveltime_contract_price#   -#Session.travel_time_gm# #Session.gross_margin_diff_travel_time# </cfoutput> ---> 
        <!---  <cfoutput>
        
           Session.Annuals_S_hoursA = #Session.Annuals_S_hoursA#<br />

         Session.Annuals_S_cost = #Session.Annuals_S_cost# <br />

         Session.overtime_adjustment_rate=#Session.overtime_adjustment_rate# <br />

         Session.Annuals_S_cost = #Session.Annuals_S_cost#
       
      Session.Annuals_S_service_materials =#Session.Annuals_S_service_materials#<br />
Session.Annuals_S_times= #Session.Annuals_S_times#<br />


         Session.Annuals_S_actual_extended -#Session.Annuals_S_actual_extended#<br />
<br />#Ceiling(Session.Annuals_S_actual_extended)#<br />
<br />
#NumberFormat(Session.Annual_S_actual_extended,"999,999.999")#
  </cfoutput> ---> 
        <cfoutput query="get_quote_info">
          <table class="table">
            <tr>
              <td>Quote ID</td>
              <td>#opportunity_id#</td>
              <td>&nbsp;</td>
              <td>Branch : #q_branch#</td>
              <td><!---#opportunity_state#---></td>
            </tr>
            <tr>
              <td>Customer</td>
              <td colspan="4"><input name="opportunity_name" value="#opportunity_name#"></td>
            </tr>
            <tr>
              <td>Job Location</td>
              <td colspan="4">#q_address1#, #q_city#, #q_address_state#, #q_address_zip#</td>
            </tr>
            <tr>
              <td>Estimator :</td>
              <td colspan="4">#SESSION.screenname#</td>
            </tr>
            <tr>
              <td>Quote Status : </td>

              <td>
                <select name="opportunity_state"   tabindex="5" >
                    <cfset statuses = ArrayNew(1)>
                    <cfset ArrayAppend(statuses, ['WON', 'WON'])>
                    <cfset ArrayAppend(statuses, ['OPEN', 'OPEN'])>
                    <cfset ArrayAppend(statuses, ['LOST', 'LOST'])>
                    <cfset ArrayAppend(statuses, ['SUSPENDED', 'SUSPENDED'])>
                    <cfset ArrayAppend(statuses, ['ABANDONED', 'ABANDONED'])>
                    <cfset ArrayAppend(statuses, ['', 'RENEWAL'])>

                    <cfloop from="1" to="#arrayLen(statuses)#" index="i">
                      <cfset value = "">
                      <cfif UCASE(opportunity_state) EQ statuses[i][1]>
                        <cfset value = ' selected="selected"'>
                      </cfif>
                      <option value="<cfoutput>#statuses[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#statuses[i][2]#</cfoutput> </option>
                    </cfloop>
                </select>
              </td>
              <td>&nbsp;</td>
              <td><a href="https://googleapps.insight.ly/Opportunities/Details/#opportunity_id#"  target="_blank">Insightly Link</a></td>
              <td></td>
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
                <input name="contract_start_date" type="text" class="form_buttons" id="contract_start_date"  size="10"  value="#dateformat(Session.contract_start_date,"mm/dd/yyyy")#"/></td>
              <td>&nbsp;</td>
              <td nowrap="nowrap"   colspan="2"  align="left">Contract End Date :
                <input name="contract_end_date" type="text" class="form_buttons" id="contract_end_date"  size="10"  value="#dateformat(Session.contract_end_date,"mm/dd/yyyy")#"/>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments :
                <input name="contract_installments" type="text" class="form_buttons" id="contract_installments"  size="2"  value="#SESSION.contract_installments#"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td  nowrap="nowrap">Annual Contract Price :  $#NumberFormat(SESSION.total_contract_price,"99,999,999")#</td>
              <td>&nbsp;</td>
              <cfif  SESSION.contract_installments GT  0>
                <cfset  total_contract_price_monthly =  SESSION.total_contract_price/SESSION.contract_installments>
                <cfelse>
                <cfset  total_contract_price_monthly =  "">
              </cfif>
              <td nowrap="nowrap">Monthly Contract Price :  $#NumberFormat(total_contract_price_monthly,"99,999,999.99")#</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </cfoutput></div>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><table class="table table-striped">
              <thead>
             <!--- 21 columns--->
                <tr>
                  <th align="left">Service</th>
                  <th align="left">Qty/SqFt</th>
                  <th align="left">Actual<br />
                    Cost</th>
                  <th align="left">Rate</th>
                  <th align="left">Unit</th>
                  <th align="right">Actual<br />
                    Price</th>
                  <th align="right">Hrs</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th align="left">Materials</th>
                  <th align="left">Qty</th>
                  <th align="left" nowrap="nowrap">Actual<br />
                    Rate</th>
                  <th align="right">Actual<br />
                    Price</th>
                  <th>&nbsp;</th>
                  <th align="right" nowrap="nowrap">Svc & Mtl</th>
                  <th align="center">Times</th>
                  
                  <th align="right">&nbsp;Actual Extend</th>
                  <th align="right">&nbsp;Total<br />
                    Hours</th>
                  <th align="right">OT<br />
                    Adjust</th>
                  <th align="center">&nbsp;Gross<br />
                    &nbsp;Margin</th>
                  <th align="right" >&nbsp;Contract Price</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td>&nbsp;</td>
                  <cfif NOT IsDefined("url.enter_service_rate")>
                    <td align="left"><a href="quote_data_entry.cfm?enter_service_rate=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a></td>
                    <cfelse>
                    <td align="left"><input name="btnSumit" type="submit" class="btn btn-primary btn-sm" id="btnSumit" value="Save Rates"/></td>
                  </cfif>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td rowspan="62"><img src="images/clear.gif" width="20" height="1" /></td>
                  <td align="left">&nbsp;</td>
                  <cfif NOT IsDefined("url.enter_materials_qty")>
                    <td align="left"><a href="quote_data_entry.cfm?enter_materials_qty=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a  ></td>
                    <cfelse>
                    <td align="left"><input name="btnSumit1" type="submit" class="btn btn-primary btn-xs" id="btnSumit" value="Save Qty"/></td>
                  </cfif>
                  <cfif NOT IsDefined("url.enter_materials_rate")>
                    <td align="left"><a href="quote_data_entry.cfm?enter_materials_rate=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a  ></td>
                    <cfelse>
                    <td align="left"><input name="btnSumit" type="submit" class="btn btn-primary btn-xs" id="btnSumit" value="Save Rates"/></td>
                  </cfif>
                  <td align="right">&nbsp;</td>
                  <td rowspan="62"><img src="images/clear.gif" width="20" height="1" /></td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" >10%</td>
                   <cfset Session.gross_margin =  #TRIM(Session.gross_margin)#>
                 <cfoutput> <td align="right"><input name="gross_margin" type="text"   class="noMargin"  size="4"  value="#NumberFormat(Session.gross_margin,"999.999")#"/></td></cfoutput>
                  <td align="right" >&nbsp;</td>
                </tr>
                <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Push Mow</td>
                    <td align="right"><input name="push_mow_qty" type="text" id="push_mow_qty"   size="6"    value="#Session.push_mow_qty#"/></td>
                    <td nowrap="nowrap">$#Session.push_mow_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.push_mow_rate,"999,999")#</td>
                      <input type="hidden"  name="push_mow_rate" value="#Session.push_mow_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="push_mow_rate" type="text" id="pushmow_rate"   size="5"  value="#Session.push_mow_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.push_mow_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.push_mow_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$ #NumberFormat(Session.push_mow_service_materials,"999.99")#</td>
                    <td align="right"><input name="push_mow_times" type="text" class="form_buttons" id="push_mow_times"  size="2"  value="#Session.push_mow_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.push_mow_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.push_mow_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.push_mow_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.push_mow_contract_price  =  #ROUND(Session.push_mow_contract_price)#>
                    <td align="right">$#NumberFormat(Session.push_mow_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Walk Behind</td>
                    <td align="right"><input name="walk_behind_qty" type="text" id="walk_behind_qty"   size="6"   value="#Session.walk_behind_qty#"/></td>
                    <td nowrap="nowrap">$#Session.walk_behind_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.walk_behind_rate,"999,999")#</td>
                      <input type="hidden"  name="walk_behind_rate" value="#Session.walk_behind_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="walk_behind_rate" type="text" id="walk_behind_rate"   size="5"  value="#Session.walk_behind_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$#NumberFormat(Session.walk_behind_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.walk_behind_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.walk_behind_service_materials,"999.99")#</td>
                    <td align="right"><input name="walk_behind_times" type="text"   size="2" value="#Session.walk_behind_times#"/></td>
                    <td align="right">$#NumberFormat(Session.walk_behind_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.walk_behind_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.walk_behind_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.walk_behind_contract_price  =  #ROUND(Session.walk_behind_contract_price)#>
                    <td align="right">$#NumberFormat(Session.walk_behind_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Ride Mow</td>
                    <td align="right"><input name="ride_mow_qty" type="text" id="ride_mow_qty"   size="6"   value="#Session.ride_mow_qty#"/></td>
                    <td nowrap="nowrap">$#Session.ride_mow_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.ride_mow_rate,"999,999")#</td>
                      <input type="hidden"  name="ride_mow_rate" value="#Session.ride_mow_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="ride_mow_rate" type="text" id="ride_mow_rate"   size="5"  value="#Session.ride_mow_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$#NumberFormat(Session.ride_mow_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.ride_mow_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.ride_mow_service_materials,"999.99")#</td>
                    <td align="right"><input name="ride_mow_times" type="text"   size="2" value="#Session.ride_mow_times#"/></td>
                    <td align="right">$#NumberFormat(Session.ride_mow_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.ride_mow_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.ride_mow_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.ride_mow_contract_price  =  #ROUND(Session.ride_mow_contract_price)#>
                    <td align="right">$#NumberFormat(Session.ride_mow_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Hard Edge </td>
                    <td align="right"><input name="hard_edge_qty" type="text" id="hard_edge_qty"   size="6"   value="#Session.hard_edge_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Hard_Edge_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.hard_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="hard_edge_rate" value="#Session.hard_edge_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="hard_edge_rate" type="text" id="hard_edge_rate"   size="5"  value="#Session.hard_edge_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">LF</td>
                    <td align="right">$#NumberFormat(Session.hard_edge_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.hard_edge_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.hard_edge_service_materials,"999.99")#</td>
                    <td align="right"><input name="hard_edge_times" type="text"   size="2" value="#Session.hard_edge_times#"/></td>
                    <td align="right">$#NumberFormat(Session.hard_edge_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.hard_edge_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.hard_edge_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.hard_edge_contract_price  =  #ROUND(Session.hard_edge_contract_price)#>
                    <td align="right">$#NumberFormat(Session.hard_edge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Bed Edge</td>
                    <td align="right"><input name="bed_edge_qty" type="text" id="bed_edge_qty"   size="6"   value="#Session.bed_edge_qty#"/></td>
                    <td nowrap="nowrap">$#Session.bed_edge_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.bed_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="bed_edge_rate" value="#Session.bed_edge_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="bed_edge_rate" type="text" id="bed_edge_rate"   size="5"  value="#Session.bed_edge_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">LF</td>
                    <td align="right">$#NumberFormat(Session.bed_edge_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.bed_edge_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.bed_edge_service_materials,"999.99")#</td>
                    <td align="right"><input name="bed_edge_times" type="text"   size="2" value="#Session.bed_edge_times#"/></td>
                    <td align="right">$#NumberFormat(Session.bed_edge_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.bed_edge_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.bed_edge_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.bed_edge_contract_price  =  #ROUND(Session.bed_edge_contract_price)#>
                    <td align="right">$#NumberFormat(Session.bed_edge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trim, O</td>
                    <td align="right"><input name="Trim_O_qty" type="text" id="Trim_O_qty"   size="6"   value="#Session.Trim_O_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trim_O_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trim_O_rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_O_rate" value="#Session.Trim_O_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trim_O_rate" type="text"   size="5"  value="#Session.Trim_O_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.TRIM_O_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.TRIM_O_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.TRIM_O_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trim_O_Times" type="text"   size="2" value="#Session.Trim_O_Times#"/></td>
                    <td align="right">$#NumberFormat(Session.TRIM_O_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.TRIM_O_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.TRIM_O_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.TRIM_O_contract_price  =  #ROUND(Session.TRIM_O_contract_price)#>
                    <td align="right">$#NumberFormat(Session.TRIM_O_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trim, S</td>
                    <td align="right"><input name="Trim_S_qty" type="text" id="Trim_S_qty"   size="6"   value="#Session.Trim_S_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trim_S_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trim_S_Rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_S_Rate" value="#Session.Trim_S_Rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trim_S_Rate" type="text" id="Trim_S_Rate"   size="5"  value="#Session.Trim_S_Rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.TRIM_S_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.TRIM_S_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.TRIM_S_service_materials,"999.99")#</td>
                    <td align="right"><input name="trim_S_times" type="text"   size="2" value="#Session.trim_S_times#"/></td>
                    <td align="right">$#NumberFormat(Session.TRIM_S_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.TRIM_S_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.TRIM_S_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.TRIM_S_contract_price  =  #ROUND(Session.TRIM_S_contract_price)#>
                    <td align="right">$#NumberFormat(Session.TRIM_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Spraying</td>
                    <td align="right"><input name="spraying_qty" type="text" id="spraying_qty"   size="6"   value="#Session.spraying_qty#"/></td>
                    <td nowrap="nowrap">$#Session.spraying_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.spraying_rate,"999,999")#</td>
                      <input type="hidden"  name="spraying_rate" value="#Session.spraying_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="spraying_rate" type="text" id="spraying_rate"   size="5"  value="#Session.spraying_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$#NumberFormat(Session.spraying_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.spraying_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Non-sel. Herbicide (oz)</td>
                    <!--- <td align="right"><input name="spraying_materials_qty" type="text" id="spraying_materials_qty"   size="6"    value="#Session.spraying_materials_qty#"/>
                    </td>--->
                    
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.spraying_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.SPRAYING_MATERIALS_QTY_ACTUAL")  AND   SESSION.spraying_materials_qty  NEQ SESSION.spraying_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="spraying_materials_qty" value="#Session.spraying_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="spraying_materials_qty" type="text" id="spraying_materials_qty"   size="6"  value="#TRIM(Session.spraying_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.spraying_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="spraying_materials_rate" value="#Session.spraying_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="spraying_materials_rate" type="text" id="spraying_rate"   size="5"  value="#Session.spraying_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.spraying_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.spraying_service_materials,"999.99")#</td>
                    <td align="right"><input name="spraying_times" type="text" class="form_buttons"    size="2"  value="#Session.spraying_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.spraying_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.spraying_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.spraying_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.spraying_contract_price  =  #ROUND(Session.spraying_contract_price)#>
                    <td align="right">$#NumberFormat(Session.spraying_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Weeding</td>
                    <td align="right"><input name="weeding_qty" type="text" id="weeding_qty"   size="6"   value="#Session.weeding_qty#"/></td>
                    <td nowrap="nowrap">$#Session.weeding_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.weeding_rate,"999,999")#</td>
                      <input type="hidden"  name="weeding_rate" value="#Session.weeding_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="weeding_rate" type="text" id="weeding_rate"   size="5"  value="#Session.weeding_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$#NumberFormat(Session.weeding_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.weeding_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.weeding_service_materials,"999.99")#</td>
                    <td align="right"><input name="weeding_times" type="text"   size="2" value="#Session.weeding_times#"/></td>
                    <td align="right">$#NumberFormat(Session.weeding_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.weeding_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.weeding_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.weeding_contract_price  =  #ROUND(Session.weeding_contract_price)#>
                    <td align="right">$#NumberFormat(Session.weeding_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Blowing</td>
                    <td align="right"><input name="blowing_qty" type="text" id="blowing_qty"   size="6"   value="#Session.blowing_qty#"/></td>
                    <td nowrap="nowrap">$#Session.blowing_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.blowing_rate,"999,999")#</td>
                      <input type="hidden"  name="blowing_rate" value="#Session.blowing_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="blowing_rate" type="text" id="blowing_rate"   size="5"  value="#Session.blowing_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$#NumberFormat(Session.blowing_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.blowing_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.blowing_service_materials,"999.99")#</td>
                    <td align="right"><input name="blowing_times" type="text"   size="2" value="#Session.blowing_times#"/></td>
                    <td align="right">$#NumberFormat(Session.blowing_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.blowing_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.blowing_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.blowing_contract_price  =  #ROUND(Session.blowing_contract_price)#>
                    <td align="right">$#NumberFormat(Session.blowing_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trash, S</td>
                    <td align="right"><input name="Trash_S_Qty" type="text" id="Trash_S_Qty"   size="6"   value="#Session.Trash_S_Qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trash_S_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trash_S_Rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_S_Rate" value="#Session.Trash_S_Rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trash_S_Rate" type="text" id="Trash_S_Rate"   size="5"  value="#Session.Trash_S_Rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.Trash_S_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.trash_s_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.Trash_S_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trash_S_Times" type="text"   size="2" value="#Session.Trash_S_Times#"/></td>
                    <td align="right">$#NumberFormat(Session.Trash_S_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trash_S_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Trash_S_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Trash_S_contract_price  =  #ROUND(Session.Trash_S_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Trash_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Travel Time</td>
                    <td align="right"><input name="traveltime_qty" type="text" id="traveltime_qty"   size="6"   value="#Session.traveltime_qty#"/></td>
                    <td nowrap="nowrap">$#Session.traveltime_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.traveltime_rate,"999,999")#</td>
                      <input type="hidden"  name="traveltime_rate" value="#Session.traveltime_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="traveltime_rate" type="text" id="traveltime_rate"   size="5"  value="#Session.traveltime_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.traveltime_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.traveltime_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.traveltime_service_materials,"999.99")#</td>
                    <td align="right"><input name="traveltime_times" type="text"   size="2" value="#Session.traveltime_times#"/></td>
                    <td align="right">$#NumberFormat(Session.traveltime_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.traveltime_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.traveltime_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---<input name="travel_time_gm" type="text"   size="3" value="#SESSION.travel_time_gm#"/>--->#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.traveltime_contract_price  =  #ROUND(Session.traveltime_contract_price)#>
                    <td align="right">$#NumberFormat(Session.traveltime_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trash, Off</td>
                    <td align="right"><input name="Trash_O_Qty" type="text" id="Trash_O_Qty"   size="6"   value="#Session.Trash_O_Qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trash_O_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trash_O_rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_O_rate" value="#Session.Trash_O_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trash_O_rate" type="text" id="Trash_O_rate"   size="5"  value="#Session.Trash_O_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.Trash_O_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trash_O_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.Trash_O_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trash_O_Times" type="text"   size="2" value="#Session.Trash_O_Times#"/></td>
                    <td align="right">$#NumberFormat(Session.Trash_O_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trash_O_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Trash_O_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Trash_O_contract_price  =  #ROUND(Session.Trash_O_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Trash_O_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Leaf Rem</td>
                    <td align="right"><input name="leafrem_qty" type="text" id="leafrem_qty"   size="6"   value="#Session.leafrem_qty#"/></td>
                    <td nowrap="nowrap">$#Session.leafrem_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.leafrem_rate,"999,999")#</td>
                      <input type="hidden"  name="leafrem_rate" value="#Session.leafrem_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="leafrem_rate" type="text" id="leafrem_rate"   size="5"  value="#Session.leafrem_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.leafrem_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.leafrem_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.leafrem_service_materials,"999.99")#</td>
                    <td align="right"><input name="leafrem_times" type="text"   size="2" value="#Session.leafrem_times#"/></td>
                    <td align="right">$#NumberFormat(Session.leafrem_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.leafrem_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.leafrem_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.leafrem_contract_price  =  #ROUND(Session.leafrem_contract_price)#>
                    <td align="right">$#NumberFormat(Session.leafrem_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Cleanup</td>
                    <td align="right"><input name="cleanup_qty" type="text" id="cleanup_qty"   size="6"   value="#Session.cleanup_qty#"/></td>
                    <td nowrap="nowrap">$#Session.cleanup_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.cleanup_rate,"999,999")#</td>
                      <input type="hidden"  name="cleanup_rate" value="#Session.cleanup_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="cleanup_rate" type="text" id="cleanup_rate"   size="5"  value="#Session.cleanup_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$#NumberFormat(Session.cleanup_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.cleanup_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$#NumberFormat(Session.cleanup_service_materials,"999.99")#</td>
                    <td align="right"><input name="cleanup_times" type="text"   size="2" value="#Session.cleanup_times#"/></td>
                    <td align="right">$#NumberFormat(Session.cleanup_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.cleanup_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.cleanup_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.cleanup_contract_price  =  #ROUND(Session.cleanup_contract_price)#>
                    <td align="right">$#NumberFormat(Session.cleanup_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Pre (G)</td>
                    <td align="right"><input name="turf_preg_qty" type="text" id="turf_preg_qty"   size="6"    value="#Session.turf_preg_qty#"/></td>
                    <td nowrap="nowrap">$#Session.turf_preg_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_preg_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_preg_rate" value="#Session.turf_preg_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_preg_rate" type="text" id="turf_preg_rate"   size="5"  value="#Session.turf_preg_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.turf_preg_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_preg_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Granular pre-em w/ 16-4-8 Fert (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_preg_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_preg_materials_qty_ACTUAL")  AND   SESSION.turf_preg_materials_qty  NEQ SESSION.turf_preg_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="turf_preg_materials_qty" value="#Session.turf_preg_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_preg_materials_qty" type="text" id="turf_preg_materials_qty"   size="6"  value="#TRIM(Session.turf_preg_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_preg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_preg_materials_rate" value="#Session.turf_preg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_preg_materials_rate" type="text" id="turf_preg_rate"   size="5"  value="#Session.turf_preg_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.turf_preg_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_preg_service_materials,"999.99")#</td>
                    <td align="right"><input name="turf_preg_times" type="text" class="form_buttons"    size="2"  value="#Session.turf_preg_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.turf_preg_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_preg_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.turf_preg_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.turf_preg_contract_price  =  #ROUND(Session.turf_preg_contract_price)#>
                    <td align="right">$#NumberFormat(Session.turf_preg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Pre (L)</td>
                    <td align="right"><input name="turf_prel_qty" type="text" id="turf_prel_qty"   size="6"    value="#Session.turf_prel_qty#"/></td>
                    <td nowrap="nowrap">$#Session.turf_prel_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_prel_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_prel_rate" value="#Session.turf_prel_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_prel_rate" type="text" id="turf_prel_rate"   size="5"  value="#Session.turf_prel_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.turf_prel_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_prel_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Barricade liquid pre-em (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_prel_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_prel_materials_qty_ACTUAL")  AND   SESSION.turf_prel_materials_qty  NEQ SESSION.turf_prel_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="turf_prel_materials_qty" value="#Session.turf_prel_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_prel_materials_qty" type="text" id="turf_prel_materials_qty"   size="6"  value="#TRIM(Session.turf_prel_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_prel_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_prel_materials_rate" value="#Session.turf_prel_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_prel_materials_rate" type="text" id="turf_prel_rate"   size="5"  value="#Session.turf_prel_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.turf_prel_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_prel_service_materials,"999.99")#</td>
                    <td align="right"><input name="turf_prel_times" type="text" class="form_buttons"    size="2"  value="#Session.turf_prel_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.turf_prel_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_prel_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.turf_prel_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.turf_prel_contract_price  =  #ROUND(Session.turf_prel_contract_price)#>
                    <td align="right">$#NumberFormat(Session.turf_prel_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Post</td>
                    <td align="right"><input name="turf_post_qty" type="text" id="turf_post_qty"   size="6"    value="#Session.turf_post_qty#"/></td>
                    <td nowrap="nowrap">$#Session.turf_post_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_post_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_post_rate" value="#Session.turf_post_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_post_rate" type="text" id="turf_post_rate"   size="5"  value="#Session.turf_post_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.turf_post_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_post_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Trimec Selective Herbicide (oz)</td>
                    <!--- <td align="right"><input name="turf_post_materials_qty" type="text" id="turf_post_materials_qty"   size="6"    value="#Session.turf_post_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_post_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_post_materials_qty_ACTUAL")  AND   SESSION.turf_post_materials_qty  NEQ SESSION.turf_post_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="turf_post_materials_qty" value="#Session.turf_post_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_post_materials_qty" type="text" id="turf_post_materials_qty"   size="6"  value="#TRIM(Session.turf_post_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_post_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_post_materials_rate" value="#Session.turf_post_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_post_materials_rate" type="text" id="turf_post_rate"   size="5"  value="#Session.turf_post_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.turf_post_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_post_service_materials,"999.99")#</td>
                    <td align="right"><input name="turf_post_times" type="text" class="form_buttons"    size="2"  value="#Session.turf_post_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.turf_post_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_post_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.turf_post_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.turf_post_contract_price  =  #ROUND(Session.turf_post_contract_price)#>
                    <td align="right">$#NumberFormat(Session.turf_post_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Fert</td>
                    <td align="right"><input name="turf_fert_qty" type="text" id="turf_fert_qty"   size="6"    value="#Session.turf_fert_qty#"/></td>
                    <td nowrap="nowrap">$#Session.turf_fert_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_fert_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_fert_rate" value="#Session.turf_fert_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_fert_rate" type="text" id="turf_fert_rate"   size="5"  value="#Session.turf_fert_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.turf_fert_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_fert_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">10-10-1 Starter Fert</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_fert_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_fert_materials_qty_ACTUAL")  AND   SESSION.turf_fert_materials_qty  NEQ SESSION.turf_fert_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="turf_fert_materials_qty" value="#Session.turf_fert_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_fert_materials_qty" type="text" id="turf_fert_materials_qty"   size="6"  value="#TRIM(Session.turf_fert_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_fert_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_fert_materials_rate" value="#Session.turf_fert_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_fert_materials_rate" type="text" id="turf_fert_rate"   size="5"  value="#Session.turf_fert_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.turf_fert_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_fert_service_materials,"999.99")#</td>
                    <td align="right"><input name="turf_fert_times" type="text" class="form_buttons"    size="2"  value="#Session.turf_fert_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.turf_fert_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_fert_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.turf_fert_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.turf_fert_contract_price  =  #ROUND(Session.turf_fert_contract_price)#>
                    <td align="right">$#NumberFormat(Session.turf_fert_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Lime</td>
                    <td align="right"><input name="turf_lime_qty" type="text" id="turf_lime_qty"   size="6"    value="#Session.turf_lime_qty#"/></td>
                    <td nowrap="nowrap">$#Session.turf_lime_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_lime_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_lime_rate" value="#Session.turf_lime_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_lime_rate" type="text" id="turf_lime_rate"   size="5"  value="#Session.turf_lime_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.turf_lime_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_lime_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Pelletized Lime (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_lime_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_lime_materials_qty_ACTUAL")  AND   SESSION.turf_lime_materials_qty  NEQ SESSION.turf_lime_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="turf_lime_materials_qty" value="#Session.turf_lime_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_lime_materials_qty" type="text" id="turf_lime_materials_qty"   size="6"  value="#TRIM(Session.turf_lime_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.turf_lime_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_lime_materials_rate" value="#Session.turf_lime_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_lime_materials_rate" type="text" id="turf_lime_rate"   size="5"  value="#Session.turf_lime_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.turf_lime_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_lime_service_materials,"999.99")#</td>
                    <td align="right"><input name="turf_lime_times" type="text" class="form_buttons"    size="2"  value="#Session.turf_lime_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.turf_lime_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.turf_lime_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.turf_lime_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.turf_lime_contract_price  =  #ROUND(Session.turf_lime_contract_price)#>
                    <td align="right">$#NumberFormat(Session.turf_lime_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Aer (H)</td>
                    <td align="right"><input name="Turf_Aer_H_qty" type="text" id="Turf_Aer_H_qty"   size="6"    value="#Session.Turf_Aer_H_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Aer_H_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Aer_H_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Aer_H_rate" value="#Session.Turf_Aer_H_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Aer_H_rate" type="text" id="Turf_Aer_H_rate"   size="5"  value="#Session.Turf_Aer_H_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Aer_H_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Aer_H_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Aer_H_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Aer_H_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Aer_H_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Aer_H_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Aer_H_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Aer_H_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Aer_H_contract_price  =  #ROUND(Session.Turf_Aer_H_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Aer_H_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Aer (T)</td>
                    <td align="right"><input name="Turf_Aer_T_qty" type="text" id="Turf_Aer_T_qty"   size="6"    value="#Session.Turf_Aer_T_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Aer_T_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Aer_T_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Aer_T_rate" value="#Session.Turf_Aer_T_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Aer_T_rate" type="text" id="Turf_Aer_T_rate"   size="5"  value="#Session.Turf_Aer_T_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Aer_T_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Aer_T_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Aer_T_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Aer_T_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Aer_T_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Aer_T_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Aer_T_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Aer_T_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Aer_T_contract_price  =  #ROUND(Session.Turf_Aer_T_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Aer_T_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf  Seed</td>
                    <td align="right"><input name="Turf_Seed_qty" type="text" id="Turf_Seed_qty"   size="6"    value="#Session.Turf_Seed_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Seed_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Seed_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Seed_rate" value="#Session.Turf_Seed_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Seed_rate" type="text" id="Turf_Seed_rate"   size="5"  value="#Session.Turf_Seed_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Seed_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Seed_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Fescue Seed (lbs)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Seed_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_Seed_materials_qty_ACTUAL")  AND   SESSION.turf_Seed_materials_qty  NEQ SESSION.turf_Seed_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Turf_Seed_materials_qty" value="#Session.Turf_Seed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Seed_materials_qty" type="text" id="Turf_Seed_materials_qty"   size="6"  value="#TRIM(Session.Turf_Seed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Seed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Seed_materials_rate" value="#Session.Turf_Seed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Seed_materials_rate" type="text" id="Turf_Seed_rate"   size="5"  value="#Session.Turf_Seed_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Turf_Seed_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Seed_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Seed_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Seed_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Seed_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Seed_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Seed_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Seed_contract_price  =  #ROUND(Session.Turf_Seed_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Seed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Nutsedge</td>
                    <td align="right"><input name="Turf_Nutsedge_qty" type="text" id="Turf_Nutsedge_qty"   size="6"    value="#Session.Turf_Nutsedge_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Nutsedge_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Nutsedge_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Nutsedge_rate" value="#Session.Turf_Nutsedge_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_rate" type="text" id="Turf_Nutsedge_rate"   size="5"  value="#Session.Turf_Nutsedge_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Nutsedge_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Halosulfuron</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Nutsedge_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_Nutsedge_materials_qty_ACTUAL")  AND   SESSION.turf_Nutsedge_materials_qty  NEQ SESSION.turf_Nutsedge_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Turf_Nutsedge_materials_qty" value="#Session.Turf_Nutsedge_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_materials_qty" type="text" id="Turf_Nutsedge_materials_qty"   size="6"  value="#TRIM(Session.Turf_Nutsedge_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Nutsedge_MATERIALS_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Nutsedge_MATERIALS_rate" value="#Session.Turf_Nutsedge_MATERIALS_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_MATERIALS_rate" type="text" id="Turf_Nutsedge_rate"   size="5"  value="#Session.Turf_Nutsedge_MATERIALS_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Nutsedge_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Nutsedge_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Nutsedge_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Nutsedge_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Nutsedge_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Nutsedge_contract_price  =  #ROUND(Session.Turf_Nutsedge_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Nutsedge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Fungicide</td>
                    <td align="right"><input name="Turf_Fungicide_qty" type="text" id="Turf_Fungicide_qty"   size="6"    value="#Session.Turf_Fungicide_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Fungicide_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Fungicide_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Fungicide_rate" value="#Session.Turf_Fungicide_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_rate" type="text" id="Turf_Fungicide_rate"   size="5"  value="#Session.Turf_Fungicide_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Fungicide_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Fungicide_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Various</td>
                    <!---   <td align="right"><input name="Turf_Fungicide_materials_qty" type="text" id="Turf_Fungicide_materials_qty"   size="6"    value="#TRIM(Session.Turf_Fungicide_materials_qty)#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Fungicide_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_Fungicide_materials_qty_ACTUAL")  AND   SESSION.turf_Fungicide_materials_qty  NEQ SESSION.turf_Fungicide_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Turf_Fungicide_materials_qty" value="#Session.Turf_Fungicide_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_materials_qty" type="text" id="Turf_Fungicide_materials_qty"   size="6"  value="#TRIM(Session.Turf_Fungicide_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Fungicide_MATERIALS_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Fungicide_MATERIALS_rate" value="#Session.Turf_Fungicide_MATERIALS_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_MATERIALS_rate" type="text" id="Turf_Fungicide_rate"   size="5"  value="#Session.Turf_Fungicide_MATERIALS_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Turf_Fungicide_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Fungicide_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Fungicide_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Fungicide_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Fungicide_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Fungicide_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Fungicide_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Fungicide_contract_price  =  #ROUND(Session.Turf_Fungicide_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Fungicide_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Turf Insecticide</td>
                    <td align="right"><input name="Turf_Insecticide_qty" type="text" id="Turf_Insecticide_qty"   size="6"    value="#Session.Turf_Insecticide_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Turf_Insecticide_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Insecticide_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Insecticide_rate" value="#Session.Turf_Insecticide_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_rate" type="text" id="Turf_Insecticide_rate"   size="5"  value="#Session.Turf_Insecticide_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Turf_Insecticide_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Insecticide_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Bifenthrin</td>
                    <!---      <td align="right"><input name="Turf_Insecticide_materials_qty" type="text" id="Turf_Insecticide_materials_qty"   size="6"    value="#Session.Turf_Insecticide_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Insecticide_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.turf_Insecticide_materials_qty_ACTUAL")  AND   SESSION.turf_Insecticide_materials_qty  NEQ SESSION.turf_Insecticide_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Turf_Insecticide_materials_qty" value="#Session.Turf_Insecticide_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_materials_qty" type="text" id="Turf_Insecticide_materials_qty"   size="6"  value="#TRIM(Session.Turf_Insecticide_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Turf_Insecticide_MATERIALS_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Insecticide_MATERIALS_rate" value="#Session.Turf_Insecticide_MATERIALS_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_MATERIALS_rate" type="text" id="Turf_Insecticide_rate"   size="5"  value="#Session.Turf_Insecticide_MATERIALS_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Turf_Insecticide_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Insecticide_service_materials,"999.99")#</td>
                    <td align="right"><input name="Turf_Insecticide_times" type="text" class="form_buttons"    size="2"  value="#Session.Turf_Insecticide_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Turf_Insecticide_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Turf_Insecticide_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Turf_Insecticide_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Turf_Insecticide_contract_price  =  #ROUND(Session.Turf_Insecticide_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Turf_Insecticide_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Pruning, T/P</td>
                    <td align="right"><input name="Pruning_TP_qty" type="text" id="Pruning_TP_qty"   size="6"    value="#Session.Pruning_TP_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Pruning_TP_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pruning_TP_rate,"999,999")#</td>
                      <input type="hidden"  name="Pruning_TP_rate" value="#Session.Pruning_TP_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pruning_TP_rate" type="text" id="Pruning_TP_rate"   size="5"  value="#Session.Pruning_TP_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Pruning_TP_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pruning_TP_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pruning_TP_service_materials,"999.99")#</td>
                    <td align="right"><input name="Pruning_TP_times" type="text" class="form_buttons"    size="2"  value="#Session.Pruning_TP_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Pruning_TP_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pruning_TP_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Pruning_TP_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Pruning_TP_contract_price  =  #ROUND(Session.Pruning_TP_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Pruning_TP_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Pruning, S</td>
                    <td align="right"><input name="Pruning_S_qty" type="text" id="Pruning_S_qty"   size="6"    value="#Session.Pruning_S_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Pruning_S_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pruning_S_rate,"999,999")#</td>
                      <input type="hidden"  name="Pruning_S_rate" value="#Session.Pruning_S_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pruning_S_rate" type="text" id="Pruning_S_rate"   size="5"  value="#Session.Pruning_S_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Pruning_S_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pruning_S_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pruning_S_service_materials,"999.99")#</td>
                    <td align="right"><input name="Pruning_S_times" type="text" class="form_buttons"    size="2"  value="#Session.Pruning_S_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Pruning_S_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pruning_S_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Pruning_S_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Pruning_S_contract_price  =  #ROUND(Session.Pruning_S_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Pruning_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>T&amp;S, Fert</td>
                    <td align="right"><input name="TS_Fert_qty" type="text" id="TS_Fert_qty"   size="6"    value="#Session.TS_Fert_qty#"/></td>
                    <td nowrap="nowrap">$#Session.TS_Fert_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Fert_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_Fert_rate" value="#Session.TS_Fert_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Fert_rate" type="text" id="TS_Fert_rate"   size="5"  value="#Session.TS_Fert_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.TS_Fert_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_Fert_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Fertilizer 14-14-14  (lbs)</td>
                    <!--- <td align="right"><input name="TS_Fert_materials_qty" type="text" id="TS_Fert_materials_qty"   size="6"    value="#Session.TS_Fert_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Fert_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.TS_Fert_materials_qty_ACTUAL")  AND   SESSION.TS_Fert_materials_qty  NEQ SESSION.TS_Fert_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="TS_Fert_materials_qty" value="#Session.TS_Fert_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Fert_materials_qty" type="text" id="TS_Fert_materials_qty"   size="6"  value="#TRIM(Session.TS_Fert_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Fert_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_Fert_materials_rate" value="#Session.TS_Fert_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Fert_materials_rate" type="text" id="TS_Fert_rate"   size="5"  value="#Session.TS_Fert_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.TS_Fert_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_Fert_service_materials,"999.99")#</td>
                    <td align="right"><input name="TS_Fert_times" type="text" class="form_buttons"    size="2"  value="#Session.TS_Fert_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.TS_Fert_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_Fert_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.TS_Fert_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.TS_Fert_contract_price  =  #ROUND(Session.TS_Fert_contract_price)#>
                    <td align="right">$#NumberFormat(Session.TS_Fert_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>T&amp;S, Insect</td>
                    <td align="right"><input name="TS_Insect_qty" type="text" id="TS_Insect_qty"   size="6"    value="#Session.TS_Insect_qty#"/></td>
                    <td nowrap="nowrap">$#Session.TS_Insect_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Insect_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_Insect_rate" value="#Session.TS_Insect_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Insect_rate" type="text" id="TS_Insect_rate"   size="5"  value="#Session.TS_Insect_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.TS_Insect_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_Insect_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Bifenthrin Tree &amp; Shrub Insecticide (oz.)</td>
                    <!---<td align="right"><input name="TS_Insect_materials_qty" type="text" id="TS_Insect_materials_qty"   size="6"    value="#Session.TS_Insect_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Insect_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.TS_Insect_materials_qty_ACTUAL")  AND   SESSION.TS_Insect_materials_qty  NEQ SESSION.TS_Insect_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="TS_Insect_materials_qty" value="#Session.TS_Insect_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Insect_materials_qty" type="text" id="TS_Insect_materials_qty"   size="6"  value="#TRIM(Session.TS_Insect_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_Insect_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_Insect_materials_rate" value="#Session.TS_Insect_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Insect_materials_rate" type="text" id="TS_Insect_rate"   size="5"  value="#Session.TS_Insect_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.TS_Insect_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_Insect_service_materials,"999.99")#</td>
                    <td align="right"><input name="TS_Insect_times" type="text" class="form_buttons"    size="2"  value="#Session.TS_Insect_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.TS_Insect_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_Insect_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.TS_Insect_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.TS_Insect_contract_price  =  #ROUND(Session.TS_Insect_contract_price)#>
                    <td align="right">$#NumberFormat(Session.TS_Insect_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>T&amp;S, Hort Oil</td>
                    <td align="right"><input name="TS_hort_oil_qty" type="text" id="TS_hort_oil_qty"   size="6"    value="#Session.TS_hort_oil_qty#"/></td>
                    <td nowrap="nowrap">$#Session.TS_hort_oil_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_hort_oil_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_hort_oil_rate" value="#Session.TS_hort_oil_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_hort_oil_rate" type="text" id="TS_hort_oil_rate"   size="5"  value="#Session.TS_hort_oil_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.TS_hort_oil_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_hort_oil_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Hort/Dormant Oil </td>
                    <!---   <td align="right"><input name="TS_hort_oil_materials_qty" type="text" id="TS_hort_oil_materials_qty"   size="6"    value="#Session.TS_hort_oil_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_hort_oil_materials_qty,"999,999.99")#
                        <cfif  IsDefined("SESSION.TS_hort_oil_materials_qty_ACTUAL")  AND   SESSION.TS_hort_oil_materials_qty  NEQ SESSION.TS_hort_oil_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="TS_hort_oil_materials_qty" value="#Session.TS_hort_oil_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_hort_oil_materials_qty" type="text" id="TS_hort_oil_materials_qty"   size="6"  value="#TRIM(Session.TS_hort_oil_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.TS_hort_oil_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_hort_oil_materials_rate" value="#Session.TS_hort_oil_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_hort_oil_materials_rate" type="text" id="TS_hort_oil_rate"   size="5"  value="#Session.TS_hort_oil_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.TS_hort_oil_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_hort_oil_service_materials,"999.99")#</td>
                    <td align="right"><input name="TS_hort_oil_times" type="text" class="form_buttons"    size="2"  value="#Session.TS_hort_oil_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.TS_hort_oil_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.TS_hort_oil_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.TS_hort_oil_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.TS_hort_oil_contract_price  =  #ROUND(Session.TS_hort_oil_contract_price)#>
                    <td align="right">$#NumberFormat(Session.TS_hort_oil_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, Pre</td>
                    <td align="right"><input name="Mulch_pre_qty" type="text" id="Mulch_pre_qty"   size="6"    value="#Session.Mulch_pre_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Mulch_pre_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_pre_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_pre_rate" value="#Session.Mulch_pre_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_pre_rate" type="text" id="Mulch_pre_rate"   size="5"  value="#Session.Mulch_pre_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Mulch_pre_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_pre_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Pre-em 0-0-7 w/ 86% Pendemethaline (lbs) </td>
                    <!---   <td align="right"><input name="Mulch_pre_materials_qty" type="text" id="Mulch_pre_materials_qty"   size="6"    value="#Session.Mulch_pre_materials_qty#"/>
                    </td>--->
                    
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_pre_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.Mulch_pre_materials_qty_ACTUAL")  AND   SESSION.Mulch_pre_materials_qty  NEQ SESSION.Mulch_pre_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Mulch_pre_materials_qty" value="#Session.Mulch_pre_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_pre_materials_qty" type="text" id="Mulch_pre_materials_qty"   size="6"  value="#TRIM(Session.Mulch_pre_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_pre_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_pre_materials_rate" value="#Session.Mulch_pre_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_pre_materials_rate" type="text" id="Mulch_pre_rate"   size="5"  value="#Session.Mulch_pre_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Mulch_pre_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_pre_service_materials,"999.99")#</td>
                    <td align="right"><input name="Mulch_pre_times" type="text" class="form_buttons"    size="2"  value="#Session.Mulch_pre_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Mulch_pre_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_pre_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Mulch_pre_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Mulch_pre_contract_price  =  #ROUND(Session.Mulch_pre_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Mulch_pre_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, Edging</td>
                    <td align="right"><input name="Mulch_edging_qty" type="text" id="Mulch_edging_qty"   size="6"    value="#Session.Mulch_edging_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Mulch_edging_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_edging_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_edging_rate" value="#Session.Mulch_edging_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_edging_rate" type="text" id="Mulch_edging_rate"   size="5"  value="#Session.Mulch_edging_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">LF</td>
                    <td align="right">$ #NumberFormat(Session.Mulch_edging_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_edging_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_edging_service_materials,"999.99")#</td>
                    <td align="right"><input name="Mulch_edging_times" type="text" class="form_buttons"    size="2"  value="#Session.Mulch_edging_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Mulch_edging_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_edging_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Mulch_edging_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Mulch_edging_contract_price  =  #ROUND(Session.Mulch_edging_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Mulch_edging_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, S (dyed)</td>
                    <td align="right"><input name="mulch_s_dyed_qty" type="text" id="mulch_s_dyed_qty"   size="6"    value="#Session.mulch_s_dyed_qty#"/></td>
                    <td nowrap="nowrap">$#Session.mulch_s_dyed_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_s_dyed_rate,"999,999")#</td>
                      <input type="hidden"  name="mulch_s_dyed_rate" value="#Session.mulch_s_dyed_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_rate" type="text" id="mulch_s_dyed_rate"   size="5"  value="#Session.mulch_s_dyed_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.mulch_s_dyed_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.mulch_s_dyed_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Dyed Mulch</td>
                    <!---   <td align="right"><input name="mulch_s_dyed_materials_qty" type="text" id="mulch_s_dyed_materials_qty"   size="6"    value="#Session.mulch_s_dyed_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_s_dyed_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.mulch_s_dyed_materials_qty_ACTUAL")  AND   SESSION.mulch_s_dyed_materials_qty  NEQ SESSION.mulch_s_dyed_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="mulch_s_dyed_materials_qty" value="#Session.mulch_s_dyed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_materials_qty" type="text" id="mulch_s_dyed_materials_qty"   size="6"  value="#TRIM(Session.mulch_s_dyed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_s_dyed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="mulch_s_dyed_materials_rate" value="#Session.mulch_s_dyed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_materials_rate" type="text" id="mulch_s_dyed_rate"   size="5"  value="#Session.mulch_s_dyed_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.mulch_s_dyed_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.mulch_s_dyed_service_materials,"999.99")#</td>
                    <td align="right"><input name="mulch_s_dyed_times" type="text" class="form_buttons"    size="2"  value="#Session.mulch_s_dyed_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.mulch_s_dyed_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.mulch_s_dyed_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.mulch_s_dyed_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.mulch_s_dyed_contract_price  =  #ROUND(Session.mulch_s_dyed_contract_price)#>
                    <td align="right">$#NumberFormat(Session.mulch_s_dyed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, F (dyed)</td>
                    <td align="right"><input name="mulch_f_dyed_qty" type="text" id="mulch_f_dyed_qty"   size="6"    value="#Session.mulch_f_dyed_qty#"/></td>
                    <td nowrap="nowrap">$#Session.mulch_f_dyed_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_f_dyed_rate,"999,999")#</td>
                      <input type="hidden"  name="mulch_f_dyed_rate" value="#Session.mulch_f_dyed_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_rate" type="text" id="mulch_f_dyed_rate"   size="5"  value="#Session.mulch_f_dyed_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.mulch_f_dyed_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.mulch_f_dyed_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Dyed Mulch</td>
                    <!---  <td align="right"><input name="mulch_f_dyed_materials_qty" type="text" id="mulch_f_dyed_materials_qty"   size="6"    value="#Session.mulch_f_dyed_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_f_dyed_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.mulch_f_dyed_materials_qty_ACTUAL")  AND   SESSION.mulch_f_dyed_materials_qty  NEQ SESSION.mulch_f_dyed_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="mulch_f_dyed_materials_qty" value="#Session.mulch_f_dyed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_materials_qty" type="text" id="mulch_f_dyed_materials_qty"   size="6"  value="#TRIM(Session.mulch_f_dyed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.mulch_f_dyed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="mulch_f_dyed_materials_rate" value="#Session.mulch_f_dyed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_materials_rate" type="text" id="mulch_f_dyed_rate"   size="5"  value="#Session.mulch_f_dyed_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.mulch_f_dyed_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.mulch_f_dyed_service_materials,"999.99")#</td>
                    <td align="right"><input name="mulch_f_dyed_times" type="text" class="form_buttons"    size="2"  value="#Session.mulch_f_dyed_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.mulch_f_dyed_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.mulch_f_dyed_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.mulch_f_dyed_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.mulch_f_dyed_contract_price  =  #ROUND(Session.mulch_f_dyed_contract_price)#>
                    <td align="right">$#NumberFormat(Session.mulch_f_dyed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, S (reg)</td>
                    <td align="right"><input name="Mulch_S_Reg_qty" type="text" id="Mulch_S_Reg_qty"   size="6"    value="#Session.Mulch_S_Reg_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Mulch_S_Reg_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_S_Reg_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_S_Reg_rate" value="#Session.Mulch_S_Reg_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_rate" type="text" id="Mulch_S_Reg_rate"   size="5"  value="#Session.Mulch_S_Reg_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_S_Reg_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Non-Dyed Mulch</td>
                    <!---   <td align="right"><input name="Mulch_S_Reg_materials_qty" type="text" id="Mulch_S_Reg_materials_qty"   size="6"    value="#Session.Mulch_S_Reg_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_S_Reg_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.mulch_s_reg_materials_qty_ACTUAL")  AND   SESSION.mulch_s_reg_materials_qty  NEQ SESSION.mulch_s_reg_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Mulch_S_Reg_materials_qty" value="#Session.Mulch_S_Reg_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_materials_qty" type="text" id="Mulch_S_Reg_materials_qty"   size="6"  value="#TRIM(Session.Mulch_S_Reg_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_S_Reg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_S_Reg_materials_rate" value="#Session.Mulch_S_Reg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_materials_rate" type="text" id="Mulch_S_Reg_rate"   size="5"  value="#Session.Mulch_S_Reg_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_S_Reg_service_materials,"999.99")#</td>
                    <td align="right"><input name="Mulch_S_Reg_times" type="text" class="form_buttons"    size="2"  value="#Session.Mulch_S_Reg_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_S_Reg_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Mulch_S_Reg_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Mulch_S_Reg_contract_price  =  #ROUND(Session.Mulch_S_Reg_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Mulch_S_Reg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Mulch, F&nbsp;(reg)</td>
                    <td align="right"><input name="Mulch_F_Reg_qty" type="text" id="Mulch_F_Reg_qty"   size="6"    value="#Session.Mulch_F_Reg_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Mulch_F_Reg_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_F_Reg_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_F_Reg_rate" value="#Session.Mulch_F_Reg_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_rate" type="text" id="Mulch_F_Reg_rate"   size="5"  value="#Session.Mulch_F_Reg_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_F_Reg_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Non-Dyed Mulch</td>
                    <!---       <td align="right"><input name="Mulch_F_Reg_materials_qty" type="text" id="Mulch_F_Reg_materials_qty"   size="6"    value="#Session.Mulch_F_Reg_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_F_Reg_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.mulch_f_reg_materials_qty_ACTUAL")  AND   SESSION.mulch_f_reg_materials_qty  NEQ SESSION.mulch_f_reg_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Mulch_F_Reg_materials_qty" value="#Session.Mulch_F_Reg_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_materials_qty" type="text" id="Mulch_F_Reg_materials_qty"   size="6"  value="#TRIM(Session.Mulch_F_Reg_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Mulch_F_Reg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_F_Reg_materials_rate" value="#Session.Mulch_F_Reg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_materials_rate" type="text" id="Mulch_F_Reg_rate"   size="5"  value="#Session.Mulch_F_Reg_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_F_Reg_service_materials,"999.99")#</td>
                    <td align="right"><input name="Mulch_F_Reg_times" type="text" class="form_buttons"    size="2"  value="#Session.Mulch_F_Reg_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Mulch_F_Reg_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Mulch_F_Reg_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Mulch_F_Reg_contract_price  =  #ROUND(Session.Mulch_F_Reg_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Mulch_F_Reg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Playground Mulch</td>
                    <td align="right"><input name="Playground_mulch_qty" type="text" id="Playground_mulch_qty"   size="6"    value="#Session.Playground_mulch_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Playground_mulch_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Playground_mulch_rate,"999,999")#</td>
                      <input type="hidden"  name="Playground_mulch_rate" value="#Session.Playground_mulch_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Playground_mulch_rate" type="text" id="Playground_mulch_rate"   size="5"  value="#Session.Playground_mulch_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Playground_mulch_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Playground_mulch_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Dyed Mulch</td>
                    <!--- <td align="right"><input name="Playground_mulch_materials_qty" type="text" id="Playground_mulch_materials_qty"   size="6"    value="#Session.Playground_mulch_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Playground_mulch_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.Playground_mulch_materials_qty_ACTUAL")  AND   SESSION.Playground_mulch_materials_qty  NEQ SESSION.Playground_mulch_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Playground_mulch_materials_qty" value="#Session.Playground_mulch_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Playground_mulch_materials_qty" type="text" id="Playground_mulch_materials_qty"   size="6"  value="#TRIM(Session.Playground_mulch_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Playground_mulch_MATERIALS_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Playground_mulch_MATERIALS_rate" value="#Session.Playground_mulch_MATERIALS_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Playground_mulch_MATERIALS_rate" type="text" id="Playground_mulch_rate"   size="5"  value="#Session.Playground_mulch_MATERIALS_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Playground_mulch_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Playground_mulch_service_materials,"999.99")#</td>
                    <td align="right"><input name="Playground_mulch_times" type="text" class="form_buttons"    size="2"  value="#Session.Playground_mulch_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Playground_mulch_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Playground_mulch_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Playground_mulch_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Playground_mulch_contract_price  =  #ROUND(Session.Playground_mulch_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Playground_mulch_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Pine Tags</td>
                    <td align="right"><input name="Pine_Tags_qty" type="text" id="Pine_Tags_qty"   size="6"    value="#Session.Pine_Tags_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Pine_Tags_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pine_Tags_rate,"999,999")#</td>
                      <input type="hidden"  name="Pine_Tags_rate" value="#Session.Pine_Tags_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pine_Tags_rate" type="text" id="Pine_Tags_rate"   size="5"  value="#Session.Pine_Tags_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Pine_Tags_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pine_Tags_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Pine Tags (bales)</td>
                    <!--- <td align="right"><input name="Pine_Tags_materials_qty" type="text" id="Pine_Tags_materials_qty"   size="6"    value="#Session.Pine_Tags_materials_qty#"/>
                    </td>--->
                    
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pine_Tags_materials_qty,"999,999.9")#
                        <cfif  IsDefined("SESSION.Pine_Tags_materials_qty_ACTUAL")  AND   SESSION.Pine_Tags_materials_qty  NEQ SESSION.Pine_Tags_materials_qty_actual>
                          *
                        </cfif></td>
                      <input type="hidden"  name="Pine_Tags_materials_qty" value="#Session.Pine_Tags_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pine_Tags_materials_qty" type="text" id="Pine_Tags_materials_qty"   size="6"  value="#TRIM(Session.Pine_Tags_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pine_Tags_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Pine_Tags_materials_rate" value="#Session.Pine_Tags_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pine_Tags_materials_rate" type="text" id="Pine_Tags_rate"   size="5"  value="#Session.Pine_Tags_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Pine_Tags_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pine_Tags_service_materials,"999.99")#</td>
                    <td align="right"><input name="Pine_Tags_times" type="text" class="form_buttons"    size="2"  value="#Session.Pine_Tags_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Pine_Tags_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pine_Tags_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Pine_Tags_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Pine_Tags_contract_price  =  #ROUND(Session.Pine_Tags_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Pine_Tags_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Annuals, S</td>
                    <td align="right"><input name="Annuals_S_qty" type="text" id="Annuals_S_qty"   size="6"    value="#Session.Annuals_S_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Annuals_S_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_S_rate,"999,999")#</td>
                      <input type="hidden"  name="Annuals_S_rate" value="#Session.Annuals_S_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_S_rate" type="text" id="Annuals_S_rate"   size="5"  value="#Session.Annuals_S_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">Pots</td>
                    <td align="right">$ #NumberFormat(Session.Annuals_S_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Annuals_S_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Flowers (6&quot; pots)</td>
                    <!---<td align="right"><input name="Annuals_S_materials_qty" type="text" id="Annuals_S_materials_qty"   size="6"    value="#Session.Annuals_S_materials_qty#"/>
                    </td>--->
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_S_materials_qty,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_S_materials_qty" value="#Session.Annuals_S_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_S_materials_qty" type="text" id="Annuals_S_materials_qty"   size="6"  value="#TRIM(Session.Annuals_S_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_S_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_S_materials_rate" value="#Session.Annuals_S_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_S_materials_rate" type="text" id="Annuals_S_rate"   size="5"  value="#Session.Annuals_S_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Annuals_S_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Annuals_S_service_materials,"999.99")#</td>
                    <td align="right"><input name="Annuals_S_times" type="text" class="form_buttons"    size="2"  value="#Session.Annuals_S_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Annuals_S_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Annuals_S_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Annuals_S_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Annuals_S_contract_price  =  #ROUND(Session.Annuals_S_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Annuals_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Annuals, F</td>
                    <td align="right"><input name="Annuals_F_qty" type="text" id="Annuals_F_qty"   size="6"    value="#Session.Annuals_F_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Annuals_F_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_F_rate,"999,999")#</td>
                      <input type="hidden"  name="Annuals_F_rate" value="#Session.Annuals_F_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_F_rate" type="text" id="Annuals_F_rate"   size="5"  value="#Session.Annuals_F_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">Pots</td>
                    <td align="right">$ #NumberFormat(Session.Annuals_F_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Annuals_F_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">Flowers (6&quot; pots)</td>
                    <!--- <td align="right"><input name="Annuals_F_materials_qty" type="text" id="Annuals_F_materials_qty"   size="6"    value="#Session.Annuals_F_materials_qty#"/>
                    </td>--->
                    
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_F_materials_qty,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_F_materials_qty" value="#Session.Annuals_F_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_F_materials_qty" type="text" id="Annuals_F_materials_qty"   size="6"  value="#TRIM(Session.Annuals_F_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Annuals_F_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_F_materials_rate" value="#Session.Annuals_F_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_F_materials_rate" type="text" id="Annuals_F_rate"   size="5"  value="#Session.Annuals_F_materials_rate#"/></td>
                    </cfif>
                    <td align="right">$ #NumberFormat(Session.Annuals_F_materials_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Annuals_F_service_materials,"999.99")#</td>
                    <td align="right"><input name="Annuals_F_times" type="text" class="form_buttons"    size="2"  value="#Session.Annuals_F_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Annuals_F_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Annuals_F_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Annuals_F_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Annuals_F_contract_price  =  #ROUND(Session.Annuals_F_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Annuals_F_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Irrigation, SU</td>
                    <td align="right"><input name="Irrigation_SU_qty" type="text" id="Irrigation_SU_qty"   size="6"    value="#Session.Irrigation_SU_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Irrigation_SU_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Irrigation_SU_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_SU_rate" value="#Session.Irrigation_SU_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Irrigation_SU_rate" type="text" id="Irrigation_SU_rate"   size="5"  value="#Session.Irrigation_SU_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_SU_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_SU_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_SU_service_materials,"999.99")#</td>
                    <td align="right"><input name="Irrigation_SU_times" type="text" class="form_buttons"    size="2"  value="#Session.Irrigation_SU_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_SU_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_SU_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Irrigation_SU_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Irrigation_SU_contract_price  =  #ROUND(Session.Irrigation_SU_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Irrigation_SU_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Irrigation, W</td>
                    <td align="right"><input name="Irrigation_W_qty" type="text" id="Irrigation_W_qty"   size="6"    value="#Session.Irrigation_W_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Irrigation_W_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Irrigation_W_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_W_rate" value="#Session.Irrigation_W_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Irrigation_W_rate" type="text" id="Irrigation_W_rate"   size="5"  value="#Session.Irrigation_W_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR </td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_W_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_W_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_W_service_materials,"999.99")#</td>
                    <td align="right"><input name="Irrigation_W_times" type="text" class="form_buttons"    size="2"  value="#Session.Irrigation_W_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_W_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_W_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Irrigation_W_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Irrigation_W_contract_price  =  #ROUND(Session.Irrigation_W_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Irrigation_W_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Irrigation, I</td>
                    <td align="right"><input name="Irrigation_I_qty" type="text" id="Irrigation_I_qty"   size="6"    value="#Session.Irrigation_I_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Irrigation_I_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Irrigation_I_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_I_rate" value="#Session.Irrigation_I_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Irrigation_I_rate" type="text" id="Irrigation_I_rate"   size="5"  value="#Session.Irrigation_I_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_I_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_I_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_I_service_materials,"999.99")#</td>
                    <td align="right"><input name="Irrigation_I_times" type="text" class="form_buttons"    size="2"  value="#Session.Irrigation_I_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_I_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_I_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Irrigation_I_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Irrigation_I_contract_price  =  #ROUND(Session.Irrigation_I_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Irrigation_I_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Irrigation,TM</td>
                    <td align="right"><input name="Irrigation_TM_qty" type="text" id="Irrigation_TM_qty"   size="6"    value="#Session.Irrigation_TM_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Irrigation_TM_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Irrigation_TM_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_TM_rate" value="#Session.Irrigation_TM_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Irrigation_TM_rate" type="text" id="Irrigation_TM_rate"   size="5"  value="#Session.Irrigation_TM_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_TM_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_TM_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_TM_service_materials,"999.99")#</td>
                    <td align="right"><input name="Irrigation_TM_times" type="text" class="form_buttons"    size="2"  value="#Session.Irrigation_TM_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_TM_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_TM_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Irrigation_TM_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Irrigation_TM_contract_price  =  #ROUND(Session.Irrigation_TM_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Irrigation_TM_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Irrigation, BFI</td>
                    <td align="right"><input name="Irrigation_BFI_qty" type="text" id="Irrigation_BFI_qty"   size="6"    value="#Session.Irrigation_BFI_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Irrigation_BFI_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Irrigation_BFI_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_BFI_rate" value="#Session.Irrigation_BFI_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Irrigation_BFI_rate" type="text" id="Irrigation_BFI_rate"   size="5"  value="#Session.Irrigation_BFI_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_BFI_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_BFI_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_BFI_service_materials,"999.99")#</td>
                    <td align="right"><input name="Irrigation_BFI_times" type="text" class="form_buttons"    size="2"  value="#Session.Irrigation_BFI_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Irrigation_BFI_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Irrigation_BFI_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Irrigation_BFI_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><!---#NumberFormat(Session.gross_margin,"999,999.999")#%---></td>
                    <cfset Session.Irrigation_BFI_contract_price  =  #ROUND(Session.Irrigation_BFI_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Irrigation_BFI_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Pond Maint.</td>
                    <td align="right"><input name="Pond_Maint_qty" type="text" id="Pond_Maint_qty"   size="6"    value="#Session.Pond_Maint_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Pond_Maint_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Pond_Maint_rate,"999,999")#</td>
                      <input type="hidden"  name="Pond_Maint_rate" value="#Session.Pond_Maint_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pond_Maint_rate" type="text" id="Pond_Maint_rate"   size="5"  value="#Session.Pond_Maint_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Pond_Maint_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pond_Maint_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pond_Maint_service_materials,"999.99")#</td>
                    <td align="right"><input name="Pond_Maint_times" type="text" class="form_buttons"    size="2"  value="#Session.Pond_Maint_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Pond_Maint_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Pond_Maint_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Pond_Maint_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Pond_Maint_contract_price  =  #ROUND(Session.Pond_Maint_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Pond_Maint_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Trim, Hillside</td>
                    <td align="right"><input name="Trim_Hillside_qty" type="text" id="Trim_Hillside_qty"   size="6"    value="#Session.Trim_Hillside_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trim_Hillside_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trim_Hillside_rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_Hillside_rate" value="#Session.Trim_Hillside_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trim_Hillside_rate" type="text" id="Trim_Hillside_rate"   size="5"  value="#Session.Trim_Hillside_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Trim_Hillside_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trim_Hillside_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trim_Hillside_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trim_Hillside_times" type="text" class="form_buttons"    size="2"  value="#Session.Trim_Hillside_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Trim_Hillside_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trim_Hillside_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Trim_Hillside_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Trim_Hillside_contract_price  =  #ROUND(Session.Trim_Hillside_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Trim_Hillside_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Addt'l. Mowing</td>
                    <td align="right"><input name="Addtl_Mowing_qty" type="text" id="Addtl_Mowing_qty"   size="6"    value="#Session.Addtl_Mowing_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Addtl_Mowing_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Addtl_Mowing_rate,"999,999")#</td>
                      <input type="hidden"  name="Addtl_Mowing_rate" value="#Session.Addtl_Mowing_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Addtl_Mowing_rate" type="text" id="Addtl_Mowing_rate"   size="5"  value="#Session.Addtl_Mowing_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Addtl_Mowing_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Addtl_Mowing_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Addtl_Mowing_service_materials,"999.99")#</td>
                    <td align="right"><input name="Addtl_Mowing_times" type="text" class="form_buttons"    size="2"  value="#Session.Addtl_Mowing_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Addtl_Mowing_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Addtl_Mowing_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Addtl_Mowing_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Addtl_Mowing_contract_price  =  #ROUND(Session.Addtl_Mowing_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Addtl_Mowing_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Day Porter</td>
                    <td align="right"><input name="Day_Porter_qty" type="text" id="Day_Porter_qty"   size="6"    value="#Session.Day_Porter_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Day_Porter_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Day_Porter_rate,"999,999")#</td>
                      <input type="hidden"  name="Day_Porter_rate" value="#Session.Day_Porter_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Day_Porter_rate" type="text" id="Day_Porter_rate"   size="5"  value="#Session.Day_Porter_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Day_Porter_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Day_Porter_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Day_Porter_service_materials,"999.99")#</td>
                    <td align="right"><input name="Day_Porter_times" type="text" class="form_buttons"    size="2"  value="#Session.Day_Porter_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Day_Porter_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Day_Porter_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Day_Porter_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Day_Porter_contract_price  =  #ROUND(Session.Day_Porter_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Day_Porter_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Bush Hog</td>
                    <td align="right"><input name="Bush_Hog_qty" type="text" id="Bush_Hog_qty"   size="6"    value="#Session.Bush_Hog_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Bush_Hog_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Bush_Hog_rate,"999,999")#</td>
                      <input type="hidden"  name="Bush_Hog_rate" value="#Session.Bush_Hog_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Bush_Hog_rate" type="text" id="Bush_Hog_rate"   size="5"  value="#Session.Bush_Hog_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">SF</td>
                    <td align="right">$ #NumberFormat(Session.Bush_Hog_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Bush_Hog_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Bush_Hog_service_materials,"999.99")#</td>
                    <td align="right"><input name="Bush_Hog_times" type="text" class="form_buttons"    size="2"  value="#Session.Bush_Hog_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Bush_Hog_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Bush_Hog_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Bush_Hog_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Bush_Hog_contract_price  =  #ROUND(Session.Bush_Hog_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Bush_Hog_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Trail Maint</td>
                    <td align="right"><input name="Trail_Maint_qty" type="text" id="Trail_Maint_qty"   size="6"    value="#Session.Trail_Maint_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trail_Maint_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trail_Maint_rate,"999,999")#</td>
                      <input type="hidden"  name="Trail_Maint_rate" value="#Session.Trail_Maint_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trail_Maint_rate" type="text" id="Trail_Maint_rate"   size="5"  value="#Session.Trail_Maint_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Trail_Maint_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trail_Maint_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trail_Maint_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trail_Maint_times" type="text" class="form_buttons"    size="2"  value="#Session.Trail_Maint_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Trail_Maint_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trail_Maint_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Trail_Maint_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Trail_Maint_contract_price  =  #ROUND(Session.Trail_Maint_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Trail_Maint_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Natural Area</td>
                    <td align="right"><input name="Natural_Area_qty" type="text" id="Natural_Area_qty"   size="6"    value="#Session.Natural_Area_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Natural_Area_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Natural_Area_rate,"999,999")#</td>
                      <input type="hidden"  name="Natural_Area_rate" value="#Session.Natural_Area_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Natural_Area_rate" type="text" id="Natural_Area_rate"   size="5"  value="#Session.Natural_Area_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Natural_Area_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Natural_Area_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Natural_Area_service_materials,"999.99")#</td>
                    <td align="right"><input name="Natural_Area_times" type="text" class="form_buttons"    size="2"  value="#Session.Natural_Area_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Natural_Area_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Natural_Area_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Natural_Area_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Natural_Area_contract_price  =  #ROUND(Session.Natural_Area_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Natural_Area_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td   nowrap="nowrap">Trash Rec./Dog Station</td>
                    <td align="right"><input name="Trash_Receptacle_qty" type="text" id="Trash_Receptacle_qty"   size="6"    value="#Session.Trash_Receptacle_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Trash_Receptacle_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Trash_Receptacle_rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_Receptacle_rate" value="#Session.Trash_Receptacle_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Trash_Receptacle_rate" type="text" id="Trash_Receptacle_rate"   size="5"  value="#Session.Trash_Receptacle_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">HR</td>
                    <td align="right">$ #NumberFormat(Session.Trash_Receptacle_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trash_Receptacle_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trash_Receptacle_service_materials,"999.99")#</td>
                    <td align="right"><input name="Trash_Receptacle_times" type="text" class="form_buttons"    size="2"  value="#Session.Trash_Receptacle_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Trash_Receptacle_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Trash_Receptacle_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Trash_Receptacle_overtime_adjustment,"999,999.99")#</td>
                    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                    <cfset Session.Trash_Receptacle_contract_price  =  #ROUND(Session.Trash_Receptacle_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Trash_Receptacle_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td>Lot Sweeping</td>
                    <td align="right"><input name="Lot_Sweeping_qty" type="text" id="Lot_Sweeping_qty"   size="6"    value="#Session.Lot_Sweeping_qty#"/></td>
                    <td nowrap="nowrap">$#Session.Lot_Sweeping_cost#</td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="left" nowrap="nowrap">#NumberFormat(Session.Lot_Sweeping_rate,"999,999")#</td>
                      <input type="hidden"  name="Lot_Sweeping_rate" value="#Session.Lot_Sweeping_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Lot_Sweeping_rate" type="text" id="Lot_Sweeping_rate"   size="5"  value="#Session.Lot_Sweeping_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap">MO</td>
                    <td align="right">$ #NumberFormat(Session.Lot_Sweeping_actualprice,"999.99")#</td>
                    <td align="right">#NumberFormat(Session.Lot_Sweeping_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Lot_Sweeping_service_materials,"999.99")#</td>
                    <td align="right"><input name="Lot_Sweeping_times" type="text" class="form_buttons"    size="2"  value="#Session.Lot_Sweeping_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Lot_Sweeping_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Lot_Sweeping_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Lot_Sweeping_overtime_adjustment,"999,999.99")#</td>
                    <td align="center"><input name="Lot_Sweeping_gm" type="text"   size="3" value="#SESSION.Lot_Sweeping_gm#"/>
                      %</td>
                    <cfset Session.Lot_Sweeping_contract_price  =  #ROUND(Session.Lot_Sweeping_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Lot_Sweeping_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td><input name="Blank1_service"  type="text" id="Blank1_service"   size="20"      value="#Session.Blank1_service#"/></td>
                    <td align="right"><input name="Blank1_qty" type="text" id="Blank1_qty"   size="6"    value="#Session.Blank1_qty#"/></td>
                    <td nowrap="nowrap">$
                      <input name="Blank1_cost" type="text" id="Blank1_cost"   size="5"  value="#Session.Blank1_cost#"/></td>
                    <td align="left" nowrap="nowrap"><input name="Blank1_rate" type="text" id="Blank1_rate"   size="5"  value="#Session.Blank1_rate#"/></td>
                    <td nowrap="nowrap"><input name="Blank1_unit" type="text" id="Blank1_unit"   size="5"    value="#Session.Blank1_unit#"/></td>
                    <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.Blank1_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(Session.Blank1_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Blank1_service_materials,"999.99")#</td>
                    <td align="right"><input name="Blank1_times" type="text" class="form_buttons"    size="2"  value="#Session.Blank1_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.Blank1_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.Blank1_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.Blank1_overtime_adjustment,"999,999.99")#</td>
                    <!---    <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>--->
                    <td align="center"><input name="blank1_gm" type="text"   size="3" value="#SESSION.blank1_gm#"/>
                      %</td>
                    <cfset Session.Blank1_contract_price  =  #ROUND(Session.Blank1_contract_price)#>
                    <td align="right">$#NumberFormat(Session.Blank1_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td><input name="blank2_service"  type="text" id="blank2_service"   size="20"    value="#Session.blank2_service#"/></td>
                    <td align="right"><input name="blank2_qty" type="text" id="blank2_qty"   size="6"    value="#Session.blank2_qty#"/></td>
                    <td nowrap="nowrap">$
                      <input name="blank2_cost" type="text" id="blank2_cost"   size="5"  value="#Session.blank2_cost#"/></td>
                    <td align="left" nowrap="nowrap"><input name="blank2_rate" type="text" id="blank2_rate"   size="5"  value="#Session.blank2_rate#"/></td>
                    <td nowrap="nowrap"><input name="blank2_unit" type="text" id="blank2_unit"   size="5"    value="#Session.blank2_unit#"/></td>
                    <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.blank2_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(Session.blank2_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.blank2_service_materials,"999.99")#</td>
                    <td align="right"><input name="blank2_times" type="text" class="form_buttons"    size="2"  value="#Session.blank2_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.blank2_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.blank2_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.blank2_overtime_adjustment,"999,999.99")#</td>
                    <!---<td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>--->
                    <td align="center"><input name="blank2_gm" type="text"   size="3" value="#SESSION.blank2_gm#"/>
                      %</td>
                    <cfset Session.blank2_contract_price  =  #ROUND(Session.blank2_contract_price)#>
                    <td align="right">$#NumberFormat(Session.blank2_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td><input name="blank3_service"  type="text" id="blank3_service"   size="20"    value="#Session.blank3_service#"/></td>
                    <td align="right"><input name="blank3_qty" type="text" id="blank3_qty"   size="6"    value="#Session.blank3_qty#"/></td>
                    <td nowrap="nowrap">$
                      <input name="blank3_cost" type="text" id="blank3_cost"   size="5"  value="#Session.blank3_cost#"/></td>
                    <td align="left" nowrap="nowrap"><input name="blank3_rate" type="text" id="blank3_rate"   size="5"  value="#Session.blank3_rate#"/></td>
                    <td nowrap="nowrap"><input name="blank3_unit" type="text" id="blank3_unit"   size="5"    value="#Session.blank3_unit#"/></td>
                    <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.blank3_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(Session.blank3_hours,"999.9")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right" nowrap="nowrap">$ #NumberFormat(Session.blank3_service_materials,"999.99")#</td>
                    <td align="right"><input name="blank3_times" type="text" class="form_buttons"    size="2"  value="#Session.blank3_times#"/></td>
                    <td align="right">$ #NumberFormat(Session.blank3_actual_extended,"999,999.99")#</td>
                    <td align="right">#NumberFormat(Session.blank3_total_hours,"9,999.9")#</td>
                    <td align="right">$#NumberFormat(Session.blank3_overtime_adjustment,"999,999.99")#</td>
                    <!--- <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>--->
                    <td align="center"><input name="blank3_gm" type="text"   size="3" value="#SESSION.blank3_gm#"/>
                      %</td>
                    <cfset Session.blank3_contract_price  =  #ROUND(Session.blank3_contract_price)#>
                    <td align="right">$#NumberFormat(Session.blank3_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> 
                <!---  Contract Adjustment ---> 
                <cfoutput>
                  <tr>
                    <td>Contract Adjustment</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">#NumberFormat(Session.contract_adjustment,"999,999.99")#</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">$
                      <input name="contract_adjustment" type="text"   size="5" value="#NumberFormat(Session.contract_adjustment,"999,999.99")#"/></td>
                  </tr>
                </cfoutput> 
                <!---  Totals - XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ---> 
                <cfoutput>
                  <tr>
                    <td><strong>Totals</strong></td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right"><strong>#NumberFormat(Session.seasonal_hours,"999,999.9")#</strong></td>
                    <td align="left"  colspan="4"><strong>&nbsp;Seasonal Hours</strong></td>
                    <!--- <td align="left">&nbsp;</td>
                    <td align="right">&nbsp;</td>---> 
                    <!---  <td align="right">&nbsp;</td>--->
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td align="right"  nowrap="nowrap"><strong>$ #NumberFormat(Session.total_actual_extended,"999,999.99")#</strong></td>
                    <td align="right"><strong>#NumberFormat(Session.total_hours,"999,999.9")#</strong></td>
                    <td align="right"  nowrap="nowrap"><strong>$ #NumberFormat(Session.total_overtime_adjustment,"999,999.99")#</strong></td>
                    <td align="center">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><strong>$ #NumberFormat(Session.total_contract_price,"999,999.99")#</strong></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
            <div class="container-buttons">
              <div class="right-buttons">
                <input name="btnSumit" type="submit" class="btn btn-primary" id="btnSumit" value="Calculate & Save"/>
              </div>
            </div></td>
        </tr>
      </table>
      </td>
      </tr>
      </table>
      
      <!--- <div class="spacer40"></div>--->
      <table width="98%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td><table class="table">
              <br>
              <br>
              <br>
              <br />
              <tr>
                <td>Total Materials Cost</td>
                <td  align="right"><cfoutput>#NumberFormat(Session.Total_materials_cost ,"999,999.99")#</cfoutput></td>
              </tr>
              <cfset Total_labor_cost = Session.total_actual_extended  -Session.Total_materials_cost>
              <tr>
                <td>Total Labor Cost</td>
                <td  align="right"><cfoutput>#NumberFormat(Total_labor_cost ,"999,999.99")#</cfoutput></td>
              </tr>
              <!---<cfset OT_adjustment = Session.total_overtime_adjustment  -Session.total_actual_extended >
            <tr>
              <td>OT Adjustment</td>
              <td  align="right"><cfoutput>#NumberFormat(OT_adjustment ,"999,999.99")#</cfoutput></td>
            </tr>--->
              <cfset OT_adjustment = 0>
              <cfset Total_Adjusted_Annual_Direct_Cost= OT_adjustment +Total_labor_cost+Session.Total_materials_cost>
              <tr>
                <td nowrap="nowrap">Total    Direct Costs</td>
                <td  align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999,999.99")#</cfoutput></td>
              </tr>
             <!--- <tr>
                <td>Overhead</td>
                <td  align="right" nowrap="nowrap"><!---$ <cfoutput>#NumberFormat(Session.total_contract_price,"99,999,999.99")#</cfoutput>---></td>
              </tr>
              <tr>
                <td>Net Profit</td>
                <td  align="right" nowrap="nowrap"><!---$ <cfoutput>#NumberFormat(Session.total_contract_price,"99,999,999.99")#</cfoutput>---></td>
              </tr>--->
              <tr>
                <td>Contract Adjustment</td>
                <td  align="right" nowrap="nowrap">$ <cfoutput>#NumberFormat(Session.contract_adjustment,"99,999,999.99")#</cfoutput></td>
              </tr>
              <tr>
                <td>Contract Price</td>
                <td  align="right" nowrap="nowrap">$ <cfoutput>#NumberFormat(Session.total_contract_price,"99,999,999.99")#</cfoutput></td>
              </tr>
            </table>
            <br>
            <br>
            <table class="table">
              <tr>
                <td>Grounds Maintenance Contract</td>
                <td  align="right"><cfoutput>#NumberFormat(Session.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput></td>
              </tr>
              
              <!---<tr>
              <td>Seasonal Color</td>
              <td  align="right"><cfoutput>#NumberFormat(Session.Seasonal_Color_Contract ,"99,999,999.99")#</cfoutput></td>
            </tr>
            --->
              <tr>
                <td>Irrigation</td>
                <td  align="right"><cfoutput>#NumberFormat(Session.Irrigation_Contract,"99,999,999.99")#</cfoutput></td>
              </tr>
              <!---<tr>
              <td>Tax Rate</td>
              <td  align="right"><cfoutput>#NumberFormat(SESSION.taxrate,"99,999,999.999")#</cfoutput></td>
            </tr>
<tr>
              <td>Sales Tax</td>
              <td  align="right"><cfoutput>#NumberFormat(Session.sales_tax,"99,999,999.99")#</cfoutput></td>
            </tr>--->
              
            </table>
            <p>&nbsp;</p></td>
          <td  width="100">&nbsp;</td>
          <td align="top"><!---<table class="table">
            <tr>
              <td colspan="6"  align="center" bgcolor="#CCCCCC"><strong>Job Costing Scenario</strong></td>
            </tr>
            <tr>
              <td>Direct Cost Overage</td>
              <td align="right">Direct Costs</td>
              <td align="right">Gross Margin</td>
              <td align="right">Overhead</td>
              <td align="right">Net Profit</td>
              <td align="right">Net Profit %</td>
            </tr>
            <tr>
              <td>0%</td>
              <td align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999,999.99")#</cfoutput></td>
              <cfset  gross_margin0 = NumberFormat(Session.total_contract_price,"999999.99")-NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999999.99")>
              <td align="right"><cfoutput>#NumberFormat(gross_margin0 ,"999,999.99")#</cfoutput></td>
              <cfset overhead0 = NumberFormat(Session.total_contract_price,"999999.99")*.38>
              <td align="right"><cfoutput>#NumberFormat(overhead0 ,"999,999.99")#</cfoutput></td>
              <cfset net_profit0 = NumberFormat(gross_margin0 ,"999999.99")-NumberFormat(overhead0,"999999.99")>
              <td align="right"><cfoutput>#NumberFormat(net_profit0 ,"999,999.99")#</cfoutput></td>
              <cfif Session.total_contract_price NEQ 0 >
                <cfset net_profit0_percentage = 100*NumberFormat(net_profit0 ,"999999.99")/NumberFormat(Session.total_contract_price,"999999.99")>
                <cfelse>
                <cfset net_profit0_percentage = 0>
              </cfif>
              <td align="right"><cfoutput>#NumberFormat(net_profit0_percentage ,"999,999.99")#</cfoutput></td>
            </tr>
            <cfset Total_Adjusted_Annual_Direct_Cost15= Total_Adjusted_Annual_Direct_Cost*1.15>
            <tr>
              <td>15%</td>
              <td align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost15,"999,999.99")#</cfoutput></td>
              <cfset  gross_margin15 = NumberFormat(Session.total_contract_price,"999999.99")-NumberFormat(Total_Adjusted_Annual_Direct_Cost15,"999999.99")>
              <td align="right"><cfoutput>#NumberFormat(gross_margin15 ,"999,999.99")#</cfoutput></td>
              <cfset overhead15 = NumberFormat(Session.total_contract_price,"999999.99")*.38>
              <td align="right"><cfoutput>#NumberFormat(overhead15,"999,999.99")#</cfoutput></td>
              <cfset net_profit15 = NumberFormat(gross_margin15 ,"999999.99")-NumberFormat(overhead15,"999999.99")>
              <td align="right"><cfoutput>#NumberFormat(net_profit15 ,"999,999.99")#</cfoutput></td>
              <cfif Session.total_contract_price NEQ 0 >
                <cfset net_profit15_percentage = 100*NumberFormat(net_profit15 ,"999999.99")/NumberFormat(Session.total_contract_price,"999999.99")>
                <cfelse>
                <cfset net_profit15_percentage = 0>
              </cfif>
              <td align="right"><cfoutput>#NumberFormat(net_profit15_percentage ,"999,999.99")#</cfoutput></td>
            </tr>
            <cfset Total_Adjusted_Annual_Direct_Cost_Net= NumberFormat(Total_Adjusted_Annual_Direct_Cost15,"999999.99")- NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999999.99")>
            <cfset Total_Gross_Margin_Net= NumberFormat(gross_margin0 ,"999999.99")- NumberFormat(gross_margin15 ,"999999.99")>
            <cfset Total_Net_Profit_Net= NumberFormat(net_profit0 ,"999999.99")- NumberFormat(net_profit15 ,"999999.99")>
            <cfset Total_Net_Profit_Net_percentage= NumberFormat(net_profit0_percentage ,"999999.99")- NumberFormat(net_profit15_percentage ,"999999.99")>
            <tr>
              <td>Difference</td>
              <td align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost_Net,"999,999.99")#</cfoutput></td>
              <td align="right"><cfoutput>#NumberFormat(Total_Gross_Margin_Net,"999,999.99")#</cfoutput></td>
              <td align="right">-</td>
              <td align="right"><cfoutput>#NumberFormat(Total_Net_Profit_Net,"999,999.99")#</cfoutput></td>
              <td align="right"><cfoutput>#NumberFormat(Total_Net_Profit_Net_percentage,"999,999.99")#</cfoutput></td>
            </tr>
            <cfset  man_hours = Total_Adjusted_Annual_Direct_Cost_Net/10.50>
            <tr>
              <td>Difference in Man Hours</td>
              <td align="right"><cfoutput>#NumberFormat(man_hours,"999,999.99")#</cfoutput></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>---><br />
            <br />
            <br />
            <br />
            <div class="container-buttons">
              <div class="right-buttons">
                <input name="btnSumit" class="btn btn-primary" id="btnSumit"  type="submit" value="Contract Approved"/>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <!---  <div class="button-box"><a href="create_duplicate_quote.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" >Duplicate this Quote</a> </div> ---> 
                
              </div>
            </div>
            <br />
            <br /></td>
        </tr>
      </table>
    </form>
  </div>
</div>
<!--Html-->
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
