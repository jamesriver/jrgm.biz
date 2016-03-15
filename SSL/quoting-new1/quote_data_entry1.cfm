<!--- Dont forget StructDelete +cfparam aND UPDATE all new Sessions

 SESSION.margin50
      SESSION.contract_adjustment
      SESSION.discount_adjustment
      SESSION.adjusted_contract_price
   SESSION.Trash_Receptacle_total_materials_cost
   
   --->

<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<cfset StructDelete(SESSION,"push_mow_rate")>
<cfset StructDelete(SESSION,"push_mow_cost")>
<cfset StructDelete(SESSION,"Walk_Behind_cost")>
<cfset StructDelete(SESSION,"Walk_Behind_rate")>
<cfset StructDelete(SESSION,"Ride_Mow_cost")>
<cfset StructDelete(SESSION,"Ride_Mow_rate")>
<cfset StructDelete(SESSION,"Hard_Edge_cost")>
<cfset StructDelete(SESSION,"Hard_Edge_rate")>
<cfset StructDelete(SESSION,"Bed_Edge_cost")>
<cfset StructDelete(SESSION,"Bed_Edge_rate")>
<cfset StructDelete(SESSION,"Trim_O_cost")>
<cfset StructDelete(SESSION,"Trim_O_rate")>
<cfset StructDelete(SESSION,"Trim_S_cost")>
<cfset StructDelete(SESSION,"Trim_S_rate")>
<cfset StructDelete(SESSION,"Spraying_cost")>
<cfset StructDelete(SESSION,"Spraying_rate")>
<cfset StructDelete(SESSION,"Weeding_cost")>
<cfset StructDelete(SESSION,"Weeding_rate")>
<cfset StructDelete(SESSION,"Blowing_cost")>
<cfset StructDelete(SESSION,"Blowing_rate")>
<cfset StructDelete(SESSION,"Trash_S_cost")>
<cfset StructDelete(SESSION,"Trash_S_rate")>
<cfset StructDelete(SESSION,"traveltime_rate")>
<cfset StructDelete(SESSION,"traveltime_cost")>
<cfset StructDelete(SESSION,"Trash_O_cost")>
<cfset StructDelete(SESSION,"Trash_O_rate")>
<cfset StructDelete(SESSION,"LeafRem_cost")>
<cfset StructDelete(SESSION,"LeafRem_rate")>
<cfset StructDelete(SESSION,"turf_preg_cost")>
<cfset StructDelete(SESSION,"turf_preg_rate")>
<cfset StructDelete(SESSION,"Turf_prel_cost")>
<cfset StructDelete(SESSION,"Turf_prel_rate")>
<cfset StructDelete(SESSION,"Turf_Post_cost")>
<cfset StructDelete(SESSION,"Turf_Post_rate")>
<cfset StructDelete(SESSION,"Turf_Fert_cost")>
<cfset StructDelete(SESSION,"Turf_Fert_rate")>
<cfset StructDelete(SESSION,"Turf_Lime_cost")>
<cfset StructDelete(SESSION,"Turf_Lime_rate")>
<cfset StructDelete(SESSION,"Turf_Aer_H_cost")>
<cfset StructDelete(SESSION,"Turf_Aer_H_rate")>
<cfset StructDelete(SESSION,"Turf_Aer_T_cost")>
<cfset StructDelete(SESSION,"Turf_Aer_T_rate")>
<cfset StructDelete(SESSION,"Turf_Seed_cost")>
<cfset StructDelete(SESSION,"Turf_Seed_rate")>
<cfset StructDelete(SESSION,"Pruning_TP_cost")>
<cfset StructDelete(SESSION,"Pruning_TP_rate")>
<cfset StructDelete(SESSION,"Pruning_S_cost")>
<cfset StructDelete(SESSION,"Pruning_S_rate")>
<cfset StructDelete(SESSION,"TS_Fert_cost")>
<cfset StructDelete(SESSION,"TS_Fert_rate")>
<cfset StructDelete(SESSION,"TS_Insect_cost")>
<cfset StructDelete(SESSION,"TS_Insect_rate")>
<cfset StructDelete(SESSION,"Mulch_Pre_cost")>
<cfset StructDelete(SESSION,"Mulch_Pre_rate")>
<cfset StructDelete(SESSION,"Mulch_Edging_cost")>
<cfset StructDelete(SESSION,"Mulch_Edging_rate")>
<cfset StructDelete(SESSION,"Mulch_S_dyed_cost")>
<cfset StructDelete(SESSION,"Mulch_S_dyed_rate")>
<cfset StructDelete(SESSION,"Mulch_F_dyed_cost")>
<cfset StructDelete(SESSION,"Mulch_F_dyed_rate")>
<cfset StructDelete(SESSION,"Annuals_S_cost")>
<cfset StructDelete(SESSION,"Annuals_S_rate")>
<cfset StructDelete(SESSION,"Annuals_F_cost")>
<cfset StructDelete(SESSION,"Annuals_F_rate")>
<cfset StructDelete(SESSION,"Irrigation_SU_cost")>
<cfset StructDelete(SESSION,"Irrigation_SU_rate")>
<cfset StructDelete(SESSION,"Irrigation_W_cost")>
<cfset StructDelete(SESSION,"Irrigation_W_rate")>
<cfset StructDelete(SESSION,"Irrigation_I_cost")>
<cfset StructDelete(SESSION,"Irrigation_I_rate")>
<cfset StructDelete(SESSION,"Mulch_F_Reg_cost")>
<cfset StructDelete(SESSION,"Mulch_F_Reg_rate")>
<cfset StructDelete(SESSION,"Mulch_S_Reg_cost")>
<cfset StructDelete(SESSION,"Mulch_S_Reg_rate")>
<cfset StructDelete(SESSION,"Pond_Maint_cost")>
<cfset StructDelete(SESSION,"Pond_Maint_rate")>
<cfset StructDelete(SESSION,"Trim_Hillside_cost")>
<cfset StructDelete(SESSION,"Trim_Hillside_rate")>
<cfset StructDelete(SESSION,"Pine_Tags_cost")>
<cfset StructDelete(SESSION,"Pine_Tags_rate")>
<cfset StructDelete(SESSION,"TS_hort_oil_cost")>
<cfset StructDelete(SESSION,"TS_hort_oil_rate")>
<cfset StructDelete(SESSION,"Addtl_Mowing_cost")>
<cfset StructDelete(SESSION,"Addtl_Mowing_rate")>
<cfset StructDelete(SESSION,"Day_Porter_cost")>
<cfset StructDelete(SESSION,"Day_Porter_rate")>
<cfset StructDelete(SESSION,"Bush_Hog_cost")>
<cfset StructDelete(SESSION,"Bush_Hog_rate")>
<cfset StructDelete(SESSION,"Lot_Sweeping_cost")>
<cfset StructDelete(SESSION,"Lot_Sweeping_rate")>
<cfset StructDelete(SESSION,"Insect_cost")>
<cfset StructDelete(SESSION,"Insect_rate")>
<cfset StructDelete(SESSION,"cleanup_cost")>
<cfset StructDelete(SESSION,"cleanup_rate")>
<cfset StructDelete(SESSION,"Trail_Maint_cost")>
<cfset StructDelete(SESSION,"Trail_Maint_rate")>
<cfset StructDelete(SESSION,"Irrigation_TM_cost")>
<cfset StructDelete(SESSION,"Irrigation_TM_rate")>
<cfset StructDelete(SESSION,"Irrigation_BFI_cost")>
<cfset StructDelete(SESSION,"Irrigation_BFI_rate")>
<cfset StructDelete(SESSION,"Janitorial_cost")>
<cfset StructDelete(SESSION,"Janitorial_rate")>
<cfset StructDelete(SESSION,"3080_cost")>
<cfset StructDelete(SESSION,"3080_rate")>
<cfset StructDelete(SESSION,"4080_cost")>
<cfset StructDelete(SESSION,"4080_rate")>
<cfset StructDelete(SESSION,"Natural_Area_cost")>
<cfset StructDelete(SESSION,"Natural_Area_rate")>
<cfset StructDelete(SESSION,"Trash_Receptacle_cost")>
<cfset StructDelete(SESSION,"Trash_Receptacle_rate")>
<cfset StructDelete(SESSION,"Playground_mulch_cost")>
<cfset StructDelete(SESSION,"Playground_mulch_rate")>
<cfset StructDelete(SESSION,"Turf_Nutsedge_cost")>
<cfset StructDelete(SESSION,"Turf_Nutsedge_rate")>
<cfset StructDelete(SESSION,"Turf_Fungicide_cost")>
<cfset StructDelete(SESSION,"Turf_Fungicide_rate")>
<cfset StructDelete(SESSION,"Turf_Insecticide_cost")>
<cfset StructDelete(SESSION,"Turf_Insecticide_rate")>
<cfset StructDelete(SESSION,"blank1_service")>
<cfset StructDelete(SESSION,"Blank1_unit")>
<cfset StructDelete(SESSION,"blank1_cost")>
<cfset StructDelete(SESSION,"blank1_rate")>
<cfset StructDelete(SESSION,"blank2_service")>
<cfset StructDelete(SESSION,"Blank2_unit")>
<cfset StructDelete(SESSION,"blank2_cost")>
<cfset StructDelete(SESSION,"blank2_rate")>
<cfset StructDelete(SESSION,"blank3_service")>
<cfset StructDelete(SESSION,"Blank3_unit")>
<cfset StructDelete(SESSION,"blank3_cost")>
<cfset StructDelete(SESSION,"blank3_rate")>
<cfset StructDelete(SESSION,"contract_start_date")>
<cfset StructDelete(SESSION,"contract_end_date")>
<cfset StructDelete(SESSION,"contract_installments")>
<cfset StructDelete(SESSION,"sales_tax")>
<cfset StructDelete(SESSION,"seasonal_hours")>
<cfset StructDelete(SESSION,"travel_time_gm")>
<cfset StructDelete(SESSION,"lot_sweeping_gm")>
<cfset StructDelete(SESSION,"blank1_gm")>
<cfset StructDelete(SESSION,"blank2_gm")>
<cfset StructDelete(SESSION,"blank3_gm")>
<cfset StructDelete(SESSION,"contract_adjustment")>
<cfset StructDelete(SESSION,"discount_adjustment")>
<!---------------------------- Materials SESSION variables------------------------------->
<cfset StructDelete(SESSION,"spraying_materials_rate")>
<cfset StructDelete(SESSION,"spraying_materials_qty")>
<cfset StructDelete(SESSION,"TURF_PREG_materials_rate")>
<cfset StructDelete(SESSION,"turf_preg_materials_qty")>
<cfset StructDelete(SESSION,"TURF_prel_materials_rate")>
<cfset StructDelete(SESSION,"turf_prel_materials_qty")>
<cfset StructDelete(SESSION,"TURF_post_materials_rate")>
<cfset StructDelete(SESSION,"TURF_post_materials_qty")>
<cfset StructDelete(SESSION,"TURF_fert_materials_rate")>
<cfset StructDelete(SESSION,"TURF_fert_materials_qty")>
<cfset StructDelete(SESSION,"Turf_Lime_materials_rate")>
<cfset StructDelete(SESSION,"Turf_Lime_materials_qty")>
<cfset StructDelete(SESSION,"mulch_f_dyed_materials_qty")>
<cfset StructDelete(SESSION,"mulch_f_dyed_materials_rate")>
<cfset StructDelete(SESSION,"mulch_s_dyed_materials_qty")>
<cfset StructDelete(SESSION,"mulch_s_dyed_materials_rate")>
<cfset StructDelete(SESSION,"Mulch_F_Reg_materials_qty")>
<cfset StructDelete(SESSION,"Mulch_F_Reg_materials_rate")>
<cfset StructDelete(SESSION,"Mulch_S_Reg_materials_qty")>
<cfset StructDelete(SESSION,"Mulch_S_Reg_materials_rate")>
<cfset StructDelete(SESSION,"Annuals_F_materials_rate")>
<cfset StructDelete(SESSION,"Annuals_F_materials_qty")>
<cfset StructDelete(SESSION,"Annuals_S_materials_rate")>
<cfset StructDelete(SESSION,"Annuals_S_materials_qty")>
<cfset StructDelete(SESSION,"Turf_Seed_materials_rate")>
<cfset StructDelete(SESSION,"Turf_Seed_materials_qty")>
<cfset StructDelete(SESSION,"TS_Insect_materials_rate")>
<cfset StructDelete(SESSION,"TS_Insect_materials_qty")>
<cfset StructDelete(SESSION,"Mulch_pre_materials_rate")>
<cfset StructDelete(SESSION,"Mulch_pre_materials_qty")>
<cfset StructDelete(SESSION,"TS_Fert_materials_rate")>
<cfset StructDelete(SESSION,"TS_Fert_materials_qty")>
<cfset StructDelete(SESSION,"Pine_Tags_materials_rate")>
<cfset StructDelete(SESSION,"Pine_Tags_materials_qty")>
<cfset StructDelete(SESSION,"TS_hort_oil_materials_rate")>
<cfset StructDelete(SESSION,"TS_hort_oil_materials_qty")>
<cfset StructDelete(SESSION,"Playground_mulch_materials_rate")>
<cfset StructDelete(SESSION,"Playground_mulch_materials_qty")>
<cfset StructDelete(SESSION,"Turf_Nutsedge_materials_rate")>
<cfset StructDelete(SESSION,"Turf_Nutsedge_materials_qty")>
<cfset StructDelete(SESSION,"Turf_Fungicide_materials_rate")>
<cfset StructDelete(SESSION,"Turf_Fungicide_materials_qty")>
<cfset StructDelete(SESSION,"Turf_Insecticide_materials_rate")>
<cfset StructDelete(SESSION,"Turf_Insecticide_materials_qty")>
<cfset StructDelete(SESSION,"gross_margin")>
<cfset StructDelete(SESSION,"spraying_materials_qty_actual")>
<cfset StructDelete(SESSION,"turf_preg_materials_qty_actual")>
<cfset StructDelete(SESSION,"turf_prel_materials_qty_actual")>
<cfset StructDelete(SESSION,"TURF_post_materials_qty_actual")>
<cfset StructDelete(SESSION,"TURF_fert_materials_qty_actual")>
<cfset StructDelete(SESSION,"Turf_Lime_materials_qty_actual")>
<cfset StructDelete(SESSION,"mulch_f_dyed_materials_qty_actual")>
<cfset StructDelete(SESSION,"mulch_s_dyed_materials_qty_actual")>
<cfset StructDelete(SESSION,"Mulch_F_Reg_materials_qty_actual")>
<cfset StructDelete(SESSION,"Mulch_S_Reg_materials_qty_actual")>
<cfset StructDelete(SESSION,"Annuals_F_materials_qty_actual")>
<cfset StructDelete(SESSION,"Annuals_S_materials_qty_actual")>
<cfset StructDelete(SESSION,"Turf_Seed_materials_qty_actual")>
<cfset StructDelete(SESSION,"TS_Insect_materials_qty_actual")>
<cfset StructDelete(SESSION,"Mulch_pre_materials_qty_actual")>
<cfset StructDelete(SESSION,"TS_Fert_materials_qty_actual")>
<cfset StructDelete(SESSION,"Pine_Tags_materials_qty_actual")>
<cfset StructDelete(SESSION,"TS_hort_oil_materials_qty_actual")>
<cfset StructDelete(SESSION,"Playground_mulch_materials_qty_actual")>
<cfset StructDelete(SESSION,"Turf_Nutsedge_materials_qty_actual")>
<cfset StructDelete(SESSION,"Turf_Fungicide_materials_qty_actual")>
<cfset StructDelete(SESSION,"Turf_Insecticide_materials_qty_actual")>

<!---  ZZZ --->
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
    <cfparam  name="SESSION.spraying_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Prodiamine Pre-emergent (oz)'>
    <cfparam  name="SESSION.TURF_prel_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Selective Herbicide (oz)'>
    <cfparam  name="SESSION.TURF_post_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Starter Fertilizer'>
    <cfparam  name="SESSION.TURF_fert_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'High Calcium Lime (lb)'>
    <cfparam  name="SESSION.Turf_Lime_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Granular Turf Preemergent (lb)'>
    <cfparam  name="SESSION.TURF_PREG_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, S (dyed) (CY)'>
    <cfparam  name="SESSION.mulch_s_dyed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, F (dyed) (CY)'>
    <cfparam  name="SESSION.mulch_f_dyed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, F (non-dyed) (CY)'>
    <cfparam  name="SESSION.Mulch_F_Reg_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Mulch, S (non-dyed) (CY)'>
    <cfparam  name="SESSION.Mulch_S_Reg_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Spring Flowers (6 in pots)'>
    <cfparam  name="SESSION.ANNUALS_S_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fall Flowers (6 in pots)'>
    <cfparam  name="SESSION.Annuals_F_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fescue Seed (lb)'>
    <cfparam  name="SESSION.Turf_Seed_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Bifenthrin Tree & Shrub Insecticide (oz)'>
    <cfparam  name="SESSION.TS_Insect_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Fertilizer Ornamental 14-14-14  (lbs)'>
    <cfparam  name="SESSION.TS_Fert_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Bed Pre-emergent Granular (lbs)'>
    <cfparam  name="SESSION.Mulch_pre_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Pine Tags (bales)'>
    <cfparam  name="SESSION.Pine_Tags_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Hort/Dormant Oil (oz)'>
    <cfparam  name="SESSION.TS_hort_oil_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Playground Mulch'>
    <cfparam  name="SESSION.Playground_Mulch_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Nutsedge'>
    <cfparam  name="SESSION.Turf_Nutsedge_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Fungicide '>
    <cfparam  name="SESSION.Turf_Fungicide_materials_rate" default="#get_material_admin_info.Selling_Price#">
  </cfif>
  <cfif  item_desc EQ 'Turf Insecticide '>
    <cfparam  name="SESSION.Turf_Insecticide_materials_rate" default="#get_material_admin_info.Selling_Price#">
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
    <cfparam  name="SESSION.push_mow_cost" default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.push_mow_rate" default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Walk Behind'>
    <cfparam  name="SESSION.Walk_Behind_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Walk_Behind_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Ride Mow'>
    <cfparam  name="SESSION.Ride_Mow_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Ride_Mow_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Hard Edge (s)'>
    <cfparam  name="SESSION.Hard_Edge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Hard_Edge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Bed Edge'>
    <cfparam  name="SESSION.Bed_Edge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Bed_Edge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, O'>
    <cfparam  name="SESSION.Trim_O_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trim_O_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, S'>
    <cfparam  name="SESSION.Trim_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trim_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Spraying'>
    <cfparam  name="SESSION.Spraying_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Spraying_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Weeding'>
    <cfparam  name="SESSION.Weeding_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Weeding_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Blowing'>
    <cfparam  name="SESSION.Blowing_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Blowing_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash, S'>
    <cfparam  name="SESSION.Trash_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trash_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash, Off'>
    <cfparam  name="SESSION.Trash_O_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trash_O_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Traveltime'>
    <cfparam  name="SESSION.Traveltime_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Traveltime_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Leaf Rem'>
    <cfparam  name="SESSION.LeafRem_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.LeafRem_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Pre (G)'>
    <cfparam  name="SESSION.turf_preg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.turf_preg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Pre (L)'>
    <cfparam  name="SESSION.Turf_prel_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_prel_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Post'>
    <cfparam  name="SESSION.Turf_Post_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Post_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Fert'>
    <cfparam  name="SESSION.Turf_Fert_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Fert_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Lime'>
    <cfparam  name="SESSION.Turf_Lime_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Lime_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Aer (H)'>
    <cfparam  name="SESSION.Turf_Aer_H_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Aer_H_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Aer (T)'>
    <cfparam  name="SESSION.Turf_Aer_T_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Aer_T_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Seed'>
    <cfparam  name="SESSION.Turf_Seed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Seed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pruning, T/P'>
    <cfparam  name="SESSION.Pruning_TP_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Pruning_TP_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pruning, S'>
    <cfparam  name="SESSION.Pruning_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Pruning_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, Fert'>
    <cfparam  name="SESSION.TS_Fert_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.TS_Fert_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, Insect'>
    <cfparam  name="SESSION.TS_Insect_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.TS_Insect_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, Pre'>
    <cfparam  name="SESSION.Mulch_Pre_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_Pre_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, Edging'>
    <cfparam  name="SESSION.Mulch_Edging_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_Edging_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, S (dyed)'>
    <cfparam  name="SESSION.Mulch_S_dyed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_S_dyed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, F (dyed)'>
    <cfparam  name="SESSION.Mulch_F_dyed_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_F_dyed_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Annuals, S'>
    <cfparam  name="SESSION.Annuals_S_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Annuals_S_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Annuals, F'>
    <cfparam  name="SESSION.Annuals_F_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Annuals_F_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, SU'>
    <cfparam  name="SESSION.Irrigation_SU_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Irrigation_SU_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, W'>
    <cfparam  name="SESSION.Irrigation_W_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Irrigation_W_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, I'>
    <cfparam  name="SESSION.Irrigation_I_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Irrigation_I_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, F (reg)'>
    <cfparam  name="SESSION.Mulch_F_Reg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_F_Reg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Mulch, S (reg)'>
    <cfparam  name="SESSION.Mulch_S_reg_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Mulch_S_reg_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pond Maint.'>
    <cfparam  name="SESSION.Pond_Maint_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Pond_Maint_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trim, Hillside'>
    <cfparam  name="SESSION.Trim_Hillside_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trim_Hillside_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Pine Tags'>
    <cfparam  name="SESSION.Pine_Tags_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Pine_Tags_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'T&S, hort oil'>
    <cfparam  name="SESSION.TS_hort_oil_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.TS_hort_oil_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Addtl. Mowing'>
    <cfparam  name="SESSION.Addtl_Mowing_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Addtl_Mowing_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Day Porter'>
    <cfparam  name="SESSION.Day_Porter_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Day_Porter_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Bush Hog'>
    <cfparam  name="SESSION.Bush_Hog_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Bush_Hog_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Lot Sweeping'>
    <cfparam  name="SESSION.Lot_Sweeping_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Lot_Sweeping_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Insect'>
    <cfparam  name="SESSION.Insect_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Insect_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Cleanup'>
    <cfparam  name="SESSION.cleanup_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.cleanup_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trail Maint'>
    <cfparam  name="SESSION.Trail_Maint_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trail_Maint_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, T/M'>
    <cfparam  name="SESSION.Irrigation_TM_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Irrigation_TM_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Janitorial'>
    <cfparam  name="SESSION.Janitorial_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Janitorial_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Irrigation, BFI'>
    <cfparam  name="SESSION.Irrigation_BFI_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Irrigation_BFI_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Natural Area'>
    <cfparam  name="SESSION.Natural_Area_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Natural_Area_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Trash Receptacle'>
    <cfparam  name="SESSION.Trash_Receptacle_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Trash_Receptacle_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Playground mulch'>
    <cfparam  name="SESSION.Playground_mulch_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Playground_mulch_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Nutsedge'>
    <cfparam  name="SESSION.Turf_Nutsedge_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Nutsedge_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Fungicide'>
    <cfparam  name="SESSION.Turf_Fungicide_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Fungicide_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
  <cfif  service_id EQ 'Turf Insecticide'>
    <cfparam  name="SESSION.Turf_Insecticide_cost"  default="#get_service_admin_info.Service_Rate#">
    <cfparam  name="SESSION.Turf_Insecticide_rate"  default="#get_service_admin_info.Sq_Ft#">
  </cfif>
