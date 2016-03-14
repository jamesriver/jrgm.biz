<!---INSERT totals
--->

<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<!---Clear data entry session variables--->
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
<!---Clear data entry session variables--->
<cfset StructDelete(Session,"addtl_mowing_actual_extended")>
<cfset StructDelete(Session,"addtl_mowing_actualprice")>
<cfset StructDelete(Session,"addtl_mowing_contract_price")>
<cfset StructDelete(Session,"addtl_mowing_hours")>
<cfset StructDelete(Session,"addtl_mowing_hoursa")>
<cfset StructDelete(Session,"addtl_mowing_materials_actualprice")>
<cfset StructDelete(Session,"addtl_mowing_materials_qty")>
<cfset StructDelete(Session,"addtl_mowing_materials_rate")>
<cfset StructDelete(Session,"addtl_mowing_overtime_adjustment")>
<cfset StructDelete(Session,"addtl_mowing_qty")>
<cfset StructDelete(Session,"addtl_mowing_service_materials")>
<cfset StructDelete(Session,"addtl_mowing_times")>
<cfset StructDelete(Session,"addtl_mowing_total_hours")>
<cfset StructDelete(Session,"annuals_f_actual_extended")>
<cfset StructDelete(Session,"annuals_f_actualprice")>
<cfset StructDelete(Session,"annuals_f_contract_price")>
<cfset StructDelete(Session,"annuals_f_hours")>
<cfset StructDelete(Session,"annuals_f_hoursa")>
<cfset StructDelete(Session,"annuals_f_overtime_adjustment")>
<cfset StructDelete(Session,"annuals_f_qty")>
<cfset StructDelete(Session,"annuals_f_service_materials")>
<cfset StructDelete(Session,"annuals_f_times")>
<cfset StructDelete(Session,"annuals_f_total_hours")>
<cfset StructDelete(Session,"annuals_s_actual_extended")>
<cfset StructDelete(Session,"annuals_s_actualprice")>
<cfset StructDelete(Session,"annuals_s_contract_price")>
<cfset StructDelete(Session,"annuals_s_hours")>
<cfset StructDelete(Session,"annuals_s_hoursa")>
<cfset StructDelete(Session,"annuals_s_materials_actualprice")>
<cfset StructDelete(Session,"annuals_s_overtime_adjustment")>
<cfset StructDelete(Session,"annuals_s_qty")>
<cfset StructDelete(Session,"annuals_s_service_materials")>
<cfset StructDelete(Session,"annuals_s_times")>
<cfset StructDelete(Session,"annuals_s_total_hours")>
<cfset StructDelete(Session,"bed_edge_actual_extended")>
<cfset StructDelete(Session,"bed_edge_actualprice")>
<cfset StructDelete(Session,"bed_edge_contract_price")>
<cfset StructDelete(Session,"bed_edge_hours")>
<cfset StructDelete(Session,"bed_edge_hoursa")>
<cfset StructDelete(Session,"bed_edge_materials_rate")>
<cfset StructDelete(Session,"bed_edge_overtime_adjustment")>
<cfset StructDelete(Session,"bed_edge_qty")>
<cfset StructDelete(Session,"bed_edge_service_materials")>
<cfset StructDelete(Session,"bed_edge_times")>
<cfset StructDelete(Session,"bed_edge_total_hours")>
<cfset StructDelete(Session,"blank1_actual_extended")>
<cfset StructDelete(Session,"blank1_actualprice")>
<cfset StructDelete(Session,"blank1_contract_price")>
<cfset StructDelete(Session,"blank1_hours")>
<cfset StructDelete(Session,"blank1_hoursa")>
<cfset StructDelete(Session,"blank1_materials_actualprice")>
<cfset StructDelete(Session,"blank1_materials_qty")>
<cfset StructDelete(Session,"blank1_materials_rate")>
<cfset StructDelete(Session,"blank1_overtime_adjustment")>
<cfset StructDelete(Session,"blank1_qty")>
<cfset StructDelete(Session,"blank1_service_materials")>
<cfset StructDelete(Session,"blank1_times")>
<cfset StructDelete(Session,"blank1_total_hours")>
<cfset StructDelete(Session,"blank2_actual_extended")>
<cfset StructDelete(Session,"blank2_actualprice")>
<cfset StructDelete(Session,"blank2_contract_price")>
<cfset StructDelete(Session,"blank2_hours")>
<cfset StructDelete(Session,"blank2_hoursa")>
<cfset StructDelete(Session,"blank2_materials_actualprice")>
<cfset StructDelete(Session,"blank2_materials_qty")>
<cfset StructDelete(Session,"blank2_materials_rate")>
<cfset StructDelete(Session,"blank2_overtime_adjustment")>
<cfset StructDelete(Session,"blank2_qty")>
<cfset StructDelete(Session,"blank2_service_materials")>
<cfset StructDelete(Session,"blank2_times")>
<cfset StructDelete(Session,"blank2_total_hours")>
<cfset StructDelete(Session,"blank3_actual_extended")>
<cfset StructDelete(Session,"blank3_actualprice")>
<cfset StructDelete(Session,"blank3_contract_price")>
<cfset StructDelete(Session,"blank3_hours")>
<cfset StructDelete(Session,"blank3_hoursa")>
<cfset StructDelete(Session,"blank3_materials_actualprice")>
<cfset StructDelete(Session,"blank3_materials_qty")>
<cfset StructDelete(Session,"blank3_materials_rate")>
<cfset StructDelete(Session,"blank3_overtime_adjustment")>
<cfset StructDelete(Session,"blank3_qty")>
<cfset StructDelete(Session,"blank3_service_materials")>
<cfset StructDelete(Session,"blank3_times")>
<cfset StructDelete(Session,"blank3_total_hours")>
<cfset StructDelete(Session,"blowing_actual_extended")>
<cfset StructDelete(Session,"blowing_actualprice")>
<cfset StructDelete(Session,"blowing_contract_price")>
<cfset StructDelete(Session,"blowing_hours")>
<cfset StructDelete(Session,"blowing_hoursa")>
<cfset StructDelete(Session,"blowing_materials_rate")>
<cfset StructDelete(Session,"blowing_overtime_adjustment")>
<cfset StructDelete(Session,"blowing_qty")>
<cfset StructDelete(Session,"blowing_service_materials")>
<cfset StructDelete(Session,"blowing_times")>
<cfset StructDelete(Session,"blowing_total_hours")>
<cfset StructDelete(Session,"bush_hog_actual_extended")>
<cfset StructDelete(Session,"bush_hog_materials_actualprice")>
<cfset StructDelete(Session,"bush_hog_materials_qty")>
<cfset StructDelete(Session,"bush_hog_materials_rate")>
<cfset StructDelete(Session,"bush_hog_overtime_adjustment")>
<cfset StructDelete(Session,"bush_hog_times")>
<cfset StructDelete(Session,"bush_hog_total_hours")>
<cfset StructDelete(Session,"cleanup_actual_extended")>
<cfset StructDelete(Session,"cleanup_actualprice")>
<cfset StructDelete(Session,"cleanup_contract_price")>
<cfset StructDelete(Session,"cleanup_hours")>
<cfset StructDelete(Session,"cleanup_hoursa")>
<cfset StructDelete(Session,"cleanup_materials_rate")>
<cfset StructDelete(Session,"cleanup_overtime_adjustment")>
<cfset StructDelete(Session,"cleanup_qty")>
<cfset StructDelete(Session,"cleanup_service_materials")>
<cfset StructDelete(Session,"cleanup_times")>
<cfset StructDelete(Session,"cleanup_total_hours")>
<cfset StructDelete(Session,"construction_cost")>
<cfset StructDelete(Session,"construction_rate")>
<cfset StructDelete(Session,"day_porter_actual_extended")>
<cfset StructDelete(Session,"day_porter_actualprice")>
<cfset StructDelete(Session,"day_porter_contract_price")>
<cfset StructDelete(Session,"day_porter_hours")>
<cfset StructDelete(Session,"day_porter_hoursa")>
<cfset StructDelete(Session,"day_porter_materials_actualprice")>
<cfset StructDelete(Session,"day_porter_materials_qty")>
<cfset StructDelete(Session,"day_porter_materials_rate")>
<cfset StructDelete(Session,"day_porter_overtime_adjustment")>
<cfset StructDelete(Session,"day_porter_qty")>
<cfset StructDelete(Session,"day_porter_service_materials")>
<cfset StructDelete(Session,"day_porter_times")>
<cfset StructDelete(Session,"day_porter_total_hours")>
<cfset StructDelete(Session,"enhancement_cost")>
<cfset StructDelete(Session,"enhancement_rate")>
<cfset StructDelete(Session,"fertilization_cost")>
<cfset StructDelete(Session,"fertilization_rate")>
<cfset StructDelete(Session,"gross_margin")>
<cfset StructDelete(Session,"gross_margin_diff")>
<cfset StructDelete(Session,"gross_margin_diff_blank1")>
<cfset StructDelete(Session,"gross_margin_diff_blank2")>
<cfset StructDelete(Session,"gross_margin_diff_blank3")>
<cfset StructDelete(Session,"gross_margin_diff_lot_sweeping")>
<cfset StructDelete(Session,"gross_margin_diff_travel_time")>
<cfset StructDelete(Session,"grounds_maintenance_contract")>
<cfset StructDelete(Session,"hard_edge_actual_extended")>
<cfset StructDelete(Session,"hard_edge_actualprice")>
<cfset StructDelete(Session,"hard_edge_contract_price")>
<cfset StructDelete(Session,"hard_edge_hours")>
<cfset StructDelete(Session,"hard_edge_hoursa")>
<cfset StructDelete(Session,"hard_edge_materials_rate")>
<cfset StructDelete(Session,"hard_edge_overtime_adjustment")>
<cfset StructDelete(Session,"hard_edge_qty")>
<cfset StructDelete(Session,"hard_edge_service_materials")>
<cfset StructDelete(Session,"hard_edge_times")>
<cfset StructDelete(Session,"hard_edge_total_hours")>
<cfset StructDelete(Session,"irrigation_bfi_actual_extended")>
<cfset StructDelete(Session,"irrigation_bfi_actualprice")>
<cfset StructDelete(Session,"irrigation_bfi_contract_price")>
<cfset StructDelete(Session,"irrigation_bfi_hours")>
<cfset StructDelete(Session,"irrigation_bfi_hoursa")>
<cfset StructDelete(Session,"irrigation_bfi_materials_actualprice")>
<cfset StructDelete(Session,"irrigation_bfi_materials_qty")>
<cfset StructDelete(Session,"irrigation_bfi_materials_rate")>
<cfset StructDelete(Session,"irrigation_bfi_overtime_adjustment")>
<cfset StructDelete(Session,"irrigation_bfi_qty")>
<cfset StructDelete(Session,"irrigation_bfi_service_materials")>
<cfset StructDelete(Session,"irrigation_bfi_times")>
<cfset StructDelete(Session,"irrigation_bfi_total_hours")>
<cfset StructDelete(Session,"irrigation_contract")>
<cfset StructDelete(Session,"irrigation_cost")>
<cfset StructDelete(Session,"irrigation_i_actual_extended")>
<cfset StructDelete(Session,"irrigation_i_actualprice")>
<cfset StructDelete(Session,"irrigation_i_contract_price")>
<cfset StructDelete(Session,"irrigation_i_hours")>
<cfset StructDelete(Session,"irrigation_i_hoursa")>
<cfset StructDelete(Session,"irrigation_i_materials_actualprice")>
<cfset StructDelete(Session,"irrigation_i_materials_qty")>
<cfset StructDelete(Session,"irrigation_i_materials_rate")>
<cfset StructDelete(Session,"irrigation_i_overtime_adjustment")>
<cfset StructDelete(Session,"irrigation_i_qty")>
<cfset StructDelete(Session,"irrigation_i_service_materials")>
<cfset StructDelete(Session,"irrigation_i_times")>
<cfset StructDelete(Session,"irrigation_i_total_hours")>
<cfset StructDelete(Session,"irrigation_rate")>
<cfset StructDelete(Session,"irrigation_su_actual_extended")>
<cfset StructDelete(Session,"irrigation_su_actualprice")>
<cfset StructDelete(Session,"irrigation_su_contract_price")>
<cfset StructDelete(Session,"irrigation_su_hours")>
<cfset StructDelete(Session,"irrigation_su_hoursa")>
<cfset StructDelete(Session,"irrigation_su_materials_actualprice")>
<cfset StructDelete(Session,"irrigation_su_materials_qty")>
<cfset StructDelete(Session,"irrigation_su_materials_rate")>
<cfset StructDelete(Session,"irrigation_su_overtime_adjustment")>
<cfset StructDelete(Session,"irrigation_su_qty")>
<cfset StructDelete(Session,"irrigation_su_service_materials")>
<cfset StructDelete(Session,"irrigation_su_times")>
<cfset StructDelete(Session,"irrigation_su_total_hours")>
<cfset StructDelete(Session,"irrigation_tm_actual_extended")>
<cfset StructDelete(Session,"irrigation_tm_actualprice")>
<cfset StructDelete(Session,"irrigation_tm_contract_price")>
<cfset StructDelete(Session,"irrigation_tm_hours")>
<cfset StructDelete(Session,"irrigation_tm_hoursa")>
<cfset StructDelete(Session,"irrigation_tm_materials_actualprice")>
<cfset StructDelete(Session,"irrigation_tm_materials_qty")>
<cfset StructDelete(Session,"irrigation_tm_materials_rate")>
<cfset StructDelete(Session,"irrigation_tm_overtime_adjustment")>
<cfset StructDelete(Session,"irrigation_tm_qty")>
<cfset StructDelete(Session,"irrigation_tm_service_materials")>
<cfset StructDelete(Session,"irrigation_tm_times")>
<cfset StructDelete(Session,"irrigation_tm_total_hours")>
<cfset StructDelete(Session,"irrigation_w_actual_extended")>
<cfset StructDelete(Session,"irrigation_w_actualprice")>
<cfset StructDelete(Session,"irrigation_w_contract_price")>
<cfset StructDelete(Session,"irrigation_w_hours")>
<cfset StructDelete(Session,"irrigation_w_hoursa")>
<cfset StructDelete(Session,"irrigation_w_materials_actualprice")>
<cfset StructDelete(Session,"irrigation_w_materials_qty")>
<cfset StructDelete(Session,"irrigation_w_materials_rate")>
<cfset StructDelete(Session,"irrigation_w_overtime_adjustment")>
<cfset StructDelete(Session,"irrigation_w_qty")>
<cfset StructDelete(Session,"irrigation_w_service_materials")>
<cfset StructDelete(Session,"irrigation_w_times")>
<cfset StructDelete(Session,"irrigation_w_total_hours")>
<cfset StructDelete(Session,"job_id")>
<cfset StructDelete(Session,"leafrem_actual_extended")>
<cfset StructDelete(Session,"leafrem_actualprice")>
<cfset StructDelete(Session,"leafrem_contract_price")>
<cfset StructDelete(Session,"leafrem_hours")>
<cfset StructDelete(Session,"leafrem_hoursa")>
<cfset StructDelete(Session,"leafrem_materials_rate")>
<cfset StructDelete(Session,"leafrem_overtime_adjustment")>
<cfset StructDelete(Session,"leafrem_qty")>
<cfset StructDelete(Session,"leafrem_service_materials")>
<cfset StructDelete(Session,"leafrem_times")>
<cfset StructDelete(Session,"leafrem_total_hours")>
<cfset StructDelete(Session,"loginid")>
<cfset StructDelete(Session,"lot_sweeping_actual_extended")>
<cfset StructDelete(Session,"lot_sweeping_actualprice")>
<cfset StructDelete(Session,"lot_sweeping_contract_price")>
<cfset StructDelete(Session,"lot_sweeping_hours")>
<cfset StructDelete(Session,"lot_sweeping_hoursa")>
<cfset StructDelete(Session,"lot_sweeping_materials_actualprice")>
<cfset StructDelete(Session,"lot_sweeping_materials_qty")>
<cfset StructDelete(Session,"lot_sweeping_materials_rate")>
<cfset StructDelete(Session,"lot_sweeping_overtime_adjustment")>
<cfset StructDelete(Session,"lot_sweeping_qty")>
<cfset StructDelete(Session,"lot_sweeping_service_materials")>
<cfset StructDelete(Session,"lot_sweeping_times")>
<cfset StructDelete(Session,"lot_sweeping_total_hours")>
<cfset StructDelete(Session,"maintenance_cost")>
<cfset StructDelete(Session,"maintenance_rate")>
<cfset StructDelete(Session,"mulch_cost")>
<cfset StructDelete(Session,"mulch_edging_actual_extended")>
<cfset StructDelete(Session,"mulch_edging_actualprice")>
<cfset StructDelete(Session,"mulch_edging_contract_price")>
<cfset StructDelete(Session,"mulch_edging_hours")>
<cfset StructDelete(Session,"mulch_edging_hoursa")>
<cfset StructDelete(Session,"mulch_edging_materials_actualprice")>
<cfset StructDelete(Session,"mulch_edging_materials_qty")>
<cfset StructDelete(Session,"mulch_edging_materials_rate")>
<cfset StructDelete(Session,"mulch_edging_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_edging_qty")>
<cfset StructDelete(Session,"mulch_edging_service_materials")>
<cfset StructDelete(Session,"mulch_edging_times")>
<cfset StructDelete(Session,"mulch_edging_total_hours")>
<cfset StructDelete(Session,"mulch_f_dyed_actual_extended")>
<cfset StructDelete(Session,"mulch_f_dyed_actualprice")>
<cfset StructDelete(Session,"mulch_f_dyed_contract_price")>
<cfset StructDelete(Session,"mulch_f_dyed_hours")>
<cfset StructDelete(Session,"mulch_f_dyed_hoursa")>
<cfset StructDelete(Session,"mulch_f_dyed_materials_actualprice")>
<cfset StructDelete(Session,"mulch_f_dyed_materials_qty_actual")>
<cfset StructDelete(Session,"mulch_f_dyed_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_f_dyed_qty")>
<cfset StructDelete(Session,"mulch_f_dyed_service_materials")>
<cfset StructDelete(Session,"mulch_f_dyed_times")>
<cfset StructDelete(Session,"mulch_f_dyed_total_hours")>
<cfset StructDelete(Session,"mulch_f_reg_actual_extended")>
<cfset StructDelete(Session,"mulch_f_reg_actualprice")>
<cfset StructDelete(Session,"mulch_f_reg_contract_price")>
<cfset StructDelete(Session,"mulch_f_reg_hours")>
<cfset StructDelete(Session,"mulch_f_reg_hoursa")>
<cfset StructDelete(Session,"mulch_f_reg_materials_actualprice")>
<cfset StructDelete(Session,"mulch_f_reg_materials_qty_actual")>
<cfset StructDelete(Session,"mulch_f_reg_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_f_reg_qty")>
<cfset StructDelete(Session,"mulch_f_reg_service_materials")>
<cfset StructDelete(Session,"mulch_f_reg_times")>
<cfset StructDelete(Session,"mulch_f_reg_total_hours")>
<cfset StructDelete(Session,"mulch_pre_actual_extended")>
<cfset StructDelete(Session,"mulch_pre_actualprice")>
<cfset StructDelete(Session,"mulch_pre_contract_price")>
<cfset StructDelete(Session,"mulch_pre_hours")>
<cfset StructDelete(Session,"mulch_pre_hoursa")>
<cfset StructDelete(Session,"mulch_pre_materials_actualprice")>
<cfset StructDelete(Session,"mulch_pre_materials_qty_actual")>
<cfset StructDelete(Session,"mulch_pre_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_pre_qty")>
<cfset StructDelete(Session,"mulch_pre_service_materials")>
<cfset StructDelete(Session,"mulch_pre_times")>
<cfset StructDelete(Session,"mulch_pre_total_hours")>
<cfset StructDelete(Session,"mulch_rate")>
<cfset StructDelete(Session,"mulch_s_dyed_actual_extended")>
<cfset StructDelete(Session,"mulch_s_dyed_actualprice")>
<cfset StructDelete(Session,"mulch_s_dyed_contract_price")>
<cfset StructDelete(Session,"mulch_s_dyed_hours")>
<cfset StructDelete(Session,"mulch_s_dyed_hoursa")>
<cfset StructDelete(Session,"mulch_s_dyed_materials_actualprice")>
<cfset StructDelete(Session,"mulch_s_dyed_materials_qty_actual")>
<cfset StructDelete(Session,"mulch_s_dyed_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_s_dyed_qty")>
<cfset StructDelete(Session,"mulch_s_dyed_service_materials")>
<cfset StructDelete(Session,"mulch_s_dyed_times")>
<cfset StructDelete(Session,"mulch_s_dyed_total_hours")>
<cfset StructDelete(Session,"mulch_s_reg_actual_extended")>
<cfset StructDelete(Session,"mulch_s_reg_actualprice")>
<cfset StructDelete(Session,"mulch_s_reg_contract_price")>
<cfset StructDelete(Session,"mulch_s_reg_hours")>
<cfset StructDelete(Session,"mulch_s_reg_hoursa")>
<cfset StructDelete(Session,"mulch_s_reg_materials_actualprice")>
<cfset StructDelete(Session,"mulch_s_reg_materials_qty_actual")>
<cfset StructDelete(Session,"mulch_s_reg_overtime_adjustment")>
<cfset StructDelete(Session,"mulch_s_reg_qty")>
<cfset StructDelete(Session,"mulch_s_reg_service_materials")>
<cfset StructDelete(Session,"mulch_s_reg_times")>
<cfset StructDelete(Session,"mulch_s_reg_total_hours")>
<cfset StructDelete(Session,"natural_area_actual_extended")>
<cfset StructDelete(Session,"natural_area_actualprice")>
<cfset StructDelete(Session,"natural_area_contract_price")>
<cfset StructDelete(Session,"natural_area_hours")>
<cfset StructDelete(Session,"natural_area_hoursa")>
<cfset StructDelete(Session,"natural_area_materials_actualprice")>
<cfset StructDelete(Session,"natural_area_materials_qty")>
<cfset StructDelete(Session,"natural_area_materials_rate")>
<cfset StructDelete(Session,"natural_area_overtime_adjustment")>
<cfset StructDelete(Session,"natural_area_qty")>
<cfset StructDelete(Session,"natural_area_service_materials")>
<cfset StructDelete(Session,"natural_area_times")>
<cfset StructDelete(Session,"natural_area_total_hours")>
<cfset StructDelete(Session,"pine_tags_actual_extended")>
<cfset StructDelete(Session,"pine_tags_actualprice")>
<cfset StructDelete(Session,"pine_tags_contract_price")>
<cfset StructDelete(Session,"pine_tags_hours")>
<cfset StructDelete(Session,"pine_tags_hoursa")>
<cfset StructDelete(Session,"pine_tags_materials_actualprice")>
<cfset StructDelete(Session,"pine_tags_materials_qty_actual")>
<cfset StructDelete(Session,"pine_tags_overtime_adjustment")>
<cfset StructDelete(Session,"pine_tags_qty")>
<cfset StructDelete(Session,"pine_tags_service_materials")>
<cfset StructDelete(Session,"pine_tags_times")>
<cfset StructDelete(Session,"pine_tags_total_hours")>
<cfset StructDelete(Session,"playground_mulch_actual_extended")>
<cfset StructDelete(Session,"playground_mulch_actualprice")>
<cfset StructDelete(Session,"playground_mulch_contract_price")>
<cfset StructDelete(Session,"playground_mulch_hours")>
<cfset StructDelete(Session,"playground_mulch_hoursa")>
<cfset StructDelete(Session,"playground_mulch_materials_actualprice")>
<cfset StructDelete(Session,"playground_mulch_materials_qty_actual")>
<cfset StructDelete(Session,"playground_mulch_overtime_adjustment")>
<cfset StructDelete(Session,"playground_mulch_qty")>
<cfset StructDelete(Session,"playground_mulch_service_materials")>
<cfset StructDelete(Session,"playground_mulch_times")>
<cfset StructDelete(Session,"playground_mulch_total_hours")>
<cfset StructDelete(Session,"pond_maint_actual_extended")>
<cfset StructDelete(Session,"pond_maint_actualprice")>
<cfset StructDelete(Session,"pond_maint_contract_price")>
<cfset StructDelete(Session,"pond_maint_hours")>
<cfset StructDelete(Session,"pond_maint_hoursa")>
<cfset StructDelete(Session,"pond_maint_materials_actualprice")>
<cfset StructDelete(Session,"pond_maint_materials_qty")>
<cfset StructDelete(Session,"pond_maint_materials_rate")>
<cfset StructDelete(Session,"pond_maint_overtime_adjustment")>
<cfset StructDelete(Session,"pond_maint_qty")>
<cfset StructDelete(Session,"pond_maint_service_materials")>
<cfset StructDelete(Session,"pond_maint_times")>
<cfset StructDelete(Session,"pond_maint_total_hours")>
<cfset StructDelete(Session,"pruning_s_actual_extended")>
<cfset StructDelete(Session,"pruning_s_actualprice")>
<cfset StructDelete(Session,"pruning_s_contract_price")>
<cfset StructDelete(Session,"pruning_s_hours")>
<cfset StructDelete(Session,"pruning_s_hoursa")>
<cfset StructDelete(Session,"pruning_s_materials_actualprice")>
<cfset StructDelete(Session,"pruning_s_materials_qty")>
<cfset StructDelete(Session,"pruning_s_materials_rate")>
<cfset StructDelete(Session,"pruning_s_overtime_adjustment")>
<cfset StructDelete(Session,"pruning_s_qty")>
<cfset StructDelete(Session,"pruning_s_service_materials")>
<cfset StructDelete(Session,"pruning_s_times")>
<cfset StructDelete(Session,"pruning_s_total_hours")>
<cfset StructDelete(Session,"pruning_tp_actual_extended")>
<cfset StructDelete(Session,"pruning_tp_actualprice")>
<cfset StructDelete(Session,"pruning_tp_contract_price")>
<cfset StructDelete(Session,"pruning_tp_hours")>
<cfset StructDelete(Session,"pruning_tp_hoursa")>
<cfset StructDelete(Session,"pruning_tp_materials_actualprice")>
<cfset StructDelete(Session,"pruning_tp_materials_qty")>
<cfset StructDelete(Session,"pruning_tp_materials_rate")>
<cfset StructDelete(Session,"pruning_tp_overtime_adjustment")>
<cfset StructDelete(Session,"pruning_tp_qty")>
<cfset StructDelete(Session,"pruning_tp_service_materials")>
<cfset StructDelete(Session,"pruning_tp_times")>
<cfset StructDelete(Session,"pruning_tp_total_hours")>
<cfset StructDelete(Session,"seasonal_color_cost")>
<cfset StructDelete(Session,"seasonal_color_rate")>
<cfset StructDelete(Session,"spraying_actual_extended")>
<cfset StructDelete(Session,"spraying_actualprice")>
<cfset StructDelete(Session,"spraying_contract_price")>
<cfset StructDelete(Session,"spraying_hours")>
<cfset StructDelete(Session,"spraying_hoursa")>
<cfset StructDelete(Session,"spraying_materials_actualprice")>
<cfset StructDelete(Session,"spraying_materials_qty_actual")>
<cfset StructDelete(Session,"spraying_overtime_adjustment")>
<cfset StructDelete(Session,"spraying_qty")>
<cfset StructDelete(Session,"spraying_service_materials")>
<cfset StructDelete(Session,"spraying_times")>
<cfset StructDelete(Session,"spraying_total_hours")>
<cfset StructDelete(Session,"taxrate")>
<cfset StructDelete(Session,"taxrateplusone")>
<cfset StructDelete(Session,"total_actual_extended")>
<cfset StructDelete(Session,"total_contract_price")>
<cfset StructDelete(Session,"total_hours")>
<cfset StructDelete(Session,"total_materials_cost")>
<cfset StructDelete(Session,"total_overtime_adjustment")>
<cfset StructDelete(Session,"trail_maint_actual_extended")>
<cfset StructDelete(Session,"trail_maint_actualprice")>
<cfset StructDelete(Session,"trail_maint_contract_price")>
<cfset StructDelete(Session,"trail_maint_hours")>
<cfset StructDelete(Session,"trail_maint_hoursa")>
<cfset StructDelete(Session,"trail_maint_materials_actualprice")>
<cfset StructDelete(Session,"trail_maint_materials_qty")>
<cfset StructDelete(Session,"trail_maint_materials_rate")>
<cfset StructDelete(Session,"trail_maint_overtime_adjustment")>
<cfset StructDelete(Session,"trail_maint_qty")>
<cfset StructDelete(Session,"trail_maint_service_materials")>
<cfset StructDelete(Session,"trail_maint_times")>
<cfset StructDelete(Session,"trail_maint_total_hours")>
<cfset StructDelete(Session,"trash_o_actual_extended")>
<cfset StructDelete(Session,"trash_o_actualprice")>
<cfset StructDelete(Session,"trash_o_contract_price")>
<cfset StructDelete(Session,"trash_o_hours")>
<cfset StructDelete(Session,"trash_o_hoursa")>
<cfset StructDelete(Session,"trash_o_materials_rate")>
<cfset StructDelete(Session,"trash_o_overtime_adjustment")>
<cfset StructDelete(Session,"trash_o_qty")>
<cfset StructDelete(Session,"trash_o_service_materials")>
<cfset StructDelete(Session,"trash_o_times")>
<cfset StructDelete(Session,"trash_o_total_hours")>
<cfset StructDelete(Session,"trash_receptacle_actual_extended")>
<cfset StructDelete(Session,"trash_receptacle_actualprice")>
<cfset StructDelete(Session,"trash_receptacle_contract_price")>
<cfset StructDelete(Session,"trash_receptacle_hours")>
<cfset StructDelete(Session,"trash_receptacle_hoursa")>
<cfset StructDelete(Session,"trash_receptacle_materials_actualprice")>
<cfset StructDelete(Session,"trash_receptacle_materials_qty")>
<cfset StructDelete(Session,"trash_receptacle_materials_rate")>
<cfset StructDelete(Session,"trash_receptacle_overtime_adjustment")>
<cfset StructDelete(Session,"trash_receptacle_qty")>
<cfset StructDelete(Session,"trash_receptacle_service_materials")>
<cfset StructDelete(Session,"trash_receptacle_times")>
<cfset StructDelete(Session,"trash_receptacle_total_hours")>
<cfset StructDelete(Session,"trash_s_actual_extended")>
<cfset StructDelete(Session,"trash_s_actualprice")>
<cfset StructDelete(Session,"trash_s_contract_price")>
<cfset StructDelete(Session,"trash_s_hours")>
<cfset StructDelete(Session,"trash_s_hoursa")>
<cfset StructDelete(Session,"trash_s_materials_rate")>
<cfset StructDelete(Session,"trash_s_overtime_adjustment")>
<cfset StructDelete(Session,"trash_s_qty")>
<cfset StructDelete(Session,"trash_s_service_materials")>
<cfset StructDelete(Session,"trash_s_times")>
<cfset StructDelete(Session,"trash_s_total_hours")>
<cfset StructDelete(Session,"traveltime_actual_extended")>
<cfset StructDelete(Session,"traveltime_actualprice")>
<cfset StructDelete(Session,"traveltime_contract_price")>
<cfset StructDelete(Session,"traveltime_hours")>
<cfset StructDelete(Session,"traveltime_hoursa")>
<cfset StructDelete(Session,"traveltime_materials_rate")>
<cfset StructDelete(Session,"traveltime_overtime_adjustment")>
<cfset StructDelete(Session,"traveltime_qty")>
<cfset StructDelete(Session,"traveltime_service_materials")>
<cfset StructDelete(Session,"traveltime_times")>
<cfset StructDelete(Session,"traveltime_total_hours")>
<cfset StructDelete(Session,"trim_hillside_actual_extended")>
<cfset StructDelete(Session,"trim_hillside_actualprice")>
<cfset StructDelete(Session,"trim_hillside_contract_price")>
<cfset StructDelete(Session,"trim_hillside_hours")>
<cfset StructDelete(Session,"trim_hillside_hoursa")>
<cfset StructDelete(Session,"trim_hillside_materials_actualprice")>
<cfset StructDelete(Session,"trim_hillside_materials_qty")>
<cfset StructDelete(Session,"trim_hillside_materials_rate")>
<cfset StructDelete(Session,"trim_hillside_overtime_adjustment")>
<cfset StructDelete(Session,"trim_hillside_qty")>
<cfset StructDelete(Session,"trim_hillside_service_materials")>
<cfset StructDelete(Session,"trim_hillside_times")>
<cfset StructDelete(Session,"trim_hillside_total_hours")>
<cfset StructDelete(Session,"trim_o_actual_extended")>
<cfset StructDelete(Session,"trim_o_actualprice")>
<cfset StructDelete(Session,"trim_o_contract_price")>
<cfset StructDelete(Session,"trim_o_hours")>
<cfset StructDelete(Session,"trim_o_hoursa")>
<cfset StructDelete(Session,"trim_o_materials_rate")>
<cfset StructDelete(Session,"trim_o_overtime_adjustment")>
<cfset StructDelete(Session,"trim_o_qty")>
<cfset StructDelete(Session,"trim_o_service_materials")>
<cfset StructDelete(Session,"trim_o_times")>
<cfset StructDelete(Session,"trim_o_total_hours")>
<cfset StructDelete(Session,"trim_s_actual_extended")>
<cfset StructDelete(Session,"trim_s_actualprice")>
<cfset StructDelete(Session,"trim_s_contract_price")>
<cfset StructDelete(Session,"trim_s_hours")>
<cfset StructDelete(Session,"trim_s_hoursa")>
<cfset StructDelete(Session,"trim_s_materials_rate")>
<cfset StructDelete(Session,"trim_s_overtime_adjustment")>
<cfset StructDelete(Session,"trim_s_qty")>
<cfset StructDelete(Session,"trim_s_service_materials")>
<cfset StructDelete(Session,"trim_s_times")>
<cfset StructDelete(Session,"trim_s_total_hours")>
<cfset StructDelete(Session,"ts_fert_actual_extended")>
<cfset StructDelete(Session,"ts_fert_actualprice")>
<cfset StructDelete(Session,"ts_fert_contract_price")>
<cfset StructDelete(Session,"ts_fert_hours")>
<cfset StructDelete(Session,"ts_fert_hoursa")>
<cfset StructDelete(Session,"ts_fert_materials_actualprice")>
<cfset StructDelete(Session,"ts_fert_materials_qty_actual")>
<cfset StructDelete(Session,"ts_fert_overtime_adjustment")>
<cfset StructDelete(Session,"ts_fert_qty")>
<cfset StructDelete(Session,"ts_fert_service_materials")>
<cfset StructDelete(Session,"ts_fert_times")>
<cfset StructDelete(Session,"ts_fert_total_hours")>
<cfset StructDelete(Session,"ts_hort_oil_actual_extended")>
<cfset StructDelete(Session,"ts_hort_oil_actualprice")>
<cfset StructDelete(Session,"ts_hort_oil_contract_price")>
<cfset StructDelete(Session,"ts_hort_oil_hours")>
<cfset StructDelete(Session,"ts_hort_oil_hoursa")>
<cfset StructDelete(Session,"ts_hort_oil_materials_actualprice")>
<cfset StructDelete(Session,"ts_hort_oil_materials_qty_actual")>
<cfset StructDelete(Session,"ts_hort_oil_overtime_adjustment")>
<cfset StructDelete(Session,"ts_hort_oil_qty")>
<cfset StructDelete(Session,"ts_hort_oil_service_materials")>
<cfset StructDelete(Session,"ts_hort_oil_times")>
<cfset StructDelete(Session,"ts_hort_oil_total_hours")>
<cfset StructDelete(Session,"ts_insect_actual_extended")>
<cfset StructDelete(Session,"ts_insect_actualprice")>
<cfset StructDelete(Session,"ts_insect_contract_price")>
<cfset StructDelete(Session,"ts_insect_hours")>
<cfset StructDelete(Session,"ts_insect_hoursa")>
<cfset StructDelete(Session,"ts_insect_materials_actualprice")>
<cfset StructDelete(Session,"ts_insect_materials_qty_actual")>
<cfset StructDelete(Session,"ts_insect_overtime_adjustment")>
<cfset StructDelete(Session,"ts_insect_qty")>
<cfset StructDelete(Session,"ts_insect_service_materials")>
<cfset StructDelete(Session,"ts_insect_times")>
<cfset StructDelete(Session,"ts_insect_total_hours")>
<cfset StructDelete(Session,"turf_aer_h_actual_extended")>
<cfset StructDelete(Session,"turf_aer_h_actualprice")>
<cfset StructDelete(Session,"turf_aer_h_contract_price")>
<cfset StructDelete(Session,"turf_aer_h_hours")>
<cfset StructDelete(Session,"turf_aer_h_hoursa")>
<cfset StructDelete(Session,"turf_aer_h_materials_actualprice")>
<cfset StructDelete(Session,"turf_aer_h_materials_qty")>
<cfset StructDelete(Session,"turf_aer_h_materials_rate")>
<cfset StructDelete(Session,"turf_aer_h_overtime_adjustment")>
<cfset StructDelete(Session,"turf_aer_h_qty")>
<cfset StructDelete(Session,"turf_aer_h_service_materials")>
<cfset StructDelete(Session,"turf_aer_h_times")>
<cfset StructDelete(Session,"turf_aer_h_total_hours")>
<cfset StructDelete(Session,"turf_aer_t_actual_extended")>
<cfset StructDelete(Session,"turf_aer_t_actualprice")>
<cfset StructDelete(Session,"turf_aer_t_contract_price")>
<cfset StructDelete(Session,"turf_aer_t_hours")>
<cfset StructDelete(Session,"turf_aer_t_hoursa")>
<cfset StructDelete(Session,"turf_aer_t_materials_actualprice")>
<cfset StructDelete(Session,"turf_aer_t_materials_qty")>
<cfset StructDelete(Session,"turf_aer_t_materials_rate")>
<cfset StructDelete(Session,"turf_aer_t_overtime_adjustment")>
<cfset StructDelete(Session,"turf_aer_t_qty")>
<cfset StructDelete(Session,"turf_aer_t_service_materials")>
<cfset StructDelete(Session,"turf_aer_t_times")>
<cfset StructDelete(Session,"turf_aer_t_total_hours")>
<cfset StructDelete(Session,"turf_fert_actual_extended")>
<cfset StructDelete(Session,"turf_fert_actualprice")>
<cfset StructDelete(Session,"turf_fert_contract_price")>
<cfset StructDelete(Session,"turf_fert_hours")>
<cfset StructDelete(Session,"turf_fert_hoursa")>
<cfset StructDelete(Session,"turf_fert_materials_actualprice")>
<cfset StructDelete(Session,"turf_fert_materials_qty_actual")>
<cfset StructDelete(Session,"turf_fert_overtime_adjustment")>
<cfset StructDelete(Session,"turf_fert_qty")>
<cfset StructDelete(Session,"turf_fert_service_materials")>
<cfset StructDelete(Session,"turf_fert_times")>
<cfset StructDelete(Session,"turf_fert_total_hours")>
<cfset StructDelete(Session,"turf_fungicide_actual_extended")>
<cfset StructDelete(Session,"turf_fungicide_actualprice")>
<cfset StructDelete(Session,"turf_fungicide_contract_price")>
<cfset StructDelete(Session,"turf_fungicide_hours")>
<cfset StructDelete(Session,"turf_fungicide_hoursa")>
<cfset StructDelete(Session,"turf_fungicide_materials_actualprice")>
<cfset StructDelete(Session,"turf_fungicide_materials_qty_actual")>
<cfset StructDelete(Session,"turf_fungicide_overtime_adjustment")>
<cfset StructDelete(Session,"turf_fungicide_qty")>
<cfset StructDelete(Session,"turf_fungicide_service_materials")>
<cfset StructDelete(Session,"turf_fungicide_times")>
<cfset StructDelete(Session,"turf_fungicide_total_hours")>
<cfset StructDelete(Session,"turf_insecticide_actual_extended")>
<cfset StructDelete(Session,"turf_insecticide_actualprice")>
<cfset StructDelete(Session,"turf_insecticide_contract_price")>
<cfset StructDelete(Session,"turf_insecticide_hours")>
<cfset StructDelete(Session,"turf_insecticide_hoursa")>
<cfset StructDelete(Session,"turf_insecticide_materials_actualprice")>
<cfset StructDelete(Session,"turf_insecticide_materials_qty_actual")>
<cfset StructDelete(Session,"turf_insecticide_overtime_adjustment")>
<cfset StructDelete(Session,"turf_insecticide_qty")>
<cfset StructDelete(Session,"turf_insecticide_service_materials")>
<cfset StructDelete(Session,"turf_insecticide_times")>
<cfset StructDelete(Session,"turf_insecticide_total_hours")>
<cfset StructDelete(Session,"turf_lime_actual_extended")>
<cfset StructDelete(Session,"turf_lime_actualprice")>
<cfset StructDelete(Session,"turf_lime_contract_price")>
<cfset StructDelete(Session,"turf_lime_hours")>
<cfset StructDelete(Session,"turf_lime_hoursa")>
<cfset StructDelete(Session,"turf_lime_materials_actualprice")>
<cfset StructDelete(Session,"turf_lime_materials_qty_actual")>
<cfset StructDelete(Session,"turf_lime_overtime_adjustment")>
<cfset StructDelete(Session,"turf_lime_qty")>
<cfset StructDelete(Session,"turf_lime_service_materials")>
<cfset StructDelete(Session,"turf_lime_times")>
<cfset StructDelete(Session,"turf_lime_total_hours")>
<cfset StructDelete(Session,"turf_nutsedge_actual_extended")>
<cfset StructDelete(Session,"turf_nutsedge_actualprice")>
<cfset StructDelete(Session,"turf_nutsedge_contract_price")>
<cfset StructDelete(Session,"turf_nutsedge_hours")>
<cfset StructDelete(Session,"turf_nutsedge_hoursa")>
<cfset StructDelete(Session,"turf_nutsedge_materials_actualprice")>
<cfset StructDelete(Session,"turf_nutsedge_materials_qty_actual")>
<cfset StructDelete(Session,"turf_nutsedge_overtime_adjustment")>
<cfset StructDelete(Session,"turf_nutsedge_qty")>
<cfset StructDelete(Session,"turf_nutsedge_service_materials")>
<cfset StructDelete(Session,"turf_nutsedge_times")>
<cfset StructDelete(Session,"turf_nutsedge_total_hours")>
<cfset StructDelete(Session,"turf_post_actual_extended")>
<cfset StructDelete(Session,"turf_post_actualprice")>
<cfset StructDelete(Session,"turf_post_contract_price")>
<cfset StructDelete(Session,"turf_post_hours")>
<cfset StructDelete(Session,"turf_post_hoursa")>
<cfset StructDelete(Session,"turf_post_materials_actualprice")>
<cfset StructDelete(Session,"turf_post_materials_qty_actual")>
<cfset StructDelete(Session,"turf_post_overtime_adjustment")>
<cfset StructDelete(Session,"turf_post_qty")>
<cfset StructDelete(Session,"turf_post_service_materials")>
<cfset StructDelete(Session,"turf_post_times")>
<cfset StructDelete(Session,"turf_post_total_hours")>
<cfset StructDelete(Session,"turf_preg_actual_extended")>
<cfset StructDelete(Session,"turf_preg_actualprice")>
<cfset StructDelete(Session,"turf_preg_contract_price")>
<cfset StructDelete(Session,"turf_preg_hours")>
<cfset StructDelete(Session,"turf_preg_hoursa")>
<cfset StructDelete(Session,"turf_preg_materials_actualprice")>
<cfset StructDelete(Session,"turf_preg_materials_qty_actual")>
<cfset StructDelete(Session,"turf_preg_overtime_adjustment")>
<cfset StructDelete(Session,"turf_preg_qty")>
<cfset StructDelete(Session,"turf_preg_service_materials")>
<cfset StructDelete(Session,"turf_preg_times")>
<cfset StructDelete(Session,"turf_preg_total_hours")>
<cfset StructDelete(Session,"turf_prel_actual_extended")>
<cfset StructDelete(Session,"turf_prel_actualprice")>
<cfset StructDelete(Session,"turf_prel_contract_price")>
<cfset StructDelete(Session,"turf_prel_hours")>
<cfset StructDelete(Session,"turf_prel_hoursa")>
<cfset StructDelete(Session,"turf_prel_materials_actualprice")>
<cfset StructDelete(Session,"turf_prel_materials_qty_actual")>
<cfset StructDelete(Session,"turf_prel_overtime_adjustment")>
<cfset StructDelete(Session,"turf_prel_qty")>
<cfset StructDelete(Session,"turf_prel_service_materials")>
<cfset StructDelete(Session,"turf_prel_times")>
<cfset StructDelete(Session,"turf_prel_total_hours")>
<cfset StructDelete(Session,"turf_seed_actual_extended")>
<cfset StructDelete(Session,"turf_seed_actualprice")>
<cfset StructDelete(Session,"turf_seed_contract_price")>
<cfset StructDelete(Session,"turf_seed_hours")>
<cfset StructDelete(Session,"turf_seed_hoursa")>
<cfset StructDelete(Session,"turf_seed_materials_actualprice")>
<cfset StructDelete(Session,"turf_seed_materials_qty_actual")>
<cfset StructDelete(Session,"turf_seed_overtime_adjustment")>
<cfset StructDelete(Session,"turf_seed_qty")>
<cfset StructDelete(Session,"turf_seed_service_materials")>
<cfset StructDelete(Session,"turf_seed_times")>
<cfset StructDelete(Session,"turf_seed_total_hours")>
<cfset StructDelete(Session,"weeding_actual_extended")>
<cfset StructDelete(Session,"weeding_actualprice")>
<cfset StructDelete(Session,"weeding_contract_price")>
<cfset StructDelete(Session,"weeding_hours")>
<cfset StructDelete(Session,"weeding_hoursa")>
<cfset StructDelete(Session,"weeding_materials_rate")>
<cfset StructDelete(Session,"weeding_overtime_adjustment")>
<cfset StructDelete(Session,"weeding_qty")>
<cfset StructDelete(Session,"weeding_service_materials")>
<cfset StructDelete(Session,"weeding_times")>
<cfset StructDelete(Session,"weeding_total_hours")>
<cfset StructDelete(Session,"annuals_f_materials_actualprice")>
<cfset StructDelete(Session,"bush_hog_actualprice")>
<cfset StructDelete(Session,"bush_hog_contract_price")>
<cfset StructDelete(Session,"bush_hog_hours")>
<cfset StructDelete(Session,"bush_hog_hoursa")>
<cfset StructDelete(Session,"bush_hog_qty")>
<cfset StructDelete(Session,"bush_hog_service_materials")>
<cfset StructDelete(Session,"overtime_adjustment_rate")>
<cfset StructDelete(Session,"push_mow_actual_extended")>
<cfset StructDelete(Session,"push_mow_actualprice")>
<cfset StructDelete(Session,"push_mow_contract_price")>
<cfset StructDelete(Session,"push_mow_hours")>
<cfset StructDelete(Session,"push_mow_hoursa")>
<cfset StructDelete(Session,"push_mow_materials_rate")>
<cfset StructDelete(Session,"push_mow_overtime_adjustment")>
<cfset StructDelete(Session,"push_mow_qty")>
<cfset StructDelete(Session,"push_mow_service_materials")>
<cfset StructDelete(Session,"push_mow_times")>
<cfset StructDelete(Session,"push_mow_total_hours")>
<cfset StructDelete(Session,"ride_mow_actual_extended")>
<cfset StructDelete(Session,"ride_mow_actualprice")>
<cfset StructDelete(Session,"ride_mow_contract_price")>
<cfset StructDelete(Session,"ride_mow_hours")>
<cfset StructDelete(Session,"ride_mow_hoursa")>
<cfset StructDelete(Session,"ride_mow_materials_rate")>
<cfset StructDelete(Session,"ride_mow_overtime_adjustment")>
<cfset StructDelete(Session,"ride_mow_qty")>
<cfset StructDelete(Session,"ride_mow_service_materials")>
<cfset StructDelete(Session,"ride_mow_times")>
<cfset StructDelete(Session,"ride_mow_total_hours")>
<cfset StructDelete(Session,"seasonal_color_contract")>
<cfset StructDelete(Session,"walk_behind_actual_extended")>
<cfset StructDelete(Session,"walk_behind_actualprice")>
<cfset StructDelete(Session,"walk_behind_contract_price")>
<cfset StructDelete(Session,"walk_behind_hours")>
<cfset StructDelete(Session,"walk_behind_hoursa")>
<cfset StructDelete(Session,"walk_behind_materials_rate")>
<cfset StructDelete(Session,"walk_behind_overtime_adjustment")>
<cfset StructDelete(Session,"walk_behind_qty")>
<cfset StructDelete(Session,"walk_behind_service_materials")>
<cfset StructDelete(Session,"walk_behind_times")>
<cfset StructDelete(Session,"walk_behind_total_hours")>

