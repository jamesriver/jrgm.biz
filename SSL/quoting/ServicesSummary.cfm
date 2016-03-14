<CFSET todaydate =  DateFormat(now(), "mm/dd/yyyy")>
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
 opportunity_field_14 AS q_opportunity_type  ,OPPORTUNITY_status ,date_updated_utc, date_due_utc
 FROM         quote_start
where opportunity_id  =#url.id#
</cfquery>

<cfquery name="get_price_quote_info" datasource="jrgm">
SELECT       ID, quote_id, opportunity_id, push_mow_qty, push_mow_rate, push_mow_times, push_mow_cost, turf_preg_qty, turf_preg_rate, turf_preg_times, 
                      turf_preg_cost, walk_behind_qty, walk_behind_rate, walk_behind_times, walk_behind_cost, ride_mow_qty, ride_mow_rate, ride_mow_times, ride_mow_cost, 
                      hard_edge_qty, hard_edge_rate, hard_edge_times, hard_edge_cost, bed_edge_qty, bed_edge_rate, bed_edge_times, bed_edge_cost, trim_o_qty, trim_o_rate, 
                      trim_o_times, trim_o_cost, trim_s_qty, trim_s_rate, trim_s_times, trim_s_cost, spraying_qty, spraying_rate, spraying_times, spraying_cost, weeding_qty, 
                      weeding_rate, weeding_times, weeding_cost, blowing_qty, blowing_rate, blowing_times, blowing_cost, trash_s_qty, trash_s_rate, trash_s_times, trash_s_cost, 
                      traveltime_qty, traveltime_rate, traveltime_times, traveltime_cost, trash_o_qty, trash_o_rate, trash_o_times, trash_o_cost, leafrem_qty, leafrem_rate, leafrem_times, 
                      leafrem_cost, cleanup_qty, cleanup_rate, cleanup_times, cleanup_cost, turf_prel_qty, turf_prel_rate, turf_prel_times, turf_prel_cost, turf_post_qty, turf_post_rate, 
                      turf_post_times, turf_post_cost, turf_fert_qty, turf_fert_rate, turf_fert_times, turf_fert_cost, turf_lime_qty, turf_lime_rate, turf_lime_times, turf_lime_cost, turf_aer_h_qty, 
                      turf_aer_h_rate, turf_aer_h_times, turf_aer_h_cost, turf_aer_t_qty, turf_aer_t_rate, turf_aer_t_times, turf_aer_t_cost, turf_seed_qty, turf_seed_rate, turf_seed_times, 
                      turf_seed_cost, pruning_tp_qty, pruning_tp_rate, pruning_tp_times, pruning_tp_cost, pruning_s_qty, pruning_s_rate, pruning_s_times, pruning_s_cost, TS_Fert_qty, 
                      TS_Fert_rate, TS_Fert_times, TS_Fert_cost, TS_Insect_qty, TS_Insect_rate, TS_Insect_times, TS_Insect_cost, Mulch_pre_qty, Mulch_pre_rate, Mulch_pre_times, 
                      Mulch_pre_cost, Mulch_edging_qty, Mulch_edging_rate, Mulch_edging_times, Mulch_edging_cost, Mulch_s_dyed_qty, Mulch_s_dyed_rate, Mulch_s_dyed_times, 
                      Mulch_s_dyed_cost, Mulch_f_dyed_qty, Mulch_f_dyed_rate, Mulch_f_dyed_times, Mulch_f_dyed_cost, Annuals_S_qty, Annuals_S_rate, Annuals_S_times, 
                      Annuals_S_cost, Annuals_F_qty, Annuals_F_rate, Annuals_F_times, Annuals_F_cost, Irrigation_SU_qty, Irrigation_SU_rate, Irrigation_SU_times, Irrigation_SU_cost, 
                      Irrigation_W_qty, Irrigation_W_rate, Irrigation_W_times, Irrigation_W_cost, Irrigation_I_qty, Irrigation_I_rate, Irrigation_I_times, Irrigation_I_cost, Mulch_F_Reg_qty, 
                      Mulch_F_Reg_rate, Mulch_F_Reg_times, Mulch_F_Reg_cost, Mulch_S_Reg_qty, Mulch_S_Reg_rate, Mulch_S_Reg_times, Mulch_S_Reg_cost, Pond_maint_qty, 
                      Pond_maint_rate, Pond_maint_times, Pond_maint_cost, Trim_Hillside_qty, Trim_Hillside_rate, Trim_Hillside_times, Trim_Hillside_cost, Pine_Tags_qty, 
                      Pine_Tags_rate, Pine_Tags_times, Pine_Tags_cost, TS_hort_oil_qty, TS_hort_oil_rate, TS_hort_oil_times, TS_hort_oil_cost, Addtl_Mowing_qty, Addtl_Mowing_rate, 
                      Addtl_Mowing_times, Addtl_Mowing_cost, Day_Porter_qty, Day_Porter_rate, Day_Porter_times, Day_Porter_cost, Bush_Hog_qty, Bush_Hog_rate, Bush_Hog_times, 
                      Bush_Hog_cost, Lot_Sweeping_qty, Lot_Sweeping_rate, Lot_Sweeping_times, Lot_Sweeping_cost, Trail_Maint_qty, Trail_Maint_rate, Trail_Maint_times, 
                      Trail_Maint_cost, Irrigation_TM_qty, Irrigation_TM_rate, Irrigation_TM_times, Irrigation_TM_cost, Irrigation_BFI_qty, Irrigation_BFI_rate, Irrigation_BFI_times, 
                      Irrigation_BFI_cost, Natural_Area_qty, Natural_Area_rate, Natural_Area_times, Natural_Area_cost, Trash_Receptacle_qty, Trash_Receptacle_rate, 
                      Trash_Receptacle_times, Trash_Receptacle_cost, Playground_mulch_qty, Playground_mulch_rate, Playground_mulch_times, Playground_mulch_cost, 
                      Turf_nutsedge_qty, Turf_nutsedge_rate, Turf_nutsedge_times, Turf_nutsedge_cost, Turf_fungicide_qty, Turf_fungicide_rate, Turf_fungicide_times, Turf_fungicide_cost, 
                      Turf_insecticide_qty, Turf_insecticide_rate, Turf_insecticide_times, Turf_insecticide_cost, blank1_service, blank1_unit, blank1_service_rate, blank1_qty, blank1_rate, 
                      blank1_times, blank1_cost, blank2_service, blank2_unit, blank2_service_rate, blank2_qty, blank2_rate, blank2_times, blank2_cost, blank3_service, blank3_unit, 
                      blank3_service_rate, blank3_qty, blank3_rate, blank3_times, blank3_cost
