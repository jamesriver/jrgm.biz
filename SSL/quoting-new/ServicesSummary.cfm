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
 opportunity_field_14 AS q_opportunity_type  ,OPPORTUNITY_status ,date_updated_utc, date_due_utc,user_id
 FROM         quote_start
where opportunity_id  =#url.id#
</cfquery>
<cfif  get_quote_info.user_id NEQ "">
  <cfquery name="get_estimator" datasource="jrgm">
 SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     
 FROM app_employees  
where  [Employee ID]   =#get_quote_info.user_id#
</cfquery>
</cfif>
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
                      blank3_service_rate, blank3_qty, blank3_rate, blank3_times, blank3_cost,contract_installments

FROM         quote_services WHERE  opportunity_id = #url.ID#
</cfquery>


<cfif  get_price_quote_info.recordcount EQ 0> Quote has not been started. No MSS available.<cfabort></cfif>
<cfquery name="get_price_quote_dollars" datasource="jrgm">
SELECT       ID, date_created, gross_margin, opportunity_id, date_updated, user_id, push_mow_contract_price, walk_behind_contract_price, ride_mow_contract_price, 
                      hard_edge_contract_price, bed_edge_contract_price, TRIM_O_contract_price, TRIM_S_contract_price, spraying_contract_price, weeding_contract_price, 
                      blowing_contract_price, Trash_S_contract_price, traveltime_contract_price, Trash_O_contract_price, leafrem_contract_price, cleanup_contract_price, 
                      turf_preg_contract_price, turf_prel_contract_price, turf_post_contract_price, turf_fert_contract_price, turf_lime_contract_price, Turf_Aer_H_contract_price, 
                      Turf_Aer_T_contract_price, Turf_Seed_contract_price, Pruning_TP_contract_price, Pruning_S_contract_price, TS_Fert_contract_price, TS_Insect_contract_price, 
                      Annuals_S_contract_price, Annuals_F_contract_price, Irrigation_SU_contract_price, Irrigation_W_contract_price, Irrigation_I_contract_price, 
                      Mulch_F_Reg_contract_price, Mulch_S_Reg_contract_price, mulch_s_dyed_contract_price, mulch_f_dyed_contract_price, Mulch_edging_contract_price, mulch_pre_contract_price, Pond_maint_contract_price, Trim_Hillside_contract_price, Pine_Tags_contract_price, TS_hort_oil_contract_price, Addtl_Mowing_contract_price, Day_Porter_contract_price, 
                      Bush_Hog_contract_price, Lot_Sweeping_contract_price, Trail_Maint_contract_price, Irrigation_TM_contract_price, Irrigation_BFI_contract_price, 
                      Natural_Area_contract_price, Trash_Receptacle_contract_price, Playground_mulch_contract_price, Turf_Nutsedge_contract_price, Turf_Fungicide_contract_price, 
                      Turf_Insecticide_contract_price, blank1_contract_price, blank2_contract_price, blank3_contract_price, total_contract_price,contract_installments
FROM         quote_main  WHERE  opportunity_id = #url.ID#
</cfquery>

<!---<cfdump var="#get_price_quote_dollars#">--->

<cfif  get_price_quote_dollars.contract_installments EQ 0>
  <CFSET monthly_price =  "">
  <cfelseif get_price_quote_dollars.total_contract_price NEQ "" AND  get_price_quote_dollars.contract_installments NEQ 0 AND  get_price_quote_dollars.contract_installments NEQ "">
  <CFSET monthly_price =  get_price_quote_dollars.total_contract_price/get_price_quote_dollars.contract_installments>
  <cfelse>
  <CFSET monthly_price = "">