<!---Clear All DE screen session variables--->
<cfset StructDelete(Session,"p1")>
<cfset StructDelete(Session,"p2")>
<!---<cfset StructDelete(Session,"p1_p2")>--->
<cfset StructDelete(Session,"p3")>
<cfset StructDelete(Session,"p4")>
<!---<cfset StructDelete(Session,"p3_p4")>--->
<cfset StructDelete(Session,"p5")>
<cfset StructDelete(Session,"p6")>
<!---<cfset StructDelete(Session,"p5_p6")>--->
<cfset StructDelete(Session,"p7")>
<cfset StructDelete(Session,"p8")>
<!---<cfset StructDelete(Session,"p7_p8")>--->
<cfset StructDelete(Session,"p9")>
<cfset StructDelete(Session,"p10")>
<!---<cfset StructDelete(Session,"p9_p10")>--->
<cfset StructDelete(Session,"w1")>
<cfset StructDelete(Session,"w2")>
<!---<cfset StructDelete(Session,"w1_w2")>--->
<cfset StructDelete(Session,"w3")>
<cfset StructDelete(Session,"w4")>
<!---<cfset StructDelete(Session,"w3_w4")>--->
<cfset StructDelete(Session,"w5")>
<cfset StructDelete(Session,"w6")>
<!---<cfset StructDelete(Session,"w5_w6")>--->
<cfset StructDelete(Session,"w7")>
<cfset StructDelete(Session,"w8")>
<!---<cfset StructDelete(Session,"w7_w8")>--->
<cfset StructDelete(Session,"w9")>
<cfset StructDelete(Session,"w10")>
<!---<cfset StructDelete(Session,"w9_w10")>--->
<cfset StructDelete(Session,"rm1")>
<cfset StructDelete(Session,"rm2")>
<!---<cfset StructDelete(Session,"rm1_rm2")>--->
<cfset StructDelete(Session,"rm3")>
<cfset StructDelete(Session,"rm4")>
<!---<cfset StructDelete(Session,"rm3_rm4")>--->
<cfset StructDelete(Session,"rm5")>
<cfset StructDelete(Session,"rm6")>
<!---<cfset StructDelete(Session,"rm5_rm6")>--->
<cfset StructDelete(Session,"rm7")>
<cfset StructDelete(Session,"rm8")>
<!---<cfset StructDelete(Session,"rm7_rm8")>--->
<cfset StructDelete(Session,"rm9")>
<cfset StructDelete(Session,"rm10")>
<!---<cfset StructDelete(Session,"rm9_rm10")>--->
<cfset StructDelete(Session,"mulch1")>
<cfset StructDelete(Session,"mulch2")>
<!---<cfset StructDelete(Session,"mulch1_mulch2")>--->
<cfset StructDelete(Session,"mulch3")>
<cfset StructDelete(Session,"mulch4")>
<!---<cfset StructDelete(Session,"mulch3_mulch4")>--->
<cfset StructDelete(Session,"mulch5")>
<cfset StructDelete(Session,"mulch6")>
<!---<cfset StructDelete(Session,"mulch5_mulch6")>--->
<cfset StructDelete(Session,"mulch7")>
<cfset StructDelete(Session,"mulch8")>
<!---<cfset StructDelete(Session,"mulch7_mulch8")>--->
<cfset StructDelete(Session,"mulch9")>
<cfset StructDelete(Session,"mulch10")>
<!---<cfset StructDelete(Session,"mulch9_mulch10")>--->
<cfset StructDelete(Session,"otslope1")>
<cfset StructDelete(Session,"otslope2")>
<cfset StructDelete(Session,"otslope3")>
<cfset StructDelete(Session,"otslope4")>
<cfset StructDelete(Session,"otslope5")>
<cfset StructDelete(Session,"otslope6")>
<cfset StructDelete(Session,"otslope7")>
<cfset StructDelete(Session,"otslope8")>
<cfset StructDelete(Session,"otslope9")>
<cfset StructDelete(Session,"otslope10")>
<cfset StructDelete(Session,"he1")>
<cfset StructDelete(Session,"he2")>
<cfset StructDelete(Session,"he3")>
<cfset StructDelete(Session,"he4")>
<cfset StructDelete(Session,"he5")>
<cfset StructDelete(Session,"he6")>
<cfset StructDelete(Session,"he7")>
<cfset StructDelete(Session,"he8")>
<cfset StructDelete(Session,"he9")>
<cfset StructDelete(Session,"he10")>
<cfset StructDelete(Session,"be1")>
<cfset StructDelete(Session,"be2")>
<cfset StructDelete(Session,"be3")>
<cfset StructDelete(Session,"be4")>
<cfset StructDelete(Session,"be5")>
<cfset StructDelete(Session,"be6")>
<cfset StructDelete(Session,"be7")>
<cfset StructDelete(Session,"be8")>
<cfset StructDelete(Session,"be9")>
<cfset StructDelete(Session,"be10")>
<cfset StructDelete(Session,"we1")>
<cfset StructDelete(Session,"we2")>
<cfset StructDelete(Session,"we3")>
<cfset StructDelete(Session,"we4")>
<cfset StructDelete(Session,"we5")>
<cfset StructDelete(Session,"we6")>
<cfset StructDelete(Session,"we7")>
<cfset StructDelete(Session,"we8")>
<cfset StructDelete(Session,"we9")>
<cfset StructDelete(Session,"we10")>
<cfset StructDelete(Session,"mra1")>
<cfset StructDelete(Session,"mra2")>
<cfset StructDelete(Session,"mra3")>
<cfset StructDelete(Session,"mra4")>
<cfset StructDelete(Session,"mra5")>
<cfset StructDelete(Session,"mra6")>
<cfset StructDelete(Session,"mra7")>
<cfset StructDelete(Session,"mra8")>
<cfset StructDelete(Session,"mra9")>
<cfset StructDelete(Session,"mra10")>
<cfset StructDelete(Session,"mrb1")>
<cfset StructDelete(Session,"mrb2")>
<cfset StructDelete(Session,"mrb3")>
<cfset StructDelete(Session,"mrb4")>
<cfset StructDelete(Session,"mrb5")>
<cfset StructDelete(Session,"mrb6")>
<cfset StructDelete(Session,"mrb7")>
<cfset StructDelete(Session,"mrb8")>
<cfset StructDelete(Session,"mrb9")>
<cfset StructDelete(Session,"mrb10")>
<cfset StructDelete(Session,"tsp1")>
<cfset StructDelete(Session,"tsp2")>
<cfset StructDelete(Session,"tsp3")>
<cfset StructDelete(Session,"tsp4")>
<cfset StructDelete(Session,"tsp5")>
<cfset StructDelete(Session,"tsp6")>
<cfset StructDelete(Session,"tsp7")>
<cfset StructDelete(Session,"tsp8")>
<cfset StructDelete(Session,"tsp9")>
<cfset StructDelete(Session,"tsp10")>
<cfset StructDelete(Session,"wp1")>
<cfset StructDelete(Session,"wp2")>
<cfset StructDelete(Session,"wp3")>
<cfset StructDelete(Session,"wp4")>
<cfset StructDelete(Session,"wp5")>
<cfset StructDelete(Session,"wp6")>
<cfset StructDelete(Session,"wp7")>
<cfset StructDelete(Session,"wp8")>
<cfset StructDelete(Session,"wp9")>
<cfset StructDelete(Session,"wp10")>
<cfset StructDelete(Session,"a1")>
<cfset StructDelete(Session,"a2")>
<cfset StructDelete(Session,"a3")>
<cfset StructDelete(Session,"a4")>
<cfset StructDelete(Session,"a5")>
<cfset StructDelete(Session,"a6")>
<cfset StructDelete(Session,"a7")>
<cfset StructDelete(Session,"a8")>
<cfset StructDelete(Session,"a9")>
<cfset StructDelete(Session,"a10")>
<cfset StructDelete(Session,"p11")>
<cfset StructDelete(Session,"p12")>
<cfset StructDelete(Session,"p13")>
<cfset StructDelete(Session,"p14")>
<cfset StructDelete(Session,"p15")>
<cfset StructDelete(Session,"p16")>
<cfset StructDelete(Session,"p17")>
<cfset StructDelete(Session,"p18")>
<cfset StructDelete(Session,"p19")>
<cfset StructDelete(Session,"p20")>
<cfset StructDelete(Session,"w11")>
<cfset StructDelete(Session,"w12")>
<cfset StructDelete(Session,"w13")>
<cfset StructDelete(Session,"w14")>
<cfset StructDelete(Session,"w15")>
<cfset StructDelete(Session,"w16")>
<cfset StructDelete(Session,"w17")>
<cfset StructDelete(Session,"w18")>
<cfset StructDelete(Session,"w19")>
<cfset StructDelete(Session,"w20")>
<cfset StructDelete(Session,"rm11")>
<cfset StructDelete(Session,"rm12")>
<cfset StructDelete(Session,"rm13")>
<cfset StructDelete(Session,"rm14")>
<cfset StructDelete(Session,"rm15")>
<cfset StructDelete(Session,"rm16")>
<cfset StructDelete(Session,"rm17")>
<cfset StructDelete(Session,"rm18")>
<cfset StructDelete(Session,"rm19")>
<cfset StructDelete(Session,"rm20")>
<cfset StructDelete(Session,"mulch11")>
<cfset StructDelete(Session,"mulch12")>
<cfset StructDelete(Session,"mulch13")>
<cfset StructDelete(Session,"mulch14")>
<cfset StructDelete(Session,"mulch15")>
<cfset StructDelete(Session,"mulch16")>
<cfset StructDelete(Session,"mulch17")>
<cfset StructDelete(Session,"mulch18")>
<cfset StructDelete(Session,"mulch19")>
<cfset StructDelete(Session,"mulch20")>