</cfloop>
<cfparam  name="SESSION.gross_margin" default="50.000"  >
<cfparam  name="gross_margin" default="50.000"  >
<cfparam  name="SESSION.push_mow_qty" default="0"  >
<cfparam  name="SESSION.push_mow_times" default="0">
<cfparam  name="push_mow_qty" default="0"  >
<cfparam  name="push_mow_times" default="0">
<cfparam  name="SESSION.walk_behind_qty" default="0"  >
<cfparam  name="SESSION.walk_behind_times" default="0">
<cfparam  name="walk_behind_qty" default="0"  >
<cfparam  name="walk_behind_times" default="0">
<cfparam  name="SESSION.ride_mow_qty" default="0"  >
<cfparam  name="SESSION.ride_mow_times" default="0">
<cfparam  name="ride_mow_qty" default="0"  >
<cfparam  name="ride_mow_times" default="0">
<cfparam  name="SESSION.hard_edge_qty" default="0"  >
<cfparam  name="SESSION.hard_edge_times" default="0">
<cfparam  name="hard_edge_qty" default="0"  >
<cfparam  name="hard_edge_times" default="0">
<cfparam  name="SESSION.bed_edge_qty" default="0"  >
<cfparam  name="SESSION.bed_edge_times" default="0">
<cfparam  name="bed_edge_qty" default="0"  >
<cfparam  name="bed_edge_times" default="0">
<cfparam  name="SESSION.Trim_O_qty" default="0"  >
<cfparam  name="SESSION.Trim_O_Times" default="0">
<cfparam  name="Trim_O_qty" default="0"  >
<cfparam  name="Trim_O_Times" default="0">
<cfparam  name="SESSION.Trim_S_qty" default="0"  >
<cfparam  name="SESSION.trim_S_times" default="0">
<cfparam  name="Trim_S_qty" default="0"  >
<cfparam  name="trim_S_times" default="0">
<cfparam  name="SESSION.spraying_qty" default="0"  >
<cfparam  name="SESSION.spraying_times" default="0">
<cfparam  name="SESSION.spraying_materials_qty" default="0">
<cfparam  name="spraying_qty" default="0"  >
<!---  <cfparam  name="SESSION.spraying_materials_rate" default="0"> ---> 
<cfparam  name="spraying_times" default="0">
<cfparam  name="spraying_materials_qty" default="0">
<!--- <cfparam  name="spraying_materials_rate" default="0"> --->
<cfparam  name="SESSION.weeding_qty" default="0"  >
<cfparam  name="SESSION.weeding_times" default="0">
<cfparam  name="weeding_qty" default="0"  >
<cfparam  name="weeding_times" default="0">
<cfparam  name="SESSION.blowing_qty" default="0"  >
<cfparam  name="SESSION.blowing_times" default="0">
<cfparam  name="blowing_qty" default="0"  >
<cfparam  name="blowing_times" default="0">
<cfparam  name="SESSION.Trash_S_Qty" default="0"  >
<cfparam  name="SESSION.Trash_S_Times" default="0">
<cfparam  name="Trash_S_Qty" default="0"  >
<cfparam  name="Trash_S_Times" default="0">
<cfparam  name="SESSION.traveltime_qty" default="0"  >
<cfparam  name="SESSION.traveltime_times" default="0">
<cfparam  name="traveltime_qty" default="0"  >
<cfparam  name="traveltime_times" default="0">
<cfparam  name="SESSION.Trash_O_Qty" default="0"  >
<cfparam  name="SESSION.Trash_O_Times" default="0">
<cfparam  name="Trash_O_Qty" default="0"  >
<cfparam  name="Trash_O_Times" default="0">
<cfparam  name="SESSION.leafrem_qty" default="0"  >
<cfparam  name="SESSION.leafrem_times" default="0">
<cfparam  name="leafrem_qty" default="0"  >
<cfparam  name="leafrem_times" default="0">
<cfparam  name="SESSION.cleanup_qty" default="0"  >
<cfparam  name="SESSION.cleanup_times" default="0">
<cfparam  name="cleanup_qty" default="0"  >
<cfparam  name="cleanup_times" default="0">
<cfparam  name="SESSION.turf_preg_qty" default="0"  >
<cfparam  name="SESSION.turf_preg_times" default="0">
<cfparam  name="SESSION.turf_preg_materials_qty" default="0">
<!--- <cfparam  name="SESSION.TURF_PREG_materials_rate" default="0"> --->
<cfparam  name="turf_preg_qty" default="0"  >
<cfparam  name="turf_preg_times" default="0">
<cfparam  name="turf_preg_materials_qty" default="0">
<!--- <cfparam  name="TURF_PREG_materials_rate" default="0"> --->
<cfparam  name="SESSION.turf_prel_qty" default="0"  >
<cfparam  name="SESSION.turf_prel_times" default="0">
<cfparam  name="SESSION.turf_prel_materials_qty" default="0">
<!--- <cfparam  name="SESSION.TURF_prel_materials_rate" default="0"> --->
<cfparam  name="turf_prel_qty" default="0"  >
<cfparam  name="turf_prel_times" default="0">
<cfparam  name="turf_prel_materials_qty" default="0">
<!--- <cfparam  name="TURF_PREL_materials_rate" default="0"> --->
<cfparam  name="SESSION.turf_post_qty" default="0"  >
<cfparam  name="SESSION.turf_post_times" default="0">
<cfparam  name="SESSION.turf_post_materials_qty" default="0">
<!--- <cfparam  name="SESSION.TURF_post_materials_rate" default="0"> --->
<cfparam  name="turf_post_qty" default="0"  >
<cfparam  name="turf_post_times" default="0">
<cfparam  name="turf_post_materials_qty" default="0">
<!--- <cfparam  name="TURF_post_materials_rate" default="0"> --->
<cfparam  name="SESSION.turf_fert_qty" default="0"  >
<cfparam  name="SESSION.turf_fert_times" default="0">
<cfparam  name="SESSION.turf_fert_materials_qty" default="0">
<!---<cfparam  name="SESSION.turf_fert_materials_rate" default="0"> Z--->
<cfparam  name="turf_fert_qty" default="0"  >
<cfparam  name="turf_fert_times" default="0">
<cfparam  name="turf_fert_materials_qty" default="0">
<!---<cfparam  name="turf_fert_materials_rate" default="0" Z>--->
<cfparam  name="SESSION.turf_lime_qty" default="0"  >
<cfparam  name="SESSION.turf_lime_times" default="0">
<cfparam  name="SESSION.turf_lime_materials_qty" default="0">
<!--- <cfparam  name="SESSION.turf_lime_materials_rate" default="0"> --->
<cfparam  name="turf_lime_qty" default="0"  >
<cfparam  name="turf_lime_times" default="0">
<cfparam  name="turf_lime_materials_qty" default="0">
<!--- <cfparam  name="turf_lime_materials_rate" default="0"> --->
<cfparam  name="SESSION.Turf_Aer_H_qty" default="0"  >
<cfparam  name="SESSION.Turf_Aer_H_times" default="0">
<cfparam  name="SESSION.Turf_Aer_H_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Turf_Aer_H_materials_rate" default="0"> --->
<cfparam  name="Turf_Aer_H_qty" default="0"  >
<cfparam  name="Turf_Aer_H_times" default="0">
<cfparam  name="Turf_Aer_H_materials_qty" default="0">
<!--- <cfparam  name="Turf_Aer_H_materials_rate" default="0"> --->
<cfparam  name="SESSION.Turf_Aer_T_qty" default="0"  >
<cfparam  name="SESSION.Turf_Aer_T_times" default="0">
<cfparam  name="SESSION.Turf_Aer_T_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Turf_Aer_T_materials_rate" default="0"> --->
<cfparam  name="Turf_Aer_T_qty" default="0"  >
<cfparam  name="Turf_Aer_T_times" default="0">
<cfparam  name="Turf_Aer_T_materials_qty" default="0">
<!--- <cfparam  name="Turf_Aer_T_materials_rate" default="0"> --->
<cfparam  name="SESSION.Turf_Seed_qty" default="0"  >
<cfparam  name="SESSION.Turf_Seed_times" default="0">
<cfparam  name="SESSION.Turf_Seed_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Turf_Seed_materials_rate" default="0"> --->
<cfparam  name="Turf_Seed_qty" default="0"  >
<cfparam  name="Turf_Seed_times" default="0">
<cfparam  name="Turf_Seed_materials_qty" default="0">
<!--- <cfparam  name="Turf_Seed_materials_rate" default="0"> --->
<cfparam  name="SESSION.Pruning_TP_qty" default="0"  >
<cfparam  name="SESSION.Pruning_TP_times" default="0">
<cfparam  name="SESSION.Pruning_TP_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Pruning_TP_materials_rate" default="0"> --->
<cfparam  name="Pruning_TP_qty" default="0"  >
<cfparam  name="Pruning_TP_times" default="0">
<cfparam  name="Pruning_TP_materials_qty" default="0">
<!--- <cfparam  name="Pruning_TP_materials_rate" default="0"> --->
<cfparam  name="SESSION.Pruning_S_qty" default="0"  >
<cfparam  name="SESSION.Pruning_S_times" default="0">
<cfparam  name="SESSION.Pruning_S_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Pruning_S_materials_rate" default="0"> --->
<cfparam  name="Pruning_S_qty" default="0"  >
<cfparam  name="Pruning_S_times" default="0">
<cfparam  name="Pruning_S_materials_qty" default="0">
<!--- <cfparam  name="Pruning_S_materials_rate" default="0"> --->
<cfparam  name="SESSION.TS_Fert_qty" default="0"  >
<cfparam  name="SESSION.TS_Fert_times" default="0">
<cfparam  name="SESSION.TS_Fert_materials_qty" default="0">
<!---<cfparam  name="SESSION.TS_Fert_materials_rate" default="0">--->
<cfparam  name="TS_Fert_qty" default="0"  >
<cfparam  name="TS_Fert_times" default="0">
<cfparam  name="TS_Fert_materials_qty" default="0">
<!---<cfparam  name="TS_Fert_materials_rate" default="0">--->
<cfparam  name="SESSION.TS_Insect_qty" default="0"  >
<cfparam  name="SESSION.TS_Insect_times" default="0">
<cfparam  name="SESSION.TS_Insect_materials_qty" default="0">
<!--- <cfparam  name="SESSION.TS_Insect_materials_rate" default="0"> --->
<cfparam  name="TS_Insect_qty" default="0"  >
<cfparam  name="TS_Insect_times" default="0">
<cfparam  name="TS_Insect_materials_qty" default="0">
<!--- <cfparam  name="TS_Insect_materials_rate" default="0"> --->
<cfparam  name="SESSION.Mulch_pre_qty" default="0"  >
<cfparam  name="SESSION.Mulch_pre_times" default="0">
<cfparam  name="SESSION.Mulch_pre_materials_qty" default="0">
<!---<cfparam  name="SESSION.Mulch_pre_materials_rate" default="0">--->
<cfparam  name="Mulch_pre_qty" default="0"  >
<cfparam  name="Mulch_pre_times" default="0">
<cfparam  name="Mulch_pre_materials_qty" default="0">
<!---<cfparam  name="Mulch_pre_materials_rate" default="0">--->
<cfparam  name="SESSION.Mulch_edging_qty" default="0"  >
<cfparam  name="SESSION.Mulch_edging_times" default="0">
<cfparam  name="SESSION.Mulch_edging_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Mulch_edging_materials_rate" default="0"> --->
<cfparam  name="Mulch_edging_qty" default="0"  >
<cfparam  name="Mulch_edging_times" default="0">
<cfparam  name="Mulch_edging_materials_qty" default="0">
<!--- <cfparam  name="Mulch_edging_materials_rate" default="0"> --->
<cfparam  name="SESSION.mulch_s_dyed_qty" default="0"  >
<cfparam  name="SESSION.mulch_s_dyed_times" default="0">
<cfparam  name="SESSION.mulch_s_dyed_materials_qty" default="0">
<!--- <cfparam  name="SESSION.mulch_s_dyed_materials_rate" default="0"> --->
<cfparam  name="mulch_s_dyed_qty" default="0"  >
<cfparam  name="mulch_s_dyed_times" default="0">
<cfparam  name="mulch_s_dyed_materials_qty" default="0">
<!--- <cfparam  name="mulch_s_dyed_materials_rate" default="0"> --->
<cfparam  name="SESSION.mulch_f_dyed_qty" default="0"  >
<cfparam  name="SESSION.mulch_f_dyed_times" default="0">
<cfparam  name="SESSION.mulch_f_dyed_materials_qty" default="0">
<!--- <cfparam  name="SESSION.mulch_f_dyed_materials_rate" default="0"> --->
<cfparam  name="mulch_f_dyed_qty" default="0"  >
<cfparam  name="mulch_f_dyed_times" default="0">
<cfparam  name="mulch_f_dyed_materials_qty" default="0">
<!--- <cfparam  name="mulch_f_dyed_materials_rate" default="0"> --->
<cfparam  name="SESSION.Annuals_S_qty" default="0"  >
<cfparam  name="SESSION.Annuals_S_times" default="0">
<cfparam  name="SESSION.Annuals_S_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Annuals_S_materials_rate" default="0"> --->
<cfparam  name="Annuals_S_qty" default="0"  >
<cfparam  name="Annuals_S_times" default="0">
<cfparam  name="Annuals_S_materials_qty" default="0">
<!--- <cfparam  name="Annuals_S_materials_rate" default="0"> --->
<cfparam  name="SESSION.Annuals_F_qty" default="0"  >
<cfparam  name="SESSION.Annuals_F_times" default="0">
<cfparam  name="SESSION.Annuals_F_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Annuals_F_materials_rate" default="0"> --->
<cfparam  name="Annuals_F_qty" default="0"  >
<cfparam  name="Annuals_F_times" default="0">
<cfparam  name="Annuals_F_materials_qty" default="0">
<!--- <cfparam  name="Annuals_F_materials_rate" default="0"> --->
<cfparam  name="SESSION.Irrigation_SU_qty" default="0"  >
<cfparam  name="SESSION.Irrigation_SU_times" default="0">
<cfparam  name="SESSION.Irrigation_SU_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Irrigation_SU_materials_rate" default="0"> --->
<cfparam  name="Irrigation_SU_qty" default="0"  >
<cfparam  name="Irrigation_SU_times" default="0">
<cfparam  name="Irrigation_SU_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_SU_materials_rate" default="0"> --->
<cfparam  name="SESSION.Irrigation_W_qty" default="0"  >
<cfparam  name="SESSION.Irrigation_W_times" default="0">
<cfparam  name="SESSION.Irrigation_W_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Irrigation_W_materials_rate" default="0"> --->
<cfparam  name="Irrigation_W_qty" default="0"  >
<cfparam  name="Irrigation_W_times" default="0">
<cfparam  name="Irrigation_W_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_W_materials_rate" default="0"> --->
<cfparam  name="SESSION.Irrigation_I_qty" default="0"  >
<cfparam  name="SESSION.Irrigation_I_times" default="0">
<cfparam  name="SESSION.Irrigation_I_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Irrigation_I_materials_rate" default="0"> --->
<cfparam  name="Irrigation_I_qty" default="0"  >
<cfparam  name="Irrigation_I_times" default="0">
<cfparam  name="Irrigation_I_materials_qty" default="0">
<!--- <cfparam  name="Irrigation_I_materials_rate" default="0"> --->
<cfparam  name="SESSION.Mulch_F_Reg_qty" default="0"  >
<cfparam  name="SESSION.Mulch_F_Reg_times" default="0">
<cfparam  name="SESSION.Mulch_F_Reg_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Mulch_F_Reg_materials_rate" default="0">  --->
<cfparam  name="Mulch_F_Reg_qty" default="0"  >
<cfparam  name="Mulch_F_Reg_times" default="0">
<cfparam  name="Mulch_F_Reg_materials_qty" default="0">
<!--- <cfparam  name="Mulch_F_Reg_materials_rate" default="0">  --->
<cfparam  name="SESSION.Mulch_S_Reg_qty" default="0"  >
<cfparam  name="SESSION.Mulch_S_Reg_times" default="0">
<cfparam  name="SESSION.Mulch_S_Reg_materials_qty" default="0">
<!--- <cfparam  name="SESSION.Mulch_S_Reg_materials_rate" default="0">  --->
<cfparam  name="Mulch_S_Reg_qty" default="0"  >
<cfparam  name="Mulch_S_Reg_times" default="0">
<cfparam  name="Mulch_S_Reg_materials_qty" default="0">
<!--- <cfparam  name="Mulch_S_Reg_materials_rate" default="0">  --->
<cfparam  name="SESSION.Pond_Maint_qty" default="0"  >
<cfparam  name="SESSION.Pond_Maint_times" default="0">
<cfparam  name="SESSION.Pond_Maint_materials_qty" default="0">
<!---  <cfparam  name="SESSION.Pond_Maint_materials_rate" default="0">  --->
<cfparam  name="Pond_Maint_qty" default="0"  >
<cfparam  name="Pond_Maint_times" default="0">
<cfparam  name="Pond_Maint_materials_qty" default="0">
<!---   <cfparam  name="Pond_Maint_materials_rate" default="0">  --->
<cfparam  name="SESSION.Trim_Hillside_qty" default="0"  >
<cfparam  name="SESSION.Trim_Hillside_times" default="0">
<cfparam  name="Trim_Hillside_qty" default="0"  >
<cfparam  name="Trim_Hillside_times" default="0">
<cfparam  name="SESSION.Pine_Tags_qty" default="0"  >
<cfparam  name="SESSION.Pine_Tags_times" default="0">
<cfparam  name="SESSION.Pine_Tags_materials_qty" default="0">
<!---  <cfparam  name="SESSION.Pine_Tags_materials_rate" default="0">  --->
<cfparam  name="Pine_Tags_qty" default="0"  >
<cfparam  name="Pine_Tags_times" default="0">
<cfparam  name="Pine_Tags_materials_qty" default="0">
<!---<cfparam  name="Pine_Tags_materials_rate" default="0">--->
<cfparam  name="SESSION.TS_hort_oil_qty" default="0"  >
<cfparam  name="SESSION.TS_hort_oil_times" default="0">
<cfparam  name="SESSION.TS_hort_oil_materials_qty" default="0">
<!---  <cfparam  name="SESSION.TS_hort_oil_MATERIALS_RATE" default="0">  --->
<cfparam  name="TS_hort_oil_qty" default="0"  >
<cfparam  name="TS_hort_oil_times" default="0">
<cfparam  name="TS_hort_oil_materials_qty" default="0">
<!---<cfparam  name="TS_hort_oil_MATERIALS_RATE" default="0">--->
<cfparam  name="SESSION.Addtl_Mowing_qty" default="0"  >
<cfparam  name="SESSION.Addtl_Mowing_times" default="0">
<cfparam  name="Addtl_Mowing_qty" default="0"  >
<cfparam  name="Addtl_Mowing_times" default="0">
<cfparam  name="SESSION.Day_Porter_qty" default="0"  >
<cfparam  name="SESSION.Day_Porter_times" default="0">
<cfparam  name="Day_Porter_qty" default="0"  >
<cfparam  name="Day_Porter_times" default="0">
<cfparam  name="SESSION.Bush_Hog_qty" default="0"  >
<cfparam  name="SESSION.Bush_Hog_times" default="0">
<cfparam  name="Bush_Hog_qty" default="0"  >
<cfparam  name="Bush_Hog_times" default="0">
<cfparam  name="SESSION.Lot_Sweeping_qty" default="0"  >
<cfparam  name="SESSION.Lot_Sweeping_times" default="0">
<cfparam  name="Lot_Sweeping_qty" default="0"  >
<cfparam  name="Lot_Sweeping_times" default="0">
<cfparam  name="SESSION.Trail_Maint_qty" default="0"  >
<cfparam  name="SESSION.Trail_Maint_times" default="0">
<cfparam  name="Trail_Maint_qty" default="0"  >
<cfparam  name="Trail_Maint_times" default="0">
<cfparam  name="SESSION.Irrigation_TM_qty" default="0"  >
<cfparam  name="SESSION.Irrigation_TM_times" default="0">
<cfparam  name="Irrigation_TM_qty" default="0"  >
<cfparam  name="Irrigation_TM_times" default="0">
<cfparam  name="SESSION.Irrigation_BFI_qty" default="0"  >
<cfparam  name="SESSION.Irrigation_BFI_times" default="0">
<cfparam  name="Irrigation_BFI_qty" default="0"  >
<cfparam  name="Irrigation_BFI_times" default="0">
<cfparam  name="SESSION.Natural_Area_qty" default="0"  >
<cfparam  name="SESSION.Natural_Area_times" default="0">
<cfparam  name="Natural_Area_qty" default="0"  >
<cfparam  name="Natural_Area_times" default="0">
<cfparam  name="SESSION.Trash_Receptacle_qty" default="0"  >
<cfparam  name="SESSION.Trash_Receptacle_times" default="0">
<cfparam  name="Trash_Receptacle_qty" default="0"  >
<cfparam  name="Trash_Receptacle_times" default="0">
<cfparam  name="SESSION.Playground_mulch_qty" default="0"  >
<cfparam  name="SESSION.Playground_mulch_times" default="0">
<cfparam  name="SESSION.Playground_mulch_materials_qty" default="0">
<cfparam  name="SESSION.Playground_mulch_MATERIALS_RATE" default="0">
<cfparam  name="Playground_mulch_qty" default="0"  >
<cfparam  name="Playground_mulch_times" default="0">
<cfparam  name="Playground_mulch_materials_qty" default="0">
<cfparam  name="Playground_mulch_MATERIALS_RATE" default="0">
<cfparam  name="SESSION.Turf_Nutsedge_qty" default="0"  >
<cfparam  name="SESSION.Turf_Nutsedge_times" default="0">
<cfparam  name="SESSION.Turf_Nutsedge_materials_qty" default="0">
<cfparam  name="Turf_Nutsedge_qty" default="0"  >
<cfparam  name="Turf_Nutsedge_times" default="0">
<cfparam  name="Turf_Nutsedge_materials_qty" default="0">
<cfparam  name="SESSION.Turf_Fungicide_qty" default="0"  >
<cfparam  name="SESSION.Turf_Fungicide_times" default="0">
<cfparam  name="SESSION.Turf_Fungicide_materials_qty" default="0">
<cfparam  name="Turf_Fungicide_qty" default="0"  >
<cfparam  name="Turf_Fungicide_times" default="0">
<cfparam  name="Turf_Fungicide_materials_qty" default="0">
<cfparam  name="SESSION.Turf_Insecticide_qty" default="0"  >
<cfparam  name="SESSION.Turf_Insecticide_times" default="0">
<cfparam  name="SESSION.Turf_Insecticide_materials_qty" default="0">
<cfparam  name="Turf_Insecticide_qty" default="0"  >
<cfparam  name="Turf_Insecticide_times" default="0">
<cfparam  name="Turf_Insecticide_materials_qty" default="0">
<cfparam  name="SESSION.blank1_qty" default="0"  >
<cfparam  name="SESSION.blank1_times" default="0">
<cfparam  name="SESSION.blank1_materials_qty" default="0">
<cfparam  name="SESSION.blank1_MATERIALS_RATE" default="0">
<cfparam  name="blank1_qty" default="0"  >
<cfparam  name="blank1_times" default="0">
<cfparam  name="blank1_materials_qty" default="0">
<cfparam  name="blank1_MATERIALS_RATE" default="0">
<cfparam  name="SESSION.blank1_rate" default="1"  >
<cfif IsDefined("form.BLANK1_COST")>
  <cfparam  name="SESSION.BLANK1_COST" default="#form.BLANK1_COST#"  >
  <cfelse>
  <cfparam  name="SESSION.BLANK1_COST" default="10.50"  >
</cfif>
<cfparam  name="SESSION.blank1_unit" default=""  >
<cfparam  name="SESSION.BLANK1_SERVICE" default=""  >
<cfparam  name="BLANK1_SERVICE" default=""  >
<cfparam  name="BLANK1_unit" default=""  >
<cfparam  name="BLANK1_rate" default="1"  >
<cfparam  name="SESSION.blank2_qty" default="0"  >
<cfparam  name="SESSION.blank2_times" default="0">
<cfparam  name="SESSION.blank2_materials_qty" default="0">
<cfparam  name="SESSION.blank2_MATERIALS_RATE" default="0">
<cfparam  name="blank2_qty" default="0"  >
<cfparam  name="blank2_times" default="0">
<cfparam  name="blank2_materials_qty" default="0">
<cfparam  name="blank2_MATERIALS_RATE" default="0">
<cfparam  name="SESSION.blank2_rate" default="1"  >
<cfif IsDefined("form.BLANK2_COST")>
  <cfparam  name="SESSION.BLANK2_COST" default="#form.BLANK2_COST#"  >
  <cfelse>
  <cfparam  name="SESSION.BLANK2_COST" default="10.50"  >
</cfif>
<cfparam  name="SESSION.blank2_unit" default=""  >
<cfparam  name="SESSION.BLANK2_SERVICE" default=""  >
<cfparam  name="BLANK2_SERVICE" default=""  >
<cfparam  name="BLANK2_unit" default=""  >
<cfparam  name="BLANK2_rate" default="1"  >
<cfparam  name="SESSION.blank3_qty" default="0"  >
<cfparam  name="SESSION.blank3_times" default="0">
<cfparam  name="SESSION.blank3_materials_qty" default="0">
<cfparam  name="SESSION.blank3_MATERIALS_RATE" default="0">
<cfparam  name="blank3_qty" default="0"  >
<cfparam  name="blank3_times" default="0">
<cfparam  name="blank3_materials_qty" default="0">
<cfparam  name="blank3_MATERIALS_RATE" default="0">
<cfparam  name="SESSION.blank3_rate" default="1"  >
<cfif IsDefined("form.BLANK3_COST")>
  <cfparam  name="SESSION.BLANK3_COST" default="#form.BLANK3_COST#"  >
  <cfelse>
  <cfparam  name="SESSION.BLANK3_COST" default="10.50"  >
</cfif>
<cfparam  name="SESSION.blank3_unit" default=""  >
<cfparam  name="SESSION.blank3_SERVICE" default=""  >
<cfparam  name="blank3_SERVICE" default=""  >
<cfparam  name="blank3_unit" default=""  >
<cfparam  name="blank3_rate" default="1"  >
<cfparam  name= "SESSION.Irrigation_Contract" default="0">
<cfparam  name= "SESSION.Seasonal_Color_Contract" default="0">
<cfparam  name= "SESSION.Grounds_Maintenance_Contract" default="0">
<cfparam  name="SESSION.contract_start_date" default="">
<cfparam  name="SESSION.contract_end_date" default="">
<cfparam  name="SESSION.contract_installments" default="">
<cfparam  name="form.contract_start_date" default="">
<cfparam  name="form.contract_end_date" default="">
<cfparam  name="SESSION.seasonal_hours" default="0">
<cfparam  name="SESSION.travel_time_gm" default="0"  >
<cfparam  name="SESSION.lot_sweeping_gm" default="0"  >
<cfparam  name="SESSION.blank1_gm" default="0"  >
<cfparam  name="SESSION.blank2_gm" default="0"  >
<cfparam  name="SESSION.blank3_gm" default="0"  >
<cfparam  name="SESSION.TAXRATEPLUSONE" default="0"  >
<cfparam  name="SESSION.TAXRATE" default="0"  >
<cfparam  name="SESSION.contract_adjustment" default="0"  >
<cfparam  name="contract_adjustment" default="0"  >
<cfparam  name="SESSION.discount_adjustment" default="0"  >
<cfparam  name="discount_adjustment" default="0"  >
<cfparam  name="SESSION.total_contract_price"  default="0">
<cfparam  name="SESSION.push_mow_contract_price"  default="0">
<cfparam  name="SESSION.walk_behind_contract_price"  default="0">
<cfparam  name="SESSION.ride_mow_contract_price"  default="0">
<cfparam  name="SESSION.hard_edge_contract_price"  default="0">
<cfparam  name="SESSION.bed_edge_contract_price"  default="0">
<cfparam  name="SESSION.TRIM_O_contract_price"  default="0">
<cfparam  name="SESSION.TRIM_S_contract_price"  default="0">
<cfparam  name="SESSION.spraying_contract_price"  default="0">
<cfparam  name="SESSION.weeding_contract_price"  default="0">
<cfparam  name="SESSION.blowing_contract_price"  default="0">
<cfparam  name="SESSION.Trash_S_contract_price"  default="0">
<cfparam  name="SESSION.traveltime_contract_price"  default="0">
<cfparam  name="SESSION.Trash_O_contract_price"  default="0">
<cfparam  name="SESSION.leafrem_contract_price"  default="0">
<cfparam  name="SESSION.cleanup_contract_price"  default="0">
<cfparam  name="SESSION.turf_preg_contract_price"  default="0">
<cfparam  name="SESSION.turf_prel_contract_price"  default="0">
<cfparam  name="SESSION.turf_post_contract_price"  default="0">
<cfparam  name="SESSION.turf_fert_contract_price"  default="0">
<cfparam  name="SESSION.turf_lime_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Aer_H_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Aer_T_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Seed_contract_price"  default="0">
<cfparam  name="SESSION.Pruning_TP_contract_price"  default="0">
<cfparam  name="SESSION.Pruning_S_contract_price"  default="0">
<cfparam  name="SESSION.TS_Fert_contract_price"  default="0">
<cfparam  name="SESSION.TS_Insect_contract_price"  default="0">
<cfparam  name="SESSION.Annuals_S_contract_price"  default="0">
<cfparam  name="SESSION.Annuals_F_contract_price"  default="0">
<cfparam  name="SESSION.Irrigation_SU_contract_price"  default="0">
<cfparam  name="SESSION.Irrigation_W_contract_price"  default="0">
<cfparam  name="SESSION.Irrigation_I_contract_price"  default="0">
<cfparam  name="SESSION.Mulch_F_Reg_contract_price"  default="0">
<cfparam  name="SESSION.Mulch_S_Reg_contract_price"  default="0">
<cfparam  name="SESSION.mulch_s_dyed_contract_price"  default="0">
<cfparam  name="SESSION.mulch_f_dyed_contract_price"  default="0">
<cfparam  name="SESSION.mulch_edging_contract_price"  default="0">
<cfparam  name="SESSION.Mulch_pre_contract_price"  default="0">
<cfparam  name="SESSION.Pond_maint_contract_price"  default="0">
<cfparam  name="SESSION.Trim_Hillside_contract_price"  default="0">
<cfparam  name="SESSION.Pine_Tags_contract_price"  default="0">
<cfparam  name="SESSION.TS_hort_oil_contract_price"  default="0">
<cfparam  name="SESSION.Addtl_Mowing_contract_price"  default="0">
<cfparam  name="SESSION.Day_Porter_contract_price"  default="0">
<cfparam  name="SESSION.Bush_Hog_contract_price"  default="0">
<cfparam  name="SESSION.Lot_Sweeping_contract_price"  default="0">
<cfparam  name="SESSION.Trail_Maint_contract_price"  default="0">
<cfparam  name="SESSION.Irrigation_TM_contract_price"  default="0">
<cfparam  name="SESSION.Irrigation_BFI_contract_price"  default="0">
<cfparam  name="SESSION.Natural_Area_contract_price"  default="0">
<cfparam  name="SESSION.Trash_Receptacle_contract_price"  default="0">
<cfparam  name="SESSION.Playground_mulch_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Nutsedge_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Fungicide_contract_price"  default="0">
<cfparam  name="SESSION.Turf_Insecticide_contract_price"  default="0">
<cfparam  name="SESSION.blank1_contract_price"  default="0">
<cfparam  name="SESSION.blank2_contract_price"  default="0">
<cfparam  name="SESSION.blank3_contract_price"  default="0">
<cfparam  name="SESSION.Contract_Adjustment"  default="0">
<cfparam  name="SESSION.discount_Adjustment"  default="0">
<cfparam  name="SESSION.ADJUSTED_CONTRACT_PRICE"  default="0">
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
lot_sweeping_gm = '#NumberFormat(SESSION.lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(SESSION.blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(SESSION.blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(SESSION.blank3_gm,"999999.99")#',
contract_adjustment ='#NumberFormat(contract_adjustment,"999999.99")#',
discount_adjustment ='#NumberFormat(discount_adjustment,"999999.99")#'
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
  <!---<CFSET spraying_qty_pre =  get_service_info.spraying_qty>
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
  <CFSET Annuals_F_qty_pre =  get_service_info.Annuals_F_qty>--->

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
lot_sweeping_gm = '#NumberFormat(lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(blank3_gm,"999999.99")#',
contract_adjustment ='#NumberFormat(contract_adjustment,"999999.99")#' ,
discount_adjustment  ='#NumberFormat(discount_adjustment,"999999.99")#'
 WHERE opportunity_id = #url.id#
</cfquery>
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
<cfset SESSION.overtime_adjustment_rate = 1.10>
<cfset SESSION.gross_margin = get_service_info.gross_margin>
<cfset SESSION.gross_margin_diff = (100-SESSION.gross_margin)/100>
<cfset SESSION.CONTRACT_ADJUSTMENT = get_service_info.CONTRACT_ADJUSTMENT>
<cfset SESSION.discount_adjustment = get_service_info.discount_adjustment>

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
<cfset SESSION.walk_behind_total_hours = SESSION.walk_behind_hoursA*SESSION.walk_behind_times>

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
<cfset SESSION.ride_mow_total_hours = SESSION.ride_mow_hoursA*SESSION.ride_mow_times>
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
<cfset SESSION.hard_edge_total_hours = SESSION.hard_edge_hoursA*SESSION.hard_edge_times>

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
<cfset SESSION.bed_edge_total_hours = SESSION.bed_edge_hoursA*SESSION.bed_edge_times>

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
<cfset SESSION.TRIM_O_total_hours = SESSION.TRIM_O_hoursA*SESSION.TRIM_O_times>

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
<cfset SESSION.TRIM_S_total_hours = SESSION.TRIM_S_hoursA*SESSION.TRIM_S_times>
 
<!------------------------------------------------------------------------------------------------------------->
<!---  <cfset SESSION.spraying_service_rate = 11.50>    --->
<cfset SESSION.spraying_qty  = get_service_info.spraying_qty >
<cfset SESSION.spraying_cost  = get_service_info.spraying_cost>
<cfset SESSION.spraying_rate = get_service_info.spraying_rate>
<cfset SESSION.spraying_hours  = SESSION.spraying_qty/SESSION.spraying_rate>
<cfset SESSION.spraying_hoursA = #NumberFormat(SESSION.spraying_hours,"999,999.9")#>
<cfset SESSION.spraying_actualprice  = SESSION.spraying_hours*SESSION.spraying_cost>
<cfset SESSION.spraying_materials_rate  = SESSION.spraying_materials_rate>


<cfif  IsDefined("form.spraying_qty")>
  <CFSET spraying_qty_post  =form.spraying_qty>