</cfif>
<CFSET SEASONAL = get_price_quote_dollars.bed_edge_contract_price +   get_price_quote_dollars.blowing_contract_price +get_price_quote_dollars.hard_edge_contract_price	 + get_price_quote_dollars.push_mow_contract_price 	 + get_price_quote_dollars.ride_mow_contract_price +get_price_quote_dollars.spraying_contract_price	 + get_price_quote_dollars.trash_s_contract_price +  get_price_quote_dollars.trim_o_contract_price	 +   get_price_quote_dollars.trim_s_contract_price	 +  get_price_quote_dollars.walk_behind_contract_price +   get_price_quote_dollars.weeding_contract_price+get_price_quote_dollars.traveltime_contract_price>
<CFSET OFFSEASON = get_price_quote_dollars.trash_o_contract_price +   get_price_quote_dollars.leafrem_contract_price +get_price_quote_dollars.cleanup_contract_price>
<CFSET TURFCARE = get_price_quote_dollars.turf_aer_h_contract_price+get_price_quote_dollars.turf_aer_t_contract_price+get_price_quote_dollars.turf_fert_contract_price+get_price_quote_dollars.Turf_fungicide_contract_price+get_price_quote_dollars.Turf_insecticide_contract_price+get_price_quote_dollars.turf_lime_contract_price+               get_price_quote_dollars.Turf_nutsedge_contract_price+get_price_quote_dollars.turf_post_contract_price+get_price_quote_dollars.turf_preg_contract_price+get_price_quote_dollars.turf_prel_contract_price+get_price_quote_dollars.turf_seed_contract_price>
<CFSET TREESHRUB = get_price_quote_dollars.pruning_s_contract_price +get_price_quote_dollars.pruning_tp_contract_price +get_price_quote_dollars.TS_Fert_contract_price +get_price_quote_dollars.TS_hort_oil_contract_price +get_price_quote_dollars.TS_Insect_contract_price >
<CFSET MULCH =  get_price_quote_dollars.Mulch_edging_contract_price +get_price_quote_dollars.Mulch_f_dyed_contract_price+get_price_quote_dollars.Mulch_F_Reg_contract_price 
+get_price_quote_dollars.Mulch_pre_contract_price +get_price_quote_dollars.Mulch_s_dyed_contract_price +get_price_quote_dollars.Mulch_S_Reg_contract_price +get_price_quote_dollars.Pine_Tags_contract_price >
<CFSET FLOWERS =  get_price_quote_dollars.Annuals_S_contract_price + get_price_quote_dollars.Annuals_F_contract_price  >
<CFSET IRRIGATION = get_price_quote_dollars.Irrigation_BFI_contract_price +
get_price_quote_dollars.Irrigation_I_contract_price +
get_price_quote_dollars.Irrigation_SU_contract_price +
get_price_quote_dollars.Irrigation_TM_contract_price +
get_price_quote_dollars.Irrigation_W_contract_price >
<CFSET ADDITIONAL = get_price_quote_dollars.blank1_contract_price+
get_price_quote_dollars.blank2_contract_price+
get_price_quote_dollars.blank3_contract_price+
get_price_quote_dollars.Addtl_Mowing_contract_price+
get_price_quote_dollars.blank1_contract_price+
get_price_quote_dollars.blank2_contract_price+
get_price_quote_dollars.blank3_contract_price+
get_price_quote_dollars.Bush_Hog_contract_price+
get_price_quote_dollars.Day_Porter_contract_price+
get_price_quote_dollars.Lot_Sweeping_contract_price+
get_price_quote_dollars.Natural_Area_contract_price+
get_price_quote_dollars.Playground_mulch_contract_price+
get_price_quote_dollars.Trail_Maint_contract_price+
get_price_quote_dollars.Trash_Receptacle_contract_price+
get_price_quote_dollars.Trim_Hillside_contract_price+
get_price_quote_dollars.Pond_maint_contract_price
>

<!--- <cfdump var="#SEASONAL#"> --->