<!---Clear All E screen session variables--->

<!---Set CFPARAM to 0--->
<cfparam  name="Session.p1" default="0"  >
<cfparam  name="Session.p2" default="0">
<cfparam  name="Session.p1_p2" default="0">
<cfparam  name="p1" default="0"  >
<cfparam  name="p2" default="0">
<cfparam  name="p1_p2" default="0">
<cfparam  name="Session.p3" default="0"  >
<cfparam  name="Session.p4" default="0">
<cfparam  name="Session.p3_p4" default="0">
<cfparam  name="p3" default="0"  >
<cfparam  name="p4" default="0">
<cfparam  name="p3_p4" default="0">
<cfparam  name="Session.p5" default="0"  >
<cfparam  name="Session.p6" default="0">
<cfparam  name="p5" default="0"  >
<cfparam  name="p6" default="0">
<cfparam  name="p5_p6" default="0">
<cfparam  name="Session.p7" default="0"  >
<cfparam  name="Session.p8" default="0">
<cfparam  name="p7" default="0"  >
<cfparam  name="p8" default="0">
<cfparam  name="p7_p8" default="0">
<cfparam  name="Session.p9" default="0"  >
<cfparam  name="Session.p10" default="0">
<cfparam  name="p9" default="0"  >
<cfparam  name="p10" default="0">
<cfparam  name="p9_p10" default="0">
<cfparam  name="Session.w1" default="0"  >
<cfparam  name="Session.w2" default="0">
<cfparam  name="w1" default="0"  >
<cfparam  name="w2" default="0">
<cfparam  name="w1_w2" default="0">
<cfparam  name="Session.w3" default="0"  >
<cfparam  name="Session.w4" default="0">
<cfparam  name="w3" default="0"  >
<cfparam  name="w4" default="0">
<cfparam  name="w3_w4" default="0">
<cfparam  name="Session.w5" default="0"  >
<cfparam  name="Session.w6" default="0">
<cfparam  name="w5" default="0"  >
<cfparam  name="w6" default="0">
<cfparam  name="w5_w6" default="0">
<cfparam  name="Session.w7" default="0"  >
<cfparam  name="Session.w8" default="0">
<cfparam  name="w7" default="0"  >
<cfparam  name="w8" default="0">
<cfparam  name="w7_w8" default="0">
<cfparam  name="Session.w9" default="0"  >
<cfparam  name="Session.w10" default="0">
<cfparam  name="w9" default="0"  >
<cfparam  name="w10" default="0">
<cfparam  name="w9_w10" default="0">
<cfparam  name="Session.rm1" default="0"  >
<cfparam  name="Session.rm2" default="0">
<cfparam  name="rm1_rm2" default="0">
<cfparam  name="rm1" default="0"  >
<cfparam  name="rm2" default="0">
<cfparam  name="rm1_rm2" default="0">
<cfparam  name="Session.rm3" default="0"  >
<cfparam  name="Session.rm4" default="0">
<cfparam  name="rm3" default="0"  >
<cfparam  name="rm4" default="0">
<cfparam  name="rm3_rm4" default="0">
<cfparam  name="Session.rm5" default="0"  >
<cfparam  name="Session.rm6" default="0">
<cfparam  name="rm5" default="0"  >
<cfparam  name="rm6" default="0">
<cfparam  name="rm5_rm6" default="0">
<cfparam  name="Session.rm7" default="0"  >
<cfparam  name="Session.rm8" default="0">
<cfparam  name="rm7" default="0"  >
<cfparam  name="rm8" default="0">
<cfparam  name="rm7_rm8" default="0">
<cfparam  name="Session.rm9" default="0"  >
<cfparam  name="Session.rm10" default="0">
<cfparam  name="rm9" default="0"  >
<cfparam  name="rm10" default="0">
<cfparam  name="rm9_rm10" default="0">
<cfparam  name="Session.mulch1" default="0"  >
<cfparam  name="Session.mulch2" default="0">
<cfparam  name="mulch1" default="0"  >
<cfparam  name="mulch2" default="0">
<cfparam  name="mulch1_mulch2" default="0">
<cfparam  name="Session.mulch3" default="0"  >
<cfparam  name="Session.mulch4" default="0">
<cfparam  name="mulch3" default="0"  >
<cfparam  name="mulch4" default="0">
<cfparam  name="mulch3_mulch4" default="0">
<cfparam  name="Session.mulch5" default="0"  >
<cfparam  name="Session.mulch6" default="0">
<cfparam  name="mulch5" default="0"  >
<cfparam  name="mulch6" default="0">
<cfparam  name="mulch5_mulch6" default="0">
<cfparam  name="Session.mulch7" default="0"  >
<cfparam  name="Session.mulch8" default="0">
<cfparam  name="mulch7" default="0"  >
<cfparam  name="mulch8" default="0">
<cfparam  name="mulch7_mulch8" default="0">
<cfparam  name="Session.mulch9" default="0"  >
<cfparam  name="Session.mulch10" default="0">
<cfparam  name="mulch9" default="0"  >
<cfparam  name="mulch10" default="0">
<cfparam  name="mulch9_mulch10" default="0">
<cfparam  name="Session.otslope1" default="0"  >
<cfparam  name="Session.otslope2" default="0">
<cfparam  name="otslope1" default="0"  >
<cfparam  name="otslope2" default="0">
<cfparam  name="Session.otslope3" default="0"  >
<cfparam  name="Session.otslope4" default="0">
<cfparam  name="otslope3" default="0"  >
<cfparam  name="otslope4" default="0">
<cfparam  name="Session.otslope5" default="0"  >
<cfparam  name="Session.otslope6" default="0">
<cfparam  name="otslope5" default="0"  >
<cfparam  name="otslope6" default="0">
<cfparam  name="Session.otslope7" default="0"  >
<cfparam  name="Session.otslope8" default="0">
<cfparam  name="otslope7" default="0"  >
<cfparam  name="otslope8" default="0">
<cfparam  name="Session.otslope9" default="0"  >
<cfparam  name="Session.otslope10" default="0">
<cfparam  name="otslope9" default="0"  >
<cfparam  name="otslope10" default="0">
<cfparam  name="Session.he1" default="0"  >
<cfparam  name="Session.he2" default="0">
<cfparam  name="he1" default="0"  >
<cfparam  name="he2" default="0">
<cfparam  name="Session.he3" default="0"  >
<cfparam  name="Session.he4" default="0">
<cfparam  name="he3" default="0"  >
<cfparam  name="he4" default="0">
<cfparam  name="Session.he5" default="0"  >
<cfparam  name="Session.he6" default="0">
<cfparam  name="he5" default="0"  >
<cfparam  name="he6" default="0">
<cfparam  name="Session.he7" default="0"  >
<cfparam  name="Session.he8" default="0">
<cfparam  name="he7" default="0"  >
<cfparam  name="he8" default="0">
<cfparam  name="Session.he9" default="0"  >
<cfparam  name="Session.he10" default="0">
<cfparam  name="he9" default="0"  >
<cfparam  name="he10" default="0">
<cfparam  name="Session.be1" default="0"  >
<cfparam  name="Session.be2" default="0">
<cfparam  name="be1" default="0"  >
<cfparam  name="be2" default="0">
<cfparam  name="Session.be3" default="0"  >
<cfparam  name="Session.be4" default="0">
<cfparam  name="be3" default="0"  >
<cfparam  name="be4" default="0">
<cfparam  name="Session.be5" default="0"  >
<cfparam  name="Session.be6" default="0">
<cfparam  name="be5" default="0"  >
<cfparam  name="be6" default="0">
<cfparam  name="Session.be7" default="0"  >
<cfparam  name="Session.be8" default="0">
<cfparam  name="be7" default="0"  >
<cfparam  name="be8" default="0">
<cfparam  name="Session.be9" default="0"  >
<cfparam  name="Session.be10" default="0">
<cfparam  name="be9" default="0"  >
<cfparam  name="be10" default="0">
<cfparam  name="Session.we1" default="0"  >
<cfparam  name="Session.we2" default="0">
<cfparam  name="we1" default="0"  >
<cfparam  name="we2" default="0">
<cfparam  name="Session.we3" default="0"  >
<cfparam  name="Session.we4" default="0">
<cfparam  name="we3" default="0"  >
<cfparam  name="we4" default="0">
<cfparam  name="Session.we5" default="0"  >
<cfparam  name="Session.we6" default="0">
<cfparam  name="we5" default="0"  >
<cfparam  name="we6" default="0">
<cfparam  name="Session.we7" default="0"  >
<cfparam  name="Session.we8" default="0">
<cfparam  name="we7" default="0"  >
<cfparam  name="we8" default="0">
<cfparam  name="Session.we9" default="0"  >
<cfparam  name="Session.we10" default="0">
<cfparam  name="we9" default="0"  >
<cfparam  name="we10" default="0">
<cfparam  name="Session.mra1" default="0"  >
<cfparam  name="Session.mra2" default="0">
<cfparam  name="mra1" default="0"  >
<cfparam  name="mra2" default="0">
<cfparam  name="Session.mra3" default="0"  >
<cfparam  name="Session.mra4" default="0">
<cfparam  name="mra3" default="0"  >
<cfparam  name="mra4" default="0">
<cfparam  name="Session.mra5" default="0"  >
<cfparam  name="Session.mra6" default="0">
<cfparam  name="mra5" default="0"  >
<cfparam  name="mra6" default="0">
<cfparam  name="Session.mra7" default="0"  >
<cfparam  name="Session.mra8" default="0">
<cfparam  name="mra7" default="0"  >
<cfparam  name="mra8" default="0">
<cfparam  name="Session.mra9" default="0"  >
<cfparam  name="Session.mra10" default="0">
<cfparam  name="mra9" default="0"  >
<cfparam  name="mra10" default="0">
<cfparam  name="Session.mrb1" default="0"  >
<cfparam  name="Session.mrb2" default="0">
<cfparam  name="mrb1" default="0"  >
<cfparam  name="mrb2" default="0">
<cfparam  name="Session.mrb3" default="0"  >
<cfparam  name="Session.mrb4" default="0">
<cfparam  name="mrb3" default="0"  >
<cfparam  name="mrb4" default="0">
<cfparam  name="Session.mrb5" default="0"  >
<cfparam  name="Session.mrb6" default="0">
<cfparam  name="mrb5" default="0"  >
<cfparam  name="mrb6" default="0">
<cfparam  name="Session.mrb7" default="0"  >
<cfparam  name="Session.mrb8" default="0">
<cfparam  name="mrb7" default="0"  >
<cfparam  name="mrb8" default="0">
<cfparam  name="Session.mrb9" default="0"  >
<cfparam  name="Session.mrb10" default="0">
<cfparam  name="mrb9" default="0"  >
<cfparam  name="mrb10" default="0">
<cfparam  name="Session.tsp1" default="0"  >
<cfparam  name="Session.tsp2" default="0">
<cfparam  name="tsp1" default="0"  >
<cfparam  name="tsp2" default="0">
<cfparam  name="Session.tsp3" default="0"  >
<cfparam  name="Session.tsp4" default="0">
<cfparam  name="tsp3" default="0"  >
<cfparam  name="tsp4" default="0">
<cfparam  name="Session.tsp5" default="0"  >
<cfparam  name="Session.tsp6" default="0">
<cfparam  name="tsp5" default="0"  >
<cfparam  name="tsp6" default="0">
<cfparam  name="Session.tsp7" default="0"  >
<cfparam  name="Session.tsp8" default="0">
<cfparam  name="tsp7" default="0"  >
<cfparam  name="tsp8" default="0">
<cfparam  name="Session.tsp9" default="0"  >
<cfparam  name="Session.tsp10" default="0">
<cfparam  name="tsp9" default="0"  >
<cfparam  name="tsp10" default="0">
<cfparam  name="Session.wp1" default="0"  >
<cfparam  name="Session.wp2" default="0">
<cfparam  name="wp1" default="0"  >
<cfparam  name="wp2" default="0">
<cfparam  name="Session.wp3" default="0"  >
<cfparam  name="Session.wp4" default="0">
<cfparam  name="wp3" default="0"  >
<cfparam  name="wp4" default="0">
<cfparam  name="Session.wp5" default="0"  >
<cfparam  name="Session.wp6" default="0">
<cfparam  name="wp5" default="0"  >
<cfparam  name="wp6" default="0">
<cfparam  name="Session.wp7" default="0"  >
<cfparam  name="Session.wp8" default="0">
<cfparam  name="wp7" default="0"  >
<cfparam  name="wp8" default="0">
<cfparam  name="Session.wp9" default="0"  >
<cfparam  name="Session.wp10" default="0">
<cfparam  name="wp9" default="0"  >
<cfparam  name="wp10" default="0">
<cfparam  name="Session.a1" default="0"  >
<cfparam  name="Session.a2" default="0">
<cfparam  name="a1" default="0"  >
<cfparam  name="a2" default="0">
<cfparam  name="Session.a3" default="0"  >
<cfparam  name="Session.a4" default="0">
<cfparam  name="a3" default="0"  >
<cfparam  name="a4" default="0">
<cfparam  name="Session.a5" default="0"  >
<cfparam  name="Session.a6" default="0">
<cfparam  name="a5" default="0"  >
<cfparam  name="a6" default="0">
<cfparam  name="Session.a7" default="0"  >
<cfparam  name="Session.a8" default="0">
<cfparam  name="a7" default="0"  >
<cfparam  name="a8" default="0">
<cfparam  name="Session.a9" default="0"  >
<cfparam  name="Session.a10" default="0">
<cfparam  name="a9" default="0"  >
<cfparam  name="a10" default="0">
<cfparam  name="Session.p11" default="0"  >
<cfparam  name="Session.p12" default="0">
<cfparam  name="p11" default="0"  >
<cfparam  name="p12" default="0">
<cfparam  name="p11_p12" default="0">
<cfparam  name="Session.p13" default="0"  >
<cfparam  name="Session.p14" default="0">
<cfparam  name="p13" default="0"  >
<cfparam  name="p14" default="0">
<cfparam  name="p13_p14" default="0">
<cfparam  name="Session.p15" default="0"  >
<cfparam  name="Session.p16" default="0">
<cfparam  name="p15" default="0"  >
<cfparam  name="p16" default="0">
<cfparam  name="p15_p16" default="0">
<cfparam  name="Session.p17" default="0"  >
<cfparam  name="Session.p18" default="0">
<cfparam  name="p17" default="0"  >
<cfparam  name="p18" default="0">
<cfparam  name="p17_p18" default="0">
<cfparam  name="Session.p19" default="0"  >
<cfparam  name="Session.p20" default="0">
<cfparam  name="p19" default="0"  >
<cfparam  name="p20" default="0">
<cfparam  name="p19_p20" default="0">
<cfparam  name="Session.w11" default="0"  >
<cfparam  name="Session.w12" default="0">
<cfparam  name="w11" default="0"  >
<cfparam  name="w12" default="0">
<cfparam  name="w11_w12" default="0">
<cfparam  name="Session.w13" default="0"  >
<cfparam  name="Session.w14" default="0">
<cfparam  name="w13" default="0"  >
<cfparam  name="w14" default="0">
<cfparam  name="w13_w14" default="0">
<cfparam  name="Session.w15" default="0"  >
<cfparam  name="Session.w16" default="0">
<cfparam  name="w15" default="0"  >
<cfparam  name="w16" default="0">
<cfparam  name="w15_w16" default="0">
<cfparam  name="Session.w17" default="0"  >
<cfparam  name="Session.w18" default="0">
<cfparam  name="w17" default="0"  >
<cfparam  name="w18" default="0">
<cfparam  name="w17_w18" default="0">
<cfparam  name="Session.w19" default="0"  >
<cfparam  name="Session.w20" default="0">
<cfparam  name="w19" default="0"  >
<cfparam  name="w20" default="0">
<cfparam  name="w19_w20" default="0">
<cfparam  name="Session.rm11" default="0"  >
<cfparam  name="Session.rm12" default="0">
<cfparam  name="rm11" default="0"  >
<cfparam  name="rm12" default="0">
<cfparam  name="rm11_rm12" default="0">
<cfparam  name="Session.rm13" default="0"  >
<cfparam  name="Session.rm14" default="0">
<cfparam  name="rm13" default="0"  >
<cfparam  name="rm14" default="0">
<cfparam  name="rm13_rm14" default="0">
<cfparam  name="Session.rm15" default="0"  >
<cfparam  name="Session.rm16" default="0">
<cfparam  name="rm15" default="0"  >
<cfparam  name="rm16" default="0">
<cfparam  name="rm15_rm16" default="0">
<cfparam  name="Session.rm17" default="0"  >
<cfparam  name="Session.rm18" default="0">
<cfparam  name="rm17" default="0"  >
<cfparam  name="rm18" default="0">
<cfparam  name="rm17_rm18" default="0">
<cfparam  name="Session.rm19" default="0"  >
<cfparam  name="Session.rm20" default="0">
<cfparam  name="rm19" default="0"  >
<cfparam  name="rm20" default="0">
<cfparam  name="rm19_rm20" default="0">
<cfparam  name="Session.mulch11" default="0"  >
<cfparam  name="Session.mulch12" default="0">
<cfparam  name="mulch11" default="0"  >
<cfparam  name="mulch12" default="0">
<cfparam  name="mulch11_mulch12" default="0">
<cfparam  name="Session.mulch13" default="0"  >
<cfparam  name="Session.mulch14" default="0">
<cfparam  name="mulch13" default="0"  >
<cfparam  name="mulch14" default="0">
<cfparam  name="mulch13_mulch14" default="0">
<cfparam  name="Session.mulch15" default="0"  >
<cfparam  name="Session.mulch16" default="0">
<cfparam  name="mulch15" default="0"  >
<cfparam  name="mulch16" default="0">
<cfparam  name="mulch15_mulch16" default="0">
<cfparam  name="Session.mulch17" default="0"  >
<cfparam  name="Session.mulch18" default="0">
<cfparam  name="mulch17" default="0"  >
<cfparam  name="mulch18" default="0">
<cfparam  name="mulch17_mulch18" default="0">
<cfparam  name="Session.mulch19" default="0"  >
<cfparam  name="Session.mulch20" default="0">
<cfparam  name="mulch19" default="0"  >
<cfparam  name="mulch20" default="0">
<cfparam  name="mulch19_mulch20" default="0">