</cfif>
<cfset SESSION.spraying_materials_qty=(get_service_info.spraying_qty /333)>
<!---<cfset SESSION.spraying_materials_qty_actual=#NumberFormat(SESSION.spraying_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.spraying_materials_qty")    AND  get_materials_info.spraying_materials_qty  EQ SESSION.spraying_materials_qty_actual  AND SESSION.spraying_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.spraying_materials_qty=(get_service_info.spraying_qty /333)>
  <cfelseif   IsDefined("form.spraying_materials_qty")    AND get_materials_info.spraying_materials_qty  EQ form.spraying_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")   <!---AND  form.spraying_materials_qty NEQ 0 --->  AND   IsDefined("spraying_qty_pre")   AND   IsDefined("spraying_qty_post") AND spraying_qty_pre NEQ  spraying_qty_post>
  <cfset SESSION.spraying_materials_qty=(get_service_info.spraying_qty /333)>
  <cfelseif  IsDefined("form.spraying_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.spraying_materials_qty=(form.SPRAYING_MATERIALS_QTY)>
  <cfelseif   NOT IsDefined("form.spraying_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
  <cfelse>
  <cfset SESSION.spraying_materials_qty=(get_materials_info.spraying_materials_qty)>
</cfif>--->

<cfset SESSION.spraying_materials_qty = #NumberFormat(SESSION.spraying_materials_qty,"999999.99")#>

<cfset SESSION.spraying_materials_rate = 0.08>
<cfset SESSION.spraying_materials_actualprice = SESSION.spraying_materials_rate*SESSION.spraying_materials_qty>
<cfset SESSION.spraying_materials_actualprice = #NumberFormat(SESSION.spraying_materials_actualprice,"999999.99")#>
<cfset SESSION.spraying_service_materials  = SESSION.spraying_actualprice+SESSION.spraying_materials_actualprice >
<cfset SESSION.spraying_times  = get_service_info.spraying_times>
<cfset SESSION.spraying_total_hours = SESSION.spraying_hoursA*SESSION.spraying_times>

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
<cfset SESSION.weeding_total_hours = SESSION.weeding_hoursA*SESSION.weeding_times>

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
<cfset SESSION.blowing_total_hours = SESSION.blowing_hoursA*SESSION.blowing_times>

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
<cfset SESSION.Trash_S_total_hours = SESSION.Trash_S_hoursA*SESSION.Trash_S_times>

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
<cfset SESSION.traveltime_total_hours = SESSION.traveltime_hoursA*SESSION.traveltime_times>

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
<cfset SESSION.Trash_O_total_hours = SESSION.Trash_O_hoursA*SESSION.Trash_O_times>

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
<cfset SESSION.leafrem_total_hours = SESSION.leafrem_hoursA*SESSION.leafrem_times>

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
<cfset SESSION.cleanup_total_hours = SESSION.cleanup_hoursA*SESSION.cleanup_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_preg_service_rate = 20.50>  --->
<cfset SESSION.turf_preg_qty  = get_service_info.turf_preg_qty >
<cfset SESSION.turf_preg_cost  = get_service_info.turf_preg_cost>
<cfset SESSION.turf_preg_rate = get_service_info.turf_preg_rate>
<cfset SESSION.turf_preg_hours  = SESSION.turf_preg_qty/SESSION.turf_preg_rate>
<cfset SESSION.turf_preg_hoursA = #NumberFormat(SESSION.turf_preg_hours,"999,999.9")#>
<cfset SESSION.turf_preg_actualprice  = SESSION.turf_preg_hours*SESSION.turf_preg_cost>
<cfset SESSION.turf_preg_materials_rate  = SESSION.turf_preg_materials_rate>
<cfif  IsDefined("form.turf_preg_qty")>
  <CFSET turf_preg_qty_post  =form.turf_preg_qty>
</cfif>
<cfset SESSION.turf_preg_materials_qty=(get_service_info.turf_preg_qty /200)>
<!---<cfset SESSION.turf_preg_materials_qty_actual=#NumberFormat(SESSION.turf_preg_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_preg_materials_qty")    AND  get_materials_info.turf_preg_materials_qty  EQ SESSION.turf_preg_materials_qty_actual  AND SESSION.turf_preg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_preg_materials_qty=(get_service_info.turf_preg_qty /200)>
  <cfelseif   IsDefined("form.turf_preg_materials_qty")    AND get_materials_info.turf_preg_materials_qty  EQ form.turf_preg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")       AND   IsDefined("turf_preg_qty_pre")   AND   IsDefined("turf_preg_qty_post") AND turf_preg_qty_pre NEQ  turf_preg_qty_post>
  <cfset SESSION.turf_preg_materials_qty=(get_service_info.turf_preg_qty /200)>
  <cfelseif  IsDefined("form.turf_preg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_preg_materials_qty=(form.turf_preg_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_preg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_preg_materials_qty=(get_materials_info.turf_preg_materials_qty)>
</cfif>--->
<cfset SESSION.turf_preg_materials_qty = #NumberFormat(SESSION.turf_preg_materials_qty,"999999.99")#>
<cfset SESSION.turf_preg_materials_actualprice = SESSION.turf_preg_materials_rate*SESSION.turf_preg_materials_qty>
<cfset SESSION.turf_preg_materials_actualprice = #NumberFormat(SESSION.turf_preg_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_preg_service_materials  = SESSION.turf_preg_actualprice+SESSION.turf_preg_materials_actualprice >
<cfset SESSION.turf_preg_times  = get_service_info.turf_preg_times>
<cfset SESSION.turf_preg_total_hours = SESSION.turf_preg_hoursA*SESSION.turf_preg_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_prel_service_rate = 20.50>  --->
<cfset SESSION.turf_prel_qty  = get_service_info.turf_prel_qty >
<cfset SESSION.turf_prel_cost  = get_service_info.turf_prel_cost>
<cfset SESSION.turf_prel_rate = get_service_info.turf_prel_rate>
<cfset SESSION.turf_prel_hours  = SESSION.turf_prel_qty/SESSION.turf_prel_rate>
<cfset SESSION.turf_prel_hoursA = #NumberFormat(SESSION.turf_prel_hours,"999,999.9")#>
<cfset SESSION.turf_prel_actualprice  = SESSION.turf_prel_hours*SESSION.turf_prel_cost>
<cfset SESSION.turf_prel_materials_rate  = SESSION.turf_prel_materials_rate>
<cfif  IsDefined("form.turf_prel_qty")>
  <CFSET turf_prel_qty_post  =form.turf_prel_qty>
</cfif>
<cfset SESSION.turf_prel_materials_qty=(get_service_info.turf_prel_qty /22000)>
<!---<cfset SESSION.turf_prel_materials_qty_actual=#NumberFormat(SESSION.turf_prel_materials_qty_actual,"999999.99")#>
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
</cfif>--->
<cfset SESSION.turf_prel_materials_qty = #NumberFormat(SESSION.turf_prel_materials_qty,"999999.99")#>
<cfset SESSION.turf_prel_materials_actualprice = SESSION.turf_prel_materials_rate*SESSION.turf_prel_materials_qty>
<cfset SESSION.turf_prel_materials_actualprice = #NumberFormat(SESSION.turf_prel_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_prel_service_materials  = SESSION.turf_prel_actualprice+SESSION.turf_prel_materials_actualprice >
<cfset SESSION.turf_prel_times  = get_service_info.turf_prel_times>
<cfset SESSION.turf_prel_total_hours = SESSION.turf_prel_hoursA*SESSION.turf_prel_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_post_service_rate = 20.50>  --->
<cfset SESSION.turf_post_qty  = get_service_info.turf_post_qty >
<cfset SESSION.turf_post_cost  = get_service_info.turf_post_cost>
<cfset SESSION.turf_post_rate = get_service_info.turf_post_rate>
<cfset SESSION.turf_post_hours  = SESSION.turf_post_qty/SESSION.turf_post_rate>
<cfset SESSION.turf_post_hoursA = #NumberFormat(SESSION.turf_post_hours,"999,999.9")#>
<cfset SESSION.turf_post_actualprice  = SESSION.turf_post_hours*SESSION.turf_post_cost>
<cfset SESSION.turf_post_materials_rate  = SESSION.turf_post_materials_rate>
<cfif  IsDefined("form.turf_post_qty")>
  <CFSET turf_post_qty_post  =form.turf_post_qty>
</cfif>
<cfset SESSION.turf_post_materials_qty=(get_service_info.turf_post_qty /1000)>
<!---<cfset SESSION.turf_post_materials_qty_actual=#NumberFormat(SESSION.turf_post_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_post_materials_qty")    AND  get_materials_info.turf_post_materials_qty  EQ SESSION.turf_post_materials_qty_actual  AND SESSION.turf_post_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_post_materials_qty=(get_service_info.turf_post_qty /1000)>
  <cfelseif   IsDefined("form.turf_post_materials_qty")    AND get_materials_info.turf_post_materials_qty  EQ form.turf_post_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")      AND   IsDefined("turf_post_qty_pre")   AND   IsDefined("turf_post_qty_post") AND turf_post_qty_pre NEQ  turf_post_qty_post>
  <cfset SESSION.turf_post_materials_qty=(get_service_info.turf_post_qty /1000)>
  <cfelseif  IsDefined("form.turf_post_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_post_materials_qty=(form.turf_post_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_post_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_post_materials_qty=(get_materials_info.turf_post_materials_qty)>
</cfif>--->
<cfset SESSION.turf_post_materials_qty = #NumberFormat(SESSION.turf_post_materials_qty,"999999.99")#>
<cfset SESSION.turf_post_materials_actualprice = SESSION.turf_post_materials_rate*SESSION.turf_post_materials_qty>
<cfset SESSION.turf_post_materials_actualprice = #NumberFormat(SESSION.turf_post_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_post_service_materials  = SESSION.turf_post_actualprice+SESSION.turf_post_materials_actualprice >
<cfset SESSION.turf_post_times  = get_service_info.turf_post_times>
<cfset SESSION.turf_post_total_hours = SESSION.turf_post_hoursA*SESSION.turf_post_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_fert_service_rate = 20.50>  --->
<cfset SESSION.turf_fert_qty  = get_service_info.turf_fert_qty >
<cfset SESSION.turf_fert_cost  = get_service_info.turf_fert_cost>
<cfset SESSION.turf_fert_rate = get_service_info.turf_fert_rate>
<cfset SESSION.turf_fert_hours  = SESSION.turf_fert_qty/SESSION.turf_fert_rate>
<cfset SESSION.turf_fert_hoursA = #NumberFormat(SESSION.turf_fert_hours,"999,999.9")#>
<cfset SESSION.turf_fert_actualprice  = SESSION.turf_fert_hours*SESSION.turf_fert_cost>
<cfset SESSION.turf_fert_materials_rate  = SESSION.turf_fert_materials_rate>
<cfif  IsDefined("form.turf_fert_qty")>
  <CFSET turf_fert_qty_post  =form.turf_fert_qty>
</cfif>
<cfset SESSION.turf_fert_materials_qty=(get_service_info.turf_fert_qty /200)>
<!---<cfset SESSION.turf_fert_materials_qty_actual=#NumberFormat(SESSION.turf_fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_fert_materials_qty")    AND  get_materials_info.turf_fert_materials_qty  EQ SESSION.turf_fert_materials_qty_actual  AND SESSION.turf_fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_fert_materials_qty=(get_service_info.turf_fert_qty /200)>
  <cfelseif   IsDefined("form.turf_fert_materials_qty")    AND get_materials_info.turf_fert_materials_qty  EQ form.turf_fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("turf_fert_qty_pre")   AND   IsDefined("turf_fert_qty_post") AND turf_fert_qty_pre NEQ  turf_fert_qty_post>
  <cfset SESSION.turf_fert_materials_qty=(get_service_info.turf_fert_qty /200)>
  <cfelseif  IsDefined("form.turf_fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_fert_materials_qty=(form.turf_fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_fert_materials_qty=(get_materials_info.turf_fert_materials_qty)>
</cfif>--->
<cfset SESSION.turf_fert_materials_qty = #NumberFormat(SESSION.turf_fert_materials_qty,"999999.99")#>
<cfset SESSION.turf_fert_materials_actualprice = SESSION.turf_fert_materials_rate*SESSION.turf_fert_materials_qty>
<cfset SESSION.turf_fert_materials_actualprice = #NumberFormat(SESSION.turf_fert_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_fert_service_materials  = SESSION.turf_fert_actualprice+SESSION.turf_fert_materials_actualprice >
<cfset SESSION.turf_fert_times  = get_service_info.turf_fert_times>
<cfset SESSION.turf_fert_total_hours = SESSION.turf_fert_hoursA*SESSION.turf_fert_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.turf_lime_service_rate = 20.50>  --->
<cfset SESSION.turf_lime_qty  = get_service_info.turf_lime_qty >
<cfset SESSION.turf_lime_cost  = get_service_info.turf_lime_cost>
<cfset SESSION.turf_lime_rate = get_service_info.turf_lime_rate>
<cfset SESSION.turf_lime_hours  = SESSION.turf_lime_qty/SESSION.turf_lime_rate>
<cfset SESSION.turf_lime_hoursA = #NumberFormat(SESSION.turf_lime_hours,"999,999.9")#>
<cfset SESSION.turf_lime_actualprice  = SESSION.turf_lime_hours*SESSION.turf_lime_cost>
<cfset SESSION.turf_lime_materials_rate  = SESSION.turf_lime_materials_rate>
<cfif  IsDefined("form.turf_lime_qty")>
  <CFSET turf_lime_qty_post  =form.turf_lime_qty>
</cfif>
<cfset SESSION.turf_lime_materials_qty=(get_service_info.turf_lime_qty /200)>
<!---<cfset SESSION.turf_lime_materials_qty_actual=#NumberFormat(SESSION.turf_lime_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.turf_lime_materials_qty")    AND  get_materials_info.turf_lime_materials_qty  EQ SESSION.turf_lime_materials_qty_actual  AND SESSION.turf_lime_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_lime_materials_qty=(get_service_info.turf_lime_qty /200)>
  <cfelseif   IsDefined("form.turf_lime_materials_qty")    AND get_materials_info.turf_lime_materials_qty  EQ form.turf_lime_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")     AND   IsDefined("turf_lime_qty_pre")   AND   IsDefined("turf_lime_qty_post") AND turf_lime_qty_pre NEQ  turf_lime_qty_post>
  <cfset SESSION.turf_lime_materials_qty=(get_service_info.turf_lime_qty /200)>
  <cfelseif  IsDefined("form.turf_lime_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.turf_lime_materials_qty=(form.turf_lime_materials_qty)>
  <cfelseif   NOT IsDefined("form.turf_lime_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
  <cfelse>
  <cfset SESSION.turf_lime_materials_qty=(get_materials_info.turf_lime_materials_qty)>
</cfif>--->
<cfset SESSION.turf_lime_materials_qty = #NumberFormat(SESSION.turf_lime_materials_qty,"999999.99")#>
<cfset SESSION.turf_lime_materials_actualprice = SESSION.turf_lime_materials_rate*SESSION.turf_lime_materials_qty>
<cfset SESSION.turf_lime_materials_actualprice = #NumberFormat(SESSION.turf_lime_materials_actualprice,"999999.99")#>
<cfset SESSION.turf_lime_service_materials  = SESSION.turf_lime_actualprice+SESSION.turf_lime_materials_actualprice >
<cfset SESSION.turf_lime_times  = get_service_info.turf_lime_times>
<cfset SESSION.turf_lime_total_hours = SESSION.turf_lime_hoursA*SESSION.turf_lime_times>

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
<cfset SESSION.Turf_Aer_H_total_hours = SESSION.Turf_Aer_H_hoursA*SESSION.Turf_Aer_H_times>

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
<cfset SESSION.Turf_Aer_T_total_hours = SESSION.Turf_Aer_T_hoursA*SESSION.Turf_Aer_T_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Seed_service_rate = 20.50>  --->
<cfset SESSION.Turf_Seed_qty  = get_service_info.Turf_Seed_qty >
<cfset SESSION.Turf_Seed_cost  = get_service_info.Turf_Seed_cost>
<cfset SESSION.Turf_Seed_rate = get_service_info.Turf_Seed_rate>
<cfset SESSION.Turf_Seed_hours  = SESSION.Turf_Seed_qty/SESSION.Turf_Seed_rate>
<cfset SESSION.Turf_Seed_hoursA = #NumberFormat(SESSION.Turf_Seed_hours,"999999.9")#>
<cfset SESSION.Turf_Seed_actualprice  = SESSION.Turf_Seed_hours*SESSION.Turf_Seed_cost>
<cfset SESSION.Turf_Seed_materials_rate  = SESSION.Turf_Seed_materials_rate>
<cfif  IsDefined("form.turf_seed_qty")>
  <CFSET turf_seed_qty_post  =form.turf_seed_qty>
</cfif>
<cfset SESSION.turf_seed_materials_qty=(get_service_info.turf_seed_qty /250)>
<!---<cfset SESSION.turf_seed_materials_qty_actual=#NumberFormat(SESSION.turf_seed_materials_qty_actual,"999999.99")#>
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
</cfif>--->
<cfset SESSION.turf_seed_materials_qty = #NumberFormat(SESSION.turf_seed_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Seed_materials_actualprice = SESSION.Turf_Seed_materials_rate*SESSION.Turf_Seed_materials_qty>
<cfset SESSION.Turf_Seed_materials_actualprice = #NumberFormat(SESSION.Turf_Seed_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Seed_service_materials  = SESSION.Turf_Seed_actualprice+SESSION.Turf_Seed_materials_actualprice >
<cfset SESSION.Turf_Seed_times  = get_service_info.Turf_Seed_times>
<cfset SESSION.Turf_Seed_total_hours = SESSION.Turf_Seed_hoursA*SESSION.Turf_Seed_times>

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
<cfset SESSION.Pruning_TP_total_hours = SESSION.Pruning_TP_hoursA*SESSION.Pruning_TP_times>

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
<cfset SESSION.Pruning_S_total_hours = SESSION.Pruning_S_hoursA*SESSION.Pruning_S_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_Fert_service_rate = 20.50>  --->
<cfset SESSION.TS_Fert_qty  = get_service_info.TS_Fert_qty >
<cfset SESSION.TS_Fert_cost  = get_service_info.TS_Fert_cost>
<cfset SESSION.TS_Fert_rate = get_service_info.TS_Fert_rate>
<cfset SESSION.TS_Fert_hours  = SESSION.TS_Fert_qty/SESSION.TS_Fert_rate>
<cfset SESSION.TS_Fert_hoursA = #NumberFormat(SESSION.TS_Fert_hours,"999999.9")#>
<cfset SESSION.TS_Fert_actualprice  = SESSION.TS_Fert_hours*SESSION.TS_Fert_cost>
<cfset SESSION.TS_Fert_materials_rate  = SESSION.TS_Fert_materials_rate>
<cfif  IsDefined("form.TS_Fert_qty")>
  <CFSET TS_Fert_qty_post  =form.TS_Fert_qty>
</cfif>
<cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /200)>
<!---<cfset SESSION.TS_Fert_materials_qty_actual=#NumberFormat(SESSION.TS_Fert_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Fert_materials_qty")    AND  get_materials_info.TS_Fert_materials_qty  EQ SESSION.TS_Fert_materials_qty_actual  AND SESSION.TS_Fert_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /200)>
  <cfelseif   IsDefined("form.TS_Fert_materials_qty")    AND get_materials_info.TS_Fert_materials_qty  EQ form.TS_Fert_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Fert_qty_pre")   AND   IsDefined("TS_Fert_qty_post") AND TS_Fert_qty_pre NEQ  TS_Fert_qty_post>
  <cfset SESSION.TS_Fert_materials_qty=(get_service_info.TS_Fert_qty /200)>
  <cfelseif  IsDefined("form.TS_Fert_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Fert_materials_qty=(form.TS_Fert_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Fert_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_Fert_materials_qty=(get_materials_info.TS_Fert_materials_qty)>
</cfif>--->
<cfset SESSION.TS_Fert_materials_qty = #NumberFormat(SESSION.TS_Fert_materials_qty,"999999.99")#>
<cfset SESSION.TS_Fert_materials_actualprice = SESSION.TS_Fert_materials_rate*SESSION.TS_Fert_materials_qty>
<cfset SESSION.TS_Fert_materials_actualprice = #NumberFormat(SESSION.TS_Fert_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_Fert_service_materials  = SESSION.TS_Fert_actualprice+SESSION.TS_Fert_materials_actualprice >
<cfset SESSION.TS_Fert_times  = get_service_info.TS_Fert_times>
<cfset SESSION.TS_Fert_total_hours = SESSION.TS_Fert_hoursA*SESSION.TS_Fert_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_Insect_service_rate = 20.50>  --->
<cfset SESSION.TS_Insect_qty  = get_service_info.TS_Insect_qty >
<cfset SESSION.TS_Insect_cost  = get_service_info.TS_Insect_cost>
<cfset SESSION.TS_Insect_rate = get_service_info.TS_Insect_rate>
<cfset SESSION.TS_Insect_hours  = SESSION.TS_Insect_qty/SESSION.TS_Insect_rate>
<cfset SESSION.TS_Insect_hoursA = #NumberFormat(SESSION.TS_Insect_hours,"999999.9")#>
<cfset SESSION.TS_Insect_actualprice  = SESSION.TS_Insect_hours*SESSION.TS_Insect_cost>
<cfset SESSION.TS_Insect_materials_rate  = SESSION.TS_Insect_materials_rate>
<cfif  IsDefined("form.TS_Insect_qty")>
  <CFSET TS_Insect_qty_post  =form.TS_Insect_qty>
</cfif>
<cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty*20)>
<!---<cfset SESSION.TS_Insect_materials_qty_actual=#NumberFormat(SESSION.TS_Insect_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_Insect_materials_qty")    AND  get_materials_info.TS_Insect_materials_qty  EQ SESSION.TS_Insect_materials_qty_actual  AND SESSION.TS_Insect_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *20)>
  <cfelseif   IsDefined("form.TS_Insect_materials_qty")    AND get_materials_info.TS_Insect_materials_qty  EQ form.TS_Insect_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_Insect_qty_pre")   AND   IsDefined("TS_Insect_qty_post") AND TS_Insect_qty_pre NEQ  TS_Insect_qty_post>
  <cfset SESSION.TS_Insect_materials_qty=(get_service_info.TS_Insect_qty *20)>
  <cfelseif  IsDefined("form.TS_Insect_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_Insect_materials_qty=(form.TS_Insect_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_Insect_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_Insect_materials_qty=(get_materials_info.TS_Insect_materials_qty)>
</cfif>--->
<cfset SESSION.TS_Insect_materials_qty = #NumberFormat(SESSION.TS_Insect_materials_qty,"999999.99")#>
<cfset SESSION.TS_Insect_materials_actualprice = SESSION.TS_Insect_materials_rate*SESSION.TS_Insect_materials_qty>
<cfset SESSION.TS_Insect_materials_actualprice = #NumberFormat(SESSION.TS_Insect_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_Insect_service_materials  = SESSION.TS_Insect_actualprice+SESSION.TS_Insect_materials_actualprice >
<cfset SESSION.TS_Insect_times  = get_service_info.TS_Insect_times>
<cfset SESSION.TS_Insect_total_hours = SESSION.TS_Insect_hoursA*SESSION.TS_Insect_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_pre_service_rate = 20.50>  --->
<cfset SESSION.Mulch_pre_qty  = get_service_info.Mulch_pre_qty >
<cfset SESSION.Mulch_pre_cost  = get_service_info.Mulch_pre_cost>
<cfset SESSION.Mulch_pre_rate = get_service_info.Mulch_pre_rate>
<cfset SESSION.Mulch_pre_hours  = SESSION.Mulch_pre_qty/SESSION.Mulch_pre_rate>
<cfset SESSION.Mulch_pre_hoursA = #NumberFormat(SESSION.Mulch_pre_hours,"999999.9")#>
<cfset SESSION.Mulch_pre_actualprice  = SESSION.Mulch_pre_hours*SESSION.Mulch_pre_cost>
<cfset SESSION.Mulch_pre_materials_rate  = SESSION.Mulch_pre_materials_rate>
<cfif  IsDefined("form.Mulch_pre_qty")>
  <CFSET Mulch_pre_qty_post  =form.Mulch_pre_qty>
</cfif>
<cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /200)>
<!---<cfset SESSION.Mulch_pre_materials_qty_actual=#NumberFormat(SESSION.Mulch_pre_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Mulch_pre_materials_qty")    AND  get_materials_info.Mulch_pre_materials_qty  EQ SESSION.Mulch_pre_materials_qty_actual  AND SESSION.Mulch_pre_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /200)>
  <cfelseif   IsDefined("form.Mulch_pre_materials_qty")    AND get_materials_info.Mulch_pre_materials_qty  EQ form.Mulch_pre_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Mulch_pre_qty_pre")   AND   IsDefined("Mulch_pre_qty_post") AND Mulch_pre_qty_pre NEQ  Mulch_pre_qty_post>
  <cfset SESSION.Mulch_pre_materials_qty=(get_service_info.Mulch_pre_qty /200)>
  <cfelseif  IsDefined("form.Mulch_pre_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Mulch_pre_materials_qty=(form.Mulch_pre_materials_qty)>
  <cfelseif   NOT IsDefined("form.Mulch_pre_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
  <cfelse>
  <cfset SESSION.Mulch_pre_materials_qty=(get_materials_info.Mulch_pre_materials_qty)>
</cfif>--->
<cfset SESSION.Mulch_pre_materials_qty = #NumberFormat(SESSION.Mulch_pre_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_pre_materials_actualprice = SESSION.Mulch_pre_materials_rate*SESSION.Mulch_pre_materials_qty>
<cfset SESSION.Mulch_pre_materials_actualprice = #NumberFormat(SESSION.Mulch_pre_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_pre_service_materials  = SESSION.Mulch_pre_actualprice+SESSION.Mulch_pre_materials_actualprice >
<cfset SESSION.Mulch_pre_times  = get_service_info.Mulch_pre_times>
<cfset SESSION.Mulch_pre_total_hours = SESSION.Mulch_pre_hoursA*SESSION.Mulch_pre_times>

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
<cfset SESSION.Mulch_edging_total_hours = SESSION.Mulch_edging_hoursA*SESSION.Mulch_edging_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.mulch_s_dyed_service_rate = 20.50>  --->
<cfset SESSION.mulch_s_dyed_qty  = get_service_info.mulch_s_dyed_qty >
<cfset SESSION.mulch_s_dyed_cost  = get_service_info.mulch_s_dyed_cost>
<cfset SESSION.mulch_s_dyed_rate = get_service_info.mulch_s_dyed_rate>
<cfset SESSION.mulch_s_dyed_hours  = SESSION.mulch_s_dyed_qty/SESSION.mulch_s_dyed_rate>
<cfset SESSION.mulch_s_dyed_hoursA = #NumberFormat(SESSION.mulch_s_dyed_hours,"999999.9")#>
<cfset SESSION.mulch_s_dyed_actualprice  = SESSION.mulch_s_dyed_hours*SESSION.mulch_s_dyed_cost>
<cfset SESSION.mulch_s_dyed_materials_rate  = SESSION.mulch_s_dyed_materials_rate>
<cfif  IsDefined("form.mulch_s_dyed_qty")>
  <CFSET mulch_s_dyed_qty_post  =form.mulch_s_dyed_qty>
</cfif>
<cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /130)>
<!---<cfset SESSION.mulch_s_dyed_materials_qty_actual=#NumberFormat(SESSION.mulch_s_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_dyed_materials_qty")    AND  get_materials_info.mulch_s_dyed_materials_qty  EQ SESSION.mulch_s_dyed_materials_qty_actual  AND SESSION.mulch_s_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /130)>
  <cfelseif   IsDefined("form.mulch_s_dyed_materials_qty")    AND get_materials_info.mulch_s_dyed_materials_qty  EQ form.mulch_s_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_dyed_qty_pre")   AND   IsDefined("mulch_s_dyed_qty_post") AND mulch_s_dyed_qty_pre NEQ  mulch_s_dyed_qty_post>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_service_info.mulch_s_dyed_qty /130)>
  <cfelseif  IsDefined("form.mulch_s_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_dyed_materials_qty=(form.mulch_s_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_s_dyed_materials_qty=(get_materials_info.mulch_s_dyed_materials_qty)>
</cfif>--->
<cfset SESSION.mulch_s_dyed_materials_qty = #NumberFormat(SESSION.mulch_s_dyed_materials_qty,"999999.9")#>
<cfset SESSION.mulch_s_dyed_materials_actualprice = SESSION.mulch_s_dyed_materials_rate*SESSION.mulch_s_dyed_materials_qty>
<cfset SESSION.mulch_s_dyed_materials_actualprice = #NumberFormat(SESSION.mulch_s_dyed_materials_actualprice,"999999.99")#>
<cfset SESSION.mulch_s_dyed_service_materials  = SESSION.mulch_s_dyed_actualprice+SESSION.mulch_s_dyed_materials_actualprice >
<cfset SESSION.mulch_s_dyed_times  = get_service_info.mulch_s_dyed_times>
<cfset SESSION.mulch_s_dyed_total_hours = SESSION.mulch_s_dyed_hoursA*SESSION.mulch_s_dyed_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.mulch_f_dyed_service_rate = 20.50>  --->
<cfset SESSION.mulch_f_dyed_qty  = get_service_info.mulch_f_dyed_qty >
<cfset SESSION.mulch_f_dyed_cost  = get_service_info.mulch_f_dyed_cost>
<cfset SESSION.mulch_f_dyed_rate = get_service_info.mulch_f_dyed_rate>
<cfset SESSION.mulch_f_dyed_hours  = SESSION.mulch_f_dyed_qty/SESSION.mulch_f_dyed_rate>
<cfset SESSION.mulch_f_dyed_hoursA = #NumberFormat(SESSION.mulch_f_dyed_hours,"999999.9")#>
<cfset SESSION.mulch_f_dyed_actualprice  = SESSION.mulch_f_dyed_hours*SESSION.mulch_f_dyed_cost>
<cfset SESSION.mulch_f_dyed_materials_rate  = SESSION.mulch_f_dyed_materials_rate>
<cfif  IsDefined("form.mulch_f_dyed_qty")>
  <CFSET mulch_f_dyed_qty_post  =form.mulch_f_dyed_qty>
</cfif>
<cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /130)>
<!---<cfset SESSION.mulch_f_dyed_materials_qty_actual=#NumberFormat(SESSION.mulch_f_dyed_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_dyed_materials_qty")    AND  get_materials_info.mulch_f_dyed_materials_qty  EQ SESSION.mulch_f_dyed_materials_qty_actual  AND SESSION.mulch_f_dyed_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /130)>
  <cfelseif   IsDefined("form.mulch_f_dyed_materials_qty")    AND get_materials_info.mulch_f_dyed_materials_qty  EQ form.mulch_f_dyed_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_dyed_qty_pre")   AND   IsDefined("mulch_f_dyed_qty_post") AND mulch_f_dyed_qty_pre NEQ  mulch_f_dyed_qty_post>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_service_info.mulch_f_dyed_qty /130)>
  <cfelseif  IsDefined("form.mulch_f_dyed_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_dyed_materials_qty=(form.mulch_f_dyed_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_dyed_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_f_dyed_materials_qty=(get_materials_info.mulch_f_dyed_materials_qty)>
</cfif>--->
<cfset SESSION.mulch_f_dyed_materials_qty = #NumberFormat(SESSION.mulch_f_dyed_materials_qty,"999999.9")#>
<cfset SESSION.mulch_f_dyed_materials_actualprice = SESSION.mulch_f_dyed_materials_rate*SESSION.mulch_f_dyed_materials_qty>
<cfset SESSION.mulch_f_dyed_materials_actualprice = #NumberFormat(SESSION.mulch_f_dyed_materials_actualprice,"999999.99")#>
<cfset SESSION.mulch_f_dyed_service_materials  = SESSION.mulch_f_dyed_actualprice+SESSION.mulch_f_dyed_materials_actualprice >
<cfset SESSION.mulch_f_dyed_times  = get_service_info.mulch_f_dyed_times>
<cfset SESSION.mulch_f_dyed_total_hours = SESSION.mulch_f_dyed_hoursA*SESSION.mulch_f_dyed_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Annuals_S_service_rate = 20.50>  --->
<cfset SESSION.Annuals_S_qty  = get_service_info.Annuals_S_qty >
<cfset SESSION.Annuals_S_cost  = get_service_info.Annuals_S_cost>
<cfset SESSION.Annuals_S_rate = get_service_info.Annuals_S_rate>
<cfset SESSION.Annuals_S_hours  = SESSION.Annuals_S_qty/SESSION.Annuals_S_rate>
<cfset SESSION.Annuals_S_hoursA = #NumberFormat(SESSION.Annuals_S_hours,"999,999.9")#>
<cfset SESSION.Annuals_S_actualprice  = SESSION.Annuals_S_hours*SESSION.Annuals_S_cost>
<cfset SESSION.Annuals_S_actualprice  = 0>
<cfset SESSION.Annuals_S_materials_rate  = SESSION.Annuals_S_materials_rate>
<cfset SESSION.Annuals_S_materials_qty = get_materials_info.Annuals_S_materials_qty>
<cfset SESSION.Annuals_S_materials_qty=(get_service_info.Annuals_S_qty /1)>
<cfset SESSION.Annuals_S_materials_qty = #NumberFormat(SESSION.Annuals_S_materials_qty,"999999.9")#>
<cfset SESSION.Annuals_S_materials_actualprice = SESSION.Annuals_S_materials_rate*SESSION.Annuals_S_materials_qty>
<cfset SESSION.Annuals_S_materials_actualprice = #NumberFormat(SESSION.Annuals_S_materials_actualprice,"999999.99")#>
<cfset SESSION.Annuals_S_service_materials  = SESSION.Annuals_S_actualprice+SESSION.Annuals_S_materials_actualprice >
<cfset SESSION.Annuals_S_times  = get_service_info.Annuals_S_times>
<cfset SESSION.Annuals_S_total_hours = SESSION.Annuals_S_hoursA*SESSION.Annuals_S_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Annuals_F_service_rate = 20.50>  --->
<cfset SESSION.Annuals_F_qty  = get_service_info.Annuals_F_qty >
<cfset SESSION.Annuals_F_cost  = get_service_info.Annuals_F_cost>
<cfset SESSION.Annuals_F_rate = get_service_info.Annuals_F_rate>
<cfset SESSION.Annuals_F_hours  = SESSION.Annuals_F_qty/SESSION.Annuals_F_rate>
<cfset SESSION.Annuals_F_hoursA = #NumberFormat(SESSION.Annuals_F_hours,"999999.9")#>
<cfset SESSION.Annuals_F_actualprice  = SESSION.Annuals_F_hours*SESSION.Annuals_F_cost>
<cfset SESSION.Annuals_F_actualprice  = 0>
<cfset SESSION.Annuals_F_materials_rate  = SESSION.Annuals_F_materials_rate>
<!--- <cfset SESSION.Annuals_F_materials_qty = get_materials_info.Annuals_F_materials_qty> --->
<cfset SESSION.Annuals_F_materials_qty=(get_service_info.Annuals_F_qty /1)>
<cfset SESSION.Annuals_F_materials_qty = #NumberFormat(SESSION.Annuals_F_materials_qty,"999999.9")#>
<cfset SESSION.Annuals_F_materials_actualprice = SESSION.Annuals_F_materials_rate*SESSION.Annuals_F_materials_qty>
<cfset SESSION.Annuals_F_service_materials  = SESSION.Annuals_F_actualprice+SESSION.Annuals_F_materials_actualprice >
<cfset SESSION.Annuals_F_times  = get_service_info.Annuals_F_times>
<cfset SESSION.Annuals_F_total_hours = SESSION.Annuals_F_hoursA*SESSION.Annuals_F_times>

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
<cfset SESSION.Irrigation_SU_total_hours = SESSION.Irrigation_SU_hoursA*SESSION.Irrigation_SU_times>

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

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_F_Reg_service_rate = 20.50>  --->
<cfset SESSION.Mulch_F_Reg_qty  = get_service_info.Mulch_F_Reg_qty >
<cfset SESSION.Mulch_F_Reg_cost  = get_service_info.Mulch_F_Reg_cost>
<cfset SESSION.Mulch_F_Reg_rate = get_service_info.Mulch_F_Reg_rate>
<cfset SESSION.Mulch_F_Reg_hours  = SESSION.Mulch_F_Reg_qty/SESSION.Mulch_F_Reg_rate>
<cfset SESSION.Mulch_F_Reg_hoursA = #NumberFormat(SESSION.Mulch_F_Reg_hours,"999,999.9")#>
<cfset SESSION.Mulch_F_Reg_actualprice  = SESSION.Mulch_F_Reg_hours*SESSION.Mulch_F_Reg_cost>
<cfset SESSION.Mulch_F_Reg_materials_rate  = SESSION.Mulch_F_Reg_materials_rate>
<cfif  IsDefined("form.mulch_f_reg_qty")>
  <CFSET mulch_f_reg_qty_post  =form.mulch_f_reg_qty>
</cfif>
<cfset SESSION.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /130)>
<!---<cfset SESSION.mulch_f_reg_materials_qty_actual=#NumberFormat(SESSION.mulch_f_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_f_reg_materials_qty")    AND  get_materials_info.mulch_f_reg_materials_qty  EQ SESSION.mulch_f_reg_materials_qty_actual  AND SESSION.mulch_f_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /130)>
  <cfelseif   IsDefined("form.mulch_f_reg_materials_qty")    AND get_materials_info.mulch_f_reg_materials_qty  EQ form.mulch_f_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_f_reg_qty_pre")   AND   IsDefined("mulch_f_reg_qty_post") AND mulch_f_reg_qty_pre NEQ  mulch_f_reg_qty_post>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_service_info.mulch_f_reg_qty /130)>
  <cfelseif  IsDefined("form.mulch_f_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_f_reg_materials_qty=(form.mulch_f_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_f_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_f_reg_materials_qty=(get_materials_info.mulch_f_reg_materials_qty)>
</cfif>--->
<cfset SESSION.mulch_f_reg_materials_qty = #NumberFormat(SESSION.mulch_f_reg_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_F_Reg_materials_actualprice = SESSION.Mulch_F_Reg_materials_rate*SESSION.Mulch_F_Reg_materials_qty>
<cfset SESSION.Mulch_F_Reg_materials_actualprice = #NumberFormat(SESSION.Mulch_F_Reg_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_F_Reg_service_materials  = SESSION.Mulch_F_Reg_actualprice+SESSION.Mulch_F_Reg_materials_actualprice >
<cfset SESSION.Mulch_F_Reg_times  = get_service_info.Mulch_F_Reg_times>
<cfset SESSION.Mulch_F_Reg_total_hours = SESSION.Mulch_F_Reg_hoursA*SESSION.Mulch_F_Reg_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Mulch_S_Reg_service_rate = 20.50>  --->
<cfset SESSION.Mulch_S_Reg_qty  = get_service_info.Mulch_S_Reg_qty >
<cfset SESSION.Mulch_S_Reg_cost  = get_service_info.Mulch_S_Reg_cost>
<cfset SESSION.Mulch_S_Reg_rate = get_service_info.Mulch_S_Reg_rate>
<cfset SESSION.Mulch_S_Reg_hours  = SESSION.Mulch_S_Reg_qty/SESSION.Mulch_S_Reg_rate>
<cfset SESSION.Mulch_S_Reg_hoursA = #NumberFormat(SESSION.Mulch_S_Reg_hours,"999999.9")#>
<cfset SESSION.Mulch_S_Reg_actualprice  = SESSION.Mulch_S_Reg_hours*SESSION.Mulch_S_Reg_cost>
<cfset SESSION.Mulch_S_Reg_materials_rate  = SESSION.Mulch_S_Reg_materials_rate>
<cfif  IsDefined("form.mulch_s_reg_qty")>
  <CFSET mulch_s_reg_qty_post  =form.mulch_s_reg_qty>
</cfif>
<cfset SESSION.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /130)>
<!---<cfset SESSION.mulch_s_reg_materials_qty_actual=#NumberFormat(SESSION.mulch_s_reg_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.mulch_s_reg_materials_qty")    AND  get_materials_info.mulch_s_reg_materials_qty  EQ SESSION.mulch_s_reg_materials_qty_actual  AND SESSION.mulch_s_reg_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /130)>
  <cfelseif   IsDefined("form.mulch_s_reg_materials_qty")    AND get_materials_info.mulch_s_reg_materials_qty  EQ form.mulch_s_reg_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("mulch_s_reg_qty_pre")   AND   IsDefined("mulch_s_reg_qty_post") AND mulch_s_reg_qty_pre NEQ  mulch_s_reg_qty_post>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_service_info.mulch_s_reg_qty /130)>
  <cfelseif  IsDefined("form.mulch_s_reg_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.mulch_s_reg_materials_qty=(form.mulch_s_reg_materials_qty)>
  <cfelseif   NOT IsDefined("form.mulch_s_reg_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
  <cfelse>
  <cfset SESSION.mulch_s_reg_materials_qty=(get_materials_info.mulch_s_reg_materials_qty)>
</cfif>--->
<cfset SESSION.mulch_s_reg_materials_qty = #NumberFormat(SESSION.mulch_s_reg_materials_qty,"999999.9")#>
<cfset SESSION.Mulch_S_Reg_materials_actualprice = SESSION.Mulch_S_Reg_materials_rate*SESSION.Mulch_S_Reg_materials_qty>
<cfset SESSION.Mulch_S_Reg_materials_actualprice = #NumberFormat(SESSION.Mulch_S_Reg_materials_actualprice,"999999.99")#>
<cfset SESSION.Mulch_S_Reg_service_materials  = SESSION.Mulch_S_Reg_actualprice+SESSION.Mulch_S_Reg_materials_actualprice >
<cfset SESSION.Mulch_S_Reg_times  = get_service_info.Mulch_S_Reg_times>
<cfset SESSION.Mulch_S_Reg_total_hours = SESSION.Mulch_S_Reg_hoursA*SESSION.Mulch_S_Reg_times>

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
<cfset SESSION.Pond_Maint_total_hours = SESSION.Pond_Maint_hoursA*SESSION.Pond_Maint_times>

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
<cfset SESSION.Trim_Hillside_total_hours = SESSION.Trim_Hillside_hoursA*SESSION.Trim_Hillside_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Pine_Tags_service_rate = 20.50>  --->
<cfset SESSION.Pine_Tags_qty  = get_service_info.Pine_Tags_qty >
<cfset SESSION.Pine_Tags_cost  = get_service_info.Pine_Tags_cost>
<cfset SESSION.Pine_Tags_rate = get_service_info.Pine_Tags_rate>
<cfset SESSION.Pine_Tags_hours  = SESSION.Pine_Tags_qty/SESSION.Pine_Tags_rate>
<cfset SESSION.Pine_Tags_hoursA = #NumberFormat(SESSION.Pine_Tags_hours,"999999.9")#>
<cfset SESSION.Pine_Tags_actualprice  = SESSION.Pine_Tags_hours*SESSION.Pine_Tags_cost>
<cfset SESSION.Pine_Tags_materials_rate  = SESSION.Pine_Tags_materials_rate>
<!---  <cfset SESSION.Pine_Tags_materials_qty = get_materials_info.Pine_Tags_materials_qty> --->
<cfif  IsDefined("form.Pine_Tags_qty")>
  <CFSET Pine_Tags_qty_post  =form.Pine_Tags_qty>
</cfif>
<cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /50)>
<!---<cfset SESSION.Pine_Tags_materials_qty_actual=#NumberFormat(SESSION.Pine_Tags_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Pine_Tags_materials_qty")    AND  get_materials_info.Pine_Tags_materials_qty  EQ SESSION.Pine_Tags_materials_qty_actual  AND SESSION.Pine_Tags_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /50)>
  <cfelseif   IsDefined("form.Pine_Tags_materials_qty")    AND get_materials_info.Pine_Tags_materials_qty  EQ form.Pine_Tags_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Pine_Tags_qty_pre")   AND   IsDefined("Pine_Tags_qty_post") AND Pine_Tags_qty_pre NEQ  Pine_Tags_qty_post>
  <cfset SESSION.Pine_Tags_materials_qty=(get_service_info.Pine_Tags_qty /50)>
  <cfelseif  IsDefined("form.Pine_Tags_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Pine_Tags_materials_qty=(form.Pine_Tags_materials_qty)>
  <cfelseif   NOT IsDefined("form.Pine_Tags_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
  <cfelse>
  <cfset SESSION.Pine_Tags_materials_qty=(get_materials_info.Pine_Tags_materials_qty)>
</cfif>--->
<cfset SESSION.Pine_Tags_materials_qty = #NumberFormat(SESSION.Pine_Tags_materials_qty,"999999.9")#>
<cfset SESSION.Pine_Tags_materials_actualprice = SESSION.Pine_Tags_materials_rate*SESSION.Pine_Tags_materials_qty>
<cfset SESSION.Pine_Tags_materials_actualprice = #NumberFormat(SESSION.Pine_Tags_materials_actualprice,"999999.99")#>
<cfset SESSION.Pine_Tags_service_materials  = SESSION.Pine_Tags_actualprice+SESSION.Pine_Tags_materials_actualprice >
<cfset SESSION.Pine_Tags_times  = get_service_info.Pine_Tags_times>
<cfset SESSION.Pine_Tags_total_hours = SESSION.Pine_Tags_hoursA*SESSION.Pine_Tags_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.TS_hort_oil_service_rate = 20.50>  --->
<cfset SESSION.TS_hort_oil_qty  = get_service_info.TS_hort_oil_qty >
<cfset SESSION.TS_hort_oil_cost  = get_service_info.TS_hort_oil_cost>
<cfset SESSION.TS_hort_oil_rate = get_service_info.TS_hort_oil_rate>
<cfset SESSION.TS_hort_oil_hours  = SESSION.TS_hort_oil_qty/SESSION.TS_hort_oil_rate>
<cfset SESSION.TS_hort_oil_hoursA = #NumberFormat(SESSION.TS_hort_oil_hours,"999999.9")#>
<cfset SESSION.TS_hort_oil_actualprice  = SESSION.TS_hort_oil_hours*SESSION.TS_hort_oil_cost>
<cfset SESSION.TS_hort_oil_materials_rate  = SESSION.TS_hort_oil_materials_rate>
<cfif  IsDefined("form.TS_hort_oil_qty")>
  <CFSET TS_hort_oil_qty_post  =form.TS_hort_oil_qty>
</cfif>
<cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *30)>
<!---<cfset SESSION.TS_hort_oil_materials_qty_actual=#NumberFormat(SESSION.TS_hort_oil_materials_qty_actual,"999999.99")#>
<cfif  IsDefined("form.TS_hort_oil_materials_qty")    AND  get_materials_info.TS_hort_oil_materials_qty  EQ SESSION.TS_hort_oil_materials_qty_actual  AND SESSION.TS_hort_oil_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *30)>
  <cfelseif   IsDefined("form.TS_hort_oil_materials_qty")    AND get_materials_info.TS_hort_oil_materials_qty  EQ form.TS_hort_oil_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("TS_hort_oil_qty_pre")   AND   IsDefined("TS_hort_oil_qty_post") AND TS_hort_oil_qty_pre NEQ  TS_hort_oil_qty_post>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_service_info.TS_hort_oil_qty *30)>
  <cfelseif  IsDefined("form.TS_hort_oil_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.TS_hort_oil_materials_qty=(form.TS_hort_oil_materials_qty)>
  <cfelseif   NOT IsDefined("form.TS_hort_oil_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
  <cfelse>
  <cfset SESSION.TS_hort_oil_materials_qty=(get_materials_info.TS_hort_oil_materials_qty)>
</cfif>--->
<cfset SESSION.TS_hort_oil_materials_qty = #NumberFormat(SESSION.TS_hort_oil_materials_qty,"999999.99")#>
<cfset SESSION.TS_hort_oil_materials_actualprice = SESSION.TS_hort_oil_materials_rate*SESSION.TS_hort_oil_materials_qty>
<cfset SESSION.TS_hort_oil_materials_actualprice = #NumberFormat(SESSION.TS_hort_oil_materials_actualprice,"999999.99")#>
<cfset SESSION.TS_hort_oil_service_materials  = SESSION.TS_hort_oil_actualprice+SESSION.TS_hort_oil_materials_actualprice >
<cfset SESSION.TS_hort_oil_times  = get_service_info.TS_hort_oil_times>
<cfset SESSION.TS_hort_oil_total_hours = SESSION.TS_hort_oil_hoursA*SESSION.TS_hort_oil_times>

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
<cfset SESSION.Addtl_Mowing_total_hours = SESSION.Addtl_Mowing_hoursA*SESSION.Addtl_Mowing_times>

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
<cfset SESSION.Day_Porter_total_hours = SESSION.Day_Porter_hoursA*SESSION.Day_Porter_times>

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
<cfset SESSION.Bush_Hog_total_hours = SESSION.Bush_Hog_hoursA*SESSION.Bush_Hog_times>

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
<cfset SESSION.Lot_Sweeping_total_hours = SESSION.Lot_Sweeping_hoursA*SESSION.Lot_Sweeping_times>
<cfset SESSION.Lot_Sweeping_gm  = get_service_info.Lot_Sweeping_gm >
<cfset SESSION.gross_margin_diff_Lot_Sweeping = (100-SESSION.Lot_Sweeping_gm)/100>

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
<cfset SESSION.Trail_Maint_total_hours = SESSION.Trail_Maint_hoursA*SESSION.Trail_Maint_times>

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
<cfset SESSION.Natural_Area_total_hours = SESSION.Natural_Area_hoursA*SESSION.Natural_Area_times>

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
<cfset SESSION.Trash_Receptacle_total_hours = SESSION.Trash_Receptacle_hoursA*SESSION.Trash_Receptacle_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Playground_mulch_service_rate = 20.50>  --->
<cfset SESSION.Playground_mulch_qty  = get_service_info.Playground_mulch_qty >
<cfset SESSION.Playground_mulch_cost  = get_service_info.Playground_mulch_cost>
<cfset SESSION.Playground_mulch_rate = get_service_info.Playground_mulch_rate>
<cfset SESSION.Playground_mulch_hours  = SESSION.Playground_mulch_qty/SESSION.Playground_mulch_rate>
<cfset SESSION.Playground_mulch_hoursA = #NumberFormat(SESSION.Playground_mulch_hours,"999999.9")#>
<cfset SESSION.Playground_mulch_actualprice  = SESSION.Playground_mulch_hours*SESSION.Playground_mulch_cost>
<cfset SESSION.Playground_mulch_materials_rate  = SESSION.Playground_mulch_materials_rate>
<!---  <cfset SESSION.Playground_mulch_materials_qty = get_materials_info.Playground_mulch_materials_qty>  --->
<!---<cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty /162)>
<cfset SESSION.Playground_mulch_materials_qty = #NumberFormat(SESSION.Playground_mulch_materials_qty,"999999.9")#>--->
<cfif  IsDefined("form.Playground_mulch_qty")>
  <CFSET Playground_mulch_qty_post  =form.Playground_mulch_qty>
</cfif>
<cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty /130)>
<!---<cfset SESSION.Playground_mulch_materials_qty_actual=#NumberFormat(SESSION.Playground_mulch_materials_qty_actual,"999999.9")#>
<cfif  IsDefined("form.Playground_mulch_materials_qty")    AND  get_materials_info.Playground_mulch_materials_qty  EQ SESSION.Playground_mulch_materials_qty_actual  AND SESSION.Playground_mulch_materials_qty EQ 0  AND   NOT IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/130)>
  <cfelseif   IsDefined("form.Playground_mulch_materials_qty")    AND get_materials_info.Playground_mulch_materials_qty  EQ form.Playground_mulch_materials_qty  AND   NOT IsDefined("form.BTNSUMIT1")    AND   IsDefined("Playground_mulch_qty_pre")   AND   IsDefined("Playground_mulch_qty_post") AND Playground_mulch_qty_pre NEQ  Playground_mulch_qty_post>
  <cfset SESSION.Playground_mulch_materials_qty=(get_service_info.Playground_mulch_qty/130)>
  <cfelseif  IsDefined("form.Playground_mulch_materials_qty")  AND    IsDefined("form.BTNSUMIT1")>
  <cfset SESSION.Playground_mulch_materials_qty=(form.Playground_mulch_materials_qty)>
  <cfelseif   NOT IsDefined("form.Playground_mulch_materials_qty")  AND IsDefined("url.enter_materials_qty") >
  <cfset SESSION.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
  <cfelse>
  <cfset SESSION.Playground_mulch_materials_qty=(get_materials_info.Playground_mulch_materials_qty)>
</cfif>--->
<cfset SESSION.Playground_mulch_materials_qty = #NumberFormat(SESSION.Playground_mulch_materials_qty,"999999.9")#>
<cfset SESSION.Playground_mulch_materials_actualprice = SESSION.Playground_mulch_MATERIALS_rate*SESSION.Playground_mulch_materials_qty>
<cfset SESSION.Playground_mulch_materials_actualprice = #NumberFormat(SESSION.Playground_mulch_materials_actualprice,"999999.99")#>
<cfset SESSION.Playground_mulch_service_materials  = SESSION.Playground_mulch_actualprice+SESSION.Playground_mulch_materials_actualprice >
<cfset SESSION.Playground_mulch_times  = get_service_info.Playground_mulch_times>
<cfset SESSION.Playground_mulch_total_hours = SESSION.Playground_mulch_hoursA*SESSION.Playground_mulch_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Nutsedge_service_rate = 20.50>  --->
<cfset SESSION.Turf_Nutsedge_qty  = get_service_info.Turf_Nutsedge_qty >
<cfset SESSION.Turf_Nutsedge_cost  = get_service_info.Turf_Nutsedge_cost>
<cfset SESSION.Turf_Nutsedge_rate = get_service_info.Turf_Nutsedge_rate>
<cfset SESSION.Turf_Nutsedge_hours  = SESSION.Turf_Nutsedge_qty/SESSION.Turf_Nutsedge_rate>
<cfset SESSION.Turf_Nutsedge_hoursA = #NumberFormat(SESSION.Turf_Nutsedge_hours,"999999.9")#>
<cfset SESSION.Turf_Nutsedge_actualprice  = SESSION.Turf_Nutsedge_hours*SESSION.Turf_Nutsedge_cost>
<cfset SESSION.Turf_Nutsedge_materials_rate  = SESSION.Turf_Nutsedge_materials_rate>
<cfif  IsDefined("form.Turf_Nutsedge_qty")>
  <CFSET Turf_Nutsedge_qty_post  =form.Turf_Nutsedge_qty>
</cfif>
<cfset SESSION.Turf_Nutsedge_materials_qty=(get_service_info.Turf_Nutsedge_qty/22000)>
<!---<cfset SESSION.Turf_Nutsedge_materials_qty_actual=#NumberFormat(SESSION.Turf_Nutsedge_materials_qty_actual,"999999.99")#>
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
</cfif>--->
<cfset SESSION.Turf_Nutsedge_materials_qty = #NumberFormat(SESSION.Turf_Nutsedge_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Nutsedge_materials_actualprice = SESSION.Turf_Nutsedge_MATERIALS_rate*SESSION.Turf_Nutsedge_materials_qty>
<cfset SESSION.Turf_Nutsedge_materials_actualprice = #NumberFormat(SESSION.Turf_Nutsedge_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Nutsedge_service_materials  = SESSION.Turf_Nutsedge_actualprice+SESSION.Turf_Nutsedge_materials_actualprice >
<cfset SESSION.Turf_Nutsedge_times  = get_service_info.Turf_Nutsedge_times>
<cfset SESSION.Turf_Nutsedge_total_hours = SESSION.Turf_Nutsedge_hoursA*SESSION.Turf_Nutsedge_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Fungicide_service_rate = 20.50>  --->
<cfset SESSION.Turf_Fungicide_qty  = get_service_info.Turf_Fungicide_qty >
<cfset SESSION.Turf_Fungicide_cost  = get_service_info.Turf_Fungicide_cost>
<cfset SESSION.Turf_Fungicide_rate = get_service_info.Turf_Fungicide_rate>
<cfset SESSION.Turf_Fungicide_hours  = SESSION.Turf_Fungicide_qty/SESSION.Turf_Fungicide_rate>
<cfset SESSION.Turf_Fungicide_hoursA = #NumberFormat(SESSION.Turf_Fungicide_hours,"999999.9")#>
<cfset SESSION.Turf_Fungicide_actualprice  = SESSION.Turf_Fungicide_hours*SESSION.Turf_Fungicide_cost>
<cfset SESSION.Turf_Fungicide_materials_rate  = SESSION.Turf_Fungicide_materials_rate>
<cfif  IsDefined("form.Turf_Fungicide_qty")>
  <CFSET Turf_Fungicide_qty_post  =form.Turf_Fungicide_qty>
</cfif>
<cfset SESSION.Turf_Fungicide_materials_qty =(get_service_info.Turf_Fungicide_qty/22000)>
<!---<cfset SESSION.Turf_Fungicide_materials_qty_actual=#NumberFormat(SESSION.Turf_Fungicide_materials_qty_actual,"999999.99")#>
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
</cfif>--->
<cfset SESSION.Turf_Fungicide_materials_qty = #NumberFormat(SESSION.Turf_Fungicide_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Fungicide_materials_actualprice = SESSION.Turf_Fungicide_MATERIALS_rate*SESSION.Turf_Fungicide_materials_qty>
<cfset SESSION.Turf_Fungicide_materials_actualprice = #NumberFormat(SESSION.Turf_Fungicide_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Fungicide_service_materials  = SESSION.Turf_Fungicide_actualprice+SESSION.Turf_Fungicide_materials_actualprice >
<cfset SESSION.Turf_Fungicide_times  = get_service_info.Turf_Fungicide_times>
<cfset SESSION.Turf_Fungicide_total_hours = SESSION.Turf_Fungicide_hoursA*SESSION.Turf_Fungicide_times>

<!------------------------------------------------------------------------------------------------------------->
<!--- <cfset SESSION.Turf_Insecticide_service_rate = 20.50>  --->
<cfset SESSION.Turf_Insecticide_qty  = get_service_info.Turf_Insecticide_qty >
<cfset SESSION.Turf_Insecticide_cost  = get_service_info.Turf_Insecticide_cost>
<cfset SESSION.Turf_Insecticide_rate = get_service_info.Turf_Insecticide_rate>
<cfset SESSION.Turf_Insecticide_hours  = SESSION.Turf_Insecticide_qty/SESSION.Turf_Insecticide_rate>
<cfset SESSION.Turf_Insecticide_hoursA = #NumberFormat(SESSION.Turf_Insecticide_hours,"999999.9")#>
<cfset SESSION.Turf_Insecticide_actualprice  = SESSION.Turf_Insecticide_hours*SESSION.Turf_Insecticide_cost>
<cfset SESSION.Turf_Insecticide_materials_rate  = SESSION.Turf_Insecticide_materials_rate>
<cfif  IsDefined("form.Turf_Insecticide_qty")>
  <CFSET Turf_Insecticide_qty_post  =form.Turf_Insecticide_qty>
</cfif>
<cfset SESSION.Turf_Insecticide_materials_qty =(get_service_info.Turf_Insecticide_qty/22000)>
<!---<cfset SESSION.Turf_Insecticide_materials_qty_actual=#NumberFormat(SESSION.Turf_Insecticide_materials_qty_actual,"999999.99")#>
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
</cfif>--->
<cfset SESSION.Turf_Insecticide_materials_qty = #NumberFormat(SESSION.Turf_Insecticide_materials_qty,"999999.99")#>
<cfset SESSION.Turf_Insecticide_materials_actualprice = SESSION.Turf_Insecticide_MATERIALS_rate*SESSION.Turf_Insecticide_materials_qty>
<cfset SESSION.Turf_Insecticide_materials_actualprice = #NumberFormat(SESSION.Turf_Insecticide_materials_actualprice,"999999.99")#>
<cfset SESSION.Turf_Insecticide_service_materials  = SESSION.Turf_Insecticide_actualprice+SESSION.Turf_Insecticide_materials_actualprice >
<cfset SESSION.Turf_Insecticide_times  = get_service_info.Turf_Insecticide_times>
<cfset SESSION.Turf_Insecticide_total_hours = SESSION.Turf_Insecticide_hoursA*SESSION.Turf_Insecticide_times>
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
<cfset SESSION.blank1_total_hours = SESSION.blank1_hoursA*SESSION.blank1_times>
<cfset SESSION.blank1_gm  = get_service_info.blank1_gm >
<cfset SESSION.gross_margin_diff_blank1 = (100-SESSION.blank1_gm)/100>
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
<!---<cfset SESSION.blank2_actual_extended  = SESSION.blank2_times* #NumberFormat(SESSION.blank2_service_materials,"999999.99")#>
<cfset SESSION.blank2_actual_extended  =  #ROUND(SESSION.blank2_actual_extended)#>--->
<cfset SESSION.blank2_total_hours = SESSION.blank2_hoursA*SESSION.blank2_times>
<cfset SESSION.blank2_gm  = get_service_info.blank2_gm >
<cfset SESSION.gross_margin_diff_blank2 = (100-SESSION.blank2_gm)/100>
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
<cfset SESSION.blank3_total_hours = SESSION.blank3_hoursA*SESSION.blank3_times>
<cfset SESSION.blank3_gm  = get_service_info.blank3_gm >
<cfset SESSION.gross_margin_diff_blank3 = (100-SESSION.blank3_gm)/100>

<!------------------------------------------------------------------------------------------------------------->
<!---Start & End Dates & Installments  --->
<cfset SESSION.contract_start_date   = get_service_info.contract_start_date  >
<cfset SESSION.contract_end_date  = get_service_info.contract_end_date>
<cfset SESSION.contract_installments = get_service_info.contract_installments>

<!--- Totals 2 --->
<cfset SESSION.total_hours = 
SESSION.push_mow_total_hours 
+SESSION.walk_behind_total_hours 
+SESSION.ride_mow_total_hours
+SESSION.hard_edge_total_hours
+SESSION.bed_edge_total_hours
+SESSION.TRIM_O_total_hours
+SESSION.TRIM_S_total_hours
+SESSION.spraying_total_hours
+SESSION.weeding_total_hours
+SESSION.blowing_total_hours
+SESSION.Trash_S_total_hours
+SESSION.traveltime_total_hours
+SESSION.Trash_O_total_hours
+SESSION.leafrem_total_hours
+SESSION.cleanup_total_hours
+SESSION.turf_preg_total_hours 
+SESSION.turf_prel_total_hours 
+SESSION.turf_post_total_hours
+SESSION.turf_fert_total_hours
+SESSION.turf_lime_total_hours
+SESSION.Turf_Aer_H_total_hours
+SESSION.Turf_Aer_T_total_hours
+SESSION.Turf_Seed_total_hours
+SESSION.Pruning_TP_total_hours
+SESSION.Pruning_S_total_hours
+SESSION.TS_Fert_total_hours
+SESSION.TS_Insect_total_hours
+SESSION.Annuals_S_total_hours
+SESSION.Annuals_F_total_hours
+SESSION.Irrigation_SU_total_hours
+SESSION.Irrigation_W_total_hours
+SESSION.Irrigation_I_total_hours
+SESSION.Mulch_F_Reg_total_hours 
+SESSION.Mulch_S_Reg_total_hours 
+SESSION.mulch_s_dyed_total_hours 
+SESSION.mulch_f_dyed_total_hours 
+SESSION.mulch_edging_total_hours
+SESSION.mulch_pre_total_hours
+SESSION.Pond_maint_total_hours 
+SESSION.Trim_Hillside_total_hours  
+SESSION.Pine_Tags_total_hours 
+SESSION.TS_hort_oil_total_hours 
+SESSION.Addtl_Mowing_total_hours 
+SESSION.Day_Porter_total_hours 
+SESSION.Bush_Hog_total_hours 
+SESSION.Lot_Sweeping_total_hours 
+SESSION.Trail_Maint_total_hours 
+SESSION.Irrigation_TM_total_hours 
+SESSION.Irrigation_BFI_total_hours 
+SESSION.Natural_Area_total_hours 
+SESSION.Trash_Receptacle_total_hours
+SESSION.Playground_mulch_total_hours
+SESSION.Turf_Nutsedge_total_hours
+SESSION.Turf_Fungicide_total_hours
+SESSION.Turf_Insecticide_total_hours
+SESSION.blank1_total_hours
+SESSION.blank2_total_hours
+SESSION.blank3_total_hours
 >
<!---<cfoutput>#ROUND(SESSION.push_mow_contract_price)#</cfoutput>--->
<!--- Totals 4 --->
<CFIF  SESSION.Discount_Adjustment EQ ''>
  <CFSET SESSION.Discount_Adjustment=0.00>
</CFIF>
<CFIF  SESSION.Contract_Adjustment EQ ''>
  <CFSET SESSION.Contract_Adjustment=0.00>
</CFIF>

<!--- Seasonal Hours  --->
<cfset SESSION.seasonal_hours = 
SESSION.push_mow_hoursa 
+SESSION.walk_behind_hoursa
+SESSION.ride_mow_hoursa
+SESSION.hard_edge_hoursa
+SESSION.bed_edge_hoursa
+SESSION.TRIM_O_hoursa
+SESSION.TRIM_S_hoursa
+SESSION.spraying_hoursa
+SESSION.weeding_hoursa
+SESSION.blowing_hoursa
+SESSION.Trash_S_hoursa
+SESSION.traveltime_hoursa>

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

<!---<cfset SESSION.Grounds_Maintenance_Contract =  ROUND(SESSION.total_contract_price) - 
(ROUND(SESSION.Irrigation_Contract) )>--->

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
adjusted_contract_price =  '#SESSION.adjusted_contract_price#',

<cfif  IsDefined("form.contract_start_date")  AND form.contract_start_date NEQ "">
contract_start_date = '#dateformat(form.contract_start_date,"mm/dd/yyyy")#',
</cfif>
<cfif  IsDefined("form.contract_end_date")  AND  form.contract_end_date NEQ "">
contract_end_date = '#dateformat(form.contract_end_date,"mm/dd/yyyy")#',
</cfif>

<cfif  IsDefined("form.contract_installments")  AND  form.contract_installments NEQ "">
contract_installments= '#form.contract_installments#',
</cfif>

Irrigation_Contract = '#SESSION.Irrigation_Contract#',
Seasonal_Color_Contract = '#SESSION.Seasonal_Color_Contract#',
Grounds_Maintenance_Contract ='#SESSION.Grounds_Maintenance_Contract#'
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
contract_adjustment ='#NumberFormat(SESSION.contract_adjustment,"999999.99")#',
discount_adjustment ='#NumberFormat(SESSION.discount_adjustment,"999999.99")#' 
WHERE opportunity_id = #url.id#
</cfquery>

<!---<cfquery name="do_update_services" datasource="jrgm">  
UPDATE quote_services SET 
gross_margin = '#NumberFormat(gross_margin,"999999.999")#',
push_mow_qty = '#push_mow_qty#', 
push_mow_times =  '#push_mow_times#',
push_mow_rate = '#SESSION.push_mow_rate#', 
walk_behind_qty = '#walk_behind_qty#', 
walk_behind_times =  '#walk_behind_times#',
walk_behind_rate = '#SESSION.walk_behind_rate#',
ride_mow_qty = '#ride_mow_qty#', 
ride_mow_times =  '#ride_mow_times#',
ride_mow_rate = '#SESSION.ride_mow_rate#',
hard_edge_qty = '#hard_edge_qty#', 
hard_edge_times =  '#hard_edge_times#',
hard_edge_rate = '#SESSION.hard_edge_rate#',
bed_edge_qty = '#bed_edge_qty#', 
bed_edge_times =  '#bed_edge_times#',
bed_edge_rate = '#SESSION.bed_edge_rate#',
Trim_O_qty = '#TRIM(Trim_O_qty)#', 
Trim_O_Times =  '#Trim_O_Times#',
Trim_O_rate = '#SESSION.Trim_O_rate#',
Trim_S_qty = '#Trim_S_qty#', 
trim_S_times =  '#trim_S_times#',
Trim_S_rate = '#SESSION.Trim_S_rate#',
spraying_qty = '#spraying_qty#', 
spraying_times =  '#spraying_times#',
spraying_rate = '#SESSION.spraying_rate#',
weeding_qty = '#weeding_qty#', 
weeding_times =  '#weeding_times#',
weeding_rate = '#SESSION.weeding_rate#',
blowing_qty = '#blowing_qty#', 
blowing_times =  '#blowing_times#',
blowing_rate = '#SESSION.blowing_rate#',
Trash_S_Qty = '#Trash_S_Qty#', 
Trash_S_Times =  '#Trash_S_Times#',
traveltime_qty = '#traveltime_qty#', 
traveltime_times =  '#traveltime_times#',
traveltime_rate = '#SESSION.traveltime_rate#',
traveltime_cost = '#SESSION.traveltime_cost#',
Trash_O_Qty = '#Trash_O_Qty#', 
Trash_O_Times =  '#Trash_O_Times#',
Trash_O_rate = '#SESSION.Trash_O_rate#',
leafrem_qty = '#leafrem_qty#', 
leafrem_times =  '#leafrem_times#',
leafrem_rate = '#SESSION.leafrem_rate#',
cleanup_qty = '#cleanup_qty#', 
cleanup_times =  '#cleanup_times#',
cleanup_rate = '#SESSION.cleanup_rate#',
turf_preg_qty = '#turf_preg_qty#', 
turf_preg_times =  '#turf_preg_times#',
turf_preg_rate = '#SESSION.turf_preg_rate#',
turf_prel_qty = '#turf_prel_qty#', 
turf_prel_times =  '#turf_prel_times#',
turf_prel_rate = '#SESSION.turf_prel_rate#',
turf_prel_cost =  '#SESSION.turf_prel_cost#' ,
turf_post_qty = '#turf_post_qty#', 
turf_post_times =  '#turf_post_times#',
turf_post_rate = '#SESSION.turf_post_rate#',
turf_post_cost =  '#SESSION.turf_post_cost#' ,
turf_fert_qty = '#turf_fert_qty#', 
turf_fert_times =  '#turf_fert_times#',
turf_fert_rate = '#SESSION.turf_fert_rate#',
turf_fert_cost =  '#SESSION.turf_fert_cost#' ,
turf_lime_qty = '#turf_lime_qty#', 
turf_lime_times =  '#turf_lime_times#',
turf_lime_rate = '#SESSION.turf_lime_rate#',
turf_lime_cost =  '#SESSION.turf_lime_cost#' ,
Turf_Aer_H_qty = '#Turf_Aer_H_qty#', 
Turf_Aer_H_times =  '#Turf_Aer_H_times#',
Turf_Aer_H_rate = '#SESSION.Turf_Aer_H_rate#',
Turf_Aer_H_cost =  '#SESSION.Turf_Aer_H_cost#' ,
Turf_Aer_T_qty = '#Turf_Aer_T_qty#', 
Turf_Aer_T_times =  '#Turf_Aer_T_times#',
Turf_Aer_T_rate = '#SESSION.Turf_Aer_T_rate#',
Turf_Aer_T_cost =  '#SESSION.Turf_Aer_T_cost#' ,
Turf_Seed_qty = '#Turf_Seed_qty#', 
Turf_Seed_times =  '#Turf_Seed_times#',
Turf_Seed_rate = '#SESSION.Turf_Seed_rate#',
Turf_Seed_cost =  '#SESSION.Turf_Seed_cost#' ,
Pruning_TP_qty = '#Pruning_TP_qty#', 
Pruning_TP_times =  '#Pruning_TP_times#',
Pruning_TP_rate = '#SESSION.Pruning_TP_rate#',
Pruning_TP_cost =  '#SESSION.Pruning_TP_cost#' ,
Pruning_S_qty = '#Pruning_S_qty#', 
Pruning_S_times =  '#Pruning_S_times#',
Pruning_S_rate = '#SESSION.Pruning_S_rate#',
Pruning_S_cost =  '#SESSION.Pruning_S_cost#' ,
TS_Fert_qty = '#TS_Fert_qty#', 
TS_Fert_times =  '#TS_Fert_times#',
TS_Fert_rate = '#SESSION.TS_Fert_rate#',
TS_Fert_cost =  '#SESSION.TS_Fert_cost#' ,
TS_Insect_qty = '#TS_Insect_qty#', 
TS_Insect_times =  '#TS_Insect_times#',
TS_Insect_rate = '#SESSION.TS_Insect_rate#',
TS_Insect_cost =  '#SESSION.TS_Insect_cost#' ,
Mulch_pre_qty = '#Mulch_pre_qty#', 
Mulch_pre_times =  '#Mulch_pre_times#',
Mulch_pre_rate = '#SESSION.Mulch_pre_rate#',
Mulch_pre_cost =  '#SESSION.Mulch_pre_cost#' ,
Mulch_edging_qty = '#Mulch_edging_qty#', 
Mulch_edging_times =  '#Mulch_edging_times#',
Mulch_edging_rate = '#SESSION.Mulch_edging_rate#',
Mulch_edging_cost =  '#SESSION.Mulch_edging_cost#' ,
mulch_s_dyed_qty = '#mulch_s_dyed_qty#', 
mulch_s_dyed_times =  '#mulch_s_dyed_times#',
mulch_s_dyed_rate = '#SESSION.mulch_s_dyed_rate#',
mulch_s_dyed_cost =  '#SESSION.mulch_s_dyed_cost#' ,
mulch_f_dyed_qty = '#mulch_f_dyed_qty#', 
mulch_f_dyed_times =  '#mulch_f_dyed_times#',
mulch_f_dyed_rate = '#SESSION.mulch_f_dyed_rate#',
mulch_f_dyed_cost =  '#SESSION.mulch_f_dyed_cost#' ,
Annuals_S_qty = '#Annuals_S_qty#', 
Annuals_S_times =  '#Annuals_S_times#',
Annuals_S_rate = '#SESSION.Annuals_S_rate#',
Annuals_S_cost =  '#SESSION.Annuals_S_cost#' ,
Annuals_F_qty = '#Annuals_F_qty#', 
Annuals_F_times =  '#Annuals_F_times#',
Annuals_F_rate = '#SESSION.Annuals_F_rate#',
Annuals_F_cost =  '#SESSION.Annuals_F_cost#' ,
Irrigation_SU_qty = '#Irrigation_SU_qty#', 
Irrigation_SU_times =  '#Irrigation_SU_times#',
Irrigation_SU_rate = '#SESSION.Irrigation_SU_rate#',
Irrigation_SU_cost =  '#SESSION.Irrigation_SU_cost#' ,
Irrigation_W_qty = '#Irrigation_W_qty#', 
Irrigation_W_times =  '#Irrigation_W_times#',
Irrigation_W_rate = '#SESSION.Irrigation_W_rate#',
Irrigation_W_cost =  '#SESSION.Irrigation_W_cost#' ,
Irrigation_I_qty = '#Irrigation_I_qty#', 
Irrigation_I_times =  '#Irrigation_I_times#',
Irrigation_I_rate = '#SESSION.Irrigation_I_rate#',
Irrigation_I_cost =  '#SESSION.Irrigation_I_cost#' , 
Mulch_F_Reg_qty = '#Mulch_F_Reg_qty#', 
Mulch_F_Reg_times =  '#Mulch_F_Reg_times#',
Mulch_F_Reg_rate = '#SESSION.Mulch_F_Reg_rate#',
Mulch_F_Reg_cost =  '#SESSION.Mulch_F_Reg_cost#' ,
Mulch_S_Reg_qty = '#Mulch_S_Reg_qty#', 
Mulch_S_Reg_times =  '#Mulch_S_Reg_times#',
Mulch_S_Reg_rate = '#SESSION.Mulch_S_Reg_rate#',
Mulch_S_Reg_cost =  '#SESSION.Mulch_S_Reg_cost#' ,
Pond_Maint_qty = '#Pond_Maint_qty#', 
Pond_Maint_times =  '#Pond_Maint_times#',
Pond_Maint_rate = '#SESSION.Pond_Maint_rate#',
Pond_Maint_cost =  '#SESSION.Pond_Maint_cost#' ,
Trim_Hillside_qty = '#Trim_Hillside_qty#', 
Trim_Hillside_times =  '#Trim_Hillside_times#',
Trim_Hillside_rate = '#SESSION.Trim_Hillside_rate#',
Trim_Hillside_cost =  '#SESSION.Trim_Hillside_cost#' ,
Pine_Tags_qty = '#Pine_Tags_qty#', 
Pine_Tags_times =  '#Pine_Tags_times#',
Pine_Tags_rate = '#SESSION.Pine_Tags_rate#',
Pine_Tags_cost =  '#SESSION.Pine_Tags_cost#' ,
TS_hort_oil_qty = '#TS_hort_oil_qty#', 
TS_hort_oil_times =  '#TS_hort_oil_times#',
TS_hort_oil_rate = '#SESSION.TS_hort_oil_rate#',
TS_hort_oil_cost =  '#SESSION.TS_hort_oil_cost#' ,
Addtl_Mowing_qty = '#Addtl_Mowing_qty#', 
Addtl_Mowing_times =  '#Addtl_Mowing_times#',
Addtl_Mowing_rate = '#SESSION.Addtl_Mowing_rate#',
Addtl_Mowing_cost =  '#SESSION.Addtl_Mowing_cost#' ,
Day_Porter_qty = '#Day_Porter_qty#', 
Day_Porter_times =  '#Day_Porter_times#',
Day_Porter_rate = '#SESSION.Day_Porter_rate#',
Day_Porter_cost =  '#SESSION.Day_Porter_cost#' ,
Bush_Hog_qty = '#Bush_Hog_qty#', 
Bush_Hog_times =  '#Bush_Hog_times#',
Bush_Hog_rate = '#SESSION.Bush_Hog_rate#',
Bush_Hog_cost =  '#SESSION.Bush_Hog_cost#' ,
Lot_Sweeping_qty = '#Lot_Sweeping_qty#', 
Lot_Sweeping_times =  '#Lot_Sweeping_times#',
Lot_Sweeping_rate = '#SESSION.Lot_Sweeping_rate#',
Lot_Sweeping_cost =  '#SESSION.Lot_Sweeping_cost#' ,
Trail_Maint_qty = '#Trail_Maint_qty#', 
Trail_Maint_times =  '#Trail_Maint_times#',
Trail_Maint_rate = '#SESSION.Trail_Maint_rate#',
Trail_Maint_cost =  '#SESSION.Trail_Maint_cost#' ,
Irrigation_TM_qty = '#Irrigation_TM_qty#', 
Irrigation_TM_times =  '#Irrigation_TM_times#',
Irrigation_TM_rate = '#SESSION.Irrigation_TM_rate#',
Irrigation_TM_cost =  '#SESSION.Irrigation_TM_cost#' ,
Irrigation_BFI_qty = '#Irrigation_BFI_qty#', 
Irrigation_BFI_times =  '#Irrigation_BFI_times#',
Irrigation_BFI_rate = '#SESSION.Irrigation_BFI_rate#',
Irrigation_BFI_cost =  '#SESSION.Irrigation_BFI_cost#',
Natural_Area_qty = '#Natural_Area_qty#', 
Natural_Area_times =  '#Natural_Area_times#',
Natural_Area_rate = '#SESSION.Natural_Area_rate#',
Natural_Area_cost =  '#SESSION.Natural_Area_cost#' ,
Trash_Receptacle_qty = '#Trash_Receptacle_qty#', 
Trash_Receptacle_times =  '#Trash_Receptacle_times#',
Trash_Receptacle_rate = '#SESSION.Trash_Receptacle_rate#',
Trash_Receptacle_cost =  '#SESSION.Trash_Receptacle_cost#' ,
Playground_mulch_qty = '#Playground_mulch_qty#', 
Playground_mulch_times =  '#Playground_mulch_times#',
Playground_mulch_rate = '#SESSION.Playground_mulch_rate#',
Playground_mulch_cost =  '#SESSION.Playground_mulch_cost#' ,
Turf_Nutsedge_qty = '#Turf_Nutsedge_qty#', 
Turf_Nutsedge_times =  '#Turf_Nutsedge_times#',
Turf_Nutsedge_rate = '#SESSION.Turf_Nutsedge_rate#',
Turf_Nutsedge_cost =  '#SESSION.Turf_Nutsedge_cost#' ,
Turf_Fungicide_qty = '#Turf_Fungicide_qty#', 
Turf_Fungicide_times =  '#Turf_Fungicide_times#',
Turf_Fungicide_rate = '#SESSION.Turf_Fungicide_rate#',
Turf_Fungicide_cost =  '#SESSION.Turf_Fungicide_cost#' ,
Turf_Insecticide_qty = '#Turf_Insecticide_qty#', 
Turf_Insecticide_times =  '#Turf_Insecticide_times#',
Turf_Insecticide_rate = '#SESSION.Turf_Insecticide_rate#',
Turf_Insecticide_cost =  '#SESSION.Turf_Insecticide_cost#' ,

<!---<cfif form.contract_start_date NEQ "">
contract_start_date = '#dateformat(form.contract_start_date,"mm/dd/yyyy")#',
</cfif>
<cfif form.contract_end_date NEQ "">
contract_end_date = '#dateformat(form.contract_end_date,"mm/dd/yyyy")#',
</cfif>

<cfif form.contract_installments NEQ "">
contract_installments= '#form.contract_installments#',
</cfif>--->
<!---<cfif form.contract_adjustment NEQ "">
contract_adjustment= '#form.contract_adjustment#',
</cfif>--->

Blank1_service = '#Blank1_service#', 
Blank1_unit = '#Blank1_unit#', 
blank1_qty = '#blank1_qty#', 
blank1_times =  '#blank1_times#',
blank1_rate = '#SESSION.blank1_rate#',
blank1_cost =  '#SESSION.blank1_cost#' ,
Blank2_service = '#Blank2_service#', 
Blank2_unit = '#Blank2_unit#', 
blank2_qty = '#blank2_qty#', 
blank2_times =  '#blank2_times#',
blank2_rate = '#SESSION.blank2_rate#',
blank2_cost =  '#SESSION.blank2_cost#' ,
blank3_service = '#blank3_service#', 
blank3_unit = '#blank3_unit#', 
blank3_qty = '#blank3_qty#', 
blank3_times =  '#blank3_times#',
blank3_rate = '#SESSION.blank3_rate#',
blank3_cost =  '#SESSION.blank3_cost#',
<!---lot_sweeping_gm = '#NumberFormat(lot_sweeping_gm,"999999.99")#',
blank1_gm = '#NumberFormat(blank1_gm,"999999.99")#',
blank2_gm = '#NumberFormat(blank2_gm,"999999.99")#',
blank3_gm = '#NumberFormat(blank3_gm,"999999.99")#',--->
contract_adjustment ='#NumberFormat(contract_adjustment,"999999.99")#' ,
discount_adjustment  ='#NumberFormat(discount_adjustment,"999999.99")#'
 WHERE opportunity_id = #url.id#
</cfquery>--->

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
  <cflocation url="quote_data_entry1.cfm?ID=#url.id#" />
  <cfelse>
  <cfquery name="update_quote_start" datasource="jrgm">
        UPDATE quote_start SET
        date_quote_updated = '#todayDate#',
        user_id =  '#SESSION.userid#'
        WHERE opportunity_id = #url.id#
        </cfquery>
</cfif>

<!---<cfoutput>#NumberFormat(SESSION.Grounds_Maintenance_Contract,"99,999,999.99")#</cfoutput>--->
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
<script type="text/javascript">
    function validate(){
        x=document.quoteform
        txt=x.gross_margin.value
        if (txt>=49.999) {
            return true
        }else{
            alert("Profit Margin % must be greater than 50%")
            return false
        }
}
</script>

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
          <li class="active"><i class="fa fa-circle"></i> <a href="ServicesSummary.cfm?ID=#url.id#"  target="_blank">Summary(MSS)</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="definition_of_services.cfm?ID=#url.id#"  target="_blank">Services(DOS)</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href="ContractTerms.cfm?ID=#url.id#"  target="_blank">Terms</a></li>
          <li class="active"><i class="fa fa-circle"></i> <a href=""  target="_blank">All Contract Docs</a></li>
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
    <form   name="quoteform" method="post" action="quote_data_entry1.cfm?ID=<cfoutput>#url.id#</cfoutput>" onsubmit="return validate()">
      <div class="button-boxer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_data_entry_print.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success blue-chambray" target="_blank">Print Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" target="_blank">Dimensions Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.id#&opportunity_id=#url.id#</cfoutput>" class="btn btn-success purple" >Notes</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="btnSumit" type="submit" class="btn btn-primary" id="btnSumit" value="Calculate &amp; Save"/>
      </div>
      <br />
      <br />
      <div class="container-table">
        <div class="left-table">
        <cfoutput query="get_quote_info">
          <table class="table">
            <tr>
              <td>Quote ID : </td>
              <td>#opportunity_id#</td>
              <td>&nbsp;</td>
              <td>Branch : #q_branch#</td>
              <td><!---#opportunity_state#---></td>
            </tr>
            <tr>
              <td>Customer : </td>
              <td colspan="4"><input name="opportunity_name" value="#opportunity_name#" size="35"  class="form-control"></td>
            </tr>
            <tr>
              <td>Job Location : </td>
              <td colspan="4">#q_address1#, #q_city#, #q_address_state#, #q_address_zip#</td>
            </tr>
            <tr>
              <td>Estimator :</td>
              <td colspan="4">#SESSION.screenname#</td>
            </tr>
            <tr>
              <td>Quote Status : </td>
              <td><select name="opportunity_state"   tabindex="5" >
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
                </select></td>
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
                <input name="contract_start_date" type="text" class="form_buttons" id="contract_start_date"  size="10"  value="#dateformat(SESSION.contract_start_date,"mm/dd/yyyy")#"/></td>
              <td>&nbsp;</td>
              <td nowrap="nowrap"   colspan="2"  align="left">Contract End Date :
                <input name="contract_end_date" type="text" class="form_buttons" id="contract_end_date"  size="10"  value="#dateformat(SESSION.contract_end_date,"mm/dd/yyyy")#"/>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments :
                <input name="contract_installments" type="text" class="form_buttons" id="contract_installments"  size="2"  value="#SESSION.contract_installments#"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td  nowrap="nowrap">Annual Contract Price :  $#NumberFormat(SESSION.adjusted_contract_price,"99,999,999.99")#</td>
              <td>&nbsp;</td>
              <cfif  SESSION.contract_installments GT  0>
                <cfset  total_contract_price_monthly =  SESSION.adjusted_contract_price/SESSION.contract_installments>
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
      <table width="98%" border="0" cellspacing="0" cellpadding="4">
        <tr>
          <td valign="top"><table class="table table-striped">
              <!--- border="2"--->
              <thead>
                <!--- 22 columns--->
                <tr>
                  <th colspan="2"   align="left" bgcolor="#FFFFFF"  bordercolor="#000000">&nbsp;<strong class="headbig">Service</strong></th>
                  <th colspan="6" align="center"  bgcolor="#FFFFFF"><strong class="headbig">Labor</strong></th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th colspan="4" align="center" bgcolor="#FFFFFF"><strong class="headbig">Materials</strong></th>
                  <th width="25">&nbsp;</th>
                  <th colspan="7" align="center" bgcolor="#FFFFFF"><strong class="headbig">Totals</strong></th>
                </tr>
                <tr valign="bottom" style="font-weight: 800"   bgcolor="#EDF3F8"> 
                  <!---8 columns Services--->
                  <th colspan="2" align="left" nowrap="nowrap"><br />
                    Service Name</th>
                  <th align="right" nowrap="nowrap"><br />
                    Qty/SqFt</th>
                  <th align="right" nowrap="nowrap"><br />
                    Size </th>
                  <th align="center" nowrap="nowrap"><br />
                    Unit</th>
                  <th align="right" nowrap="nowrap"><br />
                    Hours</th>
                  <th align="right" nowrap="nowrap"><br />
                    Rate</th>
                  <th align="right" nowrap="nowrap"><br />
                    Cost</th>
                  <!--- 2 columns Spacer--->
                  <th align="left" nowrap="nowrap">&nbsp;</th>
                  <th align="left" nowrap="nowrap">&nbsp;</th>
                  <!--- 4 columns Materials--->
                  <th align="left" nowrap="nowrap"><br />
                    Materials Name</th>
                  <th align="left" nowrap="nowrap"><br />
                    Qty</th>
                  <th align="left" nowrap="nowrap"><br />
                    Rate</th>
                  <th align="right" nowrap="nowrap"> <br />
                    Cost</th>
                  <!--- 1 columns Spacer--->
                  <th align="left" nowrap="nowrap">&nbsp;</th>
                  <!---    <th align="left" nowrap="nowrap">&nbsp;</th>---> 
                  <!--- 7 columns Summary--->
                  <th align="left" nowrap="nowrap"><br />
                    Times</th>
                  <th align="right" nowrap="nowrap">Labor<br />
                    Cost</th>
                  <th align="right" nowrap="nowrap">Materials<br />
                    Cost</th>
                  <th align="right" nowrap="nowrap">Total<br />
                    Cost</th>
                  <th align="right" nowrap="nowrap">Total<br />
                    Hours</th>
                  <th align="right" nowrap="nowrap">&nbsp;Profit &nbsp; &nbsp; <br />
                    Margin %</th>
                  <th align="right" nowrap="nowrap" >Contract<br />
                    Price</th>
                </tr>
              </thead>
              <tbody>
                <tr> 
                  <!--- 20 columns---> 
                  <!--- 8 columns Services--->
                  <td>&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <cfif NOT IsDefined("url.enter_service_rate")>
                    <td align="right"><!---<a href="quote_data_entry1.cfm?enter_service_rate=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a>---></td>
                    <cfelse>
                    <td align="right"><!---<input name="btnSumit" type="submit" class="btn btn-primary btn-sm" id="btnSumit" value="Save Rates"/>---></td>
                  </cfif>
                  <td>&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  <td align="right">&nbsp;</td>
                  
                  <!--- 2 columns Spacer--->
                  <td align="right">&nbsp;</td>
                  <td rowspan="59">&nbsp;<!---<img src="images/clear.gif" width="10" height="1" />---></td>
                  <!--- 4 columns Materials--->
                  <td align="left">&nbsp;</td>
                  <cfif NOT IsDefined("url.enter_materials_qty")>
                    <td align="left"><!---<a href="quote_data_entry1.cfm?enter_materials_qty=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a  >---></td>
                    <cfelse>
                    <td align="left"><!---<input name="btnSumit1" type="submit" class="btn btn-primary btn-xs" id="btnSumit" value="Save Qty"/>---></td>
                  </cfif>
                  <cfif NOT IsDefined("url.enter_materials_rate")>
                    <td align="left"><!---&nbsp;<a href="quote_data_entry1.cfm?enter_materials_rate=yes&ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-primary btn-xs">Edit</a  >---></td>
                    <cfelse>
                    <td align="left"><!---<input name="btnSumit" type="submit" class="btn btn-primary btn-xs" id="btnSumit" value="Save Rates"/--->></td>
                  </cfif>
                  <td align="right">&nbsp;</td>
                  <!--- 1 columns Spacer--->
                  <td rowspan="59">&nbsp;<!---<img src="images/clear.gif" width="10" height="1" /---></td>
                  <!--- 7 columns Summary--->
                  <td align="right">&nbsp;</td>
                  <!---<td align="right">&nbsp;</td>---> 
                  <!--- <td align="right">&nbsp;</td>---> 
                  <!---   <td align="right">&nbsp;</td>--->
                  <td align="right" colspan="4"><i>Profit Margin % must be greater than 50%:</i></td>
                  <!--- <td align="right" >10%</td>--->
                  <cfset SESSION.gross_margin =  #TRIM(SESSION.gross_margin)#>
                  <cfoutput>
                    <td align="right"><input name="gross_margin" type="text"    id="gross_margin" class="noMargin"  size="4"  value="#NumberFormat(SESSION.gross_margin,"999.999")#"/></td>
                  </cfoutput>
                  <td align="right" >&nbsp;</td>
                </tr>
                <cfoutput> 
                  <!--- 20 columns--->
                  <tr>
                    <td nowrap="nowrap">Push Mow</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="push_mow_qty" type="text" id="push_mow_qty"   size="6"    value="#SESSION.push_mow_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.push_mow_rate,"999,999")#</td>
                      <input type="hidden"  name="push_mow_rate" value="#SESSION.push_mow_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="push_mow_rate" type="text" id="pushmow_rate"   size="5"  value="#SESSION.push_mow_rate#"/></td>
                    </cfif>
                    <td nowrap="nowrap" align="center">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.push_mow_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.push_mow_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.push_mow_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="push_mow_times" type="text" class="form_buttons" id="push_mow_times"  size="2"   value="#SESSION.push_mow_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.push_mow_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.push_mow_total_labor_cost = #SESSION.push_mow_times# * #NumberFormat(SESSION.push_mow_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.push_mow_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.push_mow_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.push_mow_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.push_mow_total_all_costs = SESSION.push_mow_total_materials_cost+SESSION.push_mow_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.push_mow_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.push_mow_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.push_mow_contract_price  =  #NumberFormat(SESSION.push_mow_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.push_mow_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Walk Behind</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="walk_behind_qty" type="text" id="walk_behind_qty"   size="6"   value="#SESSION.walk_behind_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.walk_behind_rate,"999,999")#</td>
                      <input type="hidden"  name="walk_behind_rate" value="#SESSION.walk_behind_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="walk_behind_rate" type="text" id="walk_behind_rate"   size="5"  value="#SESSION.walk_behind_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.walk_behind_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.walk_behind_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.walk_behind_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="walk_behind_times" type="text" class="form_buttons" id="walk_behind_times"  size="2"  value="#SESSION.walk_behind_times#"/></td>
                    <CFSET SESSION.walk_behind_total_labor_cost = #SESSION.walk_behind_times# * #NumberFormat(SESSION.walk_behind_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.walk_behind_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.walk_behind_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.walk_behind_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.walk_behind_total_all_costs = SESSION.walk_behind_total_materials_cost+SESSION.walk_behind_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.walk_behind_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.walk_behind_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.walk_behind_contract_price  =  #NumberFormat(SESSION.walk_behind_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.walk_behind_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Ride Mow</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="ride_mow_qty" type="text" id="ride_mow_qty"   size="6"   value="#SESSION.ride_mow_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.ride_mow_rate,"999,999")#</td>
                      <input type="hidden"  name="ride_mow_rate" value="#SESSION.ride_mow_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="ride_mow_rate" type="text" id="ride_mow_rate"   size="5"  value="#SESSION.ride_mow_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.ride_mow_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.ride_mow_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.ride_mow_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="ride_mow_times" type="text" class="form_buttons" id="ride_mow_times"  size="2"  value="#SESSION.ride_mow_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.ride_mow_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.ride_mow_total_labor_cost = #SESSION.ride_mow_times# * #NumberFormat(SESSION.ride_mow_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.ride_mow_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.ride_mow_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.ride_mow_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.ride_mow_total_all_costs = SESSION.ride_mow_total_materials_cost+SESSION.ride_mow_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.ride_mow_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.ride_mow_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.ride_mow_contract_price  =  #NumberFormat(SESSION.ride_mow_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.ride_mow_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Hard Edge </td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="hard_edge_qty" type="text" id="hard_edge_qty"   size="6"   value="#SESSION.hard_edge_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.hard_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="hard_edge_rate" value="#SESSION.hard_edge_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="hard_edge_rate" type="text" id="hard_edge_rate"   size="5"  value="#SESSION.hard_edge_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">LF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.hard_edge_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Hard_Edge_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.hard_edge_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="hard_edge_times" type="text" class="form_buttons" id="hard_edge_times"  size="2"  value="#SESSION.hard_edge_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.hard_edge_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.hard_edge_total_labor_cost = #SESSION.hard_edge_times# * #NumberFormat(SESSION.hard_edge_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.hard_edge_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.hard_edge_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.hard_edge_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.hard_edge_total_all_costs = SESSION.hard_edge_total_materials_cost+SESSION.hard_edge_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.hard_edge_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.hard_edge_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.hard_edge_contract_price  =  #NumberFormat(SESSION.hard_edge_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.hard_edge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Bed Edge</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="bed_edge_qty" type="text" id="bed_edge_qty"   size="6"   value="#SESSION.bed_edge_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.bed_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="bed_edge_rate" value="#SESSION.bed_edge_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="bed_edge_rate" type="text" id="bed_edge_rate"   size="5"  value="#SESSION.bed_edge_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">LF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.bed_edge_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.bed_edge_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.bed_edge_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="bed_edge_times" type="text" class="form_buttons" id="bed_edge_times"  size="2"  value="#SESSION.bed_edge_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.bed_edge_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.bed_edge_total_labor_cost = #SESSION.bed_edge_times# * #NumberFormat(SESSION.bed_edge_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.bed_edge_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.bed_edge_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.bed_edge_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.bed_edge_total_all_costs = SESSION.bed_edge_total_materials_cost+SESSION.bed_edge_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.bed_edge_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.bed_edge_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.bed_edge_contract_price  =  #NumberFormat(SESSION.bed_edge_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.bed_edge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trim, O</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trim_O_qty" type="text" id="Trim_O_qty"   size="6"   value="#SESSION.Trim_O_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trim_O_rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_O_rate" value="#SESSION.Trim_O_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trim_O_rate" type="text"   size="5"  value="#SESSION.Trim_O_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TRIM_O_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trim_O_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_O_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="TRIM_O_times" type="text" class="form_buttons" id="TRIM_O_times"  size="2"  value="#SESSION.TRIM_O_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.TRIM_O_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.TRIM_O_total_labor_cost = #SESSION.TRIM_O_times# * #NumberFormat(SESSION.TRIM_O_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_O_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.TRIM_O_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_O_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.TRIM_O_total_all_costs = SESSION.TRIM_O_total_materials_cost+SESSION.TRIM_O_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_O_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TRIM_O_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.TRIM_O_contract_price  =  #NumberFormat(SESSION.TRIM_O_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_O_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trim, S</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trim_S_qty" type="text" id="Trim_S_qty"   size="6"   value="#SESSION.Trim_S_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trim_S_Rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_S_Rate" value="#SESSION.Trim_S_Rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trim_S_Rate" type="text" id="Trim_S_Rate"   size="5"  value="#SESSION.Trim_S_Rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TRIM_S_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trim_S_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_S_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="TRIM_S_times" type="text" class="form_buttons" id="TRIM_S_times"  size="2"  value="#SESSION.TRIM_S_times#"/></td>
                    
                    <!---<td align="right">$#NumberFormat(SESSION.TRIM_S_overtime_adjustment,"999,999.99")#</td>--->
                    
                    <CFSET SESSION.TRIM_S_total_labor_cost = #SESSION.TRIM_S_times# * #NumberFormat(SESSION.TRIM_S_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_S_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.TRIM_S_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_S_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.TRIM_S_total_all_costs = SESSION.TRIM_S_total_materials_cost+SESSION.TRIM_S_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_S_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TRIM_S_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.TRIM_S_contract_price  =  #NumberFormat(SESSION.TRIM_S_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TRIM_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Spraying</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="spraying_qty" type="text" id="spraying_qty"   size="6"   value="#SESSION.spraying_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.spraying_rate,"999,999")#</td>
                      <input type="hidden"  name="spraying_rate" value="#SESSION.spraying_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="spraying_rate" type="text" id="spraying_rate"   size="5"  value="#SESSION.spraying_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.spraying_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.spraying_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Non-sel. Herbicide (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.spraying_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.SPRAYING_MATERIALS_QTY_ACTUAL")  AND   SESSION.spraying_materials_qty  NEQ SESSION.spraying_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="spraying_materials_qty" value="#SESSION.spraying_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="spraying_materials_qty" type="text" id="spraying_materials_qty"   size="6"  value="#TRIM(SESSION.spraying_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.spraying_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="spraying_materials_rate" value="#SESSION.spraying_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="spraying_materials_rate" type="text" id="spraying_rate"   size="5"  value="#SESSION.spraying_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="spraying_times" type="text" class="form_buttons" id="spraying_times"  size="2"  value="#SESSION.spraying_times#"/></td>
                    <CFSET SESSION.spraying_total_labor_cost = #SESSION.spraying_times# * #NumberFormat(SESSION.spraying_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.spraying_total_materials_cost = #SESSION.spraying_times# * #NumberFormat(SESSION.spraying_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.spraying_total_all_costs = SESSION.spraying_total_materials_cost+SESSION.spraying_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.spraying_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.spraying_contract_price  =  #NumberFormat(SESSION.spraying_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.spraying_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Weeding</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="weeding_qty" type="text" id="weeding_qty"   size="6"   value="#SESSION.weeding_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.weeding_rate,"999,999")#</td>
                      <input type="hidden"  name="weeding_rate" value="#SESSION.weeding_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="weeding_rate" type="text" id="weeding_rate"   size="5"  value="#SESSION.weeding_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.weeding_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.weeding_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.weeding_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="weeding_times" type="text" class="form_buttons" id="weeding_times"  size="2"  value="#SESSION.weeding_times#"/></td>
                    <CFSET SESSION.weeding_total_labor_cost = #SESSION.weeding_times# * #NumberFormat(SESSION.weeding_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.weeding_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.weeding_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.weeding_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.weeding_total_all_costs = SESSION.weeding_total_materials_cost+SESSION.weeding_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.weeding_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.weeding_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.weeding_contract_price  =  #NumberFormat(SESSION.weeding_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.weeding_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Blowing</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="blowing_qty" type="text" id="blowing_qty"   size="6"   value="#SESSION.blowing_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.blowing_rate,"999,999")#</td>
                      <input type="hidden"  name="blowing_rate" value="#SESSION.blowing_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="blowing_rate" type="text" id="blowing_rate"   size="5"  value="#SESSION.blowing_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.blowing_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.blowing_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.blowing_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="blowing_times" type="text" class="form_buttons" id="blowing_times"  size="2"  value="#SESSION.blowing_times#"/></td>
                    <CFSET SESSION.blowing_total_labor_cost = #SESSION.blowing_times# * #NumberFormat(SESSION.blowing_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.blowing_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.blowing_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.blowing_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.blowing_total_all_costs = SESSION.blowing_total_materials_cost+SESSION.blowing_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.blowing_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.blowing_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.blowing_contract_price  =  #NumberFormat(SESSION.blowing_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.blowing_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trash, S</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trash_S_Qty" type="text" id="Trash_S_Qty"   size="6"   value="#SESSION.Trash_S_Qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_S_Rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_S_Rate" value="#SESSION.Trash_S_Rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trash_S_Rate" type="text" id="Trash_S_Rate"   size="5"  value="#SESSION.Trash_S_Rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.trash_s_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trash_S_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_S_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Trash_S_times" type="text" class="form_buttons" id="Trash_S_times"  size="2"  value="#SESSION.Trash_S_times#"/></td>
                    <CFSET SESSION.Trash_S_total_labor_cost = #SESSION.Trash_S_times# * #NumberFormat(SESSION.Trash_S_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_S_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_S_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_S_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_S_total_all_costs = SESSION.Trash_S_total_materials_cost+SESSION.Trash_S_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_S_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_S_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Trash_S_contract_price  =  #NumberFormat(SESSION.Trash_S_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Travel Time</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="traveltime_qty" type="text" id="traveltime_qty"   size="6"   value="#SESSION.traveltime_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.traveltime_rate,"999,999")#</td>
                      <input type="hidden"  name="traveltime_rate" value="#SESSION.traveltime_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="traveltime_rate" type="text" id="traveltime_rate"   size="5"  value="#SESSION.traveltime_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.traveltime_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.traveltime_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.traveltime_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Traveltime_times" type="text" class="form_buttons" id="Traveltime_times"  size="2"  value="#SESSION.Traveltime_times#"/></td>
                    <CFSET SESSION.Traveltime_total_labor_cost = #SESSION.Traveltime_times# * #NumberFormat(SESSION.Traveltime_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Traveltime_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Traveltime_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Traveltime_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Traveltime_total_all_costs = SESSION.Traveltime_total_materials_cost+SESSION.Traveltime_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Traveltime_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Traveltime_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Traveltime_contract_price  =  #NumberFormat(SESSION.Traveltime_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Traveltime_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trash, Off</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trash_O_Qty" type="text" id="Trash_O_Qty"   size="6"   value="#SESSION.Trash_O_Qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_O_rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_O_rate" value="#SESSION.Trash_O_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trash_O_rate" type="text" id="Trash_O_rate"   size="5"  value="#SESSION.Trash_O_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_O_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trash_O_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_O_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Trash_O_times" type="text" class="form_buttons" id="Trash_O_times"  size="2"  value="#SESSION.Trash_O_times#"/></td>
                    <CFSET SESSION.Trash_O_total_labor_cost = #SESSION.Trash_O_times# * #NumberFormat(SESSION.Trash_O_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_O_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_O_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_O_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_O_total_all_costs = SESSION.Trash_O_total_materials_cost+SESSION.Trash_O_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_O_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_O_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Trash_O_contract_price  =  #NumberFormat(SESSION.Trash_O_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_O_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Leaf Rem</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="leafrem_qty" type="text" id="leafrem_qty"   size="6"   value="#SESSION.leafrem_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.leafrem_rate,"999,999")#</td>
                      <input type="hidden"  name="leafrem_rate" value="#SESSION.leafrem_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="leafrem_rate" type="text" id="leafrem_rate"   size="5"  value="#SESSION.leafrem_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.leafrem_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.leafrem_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.leafrem_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="leafrem_times" type="text" class="form_buttons" id="leafrem_times"  size="2"  value="#SESSION.leafrem_times#"/></td>
                    <CFSET SESSION.leafrem_total_labor_cost = #SESSION.leafrem_times# * #NumberFormat(SESSION.leafrem_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.leafrem_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.leafrem_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.leafrem_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.leafrem_total_all_costs = SESSION.leafrem_total_materials_cost+SESSION.leafrem_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.leafrem_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.leafrem_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.leafrem_contract_price  =  #NumberFormat(SESSION.leafrem_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.leafrem_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Cleanup</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="cleanup_qty" type="text" id="cleanup_qty"   size="6"   value="#SESSION.cleanup_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.cleanup_rate,"999,999")#</td>
                      <input type="hidden"  name="cleanup_rate" value="#SESSION.cleanup_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="cleanup_rate" type="text" id="cleanup_rate"   size="5"  value="#SESSION.cleanup_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.cleanup_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.cleanup_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.cleanup_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="cleanup_times" type="text" class="form_buttons" id="cleanup_times"  size="2"  value="#SESSION.cleanup_times#"/></td>
                    <CFSET SESSION.cleanup_total_labor_cost = #SESSION.cleanup_times# * #NumberFormat(SESSION.cleanup_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.cleanup_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.cleanup_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.cleanup_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.cleanup_total_all_costs = SESSION.cleanup_total_materials_cost+SESSION.cleanup_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.cleanup_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.cleanup_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.cleanup_contract_price  =  #NumberFormat(SESSION.cleanup_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.cleanup_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Pre (G)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="turf_preg_qty" type="text" id="turf_preg_qty"   size="6"    value="#SESSION.turf_preg_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_preg_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_preg_rate" value="#SESSION.turf_preg_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="turf_preg_rate" type="text" id="turf_preg_rate"   size="5"  value="#SESSION.turf_preg_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_preg_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.turf_preg_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Granular Turf Preemergent (lb)</td>
                  <!---  <cfif NOT IsDefined("url.enter_materials_qty")>--->
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.turf_preg_materials_qty,"999,999.99")#</td> 
                        <!--- <cfif  IsDefined("SESSION.turf_preg_MATERIALS_QTY_ACTUAL")  AND   SESSION.turf_preg_materials_qty  NEQ SESSION.turf_preg_materials_qty_actual>
                          *
                      </cfif>--->
                    <input type="hidden"  name="turf_preg_materials_qty" value="#SESSION.turf_preg_materials_qty#"/>
                      <!---<cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_preg_materials_qty" type="text" id="turf_preg_materials_qty"   size="6"  value="#TRIM(SESSION.turf_preg_materials_qty)#"/></td>
                    </cfif>--->
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_preg_materials_rate" value="#SESSION.turf_preg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_preg_materials_rate" type="text" id="turf_preg_rate"   size="5"  value="#SESSION.turf_preg_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="turf_preg_times" type="text" class="form_buttons" id="turf_preg_times"  size="2"  value="#SESSION.turf_preg_times#"/></td>
                    <CFSET SESSION.turf_preg_total_labor_cost = #SESSION.turf_preg_times# * #NumberFormat(SESSION.turf_preg_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.turf_preg_total_materials_cost = #SESSION.turf_preg_times# * #NumberFormat(SESSION.turf_preg_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.turf_preg_total_all_costs = SESSION.turf_preg_total_materials_cost+SESSION.turf_preg_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_preg_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.turf_preg_contract_price  =  #NumberFormat(SESSION.turf_preg_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_preg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Pre (L)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="turf_prel_qty" type="text" id="turf_prel_qty"   size="6"    value="#SESSION.turf_prel_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_prel_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_prel_rate" value="#SESSION.turf_prel_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="turf_prel_rate" type="text" id="turf_prel_rate"   size="5"  value="#SESSION.turf_prel_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_prel_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.turf_prel_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Prodiamine Pre-emergent (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.turf_prel_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.turf_prel_MATERIALS_QTY_ACTUAL")  AND   SESSION.turf_prel_materials_qty  NEQ SESSION.turf_prel_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="turf_prel_materials_qty" value="#SESSION.turf_prel_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_prel_materials_qty" type="text" id="turf_prel_materials_qty"   size="6"  value="#TRIM(SESSION.turf_prel_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_prel_materials_rate" value="#SESSION.turf_prel_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_prel_materials_rate" type="text" id="turf_prel_rate"   size="5"  value="#SESSION.turf_prel_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="turf_prel_times" type="text" class="form_buttons" id="turf_prel_times"  size="2"  value="#SESSION.turf_prel_times#"/></td>
                    <CFSET SESSION.turf_prel_total_labor_cost = #SESSION.turf_prel_times# * #NumberFormat(SESSION.turf_prel_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.turf_prel_total_materials_cost = #SESSION.turf_prel_times# * #NumberFormat(SESSION.turf_prel_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.turf_prel_total_all_costs = SESSION.turf_prel_total_materials_cost+SESSION.turf_prel_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_prel_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.turf_prel_contract_price  =  #NumberFormat(SESSION.turf_prel_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_prel_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Post</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="turf_post_qty" type="text" id="turf_post_qty"   size="6"    value="#SESSION.turf_post_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_post_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_post_rate" value="#SESSION.turf_post_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="turf_post_rate" type="text" id="turf_post_rate"   size="5"  value="#SESSION.turf_post_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_post_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.turf_post_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Selective Herbicide (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.turf_post_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.turf_post_MATERIALS_QTY_ACTUAL")  AND   SESSION.turf_post_materials_qty  NEQ SESSION.turf_post_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="turf_post_materials_qty" value="#SESSION.turf_post_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_post_materials_qty" type="text" id="turf_post_materials_qty"   size="6"  value="#TRIM(SESSION.turf_post_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_post_materials_rate" value="#SESSION.turf_post_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_post_materials_rate" type="text" id="turf_post_rate"   size="5"  value="#SESSION.turf_post_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="turf_post_times" type="text" class="form_buttons" id="turf_post_times"  size="2"  value="#SESSION.turf_post_times#"/></td>
                    <CFSET SESSION.turf_post_total_labor_cost = #SESSION.turf_post_times# * #NumberFormat(SESSION.turf_post_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.turf_post_total_materials_cost = #SESSION.turf_post_times# * #NumberFormat(SESSION.turf_post_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.turf_post_total_all_costs = SESSION.turf_post_total_materials_cost+SESSION.turf_post_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_post_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.turf_post_contract_price  =  #NumberFormat(SESSION.turf_post_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_post_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Fert</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="turf_fert_qty" type="text" id="turf_fert_qty"   size="6"    value="#SESSION.turf_fert_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_fert_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_fert_rate" value="#SESSION.turf_fert_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="turf_fert_rate" type="text" id="turf_fert_rate"   size="5"  value="#SESSION.turf_fert_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_fert_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.turf_fert_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Starter Fertilizer (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.turf_fert_materials_qty,"999,999.99")# 
                        <!---   <cfif  IsDefined("SESSION.turf_fert_MATERIALS_QTY_ACTUAL")  AND   SESSION.turf_fert_materials_qty  NEQ SESSION.turf_fert_materials_qty_actual>
                          *
                      </cfif---></td>
                      <input type="hidden"  name="turf_fert_materials_qty" value="#SESSION.turf_fert_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_fert_materials_qty" type="text" id="turf_fert_materials_qty"   size="6"  value="#TRIM(SESSION.turf_fert_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_fert_materials_rate" value="#SESSION.turf_fert_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_fert_materials_rate" type="text" id="turf_fert_rate"   size="5"  value="#SESSION.turf_fert_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="turf_fert_times" type="text" class="form_buttons" id="turf_fert_times"  size="2"  value="#SESSION.turf_fert_times#"/></td>
                    <CFSET SESSION.turf_fert_total_labor_cost = #SESSION.turf_fert_times# * #NumberFormat(SESSION.turf_fert_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.turf_fert_total_materials_cost = #SESSION.turf_fert_times# * #NumberFormat(SESSION.turf_fert_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.turf_fert_total_all_costs = SESSION.turf_fert_total_materials_cost+SESSION.turf_fert_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_fert_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.turf_fert_contract_price  =  #NumberFormat(SESSION.turf_fert_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_fert_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Lime</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="turf_lime_qty" type="text" id="turf_lime_qty"   size="6"    value="#SESSION.turf_lime_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_lime_rate,"999,999")#</td>
                      <input type="hidden"  name="turf_lime_rate" value="#SESSION.turf_lime_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="turf_lime_rate" type="text" id="turf_lime_rate"   size="5"  value="#SESSION.turf_lime_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_lime_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.turf_lime_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">High Calcium Lime (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.turf_lime_materials_qty,"999,999.99")# 
                        <!---<cfif  IsDefined("SESSION.turf_lime_MATERIALS_QTY_ACTUAL")  AND   SESSION.turf_lime_materials_qty  NEQ SESSION.turf_lime_materials_qty_actual>
                          *
                      </cfif---></td>
                      <input type="hidden"  name="turf_lime_materials_qty" value="#SESSION.turf_lime_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_lime_materials_qty" type="text" id="turf_lime_materials_qty"   size="6"  value="#TRIM(SESSION.turf_lime_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="turf_lime_materials_rate" value="#SESSION.turf_lime_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="turf_lime_materials_rate" type="text" id="turf_lime_rate"   size="5"  value="#SESSION.turf_lime_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="turf_lime_times" type="text" class="form_buttons" id="turf_lime_times"  size="2"  value="#SESSION.turf_lime_times#"/></td>
                    <CFSET SESSION.turf_lime_total_labor_cost = #SESSION.turf_lime_times# * #NumberFormat(SESSION.turf_lime_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.turf_lime_total_materials_cost = #SESSION.turf_lime_times# * #NumberFormat(SESSION.turf_lime_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.turf_lime_total_all_costs = SESSION.turf_lime_total_materials_cost+SESSION.turf_lime_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.turf_lime_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.turf_lime_contract_price  =  #NumberFormat(SESSION.turf_lime_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.turf_lime_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Aer (H)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Aer_H_qty" type="text" id="Turf_Aer_H_qty"   size="6"    value="#SESSION.Turf_Aer_H_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_H_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Aer_H_rate" value="#SESSION.Turf_Aer_H_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Aer_H_rate" type="text" id="Turf_Aer_H_rate"   size="5"  value="#SESSION.Turf_Aer_H_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_H_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Aer_H_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_H_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Aer_H_times" type="text" class="form_buttons" id="Turf_Aer_H_times"  size="2"  value="#SESSION.Turf_Aer_H_times#"/></td>
                    <CFSET SESSION.Turf_Aer_H_total_labor_cost = #SESSION.Turf_Aer_H_times# * #NumberFormat(SESSION.Turf_Aer_H_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_H_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Aer_H_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_H_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Aer_H_total_all_costs = SESSION.Turf_Aer_H_total_materials_cost+SESSION.Turf_Aer_H_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_H_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_H_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Aer_H_contract_price  =  #NumberFormat(SESSION.Turf_Aer_H_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_H_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Aer (T)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Aer_T_qty" type="text" id="Turf_Aer_T_qty"   size="6"    value="#SESSION.Turf_Aer_T_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_T_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Aer_T_rate" value="#SESSION.Turf_Aer_T_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Aer_T_rate" type="text" id="Turf_Aer_T_rate"   size="5"  value="#SESSION.Turf_Aer_T_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_T_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Aer_T_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_T_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Aer_T_times" type="text" class="form_buttons" id="Turf_Aer_T_times"  size="2"  value="#SESSION.Turf_Aer_T_times#"/></td>
                    <CFSET SESSION.Turf_Aer_T_total_labor_cost = #SESSION.Turf_Aer_T_times# * #NumberFormat(SESSION.Turf_Aer_T_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_T_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Aer_T_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_T_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Aer_T_total_all_costs = SESSION.Turf_Aer_T_total_materials_cost+SESSION.Turf_Aer_T_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_T_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Aer_T_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Aer_T_contract_price  =  #NumberFormat(SESSION.Turf_Aer_T_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Aer_T_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf  Seed</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Seed_qty" type="text" id="Turf_Seed_qty"   size="6"    value="#SESSION.Turf_Seed_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Seed_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Seed_rate" value="#SESSION.Turf_Seed_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Seed_rate" type="text" id="Turf_Seed_rate"   size="5"  value="#SESSION.Turf_Seed_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Seed_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Seed_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Fescue Seed (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Turf_Seed_materials_qty,"999,999.99")# 
                        <!---<cfif  IsDefined("SESSION.Turf_Seed_MATERIALS_QTY_ACTUAL")  AND   SESSION.Turf_Seed_materials_qty  NEQ SESSION.Turf_Seed_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Turf_Seed_materials_qty" value="#SESSION.Turf_Seed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Seed_materials_qty" type="text" id="Turf_Seed_materials_qty"   size="6"  value="#TRIM(SESSION.Turf_Seed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Seed_materials_rate" value="#SESSION.Turf_Seed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Seed_materials_rate" type="text" id="Turf_Seed_rate"   size="5"  value="#SESSION.Turf_Seed_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Seed_times" type="text" class="form_buttons" id="Turf_Seed_times"  size="2"  value="#SESSION.Turf_Seed_times#"/></td>
                    <CFSET SESSION.Turf_Seed_total_labor_cost = #SESSION.Turf_Seed_times# * #NumberFormat(SESSION.Turf_Seed_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Seed_total_materials_cost = #SESSION.Turf_Seed_times# * #NumberFormat(SESSION.Turf_Seed_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Seed_total_all_costs = SESSION.Turf_Seed_total_materials_cost+SESSION.Turf_Seed_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Seed_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Seed_contract_price  =  #NumberFormat(SESSION.Turf_Seed_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Seed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Nutsedge</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Nutsedge_qty" type="text" id="Turf_Nutsedge_qty"   size="6"    value="#SESSION.Turf_Nutsedge_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Nutsedge_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Nutsedge_rate" value="#SESSION.Turf_Nutsedge_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Nutsedge_rate" type="text" id="Turf_Nutsedge_rate"   size="5"  value="#SESSION.Turf_Nutsedge_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Nutsedge_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Nutsedge_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Dismiss (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Turf_Nutsedge_materials_qty,"999,999.99")# 
                        <!---  <cfif  IsDefined("SESSION.Turf_Nutsedge_MATERIALS_QTY_ACTUAL")  AND   SESSION.Turf_Nutsedge_materials_qty  NEQ SESSION.Turf_Nutsedge_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Turf_Nutsedge_materials_qty" value="#SESSION.Turf_Nutsedge_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_materials_qty" type="text" id="Turf_Nutsedge_materials_qty"   size="6"  value="#TRIM(SESSION.Turf_Nutsedge_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Nutsedge_materials_rate" value="#SESSION.Turf_Nutsedge_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_materials_rate" type="text" id="Turf_Nutsedge_rate"   size="5"  value="#SESSION.Turf_Nutsedge_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Nutsedge_times" type="text" class="form_buttons" id="Turf_Nutsedge_times"  size="2"  value="#SESSION.Turf_Nutsedge_times#"/></td>
                    <CFSET SESSION.Turf_Nutsedge_total_labor_cost = #SESSION.Turf_Nutsedge_times# * #NumberFormat(SESSION.Turf_Nutsedge_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Nutsedge_total_materials_cost = #SESSION.Turf_Nutsedge_times# * #NumberFormat(SESSION.Turf_Nutsedge_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Nutsedge_total_all_costs = SESSION.Turf_Nutsedge_total_materials_cost+SESSION.Turf_Nutsedge_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Nutsedge_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Nutsedge_contract_price  =  #NumberFormat(SESSION.Turf_Nutsedge_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Nutsedge_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Fungicide</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Fungicide_qty" type="text" id="Turf_Fungicide_qty"   size="6"    value="#SESSION.Turf_Fungicide_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Fungicide_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Fungicide_rate" value="#SESSION.Turf_Fungicide_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Fungicide_rate" type="text" id="Turf_Fungicide_rate"   size="5"  value="#SESSION.Turf_Fungicide_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Fungicide_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Fungicide_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Armada (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Turf_Fungicide_materials_qty,"999,999.99")# 
                        <!---<cfif  IsDefined("SESSION.Turf_Fungicide_MATERIALS_QTY_ACTUAL")  AND   SESSION.Turf_Fungicide_materials_qty  NEQ SESSION.Turf_Fungicide_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Turf_Fungicide_materials_qty" value="#SESSION.Turf_Fungicide_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_materials_qty" type="text" id="Turf_Fungicide_materials_qty"   size="6"  value="#TRIM(SESSION.Turf_Fungicide_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Fungicide_materials_rate" value="#SESSION.Turf_Fungicide_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_materials_rate" type="text" id="Turf_Fungicide_rate"   size="5"  value="#SESSION.Turf_Fungicide_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Fungicide_times" type="text" class="form_buttons" id="Turf_Fungicide_times"  size="2"  value="#SESSION.Turf_Fungicide_times#"/></td>
                    <CFSET SESSION.Turf_Fungicide_total_labor_cost = #SESSION.Turf_Fungicide_times# * #NumberFormat(SESSION.Turf_Fungicide_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Fungicide_total_materials_cost = #SESSION.Turf_Fungicide_times# * #NumberFormat(SESSION.Turf_Fungicide_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Fungicide_total_all_costs = SESSION.Turf_Fungicide_total_materials_cost+SESSION.Turf_Fungicide_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Fungicide_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Fungicide_contract_price  =  #NumberFormat(SESSION.Turf_Fungicide_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Fungicide_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Turf Insecticide</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Turf_Insecticide_qty" type="text" id="Turf_Insecticide_qty"   size="6"    value="#SESSION.Turf_Insecticide_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Insecticide_rate,"999,999")#</td>
                      <input type="hidden"  name="Turf_Insecticide_rate" value="#SESSION.Turf_Insecticide_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Turf_Insecticide_rate" type="text" id="Turf_Insecticide_rate"   size="5"  value="#SESSION.Turf_Insecticide_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Insecticide_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Turf_Insecticide_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Bifenthrin (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Turf_Insecticide_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.Turf_Insecticide_MATERIALS_QTY_ACTUAL")  AND   SESSION.Turf_Insecticide_materials_qty  NEQ SESSION.Turf_Insecticide_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Turf_Insecticide_materials_qty" value="#SESSION.Turf_Insecticide_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_materials_qty" type="text" id="Turf_Insecticide_materials_qty"   size="6"  value="#TRIM(SESSION.Turf_Insecticide_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Turf_Insecticide_materials_rate" value="#SESSION.Turf_Insecticide_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_materials_rate" type="text" id="Turf_Insecticide_rate"   size="5"  value="#SESSION.Turf_Insecticide_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Turf_Insecticide_times" type="text" class="form_buttons" id="Turf_Insecticide_times"  size="2"  value="#SESSION.Turf_Insecticide_times#"/></td>
                    <CFSET SESSION.Turf_Insecticide_total_labor_cost = #SESSION.Turf_Insecticide_times# * #NumberFormat(SESSION.Turf_Insecticide_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Insecticide_total_materials_cost = #SESSION.Turf_Insecticide_times# * #NumberFormat(SESSION.Turf_Insecticide_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Turf_Insecticide_total_all_costs = SESSION.Turf_Insecticide_total_materials_cost+SESSION.Turf_Insecticide_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Turf_Insecticide_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Turf_Insecticide_contract_price  =  #NumberFormat(SESSION.Turf_Insecticide_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Turf_Insecticide_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Pruning, T/P</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Pruning_TP_qty" type="text" id="Pruning_TP_qty"   size="6"    value="#SESSION.Pruning_TP_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_TP_rate,"999,999")#</td>
                      <input type="hidden"  name="Pruning_TP_rate" value="#SESSION.Pruning_TP_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Pruning_TP_rate" type="text" id="Pruning_TP_rate"   size="5"  value="#SESSION.Pruning_TP_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_TP_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Pruning_TP_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_TP_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Pruning_TP_times" type="text" class="form_buttons" id="Pruning_TP_times"  size="2"  value="#SESSION.Pruning_TP_times#"/></td>
                    <CFSET SESSION.Pruning_TP_total_labor_cost = #SESSION.Pruning_TP_times# * #NumberFormat(SESSION.Pruning_TP_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_TP_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Pruning_TP_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_TP_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Pruning_TP_total_all_costs = SESSION.Pruning_TP_total_materials_cost+SESSION.Pruning_TP_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_TP_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_TP_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Pruning_TP_contract_price  =  #NumberFormat(SESSION.Pruning_TP_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_TP_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Pruning, S</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Pruning_S_qty" type="text" id="Pruning_S_qty"   size="6"    value="#SESSION.Pruning_S_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_S_rate,"999,999")#</td>
                      <input type="hidden"  name="Pruning_S_rate" value="#SESSION.Pruning_S_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Pruning_S_rate" type="text" id="Pruning_S_rate"   size="5"  value="#SESSION.Pruning_S_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_S_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Pruning_S_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_S_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Pruning_S_times" type="text" class="form_buttons" id="Pruning_S_times"  size="2"  value="#SESSION.Pruning_S_times#"/></td>
                    <CFSET SESSION.Pruning_S_total_labor_cost = #SESSION.Pruning_S_times# * #NumberFormat(SESSION.Pruning_S_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_S_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Pruning_S_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_S_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Pruning_S_total_all_costs = SESSION.Pruning_S_total_materials_cost+SESSION.Pruning_S_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_S_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pruning_S_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Pruning_S_contract_price  =  #NumberFormat(SESSION.Pruning_S_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pruning_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">T&amp;S, Fert</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="TS_Fert_qty" type="text" id="TS_Fert_qty"   size="6"    value="#SESSION.TS_Fert_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Fert_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_Fert_rate" value="#SESSION.TS_Fert_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="TS_Fert_rate" type="text" id="TS_Fert_rate"   size="5"  value="#SESSION.TS_Fert_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Fert_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.TS_Fert_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Fertilizer Ornamental 14-14-14  (lb)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.TS_Fert_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.TS_Fert_MATERIALS_QTY_ACTUAL")  AND   SESSION.TS_Fert_materials_qty  NEQ SESSION.TS_Fert_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="TS_Fert_materials_qty" value="#SESSION.TS_Fert_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Fert_materials_qty" type="text" id="TS_Fert_materials_qty"   size="6"  value="#TRIM(SESSION.TS_Fert_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_Fert_materials_rate" value="#SESSION.TS_Fert_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Fert_materials_rate" type="text" id="TS_Fert_rate"   size="5"  value="#SESSION.TS_Fert_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="TS_Fert_times" type="text" class="form_buttons" id="TS_Fert_times"  size="2"  value="#SESSION.TS_Fert_times#"/></td>
                    <CFSET SESSION.TS_Fert_total_labor_cost = #SESSION.TS_Fert_times# * #NumberFormat(SESSION.TS_Fert_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.TS_Fert_total_materials_cost = #SESSION.TS_Fert_times# * #NumberFormat(SESSION.TS_Fert_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.TS_Fert_total_all_costs = SESSION.TS_Fert_total_materials_cost+SESSION.TS_Fert_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Fert_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.TS_Fert_contract_price  =  #NumberFormat(SESSION.TS_Fert_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Fert_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">T&amp;S, Insect</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="TS_Insect_qty" type="text" id="TS_Insect_qty"   size="6"    value="#SESSION.TS_Insect_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Insect_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_Insect_rate" value="#SESSION.TS_Insect_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="TS_Insect_rate" type="text" id="TS_Insect_rate"   size="5"  value="#SESSION.TS_Insect_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Insect_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.TS_Insect_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Bifenthrin Tree &amp; Shrub Insecticide (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.TS_Insect_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.TS_Insect_MATERIALS_QTY_ACTUAL")  AND   SESSION.TS_Insect_materials_qty  NEQ SESSION.TS_Insect_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="TS_Insect_materials_qty" value="#SESSION.TS_Insect_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Insect_materials_qty" type="text" id="TS_Insect_materials_qty"   size="6"  value="#TRIM(SESSION.TS_Insect_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_Insect_materials_rate" value="#SESSION.TS_Insect_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_Insect_materials_rate" type="text" id="TS_Insect_rate"   size="5"  value="#SESSION.TS_Insect_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="TS_Insect_times" type="text" class="form_buttons" id="TS_Insect_times"  size="2"  value="#SESSION.TS_Insect_times#"/></td>
                    <CFSET SESSION.TS_Insect_total_labor_cost = #SESSION.TS_Insect_times# * #NumberFormat(SESSION.TS_Insect_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.TS_Insect_total_materials_cost = #SESSION.TS_Insect_times# * #NumberFormat(SESSION.TS_Insect_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.TS_Insect_total_all_costs = SESSION.TS_Insect_total_materials_cost+SESSION.TS_Insect_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_Insect_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.TS_Insect_contract_price  =  #NumberFormat(SESSION.TS_Insect_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_Insect_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">T&amp;S, Hort Oil</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="TS_hort_oil_qty" type="text" id="TS_hort_oil_qty"   size="6"    value="#SESSION.TS_hort_oil_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_hort_oil_rate,"999,999")#</td>
                      <input type="hidden"  name="TS_hort_oil_rate" value="#SESSION.TS_hort_oil_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="TS_hort_oil_rate" type="text" id="TS_hort_oil_rate"   size="5"  value="#SESSION.TS_hort_oil_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_hort_oil_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.TS_hort_oil_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Hort/Dormant Oil&nbsp; (oz)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.TS_hort_oil_materials_qty,"999,999.99")# 
                        <!---  <cfif  IsDefined("SESSION.TS_hort_oil_MATERIALS_QTY_ACTUAL")  AND   SESSION.TS_hort_oil_materials_qty  NEQ SESSION.TS_hort_oil_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="TS_hort_oil_materials_qty" value="#SESSION.TS_hort_oil_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_hort_oil_materials_qty" type="text" id="TS_hort_oil_materials_qty"   size="6"  value="#TRIM(SESSION.TS_hort_oil_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="TS_hort_oil_materials_rate" value="#SESSION.TS_hort_oil_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="TS_hort_oil_materials_rate" type="text" id="TS_hort_oil_rate"   size="5"  value="#SESSION.TS_hort_oil_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="TS_hort_oil_times" type="text" class="form_buttons" id="TS_hort_oil_times"  size="2"  value="#SESSION.TS_hort_oil_times#"/></td>
                    <CFSET SESSION.TS_hort_oil_total_labor_cost = #SESSION.TS_hort_oil_times# * #NumberFormat(SESSION.TS_hort_oil_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.TS_hort_oil_total_materials_cost = #SESSION.TS_hort_oil_times# * #NumberFormat(SESSION.TS_hort_oil_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.TS_hort_oil_total_all_costs = SESSION.TS_hort_oil_total_materials_cost+SESSION.TS_hort_oil_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.TS_hort_oil_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.TS_hort_oil_contract_price  =  #NumberFormat(SESSION.TS_hort_oil_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.TS_hort_oil_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, Pre</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Mulch_pre_qty" type="text" id="Mulch_pre_qty"   size="6"    value="#SESSION.Mulch_pre_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_pre_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_pre_rate" value="#SESSION.Mulch_pre_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Mulch_pre_rate" type="text" id="Mulch_pre_rate"   size="5"  value="#SESSION.Mulch_pre_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_pre_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Mulch_pre_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Bed Pre-emergent Granular (lb) </td>
                 <!---   <cfif NOT IsDefined("url.enter_materials_qty")>--->
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Mulch_pre_materials_qty,"999,999.99")#</td> 
                        <!---<cfif  IsDefined("SESSION.Mulch_pre_MATERIALS_QTY_ACTUAL")  AND   SESSION.Mulch_pre_materials_qty  NEQ SESSION.Mulch_pre_materials_qty_actual>
                          *
                      </cfif>--->
                    <input type="hidden"  name="Mulch_pre_materials_qty" value="#SESSION.Mulch_pre_materials_qty#"/>
                     <!--- <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_pre_materials_qty" type="text" id="Mulch_pre_materials_qty"   size="6"  value="#TRIM(SESSION.Mulch_pre_materials_qty)#"/></td>
                    </cfif> --->
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_pre_materials_rate" value="#SESSION.Mulch_pre_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_pre_materials_rate" type="text" id="Mulch_pre_rate"   size="5"  value="#SESSION.Mulch_pre_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Mulch_pre_times" type="text" class="form_buttons" id="Mulch_pre_times"  size="2"  value="#SESSION.Mulch_pre_times#"/></td>
                    <CFSET SESSION.Mulch_pre_total_labor_cost = #SESSION.Mulch_pre_times# * #NumberFormat(SESSION.Mulch_pre_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_pre_total_materials_cost = #SESSION.Mulch_pre_times# * #NumberFormat(SESSION.Mulch_pre_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_pre_total_all_costs = SESSION.Mulch_pre_total_materials_cost+SESSION.Mulch_pre_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_pre_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Mulch_pre_contract_price  =  #NumberFormat(SESSION.Mulch_pre_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_pre_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, Edging</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Mulch_edging_qty" type="text" id="Mulch_edging_qty"   size="6"    value="#SESSION.Mulch_edging_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_edging_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_edging_rate" value="#SESSION.Mulch_edging_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Mulch_edging_rate" type="text" id="Mulch_edging_rate"   size="5"  value="#SESSION.Mulch_edging_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">LF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_edging_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Mulch_edging_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_edging_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Mulch_edging_times" type="text" class="form_buttons" id="Mulch_edging_times"  size="2"  value="#SESSION.Mulch_edging_times#"/></td>
                    <CFSET SESSION.Mulch_edging_total_labor_cost = #SESSION.Mulch_edging_times# * #NumberFormat(SESSION.Mulch_edging_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_edging_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_edging_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_edging_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_edging_total_all_costs = SESSION.Mulch_edging_total_materials_cost+SESSION.Mulch_edging_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_edging_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_edging_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Mulch_edging_contract_price  =  #NumberFormat(SESSION.Mulch_edging_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_edging_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, S (dyed)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="mulch_s_dyed_qty" type="text" id="mulch_s_dyed_qty"   size="6"    value="#SESSION.mulch_s_dyed_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_s_dyed_rate,"999,999")#</td>
                      <input type="hidden"  name="mulch_s_dyed_rate" value="#SESSION.mulch_s_dyed_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="mulch_s_dyed_rate" type="text" id="mulch_s_dyed_rate"   size="5"  value="#SESSION.mulch_s_dyed_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_s_dyed_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.mulch_s_dyed_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Dyed Mulch (yds)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.mulch_s_dyed_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.mulch_s_dyed_MATERIALS_QTY_ACTUAL")  AND   SESSION.mulch_s_dyed_materials_qty  NEQ SESSION.mulch_s_dyed_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="mulch_s_dyed_materials_qty" value="#SESSION.mulch_s_dyed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_materials_qty" type="text" id="mulch_s_dyed_materials_qty"   size="6"  value="#TRIM(SESSION.mulch_s_dyed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="mulch_s_dyed_materials_rate" value="#SESSION.mulch_s_dyed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_materials_rate" type="text" id="mulch_s_dyed_rate"   size="5"  value="#SESSION.mulch_s_dyed_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="mulch_s_dyed_times" type="text" class="form_buttons" id="mulch_s_dyed_times"  size="2"  value="#SESSION.mulch_s_dyed_times#"/></td>
                    <CFSET SESSION.mulch_s_dyed_total_labor_cost = #SESSION.mulch_s_dyed_times# * #NumberFormat(SESSION.mulch_s_dyed_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.mulch_s_dyed_total_materials_cost = #SESSION.mulch_s_dyed_times# * #NumberFormat(SESSION.mulch_s_dyed_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.mulch_s_dyed_total_all_costs = SESSION.mulch_s_dyed_total_materials_cost+SESSION.mulch_s_dyed_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_s_dyed_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.mulch_s_dyed_contract_price  =  #NumberFormat(SESSION.mulch_s_dyed_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_s_dyed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, F (dyed)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="mulch_f_dyed_qty" type="text" id="mulch_f_dyed_qty"   size="6"    value="#SESSION.mulch_f_dyed_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_f_dyed_rate,"999,999")#</td>
                      <input type="hidden"  name="mulch_f_dyed_rate" value="#SESSION.mulch_f_dyed_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="mulch_f_dyed_rate" type="text" id="mulch_f_dyed_rate"   size="5"  value="#SESSION.mulch_f_dyed_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_f_dyed_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.mulch_f_dyed_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Dyed Mulch (yds)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.mulch_f_dyed_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.mulch_f_dyed_MATERIALS_QTY_ACTUAL")  AND   SESSION.mulch_f_dyed_materials_qty  NEQ SESSION.mulch_f_dyed_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="mulch_f_dyed_materials_qty" value="#SESSION.mulch_f_dyed_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_materials_qty" type="text" id="mulch_f_dyed_materials_qty"   size="6"  value="#TRIM(SESSION.mulch_f_dyed_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="mulch_f_dyed_materials_rate" value="#SESSION.mulch_f_dyed_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_materials_rate" type="text" id="mulch_f_dyed_rate"   size="5"  value="#SESSION.mulch_f_dyed_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="mulch_f_dyed_times" type="text" class="form_buttons" id="mulch_f_dyed_times"  size="2"  value="#SESSION.mulch_f_dyed_times#"/></td>
                    <CFSET SESSION.mulch_f_dyed_total_labor_cost = #SESSION.mulch_f_dyed_times# * #NumberFormat(SESSION.mulch_f_dyed_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.mulch_f_dyed_total_materials_cost = #SESSION.mulch_f_dyed_times# * #NumberFormat(SESSION.mulch_f_dyed_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.mulch_f_dyed_total_all_costs = SESSION.mulch_f_dyed_total_materials_cost+SESSION.mulch_f_dyed_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.mulch_f_dyed_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.mulch_f_dyed_contract_price  =  #NumberFormat(SESSION.mulch_f_dyed_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.mulch_f_dyed_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, S (reg)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Mulch_S_Reg_qty" type="text" id="Mulch_S_Reg_qty"   size="6"    value="#SESSION.Mulch_S_Reg_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_S_Reg_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_S_Reg_rate" value="#SESSION.Mulch_S_Reg_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Mulch_S_Reg_rate" type="text" id="Mulch_S_Reg_rate"   size="5"  value="#SESSION.Mulch_S_Reg_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_S_Reg_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Mulch_S_Reg_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Non-Dyed Mulch (yds)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Mulch_S_Reg_materials_qty,"999,999.99")# 
                        <!---  <cfif  IsDefined("SESSION.Mulch_S_Reg_MATERIALS_QTY_ACTUAL")  AND   SESSION.Mulch_S_Reg_materials_qty  NEQ SESSION.Mulch_S_Reg_materials_qty_actual>
                          *
                      </cfif---></td>
                      <input type="hidden"  name="Mulch_S_Reg_materials_qty" value="#SESSION.Mulch_S_Reg_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_materials_qty" type="text" id="Mulch_S_Reg_materials_qty"   size="6"  value="#TRIM(SESSION.Mulch_S_Reg_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_S_Reg_materials_rate" value="#SESSION.Mulch_S_Reg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_materials_rate" type="text" id="Mulch_S_Reg_rate"   size="5"  value="#SESSION.Mulch_S_Reg_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Mulch_S_Reg_times" type="text" class="form_buttons" id="Mulch_S_Reg_times"  size="2"  value="#SESSION.Mulch_S_Reg_times#"/></td>
                    <CFSET SESSION.Mulch_S_Reg_total_labor_cost = #SESSION.Mulch_S_Reg_times# * #NumberFormat(SESSION.Mulch_S_Reg_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_S_Reg_total_materials_cost = #SESSION.Mulch_S_Reg_times# * #NumberFormat(SESSION.Mulch_S_Reg_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_S_Reg_total_all_costs = SESSION.Mulch_S_Reg_total_materials_cost+SESSION.Mulch_S_Reg_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_S_Reg_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Mulch_S_Reg_contract_price  =  #NumberFormat(SESSION.Mulch_S_Reg_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_S_Reg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Mulch, F&nbsp;(reg)</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Mulch_F_Reg_qty" type="text" id="Mulch_F_Reg_qty"   size="6"    value="#SESSION.Mulch_F_Reg_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_F_Reg_rate,"999,999")#</td>
                      <input type="hidden"  name="Mulch_F_Reg_rate" value="#SESSION.Mulch_F_Reg_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Mulch_F_Reg_rate" type="text" id="Mulch_F_Reg_rate"   size="5"  value="#SESSION.Mulch_F_Reg_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_F_Reg_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Mulch_F_Reg_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Non-Dyed Mulch (yds)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Mulch_F_Reg_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.Mulch_F_Reg_MATERIALS_QTY_ACTUAL")  AND   SESSION.Mulch_F_Reg_materials_qty  NEQ SESSION.Mulch_F_Reg_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Mulch_F_Reg_materials_qty" value="#SESSION.Mulch_F_Reg_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_materials_qty" type="text" id="Mulch_F_Reg_materials_qty"   size="6"  value="#TRIM(SESSION.Mulch_F_Reg_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Mulch_F_Reg_materials_rate" value="#SESSION.Mulch_F_Reg_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_materials_rate" type="text" id="Mulch_F_Reg_rate"   size="5"  value="#SESSION.Mulch_F_Reg_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Mulch_F_Reg_times" type="text" class="form_buttons" id="Mulch_F_Reg_times"  size="2"  value="#SESSION.Mulch_F_Reg_times#"/></td>
                    <CFSET SESSION.Mulch_F_Reg_total_labor_cost = #SESSION.Mulch_F_Reg_times# * #NumberFormat(SESSION.Mulch_F_Reg_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_F_Reg_total_materials_cost = #SESSION.Mulch_F_Reg_times# * #NumberFormat(SESSION.Mulch_F_Reg_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Mulch_F_Reg_total_all_costs = SESSION.Mulch_F_Reg_total_materials_cost+SESSION.Mulch_F_Reg_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Mulch_F_Reg_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Mulch_F_Reg_contract_price  =  #NumberFormat(SESSION.Mulch_F_Reg_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Mulch_F_Reg_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Playground Mulch</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Playground_mulch_qty" type="text" id="Playground_mulch_qty"   size="6"    value="#SESSION.Playground_mulch_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Playground_mulch_rate,"999,999")#</td>
                      <input type="hidden"  name="Playground_mulch_rate" value="#SESSION.Playground_mulch_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Playground_mulch_rate" type="text" id="Playground_mulch_rate"   size="5"  value="#SESSION.Playground_mulch_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Playground_mulch_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Playground_mulch_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Dyed Mulch (yds)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Playground_mulch_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.Playground_mulch_MATERIALS_QTY_ACTUAL")  AND   SESSION.Playground_mulch_materials_qty  NEQ SESSION.Playground_mulch_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Playground_mulch_materials_qty" value="#SESSION.Playground_mulch_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Playground_mulch_materials_qty" type="text" id="Playground_mulch_materials_qty"   size="6"  value="#TRIM(SESSION.Playground_mulch_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Playground_mulch_materials_rate" value="#SESSION.Playground_mulch_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Playground_mulch_materials_rate" type="text" id="Playground_mulch_rate"   size="5"  value="#SESSION.Playground_mulch_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Playground_mulch_times" type="text" class="form_buttons" id="Playground_mulch_times"  size="2"  value="#SESSION.Playground_mulch_times#"/></td>
                    <CFSET SESSION.Playground_mulch_total_labor_cost = #SESSION.Playground_mulch_times# * #NumberFormat(SESSION.Playground_mulch_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Playground_mulch_total_materials_cost = #SESSION.Playground_mulch_times# * #NumberFormat(SESSION.Playground_mulch_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Playground_mulch_total_all_costs = SESSION.Playground_mulch_total_materials_cost+SESSION.Playground_mulch_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Playground_mulch_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Playground_mulch_contract_price  =  #NumberFormat(SESSION.Playground_mulch_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Playground_mulch_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Pine Tags</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Pine_Tags_qty" type="text" id="Pine_Tags_qty"   size="6"    value="#SESSION.Pine_Tags_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pine_Tags_rate,"999,999")#</td>
                      <input type="hidden"  name="Pine_Tags_rate" value="#SESSION.Pine_Tags_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Pine_Tags_rate" type="text" id="Pine_Tags_rate"   size="5"  value="#SESSION.Pine_Tags_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pine_Tags_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Pine_Tags_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Pine Tags (bales)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Pine_Tags_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.Pine_Tags_MATERIALS_QTY_ACTUAL")  AND   SESSION.Pine_Tags_materials_qty  NEQ SESSION.Pine_Tags_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Pine_Tags_materials_qty" value="#SESSION.Pine_Tags_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pine_Tags_materials_qty" type="text" id="Pine_Tags_materials_qty"   size="6"  value="#TRIM(SESSION.Pine_Tags_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Pine_Tags_materials_rate" value="#SESSION.Pine_Tags_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Pine_Tags_materials_rate" type="text" id="Pine_Tags_rate"   size="5"  value="#SESSION.Pine_Tags_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Pine_Tags_times" type="text" class="form_buttons" id="Pine_Tags_times"  size="2"  value="#SESSION.Pine_Tags_times#"/></td>
                    <CFSET SESSION.Pine_Tags_total_labor_cost = #SESSION.Pine_Tags_times# * #NumberFormat(SESSION.Pine_Tags_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Pine_Tags_total_materials_cost = #SESSION.Pine_Tags_times# * #NumberFormat(SESSION.Pine_Tags_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Pine_Tags_total_all_costs = SESSION.Pine_Tags_total_materials_cost+SESSION.Pine_Tags_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pine_Tags_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Pine_Tags_contract_price  =  #NumberFormat(SESSION.Pine_Tags_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pine_Tags_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Annuals, S</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Annuals_S_qty" type="text" id="Annuals_S_qty"   size="6"    value="#SESSION.Annuals_S_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_S_rate,"999,999")#</td>
                      <input type="hidden"  name="Annuals_S_rate" value="#SESSION.Annuals_S_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Annuals_S_rate" type="text" id="Annuals_S_rate"   size="5"  value="#SESSION.Annuals_S_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">Pots</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_S_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Annuals_S_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Flowers (6&quot; pots)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Annuals_S_materials_qty,"999,999.99")# 
                        <!---<cfif  IsDefined("SESSION.Annuals_S_MATERIALS_QTY_ACTUAL")  AND   SESSION.Annuals_S_materials_qty  NEQ SESSION.Annuals_S_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Annuals_S_materials_qty" value="#SESSION.Annuals_S_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_S_materials_qty" type="text" id="Annuals_S_materials_qty"   size="6"  value="#TRIM(SESSION.Annuals_S_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_S_materials_rate" value="#SESSION.Annuals_S_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_S_materials_rate" type="text" id="Annuals_S_rate"   size="5"  value="#SESSION.Annuals_S_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Annuals_S_times" type="text" class="form_buttons" id="Annuals_S_times"  size="2"  value="#SESSION.Annuals_S_times#"/></td>
                    <CFSET SESSION.Annuals_S_total_labor_cost = #SESSION.Annuals_S_times# * #NumberFormat(SESSION.Annuals_S_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Annuals_S_total_materials_cost = #SESSION.Annuals_S_times# * #NumberFormat(SESSION.Annuals_S_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Annuals_S_total_all_costs = SESSION.Annuals_S_total_materials_cost+SESSION.Annuals_S_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_S_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Annuals_S_contract_price  =  #NumberFormat(SESSION.Annuals_S_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_S_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Annuals, F</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Annuals_F_qty" type="text" id="Annuals_F_qty"   size="6"    value="#SESSION.Annuals_F_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_F_rate,"999,999")#</td>
                      <input type="hidden"  name="Annuals_F_rate" value="#SESSION.Annuals_F_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Annuals_F_rate" type="text" id="Annuals_F_rate"   size="5"  value="#SESSION.Annuals_F_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">Pots</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_F_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Annuals_F_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">Flowers (6&quot; pots)</td>
                    <cfif NOT IsDefined("url.enter_materials_qty")>
                      <td align="left" nowrap="nowrap">#NumberFormat(SESSION.Annuals_F_materials_qty,"999,999.99")# 
                        <!--- <cfif  IsDefined("SESSION.Annuals_F_MATERIALS_QTY_ACTUAL")  AND   SESSION.Annuals_F_materials_qty  NEQ SESSION.Annuals_F_materials_qty_actual>
                          *
                      </cfif>---></td>
                      <input type="hidden"  name="Annuals_F_materials_qty" value="#SESSION.Annuals_F_materials_qty#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_F_materials_qty" type="text" id="Annuals_F_materials_qty"   size="6"  value="#TRIM(SESSION.Annuals_F_materials_qty)#"/></td>
                    </cfif>
                    <cfif NOT IsDefined("url.enter_materials_rate")>
                      <td align="left" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_materials_rate,"999,999.99")#</td>
                      <input type="hidden"  name="Annuals_F_materials_rate" value="#SESSION.Annuals_F_materials_rate#"/>
                      <cfelse>
                      <td align="left" nowrap="nowrap"><input name="Annuals_F_materials_rate" type="text" id="Annuals_F_rate"   size="5"  value="#SESSION.Annuals_F_materials_rate#"/></td>
                    </cfif>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_materials_actualprice,"999.99")#</td>
                    <td align="left" nowrap="nowrap"><input name="Annuals_F_times" type="text" class="form_buttons" id="Annuals_F_times"  size="2"  value="#SESSION.Annuals_F_times#"/></td>
                    <CFSET SESSION.Annuals_F_total_labor_cost = #SESSION.Annuals_F_times# * #NumberFormat(SESSION.Annuals_F_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Annuals_F_total_materials_cost = #SESSION.Annuals_F_times# * #NumberFormat(SESSION.Annuals_F_materials_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Annuals_F_total_all_costs = SESSION.Annuals_F_total_materials_cost+SESSION.Annuals_F_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_total_all_costs,"999,999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Annuals_F_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Annuals_F_contract_price  =  #NumberFormat(SESSION.Annuals_F_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Annuals_F_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Irrigation, SU</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Irrigation_SU_qty" type="text" id="Irrigation_SU_qty"   size="6"    value="#SESSION.Irrigation_SU_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_SU_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_SU_rate" value="#SESSION.Irrigation_SU_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Irrigation_SU_rate" type="text" id="Irrigation_SU_rate"   size="5"  value="#SESSION.Irrigation_SU_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_SU_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Irrigation_SU_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_SU_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Irrigation_SU_times" type="text" class="form_buttons" id="Irrigation_SU_times"  size="2"  value="#SESSION.Irrigation_SU_times#"/></td>
                    <CFSET SESSION.Irrigation_SU_total_labor_cost = #SESSION.Irrigation_SU_times# * #NumberFormat(SESSION.Irrigation_SU_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_SU_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_SU_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_SU_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_SU_total_all_costs = SESSION.Irrigation_SU_total_materials_cost+SESSION.Irrigation_SU_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_SU_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_SU_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Irrigation_SU_contract_price  =  #NumberFormat(SESSION.Irrigation_SU_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_SU_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Irrigation, W</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Irrigation_W_qty" type="text" id="Irrigation_W_qty"   size="6"    value="#SESSION.Irrigation_W_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_W_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_W_rate" value="#SESSION.Irrigation_W_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Irrigation_W_rate" type="text" id="Irrigation_W_rate"   size="5"  value="#SESSION.Irrigation_W_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR </td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_W_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Irrigation_W_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_W_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Irrigation_W_times" type="text" class="form_buttons" id="Irrigation_W_times"  size="2"  value="#SESSION.Irrigation_W_times#"/></td>
                    <CFSET SESSION.Irrigation_W_total_labor_cost = #SESSION.Irrigation_W_times# * #NumberFormat(SESSION.Irrigation_W_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_W_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_W_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_W_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_W_total_all_costs = SESSION.Irrigation_W_total_materials_cost+SESSION.Irrigation_W_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_W_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_W_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Irrigation_W_contract_price  =  #NumberFormat(SESSION.Irrigation_W_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_W_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Irrigation, I</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Irrigation_I_qty" type="text" id="Irrigation_I_qty"   size="6"    value="#SESSION.Irrigation_I_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_I_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_I_rate" value="#SESSION.Irrigation_I_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Irrigation_I_rate" type="text" id="Irrigation_I_rate"   size="5"  value="#SESSION.Irrigation_I_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_I_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Irrigation_I_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_I_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Irrigation_I_times" type="text" class="form_buttons" id="Irrigation_I_times"  size="2"  value="#SESSION.Irrigation_I_times#"/></td>
                    <CFSET SESSION.Irrigation_I_total_labor_cost = #SESSION.Irrigation_I_times# * #NumberFormat(SESSION.Irrigation_I_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_I_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_I_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_I_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_I_total_all_costs = SESSION.Irrigation_I_total_materials_cost+SESSION.Irrigation_I_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_I_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_I_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Irrigation_I_contract_price  =  #NumberFormat(SESSION.Irrigation_I_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_I_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Irrigation,TM</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Irrigation_TM_qty" type="text" id="Irrigation_TM_qty"   size="6"    value="#SESSION.Irrigation_TM_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_TM_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_TM_rate" value="#SESSION.Irrigation_TM_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Irrigation_TM_rate" type="text" id="Irrigation_TM_rate"   size="5"  value="#SESSION.Irrigation_TM_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_TM_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Irrigation_TM_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_TM_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Irrigation_TM_times" type="text" class="form_buttons" id="Irrigation_TM_times"  size="2"  value="#SESSION.Irrigation_TM_times#"/></td>
                    <CFSET SESSION.Irrigation_TM_total_labor_cost = #SESSION.Irrigation_TM_times# * #NumberFormat(SESSION.Irrigation_TM_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_TM_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_TM_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_TM_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_TM_total_all_costs = SESSION.Irrigation_TM_total_materials_cost+SESSION.Irrigation_TM_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_TM_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_TM_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Irrigation_TM_contract_price  =  #NumberFormat(SESSION.Irrigation_TM_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_TM_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Irrigation, BFI</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Irrigation_BFI_qty" type="text" id="Irrigation_BFI_qty"   size="6"    value="#SESSION.Irrigation_BFI_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_BFI_rate,"999,999")#</td>
                      <input type="hidden"  name="Irrigation_BFI_rate" value="#SESSION.Irrigation_BFI_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Irrigation_BFI_rate" type="text" id="Irrigation_BFI_rate"   size="5"  value="#SESSION.Irrigation_BFI_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_BFI_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Irrigation_BFI_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_BFI_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Irrigation_BFI_times" type="text" class="form_buttons" id="Irrigation_BFI_times"  size="2"  value="#SESSION.Irrigation_BFI_times#"/></td>
                    <CFSET SESSION.Irrigation_BFI_total_labor_cost = #SESSION.Irrigation_BFI_times# * #NumberFormat(SESSION.Irrigation_BFI_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_BFI_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_BFI_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_BFI_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Irrigation_BFI_total_all_costs = SESSION.Irrigation_BFI_total_materials_cost+SESSION.Irrigation_BFI_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_BFI_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_BFI_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Irrigation_BFI_contract_price  =  #NumberFormat(SESSION.Irrigation_BFI_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_BFI_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Pond Maint.</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Pond_Maint_qty" type="text" id="Pond_Maint_qty"   size="6"    value="#SESSION.Pond_Maint_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pond_Maint_rate,"999,999")#</td>
                      <input type="hidden"  name="Pond_Maint_rate" value="#SESSION.Pond_Maint_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Pond_Maint_rate" type="text" id="Pond_Maint_rate"   size="5"  value="#SESSION.Pond_Maint_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pond_Maint_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Pond_Maint_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pond_Maint_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Pond_Maint_times" type="text" class="form_buttons" id="Pond_Maint_times"  size="2"  value="#SESSION.Pond_Maint_times#"/></td>
                    <CFSET SESSION.Pond_Maint_total_labor_cost = #SESSION.Pond_Maint_times# * #NumberFormat(SESSION.Pond_Maint_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pond_Maint_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Pond_Maint_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pond_Maint_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Pond_Maint_total_all_costs = SESSION.Pond_Maint_total_materials_cost+SESSION.Pond_Maint_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pond_Maint_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Pond_Maint_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Pond_Maint_contract_price  =  #NumberFormat(SESSION.Pond_Maint_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Pond_Maint_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trim, Hillside</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trim_Hillside_qty" type="text" id="Trim_Hillside_qty"   size="6"    value="#SESSION.Trim_Hillside_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trim_Hillside_rate,"999,999")#</td>
                      <input type="hidden"  name="Trim_Hillside_rate" value="#SESSION.Trim_Hillside_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trim_Hillside_rate" type="text" id="Trim_Hillside_rate"   size="5"  value="#SESSION.Trim_Hillside_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trim_Hillside_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trim_Hillside_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trim_Hillside_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Trim_Hillside_times" type="text" class="form_buttons" id="Trim_Hillside_times"  size="2"  value="#SESSION.Trim_Hillside_times#"/></td>
                    <CFSET SESSION.Trim_Hillside_total_labor_cost = #SESSION.Trim_Hillside_times# * #NumberFormat(SESSION.Trim_Hillside_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trim_Hillside_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Trim_Hillside_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trim_Hillside_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Trim_Hillside_total_all_costs = SESSION.Trim_Hillside_total_materials_cost+SESSION.Trim_Hillside_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trim_Hillside_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trim_Hillside_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Trim_Hillside_contract_price  =  #NumberFormat(SESSION.Trim_Hillside_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trim_Hillside_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Addt'l. Mowing</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Addtl_Mowing_qty" type="text" id="Addtl_Mowing_qty"   size="6"    value="#SESSION.Addtl_Mowing_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Addtl_Mowing_rate,"999,999")#</td>
                      <input type="hidden"  name="Addtl_Mowing_rate" value="#SESSION.Addtl_Mowing_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Addtl_Mowing_rate" type="text" id="Addtl_Mowing_rate"   size="5"  value="#SESSION.Addtl_Mowing_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Addtl_Mowing_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Addtl_Mowing_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Addtl_Mowing_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Addtl_Mowing_times" type="text" class="form_buttons" id="Addtl_Mowing_times"  size="2"  value="#SESSION.Addtl_Mowing_times#"/></td>
                    <CFSET SESSION.Addtl_Mowing_total_labor_cost = #SESSION.Addtl_Mowing_times# * #NumberFormat(SESSION.Addtl_Mowing_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Addtl_Mowing_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Addtl_Mowing_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Addtl_Mowing_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Addtl_Mowing_total_all_costs = SESSION.Addtl_Mowing_total_materials_cost+SESSION.Addtl_Mowing_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Addtl_Mowing_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Addtl_Mowing_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Addtl_Mowing_contract_price  =  #NumberFormat(SESSION.Addtl_Mowing_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Addtl_Mowing_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Day Porter</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Day_Porter_qty" type="text" id="Day_Porter_qty"   size="6"    value="#SESSION.Day_Porter_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Day_Porter_rate,"999,999")#</td>
                      <input type="hidden"  name="Day_Porter_rate" value="#SESSION.Day_Porter_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Day_Porter_rate" type="text" id="Day_Porter_rate"   size="5"  value="#SESSION.Day_Porter_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Day_Porter_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Day_Porter_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Day_Porter_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Day_Porter_times" type="text" class="form_buttons" id="Day_Porter_times"  size="2"  value="#SESSION.Day_Porter_times#"/></td>
                    <CFSET SESSION.Day_Porter_total_labor_cost = #SESSION.Day_Porter_times# * #NumberFormat(SESSION.Day_Porter_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Day_Porter_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Day_Porter_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Day_Porter_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Day_Porter_total_all_costs = SESSION.Day_Porter_total_materials_cost+SESSION.Day_Porter_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Day_Porter_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Day_Porter_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Day_Porter_contract_price  =  #NumberFormat(SESSION.Day_Porter_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Day_Porter_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Bush Hog</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Bush_Hog_qty" type="text" id="Bush_Hog_qty"   size="6"    value="#SESSION.Bush_Hog_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Bush_Hog_rate,"999,999")#</td>
                      <input type="hidden"  name="Bush_Hog_rate" value="#SESSION.Bush_Hog_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Bush_Hog_rate" type="text" id="Bush_Hog_rate"   size="5"  value="#SESSION.Bush_Hog_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">SF</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Bush_Hog_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Bush_Hog_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Bush_Hog_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Bush_Hog_times" type="text" class="form_buttons" id="Bush_Hog_times"  size="2"  value="#SESSION.Bush_Hog_times#"/></td>
                    <CFSET SESSION.Bush_Hog_total_labor_cost = #SESSION.Bush_Hog_times# * #NumberFormat(SESSION.Bush_Hog_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Bush_Hog_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Bush_Hog_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Bush_Hog_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Bush_Hog_total_all_costs = SESSION.Bush_Hog_total_materials_cost+SESSION.Bush_Hog_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Bush_Hog_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Bush_Hog_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Bush_Hog_contract_price  =  #NumberFormat(SESSION.Bush_Hog_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Bush_Hog_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Trail Maint</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trail_Maint_qty" type="text" id="Trail_Maint_qty"   size="6"    value="#SESSION.Trail_Maint_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trail_Maint_rate,"999,999")#</td>
                      <input type="hidden"  name="Trail_Maint_rate" value="#SESSION.Trail_Maint_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trail_Maint_rate" type="text" id="Trail_Maint_rate"   size="5"  value="#SESSION.Trail_Maint_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trail_Maint_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trail_Maint_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trail_Maint_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Trail_Maint_times" type="text" class="form_buttons" id="Trail_Maint_times"  size="2"  value="#SESSION.Trail_Maint_times#"/></td>
                    <CFSET SESSION.Trail_Maint_total_labor_cost = #SESSION.Trail_Maint_times# * #NumberFormat(SESSION.Trail_Maint_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trail_Maint_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Trail_Maint_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trail_Maint_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Trail_Maint_total_all_costs = SESSION.Trail_Maint_total_materials_cost+SESSION.Trail_Maint_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trail_Maint_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trail_Maint_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Trail_Maint_contract_price  =  #NumberFormat(SESSION.Trail_Maint_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trail_Maint_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Natural Area</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Natural_Area_qty" type="text" id="Natural_Area_qty"   size="6"    value="#SESSION.Natural_Area_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Natural_Area_rate,"999,999")#</td>
                      <input type="hidden"  name="Natural_Area_rate" value="#SESSION.Natural_Area_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Natural_Area_rate" type="text" id="Natural_Area_rate"   size="5"  value="#SESSION.Natural_Area_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Natural_Area_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Natural_Area_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Natural_Area_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Natural_Area_times" type="text" class="form_buttons" id="Natural_Area_times"  size="2"  value="#SESSION.Natural_Area_times#"/></td>
                    <CFSET SESSION.Natural_Area_total_labor_cost = #SESSION.Natural_Area_times# * #NumberFormat(SESSION.Natural_Area_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Natural_Area_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Natural_Area_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Natural_Area_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Natural_Area_total_all_costs = SESSION.Natural_Area_total_materials_cost+SESSION.Natural_Area_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Natural_Area_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Natural_Area_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Natural_Area_contract_price  =  #NumberFormat(SESSION.Natural_Area_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Natural_Area_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td   nowrap="nowrap">Trash Rec./Dog Station</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Trash_Receptacle_qty" type="text" id="Trash_Receptacle_qty"   size="6"    value="#SESSION.Trash_Receptacle_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_Receptacle_rate,"999,999")#</td>
                      <input type="hidden"  name="Trash_Receptacle_rate" value="#SESSION.Trash_Receptacle_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Trash_Receptacle_rate" type="text" id="Trash_Receptacle_rate"   size="5"  value="#SESSION.Trash_Receptacle_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">HR</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_Receptacle_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Trash_Receptacle_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_Receptacle_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Trash_Receptacle_times" type="text" class="form_buttons" id="Trash_Receptacle_times"  size="2"  value="#SESSION.Trash_Receptacle_times#"/></td>
                    <CFSET SESSION.Trash_Receptacle_total_labor_cost = #SESSION.Trash_Receptacle_times# * #NumberFormat(SESSION.Trash_Receptacle_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_Receptacle_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_Receptacle_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_Receptacle_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Trash_Receptacle_total_all_costs = SESSION.Trash_Receptacle_total_materials_cost+SESSION.Trash_Receptacle_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_Receptacle_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Trash_Receptacle_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.gross_margin,"999,999.999")#%</td>
                    <cfset SESSION.Trash_Receptacle_contract_price  =  #NumberFormat(SESSION.Trash_Receptacle_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Trash_Receptacle_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap">Lot Sweeping</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Lot_Sweeping_qty" type="text" id="Lot_Sweeping_qty"   size="6"    value="#SESSION.Lot_Sweeping_qty#"/></td>
                    <cfif NOT IsDefined("url.enter_service_rate")>
                      <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Lot_Sweeping_rate,"999,999")#</td>
                      <input type="hidden"  name="Lot_Sweeping_rate" value="#SESSION.Lot_Sweeping_rate#"/>
                      <cfelse>
                      <td align="right" nowrap="nowrap"><input name="Lot_Sweeping_rate" type="text" id="Lot_Sweeping_rate"   size="5"  value="#SESSION.Lot_Sweeping_rate#"/></td>
                    </cfif>
                    <td align="center" nowrap="nowrap">MO</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Lot_Sweeping_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$#SESSION.Lot_Sweeping_cost#</td>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Lot_Sweeping_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Lot_Sweeping_times" type="text" class="form_buttons" id="Lot_Sweeping_times"  size="2"  value="#SESSION.Lot_Sweeping_times#"/></td>
                    <CFSET SESSION.Lot_Sweeping_total_labor_cost = #SESSION.Lot_Sweeping_times# * #NumberFormat(SESSION.Lot_Sweeping_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Lot_Sweeping_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Lot_Sweeping_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Lot_Sweeping_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Lot_Sweeping_total_all_costs = SESSION.Lot_Sweeping_total_materials_cost+SESSION.Lot_Sweeping_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Lot_Sweeping_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Lot_Sweeping_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap"><input name="Lot_Sweeping_gm" type="text"   size="3" value="#SESSION.Lot_Sweeping_gm#"/>
                      %</td>
                    <cfset SESSION.Lot_Sweeping_contract_price  =  #NumberFormat(SESSION.Lot_Sweeping_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff_lot_sweeping,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Lot_Sweeping_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap"><input name="Blank1_service"  type="text" id="Blank1_service"   size="20"      value="#SESSION.Blank1_service#"/></td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Blank1_qty" type="text" id="Blank1_qty"   size="6"    value="#SESSION.Blank1_qty#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank1_rate" type="text" id="Blank1_rate"   size="5"  value="#SESSION.Blank1_rate#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank1_unit" type="text" id="Blank1_unit"   size="5"    value="#SESSION.Blank1_unit#"/></td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank1_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$
                      <input name="Blank1_cost" type="text" id="Blank1_cost"   size="5"  value="#SESSION.Blank1_cost#"/></td>
                    <td align="right"  nowrap="nowrap">$#NumberFormat(SESSION.Blank1_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Blank1_times" type="text" class="form_buttons" id="Blank1_times"  size="2"  value="#SESSION.Blank1_times#"/></td>
                    <CFSET SESSION.Blank1_total_labor_cost = #SESSION.Blank1_times# * #NumberFormat(SESSION.Blank1_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank1_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Blank1_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank1_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Blank1_total_all_costs = SESSION.Blank1_total_materials_cost+SESSION.Blank1_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank1_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank1_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap"><input name="Blank1_gm" type="text"   size="3" value="#SESSION.Blank1_gm#"/>
                      %</td>
                    <cfset SESSION.Blank1_contract_price  =  #NumberFormat(SESSION.Blank1_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff_Blank1,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank1_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap"><input name="Blank2_service"  type="text" id="Blank2_service"   size="20"      value="#SESSION.Blank2_service#"/></td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Blank2_qty" type="text" id="Blank2_qty"   size="6"    value="#SESSION.Blank2_qty#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank2_rate" type="text" id="Blank2_rate"   size="5"  value="#SESSION.Blank2_rate#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank2_unit" type="text" id="Blank2_unit"   size="5"    value="#SESSION.Blank2_unit#"/></td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank2_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$
                      <input name="Blank2_cost" type="text" id="Blank2_cost"   size="5"  value="#SESSION.Blank2_cost#"/></td>
                    <td align="right"  nowrap="nowrap">$#NumberFormat(SESSION.Blank2_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Blank2_times" type="text" class="form_buttons" id="Blank2_times"  size="2"  value="#SESSION.Blank2_times#"/></td>
                    <CFSET SESSION.Blank2_total_labor_cost = #SESSION.Blank2_times# * #NumberFormat(SESSION.Blank2_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank2_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Blank2_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank2_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Blank2_total_all_costs = SESSION.Blank2_total_materials_cost+SESSION.Blank2_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank2_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank2_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap"><input name="Blank2_gm" type="text"   size="3" value="#SESSION.Blank2_gm#"/>
                      %</td>
                    <cfset SESSION.Blank2_contract_price  =  #NumberFormat(SESSION.Blank2_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff_Blank2,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank2_contract_price,"999,999.99")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td nowrap="nowrap"><input name="Blank3_service"  type="text" id="Blank3_service"   size="20"      value="#SESSION.Blank3_service#"/></td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><input name="Blank3_qty" type="text" id="Blank3_qty"   size="6"    value="#SESSION.Blank3_qty#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank3_rate" type="text" id="Blank3_rate"   size="5"  value="#SESSION.Blank3_rate#"/></td>
                    <td align="right" nowrap="nowrap"><input name="Blank3_unit" type="text" id="Blank3_unit"   size="5"    value="#SESSION.Blank3_unit#"/></td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank3_hours,"999.9")#</td>
                    <td align="right" nowrap="nowrap">$
                      <input name="Blank3_cost" type="text" id="Blank3_cost"   size="5"  value="#SESSION.Blank3_cost#"/></td>
                    <td align="right"  nowrap="nowrap">$#NumberFormat(SESSION.Blank3_actualprice,"999.99")#</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><input name="Blank3_times" type="text" class="form_buttons" id="Blank3_times"  size="2"  value="#SESSION.Blank3_times#"/></td>
                    <CFSET SESSION.Blank3_total_labor_cost = #SESSION.Blank3_times# * #NumberFormat(SESSION.Blank3_actualprice,"999.99")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank3_total_labor_cost,"999.99")#</td>
                    <CFSET SESSION.Blank3_total_materials_cost = 0>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank3_total_materials_cost,"999.99")#</td>
                    <CFSET SESSION.Blank3_total_all_costs = SESSION.Blank3_total_materials_cost+SESSION.Blank3_total_labor_cost>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank3_total_all_costs,"999,999.99")#</td>
                    <td align="right" nowrap="nowrap">#NumberFormat(SESSION.Blank3_total_hours,"9,999.9")#</td>
                    <td align="right" nowrap="nowrap"><input name="Blank3_gm" type="text"   size="3" value="#SESSION.Blank3_gm#"/>
                      %</td>
                    <cfset SESSION.Blank3_contract_price  =  #NumberFormat(SESSION.Blank3_total_all_costs,"999999999.99")#/#NumberFormat(SESSION.gross_margin_diff_Blank3,"999999.999")#>
                    <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Blank3_contract_price,"999,999.99")#</td>
                  </tr>
                  <cfset SESSION.total_labor_cost = 
