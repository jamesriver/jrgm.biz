<!--- <cfset exists= structdelete(session, 'Session.Irrigation_SU_cost', true)/>  
   --->
<!---  <cfabort>   --->
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
  <cfif  service_id EQ '3080'>
    <cfparam  name="Session.3080_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.3080_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ '4080'>
    <cfparam  name="Session.4080_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.4080_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, BFI'>
    <cfparam  name="Session.Irrigation_BFI_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="Session.Irrigation_BFI_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Fertilization'>
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
  </cfif>
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
<cfparam  name="Session.gross_margin" default="50"  >
<cfparam  name="gross_margin" default="50"  >
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
<!--- Quote Services Insert --->
<cfquery name="check_for_quote_services" datasource="jrgm">
SELECT opportunity_id FROM quote_services  WHERE  opportunity_id =#url.id#
</cfquery>
<cfquery name="check_for_quote_materials" datasource="jrgm">
SELECT opportunity_id FROM quote_materials  WHERE  opportunity_id =#url.id#
</cfquery>
<!---<cfquery name="get_quote_main" datasource="jrgm">
SELECT * FROM quote_main  WHERE  opportunity_id  =#url.id#
</cfquery>
--->
<cfquery name="get_quote_main" datasource="jrgm">
SELECT       ID, date_created, gross_margin, opportunity_id, date_updated,  contract_start_date, contract_end_date, contract_installments, 
   duplicate_quote, opportunity_id_original, quote_approved, total_contract_price
FROM         quote_main
where opportunity_id  =#url.id#
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
<cfset SESSION.CONTRACT_ADJUSTMENT = get_service_info.CONTRACT_ADJUSTMENT>