<CFSET SEASONAL_TIMES = get_price_quote_info.bed_edge_times +   get_price_quote_info.blowing_times +get_price_quote_info.hard_edge_times	 + get_price_quote_info.push_mow_times 	 + get_price_quote_info.ride_mow_times +get_price_quote_info.spraying_times	 + get_price_quote_info.trash_s_times +  get_price_quote_info.trim_o_times	 +   get_price_quote_info.trim_s_times	 +  get_price_quote_info.walk_behind_times +   get_price_quote_info.weeding_times+get_price_quote_info.traveltime_times>
<CFSET OFFSEASON_TIMES = get_price_quote_info.trash_o_times +   get_price_quote_info.leafrem_times +get_price_quote_info.cleanup_times>
<CFSET TURFCARE_TIMES = get_price_quote_info.turf_aer_h_times+get_price_quote_info.turf_aer_t_times+get_price_quote_info.turf_fert_times+get_price_quote_info.Turf_fungicide_times+get_price_quote_info.Turf_insecticide_times+get_price_quote_info.turf_lime_times+               get_price_quote_info.Turf_nutsedge_times+get_price_quote_info.turf_post_times+get_price_quote_info.turf_preg_times+get_price_quote_info.turf_prel_times+get_price_quote_info.turf_seed_times>
<CFSET TREESHRUB_TIMES = get_price_quote_info.pruning_s_times +get_price_quote_info.pruning_tp_times +get_price_quote_info.TS_Fert_times +get_price_quote_info.TS_hort_oil_times +get_price_quote_info.TS_Insect_times >
<CFSET MULCH_TIMES =  get_price_quote_info.Mulch_edging_times +get_price_quote_info.Mulch_f_dyed_times+get_price_quote_info.Mulch_F_Reg_times 
+get_price_quote_info.Mulch_pre_times +get_price_quote_info.Mulch_s_dyed_times +get_price_quote_info.Mulch_S_Reg_times +get_price_quote_info.Pine_Tags_times >
<CFSET FLOWERS_TIMES =  get_price_quote_info.Annuals_S_times + get_price_quote_info.Annuals_F_times  >
<CFSET IRRIGATION_TIMES = get_price_quote_info.Irrigation_BFI_times +
get_price_quote_info.Irrigation_I_times +
get_price_quote_info.Irrigation_SU_times +
get_price_quote_info.Irrigation_TM_times +
get_price_quote_info.Irrigation_W_times >
<CFSET ADDITIONAL_TIMES = get_price_quote_info.blank1_times+
get_price_quote_info.blank2_times+
get_price_quote_info.blank3_times+
get_price_quote_info.Addtl_Mowing_times+
get_price_quote_info.blank1_times+
get_price_quote_info.blank2_times+
get_price_quote_info.blank3_times+
get_price_quote_info.Bush_Hog_times+
get_price_quote_info.Day_Porter_times+
get_price_quote_info.Lot_Sweeping_times+
get_price_quote_info.Natural_Area_times+
get_price_quote_info.Playground_mulch_times+
get_price_quote_info.Trail_Maint_times+
get_price_quote_info.Trash_Receptacle_times+
get_price_quote_info.Trim_Hillside_times+
get_price_quote_info.Pond_maint_times
>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#get_quote_info.opportunity_name#</cfoutput>MAINTENANCE SERVICES SUMMARY</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"  media="all">
<link rel="stylesheet" href="css/styles-summary.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style type="text/css">
.dstable_l5 {
	padding: 4px 10px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold 14px Arial, Helvetica, sans-serif;
}
H3 {
	text-decoration:underline
	}
 H4 {
	text-decoration:underline;
	font: bold 14px Helvetica, sans-serif;
	}
</style>
</head>
<body><table width="95%" border="0">
  <tbody>
    <tr>
      <td  align="right"> <cfoutput>#DateFormat(get_price_quote_dollars.date_updated, "medium")#</cfoutput></td>
    </tr>
  </tbody>
</table>

<div id="outerfull">
<cfif  get_quote_info.q_branch EQ 'Chesterfield'>
  <CFSET street_address = '11551 Deerhill Lane'>
  <CFSET city_state_zip= 'Midlothian, VA 23112'>
  <CFSET Phone= '804-598-2725'>
  <CFSET Fax= '804-639-1742'>
  <cfelseif get_quote_info.q_branch EQ 'Richmond'>
  <CFSET street_address = '11008 Washington Hwy'>
  <CFSET city_state_zip= 'Glen Allen, VA 23059'>
  <CFSET Phone= '804-550-3500'>
  <CFSET Fax= '804-550-9610'>
  <cfelseif get_quote_info.q_branch EQ 'Charlottesville'>
  <CFSET street_address = '395 Reas Ford Road, Suite 180'>
  <CFSET city_state_zip= 'Earlysville, VA 22936'>
  <CFSET Phone= '434-973-0358'>
  <CFSET Fax= '434-973-2577'>
  <cfelseif get_quote_info.q_branch EQ 'Portsmouth'>
  <CFSET street_address = '3127 Ballard Ave.'>
  <CFSET city_state_zip= 'Portsmouth, VA 23701'>
  <CFSET Phone= '757-488-8600'>
  <CFSET Fax= '757-488-9310'>
  <cfelseif get_quote_info.q_branch EQ 'Portstmouth'>
  <CFSET street_address = '3127 Ballard Ave.'>
  <CFSET city_state_zip= 'Portsmouth, VA 23701'>
  <CFSET Phone= '757-488-8600'>
  <CFSET Fax= '757-488-9310'>
  <cfelseif get_quote_info.q_branch EQ 'Newport News'>
  <CFSET street_address = '5 Elmhurst St'>
  <CFSET city_state_zip= 'Newport News, VA 23603'>
  <CFSET Phone= '757-820-3781'>
  <CFSET Fax= '757-820-3784'>
  <cfelseif get_quote_info.q_branch EQ 'Williamsburg'>
  <CFSET street_address = ''>
  <CFSET city_state_zip= ''>
  <CFSET Phone= ''>
  <CFSET Fax= ''>
  <cfelseif get_quote_info.q_branch EQ ''>
  <CFSET street_address = '-'>
  <CFSET city_state_zip= '-'>
  <CFSET Phone= '-'>
  <CFSET Fax= '-'>