SESSION.push_mow_total_labor_cost 
  +  SESSION.walk_behind_total_labor_cost 
  +  SESSION.ride_mow_total_labor_cost
  +  SESSION.hard_edge_total_labor_cost
  +  SESSION.bed_edge_total_labor_cost
  +  SESSION.TRIM_O_total_labor_cost
  +  SESSION.TRIM_S_total_labor_cost
  +  SESSION.spraying_total_labor_cost
  +  SESSION.weeding_total_labor_cost
  +  SESSION.blowing_total_labor_cost
  +  SESSION.Trash_S_total_labor_cost
  +  SESSION.traveltime_total_labor_cost
  +  SESSION.Trash_O_total_labor_cost
  +  SESSION.leafrem_total_labor_cost
  +  SESSION.cleanup_total_labor_cost
  +  SESSION.turf_preg_total_labor_cost 
  +  SESSION.turf_prel_total_labor_cost 
  +  SESSION.turf_post_total_labor_cost
  +  SESSION.turf_fert_total_labor_cost
  +  SESSION.turf_lime_total_labor_cost
  +  SESSION.Turf_Aer_H_total_labor_cost
  +  SESSION.Turf_Aer_T_total_labor_cost
  +  SESSION.Turf_Seed_total_labor_cost
  +  SESSION.Pruning_TP_total_labor_cost
  +  SESSION.Pruning_S_total_labor_cost
  +  SESSION.TS_Fert_total_labor_cost
  +  SESSION.TS_Insect_total_labor_cost
  +  SESSION.Annuals_S_total_labor_cost
  +  SESSION.Annuals_F_total_labor_cost
  +  SESSION.Irrigation_SU_total_labor_cost
  +  SESSION.Irrigation_W_total_labor_cost
  +  SESSION.Irrigation_I_total_labor_cost
  +  SESSION.Mulch_F_Reg_total_labor_cost 
  +  SESSION.Mulch_S_Reg_total_labor_cost 
  +  SESSION.mulch_s_dyed_total_labor_cost 
  +  SESSION.mulch_f_dyed_total_labor_cost 
  +  SESSION.mulch_edging_total_labor_cost
  +  SESSION.mulch_pre_total_labor_cost
  +  SESSION.Pond_maint_total_labor_cost 
  +  SESSION.Trim_Hillside_total_labor_cost  
  +  SESSION.Pine_Tags_total_labor_cost 
  +  SESSION.TS_hort_oil_total_labor_cost 
  +  SESSION.Addtl_Mowing_total_labor_cost 
  +  SESSION.Day_Porter_total_labor_cost 
  +  SESSION.Bush_Hog_total_labor_cost 
  +  SESSION.Lot_Sweeping_total_labor_cost 
  +  SESSION.Trail_Maint_total_labor_cost 
  +  SESSION.Irrigation_TM_total_labor_cost 
  +  SESSION.Irrigation_BFI_total_labor_cost 
  +  SESSION.Natural_Area_total_labor_cost 
  +  SESSION.Trash_Receptacle_total_labor_cost
  +  SESSION.Playground_mulch_total_labor_cost
  +  SESSION.Turf_Nutsedge_total_labor_cost
  +  SESSION.Turf_Fungicide_total_labor_cost
  +  SESSION.Turf_Insecticide_total_labor_cost
  +  SESSION.blank1_total_labor_cost
  +  SESSION.blank2_total_labor_cost
  +  SESSION.blank3_total_labor_cost
 >
                  <cfset SESSION.total_materials_cost = 