<!--- <CFSET p1_p2 = Session.p1*Session.p2>--->
<!---END Set CFPARAM to 0--->

<!--- Quote dimension Entry Insert --->
<cfquery name="check_for_quote_dimensions" datasource="jrgm">
SELECT opportunity_id FROM quote_dimensions  WHERE  opportunity_id =#url.id#
</cfquery>
<cfif check_for_quote_dimensions.recordcount EQ 0>
  <cfquery name="insert_quote_dimensions" datasource="jrgm">
INSERT INTO quote_dimensions (opportunity_id) VALUES ('#url.id#')
</cfquery>
  <cfset p1_p2= P1*P2>
  <cfset p3_p4= P3*P4>
  <cfset p5_p6= P5*P6>
  <cfset p7_p8= P7*P8>
  <cfset p9_p10= P9*P10>
  <cfset p11_p12= P11*P12>
  <cfset p13_p14= P13*P14>
  <cfset p15_p16= P15*P16>
  <cfset p17_p18= P17*P18>
  <cfset p19_p20= P19*P20>
  <cfset w1_w2= w1*w2>
  <cfset w3_w4= w3*w4>
  <cfset w5_w6= w5*w6>
  <cfset w7_w8= w7*w8>
  <cfset w9_w10= w9*w10>
  <cfset w11_w12= w11*w12>
  <cfset w13_w14= w13*w14>
  <cfset w15_w16= w15*w16>
  <cfset w17_w18= w17*w18>
  <cfset w19_w20= w19*w20>
  <cfset rm1_rm2= rm1*rm2>
  <cfset rm3_rm4= rm3*rm4>
  <cfset rm5_rm6= rm5*rm6>
  <cfset rm7_rm8= rm7*rm8>
  <cfset rm9_rm10= rm9*rm10>
  <cfset rm11_rm12= rm11*rm12>
  <cfset rm13_rm14= rm13*rm14>
  <cfset rm15_rm16= rm15*rm16>
  <cfset rm17_rm18= rm17*rm18>
  <cfset rm19_rm20= rm19*rm20>
  <cfset mulch1_mulch2= mulch1*mulch2>
  <cfset mulch3_mulch4= mulch3*mulch4>
  <cfset mulch5_mulch6= mulch5*mulch6>
  <cfset mulch7_mulch8= mulch7*mulch8>
  <cfset mulch9_mulch10= mulch9*mulch10>
  <cfset mulch11_mulch12= mulch11*mulch12>
  <cfset mulch13_mulch14= mulch13*mulch14>
  <cfset mulch15_mulch16= mulch15*mulch16>
  <cfset mulch17_mulch18= mulch17*mulch18>
  <cfset mulch19_mulch20= mulch19*mulch20>
  <cfquery name="do_update_quote_dimensions" datasource="jrgm">
