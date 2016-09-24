
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/2.6.0/math.min.js"></script>
  <script>
    function recalculate_totals()
    {
        var current_total;
        var avg_total;
        var avg_count;
        var avg_calculated;
        var value_raw;
        var value_formatted;
        var value_rounded;
        var value_perc;
        var contract_subtotal;
        var grounds_maintenance_contract_total;
        var irrigation_contract_total;

        <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
            <cfset current_column = quote_column_headers[i]>
            <cfif current_column.column_totalable NEQ 0>
            <cfoutput>
                <cfif current_column.column_totalable EQ 1>
                    current_total = 0;
                    $('.column#current_column.ID#').each(function(){
                        var single_value = 1*$(this).val();
                        //console.log(getValueRounded(single_value, #current_column.column_precision#));
                        current_total += 1*getValueRounded(single_value, #current_column.column_precision#);
                        //console.log(current_total);
                    });

                    value_raw = current_total;
                    if (!value_raw)
                    {
                        value_formatted = '&nbsp;';
                    }
                    else
                    {
                        value_rounded = (Math.round(value_raw * Math.pow(10, #current_column.column_precision#))/Math.pow(10, #current_column.column_precision#)).toFixed(#current_column.column_precision#);
                        <cfif current_column.column_displayformat NEQ ''>
                            value_formatted = '#current_column.column_displayformat#'.replace('__', formatNumber(value_rounded));
                        <cfelse>
                            value_formatted = formatNumber(value_rounded);
                        </cfif>
                    }
                    $('.total#current_column.ID#').html(value_formatted);
                    <cfif current_column.ID EQ 20>
                        contract_subtotal = value_raw;
                    </cfif>
                </cfif>
                <!---
                <cfif current_column.column_totalable EQ 2>
                    avg_total = 0;
                    avg_count = 0;
                    $('.column#current_column.ID#').each(function(){
                        avg_total += 1*$(this).val();
                        avg_count++;
                        //console.log(avg_total);
                    });

                    avg_calculated = 0;
                    if (avg_count > 0)
                        avg_calculated = avg_total/avg_count;

                    value_raw = avg_calculated;
                    if (!value_raw)
                    {
                        value_formatted = '&nbsp;';
                    }
                    else
                    {
                        value_rounded = (Math.round(value_raw * Math.pow(10, #current_column.column_precision#))/Math.pow(10, #current_column.column_precision#)).toFixed(#current_column.column_precision#);
                        <cfif current_column.column_displayformat NEQ ''>
                            value_formatted = '#current_column.column_displayformat#'.replace('__', formatNumber(value_rounded));
                        <cfelse>
                            value_formatted = formatNumber(value_rounded);
                        </cfif>
                    }
                    $('.avg#current_column.ID#').html(value_formatted);
                </cfif>
                --->
            </cfoutput>
            </cfif>
        </cfloop>
        value_raw = 1*$('#contract_adjustment').val();
        $('#contract_adjustment_formatted').html(formatDollars(value_raw));

        value_raw = 1*$('#discount_adjustment').val();
        $('#discount_adjustment_formatted').html(formatDollars(value_raw));

        value_raw = contract_subtotal + 1*$('#contract_adjustment').val() + 1*$('#discount_adjustment').val();
        $('.adjusted_contract_price_formatted').html(formatDollars(value_raw));
        $('#adjusted_contract_price').val(value_raw);
        var adjusted_contract_price = value_raw;

        var installments = 1*$('#contract_installments').val();
        if (!installments || isNaN(installments))
        {
            $('#monthly_contract_price_formatted').html('[ Specify Installments first ]');
        }
        else
        {
            $('#monthly_contract_price_formatted').html(formatDollars(value_raw / installments));
        }

        var irrigation_contract_total = 0;
        $('.totaltype_irrigation').each(function(){
            irrigation_contract_total += 1*$(this).val();
        });
        $('#irrigation_contract_formatted').html(formatDollars(irrigation_contract_total));
        $('#Irrigation_Contract').val(irrigation_contract_total);

        var grounds_maintenance_contract_total = adjusted_contract_price - irrigation_contract_total;
        $('#grounds_maintenance_contract_formatted').html(formatDollars(grounds_maintenance_contract_total));
        $('#Grounds_Maintenance_Contract').val(grounds_maintenance_contract_total);

        var seasonal_hours_total = 0;
        $('.totaltype_seasonal').each(function(){
            var single_value = 1*unformatValueByIdentity('#'+$(this).attr('id'));
            //console.log(getValueRounded(single_value, 1));
            seasonal_hours_total += 1*getValueRounded(single_value, 1);
        });
        $('#seasonal_hours_formatted').html(getValueRounded(seasonal_hours_total, 1));

        $('#total_labor_formatted').html(formatDollars(unformatValueByIdentity('.total14')));

        $('#total_materials_formatted').html(formatDollars(unformatValueByIdentity('.total15')));

        value_raw = unformatValueByIdentity('.total16') - (unformatValueByIdentity('#total_labor_formatted') + unformatValueByIdentity('#total_materials_formatted'));
        $('#corp_oh_formatted').html(formatDollars(value_raw));

        value_raw = unformatValueByIdentity('#total_labor_formatted') + unformatValueByIdentity('#total_materials_formatted') + unformatValueByIdentity('#corp_oh_formatted');
        $('#total_direct_costs_formatted').html(formatDollars(value_raw));

        value_raw = $('#adjusted_contract_price').val()*1 - unformatValueByIdentity('#total_direct_costs_formatted');
        $('#gross_profit_formatted').html(formatDollars(value_raw));

        value_raw = unformatValueByIdentity('.total20') * .4;
        $('#margin_formatted').html(formatDollars(value_raw));

        value_raw = unformatValueByIdentity('#gross_profit_formatted') - unformatValueByIdentity('#margin_formatted');
        $('#operating_profit_formatted').html(formatDollars(value_raw));

        value_raw = unformatValueByIdentity('#adjusted_contract_price') - unformatValueByIdentity('#total_direct_costs_formatted');
        value_perc = Math.floor(value_raw / unformatValueByIdentity('#adjusted_contract_price') * 10000)/100;
        $('#projected_operating_profit_formatted').html(formatDollars(value_raw)+' ('+value_perc+'%)');

        value_raw = unformatValueByIdentity('#operating_profit_formatted') / unformatValueByIdentity('.total20') * 100;
        if (isNaN(value_raw)) value_raw = 0;
        $('#net_cash_flow_percentage_formatted').html(formatPercentage(value_raw));

        $('#total_contract_price').val(unformatValueByIdentity('.total20'));

        $('.total17').html(formatNumber(unformatValueByIdentity('.total17')/2));

        apply_turf_sq_footage();
        apply_bed_sq_footage();
    }

    function formatDollars(value_raw) {
        var value_rounded = getValueRounded(value_raw);
        if (value_rounded == 0) return '$0.00';
        return '$'+formatNumber(value_rounded);
    }

    function formatPercentage(value_raw) {
        var value_rounded = getValueRounded(value_raw);
        return formatNumber(value_rounded)+'%';
    }

    function getValueRounded(value_raw, precision)
    {
        if (!precision) precision = 2;
        var value = (Math.round(value_raw * Math.pow(10, precision))/Math.pow(10, precision)).toFixed(precision);
        if (isNaN(value)) return 0.00;
        return value;
    }

    function unformatValueByIdentity(identity) {
        var html = $(identity).html();
        if (!html) html = $(identity).val();
        if (!html) return '';
        while (html.indexOf('$') != -1) html = html.replace('$' ,'');
        while (html.indexOf(',') != -1) html = html.replace(',' ,'');
        html = 1*html;
        if (isNaN(html)) html = 0;
        return html;
    }

    function formatNumber (num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
    }

    function recalculate()
    {
    <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
        <cfset quote_row_index = row_order_array[wrapi]>
        recalculate_row<cfoutput>#quote_row_index#</cfoutput>();
    </cfloop>
        recalculate_totals();
    }

    <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
        <cfset quote_row_index = row_order_array[wrapi]>
    function recalculate_row<cfoutput>#quote_row_index#</cfoutput>()
    {
        var equation;
        var regexp = /\[(\d+)\]/g;
        var matches;
        var index;
        var rowcol_element_ids;
        var column_ID;
        var column_ID_raw;
        var value_raw;
        var value_rounded;
        var value_formatted;
        var quote_row_index = <cfoutput>#quote_row_index#</cfoutput>;

        rowcol_element_ids = {};
        <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
            <cfset current_row = quote_rows[quote_row_index][i]>
            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
            <cfif current_row.quote_services_field NEQ ''>
                rowcol_element_ids['[<cfoutput>#current_column.ID#</cfoutput>]'] = '<cfoutput>#current_row.quote_services_field#</cfoutput>';
            <cfelse>
                rowcol_element_ids['[<cfoutput>#current_column.ID#</cfoutput>]'] = '<cfoutput>row#current_row.ID#_numeric</cfoutput>';
            </cfif>
        </cfloop>
        <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
            <cfset current_row = quote_rows[quote_row_index][i]>
            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
            <cfif current_column.column_formula NEQ '' OR current_row.row_formula NEQ ''>
                <cfif current_row.row_formula NEQ ''>
                    equation = '<cfoutput>#current_row.row_formula#</cfoutput>';
                <cfelse>
                    equation = '<cfoutput>#current_column.column_formula#</cfoutput>';
                </cfif>
                //console.log(equation);
                matches = equation.match(regexp);
                for(var index in matches)
                {
                    column_ID = matches[index];
                    //console.log(column_ID);
                    var extracted_value;
                    if (document.getElementById(rowcol_element_ids[column_ID]))
                    {
                        //console.log(rowcol_element_ids[column_ID]);
                        extracted_value = 1*document.getElementById(rowcol_element_ids[column_ID]).value;
                    }
                    else
                    {
                        column_ID_raw = column_ID.replace('[', '').replace(']', '');
                        //console.log('row'+column_ID_raw+'_numeric');
                        extracted_value = 1*document.getElementById('row'+column_ID_raw+'_numeric').value;
                    }
                    equation = equation.replace(matches[index], extracted_value);
                }
                //console.log(equation);
                value_raw = math.eval(equation);
                if (isNaN(value_raw) || !isFinite(value_raw)) value_raw = 0;
                <cfif current_column.ID EQ 20>
                    if (value_raw > 0) value_raw = Math.floor(value_raw-.5)+1;
                    if (value_raw < 0) value_raw = 0;
                </cfif>
                if (!value_raw)
                {
                    value_formatted = '&nbsp;';
                }
                else
                {
                    value_rounded = (Math.round(value_raw * Math.pow(10, <cfoutput>#current_column.column_precision#</cfoutput>))/Math.pow(10, <cfoutput>#current_column.column_precision#</cfoutput>)).toFixed(<cfoutput>#current_column.column_precision#</cfoutput>);
                    <cfif current_column.column_displayformat NEQ ''>
                        value_formatted = '<cfoutput>#current_column.column_displayformat#</cfoutput>'.replace('__', formatNumber(value_rounded));
                    <cfelse>
                        value_formatted = formatNumber(value_rounded);
                    </cfif>
                }

                <cfif current_row.quote_services_field NEQ ''>
                    <cfif current_column.ID EQ 20>
                        $('#row<cfoutput>#current_row.ID#</cfoutput>').html(value_formatted);
                        $('.<cfoutput>#current_row.quote_services_field#</cfoutput>').val(value_raw?value_rounded:value_raw);
                    <cfelse>
                        $('.<cfoutput>#current_row.quote_services_field#</cfoutput>').val(value_raw?value_rounded:value_raw);
                    </cfif>
                <cfelse>
                    document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>_numeric').value = value_raw;
                    //console.log(value_raw);
                    //console.log(document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>_numeric').value);

                    if (document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>'))
                    {
                        document.getElementById('row<cfoutput>#current_row.ID#</cfoutput>').innerHTML = value_formatted;
                    }
                </cfif>
            </cfif>
        </cfloop>
    }
    </cfloop>

    function apply_turf_sq_footage()
    {
        var current_val = 0;
        var field = ['turf_preg_qty', 'turf_prel_qty', 'turf_post_qty', 'turf_fert_qty', 'turf_lime_qty', 'turf_aer_h_qty', 'turf_aer_t_qty', 'turf_seed_qty'];

        for(var i=0; i<field.length; i++)
        {
            current_val = Math.max(current_val, $('#'+field[i]).val()*1);
        }
        $('#turf_sqft').val(current_val);
    }

    function apply_bed_sq_footage()
    {
        var current_val = 0;
        if ($('#Mulch_s_dyed_qty').val() || $('#Mulch_S_Reg_qty').val())
            current_val = Math.max($('#Mulch_s_dyed_qty').val()*1, $('#Mulch_S_Reg_qty').val()*1);
        else if ($('#Mulch_f_dyed_qty').val() || $('#Mulch_F_Reg_qty').val())
            current_val = Math.max($('#Mulch_f_dyed_qty').val()*1, $('#Mulch_F_Reg_qty').val()*1);
        $('#bed_sqft').val(current_val);
    }

    function apply_profit_margin(value) {
        value = 1*value;
        if (isNaN(value)) value = 0;
        if (!value) return;
        //if (value < 50) return;
        $('.column18').each(function(){
            if (!$(this).is('span') && $(this).attr('type') != 'hidden' && !$(this).prop('disabled'))
                $(this).val(value);
        });
        recalculate()
    }

    function apply_labor_rate(value) {
        value = 1*value;
        if (isNaN(value)) value = 0;
        $('.column6').each(function(){
            if (!$(this).is('span') && $(this).attr('type') != 'hidden' && !$(this).prop('disabled'))
                $(this).val(value);
        });
        recalculate()
    }

    function apply_corp_oh(value) {
        value = 1*value;
        if (isNaN(value)) value = 0;
        $('.column24').each(function(){
            if (!$(this).is('span') && $(this).attr('type') != 'hidden' && !$(this).prop('disabled'))
                $(this).val(value);
        });
        recalculate()
    }

    window.onload = function(){
        $( document ).ready(function() {
            if (typeof init_before == 'function')
                init_before();

            var initial_element;
            <cfset reapplyProfitMargin = 0>
            <cfloop collection=#current_quote_services_materials# item="field">
                <cfif field DOES NOT CONTAIN 'date'>
                    <!---cfif field CONTAINS '_gm' AND current_quote_services_materials[field] LT 40>
                        <cfset reapplyProfitMargin = 1>
                        <cfset current_quote_services_materials[field] = 40>
                    </cfif--->
                    <cfoutput>
                        initial_element = document.getElementById('#field#');
                        if (initial_element)
                        {
                            if ('#field#'.indexOf('_rate') != -1 || '#replace(current_quote_services_materials[field], "'", "\'", 'ALL')#'*1 > 0 || '#replace(current_quote_services_materials[field], "'", "\'", 'ALL')#'*1 < 0 || '#field#'.indexOf('blank') != -1)
                                initial_element.innerHTML = initial_element.value = '#replace(current_quote_services_materials[field], "'", "\'", 'ALL')#';
                        }
                    </cfoutput>
                </cfif>
            </cfloop>
            <cfif reapplyProfitMargin EQ 1>
                apply_profit_margin(<cfoutput>#get_quote_services.gross_margin#</cfoutput>);
            </cfif>

            recalculate();

            if (typeof init_after == 'function')
                init_after();
        });
    }
  </script>