</cfif>
<!--centre content goes here -->
<div class="container-fluid">
  <div class="contractTerms">
    <div class="row">
      <div align="center"><img src="images/logo_2016.png"  /></div>
      <!---<div class="col col-md-4">James River Grounds Management<br />
                  <cfoutput> #street_address#<br />
                    #city_state_zip# <br />
             Phone:&nbsp;&nbsp;#Phone#    Fax:&nbsp;&nbsp;#Fax#</cfoutput></div>
  <div class="col col-md-4">Date:&nbsp;&nbsp;<cfoutput>#todaydate#</cfoutput><br />
                Estimate by:&nbsp;&nbsp;<cfif get_quote_info.user_id NEQ ""><cfoutput>#get_estimator.employee_name#</cfoutput></cfif></div>
</div>--->
      
      <div class="row">
        <div class="col-md-12">
          <div align="center"><strong><em>ATTACHMENT A</em></strong><br />
            <h1>MAINTENANCE SERVICES SUMMARY</h1>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td align="justify"><cfoutput  query="get_quote_info"> JAMES RIVER GROUNDS MANAGEMENT, INC. SHALL PROVIDE THE FOLLOWING SERVICES AT <strong>#opportunity_name#</strong>, LOCATED AT <strong>#q_address1#</strong>, IN <strong>#q_city#, #q_address_state#</strong>. PLEASE REFER TO THE 'DEFINITION OF SERVICES' (Attachment B) FOR MORE DETAILED SERVICE SPECIFICATIONS. </cfoutput></td>
            </tr>
          </table>
          <cfoutput>
            <table width="80%" border="0" cellpadding="0" cellspacing="0" align="center">
            <cfif SEASONAL_TIMES GT 0>
             <tr>
                <td colspan="3" ><h3>I. SEASONAL MAINTENANCE</h3></td>
                <td   align="right"><!---<span class="priceh">$#NumberFormat(SEASONAL,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.push_mow_times GT 0>
                <tr>
                  <td  width="25">&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.push_mow_times#</span></td>
                  <td> Push Mowing</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.walk_behind_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.walk_behind_times#</span></td>
                  <td> Walk Behind Mowing</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.ride_mow_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.ride_mow_times#</span></td>
                  <td>Ride On Mowing</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.hard_edge_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.hard_edge_times#</span></td>
                  <td>Hard Edging (curbs/sidewalks)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.bed_edge_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.bed_edge_times#</span></td>
                  <td>Bed Stick Edging</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.trim_o_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.trim_o_times#</span></td>
                  <td>Obstacle Trimming</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.trim_s_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.trim_s_times#</span></td>
                  <td>Slope Trimming</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.spraying_times  GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.spraying_times#</span></td>
                  <td>Herbicide Spraying (beds/pavement)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.weeding_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.weeding_times#</span></td>
                  <td>Hand Weeding (beds)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.blowing_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.blowing_times#</span></td>
                  <td>Blowing</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.trash_s_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.trash_s_times#</span></td>
                  <td>Seasonal Trash&nbsp;/ Debris Pick-up</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
                 </cfif>
              
              <!---<cfif  get_price_quote_info.traveltime_times GT 0>
              <tr>
                <td>&nbsp;</td>
                <td><span class="price">#get_price_quote_info.traveltime_times#</span></td><td>Travel Time</td><td>&nbsp;</td>
              </tr>
              </cfif>--->
              
              <cfif  OFFSEASON_TIMES GT 0>
              <tr>
                <td colspan="3" ><h3>II. OFF SEASON SERVICES</h3></td>
                <td align="right"><!---<span class="priceh">$#NumberFormat(OFFSEASON,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.trash_o_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.trash_o_times#</span></td>
                  <td>Off Season Trash&nbsp;/ Debris Pick-up<br /></td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.leafrem_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.leafrem_times#</span></td>
                  <td> Leaf Removal</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.cleanup_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.cleanup_times#</span></td>
                  <td> Cleanup</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
               </cfif>
                <cfif  TURFCARE_TIMES GT 0>
              <tr>
                <td colspan="3"><h3> III. TURF CARE PROGRAM</h3></td>
                <td   align="right"><!---<span class="priceh">$#NumberFormat(TURFCARE,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.turf_preg_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_preg_times#</span></td>
                  <td>Granular Turf Pre-em / Fert Combo</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_prel_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_prel_times#</span></td>
                  <td>Liquid Turf Pre / Post-em Combo</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_post_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_post_times#</span></td>
                  <td>Turf Post-emergent</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_fert_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_fert_times#</span></td>
                  <td>Turf Fertilization</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_lime_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_lime_times#</span></td>
                  <td>Lime Application</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_aer_h_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_aer_h_times#</span></td>
                  <td>Aeration (hand work)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_aer_t_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_aer_t_times#</span></td>
                  <td>Aeration (tractor work)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.turf_seed_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.turf_seed_times#</span></td>
                  <td>Overseeding</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Turf_nutsedge_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Turf_nutsedge_times#</span></td>
                  <td>Turf Nutsedge Application</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Turf_fungicide_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Turf_fungicide_times#</span></td>
                  <td>Turf Fungicide Application</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Turf_insecticide_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Turf_insecticide_times#</span></td>
                  <td>Turf Insecticide Application</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
               </cfif>
              
               <cfif  TREESHRUB_TIMES GT 0>
              <tr>
                <td colspan="3" ><h3>IV. TREE AND SHRUB CARE </h3></td>
                <td  align="right"><!---<span class="priceh">$#NumberFormat(TREESHRUB ,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.pruning_tp_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.pruning_tp_times#</span></td>
                  <td>Tree &amp; Perennial Pruning</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.pruning_s_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.pruning_s_times#</span></td>
                  <td>Shrub Pruning</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.TS_Fert_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.TS_Fert_times#</span></td>
                  <td>Plant Fertilization</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.TS_Insect_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.TS_Insect_times#</span></td>
                  <td>Plant Insecticide Application</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.TS_hort_oil_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.TS_hort_oil_times#</span></td>
                  <td>Horticultural Oil</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              </cfif>
              
               <cfif  MULCH_TIMES GT 0>
              <tr>
                <td colspan="3" ><h3>V. MULCH </h3></td>
                <td align="right"><!---<span class="priceh">$#NumberFormat(MULCH,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.Mulch_pre_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_pre_times#</span></td>
                  <td>Bed Pre-emergent Weed Control</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Mulch_edging_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_edging_times#</span></td>
                  <td>Renovational Bed Edging</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Mulch_s_dyed_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_s_dyed_times#</span></td>
                  <td>Spring Mulch (dyed)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Mulch_f_dyed_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_f_dyed_times#</span></td>
                  <td>Fall Mulch (dyed)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Mulch_S_Reg_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_S_Reg_times#</span></td>
                  <td>Spring Mulch (non dyed)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Mulch_F_Reg_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Mulch_F_Reg_times#</span></td>
                  <td>Fall Mulch (non dyed)</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Pine_Tags_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Pine_Tags_times#</span></td>
                  <td>Pine Tags</td>
                  <td>&nbsp;</td>
                </tr>
               </cfif>
                </cfif>
              
               <cfif  FLOWERS_TIMES GT 0>
              <tr>
                <td colspan="3" ><h3>VI. FLOWERS</h3></td>
                <td  align="right"><!---<span class="priceh">$#NumberFormat(FLOWERS,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.Annuals_S_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Annuals_S_times#</span></td>
                  <td> Spring Annuals - #get_price_quote_info.Annuals_S_qty#<!---- 400---><br /></td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Annuals_F_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Annuals_F_times#</span></td>
                  <td>Fall Annuals - #get_price_quote_info.Annuals_F_qty#<!--- - 400---></td>
                  <td>&nbsp;</td>
                </tr>
            </cfif>
            </cfif>
              
               <cfif IRRIGATION_TIMES GT 0>
              <tr>
                <td colspan="3" ><h3>VII. IRRIGATION SERVICES</h3></td>
                <td  align="right"><!---<span class="priceh">$#NumberFormat(IRRIGATION,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.Irrigation_SU_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Irrigation_SU_times#</span></td>
                  <td>Irrigation System Start-up</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Irrigation_W_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Irrigation_W_times#</span></td>
                  <td>Irrigation System Winterization</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Irrigation_I_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Irrigation_I_times#</span></td>
                  <td>Irrigation System Inspections</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Irrigation_TM_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Irrigation_TM_times#</span></td>
                  <td>Irrigation Time &amp; Material</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Irrigation_BFI_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Irrigation_BFI_times#</span></td>
                  <td>Backflow Certification</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              </cfif>
              
               <cfif ADDITIONAL_TIMES GT 0>
              <tr>
                <td colspan="3"><h3>VIII. ADDITIONAL SERVICES</h3></td>
                <td   align="right"><!---<span class="priceh">$#NumberFormat(ADDITIONAL,"999,999.99")#</span>---></td>
              </tr>
              <cfif  get_price_quote_info.Addtl_Mowing_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Addtl_Mowing_times#</span></td>
                  <td>Additional Mowing</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Pond_maint_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Pond_maint_times#</span></td>
                  <td>Pond Maintenance</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Trim_Hillside_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Trim_Hillside_times#</span></td>
                  <td>Hillside Trimming</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Day_Porter_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Day_Porter_times#</span></td>
                  <td>Day Porter</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Bush_Hog_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Bush_Hog_times#</span></td>
                  <td>Bush Hog</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Lot_Sweeping_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Lot_Sweeping_times#</span></td>
                  <td>Lot Sweeping</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Trail_Maint_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Trail_Maint_times#</span></td>
                  <td>Trail Maintenance</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Natural_Area_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Natural_Area_times#</span></td>
                  <td>Natural Area</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Trash_Receptacle_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Trash_Receptacle_times#</span></td>
                  <td>Trash Receptacle/Dog Station</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.Playground_mulch_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.Playground_mulch_times#</span></td>
                  <td>Playground Mulch</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.blank1_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.blank1_times#</span></td>
                  <td align="left">#get_price_quote_info.blank1_service#</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.blank2_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.blank2_times#</span></td>
                  <td align="left" >#get_price_quote_info.blank2_service#</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
              <cfif  get_price_quote_info.blank3_times GT 0>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="price">#get_price_quote_info.blank3_times#</span></td>
                  <td align="left" >#get_price_quote_info.blank3_service#</td>
                  <td>&nbsp;</td>
                </tr>
              </cfif>
                 </cfif>
              
              <!---  <tr>
                  <td  colspan="3">&nbsp;</td>
                   <td align="right" ><span class="priceh">$#NumberFormat(monthly_price,"999,999.99")# x #get_price_quote_dollars.contract_installments#
Months = $#NumberFormat(get_price_quote_dollars.total_contract_price,"999,999.99")#</span></td>
                </tr>--->
            </table>
          </cfoutput><br />

   <cfquery name="get_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  opportunity_id_original=#url.ID# AND note_type = 4
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
  
 <!--- <cfif get_quote_notes.recordcount GT 0>
    <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
      <tbody>
        <tr>
          <td> 
              <h4>Notes</h4>
           </td>
        </tr>
        <cfoutput query="get_quote_notes">
          <tr>
            <td>#note_body#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
  </cfif>--->
  
   <cfquery name="get_all_notes_4"   datasource="jrgm">
    SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
FROM         quote_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 4
</cfquery> 
<CFIF get_all_notes_4.recordcount GT 0>
    <table width="95%" border="0" align="center" >
      <tbody>
        <tr      bgcolor="#EDF3F8">
          <td height="40" colspan="3"><strong>Notes</strong></td>
        </tr>
       
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
          
      
        <td></tbody>
    </table>
    </cfif>
          <br />
          <br />
        </div>
      </div>
    </div>
  </div>
  <!-- to clear footer --> 
</div>
</body>
</html>