UPDATE quote_dimensions SET 
p1 = '#p1#', 
p2 =  '#p2#',
p1_p2 = '#p1_p2#' ,
p3 = '#p3#', 
p4 =  '#p4#',
p3_p4 = '#p3_p4#' ,
p5 = '#p5#', 
p6 =  '#p6#',
p5_p6 = '#p5_p6#' ,
p7 = '#p7#', 
p8 =  '#p8#',
p7_p8 = '#p7_p8#' ,
p9 = '#p9#', 
p10 =  '#p10#',
p9_p10 = '#p9_p10#' ,
w1 = '#w1#', 
w2 =  '#w2#',
w1_w2 = '#w1_w2#' ,
w3 = '#w3#', 
w4 =  '#w4#',
w3_w4 = '#w3_w4#' ,
w5 = '#w5#', 
w6 =  '#w6#',
w5_w6 = '#w5_w6#' ,
w7 = '#w7#', 
w8 =  '#w8#',
w7_w8 = '#w7_w8#' ,
w9 = '#w9#', 
w10 =  '#w10#',
w9_w10 = '#w9_w10#' ,
rm1 = '#rm1#', 
rm2 =  '#rm2#',
rm1_rm2 = '#rm1_rm2#' ,
rm3 = '#rm3#', 
rm4 =  '#rm4#',
rm3_rm4 = '#rm3_rm4#' ,
rm5 = '#rm5#', 
rm6 =  '#rm6#',
rm5_rm6 = '#rm5_rm6#' ,
rm7 = '#rm7#', 
rm8 =  '#rm8#',
rm7_rm8 = '#rm7_rm8#' ,
rm9 = '#rm9#', 
rm10 =  '#rm10#',
rm9_rm10 = '#rm9_rm10#' ,
mulch1 = '#mulch1#', 
mulch2 =  '#mulch2#',
mulch1_mulch2 = '#mulch1_mulch2#' ,
mulch3 = '#mulch3#', 
mulch4 =  '#mulch4#',
mulch3_mulch4 = '#mulch3_mulch4#' ,
mulch5 = '#mulch5#', 
mulch6 =  '#mulch6#',
mulch5_mulch6 = '#mulch5_mulch6#' ,
mulch7 = '#mulch7#', 
mulch8 =  '#mulch8#',
mulch7_mulch8 = '#mulch7_mulch8#' ,
mulch9 = '#mulch9#', 
mulch10 =  '#mulch10#',
mulch9_mulch10 = '#mulch9_mulch10#' ,
otslope1 = '#otslope1#', 
otslope2 =  '#otslope2#',
otslope3 = '#otslope3#', 
otslope4 =  '#otslope4#',
otslope5 = '#otslope5#', 
otslope6 =  '#otslope6#',
otslope7 = '#otslope7#', 
otslope8 =  '#otslope8#',
otslope9 = '#otslope9#', 
otslope10 =  '#otslope10#',
he1 = '#he1#', 
he2 =  '#he2#',
he3 = '#he3#', 
he4 =  '#he4#',
he5 = '#he5#', 
he6 =  '#he6#',
he7 = '#he7#', 
he8 =  '#he8#',
he9 = '#he9#', 
he10 =  '#he10#',
be1 = '#be1#', 
be2 =  '#be2#',
be3 = '#be3#', 
be4 =  '#be4#',
be5 = '#be5#', 
be6 =  '#be6#',
be7 = '#be7#', 
be8 =  '#be8#',
be9 = '#be9#', 
be10 =  '#be10#',
we1 = '#we1#', 
we2 =  '#we2#',
we3 = '#we3#', 
we4 =  '#we4#',
we5 = '#we5#', 
we6 =  '#we6#',
we7 = '#we7#', 
we8 =  '#we8#',
we9 = '#we9#', 
we10 =  '#we10#',
mra1 = '#mra1#', 
mra2 =  '#mra2#',
mra3 = '#mra3#', 
mra4 =  '#mra4#',
mra5 = '#mra5#', 
mra6 =  '#mra6#',
mra7 = '#mra7#', 
mra8 =  '#mra8#',
mra9 = '#mra9#', 
mra10 =  '#mra10#',
mrb1 = '#mrb1#', 
mrb2 =  '#mrb2#',
mrb3 = '#mrb3#', 
mrb4 =  '#mrb4#',
mrb5 = '#mrb5#', 
mrb6 =  '#mrb6#',
mrb7 = '#mrb7#', 
mrb8 =  '#mrb8#',
mrb9 = '#mrb9#', 
mrb10 =  '#mrb10#',
tsp1 = '#tsp1#', 
tsp2 =  '#tsp2#',
tsp3 = '#tsp3#', 
tsp4 =  '#tsp4#',
tsp5 = '#tsp5#', 
tsp6 =  '#tsp6#',
tsp7 = '#tsp7#', 
tsp8 =  '#tsp8#',
tsp9 = '#tsp9#', 
tsp10 =  '#tsp10#',
wp1 = '#wp1#', 
wp2 =  '#wp2#',
wp3 = '#wp3#', 
wp4 =  '#wp4#',
wp5 = '#wp5#', 
wp6 =  '#wp6#',
wp7 = '#wp7#', 
wp8 =  '#wp8#',
wp9 = '#wp9#', 
wp10 =  '#wp10#',
a1 = '#a1#', 
a2 =  '#a2#',
a3 = '#a3#', 
a4 =  '#a4#',
a5 = '#a5#', 
a6 =  '#a6#',
a7 = '#a7#', 
a8 =  '#a8#',
a9 = '#a9#', 
a10 =  '#a10#',
p11 = '#p11#', 
p12 =  '#p12#',
p11_p12 = '#p11_p12#' ,
p13 = '#p13#', 
p14 =  '#p14#',
p13_p14 = '#p13_p14#' ,
p15 = '#p15#', 
p16 =  '#p16#',
p15_p16 = '#p15_p16#' ,
p17 = '#p17#', 
p18 =  '#p18#',
p17_p18 = '#p17_p18#' ,
p19 = '#p19#', 
p20 =  '#p20#',
p19_p20 = '#p19_p20#' ,
w11 = '#w11#', 
w12 =  '#w12#',
w11_w12 = '#w11_w12#' ,
w13 = '#w13#', 
w14 =  '#w14#',
w13_w14 = '#w13_w14#' ,
w15 = '#w15#', 
w16 =  '#w16#',
w15_w16 = '#w15_w16#' ,
w17 = '#w17#', 
w18 =  '#w18#',
w17_w18 = '#w17_w18#' ,
w19 = '#w19#', 
w20 =  '#w20#',
w19_w20 = '#w19_w20#' ,
rm11 = '#rm11#', 
rm12 =  '#rm12#',
rm11_rm12 = '#rm11_rm12#' ,
rm13 = '#rm13#', 
rm14 =  '#rm14#',
rm13_rm14 = '#rm13_rm14#' ,
rm15 = '#rm15#', 
rm16 =  '#rm16#',
rm15_rm16 = '#rm15_rm16#' ,
rm17 = '#rm17#', 
rm18 =  '#rm18#',
rm17_rm18 = '#rm17_rm18#' ,
rm19 = '#rm19#', 
rm20 =  '#rm20#',
rm19_rm20 = '#rm19_rm20#' ,
mulch11 = '#mulch11#', 
mulch12 =  '#mulch12#',
mulch11_mulch12 = '#mulch11_mulch12#' ,
mulch13 = '#mulch13#', 
mulch14 =  '#mulch14#',
mulch13_mulch14 = '#mulch13_mulch14#' ,
mulch15 = '#mulch15#', 
mulch16 =  '#mulch16#',
mulch15_mulch16 = '#mulch15_mulch16#' ,
mulch17 = '#mulch17#', 
mulch18 =  '#mulch18#',
mulch17_mulch18 = '#mulch17_mulch18#' ,
mulch19 = '#mulch19#', 
mulch20 =  '#mulch20#',
mulch19_mulch20 = '#mulch19_mulch20#' 
WHERE opportunity_id = #url.id#
</cfquery>
</cfif>
<!--- END Quote dimension Entry Insert --->

<cfif IsDefined("form.btnSumit")  >
  <!--- UPDATE Quote dimension Entry   --->
  
  <cfset p1_p2= P1*P2>
  <cfset p3_p4= P3*P4>
  <cfset p5_p6= P5*P6>
  <cfset p7_p8= P7*P8>
  <cfset p9_p10= P9*P10>
  <cfset p11_p12= P11*P12>
  <cfset p13_p14= P13*P14>
  <cfset p15_p16= P15*P16>
  <cfset p17_p18= P17*P18>
  <cfset p19_p20= P19*P20>
  <cfset w1_w2= w1*w2>
  <cfset w3_w4= w3*w4>
  <cfset w5_w6= w5*w6>
  <cfset w7_w8= w7*w8>
  <cfset w9_w10= w9*w10>
  <cfset w11_w12= w11*w12>
  <cfset w13_w14= w13*w14>
  <cfset w15_w16= w15*w16>
  <cfset w17_w18= w17*w18>
  <cfset w19_w20= w19*w20>
  <cfset rm1_rm2= rm1*rm2>
  <cfset rm3_rm4= rm3*rm4>
  <cfset rm5_rm6= rm5*rm6>
  <cfset rm7_rm8= rm7*rm8>
  <cfset rm9_rm10= rm9*rm10>
  <cfset rm11_rm12= rm11*rm12>
  <cfset rm13_rm14= rm13*rm14>
  <cfset rm15_rm16= rm15*rm16>
  <cfset rm17_rm18= rm17*rm18>
  <cfset rm19_rm20= rm19*rm20>
  <cfset mulch1_mulch2= mulch1*mulch2>
  <cfset mulch3_mulch4= mulch3*mulch4>
  <cfset mulch5_mulch6= mulch5*mulch6>
  <cfset mulch7_mulch8= mulch7*mulch8>
  <cfset mulch9_mulch10= mulch9*mulch10>
  <cfset mulch11_mulch12= mulch11*mulch12>
  <cfset mulch13_mulch14= mulch13*mulch14>
  <cfset mulch15_mulch16= mulch15*mulch16>
  <cfset mulch17_mulch18= mulch17*mulch18>
  <cfset mulch19_mulch20= mulch19*mulch20>
  <cfquery name="do_update_quote_dimensions" datasource="jrgm">
UPDATE quote_dimensions SET 
p1 = '#p1#', 
p2 =  '#p2#',
p1_p2 = '#p1_p2#' ,
p3 = '#p3#', 
p4 =  '#p4#',
p3_p4 = '#p3_p4#' ,
p5 = '#p5#', 
p6 =  '#p6#',
p5_p6 = '#p5_p6#',
p7 = '#p7#', 
p8 =  '#p8#',
p7_p8 = '#p7_p8#' ,
p9 = '#p9#', 
p10 =  '#p10#',
p9_p10 = '#p9_p10#',
w1 = '#w1#', 
w2 =  '#w2#',
w1_w2 = '#w1_w2#' ,
w3 = '#w3#', 
w4 =  '#w4#',
w3_w4 = '#w3_w4#' ,
w5 = '#w5#', 
w6 =  '#w6#',
w5_w6 = '#w5_w6#' ,
w7 = '#w7#', 
w8 =  '#w8#',
w7_w8 = '#w7_w8#' ,
w9 = '#w9#', 
w10 =  '#w10#',
w9_w10 = '#w9_w10#' ,
rm1 = '#rm1#', 
rm2 =  '#rm2#',
rm1_rm2 = '#rm1_rm2#' ,
rm3 = '#rm3#', 
rm4 =  '#rm4#',
rm3_rm4 = '#rm3_rm4#' ,
rm5 = '#rm5#', 
rm6 =  '#rm6#',
rm5_rm6 = '#rm5_rm6#' ,
rm7 = '#rm7#', 
rm8 =  '#rm8#',
rm7_rm8 = '#rm7_rm8#' ,
rm9 = '#rm9#', 
rm10 =  '#rm10#',
rm9_rm10 = '#rm9_rm10#' ,
mulch1 = '#mulch1#', 
mulch2 =  '#mulch2#',
mulch1_mulch2 = '#mulch1_mulch2#' ,
mulch3 = '#mulch3#', 
mulch4 =  '#mulch4#',
mulch3_mulch4 = '#mulch3_mulch4#' ,
mulch5 = '#mulch5#', 
mulch6 =  '#mulch6#',
mulch5_mulch6 = '#mulch5_mulch6#' ,
mulch7 = '#mulch7#', 
mulch8 =  '#mulch8#',
mulch7_mulch8 = '#mulch7_mulch8#' ,
mulch9 = '#mulch9#', 
mulch10 =  '#mulch10#',
mulch9_mulch10 = '#mulch9_mulch10#' ,
otslope1 = '#otslope1#', 
otslope2 =  '#otslope2#',
otslope3 = '#otslope3#', 
otslope4 =  '#otslope4#',
otslope5 = '#otslope5#', 
otslope6 =  '#otslope6#',
otslope7 = '#otslope7#', 
otslope8 =  '#otslope8#',
otslope9 = '#otslope9#', 
otslope10 =  '#otslope10#',
he1 = '#he1#', 
he2 =  '#he2#',
he3 = '#he3#', 
he4 =  '#he4#',
he5 = '#he5#', 
he6 =  '#he6#',
he7 = '#he7#', 
he8 =  '#he8#',
he9 = '#he9#', 
he10 =  '#he10#',
be1 = '#be1#', 
be2 =  '#be2#',
be3 = '#be3#', 
be4 =  '#be4#',
be5 = '#be5#', 
be6 =  '#be6#',
be7 = '#be7#', 
be8 =  '#be8#',
be9 = '#be9#', 
be10 =  '#be10#',
we1 = '#we1#', 
we2 =  '#we2#',
we3 = '#we3#', 
we4 =  '#we4#',
we5 = '#we5#', 
we6 =  '#we6#',
we7 = '#we7#', 
we8 =  '#we8#',
we9 = '#we9#', 
we10 =  '#we10#',
mra1 = '#mra1#', 
mra2 =  '#mra2#',
mra3 = '#mra3#', 
mra4 =  '#mra4#',
mra5 = '#mra5#', 
mra6 =  '#mra6#',
mra7 = '#mra7#', 
mra8 =  '#mra8#',
mra9 = '#mra9#', 
mra10 =  '#mra10#',
mrb1 = '#mrb1#', 
mrb2 =  '#mrb2#',
mrb3 = '#mrb3#', 
mrb4 =  '#mrb4#',
mrb5 = '#mrb5#', 
mrb6 =  '#mrb6#',
mrb7 = '#mrb7#', 
mrb8 =  '#mrb8#',
mrb9 = '#mrb9#', 
mrb10 =  '#mrb10#',
tsp1 = '#tsp1#', 
tsp2 =  '#tsp2#',
tsp3 = '#tsp3#', 
tsp4 =  '#tsp4#',
tsp5 = '#tsp5#', 
tsp6 =  '#tsp6#',
tsp7 = '#tsp7#', 
tsp8 =  '#tsp8#',
tsp9 = '#tsp9#', 
tsp10 =  '#tsp10#',
wp1 = '#wp1#', 
wp2 =  '#wp2#',
wp3 = '#wp3#', 
wp4 =  '#wp4#',
wp5 = '#wp5#', 
wp6 =  '#wp6#',
wp7 = '#wp7#', 
wp8 =  '#wp8#',
wp9 = '#wp9#', 
wp10 =  '#wp10#',
a1 = '#a1#', 
a2 =  '#a2#',
a3 = '#a3#', 
a4 =  '#a4#',
a5 = '#a5#', 
a6 =  '#a6#',
a7 = '#a7#', 
a8 =  '#a8#',
a9 = '#a9#', 
a10 =  '#a10#',
p11 = '#p11#', 
p12 =  '#p12#',
p11_p12 = '#p11_p12#' ,
p13 = '#p13#', 
p14 =  '#p14#',
p13_p14 = '#p13_p14#' ,
p15 = '#p15#', 
p16 =  '#p16#',
p15_p16 = '#p15_p16#' ,
p17 = '#p17#', 
p18 =  '#p18#',
p17_p18 = '#p17_p18#' ,
p19 = '#p19#', 
p20 =  '#p20#',
p19_p20 = '#p19_p20#' ,
w11 = '#w11#', 
w12 =  '#w12#',
w11_w12 = '#w11_w12#' ,
w13 = '#w13#', 
w14 =  '#w14#',
w13_w14 = '#w13_w14#' ,
w15 = '#w15#', 
w16 =  '#w16#',
w15_w16 = '#w15_w16#' ,
w17 = '#w17#', 
w18 =  '#w18#',
w17_w18 = '#w17_w18#' ,
w19 = '#w19#', 
w20 =  '#w20#',
w19_w20 = '#w19_w20#' ,
rm11 = '#rm11#', 
rm12 =  '#rm12#',
rm11_rm12 = '#rm11_rm12#' ,
rm13 = '#rm13#', 
rm14 =  '#rm14#',
rm13_rm14 = '#rm13_rm14#' ,
rm15 = '#rm15#', 
rm16 =  '#rm16#',
rm15_rm16 = '#rm15_rm16#' ,
rm17 = '#rm17#', 
rm18 =  '#rm18#',
rm17_rm18 = '#rm17_rm18#' ,
rm19 = '#rm19#', 
rm20 =  '#rm20#',
rm19_rm20 = '#rm19_rm20#' ,
mulch11 = '#mulch11#', 
mulch12 =  '#mulch12#',
mulch11_mulch12 = '#mulch11_mulch12#' ,
mulch13 = '#mulch13#', 
mulch14 =  '#mulch14#',
mulch13_mulch14 = '#mulch13_mulch14#' ,
mulch15 = '#mulch15#', 
mulch16 =  '#mulch16#',
mulch15_mulch16 = '#mulch15_mulch16#' ,
mulch17 = '#mulch17#', 
mulch18 =  '#mulch18#',
mulch17_mulch18 = '#mulch17_mulch18#' ,
mulch19 = '#mulch19#', 
mulch20 =  '#mulch20#',
mulch19_mulch20 = '#mulch19_mulch20#' 
WHERE opportunity_id = #url.id#
</cfquery>
  <cfquery name="get_quote_dimensions" datasource="jrgm">