<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset SESSION.push_mow_service_rate = 10.50>  --->
<cfset SESSION.push_mow_qty  = get_service_info.push_mow_qty >
<cfset SESSION.push_mow_cost  = get_service_info.push_mow_cost>
<cfset SESSION.push_mow_rate = get_service_info.push_mow_rate>
<cfset SESSION.push_mow_hours  = SESSION.push_mow_qty/SESSION.push_mow_rate>
<cfset SESSION.push_mow_hoursA = #NumberFormat(SESSION.push_mow_hours,"999,999.9")#>
<cfset SESSION.push_mow_actualprice  = SESSION.push_mow_hours*SESSION.push_mow_cost>
<cfset SESSION.push_mow_materials_rate  = 0>
<cfset SESSION.push_mow_service_materials  = SESSION.push_mow_actualprice+SESSION.push_mow_materials_rate >
<cfset SESSION.push_mow_times  = get_service_info.push_mow_times>
<cfset SESSION.push_mow_actual_extended  = SESSION.push_mow_times* #NumberFormat(SESSION.push_mow_service_materials,"999999.99")#>
<cfset SESSION.push_mow_actual_extended  =  #ROUND(SESSION.push_mow_actual_extended)#>
<cfset SESSION.push_mow_total_hours = SESSION.push_mow_hoursA*SESSION.push_mow_times>
<cfset SESSION.push_mow_overtime_adjustment =
SESSION.push_mow_actual_extended -
(SESSION.push_mow_total_hours*0.10* SESSION.push_mow_cost)+
(SESSION.push_mow_total_hours*0.10* SESSION.push_mow_cost*1.5)>
<cfset SESSION.push_mow_contract_price = SESSION.push_mow_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset SESSION.walk_behind_service_rate = 11.50>   --->
<cfset SESSION.walk_behind_qty  = get_service_info.walk_behind_qty >
<cfset SESSION.walk_behind_cost  = get_service_info.walk_behind_cost>
<cfset SESSION.walk_behind_rate = get_service_info.walk_behind_rate>
<cfset SESSION.walk_behind_hours  = SESSION.walk_behind_qty/SESSION.walk_behind_rate>
<cfset SESSION.walk_behind_hoursA = #NumberFormat(SESSION.walk_behind_hours,"999,999.9")#>
<cfset SESSION.walk_behind_actualprice  = SESSION.walk_behind_hours*SESSION.walk_behind_cost>
<cfset SESSION.walk_behind_materials_rate  = 0>
<cfset SESSION.walk_behind_service_materials  = SESSION.walk_behind_actualprice+SESSION.walk_behind_materials_rate >
<cfset SESSION.walk_behind_times  = get_service_info.walk_behind_times>
<cfset SESSION.walk_behind_actual_extended  = SESSION.walk_behind_times* #NumberFormat(SESSION.walk_behind_service_materials,"999999.99")#>
<cfset SESSION.walk_behind_actual_extended  =  #ROUND(SESSION.walk_behind_actual_extended)#>
<cfset SESSION.walk_behind_total_hours = SESSION.walk_behind_hoursA*SESSION.walk_behind_times>
<cfset SESSION.walk_behind_overtime_adjustment =
SESSION.walk_behind_actual_extended -
(SESSION.walk_behind_total_hours*0.10* SESSION.walk_behind_cost)+
(SESSION.walk_behind_total_hours*0.10* SESSION.walk_behind_cost*1.5)>
<cfset SESSION.walk_behind_contract_price = SESSION.walk_behind_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  - <cfset SESSION.ride_mow_service_rate = 11.50>    --->
<cfset SESSION.ride_mow_qty  = get_service_info.ride_mow_qty >
<cfset SESSION.ride_mow_cost  = get_service_info.ride_mow_cost>
<cfset SESSION.ride_mow_rate = get_service_info.ride_mow_rate>
<cfset SESSION.ride_mow_hours  = SESSION.ride_mow_qty/SESSION.ride_mow_rate>
<cfset SESSION.ride_mow_hoursA = #NumberFormat(SESSION.ride_mow_hours,"999,999.9")#>
<cfset SESSION.ride_mow_actualprice  = SESSION.ride_mow_hours*SESSION.ride_mow_cost>
<cfset SESSION.ride_mow_materials_rate  = 0>
<cfset SESSION.ride_mow_service_materials  = SESSION.ride_mow_actualprice+SESSION.ride_mow_materials_rate >
<cfset SESSION.ride_mow_times  = get_service_info.ride_mow_times>
<cfset SESSION.ride_mow_actual_extended  = SESSION.ride_mow_times* #NumberFormat(SESSION.ride_mow_service_materials,"999999.99")#>
<cfset SESSION.ride_mow_actual_extended  =  #ROUND(SESSION.ride_mow_actual_extended)#>
<cfset SESSION.ride_mow_total_hours = SESSION.ride_mow_hoursA*SESSION.ride_mow_times>
<cfset SESSION.ride_mow_overtime_adjustment =
SESSION.ride_mow_actual_extended -
(SESSION.ride_mow_total_hours*0.10* SESSION.ride_mow_cost)+
(SESSION.ride_mow_total_hours*0.10* SESSION.ride_mow_cost*1.5)>
<cfset SESSION.ride_mow_contract_price = SESSION.ride_mow_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---    <cfset SESSION.hard_edge_service_rate = 11.50>   --->
<cfset SESSION.hard_edge_qty  = get_service_info.hard_edge_qty >
<cfset SESSION.hard_edge_cost  = get_service_info.hard_edge_cost>
<cfset SESSION.hard_edge_rate = get_service_info.hard_edge_rate>
<cfset SESSION.hard_edge_hours  = SESSION.hard_edge_qty/SESSION.hard_edge_rate>
<cfset SESSION.hard_edge_hoursA = #NumberFormat(SESSION.hard_edge_hours,"999,999.9")#>
<cfset SESSION.hard_edge_actualprice  = SESSION.hard_edge_hours*SESSION.hard_edge_cost>
<cfset SESSION.hard_edge_materials_rate  = 0>
<cfset SESSION.hard_edge_service_materials  = SESSION.hard_edge_actualprice+SESSION.hard_edge_materials_rate >
<cfset SESSION.hard_edge_times  = get_service_info.hard_edge_times>
<cfset SESSION.hard_edge_actual_extended  = SESSION.hard_edge_times* #NumberFormat(SESSION.hard_edge_service_materials,"999999.99")#>
<cfset SESSION.hard_edge_actual_extended  =  #ROUND(SESSION.hard_edge_actual_extended)#>
<cfset SESSION.hard_edge_total_hours = SESSION.hard_edge_hoursA*SESSION.hard_edge_times>
<cfset SESSION.hard_edge_overtime_adjustment =
SESSION.hard_edge_actual_extended -
(SESSION.hard_edge_total_hours*0.10* SESSION.hard_edge_cost)+
(SESSION.hard_edge_total_hours*0.10* SESSION.hard_edge_cost*1.5)>
<cfset SESSION.hard_edge_contract_price = SESSION.hard_edge_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---    <cfset SESSION.bed_edge_service_rate = 11.50>  --->
<cfset SESSION.bed_edge_qty  = get_service_info.bed_edge_qty >
<cfset SESSION.bed_edge_cost  = get_service_info.bed_edge_cost>
<cfset SESSION.bed_edge_rate = get_service_info.bed_edge_rate>
<cfset SESSION.bed_edge_hours  = SESSION.bed_edge_qty/SESSION.bed_edge_rate>
<cfset SESSION.bed_edge_hoursA = #NumberFormat(SESSION.bed_edge_hours,"999,999.9")#>
<cfset SESSION.bed_edge_actualprice  = SESSION.bed_edge_hours*SESSION.bed_edge_cost>
<cfset SESSION.bed_edge_materials_rate  = 0>
<cfset SESSION.bed_edge_service_materials  = SESSION.bed_edge_actualprice+SESSION.bed_edge_materials_rate >
<cfset SESSION.bed_edge_times  = get_service_info.bed_edge_times>
<cfset SESSION.bed_edge_actual_extended  = SESSION.bed_edge_times* #NumberFormat(SESSION.bed_edge_service_materials,"999999.99")#>
<cfset SESSION.bed_edge_actual_extended  =  #ROUND(SESSION.bed_edge_actual_extended)#>
<cfset SESSION.bed_edge_total_hours = SESSION.bed_edge_hoursA*SESSION.bed_edge_times>
<cfset SESSION.bed_edge_overtime_adjustment =
SESSION.bed_edge_actual_extended -
(SESSION.bed_edge_total_hours*0.10* SESSION.bed_edge_cost)+
(SESSION.bed_edge_total_hours*0.10* SESSION.bed_edge_cost*1.5)>
<cfset SESSION.bed_edge_contract_price = SESSION.bed_edge_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset SESSION.TRIM_O_service_rate = 11.50>   --->
<cfset SESSION.Trim_O_qty  = get_service_info.Trim_O_qty >
<cfset SESSION.TRIM_O_cost  = get_service_info.TRIM_O_cost>
<cfset SESSION.Trim_O_rate = get_service_info.Trim_O_rate>
<cfset SESSION.TRIM_O_hours  = SESSION.Trim_O_qty/SESSION.Trim_O_rate>
<cfset SESSION.TRIM_O_hoursA = #NumberFormat(SESSION.TRIM_O_hours,"999999.9")#>
<cfset SESSION.TRIM_O_actualprice  = SESSION.TRIM_O_hours*SESSION.TRIM_O_cost>
<cfset SESSION.TRIM_O_materials_rate  = 0>
<cfset SESSION.TRIM_O_service_materials  = SESSION.TRIM_O_actualprice+SESSION.TRIM_O_materials_rate >
<cfset SESSION.Trim_O_Times  = get_service_info.Trim_O_Times>
<cfset SESSION.TRIM_O_actual_extended  = SESSION.TRIM_O_times* #NumberFormat(SESSION.TRIM_O_service_materials,"999999.99")#>
<cfset SESSION.TRIM_O_actual_extended  =  #ROUND(SESSION.TRIM_O_actual_extended)#>
<cfset SESSION.TRIM_O_total_hours = SESSION.TRIM_O_hoursA*SESSION.TRIM_O_times>
<cfset SESSION.TRIM_O_overtime_adjustment =
SESSION.TRIM_O_actual_extended -
(SESSION.TRIM_O_total_hours*0.10* SESSION.TRIM_O_cost)+
(SESSION.TRIM_O_total_hours*0.10* SESSION.TRIM_O_cost*1.5)>
<cfset SESSION.TRIM_O_contract_price = SESSION.TRIM_O_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset SESSION.TRIM_S_service_rate = 11.50>  --->
<cfset SESSION.Trim_S_qty  = get_service_info.Trim_S_qty >
<cfset SESSION.Trim_S_Cost  = get_service_info.Trim_S_Cost>
<cfset SESSION.Trim_S_Rate = get_service_info.Trim_S_Rate>
<cfset SESSION.TRIM_S_hours  = SESSION.Trim_S_qty/SESSION.Trim_S_Rate>
<cfset SESSION.TRIM_S_hoursA = #NumberFormat(SESSION.TRIM_S_hours,"999,999.9")#>
<cfset SESSION.TRIM_S_actualprice  = SESSION.TRIM_S_hours*SESSION.Trim_S_Cost>
<cfset SESSION.TRIM_S_materials_rate  = 0>
<cfset SESSION.TRIM_S_service_materials  = SESSION.TRIM_S_actualprice+SESSION.TRIM_S_materials_rate >
<cfset SESSION.trim_S_times  = get_service_info.trim_S_times>
<cfset SESSION.TRIM_S_actual_extended  = SESSION.TRIM_S_times* #NumberFormat(SESSION.TRIM_S_service_materials,"999999.99")#>
<cfset SESSION.TRIM_S_actual_extended  =  #ROUND(SESSION.TRIM_S_actual_extended)#>
<cfset SESSION.TRIM_S_total_hours = SESSION.TRIM_S_hoursA*SESSION.TRIM_S_times>
<cfset SESSION.TRIM_S_overtime_adjustment =
SESSION.TRIM_S_actual_extended -
(SESSION.TRIM_S_total_hours*0.10* SESSION.TRIM_S_cost)+
(SESSION.TRIM_S_total_hours*0.10* SESSION.TRIM_S_cost*1.5)>
<cfset SESSION.TRIM_S_contract_price = SESSION.TRIM_S_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset SESSION.spraying_service_rate = 11.50>    --->
<cfset SESSION.spraying_qty  = get_service_info.spraying_qty >
<cfset SESSION.spraying_cost  = get_service_info.spraying_cost>
<cfset SESSION.spraying_rate = get_service_info.spraying_rate>
<cfset SESSION.spraying_hours  = SESSION.spraying_qty/SESSION.spraying_rate>
<cfset SESSION.spraying_hoursA = #NumberFormat(SESSION.spraying_hours,"999,999.9")#>
<cfset SESSION.spraying_actualprice  = SESSION.spraying_hours*SESSION.spraying_cost>
<cfset SESSION.spraying_materials_rate  = get_materials_info.spraying_materials_rate>
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
<cfset SESSION.spraying_materials_qty_actual=(get_service_info.spraying_qty /166)>
<cfset SESSION.spraying_materials_qty_actual=#NumberFormat(SESSION.spraying_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.spraying_materials_qty")    AND  get_materials_info.spraying_materials_qty  EQ SESSION.spraying_materials_qty_actual  AND SESSION.spraying_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif   IsDefined("form.spraying_materials_qty")    AND get_materials_info.spraying_materials_qty  EQ form.spraying_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")   <!---AND  form.spraying_materials_qty NEQ 0 --->  AND   IsDefined("spraying_qty_pre")   AND   IsDefined("spraying_qty_post") AND spraying_qty_pre NEQ  spraying_qty_post>
  <cfset SESSION.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif  IsDefined("form.spraying_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.spraying_materials_qty=(form.SPRAYING_MATERIALS_QTY)>
  <cfelseif   NOT IsDefined("form.spraying_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
  <cfelse>
  <cfset SESSION.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
</cfif>
<cfset SESSION.spraying_materials_qty = #NumberFormat(SESSION.spraying_materials_qty,"999999.99")#>
<cfset SESSION.spraying_materials_actualprice = SESSION.spraying_materials_rate*SESSION.spraying_materials_qty>
<cfset SESSION.spraying_materials_actualprice = #NumberFormat(SESSION.spraying_materials_actualprice,"999999.99")#>
<cfset SESSION.spraying_service_materials  = SESSION.spraying_actualprice+SESSION.spraying_materials_actualprice >
<cfset SESSION.spraying_times  = get_service_info.spraying_times>
<cfset SESSION.spraying_actual_extended  = SESSION.spraying_times* #NumberFormat(SESSION.spraying_service_materials,"999999.99")#>
<cfset SESSION.spraying_actual_extended  =  #ROUND(SESSION.spraying_actual_extended)#>
<cfset SESSION.spraying_total_hours = SESSION.spraying_hoursA*SESSION.spraying_times>
<cfset SESSION.spraying_overtime_adjustment =
SESSION.spraying_actual_extended -
(SESSION.spraying_total_hours*0.10* SESSION.spraying_cost)+
(SESSION.spraying_total_hours*0.10* SESSION.spraying_cost*1.5)>
<cfset SESSION.spraying_contract_price = SESSION.spraying_overtime_adjustment / SESSION.gross_margin_diff>

<!---<cfoutput>#SESSION.spraying_materials_qty_actual#</cfoutput>--->
<!------------------------------------------------------------------------------------------------------------->
<!---   <cfset SESSION.weeding_service_rate = 11.50>  --->
<cfset SESSION.weeding_qty  = get_service_info.weeding_qty >
<cfset SESSION.weeding_cost  = get_service_info.weeding_cost>
<cfset SESSION.weeding_rate = get_service_info.weeding_rate>
<cfset SESSION.weeding_hours  = SESSION.weeding_qty/SESSION.weeding_rate>
<cfset SESSION.weeding_hoursA = #NumberFormat(SESSION.weeding_hours,"999,999.9")#>
<cfset SESSION.weeding_actualprice  = SESSION.weeding_hours*SESSION.weeding_cost>
<cfset SESSION.weeding_materials_rate  = 0>
<cfset SESSION.weeding_service_materials  = SESSION.weeding_actualprice+SESSION.weeding_materials_rate >
<cfset SESSION.weeding_times  = get_service_info.weeding_times>
<cfset SESSION.weeding_actual_extended  = SESSION.weeding_times* #NumberFormat(SESSION.weeding_service_materials,"999999.99")#>
<cfset SESSION.weeding_actual_extended  =  #ROUND(SESSION.weeding_actual_extended)#>
<cfset SESSION.weeding_total_hours = SESSION.weeding_hoursA*SESSION.weeding_times>
<cfset SESSION.weeding_overtime_adjustment =
SESSION.weeding_actual_extended -
(SESSION.weeding_total_hours*0.10* SESSION.weeding_cost)+
(SESSION.weeding_total_hours*0.10* SESSION.weeding_cost*1.5)>
<cfset SESSION.weeding_contract_price = SESSION.weeding_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset SESSION.blowing_service_rate = 11.50>   --->
<cfset SESSION.blowing_qty  = get_service_info.blowing_qty >
<cfset SESSION.blowing_cost  = get_service_info.blowing_cost>
<cfset SESSION.blowing_rate = get_service_info.blowing_rate>
<cfset SESSION.blowing_hours  = SESSION.blowing_qty/SESSION.blowing_rate>
<cfset SESSION.blowing_hoursA = #NumberFormat(SESSION.blowing_hours,"999,999.9")#>
<cfset SESSION.blowing_actualprice  = SESSION.blowing_hours*SESSION.blowing_cost>
<cfset SESSION.blowing_materials_rate  = 0>
<cfset SESSION.blowing_service_materials  = SESSION.blowing_actualprice+SESSION.blowing_materials_rate >
<cfset SESSION.blowing_times  = get_service_info.blowing_times>
<cfset SESSION.blowing_actual_extended  = SESSION.blowing_times* #NumberFormat(SESSION.blowing_service_materials,"999999.99")#>
<cfset SESSION.blowing_actual_extended  =  #ROUND(SESSION.blowing_actual_extended)#>
<cfset SESSION.blowing_total_hours = SESSION.blowing_hoursA*SESSION.blowing_times>
<cfset SESSION.blowing_overtime_adjustment =
SESSION.blowing_actual_extended -
(SESSION.blowing_total_hours*0.10* SESSION.blowing_cost)+
(SESSION.blowing_total_hours*0.10* SESSION.blowing_cost*1.5)>
<cfset SESSION.blowing_contract_price = SESSION.blowing_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Trash_S_service_rate = 11.50> --->
<cfset SESSION.Trash_S_Qty  = get_service_info.Trash_S_Qty >
<cfset SESSION.Trash_S_Cost  = get_service_info.Trash_S_Cost>
<cfset SESSION.Trash_S_Rate = get_service_info.Trash_S_Rate>
<cfset SESSION.trash_s_hours  = SESSION.Trash_S_Qty/SESSION.Trash_S_Rate>
<cfset SESSION.trash_s_hoursA = #NumberFormat(SESSION.trash_s_hours,"999,999.9")#>
<cfset SESSION.Trash_S_actualprice  = SESSION.trash_s_hours*SESSION.Trash_S_Cost>
<cfset SESSION.Trash_s_materials_rate  = 0>
<cfset SESSION.Trash_s_service_materials  = SESSION.Trash_S_actualprice+SESSION.Trash_S_materials_rate >
<cfset SESSION.Trash_S_Times  = get_service_info.Trash_S_Times>
<cfset SESSION.Trash_S_actual_extended  = SESSION.Trash_S_times* #NumberFormat(SESSION.Trash_S_service_materials,"999999.99")#>
<cfset SESSION.Trash_S_actual_extended  =  #ROUND(SESSION.Trash_S_actual_extended)#>
<cfset SESSION.Trash_S_total_hours = SESSION.Trash_S_hoursA*SESSION.Trash_S_times>
<cfset SESSION.Trash_S_overtime_adjustment =
SESSION.Trash_S_actual_extended -
(SESSION.Trash_S_total_hours*0.10* SESSION.Trash_S_cost)+
(SESSION.Trash_S_total_hours*0.10* SESSION.Trash_S_cost*1.5)>
<cfset SESSION.Trash_S_contract_price = SESSION.Trash_S_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset SESSION.traveltime_service_rate = 11.50>--->
<cfset SESSION.traveltime_qty  = get_service_info.traveltime_qty >
<cfset SESSION.traveltime_cost  = get_service_info.traveltime_cost>
<cfset SESSION.traveltime_rate = get_service_info.traveltime_rate>
<cfset SESSION.traveltime_hours  = SESSION.traveltime_qty/SESSION.traveltime_rate>
<cfset SESSION.traveltime_hoursA = #NumberFormat(SESSION.traveltime_hours,"999,999.9")#>
<cfset SESSION.traveltime_actualprice  = SESSION.traveltime_hours*SESSION.traveltime_cost>
<cfset SESSION.traveltime_materials_rate  = 0>
<cfset SESSION.traveltime_service_materials  = SESSION.traveltime_actualprice+SESSION.traveltime_materials_rate >
<cfset SESSION.traveltime_times  = get_service_info.traveltime_times>
<cfset SESSION.traveltime_actual_extended  = SESSION.traveltime_times* #NumberFormat(SESSION.traveltime_service_materials,"999999.99")#>
<cfset SESSION.traveltime_actual_extended  =  #ROUND(SESSION.traveltime_actual_extended)#>
<cfset SESSION.traveltime_total_hours = SESSION.traveltime_hoursA*SESSION.traveltime_times>
<!--- <cfset SESSION.travel_time_gm  = get_service_info.travel_time_gm >
<cfset SESSION.gross_margin_diff_travel_time = (100-SESSION.travel_time_gm)/100>--->
<cfset SESSION.traveltime_overtime_adjustment =
SESSION.traveltime_actual_extended -
(SESSION.traveltime_total_hours*0.10* SESSION.traveltime_cost)+
(SESSION.traveltime_total_hours*0.10* SESSION.traveltime_cost*1.5)>
<!---<cfoutput>#SESSION.traveltime_overtime_adjustment# -#SESSION.gross_margin_diff_travel_time#</cfoutput>--->

<cfset SESSION.traveltime_contract_price = SESSION.traveltime_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Trash_O_service_rate = 11.50> --->
<cfset SESSION.Trash_O_Qty  = get_service_info.Trash_O_Qty >
<cfset SESSION.Trash_O_cost  = get_service_info.Trash_O_cost>
<cfset SESSION.Trash_O_rate = get_service_info.Trash_O_rate>
<cfset SESSION.Trash_O_hours  = SESSION.Trash_O_Qty/SESSION.Trash_O_rate>
<cfset SESSION.Trash_O_hoursA = #NumberFormat(SESSION.Trash_O_hours,"999,999.9")#>
<cfset SESSION.Trash_O_actualprice  = SESSION.Trash_O_hours*SESSION.Trash_O_cost>
<cfset SESSION.Trash_O_materials_rate  = 0>
<cfset SESSION.Trash_O_service_materials  = SESSION.Trash_O_actualprice+SESSION.Trash_O_materials_rate >
<cfset SESSION.Trash_O_Times  = get_service_info.Trash_O_Times>
<cfset SESSION.Trash_O_actual_extended  = SESSION.Trash_O_times* #NumberFormat(SESSION.Trash_O_service_materials,"999999.99")#>
<cfset SESSION.Trash_O_actual_extended  =  #ROUND(SESSION.Trash_O_actual_extended)#>
<cfset SESSION.Trash_O_total_hours = SESSION.Trash_O_hoursA*SESSION.Trash_O_times>
<cfset SESSION.Trash_O_overtime_adjustment =
SESSION.Trash_O_actual_extended -
(SESSION.Trash_O_total_hours*0.10* SESSION.Trash_O_cost)+
(SESSION.Trash_O_total_hours*0.10* SESSION.Trash_O_cost*1.5)>
<cfset SESSION.Trash_O_contract_price = SESSION.Trash_O_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.leafrem_service_rate = 11.50> --->
<cfset SESSION.leafrem_qty  = get_service_info.leafrem_qty >
<cfset SESSION.leafrem_cost  = get_service_info.leafrem_cost>
<cfset SESSION.leafrem_rate = get_service_info.leafrem_rate>
<cfset SESSION.leafrem_hours  = SESSION.leafrem_qty/SESSION.leafrem_rate>
<cfset SESSION.leafrem_hoursA = #NumberFormat(SESSION.leafrem_hours,"999,999.9")#>
<cfset SESSION.leafrem_actualprice  = SESSION.leafrem_hours*SESSION.leafrem_cost>
<cfset SESSION.leafrem_materials_rate  = 0>
<cfset SESSION.leafrem_service_materials  = SESSION.leafrem_actualprice+SESSION.leafrem_materials_rate >
<cfset SESSION.leafrem_times  = get_service_info.leafrem_times>
<cfset SESSION.leafrem_actual_extended  = SESSION.leafrem_times* #NumberFormat(SESSION.leafrem_service_materials,"999999.99")#>
<cfset SESSION.leafrem_actual_extended  =  #ROUND(SESSION.leafrem_actual_extended)#>
<cfset SESSION.leafrem_total_hours = SESSION.leafrem_hoursA*SESSION.leafrem_times>
<cfset SESSION.leafrem_overtime_adjustment =
SESSION.leafrem_actual_extended -
(SESSION.leafrem_total_hours*0.10* SESSION.leafrem_cost)+
(SESSION.leafrem_total_hours*0.10* SESSION.leafrem_cost*1.5)>
<cfset SESSION.leafrem_contract_price = SESSION.leafrem_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.cleanup_service_rate = 11.50> --->
<cfset SESSION.cleanup_qty  = get_service_info.cleanup_qty >
<cfset SESSION.cleanup_cost  = get_service_info.cleanup_cost>
<cfset SESSION.cleanup_rate = get_service_info.cleanup_rate>
<cfset SESSION.cleanup_hours  = SESSION.cleanup_qty/SESSION.cleanup_rate>
<cfset SESSION.cleanup_hoursA = #NumberFormat(SESSION.cleanup_hours,"999,999.9")#>
<cfset SESSION.cleanup_actualprice  = SESSION.cleanup_hours*SESSION.cleanup_cost>
<cfset SESSION.cleanup_materials_rate  = 0>
<cfset SESSION.cleanup_service_materials  = SESSION.cleanup_actualprice+SESSION.cleanup_materials_rate >
<cfset SESSION.cleanup_times  = get_service_info.cleanup_times>
<cfset SESSION.cleanup_actual_extended  = SESSION.cleanup_times* #NumberFormat(SESSION.cleanup_service_materials,"999999.99")#>
<cfset SESSION.cleanup_actual_extended  =  #ROUND(SESSION.cleanup_actual_extended)#>
<cfset SESSION.cleanup_total_hours = SESSION.cleanup_hoursA*SESSION.cleanup_times>
<cfset SESSION.cleanup_overtime_adjustment =
SESSION.cleanup_actual_extended -
(SESSION.cleanup_total_hours*0.10* SESSION.cleanup_cost)+
(SESSION.cleanup_total_hours*0.10* SESSION.cleanup_cost*1.5)>
<cfset SESSION.cleanup_contract_price = SESSION.cleanup_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_preg_service_rate = 20.50>  --->
<cfset SESSION.turf_preg_qty  = get_service_info.turf_preg_qty >
<cfset SESSION.turf_preg_cost  = get_service_info.turf_preg_cost>
<cfset SESSION.turf_preg_rate = get_service_info.turf_preg_rate>
<cfset SESSION.turf_preg_hours  = SESSION.turf_preg_qty/SESSION.turf_preg_rate>
<cfset SESSION.turf_preg_hoursA = #NumberFormat(SESSION.turf_preg_hours,"999,999.9")#>
<cfset SESSION.turf_preg_actualprice  = SESSION.turf_preg_hours*SESSION.turf_preg_cost>
<cfset SESSION.turf_preg_materials_rate  = get_materials_info.turf_preg_materials_rate>
<cfif  IsDefined("form.turf_preg_qty")>
  <CFSET turf_preg_qty_post  =form.turf_preg_qty>
</cfif>
<cfset SESSION.turf_preg_materials_qty_actual=(get_service_info.turf_preg_qty /207)>
<cfset SESSION.turf_preg_materials_qty_actual=#NumberFormat(SESSION.turf_preg_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_preg_materials_qty")    AND  get_materials_info.turf_preg_materials_qty  EQ SESSION.turf_preg_materials_qty_actual  AND SESSION.turf_preg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif   IsDefined("form.turf_preg_materials_qty")    AND get_materials_info.turf_preg_materials_qty  EQ form.turf_preg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")       AND   IsDefined("turf_preg_qty_pre")   AND   IsDefined("turf_preg_qty_post") AND turf_preg_qty_pre NEQ  turf_preg_qty_post>
  <cfset SESSION.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif  IsDefined("form.turf_preg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_preg_materials_qty=(form.turf_preg_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_preg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
</cfif>
<cfset SESSION.turf_preg_materials_qty = #NumberFormat(SESSION.turf_preg_materials_qty,"999999.99")#>
<cfset SESSION.turf_preg_materials_actualprice = SESSION.turf_preg_materials_rate*SESSION.turf_preg_materials_qty>
<cfset SESSION.turf_preg_materials_actualprice = #NumberFormat(SESSION.turf_preg_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_preg_service_materials  = SESSION.turf_preg_actualprice+SESSION.turf_preg_materials_actualprice >
<cfset SESSION.turf_preg_times  = get_service_info.turf_preg_times>
<cfset SESSION.turf_preg_actual_extended  = SESSION.turf_preg_times* #NumberFormat(SESSION.turf_preg_service_materials,"999999.99")#>
<cfset SESSION.turf_preg_actual_extended  =  #ROUND(SESSION.turf_preg_actual_extended)#>
<cfset SESSION.turf_preg_total_hours = SESSION.turf_preg_hoursA*SESSION.turf_preg_times>
<cfset SESSION.turf_preg_overtime_adjustment =
SESSION.turf_preg_actual_extended -
(SESSION.turf_preg_total_hours*0.10* SESSION.turf_preg_cost)+
(SESSION.turf_preg_total_hours*0.10* SESSION.turf_preg_cost*1.5)>
<cfset SESSION.turf_preg_contract_price = SESSION.turf_preg_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_prel_service_rate = 20.50>  --->
<cfset SESSION.turf_prel_qty  = get_service_info.turf_prel_qty >
<cfset SESSION.turf_prel_cost  = get_service_info.turf_prel_cost>
<cfset SESSION.turf_prel_rate = get_service_info.turf_prel_rate>
<cfset SESSION.turf_prel_hours  = SESSION.turf_prel_qty/SESSION.turf_prel_rate>
<cfset SESSION.turf_prel_hoursA = #NumberFormat(SESSION.turf_prel_hours,"999,999.9")#>
<cfset SESSION.turf_prel_actualprice  = SESSION.turf_prel_hours*SESSION.turf_prel_cost>
<cfset SESSION.turf_prel_materials_rate  = get_materials_info.turf_prel_materials_rate>
<cfif  IsDefined("form.turf_prel_qty")>
  <CFSET turf_prel_qty_post  =form.turf_prel_qty>
</cfif>
<cfset SESSION.turf_prel_materials_qty_actual=(get_service_info.turf_prel_qty /10000)>
<cfset SESSION.turf_prel_materials_qty_actual=#NumberFormat(SESSION.turf_prel_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_prel_materials_qty")    AND  get_materials_info.turf_prel_materials_qty  EQ SESSION.turf_prel_materials_qty_actual  AND SESSION.turf_prel_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif   IsDefined("form.turf_prel_materials_qty")    AND get_materials_info.turf_prel_materials_qty  EQ form.turf_prel_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_prel_qty_pre")   AND   IsDefined("turf_prel_qty_post") AND turf_prel_qty_pre NEQ  turf_prel_qty_post>
  <cfset SESSION.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif  IsDefined("form.turf_prel_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_prel_materials_qty=(form.turf_prel_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_prel_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
</cfif>
<cfset SESSION.turf_prel_materials_qty = #NumberFormat(SESSION.turf_prel_materials_qty,"999999.99")#>
<cfset SESSION.turf_prel_materials_actualprice = SESSION.turf_prel_materials_rate*SESSION.turf_prel_materials_qty>
<cfset SESSION.turf_prel_materials_actualprice = #NumberFormat(SESSION.turf_prel_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_prel_service_materials  = SESSION.turf_prel_actualprice+SESSION.turf_prel_materials_actualprice >
<cfset SESSION.turf_prel_times  = get_service_info.turf_prel_times>
<cfset SESSION.turf_prel_actual_extended  = SESSION.turf_prel_times* #NumberFormat(SESSION.turf_prel_service_materials,"999999.99")#>
<cfset SESSION.turf_prel_actual_extended  =  #ROUND(SESSION.turf_prel_actual_extended)#>
<cfset SESSION.turf_prel_total_hours = SESSION.turf_prel_hoursA*SESSION.turf_prel_times>
<cfset SESSION.turf_prel_overtime_adjustment =
SESSION.turf_prel_actual_extended -
(SESSION.turf_prel_total_hours*0.10* SESSION.turf_prel_cost)+
(SESSION.turf_prel_total_hours*0.10* SESSION.turf_prel_cost*1.5)>
<cfset SESSION.turf_prel_contract_price = SESSION.turf_prel_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_post_service_rate = 20.50>  --->
<cfset SESSION.turf_post_qty  = get_service_info.turf_post_qty >
<cfset SESSION.turf_post_cost  = get_service_info.turf_post_cost>
<cfset SESSION.turf_post_rate = get_service_info.turf_post_rate>
<cfset SESSION.turf_post_hours  = SESSION.turf_post_qty/SESSION.turf_post_rate>
<cfset SESSION.turf_post_hoursA = #NumberFormat(SESSION.turf_post_hours,"999,999.9")#>
<cfset SESSION.turf_post_actualprice  = SESSION.turf_post_hours*SESSION.turf_post_cost>
<cfset SESSION.turf_post_materials_rate  = get_materials_info.turf_post_materials_rate>
<cfif  IsDefined("form.turf_post_qty")>
  <CFSET turf_post_qty_post  =form.turf_post_qty>
</cfif>
<cfset SESSION.turf_post_materials_qty_actual=(get_service_info.turf_post_qty /580)>
<cfset SESSION.turf_post_materials_qty_actual=#NumberFormat(SESSION.turf_post_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_post_materials_qty")    AND  get_materials_info.turf_post_materials_qty  EQ SESSION.turf_post_materials_qty_actual  AND SESSION.turf_post_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif   IsDefined("form.turf_post_materials_qty")    AND get_materials_info.turf_post_materials_qty  EQ form.turf_post_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_post_qty_pre")   AND   IsDefined("turf_post_qty_post") AND turf_post_qty_pre NEQ  turf_post_qty_post>
  <cfset SESSION.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif  IsDefined("form.turf_post_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_post_materials_qty=(form.turf_post_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_post_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
</cfif>
<cfset SESSION.turf_post_materials_qty = #NumberFormat(SESSION.turf_post_materials_qty,"999999.99")#>
<cfset SESSION.turf_post_materials_actualprice = SESSION.turf_post_materials_rate*SESSION.turf_post_materials_qty>
<cfset SESSION.turf_post_materials_actualprice = #NumberFormat(SESSION.turf_post_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_post_service_materials  = SESSION.turf_post_actualprice+SESSION.turf_post_materials_actualprice >
<cfset SESSION.turf_post_times  = get_service_info.turf_post_times>
<cfset SESSION.turf_post_actual_extended  = SESSION.turf_post_times* #NumberFormat(SESSION.turf_post_service_materials,"999999.99")#>
<cfset SESSION.turf_post_actual_extended  =  #ROUND(SESSION.turf_post_actual_extended)#>
<cfset SESSION.turf_post_total_hours = SESSION.turf_post_hoursA*SESSION.turf_post_times>
<cfset SESSION.turf_post_overtime_adjustment =
SESSION.turf_post_actual_extended -
(SESSION.turf_post_total_hours*0.10* SESSION.turf_post_cost)+
(SESSION.turf_post_total_hours*0.10* SESSION.turf_post_cost*1.5)>
<cfset SESSION.turf_post_contract_price = SESSION.turf_post_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_fert_service_rate = 20.50>  --->
<cfset SESSION.turf_fert_qty  = get_service_info.turf_fert_qty >
<cfset SESSION.turf_fert_cost  = get_service_info.turf_fert_cost>
<cfset SESSION.turf_fert_rate = get_service_info.turf_fert_rate>
<cfset SESSION.turf_fert_hours  = SESSION.turf_fert_qty/SESSION.turf_fert_rate>
<cfset SESSION.turf_fert_hoursA = #NumberFormat(SESSION.turf_fert_hours,"999,999.9")#>
<cfset SESSION.turf_fert_actualprice  = SESSION.turf_fert_hours*SESSION.turf_fert_cost>
<cfset SESSION.turf_fert_materials_rate  = get_materials_info.turf_fert_materials_rate>
<cfif  IsDefined("form.turf_fert_qty")>
  <CFSET turf_fert_qty_post  =form.turf_fert_qty>
</cfif>
<cfset SESSION.turf_fert_materials_qty_actual=(get_service_info.turf_fert_qty /240)>
<cfset SESSION.turf_fert_materials_qty_actual=#NumberFormat(SESSION.turf_fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_fert_materials_qty")    AND  get_materials_info.turf_fert_materials_qty  EQ SESSION.turf_fert_materials_qty_actual  AND SESSION.turf_fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif   IsDefined("form.turf_fert_materials_qty")    AND get_materials_info.turf_fert_materials_qty  EQ form.turf_fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("turf_fert_qty_pre")   AND   IsDefined("turf_fert_qty_post") AND turf_fert_qty_pre NEQ  turf_fert_qty_post>
  <cfset SESSION.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif  IsDefined("form.turf_fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_fert_materials_qty=(form.turf_fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
</cfif>
<cfset SESSION.turf_fert_materials_qty = #NumberFormat(SESSION.turf_fert_materials_qty,"999999.99")#>
<cfset SESSION.turf_fert_materials_actualprice = SESSION.turf_fert_materials_rate*SESSION.turf_fert_materials_qty>
<cfset SESSION.turf_fert_materials_actualprice = #NumberFormat(SESSION.turf_fert_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_fert_service_materials  = SESSION.turf_fert_actualprice+SESSION.turf_fert_materials_actualprice >
<cfset SESSION.turf_fert_times  = get_service_info.turf_fert_times>
<cfset SESSION.turf_fert_actual_extended  = SESSION.turf_fert_times* #NumberFormat(SESSION.turf_fert_service_materials,"999999.99")#>
<cfset SESSION.turf_fert_actual_extended  =  #ROUND(SESSION.turf_fert_actual_extended)#>
<cfset SESSION.turf_fert_total_hours = SESSION.turf_fert_hoursA*SESSION.turf_fert_times>
<cfset SESSION.turf_fert_overtime_adjustment =
SESSION.turf_fert_actual_extended -
(SESSION.turf_fert_total_hours*0.10* SESSION.turf_fert_cost)+
(SESSION.turf_fert_total_hours*0.10* SESSION.turf_fert_cost*1.5)>
<cfset SESSION.turf_fert_contract_price = SESSION.turf_fert_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_lime_service_rate = 20.50>  --->
<cfset SESSION.turf_lime_qty  = get_service_info.turf_lime_qty >
<cfset SESSION.turf_lime_cost  = get_service_info.turf_lime_cost>
<cfset SESSION.turf_lime_rate = get_service_info.turf_lime_rate>
<cfset SESSION.turf_lime_hours  = SESSION.turf_lime_qty/SESSION.turf_lime_rate>
<cfset SESSION.turf_lime_hoursA = #NumberFormat(SESSION.turf_lime_hours,"999,999.9")#>
<cfset SESSION.turf_lime_actualprice  = SESSION.turf_lime_hours*SESSION.turf_lime_cost>
<cfset SESSION.turf_lime_materials_rate  = get_materials_info.turf_lime_materials_rate>
<cfif  IsDefined("form.turf_lime_qty")>
  <CFSET turf_lime_qty_post  =form.turf_lime_qty>
</cfif>
<cfset SESSION.turf_lime_materials_qty_actual=(get_service_info.turf_lime_qty /40)>
<cfset SESSION.turf_lime_materials_qty_actual=#NumberFormat(SESSION.turf_lime_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_lime_materials_qty")    AND  get_materials_info.turf_lime_materials_qty  EQ SESSION.turf_lime_materials_qty_actual  AND SESSION.turf_lime_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif   IsDefined("form.turf_lime_materials_qty")    AND get_materials_info.turf_lime_materials_qty  EQ form.turf_lime_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_lime_qty_pre")   AND   IsDefined("turf_lime_qty_post") AND turf_lime_qty_pre NEQ  turf_lime_qty_post>
  <cfset SESSION.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif  IsDefined("form.turf_lime_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_lime_materials_qty=(form.turf_lime_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_lime_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
</cfif>
<cfset SESSION.turf_lime_materials_qty = #NumberFormat(SESSION.turf_lime_materials_qty,"999999.99")#>
<cfset SESSION.turf_lime_materials_actualprice = SESSION.turf_lime_materials_rate*SESSION.turf_lime_materials_qty>
<cfset SESSION.turf_lime_materials_actualprice = #NumberFormat(SESSION.turf_lime_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_lime_service_materials  = SESSION.turf_lime_actualprice+SESSION.turf_lime_materials_actualprice >
<cfset SESSION.turf_lime_times  = get_service_info.turf_lime_times>
<cfset SESSION.turf_lime_actual_extended  = SESSION.turf_lime_times* #NumberFormat(SESSION.turf_lime_service_materials,"999999.99")#>
<cfset SESSION.turf_lime_actual_extended  =  #ROUND(SESSION.turf_lime_actual_extended)#>
<cfset SESSION.turf_lime_total_hours = SESSION.turf_lime_hoursA*SESSION.turf_lime_times>
<cfset SESSION.turf_lime_overtime_adjustment =
SESSION.turf_lime_actual_extended -
(SESSION.turf_lime_total_hours*0.10* SESSION.turf_lime_cost)+
(SESSION.turf_lime_total_hours*0.10* SESSION.turf_lime_cost*1.5)>
<cfset SESSION.turf_lime_contract_price = SESSION.turf_lime_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Aer_H_service_rate = 20.50>  --->
<cfset SESSION.Turf_Aer_H_qty  = get_service_info.Turf_Aer_H_qty >
<cfset SESSION.Turf_Aer_H_cost  = get_service_info.Turf_Aer_H_cost>
<cfset SESSION.Turf_Aer_H_rate = get_service_info.Turf_Aer_H_rate>
<cfset SESSION.Turf_Aer_H_hours  = SESSION.Turf_Aer_H_qty/SESSION.Turf_Aer_H_rate>
<cfset SESSION.Turf_Aer_H_hoursA = #NumberFormat(SESSION.Turf_Aer_H_hours,"999,999.9")#>
<cfset SESSION.Turf_Aer_H_actualprice  = SESSION.Turf_Aer_H_hours*SESSION.Turf_Aer_H_cost>
<cfset SESSION.Turf_Aer_H_materials_rate  = 0>
<cfset SESSION.Turf_Aer_H_materials_qty = 0>
<cfset SESSION.Turf_Aer_H_materials_actualprice = SESSION.Turf_Aer_H_materials_rate*SESSION.Turf_Aer_H_materials_qty>
<cfset SESSION.Turf_Aer_H_materials_actualprice = #NumberFormat(SESSION.Turf_Aer_H_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Aer_H_service_materials  = SESSION.Turf_Aer_H_actualprice+SESSION.Turf_Aer_H_materials_actualprice >
<cfset SESSION.Turf_Aer_H_times  = get_service_info.Turf_Aer_H_times>
<cfset SESSION.Turf_Aer_H_actual_extended  = SESSION.Turf_Aer_H_times* #NumberFormat(SESSION.Turf_Aer_H_service_materials,"999999.99")#>
<cfset SESSION.Turf_Aer_H_actual_extended  =  #ROUND(SESSION.Turf_Aer_H_actual_extended)#>
<cfset SESSION.Turf_Aer_H_total_hours = SESSION.Turf_Aer_H_hoursA*SESSION.Turf_Aer_H_times>
<cfset SESSION.Turf_Aer_H_overtime_adjustment =
SESSION.Turf_Aer_H_actual_extended -
(SESSION.Turf_Aer_H_total_hours*0.10* SESSION.Turf_Aer_H_cost)+
(SESSION.Turf_Aer_H_total_hours*0.10* SESSION.Turf_Aer_H_cost*1.5)>
<cfset SESSION.Turf_Aer_H_contract_price = SESSION.Turf_Aer_H_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Aer_T_service_rate = 20.50>  --->
<cfset SESSION.Turf_Aer_T_qty  = get_service_info.Turf_Aer_T_qty >
<cfset SESSION.Turf_Aer_T_cost  = get_service_info.Turf_Aer_T_cost>
<cfset SESSION.Turf_Aer_T_rate = get_service_info.Turf_Aer_T_rate>
<cfset SESSION.Turf_Aer_T_hours  = SESSION.Turf_Aer_T_qty/SESSION.Turf_Aer_T_rate>
<cfset SESSION.Turf_Aer_T_hoursA = #NumberFormat(SESSION.Turf_Aer_T_hours,"999999.9")#>
<cfset SESSION.Turf_Aer_T_actualprice  = SESSION.Turf_Aer_T_hours*SESSION.Turf_Aer_T_cost>
<cfset SESSION.Turf_Aer_T_materials_rate  = 0>
<cfset SESSION.Turf_Aer_T_materials_qty =0>
<cfset SESSION.Turf_Aer_T_materials_actualprice = SESSION.Turf_Aer_T_materials_rate*SESSION.Turf_Aer_T_materials_qty>
<cfset SESSION.Turf_Aer_T_materials_actualprice = #NumberFormat(SESSION.Turf_Aer_T_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Aer_T_service_materials  = SESSION.Turf_Aer_T_actualprice+SESSION.Turf_Aer_T_materials_actualprice >
<cfset SESSION.Turf_Aer_T_times  = get_service_info.Turf_Aer_T_times>
<cfset SESSION.Turf_Aer_T_actual_extended  = SESSION.Turf_Aer_T_times* #NumberFormat(SESSION.Turf_Aer_T_service_materials,"999999.99")#>
<cfset SESSION.Turf_Aer_T_actual_extended  =  #ROUND(SESSION.Turf_Aer_T_actual_extended)#>
<cfset SESSION.Turf_Aer_T_total_hours = SESSION.Turf_Aer_T_hoursA*SESSION.Turf_Aer_T_times>
<cfset SESSION.Turf_Aer_T_overtime_adjustment =
SESSION.Turf_Aer_T_actual_extended -
(SESSION.Turf_Aer_T_total_hours*0.10* SESSION.Turf_Aer_T_cost)+
(SESSION.Turf_Aer_T_total_hours*0.10* SESSION.Turf_Aer_T_cost*1.5)>
<cfset SESSION.Turf_Aer_T_contract_price = SESSION.Turf_Aer_T_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Seed_service_rate = 20.50>  --->
<cfset SESSION.Turf_Seed_qty  = get_service_info.Turf_Seed_qty >
<cfset SESSION.Turf_Seed_cost  = get_service_info.Turf_Seed_cost>
<cfset SESSION.Turf_Seed_rate = get_service_info.Turf_Seed_rate>
<cfset SESSION.Turf_Seed_hours  = SESSION.Turf_Seed_qty/SESSION.Turf_Seed_rate>
<cfset SESSION.Turf_Seed_hoursA = #NumberFormat(SESSION.Turf_Seed_hours,"999999.9")#>
<cfset SESSION.Turf_Seed_actualprice  = SESSION.Turf_Seed_hours*SESSION.Turf_Seed_cost>
<cfset SESSION.Turf_Seed_materials_rate  = get_materials_info.Turf_Seed_materials_rate>
<!---<cfset SESSION.Turf_Seed_materials_qty = get_materials_info.Turf_Seed_materials_qty>
<cfset SESSION.Turf_Seed_materials_qty=(get_service_info.Turf_Seed_qty /250)>
<cfset SESSION.Turf_Seed_materials_qty = #NumberFormat(SESSION.Turf_Seed_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.turf_seed_qty")>
  <CFSET turf_seed_qty_post  =form.turf_seed_qty>
</cfif>
<cfset SESSION.turf_seed_materials_qty_actual=(get_service_info.turf_seed_qty /250)>
<cfset SESSION.turf_seed_materials_qty_actual=#NumberFormat(SESSION.turf_seed_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_seed_materials_qty")    AND  get_materials_info.turf_seed_materials_qty  EQ SESSION.turf_seed_materials_qty_actual  AND SESSION.turf_seed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif   IsDefined("form.turf_seed_materials_qty")    AND get_materials_info.turf_seed_materials_qty  EQ form.turf_seed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_seed_qty_pre")   AND   IsDefined("turf_seed_qty_post") AND turf_seed_qty_pre NEQ  turf_seed_qty_post>
  <cfset SESSION.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif  IsDefined("form.turf_seed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_seed_materials_qty=(form.turf_seed_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_seed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
</cfif>
<cfset SESSION.turf_seed_materials_qty = #NumberFormat(SESSION.turf_seed_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Seed_materials_actualprice = SESSION.Turf_Seed_materials_rate*SESSION.Turf_Seed_materials_qty>
<cfset SESSION.Turf_Seed_materials_actualprice = #NumberFormat(SESSION.Turf_Seed_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Seed_service_materials  = SESSION.Turf_Seed_actualprice+SESSION.Turf_Seed_materials_actualprice >
<cfset SESSION.Turf_Seed_times  = get_service_info.Turf_Seed_times>
<cfset SESSION.Turf_Seed_actual_extended  = SESSION.Turf_Seed_times* #NumberFormat(SESSION.Turf_Seed_service_materials,"999999.99")#>
<cfset SESSION.Turf_Seed_actual_extended  =  #ROUND(SESSION.Turf_Seed_actual_extended)#>
<cfset SESSION.Turf_Seed_total_hours = SESSION.Turf_Seed_hoursA*SESSION.Turf_Seed_times>
<cfset SESSION.Turf_Seed_overtime_adjustment =
SESSION.Turf_Seed_actual_extended -
(SESSION.Turf_Seed_total_hours*0.10* SESSION.Turf_Seed_cost)+
(SESSION.Turf_Seed_total_hours*0.10* SESSION.Turf_Seed_cost*1.5)>
<cfset SESSION.Turf_Seed_contract_price = SESSION.Turf_Seed_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Pruning_TP_service_rate = 20.50>  --->
<cfset SESSION.Pruning_TP_qty  = get_service_info.Pruning_TP_qty >
<cfset SESSION.Pruning_TP_cost  = get_service_info.Pruning_TP_cost>
<cfset SESSION.Pruning_TP_rate = get_service_info.Pruning_TP_rate>
<cfset SESSION.Pruning_TP_hours  = SESSION.Pruning_TP_qty/SESSION.Pruning_TP_rate>
<cfset SESSION.Pruning_TP_hoursA = #NumberFormat(SESSION.Pruning_TP_hours,"999999.9")#>
<cfset SESSION.Pruning_TP_actualprice  = SESSION.Pruning_TP_hours*SESSION.Pruning_TP_cost>
<cfset SESSION.Pruning_TP_materials_rate  = 0>
<cfset SESSION.Pruning_TP_materials_qty =0>
<cfset SESSION.Pruning_TP_materials_actualprice = SESSION.Pruning_TP_materials_rate*SESSION.Pruning_TP_materials_qty>
<cfset SESSION.Pruning_TP_materials_actualprice = #NumberFormat(SESSION.Pruning_TP_materials_actualprice,"999999.99")#>
<cfset SESSION.Pruning_TP_service_materials  = SESSION.Pruning_TP_actualprice+SESSION.Pruning_TP_materials_actualprice >
<cfset SESSION.Pruning_TP_times  = get_service_info.Pruning_TP_times>
<cfset SESSION.Pruning_TP_actual_extended  = SESSION.Pruning_TP_times* #NumberFormat(SESSION.Pruning_TP_service_materials,"999999.99")#>
<cfset SESSION.Pruning_TP_actual_extended  =  #ROUND(SESSION.Pruning_TP_actual_extended)#>
<cfset SESSION.Pruning_TP_total_hours = SESSION.Pruning_TP_hoursA*SESSION.Pruning_TP_times>
<cfset SESSION.Pruning_TP_overtime_adjustment =
SESSION.Pruning_TP_actual_extended -
(SESSION.Pruning_TP_total_hours*0.10* SESSION.Pruning_TP_cost)+
(SESSION.Pruning_TP_total_hours*0.10* SESSION.Pruning_TP_cost*1.5)>
<cfset SESSION.Pruning_TP_contract_price = SESSION.Pruning_TP_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Pruning_S_service_rate = 20.50>  --->
<cfset SESSION.Pruning_S_qty  = get_service_info.Pruning_S_qty >
<cfset SESSION.Pruning_S_cost  = get_service_info.Pruning_S_cost>
<cfset SESSION.Pruning_S_rate = get_service_info.Pruning_S_rate>
<cfset SESSION.Pruning_S_hours  = SESSION.Pruning_S_qty/SESSION.Pruning_S_rate>
<cfset SESSION.Pruning_S_hoursA = #NumberFormat(SESSION.Pruning_S_hours,"999999.9")#>
<cfset SESSION.Pruning_S_actualprice  = SESSION.Pruning_S_hours*SESSION.Pruning_S_cost>
<cfset SESSION.Pruning_S_materials_rate  =0>
<cfset SESSION.Pruning_S_materials_qty = 0>
<cfset SESSION.Pruning_S_materials_actualprice = SESSION.Pruning_S_materials_rate*SESSION.Pruning_S_materials_qty>
<cfset SESSION.Pruning_S_materials_actualprice = #NumberFormat(SESSION.Pruning_S_materials_actualprice,"999999.99")#>
<cfset SESSION.Pruning_S_service_materials  = SESSION.Pruning_S_actualprice+SESSION.Pruning_S_materials_actualprice >
<cfset SESSION.Pruning_S_times  = get_service_info.Pruning_S_times>
<cfset SESSION.Pruning_S_actual_extended  = SESSION.Pruning_S_times* #NumberFormat(SESSION.Pruning_S_service_materials,"999999.99")#>
<cfset SESSION.Pruning_S_actual_extended  =  #ROUND(SESSION.Pruning_S_actual_extended)#>
<cfset SESSION.Pruning_S_total_hours = SESSION.Pruning_S_hoursA*SESSION.Pruning_S_times>
<cfset SESSION.Pruning_S_overtime_adjustment =
SESSION.Pruning_S_actual_extended -
(SESSION.Pruning_S_total_hours*0.10* SESSION.Pruning_S_cost)+
(SESSION.Pruning_S_total_hours*0.10* SESSION.Pruning_S_cost*1.5)>
<cfset SESSION.Pruning_S_contract_price = SESSION.Pruning_S_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_Fert_service_rate = 20.50>  --->
<cfset SESSION.TS_Fert_qty  = get_service_info.TS_Fert_qty >
<cfset SESSION.TS_Fert_cost  = get_service_info.TS_Fert_cost>
<cfset SESSION.TS_Fert_rate = get_service_info.TS_Fert_rate>
<cfset SESSION.TS_Fert_hours  = SESSION.TS_Fert_qty/SESSION.TS_Fert_rate>
<cfset SESSION.TS_Fert_hoursA = #NumberFormat(SESSION.TS_Fert_hours,"999999.9")#>
<cfset SESSION.TS_Fert_actualprice  = SESSION.TS_Fert_hours*SESSION.TS_Fert_cost>
<cfset SESSION.TS_Fert_materials_rate  = get_materials_info.TS_Fert_materials_rate>
<!--- <cfset SESSION.TS_Fert_materials_qty = get_materials_info.TS_Fert_materials_qty> --->
<!---<cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.33)>
<cfset SESSION.TS_Fert_materials_qty = #NumberFormat(SESSION.TS_Fert_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.TS_Fert_qty")>
  <CFSET TS_Fert_qty_post  =form.TS_Fert_qty>
</cfif>
<cfset SESSION.TS_Fert_materials_qty_actual=(get_service_info.TS_Fert_qty /33.3)>
<cfset SESSION.TS_Fert_materials_qty_actual=#NumberFormat(SESSION.TS_Fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Fert_materials_qty")    AND  get_materials_info.TS_Fert_materials_qty  EQ SESSION.TS_Fert_materials_qty_actual  AND SESSION.TS_Fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif   IsDefined("form.TS_Fert_materials_qty")    AND get_materials_info.TS_Fert_materials_qty  EQ form.TS_Fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Fert_qty_pre")   AND   IsDefined("TS_Fert_qty_post") AND TS_Fert_qty_pre NEQ  TS_Fert_qty_post>
  <cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif  IsDefined("form.TS_Fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Fert_materials_qty=(form.TS_Fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
</cfif>
<cfset SESSION.TS_Fert_materials_qty = #NumberFormat(SESSION.TS_Fert_materials_qty,"999999.99")#>
<cfset SESSION.TS_Fert_materials_actualprice = SESSION.TS_Fert_materials_rate*SESSION.TS_Fert_materials_qty>
<cfset SESSION.TS_Fert_materials_actualprice = #NumberFormat(SESSION.TS_Fert_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_Fert_service_materials  = SESSION.TS_Fert_actualprice+SESSION.TS_Fert_materials_actualprice >
<cfset SESSION.TS_Fert_times  = get_service_info.TS_Fert_times>
<cfset SESSION.TS_Fert_actual_extended  = SESSION.TS_Fert_times* #NumberFormat(SESSION.TS_Fert_service_materials,"999999.99")#>
<cfset SESSION.TS_Fert_actual_extended  =  #ROUND(SESSION.TS_Fert_actual_extended)#>
<cfset SESSION.TS_Fert_total_hours = SESSION.TS_Fert_hoursA*SESSION.TS_Fert_times>
<cfset SESSION.TS_Fert_overtime_adjustment =
SESSION.TS_Fert_actual_extended -
(SESSION.TS_Fert_total_hours*0.10* SESSION.TS_Fert_cost)+
(SESSION.TS_Fert_total_hours*0.10* SESSION.TS_Fert_cost*1.5)>
<cfset SESSION.TS_Fert_contract_price = SESSION.TS_Fert_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_Insect_service_rate = 20.50>  --->
<cfset SESSION.TS_Insect_qty  = get_service_info.TS_Insect_qty >
<cfset SESSION.TS_Insect_cost  = get_service_info.TS_Insect_cost>
<cfset SESSION.TS_Insect_rate = get_service_info.TS_Insect_rate>
<cfset SESSION.TS_Insect_hours  = SESSION.TS_Insect_qty/SESSION.TS_Insect_rate>
<cfset SESSION.TS_Insect_hoursA = #NumberFormat(SESSION.TS_Insect_hours,"999999.9")#>
<cfset SESSION.TS_Insect_actualprice  = SESSION.TS_Insect_hours*SESSION.TS_Insect_cost>
<cfset SESSION.TS_Insect_materials_rate  = get_materials_info.TS_Insect_materials_rate>
<!--- <cfset SESSION.TS_Insect_materials_qty = get_materials_info.TS_Insect_materials_qty> --->
<!---<cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
<cfset SESSION.TS_Insect_materials_qty = #NumberFormat(SESSION.TS_Insect_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.TS_Insect_qty")>
  <CFSET TS_Insect_qty_post  =form.TS_Insect_qty>
</cfif>
<cfset SESSION.TS_Insect_materials_qty_actual=(get_service_info.TS_Insect_qty*2)>
<cfset SESSION.TS_Insect_materials_qty_actual=#NumberFormat(SESSION.TS_Insect_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Insect_materials_qty")    AND  get_materials_info.TS_Insect_materials_qty  EQ SESSION.TS_Insect_materials_qty_actual  AND SESSION.TS_Insect_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif   IsDefined("form.TS_Insect_materials_qty")    AND get_materials_info.TS_Insect_materials_qty  EQ form.TS_Insect_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Insect_qty_pre")   AND   IsDefined("TS_Insect_qty_post") AND TS_Insect_qty_pre NEQ  TS_Insect_qty_post>
  <cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif  IsDefined("form.TS_Insect_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Insect_materials_qty=(form.TS_Insect_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Insect_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
</cfif>
<cfset SESSION.TS_Insect_materials_qty = #NumberFormat(SESSION.TS_Insect_materials_qty,"999999.99")#>
<cfset SESSION.TS_Insect_materials_actualprice = SESSION.TS_Insect_materials_rate*SESSION.TS_Insect_materials_qty>
<cfset SESSION.TS_Insect_materials_actualprice = #NumberFormat(SESSION.TS_Insect_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_Insect_service_materials  = SESSION.TS_Insect_actualprice+SESSION.TS_Insect_materials_actualprice >
<cfset SESSION.TS_Insect_times  = get_service_info.TS_Insect_times>
<cfset SESSION.TS_Insect_actual_extended  = SESSION.TS_Insect_times* #NumberFormat(SESSION.TS_Insect_service_materials,"999999.99")#>
<cfset SESSION.TS_Insect_actual_extended  =  #ROUND(SESSION.TS_Insect_actual_extended)#>
<cfset SESSION.TS_Insect_total_hours = SESSION.TS_Insect_hoursA*SESSION.TS_Insect_times>
<cfset SESSION.TS_Insect_overtime_adjustment =
SESSION.TS_Insect_actual_extended -
(SESSION.TS_Insect_total_hours*0.10* SESSION.TS_Insect_cost)+
(SESSION.TS_Insect_total_hours*0.10* SESSION.TS_Insect_cost*1.5)>
<cfset SESSION.TS_Insect_contract_price = SESSION.TS_Insect_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_pre_service_rate = 20.50>  --->
<cfset SESSION.Mulch_pre_qty  = get_service_info.Mulch_pre_qty >
<cfset SESSION.Mulch_pre_cost  = get_service_info.Mulch_pre_cost>
<cfset SESSION.Mulch_pre_rate = get_service_info.Mulch_pre_rate>
<cfset SESSION.Mulch_pre_hours  = SESSION.Mulch_pre_qty/SESSION.Mulch_pre_rate>
<cfset SESSION.Mulch_pre_hoursA = #NumberFormat(SESSION.Mulch_pre_hours,"999999.9")#>
<cfset SESSION.Mulch_pre_actualprice  = SESSION.Mulch_pre_hours*SESSION.Mulch_pre_cost>
<cfset SESSION.Mulch_pre_materials_rate  = get_materials_info.Mulch_pre_materials_rate>
<!--- <cfset SESSION.Mulch_pre_materials_qty = get_materials_info.Mulch_pre_materials_qty> --->
<!---<cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
<cfset SESSION.Mulch_pre_materials_qty = #NumberFormat(SESSION.Mulch_pre_materials_qty,"999999.99")#>--->
<cfif  IsDefined("form.Mulch_pre_qty")>
  <CFSET Mulch_pre_qty_post  =form.Mulch_pre_qty>
</cfif>
<cfset SESSION.Mulch_pre_materials_qty_actual=(get_service_info.Mulch_pre_qty /8000)>
<cfset SESSION.Mulch_pre_materials_qty_actual=#NumberFormat(SESSION.Mulch_pre_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Mulch_pre_materials_qty")    AND  get_materials_info.Mulch_pre_materials_qty  EQ SESSION.Mulch_pre_materials_qty_actual  AND SESSION.Mulch_pre_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif   IsDefined("form.Mulch_pre_materials_qty")    AND get_materials_info.Mulch_pre_materials_qty  EQ form.Mulch_pre_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Mulch_pre_qty_pre")   AND   IsDefined("Mulch_pre_qty_post") AND Mulch_pre_qty_pre NEQ  Mulch_pre_qty_post>
  <cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif  IsDefined("form.Mulch_pre_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Mulch_pre_materials_qty=(form.Mulch_pre_materials_qty)>
  <cfelseif   NOT IsDefined("form.Mulch_pre_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
  <cfelse>
  <cfset SESSION.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
</cfif>
<cfset SESSION.Mulch_pre_materials_qty = #NumberFormat(SESSION.Mulch_pre_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_pre_materials_actualprice = SESSION.Mulch_pre_materials_rate*SESSION.Mulch_pre_materials_qty>
<cfset SESSION.Mulch_pre_materials_actualprice = #NumberFormat(SESSION.Mulch_pre_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_pre_service_materials  = SESSION.Mulch_pre_actualprice+SESSION.Mulch_pre_materials_actualprice >
<cfset SESSION.Mulch_pre_times  = get_service_info.Mulch_pre_times>
<cfset SESSION.Mulch_pre_actual_extended  = SESSION.Mulch_pre_times* #NumberFormat(SESSION.Mulch_pre_service_materials,"999999.99")#>
<cfset SESSION.Mulch_pre_actual_extended  =  #ROUND(SESSION.Mulch_pre_actual_extended)#>
<cfset SESSION.Mulch_pre_total_hours = SESSION.Mulch_pre_hoursA*SESSION.Mulch_pre_times>
<cfset SESSION.Mulch_pre_overtime_adjustment =
SESSION.Mulch_pre_actual_extended -
(SESSION.Mulch_pre_total_hours*0.10* SESSION.Mulch_pre_cost)+
(SESSION.Mulch_pre_total_hours*0.10* SESSION.Mulch_pre_cost*1.5)>
<cfset SESSION.Mulch_pre_contract_price = SESSION.Mulch_pre_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_edging_service_rate = 20.50>  --->
<cfset SESSION.Mulch_edging_qty  = get_service_info.Mulch_edging_qty >
<cfset SESSION.Mulch_edging_cost  = get_service_info.Mulch_edging_cost>
<cfset SESSION.Mulch_edging_rate = get_service_info.Mulch_edging_rate>
<cfset SESSION.Mulch_edging_hours  = SESSION.Mulch_edging_qty/SESSION.Mulch_edging_rate>
<cfset SESSION.Mulch_edging_hoursA = #NumberFormat(SESSION.Mulch_edging_hours,"999999.9")#>
<cfset SESSION.Mulch_edging_actualprice  = SESSION.Mulch_edging_hours*SESSION.Mulch_edging_cost>
<cfset SESSION.Mulch_edging_materials_rate  = 0>
<cfset SESSION.Mulch_edging_materials_qty = 0>
<cfset SESSION.Mulch_edging_materials_actualprice = SESSION.Mulch_edging_materials_rate*SESSION.Mulch_edging_materials_qty>
<cfset SESSION.Mulch_edging_service_materials  = SESSION.Mulch_edging_actualprice+SESSION.Mulch_edging_materials_actualprice >
<cfset SESSION.Mulch_edging_times  = get_service_info.Mulch_edging_times>
<cfset SESSION.Mulch_edging_actual_extended  = SESSION.Mulch_edging_times* #NumberFormat(SESSION.Mulch_edging_service_materials,"999999.99")#>
<cfset SESSION.Mulch_edging_actual_extended  =  #ROUND(SESSION.Mulch_edging_actual_extended)#>
<cfset SESSION.Mulch_edging_total_hours = SESSION.Mulch_edging_hoursA*SESSION.Mulch_edging_times>
<cfset SESSION.Mulch_edging_overtime_adjustment =
SESSION.Mulch_edging_actual_extended -
(SESSION.Mulch_edging_total_hours*0.10* SESSION.Mulch_edging_cost)+
(SESSION.Mulch_edging_total_hours*0.10* SESSION.Mulch_edging_cost*1.5)>
<cfset SESSION.Mulch_edging_contract_price = SESSION.Mulch_edging_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.mulch_s_dyed_service_rate = 20.50>  --->
<cfset SESSION.mulch_s_dyed_qty  = get_service_info.mulch_s_dyed_qty >
<cfset SESSION.mulch_s_dyed_cost  = get_service_info.mulch_s_dyed_cost>
<cfset SESSION.mulch_s_dyed_rate = get_service_info.mulch_s_dyed_rate>
<cfset SESSION.mulch_s_dyed_hours  = SESSION.mulch_s_dyed_qty/SESSION.mulch_s_dyed_rate>
<cfset SESSION.mulch_s_dyed_hoursA = #NumberFormat(SESSION.mulch_s_dyed_hours,"999999.9")#>
<cfset SESSION.mulch_s_dyed_actualprice  = SESSION.mulch_s_dyed_hours*SESSION.mulch_s_dyed_cost>
<cfset SESSION.mulch_s_dyed_materials_rate  = get_materials_info.mulch_s_dyed_materials_rate>
<!--- <cfset SESSION.mulch_s_dyed_materials_qty = get_materials_info.mulch_s_dyed_materials_qty> --->
<!---<cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
<cfset SESSION.mulch_s_dyed_materials_qty = #NumberFormat(SESSION.mulch_s_dyed_materials_qty,"999999.9")#>--->

<cfif  IsDefined("form.mulch_s_dyed_qty")>
  <CFSET mulch_s_dyed_qty_post  =form.mulch_s_dyed_qty>
</cfif>
<cfset SESSION.mulch_s_dyed_materials_qty_actual=(get_service_info.mulch_s_dyed_qty /162)>
<cfset SESSION.mulch_s_dyed_materials_qty_actual=#NumberFormat(SESSION.mulch_s_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_dyed_materials_qty")    AND  get_materials_info.mulch_s_dyed_materials_qty  EQ SESSION.mulch_s_dyed_materials_qty_actual  AND SESSION.mulch_s_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_dyed_materials_qty")    AND get_materials_info.mulch_s_dyed_materials_qty  EQ form.mulch_s_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_dyed_qty_pre")   AND   IsDefined("mulch_s_dyed_qty_post") AND mulch_s_dyed_qty_pre NEQ  mulch_s_dyed_qty_post>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_dyed_materials_qty=(form.mulch_s_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
</cfif>
<cfset SESSION.mulch_s_dyed_materials_qty = #NumberFormat(SESSION.mulch_s_dyed_materials_qty,"999999.9")#>
<cfset SESSION.mulch_s_dyed_materials_actualprice = SESSION.mulch_s_dyed_materials_rate*SESSION.mulch_s_dyed_materials_qty>
<cfset SESSION.mulch_s_dyed_materials_actualprice = #NumberFormat(SESSION.mulch_s_dyed_materials_actualprice,"999999.99")#>
<cfset SESSION.mulch_s_dyed_service_materials  = SESSION.mulch_s_dyed_actualprice+SESSION.mulch_s_dyed_materials_actualprice >
<cfset SESSION.mulch_s_dyed_times  = get_service_info.mulch_s_dyed_times>
<cfset SESSION.mulch_s_dyed_actual_extended  = SESSION.mulch_s_dyed_times* #NumberFormat(SESSION.mulch_s_dyed_service_materials,"999999.99")#>
<cfset SESSION.mulch_s_dyed_actual_extended  =  #ROUND(SESSION.mulch_s_dyed_actual_extended)#>
<cfset SESSION.mulch_s_dyed_total_hours = SESSION.mulch_s_dyed_hoursA*SESSION.mulch_s_dyed_times>
<cfset SESSION.mulch_s_dyed_overtime_adjustment =
SESSION.mulch_s_dyed_actual_extended -
(SESSION.mulch_s_dyed_total_hours*0.10* SESSION.mulch_s_dyed_cost)+
(SESSION.mulch_s_dyed_total_hours*0.10* SESSION.mulch_s_dyed_cost*1.5)>
<cfset SESSION.mulch_s_dyed_contract_price = SESSION.mulch_s_dyed_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.mulch_f_dyed_service_rate = 20.50>  --->
<cfset SESSION.mulch_f_dyed_qty  = get_service_info.mulch_f_dyed_qty >
<cfset SESSION.mulch_f_dyed_cost  = get_service_info.mulch_f_dyed_cost>
<cfset SESSION.mulch_f_dyed_rate = get_service_info.mulch_f_dyed_rate>
<cfset SESSION.mulch_f_dyed_hours  = SESSION.mulch_f_dyed_qty/SESSION.mulch_f_dyed_rate>
<cfset SESSION.mulch_f_dyed_hoursA = #NumberFormat(SESSION.mulch_f_dyed_hours,"999999.9")#>
<cfset SESSION.mulch_f_dyed_actualprice  = SESSION.mulch_f_dyed_hours*SESSION.mulch_f_dyed_cost>
<cfset SESSION.mulch_f_dyed_materials_rate  = get_materials_info.mulch_f_dyed_materials_rate>
<!--- <cfset SESSION.mulch_f_dyed_materials_qty = get_materials_info.mulch_f_dyed_materials_qty> --->
<!---<cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
<cfset SESSION.mulch_f_dyed_materials_qty = #NumberFormat(SESSION.mulch_f_dyed_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.mulch_f_dyed_qty")>
  <CFSET mulch_f_dyed_qty_post  =form.mulch_f_dyed_qty>
</cfif>
<cfset SESSION.mulch_f_dyed_materials_qty_actual=(get_service_info.mulch_f_dyed_qty /324)>
<cfset SESSION.mulch_f_dyed_materials_qty_actual=#NumberFormat(SESSION.mulch_f_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_dyed_materials_qty")    AND  get_materials_info.mulch_f_dyed_materials_qty  EQ SESSION.mulch_f_dyed_materials_qty_actual  AND SESSION.mulch_f_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_dyed_materials_qty")    AND get_materials_info.mulch_f_dyed_materials_qty  EQ form.mulch_f_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_dyed_qty_pre")   AND   IsDefined("mulch_f_dyed_qty_post") AND mulch_f_dyed_qty_pre NEQ  mulch_f_dyed_qty_post>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_dyed_materials_qty=(form.mulch_f_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
</cfif>
<cfset SESSION.mulch_f_dyed_materials_qty = #NumberFormat(SESSION.mulch_f_dyed_materials_qty,"999999.9")#>
<cfset SESSION.mulch_f_dyed_materials_actualprice = SESSION.mulch_f_dyed_materials_rate*SESSION.mulch_f_dyed_materials_qty>
<cfset SESSION.mulch_f_dyed_materials_actualprice = #NumberFormat(SESSION.mulch_f_dyed_materials_actualprice,"999999.99")#>
<cfset SESSION.mulch_f_dyed_service_materials  = SESSION.mulch_f_dyed_actualprice+SESSION.mulch_f_dyed_materials_actualprice >
<cfset SESSION.mulch_f_dyed_times  = get_service_info.mulch_f_dyed_times>
<cfset SESSION.mulch_f_dyed_actual_extended  = SESSION.mulch_f_dyed_times* #NumberFormat(SESSION.mulch_f_dyed_service_materials,"999999.99")#>
<cfset SESSION.mulch_f_dyed_actual_extended  =  #ROUND(SESSION.mulch_f_dyed_actual_extended)#>
<cfset SESSION.mulch_f_dyed_total_hours = SESSION.mulch_f_dyed_hoursA*SESSION.mulch_f_dyed_times>
<cfset SESSION.mulch_f_dyed_overtime_adjustment =
SESSION.mulch_f_dyed_actual_extended -
(SESSION.mulch_f_dyed_total_hours*0.10* SESSION.mulch_f_dyed_cost)+
(SESSION.mulch_f_dyed_total_hours*0.10* SESSION.mulch_f_dyed_cost*1.5)>
<cfset SESSION.mulch_f_dyed_contract_price = SESSION.mulch_f_dyed_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Annuals_S_service_rate = 20.50>  --->
<cfset SESSION.Annuals_S_qty  = get_service_info.Annuals_S_qty >
<cfset SESSION.Annuals_S_cost  = get_service_info.Annuals_S_cost>
<cfset SESSION.Annuals_S_rate = get_service_info.Annuals_S_rate>
<cfset SESSION.Annuals_S_hours  = SESSION.Annuals_S_qty/SESSION.Annuals_S_rate>
<cfset SESSION.Annuals_S_hoursA = #NumberFormat(SESSION.Annuals_S_hours,"999,999.9")#>
<cfset SESSION.Annuals_S_actualprice  = SESSION.Annuals_S_hours*SESSION.Annuals_S_cost>
<cfset SESSION.Annuals_S_actualprice  = 0>
<cfset SESSION.Annuals_S_materials_rate  = get_materials_info.Annuals_S_materials_rate>
<cfset SESSION.Annuals_S_materials_qty = get_materials_info.Annuals_S_materials_qty>
<cfset SESSION.Annuals_S_materials_qty=(get_service_info.Annuals_S_qty /1)>
<cfset SESSION.Annuals_S_materials_qty = #NumberFormat(SESSION.Annuals_S_materials_qty,"999999.9")#>
<cfset SESSION.Annuals_S_materials_actualprice = SESSION.Annuals_S_materials_rate*SESSION.Annuals_S_materials_qty>
<cfset SESSION.Annuals_S_materials_actualprice = #NumberFormat(SESSION.Annuals_S_materials_actualprice,"999999.99")#>
<cfset SESSION.Annuals_S_service_materials  = SESSION.Annuals_S_actualprice+SESSION.Annuals_S_materials_actualprice >
<cfset SESSION.Annuals_S_times  = get_service_info.Annuals_S_times>
<cfset SESSION.Annuals_S_actual_extended  = SESSION.Annuals_S_times* #NumberFormat(SESSION.Annuals_S_service_materials,"999999.99")#>
<cfset SESSION.Annuals_S_actual_extended  =  #ROUND(SESSION.Annuals_S_actual_extended)#>
<cfset SESSION.Annuals_S_total_hours = SESSION.Annuals_S_hoursA*SESSION.Annuals_S_times>

<!---<cfset SESSION.Annuals_S_overtime_adjustment =
SESSION.Annuals_S_actual_extended -
(SESSION.Annuals_S_total_hours*0.10* SESSION.Annuals_S_cost)+
(SESSION.Annuals_S_total_hours*0.10* SESSION.Annuals_S_cost*1.5)>--->
<cfset SESSION.Annuals_S_overtime_adjustment =SESSION.Annuals_S_actual_extended>
<cfset SESSION.Annuals_S_contract_price = SESSION.Annuals_S_overtime_adjustment >
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Annuals_F_service_rate = 20.50>  --->
<cfset SESSION.Annuals_F_qty  = get_service_info.Annuals_F_qty >
<cfset SESSION.Annuals_F_cost  = get_service_info.Annuals_F_cost>
<cfset SESSION.Annuals_F_rate = get_service_info.Annuals_F_rate>
<cfset SESSION.Annuals_F_hours  = SESSION.Annuals_F_qty/SESSION.Annuals_F_rate>
<cfset SESSION.Annuals_F_hoursA = #NumberFormat(SESSION.Annuals_F_hours,"999999.9")#>
<cfset SESSION.Annuals_F_actualprice  = SESSION.Annuals_F_hours*SESSION.Annuals_F_cost>
<cfset SESSION.Annuals_F_actualprice  = 0>
<cfset SESSION.Annuals_F_materials_rate  = get_materials_info.Annuals_F_materials_rate>
<!--- <cfset SESSION.Annuals_F_materials_qty = get_materials_info.Annuals_F_materials_qty> --->
<cfset SESSION.Annuals_F_materials_qty=(get_service_info.Annuals_F_qty /1)>
<cfset SESSION.Annuals_F_materials_qty = #NumberFormat(SESSION.Annuals_F_materials_qty,"999999.9")#>
<cfset SESSION.Annuals_F_materials_actualprice = SESSION.Annuals_F_materials_rate*SESSION.Annuals_F_materials_qty>
<cfset SESSION.Annuals_F_service_materials  = SESSION.Annuals_F_actualprice+SESSION.Annuals_F_materials_actualprice >
<cfset SESSION.Annuals_F_times  = get_service_info.Annuals_F_times>
<cfset SESSION.Annuals_F_actual_extended  = SESSION.Annuals_F_times* #NumberFormat(SESSION.Annuals_F_service_materials,"999999.99")#>
<cfset SESSION.Annuals_F_actual_extended  =  #ROUND(SESSION.Annuals_F_actual_extended)#>
<!---<cfoutput>#SESSION.Annuals_F_hoursA#</cfoutput>--->
<cfset SESSION.Annuals_F_total_hours = SESSION.Annuals_F_hoursA*SESSION.Annuals_F_times>
<!---<cfset SESSION.Annuals_F_overtime_adjustment =
SESSION.Annuals_F_actual_extended -
(SESSION.Annuals_F_total_hours*0.10* SESSION.Annuals_F_cost)+
(SESSION.Annuals_F_total_hours*0.10* SESSION.Annuals_F_cost*1.5)>--->
<cfset SESSION.Annuals_F_overtime_adjustment = SESSION.Annuals_F_actual_extended>
<cfset SESSION.Annuals_F_contract_price = SESSION.Annuals_F_overtime_adjustment >
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Irrigation_SU_service_rate = 20.50>  --->
<cfset SESSION.Irrigation_SU_qty  = get_service_info.Irrigation_SU_qty >
<cfset SESSION.Irrigation_SU_cost  = get_service_info.Irrigation_SU_cost>
<cfset SESSION.Irrigation_SU_rate = get_service_info.Irrigation_SU_rate>
<cfset SESSION.Irrigation_SU_hours  = SESSION.Irrigation_SU_qty/SESSION.Irrigation_SU_rate>
<cfset SESSION.Irrigation_SU_hoursA = #NumberFormat(SESSION.Irrigation_SU_hours,"999,999.9")#>
<cfset SESSION.Irrigation_SU_actualprice  = SESSION.Irrigation_SU_hours*SESSION.Irrigation_SU_cost>
<cfset SESSION.Irrigation_SU_materials_rate  = 0>
<cfset SESSION.Irrigation_SU_materials_qty = 0>
<cfset SESSION.Irrigation_SU_materials_actualprice = SESSION.Irrigation_SU_materials_rate*SESSION.Irrigation_SU_materials_qty>
<cfset SESSION.Irrigation_SU_service_materials  = SESSION.Irrigation_SU_actualprice+SESSION.Irrigation_SU_materials_actualprice >
<cfset SESSION.Irrigation_SU_times  = get_service_info.Irrigation_SU_times>
<cfset SESSION.Irrigation_SU_actual_extended  = SESSION.Irrigation_SU_times* #NumberFormat(SESSION.Irrigation_SU_service_materials,"999999.99")#>
<cfset SESSION.Irrigation_SU_actual_extended  =  #ROUND(SESSION.Irrigation_SU_actual_extended)#>
<cfset SESSION.Irrigation_SU_total_hours = SESSION.Irrigation_SU_hoursA*SESSION.Irrigation_SU_times>

<!--- <cfset SESSION.Irrigation_SU_overtime_adjustment =
SESSION.Irrigation_SU_actual_extended -
(SESSION.Irrigation_SU_total_hours*0.10* SESSION.Irrigation_SU_cost)+
(SESSION.Irrigation_SU_total_hours*0.10* SESSION.Irrigation_SU_cost*1.5)> --->

<!---Changed 7/25/15
<cfset SESSION.Irrigation_SU_overtime_adjustment = SESSION.Irrigation_SU_actual_extended >
<cfset SESSION.Irrigation_SU_contract_price = SESSION.Irrigation_SU_overtime_adjustment >--->
<cfset SESSION.Irrigation_SU_overtime_adjustment = 0>
<cfset SESSION.Irrigation_SU_contract_price = SESSION.Irrigation_SU_actual_extended >

<!---<cfset SESSION.Irrigation_SU_overtime_adjustment = SESSION.Irrigation_SU_actual_extended>
<cfset SESSION.Irrigation_SU_contract_price = SESSION.Irrigation_SU_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Irrigation_W_service_rate = 20.50>  --->
<cfset SESSION.Irrigation_W_qty  = get_service_info.Irrigation_W_qty >
<cfset SESSION.Irrigation_W_cost  = get_service_info.Irrigation_W_cost>
<cfset SESSION.Irrigation_W_rate = get_service_info.Irrigation_W_rate>
<cfset SESSION.Irrigation_W_hours  = SESSION.Irrigation_W_qty/SESSION.Irrigation_W_rate>
<cfset SESSION.Irrigation_W_hoursA = #NumberFormat(SESSION.Irrigation_W_hours,"999,999.9")#>
<cfset SESSION.Irrigation_W_actualprice  = SESSION.Irrigation_W_hours*SESSION.Irrigation_W_cost>
<cfset SESSION.Irrigation_W_materials_rate  = 0>
<cfset SESSION.Irrigation_W_materials_qty = 0>
<cfset SESSION.Irrigation_W_materials_actualprice = SESSION.Irrigation_W_materials_rate*SESSION.Irrigation_W_materials_qty>
<cfset SESSION.Irrigation_W_service_materials  = SESSION.Irrigation_W_actualprice+SESSION.Irrigation_W_materials_actualprice >
<cfset SESSION.Irrigation_W_times  = get_service_info.Irrigation_W_times>
<cfset SESSION.Irrigation_W_actual_extended  = SESSION.Irrigation_W_times* #NumberFormat(SESSION.Irrigation_W_service_materials,"999999.99")#>
<cfset SESSION.Irrigation_W_actual_extended  =  #ROUND(SESSION.Irrigation_W_actual_extended)#>
<cfset SESSION.Irrigation_W_total_hours = SESSION.Irrigation_W_hoursA*SESSION.Irrigation_W_times>
<!---<cfset SESSION.Irrigation_W_overtime_adjustment =
SESSION.Irrigation_W_actual_extended -
(SESSION.Irrigation_W_total_hours*0.10* SESSION.Irrigation_W_cost)+
(SESSION.Irrigation_W_total_hours*0.10* SESSION.Irrigation_W_cost*1.5)>--->
<!---Changed 7/25/15 
<cfset SESSION.Irrigation_W_overtime_adjustment = SESSION.Irrigation_W_actual_extended >
<cfset SESSION.Irrigation_W_contract_price = SESSION.Irrigation_W_overtime_adjustment >--->
<cfset SESSION.Irrigation_W_overtime_adjustment = 0 >
<cfset SESSION.Irrigation_W_contract_price =SESSION.Irrigation_W_actual_extended>

<!---<cfset SESSION.Irrigation_W_overtime_adjustment = SESSION.Irrigation_W_actual_extended>
<cfset SESSION.Irrigation_W_contract_price = SESSION.Irrigation_W_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Irrigation_I_service_rate = 20.50>  --->
<cfset SESSION.Irrigation_I_qty  = get_service_info.Irrigation_I_qty >
<cfset SESSION.Irrigation_I_cost  = get_service_info.Irrigation_I_cost>
<cfset SESSION.Irrigation_I_rate = get_service_info.Irrigation_I_rate>
<cfset SESSION.Irrigation_I_hours  = SESSION.Irrigation_I_qty/SESSION.Irrigation_I_rate>
<cfset SESSION.Irrigation_I_hoursA = #NumberFormat(SESSION.Irrigation_I_hours,"999,999.9")#>
<cfset SESSION.Irrigation_I_actualprice  = SESSION.Irrigation_I_hours*SESSION.Irrigation_I_cost>
<cfset SESSION.Irrigation_I_materials_rate  = 0>
<cfset SESSION.Irrigation_I_materials_qty = 0>
<cfset SESSION.Irrigation_I_materials_actualprice = SESSION.Irrigation_I_materials_rate*SESSION.Irrigation_I_materials_qty>
<cfset SESSION.Irrigation_I_service_materials  = SESSION.Irrigation_I_actualprice+SESSION.Irrigation_I_materials_actualprice >
<cfset SESSION.Irrigation_I_times  = get_service_info.Irrigation_I_times>
<cfset SESSION.Irrigation_I_actual_extended  = SESSION.Irrigation_I_times* #NumberFormat(SESSION.Irrigation_I_service_materials,"999999.99")#>
<cfset SESSION.Irrigation_I_actual_extended  =  #ROUND(SESSION.Irrigation_I_actual_extended)#>
<cfset SESSION.Irrigation_I_total_hours = SESSION.Irrigation_I_hoursA*SESSION.Irrigation_I_times>
<!---<cfset SESSION.Irrigation_I_overtime_adjustment =
SESSION.Irrigation_I_actual_extended -
(SESSION.Irrigation_I_total_hours*0.10* SESSION.Irrigation_I_cost)+
(SESSION.Irrigation_I_total_hours*0.10* SESSION.Irrigation_I_cost*1.5)>--->

<!---Changed 7/25/15 <cfset SESSION.Irrigation_I_overtime_adjustment = SESSION.Irrigation_I_actual_extended>
<cfset SESSION.Irrigation_I_contract_price = SESSION.Irrigation_I_overtime_adjustment >--->
<cfset SESSION.Irrigation_I_overtime_adjustment = 0>
<cfset SESSION.Irrigation_I_contract_price = SESSION.Irrigation_I_actual_extended >

<!---<cfset SESSION.Irrigation_I_overtime_adjustment = SESSION.Irrigation_I_actual_extended>
<cfset SESSION.Irrigation_I_contract_price = SESSION.Irrigation_I_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_F_Reg_service_rate = 20.50>  --->
<cfset SESSION.Mulch_F_Reg_qty  = get_service_info.Mulch_F_Reg_qty >
<cfset SESSION.Mulch_F_Reg_cost  = get_service_info.Mulch_F_Reg_cost>
<cfset SESSION.Mulch_F_Reg_rate = get_service_info.Mulch_F_Reg_rate>
<cfset SESSION.Mulch_F_Reg_hours  = SESSION.Mulch_F_Reg_qty/SESSION.Mulch_F_Reg_rate>
<cfset SESSION.Mulch_F_Reg_hoursA = #NumberFormat(SESSION.Mulch_F_Reg_hours,"999,999.9")#>
<cfset SESSION.Mulch_F_Reg_actualprice  = SESSION.Mulch_F_Reg_hours*SESSION.Mulch_F_Reg_cost>
<cfset SESSION.Mulch_F_Reg_materials_rate  = get_materials_info.Mulch_F_Reg_materials_rate>
<!--- <cfset SESSION.Mulch_F_Reg_materials_qty = get_materials_info.Mulch_F_Reg_materials_qty>
 --->
<!---<cfset SESSION.Mulch_F_Reg_materials_qty=(get_service_info.Mulch_F_Reg_qty /324)>
<cfset SESSION.Mulch_F_Reg_materials_qty = #NumberFormat(SESSION.Mulch_F_Reg_materials_qty,"999999.9")#>--->

<cfif  IsDefined("form.mulch_f_reg_qty")>
  <CFSET mulch_f_reg_qty_post  =form.mulch_f_reg_qty>
</cfif>
<cfset SESSION.mulch_f_reg_materials_qty_actual=(get_service_info.mulch_f_reg_qty /324)>
<cfset SESSION.mulch_f_reg_materials_qty_actual=#NumberFormat(SESSION.mulch_f_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_reg_materials_qty")    AND  get_materials_info.mulch_f_reg_materials_qty  EQ SESSION.mulch_f_reg_materials_qty_actual  AND SESSION.mulch_f_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_reg_materials_qty")    AND get_materials_info.mulch_f_reg_materials_qty  EQ form.mulch_f_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_reg_qty_pre")   AND   IsDefined("mulch_f_reg_qty_post") AND mulch_f_reg_qty_pre NEQ  mulch_f_reg_qty_post>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_reg_materials_qty=(form.mulch_f_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
</cfif>
<cfset SESSION.mulch_f_reg_materials_qty = #NumberFormat(SESSION.mulch_f_reg_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_F_Reg_materials_actualprice = SESSION.Mulch_F_Reg_materials_rate*SESSION.Mulch_F_Reg_materials_qty>
<cfset SESSION.Mulch_F_Reg_materials_actualprice = #NumberFormat(SESSION.Mulch_F_Reg_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_F_Reg_service_materials  = SESSION.Mulch_F_Reg_actualprice+SESSION.Mulch_F_Reg_materials_actualprice >
<cfset SESSION.Mulch_F_Reg_times  = get_service_info.Mulch_F_Reg_times>
<cfset SESSION.Mulch_F_Reg_actual_extended  = SESSION.Mulch_F_Reg_times* #NumberFormat(SESSION.Mulch_F_Reg_service_materials,"999999.99")#>
<cfset SESSION.Mulch_F_Reg_actual_extended  =  #ROUND(SESSION.Mulch_F_Reg_actual_extended)#>
<cfset SESSION.Mulch_F_Reg_total_hours = SESSION.Mulch_F_Reg_hoursA*SESSION.Mulch_F_Reg_times>
<cfset SESSION.Mulch_F_Reg_overtime_adjustment =
SESSION.Mulch_F_Reg_actual_extended -
(SESSION.Mulch_F_Reg_total_hours*0.10* SESSION.Mulch_F_Reg_cost)+
(SESSION.Mulch_F_Reg_total_hours*0.10* SESSION.Mulch_F_Reg_cost*1.5)>
<cfset SESSION.Mulch_F_Reg_contract_price = SESSION.Mulch_F_Reg_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_S_Reg_service_rate = 20.50>  --->
<cfset SESSION.Mulch_S_Reg_qty  = get_service_info.Mulch_S_Reg_qty >
<cfset SESSION.Mulch_S_Reg_cost  = get_service_info.Mulch_S_Reg_cost>
<cfset SESSION.Mulch_S_Reg_rate = get_service_info.Mulch_S_Reg_rate>
<cfset SESSION.Mulch_S_Reg_hours  = SESSION.Mulch_S_Reg_qty/SESSION.Mulch_S_Reg_rate>
<cfset SESSION.Mulch_S_Reg_hoursA = #NumberFormat(SESSION.Mulch_S_Reg_hours,"999999.9")#>
<cfset SESSION.Mulch_S_Reg_actualprice  = SESSION.Mulch_S_Reg_hours*SESSION.Mulch_S_Reg_cost>
<cfset SESSION.Mulch_S_Reg_materials_rate  = get_materials_info.Mulch_S_Reg_materials_rate>
<!--- <cfset SESSION.Mulch_S_Reg_materials_qty = get_materials_info.Mulch_S_Reg_materials_qty> --->
<!---<cfset SESSION.Mulch_S_Reg_materials_qty=(get_service_info.Mulch_S_Reg_qty /162)>
<cfset SESSION.Mulch_S_Reg_materials_qty = #NumberFormat(SESSION.Mulch_S_Reg_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.mulch_s_reg_qty")>
  <CFSET mulch_s_reg_qty_post  =form.mulch_s_reg_qty>
</cfif>
<cfset SESSION.mulch_s_reg_materials_qty_actual=(get_service_info.mulch_s_reg_qty /162)>
<cfset SESSION.mulch_s_reg_materials_qty_actual=#NumberFormat(SESSION.mulch_s_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_reg_materials_qty")    AND  get_materials_info.mulch_s_reg_materials_qty  EQ SESSION.mulch_s_reg_materials_qty_actual  AND SESSION.mulch_s_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_reg_materials_qty")    AND get_materials_info.mulch_s_reg_materials_qty  EQ form.mulch_s_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_reg_qty_pre")   AND   IsDefined("mulch_s_reg_qty_post") AND mulch_s_reg_qty_pre NEQ  mulch_s_reg_qty_post>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_reg_materials_qty=(form.mulch_s_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
</cfif>
<cfset SESSION.mulch_s_reg_materials_qty = #NumberFormat(SESSION.mulch_s_reg_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_S_Reg_materials_actualprice = SESSION.Mulch_S_Reg_materials_rate*SESSION.Mulch_S_Reg_materials_qty>
<cfset SESSION.Mulch_S_Reg_materials_actualprice = #NumberFormat(SESSION.Mulch_S_Reg_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_S_Reg_service_materials  = SESSION.Mulch_S_Reg_actualprice+SESSION.Mulch_S_Reg_materials_actualprice >
<cfset SESSION.Mulch_S_Reg_times  = get_service_info.Mulch_S_Reg_times>
<cfset SESSION.Mulch_S_Reg_actual_extended  = SESSION.Mulch_S_Reg_times* #NumberFormat(SESSION.Mulch_S_Reg_service_materials,"999999.99")#>
<cfset SESSION.Mulch_S_Reg_actual_extended  =  #ROUND(SESSION.Mulch_S_Reg_actual_extended)#>
<cfset SESSION.Mulch_S_Reg_total_hours = SESSION.Mulch_S_Reg_hoursA*SESSION.Mulch_S_Reg_times>
<cfset SESSION.Mulch_S_Reg_overtime_adjustment =
SESSION.Mulch_S_Reg_actual_extended -
(SESSION.Mulch_S_Reg_total_hours*0.10* SESSION.Mulch_S_Reg_cost)+
(SESSION.Mulch_S_Reg_total_hours*0.10* SESSION.Mulch_S_Reg_cost*1.5)>
<cfset SESSION.Mulch_S_Reg_contract_price = SESSION.Mulch_S_Reg_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Pond_Maint_service_rate = 20.50>  --->
<cfset SESSION.Pond_Maint_qty  = get_service_info.Pond_Maint_qty >
<cfset SESSION.Pond_Maint_cost  = get_service_info.Pond_Maint_cost>
<cfset SESSION.Pond_Maint_rate = get_service_info.Pond_Maint_rate>
<cfset SESSION.Pond_Maint_hours  = SESSION.Pond_Maint_qty/SESSION.Pond_Maint_rate>
<cfset SESSION.Pond_Maint_hoursA = #NumberFormat(SESSION.Pond_Maint_hours,"999,999.9")#>
<cfset SESSION.Pond_Maint_actualprice  = SESSION.Pond_Maint_hours*SESSION.Pond_Maint_cost>
<cfset SESSION.Pond_Maint_materials_rate  = 0>
<cfset SESSION.Pond_Maint_materials_qty =0>
<cfset SESSION.Pond_Maint_materials_actualprice = SESSION.Pond_Maint_materials_rate*SESSION.Pond_Maint_materials_qty>
<cfset SESSION.Pond_Maint_service_materials  = SESSION.Pond_Maint_actualprice+SESSION.Pond_Maint_materials_actualprice >
<cfset SESSION.Pond_Maint_times  = get_service_info.Pond_Maint_times>
<cfset SESSION.Pond_Maint_actual_extended  = SESSION.Pond_Maint_times* #NumberFormat(SESSION.Pond_Maint_service_materials,"999999.99")#>
<cfset SESSION.Pond_Maint_actual_extended  =  #ROUND(SESSION.Pond_Maint_actual_extended)#>
<cfset SESSION.Pond_Maint_total_hours = SESSION.Pond_Maint_hoursA*SESSION.Pond_Maint_times>
<cfset SESSION.Pond_Maint_overtime_adjustment =
SESSION.Pond_Maint_actual_extended -
(SESSION.Pond_Maint_total_hours*0.10* SESSION.Pond_Maint_cost)+
(SESSION.Pond_Maint_total_hours*0.10* SESSION.Pond_Maint_cost*1.5)>
<cfset SESSION.Pond_Maint_contract_price = SESSION.Pond_Maint_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Trim_Hillside_service_rate = 20.50>  --->
<cfset SESSION.Trim_Hillside_qty  = get_service_info.Trim_Hillside_qty >
<cfset SESSION.Trim_Hillside_cost  = get_service_info.Trim_Hillside_cost>
<cfset SESSION.Trim_Hillside_rate = get_service_info.Trim_Hillside_rate>
<cfset SESSION.Trim_Hillside_hours  = SESSION.Trim_Hillside_qty/SESSION.Trim_Hillside_rate>
<cfset SESSION.Trim_Hillside_hoursA = #NumberFormat(SESSION.Trim_Hillside_hours,"999,999.9")#>
<cfset SESSION.Trim_Hillside_actualprice  = SESSION.Trim_Hillside_hours*SESSION.Trim_Hillside_cost>
<cfset SESSION.Trim_Hillside_materials_rate  = 0>
<cfset SESSION.Trim_Hillside_materials_qty = 0>
<cfset SESSION.Trim_Hillside_materials_actualprice = SESSION.Trim_Hillside_materials_rate*SESSION.Trim_Hillside_materials_qty>
<cfset SESSION.Trim_Hillside_service_materials  = SESSION.Trim_Hillside_actualprice+SESSION.Trim_Hillside_materials_actualprice >
<cfset SESSION.Trim_Hillside_times  = get_service_info.Trim_Hillside_times>
<cfset SESSION.Trim_Hillside_actual_extended  = SESSION.Trim_Hillside_times* #NumberFormat(SESSION.Trim_Hillside_service_materials,"999999.99")#>
<cfset SESSION.Trim_Hillside_actual_extended  =  #ROUND(SESSION.Trim_Hillside_actual_extended)#>
<cfset SESSION.Trim_Hillside_total_hours = SESSION.Trim_Hillside_hoursA*SESSION.Trim_Hillside_times>
<cfset SESSION.Trim_Hillside_overtime_adjustment =
SESSION.Trim_Hillside_actual_extended -
(SESSION.Trim_Hillside_total_hours*0.10* SESSION.Trim_Hillside_cost)+
(SESSION.Trim_Hillside_total_hours*0.10* SESSION.Trim_Hillside_cost*1.5)>
<cfset SESSION.Trim_Hillside_contract_price = SESSION.Trim_Hillside_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Pine_Tags_service_rate = 20.50>  --->
<cfset SESSION.Pine_Tags_qty  = get_service_info.Pine_Tags_qty >
<cfset SESSION.Pine_Tags_cost  = get_service_info.Pine_Tags_cost>
<cfset SESSION.Pine_Tags_rate = get_service_info.Pine_Tags_rate>
<cfset SESSION.Pine_Tags_hours  = SESSION.Pine_Tags_qty/SESSION.Pine_Tags_rate>
<cfset SESSION.Pine_Tags_hoursA = #NumberFormat(SESSION.Pine_Tags_hours,"999999.9")#>
<cfset SESSION.Pine_Tags_actualprice  = SESSION.Pine_Tags_hours*SESSION.Pine_Tags_cost>
<cfset SESSION.Pine_Tags_materials_rate  = get_materials_info.Pine_Tags_materials_rate>
<!---  <cfset SESSION.Pine_Tags_materials_qty = get_materials_info.Pine_Tags_materials_qty> --->
<cfif  IsDefined("form.Pine_Tags_qty")>
  <CFSET Pine_Tags_qty_post  =form.Pine_Tags_qty>
</cfif>
<cfset SESSION.Pine_Tags_materials_qty_actual=(get_service_info.Pine_Tags_qty /65)>
<cfset SESSION.Pine_Tags_materials_qty_actual=#NumberFormat(SESSION.Pine_Tags_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Pine_Tags_materials_qty")    AND  get_materials_info.Pine_Tags_materials_qty  EQ SESSION.Pine_Tags_materials_qty_actual  AND SESSION.Pine_Tags_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif   IsDefined("form.Pine_Tags_materials_qty")    AND get_materials_info.Pine_Tags_materials_qty  EQ form.Pine_Tags_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Pine_Tags_qty_pre")   AND   IsDefined("Pine_Tags_qty_post") AND Pine_Tags_qty_pre NEQ  Pine_Tags_qty_post>
  <cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif  IsDefined("form.Pine_Tags_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Pine_Tags_materials_qty=(form.Pine_Tags_materials_qty)>
  <cfelseif   NOT IsDefined("form.Pine_Tags_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
  <cfelse>
  <cfset SESSION.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
</cfif>
<cfset SESSION.Pine_Tags_materials_qty = #NumberFormat(SESSION.Pine_Tags_materials_qty,"999999.9")#>

<!---<cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
<cfset SESSION.Pine_Tags_materials_qty = #NumberFormat(SESSION.Pine_Tags_materials_qty,"999999.9")#>--->
<cfset SESSION.Pine_Tags_materials_actualprice = SESSION.Pine_Tags_materials_rate*SESSION.Pine_Tags_materials_qty>
<cfset SESSION.Pine_Tags_materials_actualprice = #NumberFormat(SESSION.Pine_Tags_materials_actualprice,"999999.99")#>
<cfset SESSION.Pine_Tags_service_materials  = SESSION.Pine_Tags_actualprice+SESSION.Pine_Tags_materials_actualprice >
<cfset SESSION.Pine_Tags_times  = get_service_info.Pine_Tags_times>
<cfset SESSION.Pine_Tags_actual_extended  = SESSION.Pine_Tags_times* #NumberFormat(SESSION.Pine_Tags_service_materials,"999999.99")#>
<cfset SESSION.Pine_Tags_actual_extended  =  #ROUND(SESSION.Pine_Tags_actual_extended)#>
<cfset SESSION.Pine_Tags_total_hours = SESSION.Pine_Tags_hoursA*SESSION.Pine_Tags_times>
<cfset SESSION.Pine_Tags_overtime_adjustment =
SESSION.Pine_Tags_actual_extended -
(SESSION.Pine_Tags_total_hours*0.10* SESSION.Pine_Tags_cost)+
(SESSION.Pine_Tags_total_hours*0.10* SESSION.Pine_Tags_cost*1.5)>
<cfset SESSION.Pine_Tags_contract_price = SESSION.Pine_Tags_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_hort_oil_service_rate = 20.50>  --->
<cfset SESSION.TS_hort_oil_qty  = get_service_info.TS_hort_oil_qty >
<cfset SESSION.TS_hort_oil_cost  = get_service_info.TS_hort_oil_cost>
<cfset SESSION.TS_hort_oil_rate = get_service_info.TS_hort_oil_rate>
<cfset SESSION.TS_hort_oil_hours  = SESSION.TS_hort_oil_qty/SESSION.TS_hort_oil_rate>
<cfset SESSION.TS_hort_oil_hoursA = #NumberFormat(SESSION.TS_hort_oil_hours,"999999.9")#>
<cfset SESSION.TS_hort_oil_actualprice  = SESSION.TS_hort_oil_hours*SESSION.TS_hort_oil_cost>
<cfset SESSION.TS_hort_oil_materials_rate  = get_materials_info.TS_hort_oil_materials_rate>
<!---  <cfset SESSION.TS_hort_oil_materials_qty = get_materials_info.TS_hort_oil_materials_qty> --->
<!---<cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
<cfset SESSION.TS_hort_oil_materials_qty = #NumberFormat(SESSION.TS_hort_oil_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.TS_hort_oil_qty")>
  <CFSET TS_hort_oil_qty_post  =form.TS_hort_oil_qty>
</cfif>
<cfset SESSION.TS_hort_oil_materials_qty_actual=(get_service_info.TS_hort_oil_qty *128)>
<cfset SESSION.TS_hort_oil_materials_qty_actual=#NumberFormat(SESSION.TS_hort_oil_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_hort_oil_materials_qty")    AND  get_materials_info.TS_hort_oil_materials_qty  EQ SESSION.TS_hort_oil_materials_qty_actual  AND SESSION.TS_hort_oil_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif   IsDefined("form.TS_hort_oil_materials_qty")    AND get_materials_info.TS_hort_oil_materials_qty  EQ form.TS_hort_oil_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_hort_oil_qty_pre")   AND   IsDefined("TS_hort_oil_qty_post") AND TS_hort_oil_qty_pre NEQ  TS_hort_oil_qty_post>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif  IsDefined("form.TS_hort_oil_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_hort_oil_materials_qty=(form.TS_hort_oil_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_hort_oil_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
</cfif>
<cfset SESSION.TS_hort_oil_materials_qty = #NumberFormat(SESSION.TS_hort_oil_materials_qty,"999999.99")#>
<cfset SESSION.TS_hort_oil_materials_actualprice = SESSION.TS_hort_oil_materials_rate*SESSION.TS_hort_oil_materials_qty>
<cfset SESSION.TS_hort_oil_materials_actualprice = #NumberFormat(SESSION.TS_hort_oil_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_hort_oil_service_materials  = SESSION.TS_hort_oil_actualprice+SESSION.TS_hort_oil_materials_actualprice >
<cfset SESSION.TS_hort_oil_times  = get_service_info.TS_hort_oil_times>
<cfset SESSION.TS_hort_oil_actual_extended  = SESSION.TS_hort_oil_times* #NumberFormat(SESSION.TS_hort_oil_service_materials,"999999.99")#>
<cfset SESSION.TS_hort_oil_actual_extended  =  #ROUND(SESSION.TS_hort_oil_actual_extended)#>
<cfset SESSION.TS_hort_oil_total_hours = SESSION.TS_hort_oil_hoursA*SESSION.TS_hort_oil_times>
<cfset SESSION.TS_hort_oil_overtime_adjustment =
SESSION.TS_hort_oil_actual_extended -
(SESSION.TS_hort_oil_total_hours*0.10* SESSION.TS_hort_oil_cost)+
(SESSION.TS_hort_oil_total_hours*0.10* SESSION.TS_hort_oil_cost*1.5)>
<cfset SESSION.TS_hort_oil_contract_price = SESSION.TS_hort_oil_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Addtl_Mowing_service_rate = 20.50>  --->
<cfset SESSION.Addtl_Mowing_qty  = get_service_info.Addtl_Mowing_qty >
<cfset SESSION.Addtl_Mowing_cost  = get_service_info.Addtl_Mowing_cost>
<cfset SESSION.Addtl_Mowing_rate = get_service_info.Addtl_Mowing_rate>
<cfset SESSION.Addtl_Mowing_hours  = SESSION.Addtl_Mowing_qty/SESSION.Addtl_Mowing_rate>
<cfset SESSION.Addtl_Mowing_hoursA = #NumberFormat(SESSION.Addtl_Mowing_hours,"999999.9")#>
<cfset SESSION.Addtl_Mowing_actualprice  = SESSION.Addtl_Mowing_hours*SESSION.Addtl_Mowing_cost>
<cfset SESSION.Addtl_Mowing_materials_rate  = 0>
<cfset SESSION.Addtl_Mowing_materials_qty = 0>
<cfset SESSION.Addtl_Mowing_materials_actualprice = SESSION.Addtl_Mowing_MATERIALS_rate*SESSION.Addtl_Mowing_materials_qty>
<cfset SESSION.Addtl_Mowing_service_materials  = SESSION.Addtl_Mowing_actualprice+SESSION.Addtl_Mowing_materials_actualprice >
<cfset SESSION.Addtl_Mowing_times  = get_service_info.Addtl_Mowing_times>
<cfset SESSION.Addtl_Mowing_actual_extended  = SESSION.Addtl_Mowing_times* #NumberFormat(SESSION.Addtl_Mowing_service_materials,"999999.99")#>
<cfset SESSION.Addtl_Mowing_actual_extended  =  #ROUND(SESSION.Addtl_Mowing_actual_extended)#>
<cfset SESSION.Addtl_Mowing_total_hours = SESSION.Addtl_Mowing_hoursA*SESSION.Addtl_Mowing_times>
<cfset SESSION.Addtl_Mowing_overtime_adjustment =
SESSION.Addtl_Mowing_actual_extended -
(SESSION.Addtl_Mowing_total_hours*0.10* SESSION.Addtl_Mowing_cost)+
(SESSION.Addtl_Mowing_total_hours*0.10* SESSION.Addtl_Mowing_cost*1.5)>
<cfset SESSION.Addtl_Mowing_contract_price = SESSION.Addtl_Mowing_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Day_Porter_service_rate = 20.50>  --->
<cfset SESSION.Day_Porter_qty  = get_service_info.Day_Porter_qty >
<cfset SESSION.Day_Porter_cost  = get_service_info.Day_Porter_cost>
<cfset SESSION.Day_Porter_rate = get_service_info.Day_Porter_rate>
<cfset SESSION.Day_Porter_hours  = SESSION.Day_Porter_qty/SESSION.Day_Porter_rate>
<cfset SESSION.Day_Porter_hoursA = #NumberFormat(SESSION.Day_Porter_hours,"999999.9")#>
<cfset SESSION.Day_Porter_actualprice  = SESSION.Day_Porter_hours*SESSION.Day_Porter_cost>
<cfset SESSION.Day_Porter_materials_rate  = 0>
<cfset SESSION.Day_Porter_materials_qty = 0>
<cfset SESSION.Day_Porter_materials_actualprice = SESSION.Day_Porter_MATERIALS_rate*SESSION.Day_Porter_materials_qty>
<cfset SESSION.Day_Porter_service_materials  = SESSION.Day_Porter_actualprice+SESSION.Day_Porter_materials_actualprice >
<cfset SESSION.Day_Porter_times  = get_service_info.Day_Porter_times>
<cfset SESSION.Day_Porter_actual_extended  = SESSION.Day_Porter_times* #NumberFormat(SESSION.Day_Porter_service_materials,"999999.99")#>
<cfset SESSION.Day_Porter_actual_extended  =  #ROUND(SESSION.Day_Porter_actual_extended)#>
<cfset SESSION.Day_Porter_total_hours = SESSION.Day_Porter_hoursA*SESSION.Day_Porter_times>
<cfset SESSION.Day_Porter_overtime_adjustment =
SESSION.Day_Porter_actual_extended -
(SESSION.Day_Porter_total_hours*0.10* SESSION.Day_Porter_cost)+
(SESSION.Day_Porter_total_hours*0.10* SESSION.Day_Porter_cost*1.5)>
<cfset SESSION.Day_Porter_contract_price = SESSION.Day_Porter_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Bush_Hog_service_rate = 20.50>  --->
<cfset SESSION.Bush_Hog_qty  = get_service_info.Bush_Hog_qty >
<cfset SESSION.Bush_Hog_cost  = get_service_info.Bush_Hog_cost>
<cfset SESSION.Bush_Hog_rate = get_service_info.Bush_Hog_rate>
<cfset SESSION.Bush_Hog_hours  = SESSION.Bush_Hog_qty/SESSION.Bush_Hog_rate>
<cfset SESSION.Bush_Hog_hoursA = #NumberFormat(SESSION.Bush_Hog_hours,"999,999.9")#>
<cfset SESSION.Bush_Hog_actualprice  = SESSION.Bush_Hog_hours*SESSION.Bush_Hog_cost>
<cfset SESSION.Bush_Hog_materials_rate  =0>
<cfset SESSION.Bush_Hog_materials_qty = 0>
<cfset SESSION.Bush_Hog_materials_actualprice = SESSION.Bush_Hog_MATERIALS_rate*SESSION.Bush_Hog_materials_qty>
<cfset SESSION.Bush_Hog_service_materials  = SESSION.Bush_Hog_actualprice+SESSION.Bush_Hog_materials_actualprice >
<cfset SESSION.Bush_Hog_times  = get_service_info.Bush_Hog_times>
<cfset SESSION.Bush_Hog_actual_extended  = SESSION.Bush_Hog_times* #NumberFormat(SESSION.Bush_Hog_service_materials,"999999.99")#>
<cfset SESSION.Bush_Hog_actual_extended  =  #ROUND(SESSION.Bush_Hog_actual_extended)#>
<cfset SESSION.Bush_Hog_total_hours = SESSION.Bush_Hog_hoursA*SESSION.Bush_Hog_times>
<cfset SESSION.Bush_Hog_overtime_adjustment =
SESSION.Bush_Hog_actual_extended -
(SESSION.Bush_Hog_total_hours*0.10* SESSION.Bush_Hog_cost)+
(SESSION.Bush_Hog_total_hours*0.10* SESSION.Bush_Hog_cost*1.5)>
<cfset SESSION.Bush_Hog_contract_price = SESSION.Bush_Hog_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Lot_Sweeping_service_rate = 20.50>  --->
<cfset SESSION.Lot_Sweeping_qty  = get_service_info.Lot_Sweeping_qty >
<cfset SESSION.Lot_Sweeping_cost  = get_service_info.Lot_Sweeping_cost>
<cfset SESSION.Lot_Sweeping_rate = get_service_info.Lot_Sweeping_rate>
<cfset SESSION.Lot_Sweeping_hours  = SESSION.Lot_Sweeping_qty/SESSION.Lot_Sweeping_rate>
<cfset SESSION.Lot_Sweeping_hoursA = #NumberFormat(SESSION.Lot_Sweeping_hours,"999,999.9")#>
<cfset SESSION.Lot_Sweeping_actualprice  = SESSION.Lot_Sweeping_hours*SESSION.Lot_Sweeping_cost>
<cfset SESSION.Lot_Sweeping_materials_rate  = 0>
<cfset SESSION.Lot_Sweeping_materials_qty = 0>
<cfset SESSION.Lot_Sweeping_materials_actualprice = SESSION.Lot_Sweeping_MATERIALS_rate*SESSION.Lot_Sweeping_materials_qty>
<cfset SESSION.Lot_Sweeping_service_materials  = SESSION.Lot_Sweeping_actualprice+SESSION.Lot_Sweeping_materials_actualprice >
<cfset SESSION.Lot_Sweeping_times  = get_service_info.Lot_Sweeping_times>
<cfset SESSION.Lot_Sweeping_actual_extended  = SESSION.Lot_Sweeping_times* #NumberFormat(SESSION.Lot_Sweeping_service_materials,"999999.99")#>
<cfset SESSION.Lot_Sweeping_actual_extended  =  #ROUND(SESSION.Lot_Sweeping_actual_extended)#>
<cfset SESSION.Lot_Sweeping_total_hours = SESSION.Lot_Sweeping_hoursA*SESSION.Lot_Sweeping_times>
<cfset SESSION.Lot_Sweeping_gm  = get_service_info.Lot_Sweeping_gm >
<cfset SESSION.gross_margin_diff_lot_sweeping = (100-SESSION.lot_sweeping_gm)/100>
<cfset SESSION.Lot_Sweeping_overtime_adjustment =
SESSION.Lot_Sweeping_actual_extended -
(SESSION.Lot_Sweeping_total_hours*0.10* SESSION.Lot_Sweeping_cost)+
(SESSION.Lot_Sweeping_total_hours*0.10* SESSION.Lot_Sweeping_cost*1.5)>
<cfset SESSION.Lot_Sweeping_contract_price = SESSION.Lot_Sweeping_overtime_adjustment / SESSION.gross_margin_diff_Lot_Sweeping>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Trail_Maint_service_rate = 20.50>  --->
<cfset SESSION.Trail_Maint_qty  = get_service_info.Trail_Maint_qty >
<cfset SESSION.Trail_Maint_cost  = get_service_info.Trail_Maint_cost>
<cfset SESSION.Trail_Maint_rate = get_service_info.Trail_Maint_rate>
<cfset SESSION.Trail_Maint_hours  = SESSION.Trail_Maint_qty/SESSION.Trail_Maint_rate>
<cfset SESSION.Trail_Maint_hoursA = #NumberFormat(SESSION.Trail_Maint_hours,"999999.9")#>
<cfset SESSION.Trail_Maint_actualprice  = SESSION.Trail_Maint_hours*SESSION.Trail_Maint_cost>
<cfset SESSION.Trail_Maint_materials_rate  =0>
<cfset SESSION.Trail_Maint_materials_qty =0>
<cfset SESSION.Trail_Maint_materials_actualprice = SESSION.Trail_Maint_MATERIALS_rate*SESSION.Trail_Maint_materials_qty>
<cfset SESSION.Trail_Maint_service_materials  = SESSION.Trail_Maint_actualprice+SESSION.Trail_Maint_materials_actualprice >
<cfset SESSION.Trail_Maint_times  = get_service_info.Trail_Maint_times>
<cfset SESSION.Trail_Maint_actual_extended  = SESSION.Trail_Maint_times* #NumberFormat(SESSION.Trail_Maint_service_materials,"999999.99")#>
<cfset SESSION.Trail_Maint_actual_extended  =  #ROUND(SESSION.Trail_Maint_actual_extended)#>
<cfset SESSION.Trail_Maint_total_hours = SESSION.Trail_Maint_hoursA*SESSION.Trail_Maint_times>
<cfset SESSION.Trail_Maint_overtime_adjustment =
SESSION.Trail_Maint_actual_extended -
(SESSION.Trail_Maint_total_hours*0.10* SESSION.Trail_Maint_cost)+
(SESSION.Trail_Maint_total_hours*0.10* SESSION.Trail_Maint_cost*1.5)>
<cfset SESSION.Trail_Maint_contract_price = SESSION.Trail_Maint_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Irrigation_TM_service_rate = 20.50>  --->
<cfset SESSION.Irrigation_TM_qty  = get_service_info.Irrigation_TM_qty >
<cfset SESSION.Irrigation_TM_cost  = get_service_info.Irrigation_TM_cost>
<cfset SESSION.Irrigation_TM_rate = get_service_info.Irrigation_TM_rate>
<cfset SESSION.Irrigation_TM_hours  = SESSION.Irrigation_TM_qty/SESSION.Irrigation_TM_rate>
<cfset SESSION.Irrigation_TM_hoursA = #NumberFormat(SESSION.Irrigation_TM_hours,"999,999.9")#>
<cfset SESSION.Irrigation_TM_actualprice  = SESSION.Irrigation_TM_hours*SESSION.Irrigation_TM_cost>
<cfset SESSION.Irrigation_TM_materials_rate  = 0>
<cfset SESSION.Irrigation_TM_materials_qty =0>
<cfset SESSION.Irrigation_TM_materials_actualprice = SESSION.Irrigation_TM_MATERIALS_rate*SESSION.Irrigation_TM_materials_qty>
<cfset SESSION.Irrigation_TM_service_materials  = SESSION.Irrigation_TM_actualprice+SESSION.Irrigation_TM_materials_actualprice >
<cfset SESSION.Irrigation_TM_times  = get_service_info.Irrigation_TM_times>
<cfset SESSION.Irrigation_TM_actual_extended  = SESSION.Irrigation_TM_times* #NumberFormat(SESSION.Irrigation_TM_service_materials,"999999.99")#>
<cfset SESSION.Irrigation_TM_actual_extended  =  #ROUND(SESSION.Irrigation_TM_actual_extended)#>
<cfset SESSION.Irrigation_TM_total_hours = SESSION.Irrigation_TM_hoursA*SESSION.Irrigation_TM_times>
<!---<cfset SESSION.Irrigation_TM_overtime_adjustment =
SESSION.Irrigation_TM_actual_extended -
(SESSION.Irrigation_TM_total_hours*0.10* SESSION.Irrigation_TM_cost)+
(SESSION.Irrigation_TM_total_hours*0.10* SESSION.Irrigation_TM_cost*1.5)>--->

<!---Changed 7/25/15
<cfset SESSION.Irrigation_TM_overtime_adjustment =SESSION.Irrigation_TM_actual_extended >
<cfset SESSION.Irrigation_TM_contract_price = SESSION.Irrigation_TM_overtime_adjustment>--->

<cfset SESSION.Irrigation_TM_overtime_adjustment =0 >
<cfset SESSION.Irrigation_TM_contract_price = SESSION.Irrigation_TM_actual_extended>

<!---<cfset SESSION.Irrigation_TM_overtime_adjustment = SESSION.Irrigation_TM_actual_extended>
<cfset SESSION.Irrigation_TM_contract_price = SESSION.Irrigation_TM_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Irrigation_BFI_service_rate = 20.50>  --->
<cfset SESSION.Irrigation_BFI_qty  = get_service_info.Irrigation_BFI_qty >
<cfset SESSION.Irrigation_BFI_cost  = get_service_info.Irrigation_BFI_cost>
<cfset SESSION.Irrigation_BFI_rate = get_service_info.Irrigation_BFI_rate>
<cfset SESSION.Irrigation_BFI_hours  = SESSION.Irrigation_BFI_qty/SESSION.Irrigation_BFI_rate>
<cfset SESSION.Irrigation_BFI_hoursA = #NumberFormat(SESSION.Irrigation_BFI_hours,"999,999.9")#>
<cfset SESSION.Irrigation_BFI_actualprice  = SESSION.Irrigation_BFI_hours*SESSION.Irrigation_BFI_cost>
<cfset SESSION.Irrigation_BFI_materials_rate  = 0>
<cfset SESSION.Irrigation_BFI_materials_qty = 0>
<cfset SESSION.Irrigation_BFI_materials_actualprice = SESSION.Irrigation_BFI_MATERIALS_rate*SESSION.Irrigation_BFI_materials_qty>
<cfset SESSION.Irrigation_BFI_service_materials  = SESSION.Irrigation_BFI_actualprice+SESSION.Irrigation_BFI_materials_actualprice >
<cfset SESSION.Irrigation_BFI_times  = get_service_info.Irrigation_BFI_times>
<cfset SESSION.Irrigation_BFI_actual_extended  = SESSION.Irrigation_BFI_times* #NumberFormat(SESSION.Irrigation_BFI_service_materials,"999999.99")#>
<cfset SESSION.Irrigation_BFI_actual_extended  =  #ROUND(SESSION.Irrigation_BFI_actual_extended)#>
<cfset SESSION.Irrigation_BFI_total_hours = SESSION.Irrigation_BFI_hoursA*SESSION.Irrigation_BFI_times>
<!---<cfset SESSION.Irrigation_BFI_overtime_adjustment =
SESSION.Irrigation_BFI_actual_extended -
(SESSION.Irrigation_BFI_total_hours*0.10* SESSION.Irrigation_BFI_cost)+
(SESSION.Irrigation_BFI_total_hours*0.10* SESSION.Irrigation_BFI_cost*1.5)>--->

<!---Changed 7/25/15
<cfset SESSION.Irrigation_BFI_overtime_adjustment = SESSION.Irrigation_BFI_actual_extended>
<cfset SESSION.Irrigation_BFI_contract_price = SESSION.Irrigation_BFI_overtime_adjustment >--->

<cfset SESSION.Irrigation_BFI_overtime_adjustment = 0>
<cfset SESSION.Irrigation_BFI_contract_price = SESSION.Irrigation_BFI_actual_extended >

<!---<cfset SESSION.Irrigation_BFI_overtime_adjustment = SESSION.Irrigation_BFI_actual_extended>
<cfset SESSION.Irrigation_BFI_contract_price = SESSION.Irrigation_BFI_overtime_adjustment >--->

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Natural_Area_service_rate = 20.50>  --->
<cfset SESSION.Natural_Area_qty  = get_service_info.Natural_Area_qty >
<cfset SESSION.Natural_Area_cost  = get_service_info.Natural_Area_cost>
<cfset SESSION.Natural_Area_rate = get_service_info.Natural_Area_rate>
<cfset SESSION.Natural_Area_hours  = SESSION.Natural_Area_qty/SESSION.Natural_Area_rate>
<cfset SESSION.Natural_Area_hoursA = #NumberFormat(SESSION.Natural_Area_hours,"999,999.9")#>
<cfset SESSION.Natural_Area_actualprice  = SESSION.Natural_Area_hours*SESSION.Natural_Area_cost>
<cfset SESSION.Natural_Area_materials_rate  = 0>
<cfset SESSION.Natural_Area_materials_qty = 0>
<cfset SESSION.Natural_Area_materials_actualprice = SESSION.Natural_Area_MATERIALS_rate*SESSION.Natural_Area_materials_qty>
<cfset SESSION.Natural_Area_service_materials  = SESSION.Natural_Area_actualprice+SESSION.Natural_Area_materials_actualprice >
<cfset SESSION.Natural_Area_times  = get_service_info.Natural_Area_times>
<cfset SESSION.Natural_Area_actual_extended  = SESSION.Natural_Area_times* #NumberFormat(SESSION.Natural_Area_service_materials,"999999.99")#>
<cfset SESSION.Natural_Area_actual_extended  =  #ROUND(SESSION.Natural_Area_actual_extended)#>
<cfset SESSION.Natural_Area_total_hours = SESSION.Natural_Area_hoursA*SESSION.Natural_Area_times>
<cfset SESSION.Natural_Area_overtime_adjustment =
SESSION.Natural_Area_actual_extended -
(SESSION.Natural_Area_total_hours*0.10* SESSION.Natural_Area_cost)+
(SESSION.Natural_Area_total_hours*0.10* SESSION.Natural_Area_cost*1.5)>
<cfset SESSION.Natural_Area_contract_price = SESSION.Natural_Area_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Trash_Receptacle_service_rate = 20.50>  --->
<cfset SESSION.Trash_Receptacle_qty  = get_service_info.Trash_Receptacle_qty >
<cfset SESSION.Trash_Receptacle_cost  = get_service_info.Trash_Receptacle_cost>
<cfset SESSION.Trash_Receptacle_rate = get_service_info.Trash_Receptacle_rate>
<cfset SESSION.Trash_Receptacle_hours  = SESSION.Trash_Receptacle_qty/SESSION.Trash_Receptacle_rate>
<cfset SESSION.Trash_Receptacle_hoursA = #NumberFormat(SESSION.Trash_Receptacle_hours,"999,999.9")#>
<cfset SESSION.Trash_Receptacle_actualprice  = SESSION.Trash_Receptacle_hours*SESSION.Trash_Receptacle_cost>
<cfset SESSION.Trash_Receptacle_materials_rate  = 0>
<cfset SESSION.Trash_Receptacle_materials_qty = 0>
<cfset SESSION.Trash_Receptacle_materials_actualprice = SESSION.Trash_Receptacle_MATERIALS_rate*SESSION.Trash_Receptacle_materials_qty>
<cfset SESSION.Trash_Receptacle_service_materials  = SESSION.Trash_Receptacle_actualprice+SESSION.Trash_Receptacle_materials_actualprice >
<cfset SESSION.Trash_Receptacle_times  = get_service_info.Trash_Receptacle_times>
<cfset SESSION.Trash_Receptacle_actual_extended  = SESSION.Trash_Receptacle_times* #NumberFormat(SESSION.Trash_Receptacle_service_materials,"999999.99")#>
<cfset SESSION.Trash_Receptacle_actual_extended  =  #ROUND(SESSION.Trash_Receptacle_actual_extended)#>
<cfset SESSION.Trash_Receptacle_total_hours = SESSION.Trash_Receptacle_hoursA*SESSION.Trash_Receptacle_times>
<cfset SESSION.Trash_Receptacle_overtime_adjustment =
SESSION.Trash_Receptacle_actual_extended -
(SESSION.Trash_Receptacle_total_hours*0.10* SESSION.Trash_Receptacle_cost)+
(SESSION.Trash_Receptacle_total_hours*0.10* SESSION.Trash_Receptacle_cost*1.5)>
<cfset SESSION.Trash_Receptacle_contract_price = SESSION.Trash_Receptacle_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Playground_mulch_service_rate = 20.50>  --->
<cfset SESSION.Playground_mulch_qty  = get_service_info.Playground_mulch_qty >
<cfset SESSION.Playground_mulch_cost  = get_service_info.Playground_mulch_cost>
<cfset SESSION.Playground_mulch_rate = get_service_info.Playground_mulch_rate>
<cfset SESSION.Playground_mulch_hours  = SESSION.Playground_mulch_qty/SESSION.Playground_mulch_rate>
<cfset SESSION.Playground_mulch_hoursA = #NumberFormat(SESSION.Playground_mulch_hours,"999999.9")#>
<cfset SESSION.Playground_mulch_actualprice  = SESSION.Playground_mulch_hours*SESSION.Playground_mulch_cost>
<cfset SESSION.Playground_mulch_materials_rate  = get_materials_info.Playground_mulch_materials_rate>
<!---  <cfset SESSION.Playground_mulch_materials_qty = get_materials_info.Playground_mulch_materials_qty>  --->
<!---<cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty /162)>
<cfset SESSION.Playground_mulch_materials_qty = #NumberFormat(SESSION.Playground_mulch_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.Playground_mulch_qty")>
  <CFSET Playground_mulch_qty_post  =form.Playground_mulch_qty>
</cfif>
<cfset SESSION.Playground_mulch_materials_qty_actual=(get_service_info.Playground_mulch_qty /162)>
<cfset SESSION.Playground_mulch_materials_qty_actual=#NumberFormat(SESSION.Playground_mulch_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Playground_mulch_materials_qty")    AND  get_materials_info.Playground_mulch_materials_qty  EQ SESSION.Playground_mulch_materials_qty_actual  AND SESSION.Playground_mulch_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif   IsDefined("form.Playground_mulch_materials_qty")    AND get_materials_info.Playground_mulch_materials_qty  EQ form.Playground_mulch_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Playground_mulch_qty_pre")   AND   IsDefined("Playground_mulch_qty_post") AND Playground_mulch_qty_pre NEQ  Playground_mulch_qty_post>
  <cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif  IsDefined("form.Playground_mulch_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Playground_mulch_materials_qty=(form.Playground_mulch_materials_qty)>
  <cfelseif   NOT IsDefined("form.Playground_mulch_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
  <cfelse>
  <cfset SESSION.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
</cfif>
<cfset SESSION.Playground_mulch_materials_qty = #NumberFormat(SESSION.Playground_mulch_materials_qty,"999999.9")#>
<cfset SESSION.Playground_mulch_materials_actualprice = SESSION.Playground_mulch_MATERIALS_rate*SESSION.Playground_mulch_materials_qty>
<cfset SESSION.Playground_mulch_materials_actualprice = #NumberFormat(SESSION.Playground_mulch_materials_actualprice,"999999.99")#>
<cfset SESSION.Playground_mulch_service_materials  = SESSION.Playground_mulch_actualprice+SESSION.Playground_mulch_materials_actualprice >
<cfset SESSION.Playground_mulch_times  = get_service_info.Playground_mulch_times>
<cfset SESSION.Playground_mulch_actual_extended  = SESSION.Playground_mulch_times* #NumberFormat(SESSION.Playground_mulch_service_materials,"999999.99")#>
<cfset SESSION.Playground_mulch_actual_extended  =  #ROUND(SESSION.Playground_mulch_actual_extended)#>
<cfset SESSION.Playground_mulch_total_hours = SESSION.Playground_mulch_hoursA*SESSION.Playground_mulch_times>
<cfset SESSION.Playground_mulch_overtime_adjustment =
SESSION.Playground_mulch_actual_extended -
(SESSION.Playground_mulch_total_hours*0.10* SESSION.Playground_mulch_cost)+
(SESSION.Playground_mulch_total_hours*0.10* SESSION.Playground_mulch_cost*1.5)>
<cfset SESSION.Playground_mulch_contract_price = SESSION.Playground_mulch_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Nutsedge_service_rate = 20.50>  --->
<cfset SESSION.Turf_Nutsedge_qty  = get_service_info.Turf_Nutsedge_qty >
<cfset SESSION.Turf_Nutsedge_cost  = get_service_info.Turf_Nutsedge_cost>
<cfset SESSION.Turf_Nutsedge_rate = get_service_info.Turf_Nutsedge_rate>
<cfset SESSION.Turf_Nutsedge_hours  = SESSION.Turf_Nutsedge_qty/SESSION.Turf_Nutsedge_rate>
<cfset SESSION.Turf_Nutsedge_hoursA = #NumberFormat(SESSION.Turf_Nutsedge_hours,"999999.9")#>
<cfset SESSION.Turf_Nutsedge_actualprice  = SESSION.Turf_Nutsedge_hours*SESSION.Turf_Nutsedge_cost>
<cfset SESSION.Turf_Nutsedge_materials_rate  = get_materials_info.Turf_Nutsedge_materials_rate>
<!--- <cfset SESSION.Turf_Nutsedge_materials_qty = get_materials_info.Turf_Nutsedge_materials_qty>--->
<!---<cfset SESSION.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty /10000)>
<cfset SESSION.Turf_Nutsedge_materials_qty= #NumberFormat(SESSION.Turf_Nutsedge_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Nutsedge_qty")>
  <CFSET Turf_Nutsedge_qty_post  =form.Turf_Nutsedge_qty>
</cfif>
<cfset SESSION.Turf_Nutsedge_materials_qty_actual=(get_service_info.Turf_Nutsedge_qty/10000)>
<cfset SESSION.Turf_Nutsedge_materials_qty_actual=#NumberFormat(SESSION.Turf_Nutsedge_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Nutsedge_materials_qty")    AND  get_materials_info.Turf_Nutsedge_materials_qty  EQ SESSION.Turf_Nutsedge_materials_qty_actual  AND SESSION.Turf_Nutsedge_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Nutsedge_materials_qty")    AND get_materials_info.Turf_Nutsedge_materials_qty  EQ form.Turf_Nutsedge_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Nutsedge_qty_pre")   AND   IsDefined("Turf_Nutsedge_qty_post") AND Turf_Nutsedge_qty_pre NEQ  Turf_Nutsedge_qty_post>
  <cfset SESSION.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Nutsedge_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Nutsedge_materials_qty=(form.Turf_Nutsedge_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Nutsedge_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
  <cfelse>
  <cfset SESSION.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
</cfif>
<cfset SESSION.Turf_Nutsedge_materials_qty = #NumberFormat(SESSION.Turf_Nutsedge_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Nutsedge_materials_actualprice = SESSION.Turf_Nutsedge_MATERIALS_rate*SESSION.Turf_Nutsedge_materials_qty>
<cfset SESSION.Turf_Nutsedge_materials_actualprice = #NumberFormat(SESSION.Turf_Nutsedge_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Nutsedge_service_materials  = SESSION.Turf_Nutsedge_actualprice+SESSION.Turf_Nutsedge_materials_actualprice >
<cfset SESSION.Turf_Nutsedge_times  = get_service_info.Turf_Nutsedge_times>
<cfset SESSION.Turf_Nutsedge_actual_extended  = SESSION.Turf_Nutsedge_times* #NumberFormat(SESSION.Turf_Nutsedge_service_materials,"999999.99")#>
<cfset SESSION.Turf_Nutsedge_actual_extended  =  #ROUND(SESSION.Turf_Nutsedge_actual_extended)#>
<cfset SESSION.Turf_Nutsedge_total_hours = SESSION.Turf_Nutsedge_hoursA*SESSION.Turf_Nutsedge_times>
<cfset SESSION.Turf_Nutsedge_overtime_adjustment =
SESSION.Turf_Nutsedge_actual_extended -
(SESSION.Turf_Nutsedge_total_hours*0.10* SESSION.Turf_Nutsedge_cost)+
(SESSION.Turf_Nutsedge_total_hours*0.10* SESSION.Turf_Nutsedge_cost*1.5)>
<cfset SESSION.Turf_Nutsedge_contract_price = SESSION.Turf_Nutsedge_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Fungicide_service_rate = 20.50>  --->
<cfset SESSION.Turf_Fungicide_qty  = get_service_info.Turf_Fungicide_qty >
<cfset SESSION.Turf_Fungicide_cost  = get_service_info.Turf_Fungicide_cost>
<cfset SESSION.Turf_Fungicide_rate = get_service_info.Turf_Fungicide_rate>
<cfset SESSION.Turf_Fungicide_hours  = SESSION.Turf_Fungicide_qty/SESSION.Turf_Fungicide_rate>
<cfset SESSION.Turf_Fungicide_hoursA = #NumberFormat(SESSION.Turf_Fungicide_hours,"999999.9")#>
<cfset SESSION.Turf_Fungicide_actualprice  = SESSION.Turf_Fungicide_hours*SESSION.Turf_Fungicide_cost>
<cfset SESSION.Turf_Fungicide_materials_rate  = get_materials_info.Turf_Fungicide_materials_rate>
<!--- <cfset SESSION.Turf_Fungicide_materials_qty = get_materials_info.Turf_Fungicide_materials_qty>--->
<!---<cfset SESSION.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty /10000)>
<cfset SESSION.Turf_Fungicide_materials_qty= #NumberFormat(SESSION.Turf_Fungicide_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Fungicide_qty")>
  <CFSET Turf_Fungicide_qty_post  =form.Turf_Fungicide_qty>
</cfif>
<cfset SESSION.Turf_Fungicide_materials_qty_actual=(get_service_info.Turf_Fungicide_qty/10000)>
<cfset SESSION.Turf_Fungicide_materials_qty_actual=#NumberFormat(SESSION.Turf_Fungicide_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Fungicide_materials_qty")    AND  get_materials_info.Turf_Fungicide_materials_qty  EQ SESSION.Turf_Fungicide_materials_qty_actual  AND SESSION.Turf_Fungicide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Fungicide_materials_qty")    AND get_materials_info.Turf_Fungicide_materials_qty  EQ form.Turf_Fungicide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Fungicide_qty_pre")   AND   IsDefined("Turf_Fungicide_qty_post") AND Turf_Fungicide_qty_pre NEQ  Turf_Fungicide_qty_post>
  <cfset SESSION.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Fungicide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Fungicide_materials_qty=(form.Turf_Fungicide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Fungicide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
  <cfelse>
  <cfset SESSION.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
</cfif>
<cfset SESSION.Turf_Fungicide_materials_qty = #NumberFormat(SESSION.Turf_Fungicide_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Fungicide_materials_actualprice = SESSION.Turf_Fungicide_MATERIALS_rate*SESSION.Turf_Fungicide_materials_qty>
<cfset SESSION.Turf_Fungicide_materials_actualprice = #NumberFormat(SESSION.Turf_Fungicide_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Fungicide_service_materials  = SESSION.Turf_Fungicide_actualprice+SESSION.Turf_Fungicide_materials_actualprice >
<cfset SESSION.Turf_Fungicide_times  = get_service_info.Turf_Fungicide_times>
<cfset SESSION.Turf_Fungicide_actual_extended  = SESSION.Turf_Fungicide_times* #NumberFormat(SESSION.Turf_Fungicide_service_materials,"999999.99")#>
<cfset SESSION.Turf_Fungicide_actual_extended  =  #ROUND(SESSION.Turf_Fungicide_actual_extended)#>
<cfset SESSION.Turf_Fungicide_total_hours = SESSION.Turf_Fungicide_hoursA*SESSION.Turf_Fungicide_times>
<cfset SESSION.Turf_Fungicide_overtime_adjustment =
SESSION.Turf_Fungicide_actual_extended -
(SESSION.Turf_Fungicide_total_hours*0.10* SESSION.Turf_Fungicide_cost)+
(SESSION.Turf_Fungicide_total_hours*0.10* SESSION.Turf_Fungicide_cost*1.5)>
<cfset SESSION.Turf_Fungicide_contract_price = SESSION.Turf_Fungicide_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Insecticide_service_rate = 20.50>  --->
<cfset SESSION.Turf_Insecticide_qty  = get_service_info.Turf_Insecticide_qty >
<cfset SESSION.Turf_Insecticide_cost  = get_service_info.Turf_Insecticide_cost>
<cfset SESSION.Turf_Insecticide_rate = get_service_info.Turf_Insecticide_rate>
<cfset SESSION.Turf_Insecticide_hours  = SESSION.Turf_Insecticide_qty/SESSION.Turf_Insecticide_rate>
<cfset SESSION.Turf_Insecticide_hoursA = #NumberFormat(SESSION.Turf_Insecticide_hours,"999999.9")#>
<cfset SESSION.Turf_Insecticide_actualprice  = SESSION.Turf_Insecticide_hours*SESSION.Turf_Insecticide_cost>
<cfset SESSION.Turf_Insecticide_materials_rate  = get_materials_info.Turf_Insecticide_materials_rate>
<!---<cfset SESSION.Turf_Insecticide_materials_qty = get_materials_info.Turf_Insecticide_materials_qty> --->
<!---<cfset SESSION.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty /10000)>
<cfset SESSION.Turf_Insecticide_materials_qty = #NumberFormat(SESSION.Turf_Insecticide_materials_qty,"999999.99")#>--->

<cfif  IsDefined("form.Turf_Insecticide_qty")>
  <CFSET Turf_Insecticide_qty_post  =form.Turf_Insecticide_qty>
</cfif>
<cfset SESSION.Turf_Insecticide_materials_qty_actual=(get_service_info.Turf_Insecticide_qty/10000)>
<cfset SESSION.Turf_Insecticide_materials_qty_actual=#NumberFormat(SESSION.Turf_Insecticide_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.Turf_Insecticide_materials_qty")    AND  get_materials_info.Turf_Insecticide_materials_qty  EQ SESSION.Turf_Insecticide_materials_qty_actual  AND SESSION.Turf_Insecticide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Insecticide_materials_qty")    AND get_materials_info.Turf_Insecticide_materials_qty  EQ form.Turf_Insecticide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Insecticide_qty_pre")   AND   IsDefined("Turf_Insecticide_qty_post") AND Turf_Insecticide_qty_pre NEQ  Turf_Insecticide_qty_post>
  <cfset SESSION.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Insecticide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Turf_Insecticide_materials_qty=(form.Turf_Insecticide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Insecticide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
  <cfelse>
  <cfset SESSION.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
</cfif>
<cfset SESSION.Turf_Insecticide_materials_qty = #NumberFormat(SESSION.Turf_Insecticide_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Insecticide_materials_actualprice = SESSION.Turf_Insecticide_MATERIALS_rate*SESSION.Turf_Insecticide_materials_qty>
<cfset SESSION.Turf_Insecticide_materials_actualprice = #NumberFormat(SESSION.Turf_Insecticide_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Insecticide_service_materials  = SESSION.Turf_Insecticide_actualprice+SESSION.Turf_Insecticide_materials_actualprice >
<cfset SESSION.Turf_Insecticide_times  = get_service_info.Turf_Insecticide_times>
<cfset SESSION.Turf_Insecticide_actual_extended  = SESSION.Turf_Insecticide_times* #NumberFormat(SESSION.Turf_Insecticide_service_materials,"999999.99")#>
<cfset SESSION.Turf_Insecticide_actual_extended  =  #ROUND(SESSION.Turf_Insecticide_actual_extended)#>
<cfset SESSION.Turf_Insecticide_total_hours = SESSION.Turf_Insecticide_hoursA*SESSION.Turf_Insecticide_times>
<cfset SESSION.Turf_Insecticide_overtime_adjustment =
SESSION.Turf_Insecticide_actual_extended -
(SESSION.Turf_Insecticide_total_hours*0.10* SESSION.Turf_Insecticide_cost)+
(SESSION.Turf_Insecticide_total_hours*0.10* SESSION.Turf_Insecticide_cost*1.5)>
<cfset SESSION.Turf_Insecticide_contract_price = SESSION.Turf_Insecticide_overtime_adjustment / SESSION.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset SESSION.blank1_service_rate =get_service_info.blank1_service_rate>  --->
<cfset SESSION.blank1_service  = get_service_info.blank1_service>
<cfset SESSION.blank1_unit  = get_service_info.blank1_unit>
<cfset SESSION.blank1_qty  = get_service_info.blank1_qty>
<cfset SESSION.blank1_cost  =  get_service_info.blank1_cost>
<cfset SESSION.blank1_rate =get_service_info.blank1_rate>
<cfset SESSION.blank1_hours  = SESSION.blank1_qty/SESSION.blank1_rate>
<cfset SESSION.blank1_hoursA = #NumberFormat(SESSION.blank1_hours,"999999.9")#>
<cfset SESSION.blank1_actualprice  = SESSION.blank1_hours*SESSION.blank1_cost>
<cfset SESSION.blank1_materials_rate  = 0>
<cfset SESSION.blank1_materials_qty = 0>
<cfset SESSION.blank1_materials_actualprice = SESSION.blank1_MATERIALS_rate*SESSION.blank1_materials_qty>
<cfset SESSION.blank1_service_materials  = SESSION.blank1_actualprice+SESSION.blank1_materials_actualprice >
<cfset SESSION.blank1_times  = get_service_info.blank1_times>
<cfset SESSION.blank1_actual_extended  = SESSION.blank1_times* #NumberFormat(SESSION.blank1_service_materials,"999999.99")#>
<cfset SESSION.blank1_actual_extended  =  #ROUND(SESSION.blank1_actual_extended)#>
<cfset SESSION.blank1_total_hours = SESSION.blank1_hoursA*SESSION.blank1_times>
<cfset SESSION.blank1_gm  = get_service_info.blank1_gm >
<cfset SESSION.gross_margin_diff_blank1 = (100-SESSION.blank1_gm)/100>
<cfset SESSION.blank1_overtime_adjustment =
SESSION.blank1_actual_extended -
(SESSION.blank1_total_hours*0.10* SESSION.blank1_cost)+
(SESSION.blank1_total_hours*0.10* SESSION.blank1_cost*1.5)>
<cfset SESSION.blank1_contract_price = SESSION.blank1_overtime_adjustment / SESSION.gross_margin_diff_blank1>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset SESSION.blank2_service_rate =get_service_info.blank2_service_rate>  --->
<cfset SESSION.blank2_service  = get_service_info.blank2_service>
<cfset SESSION.blank2_unit  = get_service_info.blank2_unit>
<cfset SESSION.blank2_qty  = get_service_info.blank2_qty>
<cfset SESSION.blank2_cost  =  get_service_info.blank2_cost>
<cfset SESSION.blank2_rate =get_service_info.blank2_rate>
<cfset SESSION.blank2_hours  = SESSION.blank2_qty/SESSION.blank2_rate>
<cfset SESSION.blank2_hoursA = #NumberFormat(SESSION.blank2_hours,"999999.9")#>
<cfset SESSION.blank2_actualprice  = SESSION.blank2_hours*SESSION.blank2_cost>
<cfset SESSION.blank2_materials_rate  = 0>
<cfset SESSION.blank2_materials_qty = 0>
<cfset SESSION.blank2_materials_actualprice = SESSION.blank2_MATERIALS_rate*SESSION.blank2_materials_qty>
<cfset SESSION.blank2_service_materials  = SESSION.blank2_actualprice+SESSION.blank2_materials_actualprice >
<cfset SESSION.blank2_times  = get_service_info.blank2_times>
<cfset SESSION.blank2_actual_extended  = SESSION.blank2_times* #NumberFormat(SESSION.blank2_service_materials,"999999.99")#>
<cfset SESSION.blank2_actual_extended  =  #ROUND(SESSION.blank2_actual_extended)#>
<cfset SESSION.blank2_total_hours = SESSION.blank2_hoursA*SESSION.blank2_times>
<cfset SESSION.blank2_gm  = get_service_info.blank2_gm >
<cfset SESSION.gross_margin_diff_blank2 = (100-SESSION.blank2_gm)/100>
<cfset SESSION.blank2_overtime_adjustment =
SESSION.blank2_actual_extended -
(SESSION.blank2_total_hours*0.10* SESSION.blank2_cost)+
(SESSION.blank2_total_hours*0.10* SESSION.blank2_cost*1.5)>
<cfset SESSION.blank2_contract_price = SESSION.blank2_overtime_adjustment / SESSION.gross_margin_diff_blank2>
<!------------------------------------------------------------------------------------------------------------->
<!---<cfset SESSION.blank3_service_rate =get_service_info.blank3_service_rate>  --->
<cfset SESSION.blank3_service  = get_service_info.blank3_service>
<cfset SESSION.blank3_unit  = get_service_info.blank3_unit>
<cfset SESSION.blank3_qty  = get_service_info.blank3_qty>
<cfset SESSION.blank3_cost  =  get_service_info.blank3_cost>
<cfset SESSION.blank3_rate =get_service_info.blank3_rate>
<cfset SESSION.blank3_hours  = SESSION.blank3_qty/SESSION.blank3_rate>
<cfset SESSION.blank3_hoursA = #NumberFormat(SESSION.blank3_hours,"999999.9")#>
<cfset SESSION.blank3_actualprice  = SESSION.blank3_hours*SESSION.blank3_cost>
<cfset SESSION.blank3_materials_rate  = 0>
<cfset SESSION.blank3_materials_qty = 0>
<cfset SESSION.blank3_materials_actualprice = SESSION.blank3_MATERIALS_rate*SESSION.blank3_materials_qty>
<cfset SESSION.blank3_service_materials  = SESSION.blank3_actualprice+SESSION.blank3_materials_actualprice >
<cfset SESSION.blank3_times  = get_service_info.blank3_times>
<cfset SESSION.blank3_actual_extended  = SESSION.blank3_times* #NumberFormat(SESSION.blank3_service_materials,"999999.99")#>
<cfset SESSION.blank3_actual_extended  =  #ROUND(SESSION.blank3_actual_extended)#>
<cfset SESSION.blank3_total_hours = SESSION.blank3_hoursA*SESSION.blank3_times>
<cfset SESSION.blank3_gm  = get_service_info.blank3_gm >
<cfset SESSION.gross_margin_diff_blank3 = (100-SESSION.blank3_gm)/100>
<cfset SESSION.blank3_overtime_adjustment =
SESSION.blank3_actual_extended -
(SESSION.blank3_total_hours*0.10* SESSION.blank3_cost)+
(SESSION.blank3_total_hours*0.10* SESSION.blank3_cost*1.5)>
<cfset SESSION.blank3_contract_price = SESSION.blank3_overtime_adjustment / SESSION.gross_margin_diff_blank3>

<!------------------------------------------------------------------------------------------------------------->
<!---<!------------------------------------------------------------------------------------------------------------->
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
<cfset Session.TRIM_O_hoursA = #NumberFormat(Session.TRIM_O_hours,"999,999.9")#>
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
<cfif  IsDefined("form.spraying_qty")>
  <CFSET spraying_qty_post  =form.spraying_qty>
</cfif>
<cfset Session.spraying_materials_qty_actual=(get_service_info.spraying_qty /166)>
<cfset Session.spraying_materials_qty_actual=#NumberFormat(Session.spraying_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.spraying_materials_qty")    AND  get_materials_info.spraying_materials_qty  EQ Session.spraying_materials_qty_actual  AND Session.spraying_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif   IsDefined("form.spraying_materials_qty")    AND get_materials_info.spraying_materials_qty  EQ form.spraying_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")   <!---AND  form.spraying_materials_qty NEQ 0 --->
  AND   IsDefined(&quot;spraying_qty_pre&quot;)   AND   IsDefined(&quot;spraying_qty_post&quot;) AND spraying_qty_pre NEQ  spraying_qty_post&gt;
  <cfset Session.spraying_materials_qty=(get_service_info.spraying_qty /166)>
  <cfelseif  IsDefined("form.spraying_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.spraying_materials_qty=(form.SPRAYING_MATERIALS_QTY)>
  <cfelseif   NOT IsDefined("form.spraying_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
  <cfelse>--->
<cfset Session.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
<!---</cfif>--->
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
<!---<cfset Session.travel_time_gm  = get_service_info.travel_time_gm >
<cfset Session.gross_margin_diff_travel_time = (100-SESSION.travel_time_gm)/100>--->
<cfset Session.traveltime_overtime_adjustment =
Session.traveltime_actual_extended -
(Session.traveltime_total_hours*0.10* Session.traveltime_cost)+
(Session.traveltime_total_hours*0.10* Session.traveltime_cost*1.5)>
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
<!---<cfif  IsDefined("form.turf_preg_materials_qty")    AND  get_materials_info.turf_preg_materials_qty  EQ Session.turf_preg_materials_qty_actual  AND Session.turf_preg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif   IsDefined("form.turf_preg_materials_qty")    AND get_materials_info.turf_preg_materials_qty  EQ form.turf_preg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")       AND   IsDefined("turf_preg_qty_pre")   AND   IsDefined("turf_preg_qty_post") AND turf_preg_qty_pre NEQ  turf_preg_qty_post>
  <cfset Session.turf_preg_materials_qty=(get_service_info.turf_preg_qty /207)>
  <cfelseif  IsDefined("form.turf_preg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_preg_materials_qty=(form.turf_preg_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_preg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
  <cfelse>--->
<cfset Session.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.turf_prel_materials_qty")    AND  get_materials_info.turf_prel_materials_qty  EQ Session.turf_prel_materials_qty_actual  AND Session.turf_prel_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif   IsDefined("form.turf_prel_materials_qty")    AND get_materials_info.turf_prel_materials_qty  EQ form.turf_prel_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_prel_qty_pre")   AND   IsDefined("turf_prel_qty_post") AND turf_prel_qty_pre NEQ  turf_prel_qty_post>
  <cfset Session.turf_prel_materials_qty=(get_service_info.turf_prel_qty /10000)>
  <cfelseif  IsDefined("form.turf_prel_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_prel_materials_qty=(form.turf_prel_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_prel_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
  <cfelse>--->
<cfset Session.turf_prel_materials_qty=(get_materials_info.turf_prel_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.turf_post_qty")>
  <CFSET turf_post_qty_post  =form.turf_post_qty>
</cfif>--->
<cfset Session.turf_post_materials_qty_actual=(get_service_info.turf_post_qty /580)>
<cfset Session.turf_post_materials_qty_actual=#NumberFormat(Session.turf_post_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.turf_post_materials_qty")    AND  get_materials_info.turf_post_materials_qty  EQ Session.turf_post_materials_qty_actual  AND Session.turf_post_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif   IsDefined("form.turf_post_materials_qty")    AND get_materials_info.turf_post_materials_qty  EQ form.turf_post_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_post_qty_pre")   AND   IsDefined("turf_post_qty_post") AND turf_post_qty_pre NEQ  turf_post_qty_post>
  <cfset Session.turf_post_materials_qty=(get_service_info.turf_post_qty /580)>
  <cfelseif  IsDefined("form.turf_post_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_post_materials_qty=(form.turf_post_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_post_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
  <cfelse>--->
<cfset Session.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.turf_fert_qty")>
  <CFSET turf_fert_qty_post  =form.turf_fert_qty>
</cfif>
--->
<cfset Session.turf_fert_materials_qty_actual=(get_service_info.turf_fert_qty /240)>
<cfset Session.turf_fert_materials_qty_actual=#NumberFormat(Session.turf_fert_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.turf_fert_materials_qty")    AND  get_materials_info.turf_fert_materials_qty  EQ Session.turf_fert_materials_qty_actual  AND Session.turf_fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif   IsDefined("form.turf_fert_materials_qty")    AND get_materials_info.turf_fert_materials_qty  EQ form.turf_fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("turf_fert_qty_pre")   AND   IsDefined("turf_fert_qty_post") AND turf_fert_qty_pre NEQ  turf_fert_qty_post>
  <cfset Session.turf_fert_materials_qty=(get_service_info.turf_fert_qty /240)>
  <cfelseif  IsDefined("form.turf_fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_fert_materials_qty=(form.turf_fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
  <cfelse>--->
<cfset Session.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.turf_lime_qty")>
  <CFSET turf_lime_qty_post  =form.turf_lime_qty>
</cfif>--->
<cfset Session.turf_lime_materials_qty_actual=(get_service_info.turf_lime_qty /40)>
<cfset Session.turf_lime_materials_qty_actual=#NumberFormat(Session.turf_lime_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.turf_lime_materials_qty")    AND  get_materials_info.turf_lime_materials_qty  EQ Session.turf_lime_materials_qty_actual  AND Session.turf_lime_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif   IsDefined("form.turf_lime_materials_qty")    AND get_materials_info.turf_lime_materials_qty  EQ form.turf_lime_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_lime_qty_pre")   AND   IsDefined("turf_lime_qty_post") AND turf_lime_qty_pre NEQ  turf_lime_qty_post>
  <cfset Session.turf_lime_materials_qty=(get_service_info.turf_lime_qty /40)>
  <cfelseif  IsDefined("form.turf_lime_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_lime_materials_qty=(form.turf_lime_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_lime_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
  <cfelse>
--->
<cfset Session.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
<!---</cfif>--->
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
<cfset Session.Turf_Aer_T_hoursA = #NumberFormat(Session.Turf_Aer_T_hours,"999,999.9")#>
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
<cfset Session.Turf_Seed_hoursA = #NumberFormat(Session.Turf_Seed_hours,"999,999.9")#>
<cfset Session.Turf_Seed_actualprice  = Session.Turf_Seed_hours*Session.Turf_Seed_cost>
<cfset Session.Turf_Seed_materials_rate  = get_materials_info.Turf_Seed_materials_rate>
<!---<cfset Session.Turf_Seed_materials_qty = get_materials_info.Turf_Seed_materials_qty>
<cfset Session.Turf_Seed_materials_qty=(get_service_info.Turf_Seed_qty /250)>
<cfset Session.Turf_Seed_materials_qty = #NumberFormat(Session.Turf_Seed_materials_qty,"999999.99")#>--->
<!---<cfif  IsDefined("form.turf_seed_qty")>
  <CFSET turf_seed_qty_post  =form.turf_seed_qty>
</cfif>--->
<cfset Session.turf_seed_materials_qty_actual=(get_service_info.turf_seed_qty /250)>
<cfset Session.turf_seed_materials_qty_actual=#NumberFormat(Session.turf_seed_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.turf_seed_materials_qty")    AND  get_materials_info.turf_seed_materials_qty  EQ Session.turf_seed_materials_qty_actual  AND Session.turf_seed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif   IsDefined("form.turf_seed_materials_qty")    AND get_materials_info.turf_seed_materials_qty  EQ form.turf_seed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_seed_qty_pre")   AND   IsDefined("turf_seed_qty_post") AND turf_seed_qty_pre NEQ  turf_seed_qty_post>
  <cfset Session.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
  <cfelseif  IsDefined("form.turf_seed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.turf_seed_materials_qty=(form.turf_seed_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_seed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
  <cfelse>--->
<cfset Session.turf_seed_materials_qty=(get_materials_info.turf_seed_materials_qty)>
<!---</cfif>--->
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
<cfset Session.Pruning_TP_hoursA = #NumberFormat(Session.Pruning_TP_hours,"999,999.9")#>
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
<cfset Session.Pruning_S_hoursA = #NumberFormat(Session.Pruning_S_hours,"999,999.9")#>
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
<cfset Session.TS_Fert_hoursA = #NumberFormat(Session.TS_Fert_hours,"999,999.9")#>
<cfset Session.TS_Fert_actualprice  = Session.TS_Fert_hours*Session.TS_Fert_cost>
<cfset Session.TS_Fert_materials_rate  = get_materials_info.TS_Fert_materials_rate>
<!--- <cfset Session.TS_Fert_materials_qty = get_materials_info.TS_Fert_materials_qty> --->
<!---<cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.33)>
<cfset Session.TS_Fert_materials_qty = #NumberFormat(Session.TS_Fert_materials_qty,"999999.99")#>--->
<!---<cfif  IsDefined("form.TS_Fert_qty")>
  <CFSET TS_Fert_qty_post  =form.TS_Fert_qty>
</cfif>--->
<cfset Session.TS_Fert_materials_qty_actual=(get_service_info.TS_Fert_qty /33.3)>
<cfset Session.TS_Fert_materials_qty_actual=#NumberFormat(Session.TS_Fert_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.TS_Fert_materials_qty")    AND  get_materials_info.TS_Fert_materials_qty  EQ Session.TS_Fert_materials_qty_actual  AND Session.TS_Fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif   IsDefined("form.TS_Fert_materials_qty")    AND get_materials_info.TS_Fert_materials_qty  EQ form.TS_Fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Fert_qty_pre")   AND   IsDefined("TS_Fert_qty_post") AND TS_Fert_qty_pre NEQ  TS_Fert_qty_post>
  <cfset Session.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /33.3)>
  <cfelseif  IsDefined("form.TS_Fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Fert_materials_qty=(form.TS_Fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
  <cfelse>--->
<cfset Session.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
<!---</cfif>--->
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
<cfset Session.TS_Insect_hoursA = #NumberFormat(Session.TS_Insect_hours,"999,999.9")#>
<cfset Session.TS_Insect_actualprice  = Session.TS_Insect_hours*Session.TS_Insect_cost>
<cfset Session.TS_Insect_materials_rate  = get_materials_info.TS_Insect_materials_rate>
<!--- <cfset Session.TS_Insect_materials_qty = get_materials_info.TS_Insect_materials_qty> --->
<!---<cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
<cfset Session.TS_Insect_materials_qty = #NumberFormat(Session.TS_Insect_materials_qty,"999999.99")#>--->
<!---<cfif  IsDefined("form.TS_Insect_qty")>
  <CFSET TS_Insect_qty_post  =form.TS_Insect_qty>
</cfif>--->
<cfset Session.TS_Insect_materials_qty_actual=(get_service_info.TS_Insect_qty*2)>
<cfset Session.TS_Insect_materials_qty_actual=#NumberFormat(Session.TS_Insect_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.TS_Insect_materials_qty")    AND  get_materials_info.TS_Insect_materials_qty  EQ Session.TS_Insect_materials_qty_actual  AND Session.TS_Insect_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif   IsDefined("form.TS_Insect_materials_qty")    AND get_materials_info.TS_Insect_materials_qty  EQ form.TS_Insect_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Insect_qty_pre")   AND   IsDefined("TS_Insect_qty_post") AND TS_Insect_qty_pre NEQ  TS_Insect_qty_post>
  <cfset Session.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *2)>
  <cfelseif  IsDefined("form.TS_Insect_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_Insect_materials_qty=(form.TS_Insect_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Insect_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
  <cfelse>--->
<cfset Session.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.Mulch_pre_qty")>
  <CFSET Mulch_pre_qty_post  =form.Mulch_pre_qty>
</cfif>--->
<cfset Session.Mulch_pre_materials_qty_actual=(get_service_info.Mulch_pre_qty /8000)>
<cfset Session.Mulch_pre_materials_qty_actual=#NumberFormat(Session.Mulch_pre_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.Mulch_pre_materials_qty")    AND  get_materials_info.Mulch_pre_materials_qty  EQ Session.Mulch_pre_materials_qty_actual  AND Session.Mulch_pre_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif   IsDefined("form.Mulch_pre_materials_qty")    AND get_materials_info.Mulch_pre_materials_qty  EQ form.Mulch_pre_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Mulch_pre_qty_pre")   AND   IsDefined("Mulch_pre_qty_post") AND Mulch_pre_qty_pre NEQ  Mulch_pre_qty_post>
  <cfset Session.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /8000)>
  <cfelseif  IsDefined("form.Mulch_pre_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Mulch_pre_materials_qty=(form.Mulch_pre_materials_qty)>
  <cfelseif   NOT IsDefined("form.Mulch_pre_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
  <cfelse>--->
<cfset Session.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.mulch_s_dyed_qty")>
  <CFSET mulch_s_dyed_qty_post  =form.mulch_s_dyed_qty>
</cfif>--->
<cfset Session.mulch_s_dyed_materials_qty_actual=(get_service_info.mulch_s_dyed_qty /162)>
<cfset Session.mulch_s_dyed_materials_qty_actual=#NumberFormat(Session.mulch_s_dyed_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.mulch_s_dyed_materials_qty")    AND  get_materials_info.mulch_s_dyed_materials_qty  EQ Session.mulch_s_dyed_materials_qty_actual  AND Session.mulch_s_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_dyed_materials_qty")    AND get_materials_info.mulch_s_dyed_materials_qty  EQ form.mulch_s_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_dyed_qty_pre")   AND   IsDefined("mulch_s_dyed_qty_post") AND mulch_s_dyed_qty_pre NEQ  mulch_s_dyed_qty_post>
  <cfset Session.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_dyed_materials_qty=(form.mulch_s_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
  <cfelse>--->
<cfset Session.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.mulch_f_dyed_qty")>
  <CFSET mulch_f_dyed_qty_post  =form.mulch_f_dyed_qty>
</cfif>--->
<cfset Session.mulch_f_dyed_materials_qty_actual=(get_service_info.mulch_f_dyed_qty /324)>
<cfset Session.mulch_f_dyed_materials_qty_actual=#NumberFormat(Session.mulch_f_dyed_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.mulch_f_dyed_materials_qty")    AND  get_materials_info.mulch_f_dyed_materials_qty  EQ Session.mulch_f_dyed_materials_qty_actual  AND Session.mulch_f_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_dyed_materials_qty")    AND get_materials_info.mulch_f_dyed_materials_qty  EQ form.mulch_f_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_dyed_qty_pre")   AND   IsDefined("mulch_f_dyed_qty_post") AND mulch_f_dyed_qty_pre NEQ  mulch_f_dyed_qty_post>
  <cfset Session.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_dyed_materials_qty=(form.mulch_f_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
  <cfelse>--->
<cfset Session.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
<!---</cfif>--->
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
<!---<cfset Session.Irrigation_SU_overtime_adjustment = Session.Irrigation_SU_actual_extended >
<cfset Session.Irrigation_SU_contract_price = Session.Irrigation_SU_overtime_adjustment >--->

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
<!---<cfset Session.Irrigation_W_overtime_adjustment = Session.Irrigation_W_actual_extended >
<cfset Session.Irrigation_W_contract_price = Session.Irrigation_W_overtime_adjustment >--->

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
<!---<cfset Session.Irrigation_I_overtime_adjustment = Session.Irrigation_I_actual_extended>
<cfset Session.Irrigation_I_contract_price = Session.Irrigation_I_overtime_adjustment >--->

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
<cfset Session.Mulch_F_Reg_hoursA = #NumberFormat(Session.Mulch_F_Reg_hours,"999999.9")#>
<cfset Session.Mulch_F_Reg_actualprice  = Session.Mulch_F_Reg_hours*Session.Mulch_F_Reg_cost>
<cfset Session.Mulch_F_Reg_materials_rate  = get_materials_info.Mulch_F_Reg_materials_rate>
<!--- <cfset Session.Mulch_F_Reg_materials_qty = get_materials_info.Mulch_F_Reg_materials_qty>
 --->
<!---<cfset Session.Mulch_F_Reg_materials_qty=(get_service_info.Mulch_F_Reg_qty /324)>
<cfset Session.Mulch_F_Reg_materials_qty = #NumberFormat(Session.Mulch_F_Reg_materials_qty,"999999.9")#>--->
<!---<cfif  IsDefined("form.mulch_f_reg_qty")>
  <CFSET mulch_f_reg_qty_post  =form.mulch_f_reg_qty>
</cfif>--->
<cfset Session.mulch_f_reg_materials_qty_actual=(get_service_info.mulch_f_reg_qty /324)>
<cfset Session.mulch_f_reg_materials_qty_actual=#NumberFormat(Session.mulch_f_reg_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.mulch_f_reg_materials_qty")    AND  get_materials_info.mulch_f_reg_materials_qty  EQ Session.mulch_f_reg_materials_qty_actual  AND Session.mulch_f_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif   IsDefined("form.mulch_f_reg_materials_qty")    AND get_materials_info.mulch_f_reg_materials_qty  EQ form.mulch_f_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_reg_qty_pre")   AND   IsDefined("mulch_f_reg_qty_post") AND mulch_f_reg_qty_pre NEQ  mulch_f_reg_qty_post>
  <cfset Session.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /324)>
  <cfelseif  IsDefined("form.mulch_f_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_f_reg_materials_qty=(form.mulch_f_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
  <cfelse>--->
<cfset Session.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.mulch_s_reg_qty")>
  <CFSET mulch_s_reg_qty_post  =form.mulch_s_reg_qty>
</cfif>--->
<cfset Session.mulch_s_reg_materials_qty_actual=(get_service_info.mulch_s_reg_qty /162)>
<cfset Session.mulch_s_reg_materials_qty_actual=#NumberFormat(Session.mulch_s_reg_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.mulch_s_reg_materials_qty")    AND  get_materials_info.mulch_s_reg_materials_qty  EQ Session.mulch_s_reg_materials_qty_actual  AND Session.mulch_s_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif   IsDefined("form.mulch_s_reg_materials_qty")    AND get_materials_info.mulch_s_reg_materials_qty  EQ form.mulch_s_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_reg_qty_pre")   AND   IsDefined("mulch_s_reg_qty_post") AND mulch_s_reg_qty_pre NEQ  mulch_s_reg_qty_post>
  <cfset Session.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /162)>
  <cfelseif  IsDefined("form.mulch_s_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.mulch_s_reg_materials_qty=(form.mulch_s_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
  <cfelse>--->
<cfset Session.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
<!---</cfif>--->
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
<cfset Session.Pond_Maint_hoursA = #NumberFormat(Session.Pond_Maint_hours,"999999.9")#>
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
<cfset Session.Trim_Hillside_hoursA = #NumberFormat(Session.Trim_Hillside_hours,"999999.9")#>
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
<!---<cfif  IsDefined("form.Pine_Tags_qty")>
  <CFSET Pine_Tags_qty_post  =form.Pine_Tags_qty>
</cfif>--->
<cfset Session.Pine_Tags_materials_qty_actual=(get_service_info.Pine_Tags_qty /65)>
<cfset Session.Pine_Tags_materials_qty_actual=#NumberFormat(Session.Pine_Tags_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.Pine_Tags_materials_qty")    AND  get_materials_info.Pine_Tags_materials_qty  EQ Session.Pine_Tags_materials_qty_actual  AND Session.Pine_Tags_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif   IsDefined("form.Pine_Tags_materials_qty")    AND get_materials_info.Pine_Tags_materials_qty  EQ form.Pine_Tags_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Pine_Tags_qty_pre")   AND   IsDefined("Pine_Tags_qty_post") AND Pine_Tags_qty_pre NEQ  Pine_Tags_qty_post>
  <cfset Session.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /65)>
  <cfelseif  IsDefined("form.Pine_Tags_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Pine_Tags_materials_qty=(form.Pine_Tags_materials_qty)>
  <cfelseif   NOT IsDefined("form.Pine_Tags_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
  <cfelse>--->
<cfset Session.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.TS_hort_oil_qty")>
  <CFSET TS_hort_oil_qty_post  =form.TS_hort_oil_qty>
</cfif>--->
<cfset Session.TS_hort_oil_materials_qty_actual=(get_service_info.TS_hort_oil_qty *128)>
<cfset Session.TS_hort_oil_materials_qty_actual=#NumberFormat(Session.TS_hort_oil_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.TS_hort_oil_materials_qty")    AND  get_materials_info.TS_hort_oil_materials_qty  EQ Session.TS_hort_oil_materials_qty_actual  AND Session.TS_hort_oil_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif   IsDefined("form.TS_hort_oil_materials_qty")    AND get_materials_info.TS_hort_oil_materials_qty  EQ form.TS_hort_oil_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_hort_oil_qty_pre")   AND   IsDefined("TS_hort_oil_qty_post") AND TS_hort_oil_qty_pre NEQ  TS_hort_oil_qty_post>
  <cfset Session.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *128)>
  <cfelseif  IsDefined("form.TS_hort_oil_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.TS_hort_oil_materials_qty=(form.TS_hort_oil_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_hort_oil_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
  <cfelse>--->
<cfset Session.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
<!---</cfif>--->
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
<!---<cfset Session.Irrigation_TM_overtime_adjustment =Session.Irrigation_TM_actual_extended >
<cfset Session.Irrigation_TM_contract_price = Session.Irrigation_TM_overtime_adjustment>--->

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
<!---<cfset Session.Irrigation_BFI_overtime_adjustment = Session.Irrigation_BFI_actual_extended>
<cfset Session.Irrigation_BFI_contract_price = Session.Irrigation_BFI_overtime_adjustment >--->

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
<!---<cfif  IsDefined("form.Playground_mulch_qty")>
  <CFSET Playground_mulch_qty_post  =form.Playground_mulch_qty>
</cfif>--->
<cfset Session.Playground_mulch_materials_qty_actual=(get_service_info.Playground_mulch_qty /162)>
<cfset Session.Playground_mulch_materials_qty_actual=#NumberFormat(Session.Playground_mulch_materials_qty_actual,"999999.9")#>
<!---<cfif  IsDefined("form.Playground_mulch_materials_qty")    AND  get_materials_info.Playground_mulch_materials_qty  EQ Session.Playground_mulch_materials_qty_actual  AND Session.Playground_mulch_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif   IsDefined("form.Playground_mulch_materials_qty")    AND get_materials_info.Playground_mulch_materials_qty  EQ form.Playground_mulch_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Playground_mulch_qty_pre")   AND   IsDefined("Playground_mulch_qty_post") AND Playground_mulch_qty_pre NEQ  Playground_mulch_qty_post>
  <cfset Session.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/162)>
  <cfelseif  IsDefined("form.Playground_mulch_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Playground_mulch_materials_qty=(form.Playground_mulch_materials_qty)>
  <cfelseif   NOT IsDefined("form.Playground_mulch_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
  <cfelse>--->
<cfset Session.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.Turf_Nutsedge_qty")>
  <CFSET Turf_Nutsedge_qty_post  =form.Turf_Nutsedge_qty>
</cfif>--->
<cfset Session.Turf_Nutsedge_materials_qty_actual=(get_service_info.Turf_Nutsedge_qty/10000)>
<cfset Session.Turf_Nutsedge_materials_qty_actual=#NumberFormat(Session.Turf_Nutsedge_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.Turf_Nutsedge_materials_qty")    AND  get_materials_info.Turf_Nutsedge_materials_qty  EQ Session.Turf_Nutsedge_materials_qty_actual  AND Session.Turf_Nutsedge_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Nutsedge_materials_qty")    AND get_materials_info.Turf_Nutsedge_materials_qty  EQ form.Turf_Nutsedge_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Nutsedge_qty_pre")   AND   IsDefined("Turf_Nutsedge_qty_post") AND Turf_Nutsedge_qty_pre NEQ  Turf_Nutsedge_qty_post>
  <cfset Session.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Nutsedge_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Nutsedge_materials_qty=(form.Turf_Nutsedge_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Nutsedge_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
  <cfelse>--->
<cfset Session.Turf_Nutsedge_materials_qty=(get_materials_info.Turf_Nutsedge_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.Turf_Fungicide_qty")>
  <CFSET Turf_Fungicide_qty_post  =form.Turf_Fungicide_qty>
</cfif>--->
<cfset Session.Turf_Fungicide_materials_qty_actual=(get_service_info.Turf_Fungicide_qty/10000)>
<cfset Session.Turf_Fungicide_materials_qty_actual=#NumberFormat(Session.Turf_Fungicide_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.Turf_Fungicide_materials_qty")    AND  get_materials_info.Turf_Fungicide_materials_qty  EQ Session.Turf_Fungicide_materials_qty_actual  AND Session.Turf_Fungicide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Fungicide_materials_qty")    AND get_materials_info.Turf_Fungicide_materials_qty  EQ form.Turf_Fungicide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Fungicide_qty_pre")   AND   IsDefined("Turf_Fungicide_qty_post") AND Turf_Fungicide_qty_pre NEQ  Turf_Fungicide_qty_post>
  <cfset Session.Turf_Fungicide_materials_qty=(get_service_info.Turf_Fungicide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Fungicide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Fungicide_materials_qty=(form.Turf_Fungicide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Fungicide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
  <cfelse>
--->
<cfset Session.Turf_Fungicide_materials_qty=(get_materials_info.Turf_Fungicide_materials_qty)>
<!---</cfif>--->
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
<!---<cfif  IsDefined("form.Turf_Insecticide_qty")>
  <CFSET Turf_Insecticide_qty_post  =form.Turf_Insecticide_qty>
</cfif>--->
<cfset Session.Turf_Insecticide_materials_qty_actual=(get_service_info.Turf_Insecticide_qty/10000)>
<cfset Session.Turf_Insecticide_materials_qty_actual=#NumberFormat(Session.Turf_Insecticide_materials_qty_actual,"999999.99")#>
<!---<cfif  IsDefined("form.Turf_Insecticide_materials_qty")    AND  get_materials_info.Turf_Insecticide_materials_qty  EQ Session.Turf_Insecticide_materials_qty_actual  AND Session.Turf_Insecticide_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif   IsDefined("form.Turf_Insecticide_materials_qty")    AND get_materials_info.Turf_Insecticide_materials_qty  EQ form.Turf_Insecticide_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Turf_Insecticide_qty_pre")   AND   IsDefined("Turf_Insecticide_qty_post") AND Turf_Insecticide_qty_pre NEQ  Turf_Insecticide_qty_post>
  <cfset Session.Turf_Insecticide_materials_qty=(get_service_info.Turf_Insecticide_qty/10000)>
  <cfelseif  IsDefined("form.Turf_Insecticide_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset Session.Turf_Insecticide_materials_qty=(form.Turf_Insecticide_materials_qty)>
  <cfelseif   NOT IsDefined("form.Turf_Insecticide_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset Session.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
  <cfelse>--->
<cfset Session.Turf_Insecticide_materials_qty=(get_materials_info.Turf_Insecticide_materials_qty)>
<!---</cfif>--->
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
<!------------------------------------------------------------------------------------------------------------->--->
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

<CFIF  SESSION.Contract_Adjustment EQ ''>
  <CFSET SESSION.Contract_Adjustment=0>
</CFIF>
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
+ ROUND(SESSION.Contract_Adjustment)>

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
<!---<!--- Sales Tax  --->
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
<cfset Session.Seasonal_Color_Contract = (4.5*(SESSION.Annuals_F_materials_qty +SESSION.Annuals_S_materials_qty))>
<cfset Session.Grounds_Maintenance_Contract =  ROUND(Session.total_contract_price) - (ROUND(Session.Irrigation_Contract) + (SESSION.taxrateplusone *ROUND(Session.Seasonal_Color_Contract)))>
<cfset SESSION.sales_tax =  SESSION.taxrate *ROUND(Session.Seasonal_Color_Contract) >
<cfset Session.Total_materials_cost = 
SESSION.spraying_materials_actualprice + SESSION.turf_preg_materials_actualprice+SESSION.turf_prel_materials_actualprice+Session.turf_post_materials_actualprice+Session.turf_fert_materials_actualprice+Session.turf_lime_materials_actualprice+
Session.Turf_Seed_materials_actualprice+Session.TS_Fert_materials_actualprice+Session.TS_Insect_materials_actualprice+Session.Mulch_pre_materials_actualprice+Session.mulch_s_dyed_materials_actualprice+Session.mulch_f_dyed_materials_actualprice+SESSION.Annuals_S_materials_actualprice+SESSION.Annuals_F_materials_actualprice+Session.Mulch_F_Reg_materials_actualprice+Session.Mulch_S_Reg_materials_actualprice+
Session.Pine_Tags_materials_actualprice+Session.TS_hort_oil_materials_actualprice+Session.Playground_mulch_materials_actualprice+Session.Turf_Nutsedge_materials_actualprice +Session.Turf_Fungicide_materials_actualprice+Session.Turf_Insecticide_materials_actualprice>--->

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
<cfset SESSION.Irrigation_Contract = + ROUND(SESSION.Irrigation_SU_contract_price)+ ROUND(SESSION.Irrigation_W_contract_price)+ ROUND(SESSION.Irrigation_I_contract_price) +  ROUND(SESSION.Irrigation_TM_contract_price) + ROUND(SESSION.Irrigation_BFI_contract_price)>
<!--- <cfset SESSION.Seasonal_Color_Contract = (4.5*(SESSION.Annuals_F_materials_qty +SESSION.Annuals_S_materials_qty))> --->
<cfset SESSION.Grounds_Maintenance_Contract =  ROUND(SESSION.total_contract_price) - 
(ROUND(SESSION.Irrigation_Contract) <!---+ (SESSION.taxrateplusone *ROUND(SESSION.Seasonal_Color_Contract))--->)>

<!---<cfoutput>#NumberFormat(SESSION.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput><br />


 <cfoutput>#ROUND(SESSION.total_contract_price)# - (#ROUND(SESSION.Irrigation_Contract)#) + (#SESSION.taxrateplusone# * #ROUND(SESSION.Seasonal_Color_Contract)#)<br>
 </cfoutput><br />--->

<cfset SESSION.sales_tax =  SESSION.taxrate *ROUND(SESSION.Seasonal_Color_Contract) >
<!---<cfset SESSION.Total_materials_cost = 
SESSION.spraying_materials_actualprice + SESSION.turf_preg_materials_actualprice+SESSION.turf_prel_materials_actualprice+SESSION.turf_post_materials_actualprice+SESSION.turf_fert_materials_actualprice+SESSION.turf_lime_materials_actualprice+
SESSION.Turf_Seed_materials_actualprice+SESSION.TS_Fert_materials_actualprice+SESSION.TS_Insect_materials_actualprice+SESSION.Mulch_pre_materials_actualprice+SESSION.mulch_s_dyed_materials_actualprice+SESSION.mulch_f_dyed_materials_actualprice+SESSION.Annuals_S_materials_actualprice+SESSION.Annuals_F_materials_actualprice+SESSION.Mulch_F_Reg_materials_actualprice+SESSION.Mulch_S_Reg_materials_actualprice+
SESSION.Pine_Tags_materials_actualprice+SESSION.TS_hort_oil_materials_actualprice+SESSION.Playground_mulch_materials_actualprice+SESSION.Turf_Nutsedge_materials_actualprice +SESSION.Turf_Fungicide_materials_actualprice+SESSION.Turf_Insecticide_materials_actualprice>--->

<cfset SESSION.Total_materials_cost = 
(SESSION.spraying_materials_actualprice * SESSION.spraying_times) + 
(SESSION.turf_preg_materials_actualprice * SESSION.turf_preg_times) + 
(SESSION.turf_prel_materials_actualprice * SESSION.turf_prel_times) +
(SESSION.turf_post_materials_actualprice * SESSION.turf_post_times) +
(SESSION.turf_fert_materials_actualprice * SESSION.turf_fert_times) +
(SESSION.turf_lime_materials_actualprice * SESSION.turf_lime_times) +
(SESSION.Turf_Seed_materials_actualprice * SESSION.Turf_Seed_times) +
(SESSION.TS_Fert_materials_actualprice * SESSION.TS_Fert_times) +
(SESSION.TS_Insect_materials_actualprice * SESSION.TS_Insect_times) +
(SESSION.Mulch_pre_materials_actualprice * SESSION.Mulch_pre_times) +
(SESSION.mulch_s_dyed_materials_actualprice * SESSION.mulch_s_dyed_times) +
(SESSION.mulch_f_dyed_materials_actualprice* SESSION.mulch_f_dyed_times) + 
(SESSION.Annuals_S_materials_actualprice* SESSION.Annuals_S_times) + 
(SESSION.Annuals_F_materials_actualprice * SESSION.Annuals_F_times) +
(SESSION.Mulch_F_Reg_materials_actualprice * SESSION.Mulch_F_Reg_times) +
(SESSION.Mulch_S_Reg_materials_actualprice* SESSION.Mulch_S_Reg_times) +
(SESSION.Pine_Tags_materials_actualprice * SESSION.Pine_Tags_times) +
(SESSION.TS_hort_oil_materials_actualprice * SESSION.TS_hort_oil_times) +
(SESSION.Playground_mulch_materials_actualprice * SESSION.Playground_mulch_times) +
(SESSION.Turf_Nutsedge_materials_actualprice * SESSION.Turf_Nutsedge_times) +
(SESSION.Turf_Fungicide_materials_actualprice * SESSION.Turf_Fungicide_times) +
(SESSION.Turf_Insecticide_materials_actualprice * SESSION.Turf_Insecticide_times) >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#get_quote_info.opportunity_name#</cfoutput>Pricing Sheet</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />
<link href="css/styles_pricing_sheet.css" rel="stylesheet" type="text/css" media="print" />
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
<!---<div class="page-header">
<!---  <cfinclude template="header-include.cfm">--->
  <!---<div class="page-header-menu">
    <div class="container-fluid">
      <div id="hor-menu-default" class="hor-menu"> </div>
    </div>--->
  </div>
</div>---> 
<!-- END HEADER SECTION -->
<div class="page-head">
  <div class="container-fluid"> 
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>Quote Pricing Sheet</h1>
    </div>
  </div>
</div>
<div class="page-content">
  <div class="container-fluid">
    <div class="left-table2"> <cfoutput query="get_quote_info">
        <table class="table">
          <tr>
            <td><strong>Quote ID : #opportunity_id# &nbsp;&nbsp;&nbsp;Branch : #q_branch#</strong></td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Customer : #opportunity_name#</strong></td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Job Location : #q_address1#, #q_city#, #q_address_state#, #q_address_zip#</strong></td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Estimator : #SESSION.screenname#</strong></td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Quote Status : #opportunity_state# </strong></td>
            <td></td>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </cfoutput> </div>
    <div class="right-table2"> <cfoutput query="get_quote_info">
        <table class="table">
          <tr>
            <td  nowrap="nowrap"><strong>Date Opportunty Created : #dateformat(date_created_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Date Opportunty Modified : #dateformat(date_updated_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Date Quote Created : #dateformat(date_quote_started,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td><strong>Date Quote Modified : #dateformat(date_quote_updated,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td  nowrap="nowrap"><strong>Contract Start Date : #dateformat(get_quote_main.contract_start_date,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td nowrap="nowrap"   colspan="2"  align="left"><strong>Contract End Date : #dateformat(get_quote_main.contract_end_date,"mm/dd/yyyy")# &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments : #get_quote_main.contract_installments#</strong></td>
          </tr>
          <tr>
            <td  nowrap="nowrap"><strong>Annual Contract Price :  $#NumberFormat(get_quote_main.total_contract_price,"99,999,999")#</strong></td>
            <td>&nbsp;</td>
            <cfif  get_quote_main.contract_installments GT  0>
              <cfset  total_contract_price_monthly =  get_quote_main.total_contract_price/get_quote_main.contract_installments>
              <cfelse>
              <cfset  total_contract_price_monthly =  "">
            </cfif>
            <td nowrap="nowrap"><strong>Monthly Contract Price :  $#NumberFormat(total_contract_price_monthly,"99,999,999.99")#</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </cfoutput></div>
  </div>
  <div class="clearfix"></div>
  <div class="spacer40"></div>
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
          <thead>
            <tr>
              <th colspan="7" align="center">SERVICES</th>
              <th>&nbsp;</th>
              <th>&nbsp;</th>
              <th colspan="4" align="center">MATERIALS</th>
              <th align="right" nowrap="nowrap">&nbsp;</th>
              <th colspan="7" align="center">TOTALS</th>
            </tr>
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
              <th align="right" nowrap="nowrap">Svc &amp; Mtl</th>
              <th align="center">Times</th>
              <th align="right">&nbsp;Actual<br />
                Extend</th>
              <th align="right">&nbsp;Total<br />
                Hours</th>
              <th align="right">OT<br />
                Adjust</th>
              <th align="center">&nbsp;Gross<br />
                &nbsp;Margin</th>
              <th align="right" >Contract<br />
                Price</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td rowspan="61"><img src="images/clear.gif" width="20" height="1" /></td>
              <td align="left">&nbsp;</td>
              <td align="left">&nbsp;</td>
              <td align="left">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td rowspan="61"><img src="images/clear.gif" width="20" height="1" /></td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td align="right" >10%</td>
              <td align="center"><cfoutput>#Session.gross_margin#</cfoutput></td>
              <td align="right" >&nbsp;</td>
            </tr>
            <cfif  Session.push_mow_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Push Mow</td>
                  <td align="left">#Session.push_mow_qty#</td>
                  <td nowrap="nowrap">$#Session.push_mow_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.push_mow_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.push_mow_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.push_mow_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$ #NumberFormat(Session.push_mow_service_materials,"999.99")#</td>
                  <td align="right">#Session.push_mow_times#</td>
                  <td align="right">$ #NumberFormat(Session.push_mow_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.push_mow_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.push_mow_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.push_mow_contract_price  =  #ROUND(Session.push_mow_contract_price)#>
                  <td align="right">$#NumberFormat(Session.push_mow_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.walk_behind_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Walk Behind</td>
                  <td align="left">#Session.walk_behind_qty#</td>
                  <td nowrap="nowrap">$#Session.walk_behind_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.walk_behind_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$#NumberFormat(Session.walk_behind_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.walk_behind_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.walk_behind_service_materials,"999.99")#</td>
                  <td align="right">#Session.walk_behind_times#</td>
                  <td align="right">$#NumberFormat(Session.walk_behind_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.walk_behind_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.walk_behind_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.walk_behind_contract_price  =  #ROUND(Session.walk_behind_contract_price)#>
                  <td align="right">$#NumberFormat(Session.walk_behind_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.ride_mow_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Ride Mow</td>
                  <td align="left">#Session.ride_mow_qty#</td>
                  <td nowrap="nowrap">$#Session.ride_mow_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.ride_mow_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$#NumberFormat(Session.ride_mow_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.ride_mow_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.ride_mow_service_materials,"999.99")#</td>
                  <td align="right">#Session.ride_mow_times#</td>
                  <td align="right">$#NumberFormat(Session.ride_mow_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.ride_mow_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.ride_mow_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.ride_mow_contract_price  =  #ROUND(Session.ride_mow_contract_price)#>
                  <td align="right">$#NumberFormat(Session.ride_mow_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.hard_edge_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Hard Edge </td>
                  <td align="left">#Session.hard_edge_qty#</td>
                  <td nowrap="nowrap">$#Session.Hard_Edge_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.hard_edge_rate#</td>
                  <td nowrap="nowrap">LF</td>
                  <td align="right">$#NumberFormat(Session.hard_edge_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.hard_edge_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.hard_edge_service_materials,"999.99")#</td>
                  <td align="right">#Session.hard_edge_times#</td>
                  <td align="right">$#NumberFormat(Session.hard_edge_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.hard_edge_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.hard_edge_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.hard_edge_contract_price  =  #ROUND(Session.hard_edge_contract_price)#>
                  <td align="right">$#NumberFormat(Session.hard_edge_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.bed_edge_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Bed Edge</td>
                  <td align="left">#Session.bed_edge_qty#</td>
                  <td nowrap="nowrap">$#Session.bed_edge_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.bed_edge_rate#</td>
                  <td nowrap="nowrap">LF</td>
                  <td align="right">$#NumberFormat(Session.bed_edge_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.bed_edge_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.bed_edge_service_materials,"999.99")#</td>
                  <td align="right">#Session.bed_edge_times#</td>
                  <td align="right">$#NumberFormat(Session.bed_edge_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.bed_edge_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.bed_edge_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.bed_edge_contract_price  =  #ROUND(Session.bed_edge_contract_price)#>
                  <td align="right">$#NumberFormat(Session.bed_edge_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.TRIM_O_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Trim, O</td>
                  <td align="left">#Session.Trim_O_qty#</td>
                  <td nowrap="nowrap">$#Session.Trim_O_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trim_O_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.TRIM_O_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.TRIM_O_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.TRIM_O_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trim_O_Times#</td>
                  <td align="right">$#NumberFormat(Session.TRIM_O_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.TRIM_O_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.TRIM_O_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.TRIM_O_contract_price  =  #ROUND(Session.TRIM_O_contract_price)#>
                  <td align="right">$#NumberFormat(Session.TRIM_O_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.TRIM_S_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Trim, S</td>
                  <td align="left">#Session.Trim_S_qty#</td>
                  <td nowrap="nowrap">$#Session.Trim_S_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trim_S_Rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.TRIM_S_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.TRIM_S_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.TRIM_S_service_materials,"999.99")#</td>
                  <td align="right">#Session.trim_S_times#</td>
                  <td align="right">$#NumberFormat(Session.TRIM_S_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.TRIM_S_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.TRIM_S_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.TRIM_S_contract_price  =  #ROUND(Session.TRIM_S_contract_price)#>
                  <td align="right">$#NumberFormat(Session.TRIM_S_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.spraying_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Spraying</td>
                  <td align="left">#Session.spraying_qty#</td>
                  <td nowrap="nowrap">$#Session.spraying_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.spraying_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$#NumberFormat(Session.spraying_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.spraying_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Non-sel. Herbicide (oz)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.spraying_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.spraying_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.spraying_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.spraying_service_materials,"999.99")#</td>
                  <td align="right">#Session.spraying_times#</td>
                  <td align="right">$ #NumberFormat(Session.spraying_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.spraying_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.spraying_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.spraying_contract_price  =  #ROUND(Session.spraying_contract_price)#>
                  <td align="right">$#NumberFormat(Session.spraying_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.weeding_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Weeding</td>
                  <td align="left">#Session.weeding_qty#</td>
                  <td nowrap="nowrap">$#Session.weeding_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.weeding_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$#NumberFormat(Session.weeding_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.weeding_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.weeding_service_materials,"999.99")#</td>
                  <td align="right">#Session.weeding_times#</td>
                  <td align="right">$#NumberFormat(Session.weeding_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.weeding_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.weeding_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.weeding_contract_price  =  #ROUND(Session.weeding_contract_price)#>
                  <td align="right">$#NumberFormat(Session.weeding_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.blowing_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Blowing</td>
                  <td align="left">#Session.blowing_qty#</td>
                  <td nowrap="nowrap">$#Session.blowing_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.blowing_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$#NumberFormat(Session.blowing_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.blowing_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.blowing_service_materials,"999.99")#</td>
                  <td align="right">#Session.blowing_times#</td>
                  <td align="right">$#NumberFormat(Session.blowing_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.blowing_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.blowing_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.blowing_contract_price  =  #ROUND(Session.blowing_contract_price)#>
                  <td align="right">$#NumberFormat(Session.blowing_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Trash_S_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Trash, S</td>
                  <td align="left">#Session.Trash_S_Qty#</td>
                  <td nowrap="nowrap">$#Session.Trash_S_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trash_S_Rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.Trash_S_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.trash_s_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.Trash_S_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trash_S_Times#</td>
                  <td align="right">$#NumberFormat(Session.Trash_S_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trash_S_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Trash_S_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Trash_S_contract_price  =  #ROUND(Session.Trash_S_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Trash_S_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.traveltime_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Travel Time</td>
                  <td align="left">#Session.traveltime_qty#</td>
                  <td nowrap="nowrap">$#Session.traveltime_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.traveltime_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.traveltime_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.traveltime_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.traveltime_service_materials,"999.99")#</td>
                  <td align="right">#Session.traveltime_times#</td>
                  <td align="right">$#NumberFormat(Session.traveltime_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.traveltime_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.traveltime_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%<!---#SESSION.travel_time_gm#%---></td>
                  <cfset Session.traveltime_contract_price  =  #ROUND(Session.traveltime_contract_price)#>
                  <td align="right">$#NumberFormat(Session.traveltime_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Trash_O_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Trash, Off</td>
                  <td align="left">#Session.Trash_O_Qty#</td>
                  <td nowrap="nowrap">$#Session.Trash_O_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trash_O_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.Trash_O_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trash_O_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.Trash_O_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trash_O_Times#</td>
                  <td align="right">$#NumberFormat(Session.Trash_O_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trash_O_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Trash_O_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Trash_O_contract_price  =  #ROUND(Session.Trash_O_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Trash_O_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.leafrem_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Leaf Rem</td>
                  <td align="left">#Session.leafrem_qty#</td>
                  <td nowrap="nowrap">$#Session.leafrem_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.leafrem_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.leafrem_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.leafrem_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.leafrem_service_materials,"999.99")#</td>
                  <td align="right">#Session.leafrem_times#</td>
                  <td align="right">$#NumberFormat(Session.leafrem_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.leafrem_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.leafrem_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.leafrem_contract_price  =  #ROUND(Session.leafrem_contract_price)#>
                  <td align="right">$#NumberFormat(Session.leafrem_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.cleanup_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td nowrap="nowrap">Cleanup</td>
                  <td align="left">#Session.cleanup_qty#</td>
                  <td nowrap="nowrap">$#Session.cleanup_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.cleanup_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$#NumberFormat(Session.cleanup_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.cleanup_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.cleanup_service_materials,"999.99")#</td>
                  <td align="right">#Session.cleanup_times#</td>
                  <td align="right">$#NumberFormat(Session.cleanup_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.cleanup_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.cleanup_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.cleanup_contract_price  =  #ROUND(Session.cleanup_contract_price)#>
                  <td align="right">$#NumberFormat(Session.cleanup_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.turf_preg_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Pre (G)</td>
                  <td align="left">#Session.turf_preg_qty#</td>
                  <td nowrap="nowrap">$#Session.turf_preg_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_preg_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.turf_preg_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_preg_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Granular pre-em w/ 16-4-8 Fert (lb)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.turf_preg_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_preg_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.turf_preg_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_preg_service_materials,"999.99")#</td>
                  <td align="right">#Session.turf_preg_times#</td>
                  <td align="right">$ #NumberFormat(Session.turf_preg_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_preg_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.turf_preg_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.turf_preg_contract_price  =  #ROUND(Session.turf_preg_contract_price)#>
                  <td align="right">$#NumberFormat(Session.turf_preg_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.turf_prel_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Pre (L)</td>
                  <td align="left">#Session.turf_prel_qty#</td>
                  <td nowrap="nowrap">$#Session.turf_prel_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_prel_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.turf_prel_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_prel_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Barricade liquid pre-em (oz)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.turf_prel_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_prel_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.turf_prel_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_prel_service_materials,"999.99")#</td>
                  <td align="right">#Session.turf_prel_times#</td>
                  <td align="right">$ #NumberFormat(Session.turf_prel_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_prel_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.turf_prel_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.turf_prel_contract_price  =  #ROUND(Session.turf_prel_contract_price)#>
                  <td align="right">$#NumberFormat(Session.turf_prel_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.turf_post_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Post</td>
                  <td align="left">#Session.turf_post_qty#</td>
                  <td nowrap="nowrap">$#Session.turf_post_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_post_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.turf_post_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_post_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Trimec Selective Herbicide (oz)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.turf_post_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_post_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.turf_post_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_post_service_materials,"999.99")#</td>
                  <td align="right">#Session.turf_post_times#</td>
                  <td align="right">$ #NumberFormat(Session.turf_post_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_post_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.turf_post_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.turf_post_contract_price  =  #ROUND(Session.turf_post_contract_price)#>
                  <td align="right">$#NumberFormat(Session.turf_post_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.turf_fert_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Fert</td>
                  <td align="left">#Session.turf_fert_qty#</td>
                  <td nowrap="nowrap">$#Session.turf_fert_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_fert_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.turf_fert_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_fert_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">10-10-1 Starter Fert</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.turf_fert_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_fert_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.turf_fert_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_fert_service_materials,"999.99")#</td>
                  <td align="right">#Session.turf_fert_times#</td>
                  <td align="right">$ #NumberFormat(Session.turf_fert_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_fert_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.turf_fert_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.turf_fert_contract_price  =  #ROUND(Session.turf_fert_contract_price)#>
                  <td align="right">$#NumberFormat(Session.turf_fert_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.turf_lime_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Lime</td>
                  <td align="left">#Session.turf_lime_qty#</td>
                  <td nowrap="nowrap">$#Session.turf_lime_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_lime_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.turf_lime_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_lime_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Pelletized Lime (lb)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.turf_lime_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.turf_lime_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.turf_lime_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.turf_lime_service_materials,"999.99")#</td>
                  <td align="right">#Session.turf_lime_times#</td>
                  <td align="right">$ #NumberFormat(Session.turf_lime_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.turf_lime_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.turf_lime_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.turf_lime_contract_price  =  #ROUND(Session.turf_lime_contract_price)#>
                  <td align="right">$#NumberFormat(Session.turf_lime_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Aer_H_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Aer (H)</td>
                  <td align="left">#Session.Turf_Aer_H_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Aer_H_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Aer_H_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Aer_H_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Aer_H_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Aer_H_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Aer_H_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Aer_H_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Aer_H_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Aer_H_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Aer_H_contract_price  =  #ROUND(Session.Turf_Aer_H_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Aer_H_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Aer_T_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Aer (T)</td>
                  <td align="left">#Session.Turf_Aer_T_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Aer_T_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Aer_T_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Aer_T_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Aer_T_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Aer_T_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Aer_T_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Aer_T_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Aer_T_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Aer_T_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Aer_T_contract_price  =  #ROUND(Session.Turf_Aer_T_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Aer_T_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Seed_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf  Seed</td>
                  <td align="left">#Session.Turf_Seed_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Seed_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Seed_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Seed_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Seed_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Fescue Seed (lbs)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Turf_Seed_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Seed_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Seed_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Seed_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Seed_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Seed_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Seed_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Seed_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Seed_contract_price  =  #ROUND(Session.Turf_Seed_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Seed_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Nutsedge_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Nutsedge</td>
                  <td align="left">#Session.Turf_Nutsedge_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Nutsedge_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Nutsedge_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Nutsedge_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Halosulfuron</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Turf_Nutsedge_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Nutsedge_MATERIALS_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Nutsedge_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Nutsedge_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Nutsedge_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Nutsedge_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Nutsedge_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Nutsedge_contract_price  =  #ROUND(Session.Turf_Nutsedge_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Nutsedge_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Fungicide_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Fungicide</td>
                  <td align="left">#Session.Turf_Fungicide_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Fungicide_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Fungicide_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Fungicide_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Fungicide_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Various</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Turf_Fungicide_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Fungicide_MATERIALS_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Fungicide_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Fungicide_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Fungicide_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Fungicide_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Fungicide_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Fungicide_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Fungicide_contract_price  =  #ROUND(Session.Turf_Fungicide_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Fungicide_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Turf_Insecticide_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Turf Insecticide</td>
                  <td align="left">#Session.Turf_Insecticide_qty#</td>
                  <td nowrap="nowrap">$#Session.Turf_Insecticide_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Insecticide_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Insecticide_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Insecticide_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Bifenthrin</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Turf_Insecticide_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Turf_Insecticide_MATERIALS_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Insecticide_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Turf_Insecticide_service_materials,"999.99")#</td>
                  <td align="right">#Session.Turf_Insecticide_times#</td>
                  <td align="right">$ #NumberFormat(Session.Turf_Insecticide_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Turf_Insecticide_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Turf_Insecticide_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Turf_Insecticide_contract_price  =  #ROUND(Session.Turf_Insecticide_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Turf_Insecticide_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Pruning_TP_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Pruning, T/P</td>
                  <td align="left">#Session.Pruning_TP_qty#</td>
                  <td nowrap="nowrap">$#Session.Pruning_TP_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Pruning_TP_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Pruning_TP_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pruning_TP_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pruning_TP_service_materials,"999.99")#</td>
                  <td align="right">#Session.Pruning_TP_times#</td>
                  <td align="right">$ #NumberFormat(Session.Pruning_TP_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pruning_TP_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Pruning_TP_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Pruning_TP_contract_price  =  #ROUND(Session.Pruning_TP_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Pruning_TP_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Pruning_S_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Pruning, S</td>
                  <td align="left">#Session.Pruning_S_qty#</td>
                  <td nowrap="nowrap">$#Session.Pruning_S_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Pruning_S_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Pruning_S_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pruning_S_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pruning_S_service_materials,"999.99")#</td>
                  <td align="right">#Session.Pruning_S_times#</td>
                  <td align="right">$ #NumberFormat(Session.Pruning_S_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pruning_S_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Pruning_S_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Pruning_S_contract_price  =  #ROUND(Session.Pruning_S_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Pruning_S_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.TS_Fert_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>T&amp;S, Fert</td>
                  <td align="left">#Session.TS_Fert_qty#</td>
                  <td nowrap="nowrap">$#Session.TS_Fert_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_Fert_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.TS_Fert_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_Fert_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Fertilizer 14-14-14  (lbs)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.TS_Fert_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_Fert_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.TS_Fert_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_Fert_service_materials,"999.99")#</td>
                  <td align="right">#Session.TS_Fert_times#</td>
                  <td align="right">$ #NumberFormat(Session.TS_Fert_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_Fert_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.TS_Fert_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.TS_Fert_contract_price  =  #ROUND(Session.TS_Fert_contract_price)#>
                  <td align="right">$#NumberFormat(Session.TS_Fert_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.TS_Insect_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>T&amp;S, Insect</td>
                  <td align="left">#Session.TS_Insect_qty#</td>
                  <td nowrap="nowrap">$#Session.TS_Insect_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_Insect_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.TS_Insect_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_Insect_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Bifenthrin Tree &amp; Shrub Insecticide (oz.)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.TS_Insect_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_Insect_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.TS_Insect_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_Insect_service_materials,"999.99")#</td>
                  <td align="right">#Session.TS_Insect_times#</td>
                  <td align="right">$ #NumberFormat(Session.TS_Insect_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_Insect_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.TS_Insect_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.TS_Insect_contract_price  =  #ROUND(Session.TS_Insect_contract_price)#>
                  <td align="right">$#NumberFormat(Session.TS_Insect_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.TS_hort_oil_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>T&amp;S, Hort Oil</td>
                  <td align="left">#Session.TS_hort_oil_qty#</td>
                  <td nowrap="nowrap">$#Session.TS_hort_oil_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_hort_oil_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.TS_hort_oil_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_hort_oil_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Hort/Dormant Oil </td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.TS_hort_oil_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.TS_hort_oil_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.TS_hort_oil_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.TS_hort_oil_service_materials,"999.99")#</td>
                  <td align="right">#Session.TS_hort_oil_times#</td>
                  <td align="right">$ #NumberFormat(Session.TS_hort_oil_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.TS_hort_oil_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.TS_hort_oil_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.TS_hort_oil_contract_price  =  #ROUND(Session.TS_hort_oil_contract_price)#>
                  <td align="right">$#NumberFormat(Session.TS_hort_oil_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Mulch_pre_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, Pre</td>
                  <td align="left">#Session.Mulch_pre_qty#</td>
                  <td nowrap="nowrap">$#Session.Mulch_pre_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_pre_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_pre_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_pre_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Pre-em 0-0-7 w/ 86% Pendemethaline (lbs) </td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Mulch_pre_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_pre_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_pre_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_pre_service_materials,"999.99")#</td>
                  <td align="right">#Session.Mulch_pre_times#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_pre_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_pre_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Mulch_pre_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Mulch_pre_contract_price  =  #ROUND(Session.Mulch_pre_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Mulch_pre_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Mulch_edging_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, Edging</td>
                  <td align="left">#Session.Mulch_edging_qty#</td>
                  <td nowrap="nowrap">$#Session.Mulch_edging_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_edging_rate#</td>
                  <td nowrap="nowrap">LF</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_edging_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_edging_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_edging_service_materials,"999.99")#</td>
                  <td align="right">#Session.Mulch_edging_times#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_edging_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_edging_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Mulch_edging_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Mulch_edging_contract_price  =  #ROUND(Session.Mulch_edging_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Mulch_edging_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.mulch_s_dyed_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, S (dyed)</td>
                  <td align="left">#Session.mulch_s_dyed_qty#</td>
                  <td nowrap="nowrap">$#Session.mulch_s_dyed_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.mulch_s_dyed_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.mulch_s_dyed_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.mulch_s_dyed_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Dyed Mulch</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.mulch_s_dyed_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.mulch_s_dyed_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.mulch_s_dyed_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.mulch_s_dyed_service_materials,"999.99")#</td>
                  <td align="right">#Session.mulch_s_dyed_times#</td>
                  <td align="right">$ #NumberFormat(Session.mulch_s_dyed_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.mulch_s_dyed_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.mulch_s_dyed_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.mulch_s_dyed_contract_price  =  #ROUND(Session.mulch_s_dyed_contract_price)#>
                  <td align="right">$#NumberFormat(Session.mulch_s_dyed_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.mulch_f_dyed_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, F (dyed)</td>
                  <td align="left">#Session.mulch_f_dyed_qty#</td>
                  <td nowrap="nowrap">$#Session.mulch_f_dyed_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.mulch_f_dyed_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.mulch_f_dyed_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.mulch_f_dyed_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Dyed Mulch</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.mulch_f_dyed_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.mulch_f_dyed_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.mulch_f_dyed_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.mulch_f_dyed_service_materials,"999.99")#</td>
                  <td align="right">#Session.mulch_f_dyed_times#</td>
                  <td align="right">$ #NumberFormat(Session.mulch_f_dyed_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.mulch_f_dyed_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.mulch_f_dyed_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.mulch_f_dyed_contract_price  =  #ROUND(Session.mulch_f_dyed_contract_price)#>
                  <td align="right">$#NumberFormat(Session.mulch_f_dyed_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Mulch_S_Reg_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, S (reg)</td>
                  <td align="left">#Session.Mulch_S_Reg_qty#</td>
                  <td nowrap="nowrap">$#Session.Mulch_S_Reg_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_S_Reg_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_S_Reg_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Non-Dyed Mulch</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Mulch_S_Reg_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_S_Reg_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_S_Reg_service_materials,"999.99")#</td>
                  <td align="right">#Session.Mulch_S_Reg_times#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_S_Reg_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_S_Reg_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Mulch_S_Reg_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Mulch_S_Reg_contract_price  =  #ROUND(Session.Mulch_S_Reg_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Mulch_S_Reg_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Mulch_F_Reg_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Mulch, F&nbsp;(reg)</td>
                  <td align="left">#Session.Mulch_F_Reg_qty#</td>
                  <td nowrap="nowrap">$#Session.Mulch_F_Reg_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_F_Reg_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_F_Reg_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Non-Dyed Mulch</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Mulch_F_Reg_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Mulch_F_Reg_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Mulch_F_Reg_service_materials,"999.99")#</td>
                  <td align="right">#Session.Mulch_F_Reg_times#</td>
                  <td align="right">$ #NumberFormat(Session.Mulch_F_Reg_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Mulch_F_Reg_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Mulch_F_Reg_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Mulch_F_Reg_contract_price  =  #ROUND(Session.Mulch_F_Reg_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Mulch_F_Reg_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Playground_mulch_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Playground Mulch</td>
                  <td align="left">#Session.Playground_mulch_qty#</td>
                  <td nowrap="nowrap">$#Session.Playground_mulch_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Playground_mulch_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Playground_mulch_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Playground_mulch_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Dyed Mulch</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Playground_mulch_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Playground_mulch_MATERIALS_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Playground_mulch_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Playground_mulch_service_materials,"999.99")#</td>
                  <td align="right">#Session.Playground_mulch_times#</td>
                  <td align="right">$ #NumberFormat(Session.Playground_mulch_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Playground_mulch_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Playground_mulch_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Playground_mulch_contract_price  =  #ROUND(Session.Playground_mulch_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Playground_mulch_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Pine_Tags_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Pine Tags</td>
                  <td align="left">#Session.Pine_Tags_qty#</td>
                  <td nowrap="nowrap">$#Session.Pine_Tags_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Pine_Tags_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Pine_Tags_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pine_Tags_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Pine Tags (bales)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Pine_Tags_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Pine_Tags_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Pine_Tags_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pine_Tags_service_materials,"999.99")#</td>
                  <td align="right">#Session.Pine_Tags_times#</td>
                  <td align="right">$ #NumberFormat(Session.Pine_Tags_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pine_Tags_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Pine_Tags_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Pine_Tags_contract_price  =  #ROUND(Session.Pine_Tags_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Pine_Tags_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Annuals_S_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Annuals, S</td>
                  <td align="left">#Session.Annuals_S_qty#</td>
                  <td nowrap="nowrap">$#Session.Annuals_S_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Annuals_S_rate#</td>
                  <td nowrap="nowrap">Pots</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_S_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Annuals_S_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Flowers (6&quot; pots)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Annuals_S_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Annuals_S_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_S_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Annuals_S_service_materials,"999.99")#</td>
                  <td align="right">#Session.Annuals_S_times#</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_S_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Annuals_S_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Annuals_S_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Annuals_S_contract_price  =  #ROUND(Session.Annuals_S_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Annuals_S_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Annuals_F_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Annuals, F</td>
                  <td align="left">#Session.Annuals_F_qty#</td>
                  <td nowrap="nowrap">$#Session.Annuals_F_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Annuals_F_rate#</td>
                  <td nowrap="nowrap">Pots</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_F_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Annuals_F_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">Flowers (6&quot; pots)</td>
                  <td align="left" nowrap="nowrap">#TRIM(Session.Annuals_F_materials_qty)#</td>
                  <td align="left" nowrap="nowrap">#Session.Annuals_F_materials_rate#</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_F_materials_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Annuals_F_service_materials,"999.99")#</td>
                  <td align="right">#Session.Annuals_F_times#</td>
                  <td align="right">$ #NumberFormat(Session.Annuals_F_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Annuals_F_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Annuals_F_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Annuals_F_contract_price  =  #ROUND(Session.Annuals_F_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Annuals_F_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Irrigation_SU_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Irrigation, SU</td>
                  <td align="left">#Session.Irrigation_SU_qty#</td>
                  <td nowrap="nowrap">$#Session.Irrigation_SU_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Irrigation_SU_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_SU_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_SU_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_SU_service_materials,"999.99")#</td>
                  <td align="right">#Session.Irrigation_SU_times#</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_SU_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_SU_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Irrigation_SU_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Irrigation_SU_contract_price  =  #ROUND(Session.Irrigation_SU_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Irrigation_SU_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Irrigation_W_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Irrigation, W</td>
                  <td align="left">#Session.Irrigation_W_qty#</td>
                  <td nowrap="nowrap">$#Session.Irrigation_W_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Irrigation_W_rate#</td>
                  <td nowrap="nowrap">HR </td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_W_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_W_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_W_service_materials,"999.99")#</td>
                  <td align="right">#Session.Irrigation_W_times#</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_W_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_W_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Irrigation_W_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Irrigation_W_contract_price  =  #ROUND(Session.Irrigation_W_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Irrigation_W_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Irrigation_I_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Irrigation, I</td>
                  <td align="left">#Session.Irrigation_I_qty#</td>
                  <td nowrap="nowrap">$#Session.Irrigation_I_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Irrigation_I_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_I_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_I_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_I_service_materials,"999.99")#</td>
                  <td align="right">#Session.Irrigation_I_times#</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_I_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_I_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Irrigation_I_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Irrigation_I_contract_price  =  #ROUND(Session.Irrigation_I_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Irrigation_I_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Irrigation_TM_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Irrigation,TM</td>
                  <td align="left">#Session.Irrigation_TM_qty#</td>
                  <td nowrap="nowrap">$#Session.Irrigation_TM_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Irrigation_TM_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_TM_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_TM_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_TM_service_materials,"999.99")#</td>
                  <td align="right">#Session.Irrigation_TM_times#</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_TM_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_TM_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Irrigation_TM_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Irrigation_TM_contract_price  =  #ROUND(Session.Irrigation_TM_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Irrigation_TM_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Irrigation_BFI_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Irrigation, BFI</td>
                  <td align="left">#Session.Irrigation_BFI_qty#</td>
                  <td nowrap="nowrap">$#Session.Irrigation_BFI_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Irrigation_BFI_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_BFI_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_BFI_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Irrigation_BFI_service_materials,"999.99")#</td>
                  <td align="right">#Session.Irrigation_BFI_times#</td>
                  <td align="right">$ #NumberFormat(Session.Irrigation_BFI_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Irrigation_BFI_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Irrigation_BFI_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">-</td>
                  <cfset Session.Irrigation_BFI_contract_price  =  #ROUND(Session.Irrigation_BFI_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Irrigation_BFI_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Pond_Maint_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Pond Maint.</td>
                  <td align="left">#Session.Pond_Maint_qty#</td>
                  <td nowrap="nowrap">$#Session.Pond_Maint_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Pond_Maint_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Pond_Maint_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pond_Maint_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Pond_Maint_service_materials,"999.99")#</td>
                  <td align="right">#Session.Pond_Maint_times#</td>
                  <td align="right">$ #NumberFormat(Session.Pond_Maint_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Pond_Maint_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Pond_Maint_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Pond_Maint_contract_price  =  #ROUND(Session.Pond_Maint_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Pond_Maint_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Trim_Hillside_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Trim, Hillside</td>
                  <td align="left">#Session.Trim_Hillside_qty#</td>
                  <td nowrap="nowrap">$#Session.Trim_Hillside_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trim_Hillside_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Trim_Hillside_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trim_Hillside_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trim_Hillside_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trim_Hillside_times#</td>
                  <td align="right">$ #NumberFormat(Session.Trim_Hillside_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trim_Hillside_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Trim_Hillside_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Trim_Hillside_contract_price  =  #ROUND(Session.Trim_Hillside_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Trim_Hillside_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Addtl_Mowing_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Addt'l. Mowing</td>
                  <td align="left">#Session.Addtl_Mowing_qty#</td>
                  <td nowrap="nowrap">$#Session.Addtl_Mowing_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Addtl_Mowing_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Addtl_Mowing_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Addtl_Mowing_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Addtl_Mowing_service_materials,"999.99")#</td>
                  <td align="right">#Session.Addtl_Mowing_times#</td>
                  <td align="right">$ #NumberFormat(Session.Addtl_Mowing_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Addtl_Mowing_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Addtl_Mowing_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Addtl_Mowing_contract_price  =  #ROUND(Session.Addtl_Mowing_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Addtl_Mowing_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Day_Porter_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Day Porter</td>
                  <td align="left">#Session.Day_Porter_qty#</td>
                  <td nowrap="nowrap">$#Session.Day_Porter_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Day_Porter_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Day_Porter_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Day_Porter_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Day_Porter_service_materials,"999.99")#</td>
                  <td align="right">#Session.Day_Porter_times#</td>
                  <td align="right">$ #NumberFormat(Session.Day_Porter_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Day_Porter_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Day_Porter_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Day_Porter_contract_price  =  #ROUND(Session.Day_Porter_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Day_Porter_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Bush_Hog_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Bush Hog</td>
                  <td align="left">#Session.Bush_Hog_qty#</td>
                  <td nowrap="nowrap">$#Session.Bush_Hog_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Bush_Hog_rate#</td>
                  <td nowrap="nowrap">SF</td>
                  <td align="right">$ #NumberFormat(Session.Bush_Hog_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Bush_Hog_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Bush_Hog_service_materials,"999.99")#</td>
                  <td align="right">#Session.Bush_Hog_times#</td>
                  <td align="right">$ #NumberFormat(Session.Bush_Hog_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Bush_Hog_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Bush_Hog_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Bush_Hog_contract_price  =  #ROUND(Session.Bush_Hog_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Bush_Hog_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Trail_Maint_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Trail Maint</td>
                  <td align="left">#Session.Trail_Maint_qty#</td>
                  <td nowrap="nowrap">$#Session.Trail_Maint_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trail_Maint_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Trail_Maint_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trail_Maint_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trail_Maint_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trail_Maint_times#</td>
                  <td align="right">$ #NumberFormat(Session.Trail_Maint_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trail_Maint_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Trail_Maint_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Trail_Maint_contract_price  =  #ROUND(Session.Trail_Maint_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Trail_Maint_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Natural_Area_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Natural Area</td>
                  <td align="left">#Session.Natural_Area_qty#</td>
                  <td nowrap="nowrap">$#Session.Natural_Area_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Natural_Area_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Natural_Area_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Natural_Area_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Natural_Area_service_materials,"999.99")#</td>
                  <td align="right">#Session.Natural_Area_times#</td>
                  <td align="right">$ #NumberFormat(Session.Natural_Area_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Natural_Area_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Natural_Area_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Natural_Area_contract_price  =  #ROUND(Session.Natural_Area_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Natural_Area_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Trash_Receptacle_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td   nowrap="nowrap">Trash Rec./Dog Station</td>
                  <td align="left">#Session.Trash_Receptacle_qty#</td>
                  <td nowrap="nowrap">$#Session.Trash_Receptacle_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Trash_Receptacle_rate#</td>
                  <td nowrap="nowrap">HR</td>
                  <td align="right">$ #NumberFormat(Session.Trash_Receptacle_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trash_Receptacle_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Trash_Receptacle_service_materials,"999.99")#</td>
                  <td align="right">#Session.Trash_Receptacle_times#</td>
                  <td align="right">$ #NumberFormat(Session.Trash_Receptacle_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Trash_Receptacle_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Trash_Receptacle_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#NumberFormat(Session.gross_margin,"999,999.999")#%</td>
                  <cfset Session.Trash_Receptacle_contract_price  =  #ROUND(Session.Trash_Receptacle_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Trash_Receptacle_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Lot_Sweeping_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>Lot Sweeping</td>
                  <td align="left">#Session.Lot_Sweeping_qty#</td>
                  <td nowrap="nowrap">$#Session.Lot_Sweeping_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Lot_Sweeping_rate#</td>
                  <td nowrap="nowrap">MO</td>
                  <td align="right">$ #NumberFormat(Session.Lot_Sweeping_actualprice,"999.99")#</td>
                  <td align="right">#NumberFormat(Session.Lot_Sweeping_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Lot_Sweeping_service_materials,"999.99")#</td>
                  <td align="right">#Session.Lot_Sweeping_times#</td>
                  <td align="right">$ #NumberFormat(Session.Lot_Sweeping_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Lot_Sweeping_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Lot_Sweeping_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#SESSION.Lot_Sweeping_gm#%</td>
                  <cfset Session.Lot_Sweeping_contract_price  =  #ROUND(Session.Lot_Sweeping_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Lot_Sweeping_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.Blank1_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>#Session.Blank1_service#</td>
                  <td align="left">#Session.Blank1_qty#</td>
                  <td nowrap="nowrap">$#Session.Blank1_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.Blank1_rate#</td>
                  <td nowrap="nowrap">#Session.Blank1_unit#</td>
                  <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.Blank1_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">#NumberFormat(Session.Blank1_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.Blank1_service_materials,"999.99")#</td>
                  <td align="right">#Session.Blank1_times#</td>
                  <td align="right">$ #NumberFormat(Session.Blank1_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.Blank1_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.Blank1_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#SESSION.blank1_gm#%</td>
                  <cfset Session.Blank1_contract_price  =  #ROUND(Session.Blank1_contract_price)#>
                  <td align="right">$#NumberFormat(Session.Blank1_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.blank2_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>#Session.blank2_service#</td>
                  <td align="left">#Session.blank2_qty#</td>
                  <td nowrap="nowrap">$#Session.blank2_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.blank2_rate#</td>
                  <td nowrap="nowrap">#Session.blank2_unit#</td>
                  <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.blank2_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">#NumberFormat(Session.blank2_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.blank2_service_materials,"999.99")#</td>
                  <td align="right">#Session.blank2_times#</td>
                  <td align="right">$ #NumberFormat(Session.blank2_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.blank2_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.blank2_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#SESSION.blank2_gm#%</td>
                  <cfset Session.blank2_contract_price  =  #ROUND(Session.blank2_contract_price)#>
                  <td align="right">$#NumberFormat(Session.blank2_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.blank3_contract_price GT 0>
              <cfoutput>
                <tr>
                  <td>#Session.blank3_service#</td>
                  <td align="left">#Session.blank3_qty#</td>
                  <td nowrap="nowrap">$#Session.blank3_cost#</td>
                  <td align="left" nowrap="nowrap">#Session.blank3_rate#</td>
                  <td nowrap="nowrap">#Session.blank3_unit#</td>
                  <td align="right"  nowrap="nowrap">$ #NumberFormat(Session.blank3_actualprice,"999.99")#</td>
                  <td align="right" nowrap="nowrap">#NumberFormat(Session.blank3_hours,"999.9")#</td>
                  <td align="right">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right" nowrap="nowrap">$ #NumberFormat(Session.blank3_service_materials,"999.99")#</td>
                  <td align="right">#Session.blank3_times#</td>
                  <td align="right">$ #NumberFormat(Session.blank3_actual_extended,"999,999.99")#</td>
                  <td align="right">#NumberFormat(Session.blank3_total_hours,"9,999.9")#</td>
                  <td align="right">$#NumberFormat(Session.blank3_overtime_adjustment,"999,999.99")#</td>
                  <td align="center">#SESSION.blank3_gm#%</td>
                  <cfset Session.blank3_contract_price  =  #ROUND(Session.blank3_contract_price)#>
                  <td align="right">$#NumberFormat(Session.blank3_contract_price,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif  Session.contract_adjustment NEQ 0>
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
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">$#NumberFormat(Session.contract_adjustment,"999,999.99")#</td>
                </tr>
              </cfoutput>
            </cfif>
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
        </table></td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
  <!---    </form>--->
  <table width="98%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td><table class="table">
          <br>
          <br>
          <br>
          <br />
          <tr>
            <td>Total Materials Cost</td>
            <td  align="right"><cfoutput>#NumberFormat(SESSION.Total_materials_cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <cfset Total_labor_cost = SESSION.total_actual_extended  -SESSION.Total_materials_cost>
          <tr>
            <td>Total Labor Cost</td>
            <td  align="right"><cfoutput>#NumberFormat(Total_labor_cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <cfset OT_adjustment = 0>
          <cfset Total_Adjusted_Annual_Direct_Cost= OT_adjustment +Total_labor_cost+SESSION.Total_materials_cost>
          <tr>
            <td nowrap="nowrap">Total    Direct Costs</td>
            <td  align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Contract Adjustment</td>
            <td  align="right" nowrap="nowrap">$ <cfoutput>#NumberFormat(SESSION.contract_adjustment,"99,999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Contract Price</td>
            <td  align="right" nowrap="nowrap">$ <cfoutput>#NumberFormat(SESSION.total_contract_price,"99,999,999.99")#</cfoutput></td>
          </tr>
        </table>
        <br>
        <br>
        <table class="table">
          <tr>
            <td>Grounds Maintenance Contract</td>
            <td  align="right"><cfoutput>#NumberFormat(SESSION.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Irrigation</td>
            <td  align="right"><cfoutput>#NumberFormat(SESSION.Irrigation_Contract,"99,999,999.99")#</cfoutput></td>
          </tr>
        </table>
        <p>&nbsp;</p></td>
      <td  width="100">&nbsp;</td>
      <td align="top"><br />
        <br />
        <br />
        <br />
        <br />
        <br /></td>
    </tr>
  </table>
  <!---<table width="98%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td><br />
        <br />
        <br />
        <table class="table">
          <tr>
            <td>Total Materials Cost</td>
            <td  align="right"><cfoutput>#NumberFormat(Session.Total_materials_cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <cfset Total_labor_cost = Session.total_actual_extended  -Session.Total_materials_cost>
          <tr>
            <td>Total Labor Cost</td>
            <td  align="right"><cfoutput>#NumberFormat(Total_labor_cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <cfset OT_adjustment = Session.total_overtime_adjustment  -Session.total_actual_extended >
          <tr>
            <td>OT Adjustment</td>
            <td  align="right"><cfoutput>#NumberFormat(OT_adjustment ,"999,999.99")#</cfoutput></td>
          </tr>
          <cfset Total_Adjusted_Annual_Direct_Cost= OT_adjustment +Total_labor_cost+Session.Total_materials_cost>
          <tr>
            <td nowrap="nowrap">Total  Adjusted Annual Direct Cost</td>
            <td  align="right"><cfoutput>#NumberFormat(Total_Adjusted_Annual_Direct_Cost ,"999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Contract Price</td>
            <td  align="right" nowrap="nowrap">$ <cfoutput>#NumberFormat(Session.total_contract_price,"99,999,999.99")#</cfoutput></td>
          </tr>
        </table>
        <br />
        <br />
        <table class="table">
          <tr>
            <td>Grounds Maintenance Contract</td>
            <td  align="right"><cfoutput>#NumberFormat(Session.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Seasonal Color</td>
            <td  align="right"><cfoutput>#NumberFormat(Session.Seasonal_Color_Contract ,"99,999,999.99")#</cfoutput></td>
          </tr>
          <tr>
            <td>Irrigation</td>
            <td  align="right"><cfoutput>#NumberFormat(Session.Irrigation_Contract,"99,999,999.99")#</cfoutput></td>
          </tr>
          <!--- <tr>
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
          </table>---> 
        
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br></td>
    </tr>
  </table>--->
  <cfquery name="get_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  opportunity_id_original=#url.ID#
 </cfquery>
  <!--- <cfif get_quote_notes.recordcount GT 0>
    <div class="page-title">
      <h3>Notes</h3>
    </div>
    <table class="table">
      <cfoutput query="get_quote_notes">
        <tr>
          <td>#note_body#</td>
        </tr>
      </cfoutput>
    </table>
  </cfif>--->
  
  <cfif get_quote_notes.recordcount GT 0>
    <table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
      <tbody>
        <tr>
          <td><div class="page-title">
              <h3>Notes</h3>
            </div></td>
        </tr>
        <cfoutput query="get_quote_notes">
          <tr>
            <td>#note_body#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
  </cfif>
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