FROM         quote_services WHERE  opportunity_id = #url.ID#
</cfquery>


<!---<cfdump var="#get_price_quote_info#">--->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <!---<cfinclude template="includes/subbar.cfm">--->
    <!--centre content goes here -->
    <div class="centrecontent_inner_estimate">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><div class="header">Maintenance Services Summary</div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top"><img src="images/logo.png" width="281" height="66" /></td>
                <td valign="top" class="contractTerms">James River Grounds Management<br />
                  4614 Rochambeau Drive<br />
                  #opportunity_field_1#, VA  <br />
                  Phone (757) 566-1800 Fax (757) 566-4334</td>
                <td valign="top" class="contractTerms">Date: <cfoutput>#todaydate#</cfoutput><br />
                Estimate by:  </td>
              </tr>
            </table><br />

            <div align="center">
              <p>Attachment A</p>
            </div>
            <cfoutput  query="get_quote_info">
              <p>JAMES RIVER GROUNDS MANAGEMENT, INC. SHALL PROVIDE THE FOLLOWING SERVICES AT <strong>#opportunity_name#</strong>, LOCATED AT  <strong>#q_address1#</strong>, IN <strong>#q_city#, #q_address_state#</strong>. <br />
PLEASE REFER TO THE 'DEFINITION OF SERVICES' (Attachment B) FOR
                MORE DETAILED SERVICE SPECIFICATIONS.</p>
            </cfoutput>
           <cfoutput>
            <table width="50%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" class="dstable_l5">I. SEASONAL MAINTENANCE</td>
                <td class="dstable_l5"> $2,834.00</td>
              </tr>
              
              <cfif  get_price_quote_info.push_mow_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.push_mow_times# </td>
                <td class="dstable_l5"> 22&quot; Push Mowing</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                <cfif  get_price_quote_info.walk_behind_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.walk_behind_times# </td>
                <td class="dstable_l5"> Walk Behind</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                  <cfif  get_price_quote_info.ride_mow_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.ride_mow_times# </td>
                <td class="dstable_l5">Ride Mow</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif> 
                  <cfif  get_price_quote_info.hard_edge_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.hard_edge_times#</td>
                <td class="dstable_l5">Hard Edging (short runs)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
          </cfif>
           <cfif  get_price_quote_info.bed_edge_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.bed_edge_times#</td>
                <td class="dstable_l5">Bed Stick Edging</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
             <cfif  get_price_quote_info.trim_o_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.trim_o_times#</td>
                <td class="dstable_l5">Obstacle Trimming</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
               <cfif  get_price_quote_info.trim_s_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.trim_s_times#</td>
                <td class="dstable_l5">Slope Trimming</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                  <cfif  get_price_quote_info.spraying_times  GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.spraying_times#</td>
                <td class="dstable_l5">Spraying</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                 <cfif  get_price_quote_info.weeding_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.weeding_times#</td>
                <td class="dstable_l5">Weeding</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
               <cfif  get_price_quote_info.blowing_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.blowing_times#</td>
                <td class="dstable_l5">Blowing</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
              
               <cfif  get_price_quote_info.trash_s_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.trash_s_times#</td>
                <td class="dstable_l5">Trash Removal</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
              
               <cfif  get_price_quote_info.traveltime_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.traveltime_times#</td>
                <td class="dstable_l5">Travel Time</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
              <tr>
                <td colspan="2" class="dstable_l5">II. OFF SEASON SERVICES</td>
                <td class="dstable_l5"> $1,080.00</td>
              </tr>
                 <cfif  get_price_quote_info.trash_o_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.trash_o_times#</td>
                <td class="dstable_l5">Off Season Trash Pick-up<br /></td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
               </cfif>
                 <cfif  get_price_quote_info.leafrem_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.leafrem_times#</td>
                <td class="dstable_l5"> Leaf Removal</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
               </cfif>
                 <cfif  get_price_quote_info.cleanup_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.cleanup_times#</td>
                <td class="dstable_l5"> Cleanup</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
               </cfif>
              <tr>
                <td colspan="2" class="dstable_l5"> III. TURF CARE </td>
                <td class="dstable_l5">$105.00</td>
              </tr>
                  <cfif  get_price_quote_info.turf_preg_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_preg_times#</td>
                 <td class="dstable_l5">Turf Pre (G)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                </cfif>
                  <cfif  get_price_quote_info.turf_prel_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_prel_times#</td>
                  <td class="dstable_l5">Turf Pre (L)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_post_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_post_times#</td>
                    <td class="dstable_l5">Turf Post</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_fert_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_fert_times#</td>
                    <td class="dstable_l5">Turf Fert</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_lime_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_lime_times#</td>
                    <td class="dstable_l5">Turf Lime</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_aer_h_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_aer_h_times#</td>
                    <td class="dstable_l5">Turf Aer (H)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_aer_t_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_aer_t_times#</td>
                    <td class="dstable_l5">Turf Aer (T)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.turf_seed_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.turf_seed_times#</td>
                <td class="dstable_l5">Turf Seed</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Turf_nutsedge_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Turf_nutsedge_times#</td>
                    <td class="dstable_l5">Turf Nutsedge</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Turf_fungicide_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Turf_fungicide_times#</td>
                    <td class="dstable_l5">Turf Fungicide</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Turf_insecticide_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Turf_insecticide_times#</td>
                    <td class="dstable_l5">Turf Insecticide</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
               <tr>
                <td colspan="2" class="dstable_l5">IV. TREE AND SHRUB CARE </td>
                <td class="dstable_l5">$1,183.00</td>
              </tr>
      
              <cfif  get_price_quote_info.pruning_tp_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.pruning_tp_times#</td>
                <td class="dstable_l5">Tree &amp; Perennial Pruning</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                  <cfif  get_price_quote_info.pruning_s_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.pruning_s_times#</td>
                <td class="dstable_l5">Shrub Pruning</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                 </cfif>
                   <cfif  get_price_quote_info.TS_Fert_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.TS_Fert_times#</td>
                <td class="dstable_l5">T/S Fert</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>   </cfif>
              
                  <cfif  get_price_quote_info.TS_Insect_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.TS_Insect_times#</td>
                <td class="dstable_l5">T/S Insecticide</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>   </cfif>
              
                  <cfif  get_price_quote_info.TS_hort_oil_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.TS_hort_oil_times#</td>
                <td class="dstable_l5">T/S Hort Oil.</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>   </cfif>
              <tr>
                <td colspan="2" class="dstable_l5">V. MULCH </td>
                <td class="dstable_l5">$1,567.00</td>
              </tr>
                <cfif  get_price_quote_info.Mulch_pre_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_pre_times#</td>
               <td class="dstable_l5">Bed Pre</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
              </cfif>
                  <cfif  get_price_quote_info.Mulch_edging_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_edging_times#</td>
              <td class="dstable_l5">Edging Mulch</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Mulch_s_dyed_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_s_dyed_times#</td>
                 <td class="dstable_l5">Spring Mulch (dyed)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Mulch_f_dyed_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_f_dyed_times#</td>
                <td class="dstable_l5">Fall Mulch (dyed)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                  </cfif>
                  <cfif  get_price_quote_info.Mulch_S_Reg_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_S_Reg_times#</td>
                 <td class="dstable_l5">Spring Mulch (non dyed)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
               </cfif>
                  <cfif  get_price_quote_info.Mulch_F_Reg_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Mulch_F_Reg_times#</td>
             <td class="dstable_l5">Fall Mulch (non dyed)</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
               </cfif>
                  <cfif  get_price_quote_info.Pine_Tags_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Pine_Tags_times#</td>
                 <td class="dstable_l5">Pine Tags</td>
                <td class="dstable_l5">&nbsp;</td>
              </tr>
                 </cfif>
              <tr>
                <td colspan="2" class="dstable_l5">VI. FLOWERS<br /></td>
                <td class="dstable_l5">$3,520.00</td>
              </tr>
                <cfif  get_price_quote_info.Annuals_S_times GT 0>
              <tr>
                <td class="dstable_l5">#get_price_quote_info.Annuals_S_times#</td>
                <td class="dstable_l5"> Spring Annuals - 400<br /></td>
                <td class="dstable_l5">&nbsp;</td>
              </tr></cfif>
                <cfif  get_price_quote_info.Annuals_F_times GT 0>
                  <tr>
                    <td class="dstable_l5">#get_price_quote_info.Annuals_F_times#</td>
                    <td class="dstable_l5">Fall Annuals - 400</td>
                    <td class="dstable_l5">&nbsp;</td>
                  </tr>
                  </cfif>
              
              
                <tr>
                  <td colspan="2" class="dstable_l5">VII. IRRIGATION SERVICES<br /></td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                <cfif  get_price_quote_info.Irrigation_SU_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Irrigation_SU_times#</td>
                   <td class="dstable_l5">Irrigation SU</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                </cfif>
                <cfif  get_price_quote_info.Irrigation_W_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Irrigation_W_times#</td>
                   <td class="dstable_l5">Irrigation W</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                </cfif>
                <cfif  get_price_quote_info.Irrigation_I_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Irrigation_I_times#</td>
                  <td class="dstable_l5">Irrigation Inspections</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                </cfif>
                <cfif  get_price_quote_info.Irrigation_TM_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Irrigation_TM_times#</td>
                  <td class="dstable_l5">Irrigation TM</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                </cfif>
                <cfif  get_price_quote_info.Irrigation_BFI_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Irrigation_BFI_times#</td>
                   <td class="dstable_l5">Irrigation BFI</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                </cfif>
                
                <tr>
                  <td colspan="2" class="dstable_l5">VIII. ADDITIONAL SERVICES<br /></td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
               
                <cfif  get_price_quote_info.Addtl_Mowing_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Addtl_Mowing_times#</td>
                  <td class="dstable_l5">Addt'l Mowing</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Day_Porter_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Day_Porter_times#</td>
                  <td class="dstable_l5">Day Porter</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Bush_Hog_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Bush_Hog_times#</td>
                   <td class="dstable_l5">Bush Hog</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Lot_Sweeping_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Lot_Sweeping_times#</td>
                   <td class="dstable_l5">Lot Sweeping</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Trail_Maint_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Trail_Maint_times#</td>
                  <td class="dstable_l5">Trail Maintenance</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Natural_Area_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Natural_Area_times#</td>
                 <td class="dstable_l5">Natural Area</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Trash_Receptacle_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Trash_Receptacle_times#</td>
                   <td class="dstable_l5">Trash Receptacle/Dog Station</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.Playground_mulch_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.Playground_mulch_times#</td>
                   <td class="dstable_l5">Playground Mulch</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                <cfif  get_price_quote_info.blank1_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.blank1_times#</td>
                  <td align="left" class="dstable_l5">#get_price_quote_info.blank1_service#</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                 
                   <cfif  get_price_quote_info.blank2_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.blank2_times#</td>
                  <td align="left" class="dstable_l5">#get_price_quote_info.blank2_service#</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
                 
                       <cfif  get_price_quote_info.blank3_times GT 0>
                <tr>
                  <td class="dstable_l5">#get_price_quote_info.blank3_times#</td>
                  <td align="left" class="dstable_l5">#get_price_quote_info.blank3_service#</td>
                  <td class="dstable_l5">&nbsp;</td>
                </tr>
                 </cfif>
              
                <tr>
                  <td class="dstable_l5">&nbsp;</td>
                  <td align="right" class="dstable_l5">$857.42 x12 Months =</td>
                  <td class="dstable_l5">$10,289.00</td>
                  </tr>
            </table>
            </cfoutput>
           <br />
 <p>Client Initial: __________</p>
            <p><br />
              Date: ________________</span></p>
            <p><br />
              NOTES:<br />
            </p></td>
        </tr>
      </table>
    </div>
  </div>
  <!-- to clear footer -->
</div>
</body>
</html>