SELECT * FROM quote_dimensions   WHERE opportunity_id  =#url.id#
</cfquery>
  
  <!--- SET SESSION and do math  --->
  <cfset Session.p1  = get_quote_dimensions.p1 >
  <cfset Session.p2  = get_quote_dimensions.p2>
  <cfset Session.p3 = get_quote_dimensions.p3 >
  <cfset Session.p4  = get_quote_dimensions.p4>
  <cfset Session.p5 = get_quote_dimensions.p5 >
  <cfset Session.p6  = get_quote_dimensions.p6>
  <cfset Session.p7 = get_quote_dimensions.p7 >
  <cfset Session.p8  = get_quote_dimensions.p8>
  <cfset Session.p9 = get_quote_dimensions.p9 >
  <cfset Session.p10  = get_quote_dimensions.p10>
  <cfset Session.w1  = get_quote_dimensions.w1 >
  <cfset Session.w2  = get_quote_dimensions.w2>
  <cfset Session.w3 = get_quote_dimensions.w3 >
  <cfset Session.w4  = get_quote_dimensions.w4>
  <cfset Session.w5 = get_quote_dimensions.w5 >
  <cfset Session.w6  = get_quote_dimensions.w6>
  <cfset Session.w7 = get_quote_dimensions.w7 >
  <cfset Session.w8  = get_quote_dimensions.w8>
  <cfset Session.w9 = get_quote_dimensions.w9 >
  <cfset Session.w10  = get_quote_dimensions.w10>
  <cfset Session.rm1  = get_quote_dimensions.rm1 >
  <cfset Session.rm2  = get_quote_dimensions.rm2>
  <cfset Session.rm3 = get_quote_dimensions.rm3 >
  <cfset Session.rm4  = get_quote_dimensions.rm4>
  <cfset Session.rm5 = get_quote_dimensions.rm5 >
  <cfset Session.rm6  = get_quote_dimensions.rm6>
  <cfset Session.rm7 = get_quote_dimensions.rm7 >
  <cfset Session.rm8  = get_quote_dimensions.rm8>
  <cfset Session.rm9 = get_quote_dimensions.rm9 >
  <cfset Session.rm10  = get_quote_dimensions.rm10>
  <cfset Session.mulch1  = get_quote_dimensions.mulch1 >
  <cfset Session.mulch2  = get_quote_dimensions.mulch2>
  <cfset Session.mulch1_mulch2 = get_quote_dimensions.mulch1_mulch2>
  <cfset Session.mulch3 = get_quote_dimensions.mulch3 >
  <cfset Session.mulch4  = get_quote_dimensions.mulch4>
  <cfset Session.mulch3_mulch4 = get_quote_dimensions.mulch3_mulch4>
  <cfset Session.mulch5 = get_quote_dimensions.mulch5 >
  <cfset Session.mulch6  = get_quote_dimensions.mulch6>
  <cfset Session.mulch5_mulch6 = get_quote_dimensions.mulch5_mulch6>
  <cfset Session.mulch7 = get_quote_dimensions.mulch7 >
  <cfset Session.mulch8  = get_quote_dimensions.mulch8>
  <cfset Session.mulch7_mulch8 = get_quote_dimensions.mulch7_mulch8>
  <cfset Session.mulch9 = get_quote_dimensions.mulch9 >
  <cfset Session.mulch10  = get_quote_dimensions.mulch10>
  <cfset Session.mulch9_mulch10 = get_quote_dimensions.mulch9_mulch10>
  <cfset Session.otslope1  = get_quote_dimensions.otslope1 >
  <cfset Session.otslope2  = get_quote_dimensions.otslope2>
  <cfset Session.otslope3 = get_quote_dimensions.otslope3 >
  <cfset Session.otslope4  = get_quote_dimensions.otslope4>
  <cfset Session.otslope5 = get_quote_dimensions.otslope5 >
  <cfset Session.otslope6  = get_quote_dimensions.otslope6>
  <cfset Session.otslope7 = get_quote_dimensions.otslope7 >
  <cfset Session.otslope8  = get_quote_dimensions.otslope8>
  <cfset Session.otslope9 = get_quote_dimensions.otslope9 >
  <cfset Session.otslope10  = get_quote_dimensions.otslope10>
  <cfset Session.he1  = get_quote_dimensions.he1 >
  <cfset Session.he2  = get_quote_dimensions.he2>
  <cfset Session.he3 = get_quote_dimensions.he3 >
  <cfset Session.he4  = get_quote_dimensions.he4>
  <cfset Session.he5 = get_quote_dimensions.he5 >
  <cfset Session.he6  = get_quote_dimensions.he6>
  <cfset Session.he7 = get_quote_dimensions.he7 >
  <cfset Session.he8  = get_quote_dimensions.he8>
  <cfset Session.he9 = get_quote_dimensions.he9 >
  <cfset Session.he10  = get_quote_dimensions.he10>
  <cfset Session.be1  = get_quote_dimensions.be1 >
  <cfset Session.be2  = get_quote_dimensions.be2>
  <cfset Session.be3 = get_quote_dimensions.be3 >
  <cfset Session.be4  = get_quote_dimensions.be4>
  <cfset Session.be5 = get_quote_dimensions.be5 >
  <cfset Session.be6  = get_quote_dimensions.be6>
  <cfset Session.be7 = get_quote_dimensions.be7 >
  <cfset Session.be8  = get_quote_dimensions.be8>
  <cfset Session.be9 = get_quote_dimensions.be9 >
  <cfset Session.be10  = get_quote_dimensions.be10>
  <cfset Session.we1  = get_quote_dimensions.we1 >
  <cfset Session.we2  = get_quote_dimensions.we2>
  <cfset Session.we3 = get_quote_dimensions.we3 >
  <cfset Session.we4  = get_quote_dimensions.we4>
  <cfset Session.we5 = get_quote_dimensions.we5 >
  <cfset Session.we6  = get_quote_dimensions.we6>
  <cfset Session.we7 = get_quote_dimensions.we7 >
  <cfset Session.we8  = get_quote_dimensions.we8>
  <cfset Session.we9 = get_quote_dimensions.we9 >
  <cfset Session.we10  = get_quote_dimensions.we10>
  <cfset Session.mra1  = get_quote_dimensions.mra1 >
  <cfset Session.mra2  = get_quote_dimensions.mra2>
  <cfset Session.mra3 = get_quote_dimensions.mra3 >
  <cfset Session.mra4  = get_quote_dimensions.mra4>
  <cfset Session.mra5 = get_quote_dimensions.mra5 >
  <cfset Session.mra6  = get_quote_dimensions.mra6>
  <cfset Session.mra7 = get_quote_dimensions.mra7 >
  <cfset Session.mra8  = get_quote_dimensions.mra8>
  <cfset Session.mra9 = get_quote_dimensions.mra9 >
  <cfset Session.mra10  = get_quote_dimensions.mra10>
  <cfset Session.mrb1  = get_quote_dimensions.mrb1 >
  <cfset Session.mrb2  = get_quote_dimensions.mrb2>
  <cfset Session.mrb3 = get_quote_dimensions.mrb3 >
  <cfset Session.mrb4  = get_quote_dimensions.mrb4>
  <cfset Session.mrb5 = get_quote_dimensions.mrb5 >
  <cfset Session.mrb6  = get_quote_dimensions.mrb6>
  <cfset Session.mrb7 = get_quote_dimensions.mrb7 >
  <cfset Session.mrb8  = get_quote_dimensions.mrb8>
  <cfset Session.mrb9 = get_quote_dimensions.mrb9 >
  <cfset Session.mrb10  = get_quote_dimensions.mrb10>
  <cfset Session.tsp1  = get_quote_dimensions.tsp1 >
  <cfset Session.tsp2  = get_quote_dimensions.tsp2>
  <cfset Session.tsp3 = get_quote_dimensions.tsp3 >
  <cfset Session.tsp4  = get_quote_dimensions.tsp4>
  <cfset Session.tsp5 = get_quote_dimensions.tsp5 >
  <cfset Session.tsp6  = get_quote_dimensions.tsp6>
  <cfset Session.tsp7 = get_quote_dimensions.tsp7 >
  <cfset Session.tsp8  = get_quote_dimensions.tsp8>
  <cfset Session.tsp9 = get_quote_dimensions.tsp9 >
  <cfset Session.tsp10  = get_quote_dimensions.tsp10>
  <cfset Session.wp1  = get_quote_dimensions.wp1 >
  <cfset Session.wp2  = get_quote_dimensions.wp2>
  <cfset Session.wp3 = get_quote_dimensions.wp3 >
  <cfset Session.wp4  = get_quote_dimensions.wp4>
  <cfset Session.wp5 = get_quote_dimensions.wp5 >
  <cfset Session.wp6  = get_quote_dimensions.wp6>
  <cfset Session.wp7 = get_quote_dimensions.wp7 >
  <cfset Session.wp8  = get_quote_dimensions.wp8>
  <cfset Session.wp9 = get_quote_dimensions.wp9 >
  <cfset Session.wp10  = get_quote_dimensions.wp10>
  <cfset Session.a1  = get_quote_dimensions.a1 >
  <cfset Session.a2  = get_quote_dimensions.a2>
  <cfset Session.a3 = get_quote_dimensions.a3 >
  <cfset Session.a4  = get_quote_dimensions.a4>
  <cfset Session.a5 = get_quote_dimensions.a5 >
  <cfset Session.a6  = get_quote_dimensions.a6>
  <cfset Session.a7 = get_quote_dimensions.a7 >
  <cfset Session.a8  = get_quote_dimensions.a8>
  <cfset Session.a9 = get_quote_dimensions.a9 >
  <cfset Session.a10  = get_quote_dimensions.a10>
  <cfset Session.p11  = get_quote_dimensions.p11 >
  <cfset Session.p12  = get_quote_dimensions.p12>
  <cfset Session.p11_p12 = get_quote_dimensions.p11_p12>
  <cfset Session.p13 = get_quote_dimensions.p13 >
  <cfset Session.p14  = get_quote_dimensions.p14>
  <cfset Session.p13_p14 = get_quote_dimensions.p13_p14>
  <cfset Session.p15 = get_quote_dimensions.p15 >
  <cfset Session.p16  = get_quote_dimensions.p16>
  <cfset Session.p15_p16 = get_quote_dimensions.p15_p16>
  <cfset Session.p17 = get_quote_dimensions.p17 >
  <cfset Session.p18  = get_quote_dimensions.p18>
  <cfset Session.p17_p18 = get_quote_dimensions.p17_p18>
  <cfset Session.p19 = get_quote_dimensions.p19 >
  <cfset Session.p20  = get_quote_dimensions.p20>
  <cfset Session.p19_p20 = get_quote_dimensions.p19_p20>
  <cfset Session.w11  = get_quote_dimensions.w11 >
  <cfset Session.w12  = get_quote_dimensions.w12>
  <cfset Session.w11_w12 = get_quote_dimensions.w11_w12>
  <cfset Session.w13 = get_quote_dimensions.w13 >
  <cfset Session.w14  = get_quote_dimensions.w14>
  <cfset Session.w13_w14 = get_quote_dimensions.w13_w14>
  <cfset Session.w15 = get_quote_dimensions.w15 >
  <cfset Session.w16  = get_quote_dimensions.w16>
  <cfset Session.w15_w16 = get_quote_dimensions.w15_w16>
  <cfset Session.w17 = get_quote_dimensions.w17 >
  <cfset Session.w18  = get_quote_dimensions.w18>
  <!---  <cfset Session.w17_w18 = get_quote_dimensions.w17_w18>--->
  <cfset Session.w19 = get_quote_dimensions.w19 >
  <cfset Session.w20  = get_quote_dimensions.w20>
  <!---  <cfset Session.w19_w20 = get_quote_dimensions.w19_w20>--->
  <cfset Session.rm11  = get_quote_dimensions.rm11 >
  <cfset Session.rm12  = get_quote_dimensions.rm12>
  <!---  <cfset Session.rm11_rm12 = get_quote_dimensions.rm11_rm12>--->
  <cfset Session.rm13 = get_quote_dimensions.rm13 >
  <cfset Session.rm14  = get_quote_dimensions.rm14>
  <!---  <cfset Session.rm13_rm14 = get_quote_dimensions.rm13_rm14>--->
  <cfset Session.rm15 = get_quote_dimensions.rm15 >
  <cfset Session.rm16  = get_quote_dimensions.rm16>
  <!--- <cfset Session.rm15_rm16 = get_quote_dimensions.rm15_rm16>--->
  <cfset Session.rm17 = get_quote_dimensions.rm17 >
  <cfset Session.rm18  = get_quote_dimensions.rm18>
  <!---  <cfset Session.rm17_rm18 = get_quote_dimensions.rm17_rm18>--->
  <cfset Session.rm19 = get_quote_dimensions.rm19 >
  <cfset Session.rm20  = get_quote_dimensions.rm20>
  <!---  <cfset Session.rm19_rm20 = get_quote_dimensions.rm19_rm20>--->
  <cfset Session.mulch11  = get_quote_dimensions.mulch11 >
  <cfset Session.mulch12  = get_quote_dimensions.mulch12>
  <cfset Session.mulch11_mulch12 = get_quote_dimensions.mulch11_mulch12>
  <cfset Session.mulch13 = get_quote_dimensions.mulch13 >
  <cfset Session.mulch14  = get_quote_dimensions.mulch14>
  <!---  <cfset Session.mulch13_mulch14 = get_quote_dimensions.mulch13_mulch14>--->
  <cfset Session.mulch15 = get_quote_dimensions.mulch15 >
  <cfset Session.mulch16  = get_quote_dimensions.mulch16>
  <!---  <cfset Session.mulch15_mulch16 = get_quote_dimensions.mulch15_mulch16>--->
  <cfset Session.mulch17 = get_quote_dimensions.mulch17 >
  <cfset Session.mulch18  = get_quote_dimensions.mulch18>
  <!---  <cfset Session.mulch17_mulch18 = get_quote_dimensions.mulch17_mulch18>--->
  <cfset Session.mulch19 = get_quote_dimensions.mulch19 >
  <cfset Session.mulch20  = get_quote_dimensions.mulch20>
  <!---  <cfset Session.mulch19_mulch20 = get_quote_dimensions.mulch19_mulch20>--->
  
  <!--- END SET SESSION and do math  --->
</cfif>
<cfquery name="get_quote_dimensions_info" datasource="jrgm">
SELECT * FROM quote_dimensions   WHERE opportunity_id  =#url.id#
</cfquery>
<cfset Session.p1  = get_quote_dimensions_info.p1 >
<cfset Session.p2  = get_quote_dimensions_info.p2 >
<cfset Session.p1_p2  = get_quote_dimensions_info.p1_p2 >
<cfset Session.p3  = get_quote_dimensions_info.p3 >
<cfset Session.p4  = get_quote_dimensions_info.p4 >
<cfset Session.p3_p4  = get_quote_dimensions_info.p3_p4 >
<cfset Session.p5 = get_quote_dimensions_info.p5 >
<cfset Session.p6  = get_quote_dimensions_info.p6>
<cfset Session.p5_p6 = get_quote_dimensions_info.p5_p6>
<cfset Session.p7 = get_quote_dimensions_info.p7 >
<cfset Session.p8  = get_quote_dimensions_info.p8>
<cfset Session.p7_p8 = get_quote_dimensions_info.p7_p8>
<cfset Session.p9 = get_quote_dimensions_info.p9 >
<cfset Session.p10  = get_quote_dimensions_info.p10>
<cfset Session.p9_p10 = get_quote_dimensions_info.p9_p10>
<cfset Session.w1  = get_quote_dimensions_info.w1 >
<cfset Session.w2  = get_quote_dimensions_info.w2 >
<cfset Session.w1_w2  = get_quote_dimensions_info.w1_w2 >
<cfset Session.w3  = get_quote_dimensions_info.w3 >
<cfset Session.w4  = get_quote_dimensions_info.w4 >
<cfset Session.w3_w4  = get_quote_dimensions_info.w3_w4 >
<cfset Session.w5 = get_quote_dimensions_info.w5 >
<cfset Session.w6  = get_quote_dimensions_info.w6>
<cfset Session.w5_w6 = get_quote_dimensions_info.w5_w6>
<cfset Session.w7 = get_quote_dimensions_info.w7 >
<cfset Session.w8  = get_quote_dimensions_info.w8>
<cfset Session.w7_w8 = get_quote_dimensions_info.w7_w8>
<cfset Session.w9 = get_quote_dimensions_info.w9 >
<cfset Session.w10  = get_quote_dimensions_info.w10>
<cfset Session.w9_w10 = get_quote_dimensions_info.w9_w10>
<cfset Session.rm1  = get_quote_dimensions_info.rm1 >
<cfset Session.rm2  = get_quote_dimensions_info.rm2 >
<cfset rm1_rm2  = get_quote_dimensions_info.rm1_rm2 >
<cfset Session.rm3  = get_quote_dimensions_info.rm3 >
<cfset Session.rm4  = get_quote_dimensions_info.rm4 >
<cfset Session.rm3_rm4  = get_quote_dimensions_info.rm3_rm4 >
<cfset Session.rm5 = get_quote_dimensions_info.rm5 >
<cfset Session.rm6  = get_quote_dimensions_info.rm6>
<cfset Session.rm5_rm6 = get_quote_dimensions_info.rm5_rm6>
<cfset Session.rm7 = get_quote_dimensions_info.rm7 >
<cfset Session.rm8  = get_quote_dimensions_info.rm8>
<cfset Session.rm7_rm8 = get_quote_dimensions_info.rm7_rm8>
<cfset Session.rm9 = get_quote_dimensions_info.rm9 >
<cfset Session.rm10  = get_quote_dimensions_info.rm10>
<cfset Session.rm9_rm10 = get_quote_dimensions_info.rm9_rm10>
<cfset Session.mulch1  = get_quote_dimensions_info.mulch1 >
<cfset Session.mulch2  = get_quote_dimensions_info.mulch2 >
<cfset Session.mulch1_mulch2  = get_quote_dimensions_info.mulch1_mulch2 >
<cfset Session.mulch3  = get_quote_dimensions_info.mulch3 >
<cfset Session.mulch4  = get_quote_dimensions_info.mulch4 >
<cfset Session.mulch3_mulch4  = get_quote_dimensions_info.mulch3_mulch4 >
<cfset Session.mulch5 = get_quote_dimensions_info.mulch5 >
<cfset Session.mulch6  = get_quote_dimensions_info.mulch6>
<cfset Session.mulch5_mulch6 = get_quote_dimensions_info.mulch5_mulch6>
<cfset Session.mulch7 = get_quote_dimensions_info.mulch7 >
<cfset Session.mulch8  = get_quote_dimensions_info.mulch8>
<cfset Session.mulch7_mulch8 = get_quote_dimensions_info.mulch7_mulch8>
<cfset Session.mulch9 = get_quote_dimensions_info.mulch9 >
<cfset Session.mulch10  = get_quote_dimensions_info.mulch10>
<cfset Session.mulch9_mulch10 = get_quote_dimensions_info.mulch9_mulch10>
<cfset Session.otslope1  = get_quote_dimensions_info.otslope1 >
<cfset Session.otslope2  = get_quote_dimensions_info.otslope2 >
<cfset Session.otslope3  = get_quote_dimensions_info.otslope3 >
<cfset Session.otslope4  = get_quote_dimensions_info.otslope4 >
<cfset Session.otslope5 = get_quote_dimensions_info.otslope5 >
<cfset Session.otslope6  = get_quote_dimensions_info.otslope6>
<cfset Session.otslope7 = get_quote_dimensions_info.otslope7 >
<cfset Session.otslope8  = get_quote_dimensions_info.otslope8>
<cfset Session.otslope9 = get_quote_dimensions_info.otslope9 >
<cfset Session.otslope10  = get_quote_dimensions_info.otslope10>
<cfset Session.he1  = get_quote_dimensions_info.he1 >
<cfset Session.he2  = get_quote_dimensions_info.he2 >
<cfset Session.he3  = get_quote_dimensions_info.he3 >
<cfset Session.he4  = get_quote_dimensions_info.he4 >
<cfset Session.he5 = get_quote_dimensions_info.he5 >
<cfset Session.he6  = get_quote_dimensions_info.he6>
<cfset Session.he7 = get_quote_dimensions_info.he7 >
<cfset Session.he8  = get_quote_dimensions_info.he8>
<cfset Session.he9 = get_quote_dimensions_info.he9 >
<cfset Session.he10  = get_quote_dimensions_info.he10>
<cfset Session.be1  = get_quote_dimensions_info.be1 >
<cfset Session.be2  = get_quote_dimensions_info.be2 >
<cfset Session.be3  = get_quote_dimensions_info.be3 >
<cfset Session.be4  = get_quote_dimensions_info.be4 >
<cfset Session.be5 = get_quote_dimensions_info.be5 >
<cfset Session.be6  = get_quote_dimensions_info.be6>
<cfset Session.be7 = get_quote_dimensions_info.be7 >
<cfset Session.be8  = get_quote_dimensions_info.be8>
<cfset Session.be9 = get_quote_dimensions_info.be9 >
<cfset Session.be10  = get_quote_dimensions_info.be10>
<cfset Session.mra1  =get_quote_dimensions_info.mra1 >
<cfset Session.mra2  =get_quote_dimensions_info.mra2>
<cfset Session.mra3 =get_quote_dimensions_info.mra3 >
<cfset Session.mra4  =get_quote_dimensions_info.mra4>
<cfset Session.mra5 =get_quote_dimensions_info.mra5 >
<cfset Session.mra6  =get_quote_dimensions_info.mra6>
<cfset Session.mra7 =get_quote_dimensions_info.mra7 >
<cfset Session.mra8  =get_quote_dimensions_info.mra8>
<cfset Session.mra9 =get_quote_dimensions_info.mra9 >
<cfset Session.mra10  =get_quote_dimensions_info.mra10>
<cfset Session.mrb1  =get_quote_dimensions_info.mrb1 >
<cfset Session.mrb2  =get_quote_dimensions_info.mrb2>
<cfset Session.mrb3 =get_quote_dimensions_info.mrb3 >
<cfset Session.mrb4  =get_quote_dimensions_info.mrb4>
<cfset Session.mrb5 =get_quote_dimensions_info.mrb5 >
<cfset Session.mrb6  =get_quote_dimensions_info.mrb6>
<cfset Session.mrb7 =get_quote_dimensions_info.mrb7 >
<cfset Session.mrb8  =get_quote_dimensions_info.mrb8>
<cfset Session.mrb9 =get_quote_dimensions_info.mrb9 >
<cfset Session.mrb10  =get_quote_dimensions_info.mrb10>
<cfset Session.tsp1  = get_quote_dimensions_info.tsp1 >
<cfset Session.tsp2  = get_quote_dimensions_info.tsp2 >
<cfset Session.tsp3  = get_quote_dimensions_info.tsp3 >
<cfset Session.tsp4  = get_quote_dimensions_info.tsp4 >
<cfset Session.tsp5 = get_quote_dimensions_info.tsp5 >
<cfset Session.tsp6  = get_quote_dimensions_info.tsp6>
<cfset Session.tsp7 = get_quote_dimensions_info.tsp7 >
<cfset Session.tsp8  = get_quote_dimensions_info.tsp8>
<cfset Session.tsp9 = get_quote_dimensions_info.tsp9 >
<cfset Session.tsp10  = get_quote_dimensions_info.tsp10>
<cfset Session.wp1  = get_quote_dimensions_info.wp1 >
<cfset Session.wp2  = get_quote_dimensions_info.wp2 >
<cfset Session.wp3  = get_quote_dimensions_info.wp3 >
<cfset Session.wp4  = get_quote_dimensions_info.wp4 >
<cfset Session.wp5 = get_quote_dimensions_info.wp5 >
<cfset Session.wp6  = get_quote_dimensions_info.wp6>
<cfset Session.wp7 = get_quote_dimensions_info.wp7 >
<cfset Session.wp8  = get_quote_dimensions_info.wp8>
<cfset Session.wp9 = get_quote_dimensions_info.wp9 >
<cfset Session.wp10  = get_quote_dimensions_info.wp10>
<cfset Session.a1  = get_quote_dimensions_info.a1 >
<cfset Session.a2  = get_quote_dimensions_info.a2 >
<cfset Session.a3  = get_quote_dimensions_info.a3 >
<cfset Session.a4  = get_quote_dimensions_info.a4 >
<cfset Session.a5 = get_quote_dimensions_info.a5 >
<cfset Session.a6  = get_quote_dimensions_info.a6>
<cfset Session.a7 = get_quote_dimensions_info.a7 >
<cfset Session.a8  = get_quote_dimensions_info.a8>
<cfset Session.a9 = get_quote_dimensions_info.a9 >
<cfset Session.a10  = get_quote_dimensions_info.a10>
<cfset Session.p11  = get_quote_dimensions_info.p11 >
<cfset Session.p12  = get_quote_dimensions_info.p12 >
<!---<cfset Session.p11_p12  = get_quote_dimensions_info.p11_p12 >--->
<cfset Session.p13  = get_quote_dimensions_info.p13 >
<cfset Session.p14  = get_quote_dimensions_info.p14 >
<!---<cfset Session.p13_p14  = get_quote_dimensions_info.p13_p14 >--->
<cfset Session.p15 = get_quote_dimensions_info.p15 >
<cfset Session.p16  = get_quote_dimensions_info.p16>
<!---<cfset Session.p15_p16 = get_quote_dimensions_info.p15_p16>--->
<cfset Session.p17 = get_quote_dimensions_info.p17 >
<cfset Session.p18  = get_quote_dimensions_info.p18>
<!---<cfset Session.p17_p18 = get_quote_dimensions_info.p17_p18>--->
<cfset Session.p19 = get_quote_dimensions_info.p19 >
<cfset Session.p20  = get_quote_dimensions_info.p20>
<!---<cfset Session.p19_p20 = get_quote_dimensions_info.p19_p20>--->
<cfset Session.w11  = get_quote_dimensions_info.w11 >
<cfset Session.w12  = get_quote_dimensions_info.w12 >
<!---<cfset Session.w11_w12  = get_quote_dimensions_info.w11_w12 >--->
<cfset Session.w13  = get_quote_dimensions_info.w13 >
<cfset Session.w14  = get_quote_dimensions_info.w14 >
<!---<cfset Session.w13_w14  = get_quote_dimensions_info.w13_w14 >--->
<cfset Session.w15 = get_quote_dimensions_info.w15 >
<cfset Session.w16  = get_quote_dimensions_info.w16>
<!---<cfset Session.w15_w16 = get_quote_dimensions_info.w15_w16>--->
<cfset Session.w17 = get_quote_dimensions_info.w17 >
<cfset Session.w18  = get_quote_dimensions_info.w18>
<!---<cfset Session.w17_w18 = get_quote_dimensions_info.w17_w18>--->
<cfset Session.w19 = get_quote_dimensions_info.w19 >
<cfset Session.w20  = get_quote_dimensions_info.w20>
<!---<cfset Session.w19_w20 = get_quote_dimensions_info.w19_w20>--->
<cfset Session.rm11  = get_quote_dimensions_info.rm11 >
<cfset Session.rm12  = get_quote_dimensions_info.rm12 >
<!---<cfset Session.rm11_rm12  = get_quote_dimensions_info.rm11_rm12 >--->
<cfset Session.rm13  = get_quote_dimensions_info.rm13 >
<cfset Session.rm14  = get_quote_dimensions_info.rm14 >
<!---<cfset Session.rm13_rm14  = get_quote_dimensions_info.rm13_rm14 >--->
<cfset Session.rm15 = get_quote_dimensions_info.rm15 >
<cfset Session.rm16  = get_quote_dimensions_info.rm16>
<!---<cfset Session.rm15_rm16 = get_quote_dimensions_info.rm15_rm16>--->
<cfset Session.rm17 = get_quote_dimensions_info.rm17 >
<cfset Session.rm18  = get_quote_dimensions_info.rm18>
<!---<cfset Session.rm17_rm18 = get_quote_dimensions_info.rm17_rm18>--->
<cfset Session.rm19 = get_quote_dimensions_info.rm19 >
<cfset Session.rm20  = get_quote_dimensions_info.rm20>
<!---<cfset Session.rm19_rm20 = get_quote_dimensions_info.rm19_rm20>--->
<cfset Session.mulch11  = get_quote_dimensions_info.mulch11 >
<cfset Session.mulch12  = get_quote_dimensions_info.mulch12 >
<!---<cfset Session.mulch11_mulch12  = get_quote_dimensions_info.mulch11_mulch12 >--->
<cfset Session.mulch13  = get_quote_dimensions_info.mulch13 >
<cfset Session.mulch14  = get_quote_dimensions_info.mulch14 >
<!---<cfset Session.mulch13_mulch14  = get_quote_dimensions_info.mulch13_mulch14 >--->
<cfset Session.mulch15 = get_quote_dimensions_info.mulch15 >
<cfset Session.mulch16  = get_quote_dimensions_info.mulch16>
<!---<cfset Session.mulch15_mulch16 = get_quote_dimensions_info.mulch15_mulch16>--->
<cfset Session.mulch17 = get_quote_dimensions_info.mulch17 >
<cfset Session.mulch18  = get_quote_dimensions_info.mulch18>
<!---<cfset Session.mulch17_mulch18 = get_quote_dimensions_info.mulch17_mulch18>--->
<cfset Session.mulch19 = get_quote_dimensions_info.mulch19 >
<cfset Session.mulch20  = get_quote_dimensions_info.mulch20>
<!---<cfset Session.mulch19_mulch20 = get_quote_dimensions_info.mulch19_mulch20>--->