SESSION.push_mow_total_materials_cost 
  +  SESSION.walk_behind_total_materials_cost 
  +  SESSION.ride_mow_total_materials_cost
  +  SESSION.hard_edge_total_materials_cost
  +  SESSION.bed_edge_total_materials_cost
  +  SESSION.TRIM_O_total_materials_cost
  +  SESSION.TRIM_S_total_materials_cost
  +  SESSION.spraying_total_materials_cost
  +  SESSION.weeding_total_materials_cost
  +  SESSION.blowing_total_materials_cost
  +  SESSION.Trash_S_total_materials_cost
  +  SESSION.traveltime_total_materials_cost
  +  SESSION.Trash_O_total_materials_cost
  +  SESSION.leafrem_total_materials_cost
  +  SESSION.cleanup_total_materials_cost
  +  SESSION.turf_preg_total_materials_cost 
  +  SESSION.turf_prel_total_materials_cost 
  +  SESSION.turf_post_total_materials_cost
  +  SESSION.turf_fert_total_materials_cost
  +  SESSION.turf_lime_total_materials_cost
  +  SESSION.Turf_Aer_H_total_materials_cost
  +  SESSION.Turf_Aer_T_total_materials_cost
  +  SESSION.Turf_Seed_total_materials_cost
  +  SESSION.Pruning_TP_total_materials_cost
  +  SESSION.Pruning_S_total_materials_cost
  +  SESSION.TS_Fert_total_materials_cost
  +  SESSION.TS_Insect_total_materials_cost
  +  SESSION.Annuals_S_total_materials_cost
  +  SESSION.Annuals_F_total_materials_cost
  +  SESSION.Irrigation_SU_total_materials_cost
  +  SESSION.Irrigation_W_total_materials_cost
  +  SESSION.Irrigation_I_total_materials_cost
  +  SESSION.Mulch_F_Reg_total_materials_cost 
  +  SESSION.Mulch_S_Reg_total_materials_cost 
  +  SESSION.mulch_s_dyed_total_materials_cost 
  +  SESSION.mulch_f_dyed_total_materials_cost 
  +  SESSION.mulch_edging_total_materials_cost
  +  SESSION.mulch_pre_total_materials_cost
  +  SESSION.Pond_maint_total_materials_cost 
  +  SESSION.Trim_Hillside_total_materials_cost  
  +  SESSION.Pine_Tags_total_materials_cost 
  +  SESSION.TS_hort_oil_total_materials_cost 
  +  SESSION.Addtl_Mowing_total_materials_cost 
  +  SESSION.Day_Porter_total_materials_cost 
  +  SESSION.Bush_Hog_total_materials_cost 
  +  SESSION.Lot_Sweeping_total_materials_cost 
  +  SESSION.Trail_Maint_total_materials_cost 
  +  SESSION.Irrigation_TM_total_materials_cost 
  +  SESSION.Irrigation_BFI_total_materials_cost 
  +  SESSION.Natural_Area_total_materials_cost 
  +  SESSION.Trash_Receptacle_total_materials_cost
  +  SESSION.Playground_mulch_total_materials_cost
  +  SESSION.Turf_Nutsedge_total_materials_cost
  +  SESSION.Turf_Fungicide_total_materials_cost
  +  SESSION.Turf_Insecticide_total_materials_cost
  +  SESSION.blank1_total_materials_cost
  +  SESSION.blank2_total_materials_cost
  +  SESSION.blank3_total_materials_cost
 >
                  <!---         <cfset SESSION.total_contract_price = 
 ROUND(SESSION.push_mow_contract_price)
 + ROUND(SESSION.walk_behind_contract_price)
