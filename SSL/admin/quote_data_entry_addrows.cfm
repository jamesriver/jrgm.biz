<cfif IsDefined('url.row_order_start') AND IsDefined('url.row_order_end') AND IsDefined('url.headers_ID_start') AND IsDefined('url.headers_ID_end')>
    INSERT INTO quote_data_entry_row (quote_data_entry_headers_ID, row_order) VALUES
    <cfset count = 0>
    <cfloop from="#url.row_order_start#" to="#url.row_order_end#" index="i">
        <cfloop from="#url.headers_ID_start#" to="#url.headers_ID_end#" index="ii">
            <cfif ii NEQ 19 AND ii NEQ 12>
                <cfif count NEQ 0>
                    <cfoutput>, </cfoutput>
                </cfif>
                <cfoutput>
                    (#ii#, #i#)
                </cfoutput>
                <cfset count++>
            </cfif>
        </cfloop>
    </cfloop>
    ;<br />
</cfif>

<cfset arr = ArrayNew(1)>
<cfset ArrayAppend(arr, [1, "Push Mow", "push_mow", "7500", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [2, "Walk Behind", "walk_behind", "35000", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [3, "Ride Mow", "ride_mow", "55000", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [4, "Hard Edge", "hard_edge", "7500", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [5, "Bed Edge", "bed_edge", "7500", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [6, "Trim, O", "trim_o", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [7, "Trim, S", "trim_s", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [8, "Spraying", "spraying", "12000", "SF", "13.00", "Non-sel. Herbicide (oz)", "0.08"])>
<cfset ArrayAppend(arr, [9, "Weeding", "weeding", "7500", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [10, "Blowing", "blowing", "16000", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [11, "Trash, S", "trash_s", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [12, "Travel Time", "traveltime", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [13, "Trash, Off", "trash_o", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [14, "Leaf Rem", "leafrem", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [15, "Cleanup", "cleanup", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [16, "Turf Pre (G)", "turf_preg", "35000", "SF", "20.00", "Granular Turf Preemergent (lb)", "0.28"])>
<cfset ArrayAppend(arr, [17, "Turf Pre (L)", "turf_prel", "22000", "SF", "20.00", "Prodiamine Pre-emergent (oz)", "0.80"])>
<cfset ArrayAppend(arr, [18, "Turf Post", "turf_post", "22000", "SF", "20.00", "Selective Herbicide (oz)", "0.63"])>
<cfset ArrayAppend(arr, [19, "Turf Fert", "turf_fert", "35000", "SF", "20.00", "Starter Fertilizer (lb)", "0.34"])>
<cfset ArrayAppend(arr, [20, "Turf Lime", "turf_lime", "35000", "SF", "13.00", "High Calcium Lime (lb)", "0.22"])>
<cfset ArrayAppend(arr, [21, "Turf Aer (H)", "turf_aer_h", "5000", "SF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [22, "Turf Aer (T)", "turf_aer_t", "35000", "SF", "35.00", "", ""])>
<cfset ArrayAppend(arr, [23, "Turf Seed", "turf_seed", "25000", "SF", "13.00", "Fescue Seed (lb)", "1.05"])>
<cfset ArrayAppend(arr, [24, "Turf Nutsedge", "Turf_nutsedge", "22000", "SF", "22.00", "Dismiss (oz)", "2.65"])>
<cfset ArrayAppend(arr, [25, "Turf Fungicide", "Turf_fungicide", "22000", "SF", "22.00", "Armada (oz)", "2.25"])>
<cfset ArrayAppend(arr, [26, "Turf Insecticide", "Turf_insecticide", "22000", "SF", "22.00", "Bifenthrin (oz)", "0.40"])>
<cfset ArrayAppend(arr, [27, "Pruning, T/P", "pruning_tp", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [28, "Pruning, S", "pruning_s", "1", "HR", "13.00", "", ""])>
<cfset ArrayAppend(arr, [29, "T&S, Fert", "TS_Fert", "8000", "SF", "20.00", "Fertilizer Ornamental 14-14-14 (lb)", "0.55"])>
<cfset ArrayAppend(arr, [30, "T&S, Insect", "TS_Insect", "1", "HR", "20.00", "Bifenthrin Tree & Shrub Insecticide (oz)", "0.40"])>
<cfset ArrayAppend(arr, [31, "T&S, Hort Oil", "TS_hort_oil", "1", "HR", "20.00", "Hort/Dormant Oil (oz)", "0.09"])>
<cfset ArrayAppend(arr, [32, "Mulch, Pre", "Mulch_pre", "8000", "SF", "13.00", "Bed Pre-emergent Granular (lb)", "0.28"])>
<cfset ArrayAppend(arr, [33, "Mulch, Edging", "Mulch_edging", "250", "LF", "13.00", "", ""])>
<cfset ArrayAppend(arr, [34, "Mulch, S (dyed)", "Mulch_s_dyed", "130", "SF", "13.00", "Dyed Mulch (yds)", "60.00"])>
<cfset ArrayAppend(arr, [35, "Mulch, F (dyed)", "Mulch_f_dyed", "130", "SF", "13.00", "Dyed Mulch (yds)", "60.00"])>
<cfset ArrayAppend(arr, [36, "Mulch, S (reg)", "Mulch_S_Reg", "130", "SF", "13.00", "Non-Dyed Mulch (yds)", "60.00"])>
<cfset ArrayAppend(arr, [37, "Mulch, F (reg)", "Mulch_F_Reg", "130", "SF", "13.00", "Non-Dyed Mulch (yds)", "60.00"])>
<cfset ArrayAppend(arr, [38, "Playground Mulch", "Playground_mulch", "130", "SF", "13.00", "Dyed Mulch (yds)", "60.00"])>
<cfset ArrayAppend(arr, [39, "Pine Tags", "Pine_Tags", "600", "SF", "13.00", "Pine Tags (bales)", "6.00"])>
<cfset ArrayAppend(arr, [40, "Annuals, S", "Annuals_S", "25", "Pots", "13.00", 'Flowers (6" pots)', "4.50"])>
<cfset ArrayAppend(arr, [41, "Annuals, F", "Annuals_F", "25", "Pots", "13.00", 'Flowers (6" pots)', "4.50"])>
<cfset ArrayAppend(arr, [42, "Irrigation, SU", "Irrigation_SU", "1", "HR", "25.00", '', ""])>
<cfset ArrayAppend(arr, [43, "Irrigation, W", "Irrigation_W", "1", "HR", "25.00", '', ""])>
<cfset ArrayAppend(arr, [44, "Irrigation, I", "Irrigation_I", "1", "HR", "25.00", '', ""])>
<cfset ArrayAppend(arr, [45, "Irrigation, TM", "Irrigation_TM", "1", "HR", "25.00", '', ""])>
<cfset ArrayAppend(arr, [46, "Irrigation, BFI", "Irrigation_BFI", "1", "HR", "25.00", '', ""])>
<cfset ArrayAppend(arr, [47, "Pond Maint.", "Pond_maint", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [48, "Trim, Hillside", "Trim_Hillside", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [49, "Addt'l. Mowing", "Addtl_Mowing", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [50, "Day Porter", "Day_Porter", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [51, "Bush Hog", "Bush_Hog", "44000", "SF", "75.00", '', ""])>
<cfset ArrayAppend(arr, [52, "Trail Maint.", "Trail_Maint", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [53, "Natural Area", "Natural_Area", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [54, "Trash Rec./Dog Station", "Trash_Receptacle", "1", "HR", "13.00", '', ""])>
<cfset ArrayAppend(arr, [55, "Lot Sweeping", "Lot_Sweeping", "1", "HR", "1.00", '', ""])>
<cfloop from="1" to="#arrayLen(arr)#" index="i">
    <cfset obj = arr[i]>
    <cfoutput>
        UPDATE quote_data_entry_row SET row_defaultvalue='#obj[2]#' WHERE quote_data_entry_headers_ID=1 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_qty' WHERE quote_data_entry_headers_ID=2 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_rate', row_defaultvalue='#obj[4]#' WHERE quote_data_entry_headers_ID=3 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET row_defaultvalue='#obj[5]#' WHERE quote_data_entry_headers_ID=4 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_cost', row_defaultvalue='#obj[6]#' WHERE quote_data_entry_headers_ID=6 AND row_order=#obj[1]#;<br />
        <cfif obj[7] NEQ ''>
        UPDATE quote_data_entry_row SET row_defaultvalue='#obj[7]#', row_active=1 WHERE quote_data_entry_headers_ID=8 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_materials_qty', row_active=1 WHERE quote_data_entry_headers_ID=9 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_materials_rate', row_defaultvalue='#obj[8]#', row_active=1 WHERE quote_data_entry_headers_ID=10 AND row_order=#obj[1]#;<br />
        </cfif>
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_times' WHERE quote_data_entry_headers_ID=13 AND row_order=#obj[1]#;<br />
        UPDATE quote_data_entry_row SET quote_services_field='#obj[3]#_margin', row_defaultvalue='57' WHERE quote_data_entry_headers_ID=18 AND row_order=#obj[1]#;<br />
    </cfoutput>
</cfloop>
<cfoutput>
    UPDATE quote_data_entry_row
    SET row_active=0
    WHERE row_order BETWEEN #url.row_order_start# AND #url.row_order_end#
     AND quote_data_entry_headers_ID BETWEEN 8 AND 11
     AND row_defaultvalue IS NULL;<br />
     UPDATE quote_data_entry_row
     SET row_totaltype='irrigation'
     WHERE row_order BETWEEN 42 AND 46;<br />

    </cfoutput>