<cfset PUSH_TOTAL=  p1_p2 + p3_p4+ p5_p6+ p7_p8+ p9_p10+ p11_p12+ p13_p14+
p15_p16+p17_p18+p19_p20>
<cfset Walk_TOTAL=  w1_w2 + w3_w4+ w5_w6+ w7_w8+ w9_w10+ w11_w12+ w13_w14+
w15_w16+w17_w18+w19_w20>
<cfset Ride_mow_TOTAL=  rm1_rm2 + rm3_rm4+ rm5_rm6+ rm7_rm8+ rm9_rm10+ rm11_rm12+ rm13_rm14+ rm15_rm16+rm17_rm18+rm19_rm20>
<cfset Mulch_TOTAL=  mulch1_mulch2 + mulch3_mulch4+ mulch5_mulch6+ mulch7_mulch8+ mulch9_mulch10+ mulch11_mulch12+ mulch13_mulch14+
mulch15_mulch16+mulch17_mulch18+mulch19_mulch20>
<cfset OTSLOPE_TOTAL=   otslope1 +   otslope2 +  otslope3 +  otslope4 +  otslope5 +  otslope6 +  otslope7 +  otslope8 +  otslope9 +  otslope10>
<cfset he_TOTAL=   he1 +   he2 +  he3 +  he4 +  he5 +  he6 +  he7 +  he8 +  he9 +  he10>
<cfset be_TOTAL=   be1 +   be2 +  be3 +  be4 +  be5 +  be6 +  be7 +  be8 +  be9 +  be10>
<cfset we_TOTAL=   we1 +   we2 +  we3 +  we4 +  we5 +  we6 +  we7 +  we8 +  we9 +  we10>
<cfset mra_TOTAL=   mra1 +   mra2 +  mra3 +  mra4 +  mra5 +  mra6 +  mra7 +  mra8 +  mra9 +  mra10>
<cfset mrb_TOTAL=   mrb1 +   mrb2 +  mrb3 +  mrb4 +  mrb5 +  mrb6 +  mrb7 +  mrb8 +  mrb9 +  mrb10>
<cfset tsp_TOTAL=   tsp1 +   tsp2 +  tsp3 +  tsp4 +  tsp5 +  tsp6 +  tsp7 +  tsp8 +  tsp9 +  tsp10>
<cfset wp_TOTAL=   wp1 +   wp2 +  wp3 +  wp4 +  wp5 +  wp6 +  wp7 +  wp8 +  wp9 +  wp10>
<cfset a_TOTAL=   a1 +   a2 +  a3 +  a4 +  a5 +  a6 +  a7 +  a8 +  a9 +  a10>
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
<cfquery name="get_quote_main" datasource="jrgm">
SELECT    ID, date_created, gross_margin, opportunity_id, date_updated,  contract_start_date, contract_end_date, contract_installments, 
 duplicate_quote, opportunity_id_original, quote_approved, total_contract_price