+ ROUND(SESSION.ride_mow_contract_price)
+ ROUND(SESSION.hard_edge_contract_price)
+ ROUND(SESSION.bed_edge_contract_price)
+ ROUND(SESSION.TRIM_O_contract_price)
+ ROUND(SESSION.TRIM_S_contract_price)
+ ROUND(SESSION.spraying_contract_price)
+ ROUND(SESSION.weeding_contract_price)
+ ROUND(SESSION.blowing_contract_price)
+ ROUND(SESSION.Trash_S_contract_price)
+ ROUND(SESSION.traveltime_contract_price) 
+ ROUND(SESSION.Trash_O_contract_price)
+ ROUND(SESSION.leafrem_contract_price)
+ ROUND(SESSION.cleanup_contract_price)
+ ROUND(SESSION.turf_preg_contract_price)
+ ROUND(SESSION.turf_prel_contract_price)
+ ROUND(SESSION.turf_post_contract_price)
+ ROUND(SESSION.turf_fert_contract_price)
+ ROUND(SESSION.turf_lime_contract_price)
+ ROUND(SESSION.Turf_Aer_H_contract_price)
+ ROUND(SESSION.Turf_Aer_T_contract_price)
+ ROUND(SESSION.Turf_Seed_contract_price)
+ ROUND(SESSION.Pruning_TP_contract_price)
+ ROUND(SESSION.Pruning_S_contract_price)
+ ROUND(SESSION.TS_Fert_contract_price)
+ ROUND(SESSION.TS_Insect_contract_price)
+ ROUND(SESSION.Annuals_S_contract_price)
+ ROUND(SESSION.Annuals_F_contract_price)
+ ROUND(SESSION.Irrigation_SU_contract_price)
+ ROUND(SESSION.Irrigation_W_contract_price)
+ ROUND(SESSION.Irrigation_I_contract_price)
+ ROUND(SESSION.Mulch_F_Reg_contract_price)
+ ROUND(SESSION.Mulch_S_Reg_contract_price)
+ ROUND(SESSION.mulch_s_dyed_contract_price)
+ ROUND(SESSION.mulch_f_dyed_contract_price)
+ ROUND(SESSION.mulch_edging_contract_price) 
+ ROUND(SESSION.Mulch_pre_contract_price) 
+ ROUND(SESSION.Pond_maint_contract_price) 
+ ROUND(SESSION.Trim_Hillside_contract_price) 
+ ROUND(SESSION.Pine_Tags_contract_price) 
+ ROUND(SESSION.TS_hort_oil_contract_price)   
+ ROUND(SESSION.Addtl_Mowing_contract_price)
+ ROUND(SESSION.Day_Porter_contract_price)
+ ROUND(SESSION.Bush_Hog_contract_price)
+ ROUND(SESSION.Lot_Sweeping_contract_price)
+ ROUND(SESSION.Trail_Maint_contract_price)
+ ROUND(SESSION.Irrigation_TM_contract_price)  
+ ROUND(SESSION.Irrigation_BFI_contract_price)   
+ ROUND(SESSION.Natural_Area_contract_price)
+ ROUND(SESSION.Trash_Receptacle_contract_price)
+ ROUND(SESSION.Playground_mulch_contract_price)
+ ROUND(SESSION.Turf_Nutsedge_contract_price)
+ ROUND(SESSION.Turf_Fungicide_contract_price)
+ ROUND(SESSION.Turf_Insecticide_contract_price)
+ ROUND(SESSION.blank1_contract_price)
+ ROUND(SESSION.blank2_contract_price)
+ ROUND(SESSION.blank3_contract_price)
>--->
                  
                  <cfset SESSION.total_contract_price = 
 SESSION.push_mow_contract_price
 + SESSION.walk_behind_contract_price