FROM         quote_main
where opportunity_id  =#url.id#
</cfquery>
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
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
.table {
	width: 95%;
	max-width: 95%;
	margin-bottom: 0px;
	padding-left: 5px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 8pt;
	color: #000000;
}
.bigfont {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 12pt;
	color: #000000;
}
.bigfont2 {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 11pt;
	color: #000000;
}
<!--
-input {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 9.5pt;
	color: #000000;
}
-
-->
input[type=text] {
 background-color: #F7F5F5;
 border:solid 1px #BFBDBD;
 color: #333333;
 font-weight:bold;
 height: 25px;
 padding-left:2px;
 width: 55px;
 box-shadow: 2px 2px 0 #F7F5F5 inset;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION -->
<div class="page-head">
  <div class="container-fluid"> 
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>JRGM Dimensions Entry Sheet</h1>
    </div>
    <!-- END PAGE TITLE --> 
    <!-- BEGIN PAGE TOOLBAR -->
    <div class="page-toolbar">
      <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">JRGM Dimensions Entry Sheet</li>
      </ul>
    </div>
    <!-- END PAGE TOOLBAR --> 
  </div>
</div>
<form method="post" action="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>">
  <div class="button-boxer" align="right"><a href="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" target="_blank">Quote Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_data_entry_print.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success blue-chambray" target="_blank">Print Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.id#&opportunity_id=#url.id#</cfoutput>" class="btn btn-success purple" >Notes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="btnSumit" type="submit" class="btn btn-primary" id="btnSumit" value="Calculate &amp; Save"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
  <br />
  <br />
  <div class="page-content">
  <div class="container-fluid">
    <div class="left-table2"> <cfoutput query="get_quote_info">
        <table class="table"  >
          <tr>
            <td><strong>Quote ID : #opportunity_id# &nbsp;&nbsp;&nbsp;Branch : #q_branch#</strong></td>
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Date Opportunty Created : #dateformat(date_created_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Date Opportunty Modified : #dateformat(date_updated_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Customer : #opportunity_name#</strong></td>
            <td>&nbsp;</td>
            <td><strong>Date Quote Created : #dateformat(date_quote_started,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td><strong>Date Quote Modified : #dateformat(date_quote_updated,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Job Location : #q_address1#, #q_city#, #q_address_state#, #q_address_zip#</strong></td>
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Contract Start Date : #dateformat(get_quote_main.contract_start_date,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td nowrap="nowrap"   colspan="2"  align="left"><strong>Contract End Date : #dateformat(get_quote_main.contract_end_date,"mm/dd/yyyy")# &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments : #get_quote_main.contract_installments#</strong></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Estimator : #SESSION.screenname#</strong></td>
            <td>&nbsp;</td>
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
          <tr>
            <td><strong>Quote Status : #opportunity_state# </strong></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </cfoutput> </div>
  </div>
  <div class="clearfix"></div>
  <div class="page-content">
  <div class="container-fluid">
  <!---<form method="post" action="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>">
   <div class="button-boxer"><a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.id#&opportunity_id=#url.id#</cfoutput>" class="btn btn-success purple" >Notes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success blue-chambray" target="_blank">Quote Pricing Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="dimensions_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" target="_blank">Dimensions Sheet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="btnSumit" type="submit" class="btn btn-primary" id="btnSumit" value="Calculate &amp; Save"/>
      </div>--->
  
  <table border="1" cellspacing="0" cellpadding="0" class="table"  width="95%" >
    <tbody>
      <tr>
        <td colspan="2" align="center" bgcolor="#E7E7E7" valign="bottom"><span class="bigfont2"><strong>Push</strong></span></td>
        <td colspan="2" align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Walk</strong></span></td>
        <td colspan="2" align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Ride Mow</strong></span></td>
        <td colspan="2" align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Mulch <span style="color: #F70E5E">*</span><br />
          </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>OT/Slope </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Hard Edge </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Bed Edge</strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Winter Edge </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><p><span class="bigfont2"><strong>Mulch Rings 1</strong></span></p></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Mulch Rings 2</strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Tree/Shrub Pruning </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Winter Pruning </strong></span></td>
        <td align="center" bgcolor="#E7E7E7"><span class="bigfont2"><strong>Annuals</strong></span></td>
      </tr>
      <tr>
        <td  align="center"><strong>Area </strong></td>
        <td><strong>SF</strong></td>
        <td  align="center"><strong>Area </strong></td>
        <td><strong>SF</strong></td>
        <td  align="center"><strong>Area </strong></td>
        <td><strong>SF</strong></td>
        <td  align="center"><strong>Area </strong></td>
        <td><strong>SF</strong></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <cfoutput>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p1"  value="#Session.p1#" size="3"  tabindex="1"/>
            x
            <input type="text" name="p2"  value="#Session.p2#" size="3"  tabindex="2"    /></td>
          <CFSET p1_p2 = session.p1*session.p2>
          <td><strong>#p1_p2#</strong></td>
          <!--- <input type="hidden" name="p1_p2"  value="#Session.p1_p2#"/>--->
          <td nowrap="nowrap"><input name="w1" type="text"   tabindex="101" value="#Session.w1#" size="3"/>
            x
            <input name="w2" type="text"   tabindex="102" value="#Session.w2#" size="3"/></td>
          <CFSET w1_w2 = Session.w1*Session.w2>
          <td><strong>#w1_w2#</strong></td>
          <td nowrap="nowrap"><input name="rm1" type="text"   tabindex="201" value="#Session.rm1#" size="3"/>
            x
            <input name="rm2" type="text"   tabindex="202" value="#Session.rm2#" size="3"/></td>
          <CFSET rm1_rm2 = Session.rm1*Session.rm2>
          <td><strong>#rm1_rm2#</strong></td>
          <td nowrap="nowrap"><input name="mulch1" type="text"   tabindex="301" value="#Session.mulch1#" size="3"/>
            x
            <input name="mulch2" type="text"   tabindex="302" value="#Session.mulch2#" size="3"/></td>
          <CFSET mulch1_mulch2 = Session.mulch1*Session.mulch2>
          <td><strong>#mulch1_mulch2#</strong></td>
          <td align="center"><input name="otslope1" type="text"   tabindex="401"  value="#Session.otslope1#" size="3"/></td>
          <td align="center"><input name="he1" type="text"   tabindex="501"   value="#Session.he1#" size="3"/></td>
          <td align="center"><input name="be1" type="text"   tabindex="601"   value="#Session.be1#" size="3"/></td>
          <td align="center"><input name="we1" type="text"   tabindex="701"   value="#Session.we1#" size="3"/></td>
          <td align="center"><input name="mra1" type="text"   tabindex="801"  value="#Session.mra1#" size="3"/></td>
          <td align="center"><input name="mrb1" type="text"   tabindex="901"  value="#Session.mrb1#" size="3"/></td>
          <td align="center"><input name="tsp1" type="text"   tabindex="1001" value="#Session.tsp1#" size="3"/></td>
          <td align="center"><input name="wp1" type="text"   tabindex="1101"  value="#Session.wp1#" size="3"/></td>
          <td align="center"><input name="a1" type="text"   tabindex="1201"    value="#Session.a1#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p3"  value="#Session.p3#" size="3"  tabindex="3"/>
            x
            <input type="text" name="p4"  value="#Session.p4#" size="3"  tabindex="4"/></td>
          <CFSET p3_p4 = session.p3*session.p4>
          <td><strong>#p3_p4#</strong></td>
          <td nowrap="nowrap"><input name="w3" type="text"   tabindex="103" value="#Session.w3#" size="3"/>
            x
            <input name="w4" type="text"   tabindex="104" value="#Session.w4#" size="3"/></td>
          <CFSET w3_w4 = Session.w3*Session.w4>
          <td><strong>#w3_w4#</strong></td>
          <td nowrap="nowrap"><input name="rm3" type="text"   tabindex="203" value="#Session.rm3#" size="3"/>
            x
            <input name="rm4" type="text"   tabindex="204" value="#Session.rm4#" size="3"/></td>
          <CFSET rm3_rm4 = Session.rm3*Session.rm4>
          <td><strong>#rm3_rm4#</strong></td>
          <td nowrap="nowrap"><input name="mulch3" type="text"   tabindex="303" value="#Session.mulch3#" size="3"/>
            x
            <input name="mulch4" type="text"   tabindex="304" value="#Session.mulch4#" size="3"/></td>
          <CFSET mulch3_mulch4 = Session.mulch3*Session.mulch4>
          <td><strong>#mulch3_mulch4#</strong></td>
          <td align="center"><input name="otslope2" type="text"   tabindex="402" value="#Session.otslope2#" size="3"/></td>
          <td align="center"><input name="he2" type="text"   tabindex="502"   value="#Session.he2#" size="3"/></td>
          <td align="center"><input name="be2" type="text"   tabindex="602"   value="#Session.be2#" size="3"/></td>
          <td align="center"><input name="we2" type="text"   tabindex="702"   value="#Session.we2#" size="3"/></td>
          <td align="center"><input name="mra2" type="text"   tabindex="802"  value="#Session.mra2#" size="3"/></td>
          <td align="center"><input name="mrb2" type="text"   tabindex="902"  value="#Session.mrb2#" size="3"/></td>
          <td align="center"><input name="tsp2" type="text"   tabindex="1002" value="#Session.tsp2#" size="3"/></td>
          <td align="center"><input name="wp2" type="text"   tabindex="1102"  value="#Session.wp2#" size="3"/></td>
          <td align="center"><input name="a2" type="text"   tabindex="1202"    value="#Session.a2#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p5"  value="#Session.p5#" size="3"  tabindex="5"/>
            x
            <input type="text" name="p6"  value="#Session.p6#" size="3"  tabindex="6"/></td>
          <CFSET p5_p6 = Session.p5*Session.p6>
          <td><strong>#p5_p6#</strong></td>
          <td nowrap="nowrap"><input name="w5" type="text"   tabindex="105" value="#Session.w5#" size="3"/>
            x
            <input name="w6" type="text"   tabindex="106" value="#Session.w6#" size="3"/></td>
          <CFSET w5_w6 = Session.w5*Session.w6>
          <td><strong>#w5_w6#</strong></td>
          <td nowrap="nowrap"><input name="rm5" type="text"   tabindex="205" value="#Session.rm5#" size="3"/>
            x
            <input name="rm6" type="text"   tabindex="206" value="#Session.rm6#" size="3"/></td>
          <CFSET rm5_rm6 = Session.rm5*Session.rm6>
          <td><strong>#rm5_rm6#</strong></td>
          <td nowrap="nowrap"><input name="mulch5" type="text"   tabindex="305" value="#Session.mulch5#" size="3"/>
            x
            <input name="mulch6" type="text"   tabindex="306" value="#Session.mulch6#" size="3"/></td>
          <CFSET mulch5_mulch6 = Session.mulch5*Session.mulch6>
          <td><strong>#mulch5_mulch6#</strong></td>
          <td align="center"><input name="otslope3" type="text"   tabindex="403" value="#Session.otslope3#" size="3"/></td>
          <td align="center"><input name="he3" type="text"   tabindex="503"   value="#Session.he3#" size="3"/></td>
          <td align="center"><input name="be3" type="text"   tabindex="603"   value="#Session.be3#" size="3"/></td>
          <td align="center"><input name="we3" type="text"   tabindex="703"   value="#Session.we3#" size="3"/></td>
          <td align="center"><input name="mra3" type="text"   tabindex="803"  value="#Session.mra3#" size="3"/></td>
          <td align="center"><input name="mrb3" type="text"   tabindex="903"  value="#Session.mrb3#" size="3"/></td>
          <td align="center"><input name="tsp3" type="text"   tabindex="1003" value="#Session.tsp3#" size="3"/></td>
          <td align="center"><input name="wp3" type="text"   tabindex="1103"  value="#Session.wp3#" size="3"/></td>
          <td align="center"><input name="a3" type="text"   tabindex="1203"    value="#Session.a3#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p7"  value="#Session.p7#" size="3"  tabindex="7"/>
            x
            <input type="text" name="p8"  value="#Session.p8#" size="3"  tabindex="8"/></td>
          <CFSET p7_p8 = Session.p7*Session.p8>
          <td><strong>#p7_p8#</strong></td>
          <td nowrap="nowrap"><input name="w7" type="text"   tabindex="107" value="#Session.w7#" size="3"/>
            x
            <input name="w8" type="text"   tabindex="108" value="#Session.w8#" size="3"/></td>
          <CFSET w7_w8 = Session.w7*Session.w8>
          <td><strong>#w7_w8#</strong></td>
          <td nowrap="nowrap"><input name="rm7" type="text"   tabindex="207" value="#Session.rm7#" size="3"/>
            x
            <input name="rm8" type="text"   tabindex="208" value="#Session.rm8#" size="3"/></td>
          <CFSET rm7_rm8 = Session.rm7*Session.rm8>
          <td><strong>#rm7_rm8#</strong></td>
          <td nowrap="nowrap"><input name="mulch7" type="text"   tabindex="307" value="#Session.mulch7#" size="3"/>
            x
            <input name="mulch8" type="text"   tabindex="308" value="#Session.mulch8#" size="3"/></td>
          <CFSET mulch7_mulch8 = Session.mulch7*Session.mulch8>
          <td><strong>#mulch7_mulch8#</strong></td>
          <td align="center"><input name="otslope4" type="text"   tabindex="404" value="#Session.otslope4#" size="3"/></td>
          <td align="center"><input name="he4" type="text"   tabindex="504"   value="#Session.he4#" size="3"/></td>
          <td align="center"><input name="be4" type="text"   tabindex="604"   value="#Session.be4#" size="3"/></td>
          <td align="center"><input name="we4" type="text"   tabindex="704"   value="#Session.we4#" size="3"/></td>
          <td align="center"><input name="mra4" type="text"   tabindex="804"  value="#Session.mra4#" size="3"/></td>
          <td align="center"><input name="mrb4" type="text"   tabindex="904"  value="#Session.mrb4#" size="3"/></td>
          <td align="center"><input name="tsp4" type="text"   tabindex="1004" value="#Session.tsp4#" size="3"/></td>
          <td align="center"><input name="wp4" type="text"   tabindex="1104"  value="#Session.wp4#" size="3"/></td>
          <td align="center"><input name="a4" type="text"   tabindex="1204"    value="#Session.a4#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p9" value="#Session.p9#" size="3"  tabindex="9"/>
            x
            <input type="text" name="p10" value="#Session.p10#" size="3"  tabindex="10"/></td>
          <CFSET p9_p10 = Session.p9*Session.p10>
          <td><strong>#p9_p10#</strong></td>
          <td nowrap="nowrap"><input name="w9" type="text"   tabindex="109" value="#Session.w9#" size="3"/>
            x
            <input name="w10" type="text"   tabindex="110" value="#Session.w10#" size="3"/></td>
          <CFSET w9_w10 = Session.w9*Session.w10>
          <td><strong>#w9_w10#</strong></td>
          <td nowrap="nowrap"><input name="rm9" type="text"   tabindex="209" value="#Session.rm9#" size="3"/>
            x
            <input name="rm10" type="text"   tabindex="210" value="#Session.rm10#" size="3"/></td>
          <CFSET rm9_rm10 = Session.rm9*Session.rm10>
          <td><strong>#rm9_rm10#</strong></td>
          <td nowrap="nowrap"><input name="mulch9" type="text"   tabindex="309" value="#Session.mulch9#" size="3"/>
            x
            <input name="mulch10" type="text"   tabindex="310" value="#Session.mulch10#" size="3"/></td>
          <CFSET mulch9_mulch10 = Session.mulch9*Session.mulch10>
          <td><strong>#mulch9_mulch10#</strong></td>
          <td align="center"><input name="otslope5" type="text"   tabindex="405" value="#Session.otslope5#" size="3"/></td>
          <td align="center"><input name="he5" type="text"   tabindex="505"   value="#Session.he5#" size="3"/></td>
          <td align="center"><input name="be5" type="text"   tabindex="605"   value="#Session.be5#" size="3"/></td>
          <td align="center"><input name="we5" type="text"   tabindex="705"   value="#Session.we5#" size="3"/></td>
          <td align="center"><input name="mra5" type="text"   tabindex="805"  value="#Session.mra5#" size="3"/></td>
          <td align="center"><input name="mrb5" type="text"   tabindex="905"  value="#Session.mrb5#" size="3"/></td>
          <td align="center"><input name="tsp5" type="text"   tabindex="1005" value="#Session.tsp5#" size="3"/></td>
          <td align="center"><input name="wp5" type="text"   tabindex="1105"  value="#Session.wp5#" size="3"/></td>
          <td align="center"><input name="a5" type="text"   tabindex="1205"    value="#Session.a5#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p11"  value="#Session.p11#" size="3"  tabindex="11"/>
            x
            <input type="text" name="p12"  value="#Session.p12#" size="3"  tabindex="12"/></td>
          <CFSET p11_p12 = Session.p11*Session.p12>
          <td><strong>#p11_p12#</strong></td>
          <td nowrap="nowrap"><input name="w11" type="text"   tabindex="111" value="#Session.w11#" size="3"/>
            x
            <input name="w12" type="text" tabindex="112" value="#Session.w12#" size="3"/></td>
          <CFSET w11_w12 = Session.w11*Session.w12>
          <td><strong>#w11_w12#</strong></td>
          <td nowrap="nowrap"><input name="rm11" type="text"   tabindex="211" value="#Session.rm11#" size="3"/>
            x
            <input name="rm12" type="text" tabindex="212" value="#Session.rm12#" size="3"/></td>
          <CFSET rm11_rm12 = Session.rm11*Session.rm12>
          <td><strong>#rm11_rm12#</strong></td>
          <td nowrap="nowrap"><input name="mulch11" type="text"   tabindex="311" value="#Session.mulch11#" size="3"/>
            x
            <input name="mulch12" type="text" tabindex="312" value="#Session.mulch12#" size="3"/></td>
          <CFSET mulch11_mulch12 = Session.mulch11*Session.mulch12>
          <td><strong>#mulch11_mulch12#</strong></td>
          <td align="center"><input name="otslope6" type="text"   tabindex="406"  value="#Session.otslope6#" size="3"/></td>
          <td align="center"><input name="he6" type="text"   tabindex="506"   value="#Session.he6#" size="3"/></td>
          <td align="center"><input name="be6" type="text"   tabindex="606"   value="#Session.be6#" size="3"/></td>
          <td align="center"><input name="we6" type="text"   tabindex="706"   value="#Session.we6#" size="3"/></td>
          <td align="center"><input name="mra6" type="text"   tabindex="806"  value="#Session.mra6#" size="3"/></td>
          <td align="center"><input name="mrb6" type="text"   tabindex="906"  value="#Session.mrb6#" size="3"/></td>
          <td align="center"><input name="tsp6" type="text"   tabindex="1006" value="#Session.tsp6#" size="3"/></td>
          <td align="center"><input name="wp6" type="text"   tabindex="1106"  value="#Session.wp6#" size="3"/></td>
          <td align="center"><input name="a6" type="text"   tabindex="1206"    value="#Session.a6#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p13"  value="#Session.p13#" size="3"  tabindex="13"/>
            x
            <input type="text" name="p14"  value="#Session.p14#" size="3"  tabindex="14"/></td>
          <CFSET p13_p14 = Session.p13*Session.p14>
          <td><strong>#p13_p14#</strong></td>
          <td nowrap="nowrap"><input name="w13" type="text"   tabindex="113" value="#Session.w13#" size="3"/>
            x
            <input name="w14" type="text"   tabindex="114" value="#Session.w14#" size="3"/></td>
          <CFSET w13_w14 = Session.w13*Session.w14>
          <td><strong>#w13_w14#</strong></td>
          <td nowrap="nowrap"><input name="rm13" type="text"   tabindex="213" value="#Session.rm13#" size="3"/>
            x
            <input name="rm14" type="text"   tabindex="214" value="#Session.rm14#" size="3"/></td>
          <CFSET rm13_rm14 = Session.rm13*Session.rm14>
          <td><strong>#rm13_rm14#</strong></td>
          <td nowrap="nowrap"><input name="mulch13" type="text"   tabindex="313" value="#Session.mulch13#" size="3"/>
            x
            <input name="mulch14" type="text"   tabindex="314" value="#Session.mulch14#" size="3"/></td>
          <CFSET mulch13_mulch14 = Session.mulch13*Session.mulch14>
          <td><strong>#mulch13_mulch14#</strong></td>
          <td align="center"><input name="otslope7" type="text" tabindex="407" value="#Session.otslope7#" size="3"/></td>
          <td align="center"><input name="he7" type="text" tabindex="507"   value="#Session.he7#" size="3"/></td>
          <td align="center"><input name="be7" type="text" tabindex="607"   value="#Session.be7#" size="3"/></td>
          <td align="center"><input name="we7" type="text" tabindex="707"   value="#Session.we7#" size="3"/></td>
          <td align="center"><input name="mra7" type="text" tabindex="807"  value="#Session.mra7#" size="3"/></td>
          <td align="center"><input name="mrb7" type="text" tabindex="907"  value="#Session.mrb7#" size="3"/></td>
          <td align="center"><input name="tsp7" type="text" tabindex="1007" value="#Session.tsp7#" size="3"/></td>
          <td align="center"><input name="wp7" type="text" tabindex="1107"  value="#Session.wp7#" size="3"/></td>
          <td align="center"><input name="a7" type="text" tabindex="1207"    value="#Session.a7#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p15"  value="#Session.p15#" size="3"  tabindex="15"/>
            x
            <input type="text" name="p16"  value="#Session.p16#" size="3"  tabindex="16"/></td>
          <CFSET p15_p16 = Session.p15*Session.p16>
          <td><strong>#p15_p16#</strong></td>
          <td nowrap="nowrap"><input name="w15" type="text"   tabindex="115" value="#Session.w15#" size="3"/>
            x
            <input name="w16" type="text"   tabindex="116" value="#Session.w16#" size="3"/></td>
          <CFSET w15_w16 = Session.w15*Session.w16>
          <td><strong>#w15_w16#</strong></td>
          <td nowrap="nowrap"><input name="rm15" type="text"   tabindex="215" value="#Session.rm15#" size="3"/>
            x
            <input name="rm16" type="text"   tabindex="216" value="#Session.rm16#" size="3"/></td>
          <CFSET rm15_rm16 = Session.rm15*Session.rm16>
          <td><strong>#rm15_rm16#</strong></td>
          <td nowrap="nowrap"><input name="mulch15" type="text"   tabindex="315" value="#Session.mulch15#" size="3"/>
            x
            <input name="mulch16" type="text"   tabindex="316" value="#Session.mulch16#" size="3"/></td>
          <CFSET mulch15_mulch16 = Session.mulch15*Session.mulch16>
          <td><strong>#mulch15_mulch16#</strong></td>
          <td align="center"><input name="otslope8" type="text"   tabindex="408" value="#Session.otslope8#" size="3"/></td>
          <td align="center"><input name="he8" type="text"   tabindex="508"   value="#Session.he8#" size="3"/></td>
          <td align="center"><input name="be8" type="text"   tabindex="608"   value="#Session.be8#" size="3"/></td>
          <td align="center"><input name="we8" type="text"   tabindex="708"   value="#Session.we8#" size="3"/></td>
          <td align="center"><input name="mra8" type="text"   tabindex="808"  value="#Session.mra8#" size="3"/></td>
          <td align="center"><input name="mrb8" type="text"   tabindex="908"  value="#Session.mrb8#" size="3"/></td>
          <td align="center"><input name="tsp8" type="text"   tabindex="1008" value="#Session.tsp8#" size="3"/></td>
          <td align="center"><input name="wp8" type="text"   tabindex="1108"  value="#Session.wp8#" size="3"/></td>
          <td align="center"><input name="a8" type="text"   tabindex="1208"    value="#Session.a8#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p17"  value="#Session.p17#" size="3"  tabindex="17"/>
            x
            <input type="text" name="p18"  value="#Session.p18#" size="3"  tabindex="18"/></td>
          <CFSET p17_p18 = Session.p17*Session.p18>
          <td><strong>#p17_p18#</strong></td>
          <td nowrap="nowrap"><input name="w17" type="text"   tabindex="117" value="#Session.w17#" size="3"/>
            x
            <input name="w18" type="text"   tabindex="118" value="#Session.w18#" size="3"/></td>
          <CFSET w17_w18 = Session.w17*Session.w18>
          <td><strong>#w17_w18#</strong></td>
          <td nowrap="nowrap"><input name="rm17" type="text"   tabindex="217" value="#Session.rm17#" size="3"/>
            x
            <input name="rm18" type="text"   tabindex="218" value="#Session.rm18#" size="3"/></td>
          <CFSET rm17_rm18 = Session.rm17*Session.rm18>
          <td><strong>#rm17_rm18#</strong></td>
          <td nowrap="nowrap"><input name="mulch17" type="text"   tabindex="317" value="#Session.mulch17#" size="3"/>
            x
            <input name="mulch18" type="text"   tabindex="318" value="#Session.mulch18#" size="3"/></td>
          <CFSET mulch17_mulch18 = Session.mulch17*Session.mulch18>
          <td><strong>#mulch17_mulch18#</strong></td>
          <td align="center"><input name="otslope9" type="text"   tabindex="409" value="#Session.otslope9#" size="3"/></td>
          <td align="center"><input name="he9" type="text"   tabindex="509"   value="#Session.he9#" size="3"/></td>
          <td align="center"><input name="be9" type="text"   tabindex="609"   value="#Session.be9#" size="3"/></td>
          <td align="center"><input name="we9" type="text"   tabindex="709"   value="#Session.we9#" size="3"/></td>
          <td align="center"><input name="mra9" type="text"   tabindex="809"  value="#Session.mra9#" size="3"/></td>
          <td align="center"><input name="mrb9" type="text"   tabindex="909"  value="#Session.mrb9#" size="3"/></td>
          <td align="center"><input name="tsp9" type="text"   tabindex="1009" value="#Session.tsp9#" size="3"/></td>
          <td align="center"><input name="wp9" type="text"   tabindex="1109"  value="#Session.wp9#" size="3"/></td>
          <td align="center"><input name="a9" type="text"   tabindex="1209"    value="#Session.a9#" size="3"/></td>
        </tr>
        <tr>
          <td nowrap="nowrap"><input type="text" name="p19" value="#Session.p19#" size="3"  tabindex="19"/>
            x
            <input type="text" name="p20" value="#Session.p20#" size="3"  tabindex="20"/></td>
          <CFSET p19_p20 = Session.p19*Session.p20>
          <td><strong>#p19_p20#</strong></td>
          <td nowrap="nowrap"><input name="w19" type="text"   tabindex="119" value="#Session.w19#" size="3"/>
            x
            <input name="w20" type="text"   tabindex="120" value="#Session.w20#" size="3"/></td>
          <CFSET w19_w20 = Session.w19*Session.w20>
          <td><strong>#w19_w20#</strong></td>
          <td nowrap="nowrap"><input name="rm19" type="text"   tabindex="219" value="#Session.rm19#" size="3"/>
            x
            <input name="rm20" type="text"   tabindex="220" value="#Session.rm20#" size="3"/></td>
          <CFSET rm19_rm20 = Session.rm19*Session.rm20>
          <td><strong>#rm19_rm20#</strong></td>
          <td nowrap="nowrap"><input name="mulch19" type="text"   tabindex="319" value="#Session.mulch19#" size="3"/>
            x
            <input name="mulch20" type="text"   tabindex="320" value="#Session.mulch20#" size="3"/></td>
          <CFSET mulch19_mulch20 = Session.mulch19*Session.mulch20>
          <td><strong>#mulch19_mulch20#</strong></td>
          <td align="center"><input name="otslope10" type="text"   tabindex="410" value="#Session.otslope10#" size="3"/></td>
          <td align="center"><input name="he10" type="text"   tabindex="510"   value="#Session.he10#" size="3"/></td>
          <td align="center"><input name="be10" type="text"   tabindex="610"   value="#Session.be10#" size="3"/></td>
          <td align="center"><input name="we10" type="text"   tabindex="710"   value="#Session.we10#" size="3"/></td>
          <td align="center"><input name="mra10" type="text"   tabindex="810"  value="#Session.mra10#" size="3"/></td>
          <td align="center"><input name="mrb10" type="text"   tabindex="910"  value="#Session.mrb10#" size="3"/></td>
          <td align="center"><input name="tsp10" type="text"   tabindex="1010" value="#Session.tsp10#" size="3"/></td>
          <td align="center"><input name="wp10" type="text"   tabindex="1110"  value="#Session.wp10#" size="3"/></td>
          <td align="center"><input name="a10" type="text"   tabindex="1210"    value="#Session.a10#" size="3"/></td>
        </tr>
        <tr>
          <td colspan="2"   align="right"><strong class="bigfont">#NumberFormat(PUSH_TOTAL,"9,999,999")#</strong>&nbsp;</td>
          <td colspan="2"  align="right"><strong class="bigfont">#NumberFormat(WALK_TOTAL,"9,999,999")#</strong>&nbsp;</td>
          <td colspan="2"  align="right"><strong class="bigfont">#NumberFormat(ride_mow_TOTAL,"9,999,999")#</strong>&nbsp;</td>
          <td colspan="2" align="right"><strong class="bigfont">#NumberFormat(mulch_TOTAL,"9,999,999")#</strong>&nbsp;</td>
          <td  align="center"><strong class="bigfont">#NumberFormat(OTSLOPE_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(HE_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(BE_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(WE_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(mra_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(mrb_TOTAL,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(tsp_total,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(wp_total,"9,999,999")#</strong></td>
          <td  align="center"><strong class="bigfont">#NumberFormat(a_total,"9,999,999")#</strong></td>
        </tr>
      </cfoutput>
    </tbody>
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

<strong><span style="color: #F70E5E">1 decimal here</span></strong>
</body>
<!-- END BODY -->
</html>