+ SESSION.ride_mow_contract_price
+ SESSION.hard_edge_contract_price
+ SESSION.bed_edge_contract_price
+ SESSION.TRIM_O_contract_price
+ SESSION.TRIM_S_contract_price
+ SESSION.spraying_contract_price
+ SESSION.weeding_contract_price
+ SESSION.blowing_contract_price
+ SESSION.Trash_S_contract_price
+ SESSION.traveltime_contract_price 
+ SESSION.Trash_O_contract_price
+ SESSION.leafrem_contract_price
+ SESSION.cleanup_contract_price
+ SESSION.turf_preg_contract_price
+ SESSION.turf_prel_contract_price
+ SESSION.turf_post_contract_price
+ SESSION.turf_fert_contract_price
+ SESSION.turf_lime_contract_price
+ SESSION.Turf_Aer_H_contract_price
+ SESSION.Turf_Aer_T_contract_price
+ SESSION.Turf_Seed_contract_price
+ SESSION.Pruning_TP_contract_price
+ SESSION.Pruning_S_contract_price
+ SESSION.TS_Fert_contract_price
+ SESSION.TS_Insect_contract_price
+ SESSION.Annuals_S_contract_price
+ SESSION.Annuals_F_contract_price
+ SESSION.Irrigation_SU_contract_price
+ SESSION.Irrigation_W_contract_price
+ SESSION.Irrigation_I_contract_price
+ SESSION.Mulch_F_Reg_contract_price
+ SESSION.Mulch_S_Reg_contract_price
+ SESSION.mulch_s_dyed_contract_price
+ SESSION.mulch_f_dyed_contract_price
+ SESSION.mulch_edging_contract_price 
+ SESSION.Mulch_pre_contract_price 
+ SESSION.Pond_maint_contract_price 
+ SESSION.Trim_Hillside_contract_price 
+ SESSION.Pine_Tags_contract_price 
+ SESSION.TS_hort_oil_contract_price   
+ SESSION.Addtl_Mowing_contract_price
+ SESSION.Day_Porter_contract_price
+ SESSION.Bush_Hog_contract_price
+ SESSION.Lot_Sweeping_contract_price
+ SESSION.Trail_Maint_contract_price
+ SESSION.Irrigation_TM_contract_price  
+ SESSION.Irrigation_BFI_contract_price   
+ SESSION.Natural_Area_contract_price
+ SESSION.Trash_Receptacle_contract_price
+ SESSION.Playground_mulch_contract_price
+ SESSION.Turf_Nutsedge_contract_price
+ SESSION.Turf_Fungicide_contract_price
+ SESSION.Turf_Insecticide_contract_price
+ SESSION.blank1_contract_price
+ SESSION.blank2_contract_price
+ SESSION.blank3_contract_price
>
                  <tr  style="font-weight: 800"   bgcolor="##EDF3F8">
                    <td colspan="5" nowrap="nowrap"><strong>Totals (Unadjusted)</strong></td>
                    <td align="right" nowrap="nowrap"><strong>#NumberFormat(SESSION.seasonal_hours,"999,999.9")#</strong></td>
                    <td  colspan="4" align="left" nowrap="nowrap" bgcolor="##EDF3F8"><strong>&nbsp;Seasonal Hours</strong></td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td
                        >
                    <td align="right" nowrap="nowrap">&nbsp;</td
                    >
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><strong>#NumberFormat(SESSION.total_labor_cost,"999,999.99")#</strong></td>
                    <td align="right" nowrap="nowrap"><strong>#NumberFormat(SESSION.total_materials_cost,"999,999.99")#</strong></td>
                    <cfset SESSION.total_direct_cost = 
SESSION.total_labor_cost   
+SESSION.Total_materials_cost>
                    <td align="right" nowrap="nowrap"><strong>#NumberFormat(SESSION.total_direct_cost,"999,999.99")#</strong></td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="right" nowrap="nowrap"><strong>$#NumberFormat(SESSION.total_contract_price,"999,999.99")#</strong></td>
                  </tr>
                  <tr> 
                    <!---  22 columns--->
                    
                    <td align="right" colspan="9">&nbsp;</td>
                    <td align="right" colspan="5"></td>
                    <td align="right" colspan="7"><a href=""><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp; <strong>Contract Adjustment</strong></td>
                    <td align="right">$
                      <input name="contract_adjustment" type="text" class="noMargin"  size="6"      value ="#SESSION.contract_adjustment#"/></td>
                  </tr>
                  <tr> 
                    <!---  22 columns--->
                    
                    <td align="right" colspan="9">&nbsp;</td>
                    <td align="right" colspan="5"></td>
                    <td align="right" colspan="7" ><a href=""><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp;<strong>Discount Adjustment</strong></td>
                    <td align="right">$
                      <input name="discount_adjustment" type="text" class="noMargin"  size="6"      value ="#SESSION.discount_adjustment#"/></td>
                  </tr>
                  <cfset SESSION.adjusted_contract_price = 
SESSION.total_contract_price   
+SESSION.contract_adjustment  +SESSION.discount_adjustment>
                  <tr  style="font-weight: 800"   bgcolor="##EDF3F8">
                    <td align="left" colspan="9"><strong>Totals (Adjusted)</strong></td>
                    <td align="right" colspan="5"></td>
                    <td align="right" colspan="7"><strong>Total Adjusted Contract Price</strong></td>
                    <td align="right"><strong>$#NumberFormat(SESSION.adjusted_contract_price ,"999,999.99")#</strong></td>
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
      <table   width="98%"border="0" cellspacing="0" cellpadding="0" >
        <cfset SESSION.adjusted_contract_price = 
SESSION.total_contract_price   
+SESSION.contract_adjustment  +SESSION.discount_adjustment>
        <cfset SESSION.Grounds_Maintenance_Contract =  SESSION.adjusted_contract_price - 
SESSION.Irrigation_Contract >
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
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.total_contract_price,"99,999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Grounds Maintenance Contract</td>
                  <td  align="right" nowrap="nowrap">$#NumberFormat(SESSION.Grounds_Maintenance_Contract,"99,999,999.99")#</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Contract Adjustment</td>
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.contract_adjustment ,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Irrigation</td>
                  <td  align="right" nowrap="nowrap">$#NumberFormat(SESSION.Irrigation_Contract,"99,999,999.99")#</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Contract Discount</td>
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.discount_adjustment ,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap"><strong>Adjusted Contract</strong></td>
                  <td align="right" nowrap="nowrap"><strong>$#NumberFormat(SESSION.adjusted_contract_price ,"999,999.99")#</strong></td>
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
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.Total_labor_cost,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing Contact Phone</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Total Material</td>
                  <td align="right" nowrap="nowrap"> $#NumberFormat(SESSION.Total_materials_cost ,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">Billing Contact Email Address</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap"><strong>Total Direct Costs</strong></td>
                  <td align="right" nowrap="nowrap"><strong>$#NumberFormat(SESSION.total_direct_cost,"999,999.99")# </strong></td>
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
                <cfset SESSION.gross_profit_calculated = 
SESSION.adjusted_contract_price   
-SESSION.total_direct_cost>
                <tr>
                  <td nowrap="nowrap">Gross Profit</td>
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.gross_profit_calculated,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing Address2</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <cfset SESSION.margin50 =  SESSION.total_contract_price *.50>
                <tr>
                  <td nowrap="nowrap">Margin (50% contract price)</td>
                  <td align="right" nowrap="nowrap">$#NumberFormat(SESSION.margin50 ,"999,999.99")#</td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing City </td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <cfset SESSION.net_cash_flow = 
SESSION.gross_profit_calculated   
-SESSION.margin50>
                <tr>
                  <td nowrap="nowrap"><strong>Net Cashflow</strong></td>
                  <td align="right" nowrap="nowrap"><strong>$#NumberFormat(SESSION.net_cash_flow ,"999,999.99")# </strong></td>
                  <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                  <td>Billing State</td>
                  <td align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <cfif SESSION.adjusted_contract_price NEQ 0>
                  <cfset SESSION.net_cash_flow_percentage  = 
100* SESSION.net_cash_flow / SESSION.adjusted_contract_price>
                  <cfelse>
                  <cfset SESSION.net_cash_flow_percentage  = 0>
                </cfif>
                <tr>
                  <td nowrap="nowrap">Net Cashflow %</td>
                  <td align="right" nowrap="nowrap">#NumberFormat(SESSION.net_cash_flow_percentage ,"999,999.99")# %</td>
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
                <!--- <tr>
                  <td nowrap="nowrap">Grounds Maintenance Contract</td>
                  <td  align="right" nowrap="nowrap">#NumberFormat(SESSION.Grounds_Maintenance_Contract,"99,999,999.99")#</td>
                  <td width="100"  align="right" nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap="nowrap">Irrigation</td>
                  <td  align="right" nowrap="nowrap">#NumberFormat(SESSION.Irrigation_Contract,"99,999,999.99")#</td>
                  <td width="100"  align="right" nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                  <td  align="right" nowrap="nowrap">&nbsp;</td>
                </tr>---> 
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
                <input name="btnSumit" class="btn btn-primary" id="btnSumit"  type="submit" value="Contract Approved"/>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <!---  <div class="button-box"><a href="create_duplicate_quote.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" >Duplicate this Quote</a> </div> ---> 
                
              </div>
            </div></td>
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
    <table width="95%" border="0">
      <tbody>
        <tr    bgcolor="#EDF3F8">
          <td><strong>Developer Notes : (Temporary, will be removed prior to production)</strong></td>
        </tr>
        <tr>
          <td valign="top"><p> Ben: Is Billing Contact Info done like this? <br />
              /ssl/admin/project_Edit_Project_Information.cfm?ProjectID=J3769-316</p>
            <p>&nbsp;</p></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Contract Adjustment Notes: </strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            <br />
            <br /></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Discount Adjustment Notes :</strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            <br /></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Billing Notes :</strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            (for use by Admins, Billing, etc.)<br /></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Quote Notes : </strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            (viewed only within the Quote)(for use by Estimators/BDs in reference to adjustments made, etc.)<br />
            <br /></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Spec Sheet Notes : </strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            (viewed within the Quote and shown on bottom of Spec Sheets)(for use by Production)<br />
            <br /></td>
        </tr>
      </tbody>
    </table>
    <br />
    <table width="95%" border="0">
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="30"><strong>Proposal/Contract Notes : </strong></td>
        </tr>
        <tr>
          <td valign="top"><br />
            (viewed within the Quote and shown at bottom of MSS sheet.)(for use of Client)<br />
            <br /></td>
        </tr>
      </tbody>
    </table>
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
