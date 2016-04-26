<cfif !IsDefined('url.ID')>
    FAILED - no ID detected
    <cfabort>
</cfif>
<cfif url.ID EQ ''>
    FAILED - no ID detected
    <cfabort>
</cfif>

<cfquery name="get_quote_start" datasource="jrgm">
SELECT ID, opportunity_name
FROM quote_start
where opportunity_id  =#url.id#
</cfquery>
<cfif get_quote_start.recordcount EQ 0>
    FAILED - invalid ID #url.id#
    <cfabort>
</cfif>

<cfinclude template="../quoting-new/include_cffunctions.cfm">

<!--- INITIALIZE SAVED DIMENSION CALCULATIONS --->
<cfquery name="get_quote_services_dimensions" datasource="jrgm">
SELECT *
FROM quote_services_dimensions
where quote_start_id=#get_quote_start.ID#
</cfquery>
<cfif get_quote_services_dimensions.recordcount GT 0>
    <cfset quote_service_dimensions_raw = QueryToStruct(get_quote_services_dimensions)>
    <cfset quote_service_dimensions = quote_service_dimensions_raw[1]>
</cfif>

<!--- INITIALIZE DIMENSIONS --->
<cfset dimensions = ArrayNew(1)>
<cfset ArrayAppend(dimensions, ['<font color="red">Push Mow</font>', 'push_mow', 'area', 'SF', 0])> <!--- [label, SQL field (to read from quote_dimensions legacy data), type, unit, decimal precision] --->
<cfset ArrayAppend(dimensions, ['<font color="blue">Walk Behind</font>', 'walk_behind', 'area', 'SF', 0])>
<cfset ArrayAppend(dimensions, ['<font color="green">Ride Mow</font>', 'ride_mow', 'area', 'SF', 0])>
<cfset ArrayAppend(dimensions, ['<font color="purple">Mulch</font>', 'mulch', 'area', 'SF', 1])>
<cfset ArrayAppend(dimensions, ['<font color="brown">Hard Edge</font>', 'hard_edge', 'count_area', 'LF'])>
<cfset ArrayAppend(dimensions, ['<font color="black">Bed Edge</font>', 'bed_edge', 'count_area', 'LF'])>
<cfset ArrayAppend(dimensions, ['<font color="gray">Winter Edge</font>', 'winter_edge', 'count_area', 'LF'])>
<cfset ArrayAppend(dimensions, ['<font color="orange">OT/Slope</font>', 'ot_slope', 'count_ot_slope', 'Min'])>
<cfset ArrayAppend(dimensions, ['<font color="##006400">Shrub Pruning</font>', 'shrub_pruning', 'count_area', 'Min'])>
<cfset ArrayAppend(dimensions, ['<font color="##c0c0c0">T/P Pruning</font>', 'tp_pruning', 'count_area', 'Min'])>
<cfset ArrayAppend(dimensions, ['<font color="pink">Annuals</font>', 'annuals', 'count_area', ''])>
<cfset ArrayAppend(dimensions, ['<font color="##555588">Mulch Rings</font>', 'mulch_rings', 'mulch_rings', 'EA'])>

<!--- INITIALIZE MULCH RINGS --->
<cfset mulch_rings_sizes = ArrayNew(1)>
<cfset ArrayAppend(mulch_rings_sizes, [3, 7.1, 9.4])>
<cfset ArrayAppend(mulch_rings_sizes, [6, 28.3, 18.9])>
<cfset ArrayAppend(mulch_rings_sizes, [4, 12.6, 12.6])>
<cfset ArrayAppend(mulch_rings_sizes, [8, 50.3, 25.1])>
<cfset ArrayAppend(mulch_rings_sizes, [5, 19.6, 15.7])>
<cfset ArrayAppend(mulch_rings_sizes, [10, 78.5, 31.4])>

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
    .column_entry {
        font-size: 12pt;
    }
    .input_noborder {
        border: 0;
    }
    .highlighted_tr {
        pointer-events: none;
    }
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<div class="page-header">
  <cfinclude template="../quoting-new/header-include.cfm">
  <cfinclude template="../quoting-new/header-menu.cfm">
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
  <cfoutput><center><h1>Customer : <b>#get_quote_start.opportunity_name#</h1></center></cfoutput>
  <br />
  <center><a class="btn btn-danger btn-lg" href="javascript:window.close()">Close Window</a></center>
  <br />
  <div class="clearfix"></div>
  <div class="page-content">
  <div class="container-fluid text-center">
    <div class="row center-block text-center">
        <cfloop from="1" to="#arrayLen(dimensions)#" index="i">
            <cfset dim = dimensions[i]>
            <cfif i % 4 EQ 1 && i NEQ 1>
                </div><div class="row center-block text-center">
            </cfif>
                <div class="col-xs-12 col-lg-3 center-block" style="border: 1px solid black; margin-bottom: 20px;">
                <!---div class="col-xs-3 center-block" style="border: 1px solid black; margin-bottom: 20px;"--->
                    <cfoutput>
                        <table style="width: 100%">
                            <tr>
                                <td align="right">
                                    <span id="span_plusminus_#dim[2]#"></span>
                                </td>
                            </tr>
                        </table>
                        <span style="font-size: 14pt; position: relative; top: -6px">#dim[1]#</span>
                        <table id="table_#dim[2]#" class="table table-striped">
                            <thead>
                                <cfif dim[3] EQ 'mulch_rings'>
                                    <tr>
                                        <cfloop from="1" to="#arrayLen(mulch_rings_sizes)#" index="mulch_rings_index">
                                            <cfset mulch_rings_count = mulch_rings_sizes[mulch_rings_index][1]>
                                            <cfif mulch_rings_index % 2 EQ 1 AND mulch_rings_index NEQ 1>
                                                </tr><tr>
                                            </cfif>
                                            <cfoutput>
                                                <td align="center">#mulch_rings_count#x</td>
                                                <td align="center"><a class="btn btn-success btn-xs" onclick="recalculate_mulch_rings(#mulch_rings_count#, 1, 1)">+</a></td>
                                                <td align="center"><a class="btn btn-danger btn-xs" onclick="recalculate_mulch_rings(#mulch_rings_count#, -1, 1)">-</a></td>
                                                <td align="center">=</td>
                                                <td align="center"><input class="column_entry" size="1" id="#dim[2]#_#mulch_rings_count#" name="#dim[2]#_#mulch_rings_count#" oninput="recalculate_mulch_rings(#mulch_rings_count#, 0, 1)"></td>
                                            </cfoutput>
                                        </cfloop>
                                    </tr>
                                <cfelse>
                                    <tr>
                                        <cfif dim[3] EQ 'area'>
                                            <td align="center">Length</td>
                                            <td align="center"></td>
                                            <td align="center">Width</td>
                                            <td align="center"></td>
                                            <td align="center">Area</td>
                                            <td align="center"></td>
                                        </cfif>
                                        <cfif dim[3] EQ 'count_area'>
                                            <td align="center" colspan="2">Count</td>
                                        </cfif>
                                        <cfif dim[3] EQ 'count_ot_slope'>
                                            <td align="center" colspan="2">Obstacle Time</td>
                                            <td align="center" colspan="2">Slope Time</td>
                                        </cfif>
                                    </tr>
                                    <tr>
                                        <cfif dim[3] EQ 'area'>
                                            <td align="center"><input class="column_entry" size="4" id="#dim[2]#_length" name="#dim[2]#_length" oninput="recalculate_area_before_applying('#dim[2]#')" onkeydown="if (event.keyCode==13) add_row('#dim[3]#', '#dim[2]#', '#dim[4]#')"></td>
                                            <td align="center">x</td>
                                            <td align="center"><input class="column_entry" size="4" id="#dim[2]#_width" name="#dim[2]#_width" oninput="recalculate_area_before_applying('#dim[2]#')" onkeydown="if (event.keyCode==13) add_row('#dim[3]#', '#dim[2]#', '#dim[4]#')"></td>
                                            <td align="center">=</td>
                                            <td align="center" style="pointer-events: none"><input class="column_entry #dim[2]#_area_original" size="4" disabled="true"><input class="#dim[2]#_area_original" id="#dim[2]#_area_original" type="hidden"></td>
                                            <td align="center">#dim[4]#</td>
                                        </cfif>
                                        <cfif dim[3] EQ 'count_area'>
                                            <td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="column_entry" size="4" id="#dim[2]#_count" name="#dim[2]#_count" onkeydown="if (event.keyCode==13) add_row('#dim[3]#', '#dim[2]#', '#dim[4]#')">&nbsp;&nbsp;&nbsp;#dim[4]#</td>
                                        </cfif>
                                        <cfif dim[3] EQ 'count_ot_slope'>
                                            <td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="column_entry" size="4" id="#dim[2]#_count_obstacle" name="#dim[2]#_count_obstacle" onkeydown="if (event.keyCode==13) add_row('#dim[3]#', '#dim[2]#', '#dim[4]#')">&nbsp;&nbsp;&nbsp;#dim[4]#</td>
                                            <td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="column_entry" size="4" id="#dim[2]#_count_slope" name="#dim[2]#_count_slope" onkeydown="if (event.keyCode==13) add_row('#dim[3]#', '#dim[2]#', '#dim[4]#')">&nbsp;&nbsp;&nbsp;#dim[4]#</td>
                                        </cfif>
                                    </tr>
                                </cfif>
                            </thead>
                            <tbody>
                                <!--tr>
                                    <td colspan="6">
                                        <a class="btn btn-success btn-lg button_addrow" data-id="#dim[2]#" data-type="#dim[3]#" data-unit="#dim[4]#">Apply Calculation Above</a>
                                    </td>
                                </tr-->
                                <tr class="highlighted_tr">
                                    <cfif dim[3] EQ 'area'>
                                        <td style="font-size: 12pt; font-weight: bold" align="center" colspan="6"><b>#dim[1]# Total</b> = <span id="#dim[2]#_area_total" value="0"></span></td>
                                    </cfif>
                                    <cfif dim[3] EQ 'count_area'>
                                        <td style="font-size: 12pt; font-weight: bold" align="center" colspan="2"><b>#dim[1]# Total</b> = <span id="#dim[2]#_count_total" value="0"></span></td>
                                    </cfif>
                                    <cfif dim[3] EQ 'count_ot_slope'>
                                        <td style="font-size: 12pt; font-weight: bold" align="center" colspan="4"><b>Obstacle Total</b> = <span id="#dim[2]#_count_obstacle_total" value="0"></span></td>
                                    </cfif>
                                </tr>
                                <cfif dim[3] EQ 'count_ot_slope'>
                                    <tr class="highlighted_tr">
                                        <td style="font-size: 12pt; font-weight: bold" align="center" colspan="4"><b>Slope Total</b> = <span id="#dim[2]#_count_slope_total" value="0"></span></td>
                                    </tr>
                                </cfif>
                            </tbody>
                        </table>
                    </cfoutput>
                </div>
        </cfloop>
    </div>
</div>
</div>

<script>
    var is_new_dimensions = false;
    var isHidden = {};
    <cfif get_quote_services_dimensions.recordcount EQ 0>
        is_new_dimensions = true;
    </cfif>

    var dimensions = {};
    <cfloop from="1" to="#arrayLen(dimensions)#" index="dimensions_index">
        <cfoutput>
            dimensions['#dimensions[dimensions_index][2]#'] = ['#dimensions[dimensions_index][1]#', '#dimensions[dimensions_index][2]#', '#dimensions[dimensions_index][3]#', '#dimensions[dimensions_index][4]#']
        </cfoutput>
    </cfloop>

    var mulch_rings = [];
    <cfloop from="1" to="#arrayLen(mulch_rings_sizes)#" index="mulch_rings_index">
        <cfoutput>
            mulch_rings.push([#mulch_rings_sizes[mulch_rings_index][1]#, #mulch_rings_sizes[mulch_rings_index][2]#, #mulch_rings_sizes[mulch_rings_index][3]#]);
        </cfoutput>
    </cfloop>

    window.onload = function(){
        $( document ).ready(function() {
            $('.button_addrow').click(function(){
                var type = $(this).attr('data-type');
                var id = $(this).attr('data-id');
                var unit = $(this).attr('data-unit');
                add_row(type, id, unit);
            });

            var loaded_dim;
            var i;
            var count;
            var skippedcount; //to exclude any rows that have a 0 in them
            var skippedlastrow;
            var lasttrcount;

            <cfloop from="1" to="#arrayLen(dimensions)#" index="dim_index">
                skippedcount = 0;
                skippedlastrow = false;
                lasttrcount = 0;
                <cfset current_dim = dimensions[dim_index]>
                <cfif get_quote_services_dimensions.recordcount GT 0>
                    <cfset dimensions_json = quote_service_dimensions[UCase(current_dim[2])]>
                    <cfif dimensions_json NEQ ''>
                        <cfoutput>
                            loaded_dim = JSON.parse(atob('#dimensions_json#'));
                            console.log(loaded_dim);
                            id = '#current_dim[2]#';
                            type = '#current_dim[3]#';
                            unit = '#current_dim[4]#';

                            for(i=0; i<loaded_dim.length; i++)
                            {
                                ld = loaded_dim[i];
                                if (ld.count != lasttrcount)
                                {
                                    if (skippedlastrow)
                                        skippedcount++;
                                    lasttrcount = ld.count;

                                    reset_original(type, id);
                                }

                                trcount = ld.count*1 - skippedcount;
                                //console.log('trcount: '+trcount);
                                base_id = id+trcount;

                                switch(type)
                                {
                                    case 'area':
                                        $('##'+id+'_'+ld.suffix).val(ld.value);
                                        recalculate_area_before_applying(id);
                                        if (!(error_message = apply_calculation_above(type, id, base_id, trcount, unit)))
                                        {
                                            skippedlastrow = false;
                                            recalculate_area(id, trcount, unit);
                                        }
                                        else
                                        {
                                            skippedlastrow = true;
                                        }
                                        break;
                                    case 'count_area':
                                        $('##'+id+'_'+ld.suffix).val(ld.value);
                                        if (!(error_message = apply_calculation_above(type, id, base_id, trcount, unit)))
                                        {
                                            skippedlastrow = false;
                                            recalculate_count_area(id, trcount, unit);
                                        }
                                        else
                                        {
                                            skippedlastrow = true;
                                        }
                                        break;
                                    case 'count_ot_slope':
                                        $('##'+id+'_'+ld.suffix).val(ld.value);
                                        if (ld.suffix == 'count_slope')
                                        {
                                            apply_calculation_above(type, id, base_id, trcount, unit);
                                            recalculate_count_ot_slope(id, trcount, unit);
                                        }
                                        break;
                                    case 'mulch_rings':
                                        recalculate_mulch_rings(ld.suffix, ld.value, 0);
                                        break;
                                }
                            }
                            reset_original(type, id);
                        </cfoutput>
                    </cfif>
                </cfif>

                <cfoutput>
                    hideTr('#current_dim[2]#');
                </cfoutput>
            </cfloop>
        });
    }

    function hideTr(id)
    {
        $('#span_plusminus_'+id).html('<input type="hidden" id="isHidden_#dim[2]#" value="1"><a id="btn_plusminus_#dim[2]#" style="position: relative; left: 15px" class="btn btn-info" href="javascript:showTr(\''+id+'\')">+</a>');
        $('#table_'+id+' tbody tr:not(:last)').hide();
        $('.highlighted_tr').show();
        isHidden[id] = 1;
    }

    function showTr(id)
    {
        $('#span_plusminus_'+id).html('<input type="hidden" id="isHidden_#dim[2]#" value="0"><a id="btn_plusminus_#dim[2]#" style="position: relative; left: 15px" class="btn btn-info" href="javascript:hideTr(\''+id+'\')">-</a>');
        $('#table_'+id+' tbody tr:not(:last)').show();
        isHidden[id] = 0;
    }

    function add_row(type, id, unit)
    {
        var trcount = $('#table_'+id+' tbody tr').length;
        if (id == 'ot_slope') trcount--;
        var base_id = id+trcount;

        if (error_message = apply_calculation_above(type, id, base_id, trcount, unit))
        {
            alert(error_message);
            return;
        }

        switch(type)
        {
            case 'area':
                recalculate_area(id, trcount, unit, 1);
                $('#'+id+'_length').focus();
                break;
            case 'count_area':
                recalculate_count_area(id, trcount, unit, 1);
                $('#'+id+'_count').focus();
                break;
            case 'count_ot_slope':
                recalculate_count_ot_slope(id, trcount, unit, 1);
                $('#'+id+'_count_obstacle').focus();
                break;
        }

        if (isHidden[id])
            hideTr(id);
    }

    function apply_calculation_above(type, id, base_id, trcount, unit)
    {
        var html = '';
        html += '<tr class="dynamic_tr">';
        switch(type)
        {
            case 'area':
                if (!$('#'+id+'_area_original').val() || $('#'+id+'_area_original').val() == 0)
                    return 'Please enter a valid length and width before applying this calculation.';

                html += '<td align="center">'+trcount+'.&nbsp;&nbsp;<input class="input_noborder '+id+'_length" size="4" id="'+base_id+'_length" name="'+base_id+'_length" oninput="recalculate_area(\''+id+'\', '+trcount+', \''+unit+'\', 1);"></td>';
                html += '<td align="center">x</td>';
                html += '<td align="center"><input class="input_noborder '+id+'_width" size="4" id="'+base_id+'_width" name="'+base_id+'_width" oninput="recalculate_area(\''+id+'\', '+trcount+', \''+unit+'\', 1);"></td>';
                html += '<td align="center">=</td>';
                html += '<td align="center" style="pointer-events: none"><input class="input_noborder '+id+'_area '+base_id+'_area" size="4"><input class="'+base_id+'_area" id="'+base_id+'_area" type="hidden"></td>';
                html += '<td align="center">'+unit+'</td>';
                break;
            case 'count_area':
                if (!$('#'+id+'_count').val() || $('#'+id+'_count').val() == 0)
                    return 'Please enter a valid count before applying this calculation.';

                html += '<td align="right" width="50%">'+trcount+'.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
                html += '<td align="left" width="50%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_noborder '+id+'_count" size="4" id="'+base_id+'_count" name="'+base_id+'_count" oninput="recalculate_count_area(\''+id+'\', '+trcount+', \''+unit+'\', 1);"></td>';
                break;
            case 'count_ot_slope':
                if ((!$('#'+id+'_count_obstacle').val() || $('#'+id+'_count_obstacle').val() == 0)
                    && (!$('#'+id+'_count_slope').val() || $('#'+id+'_count_slope').val() == 0)
                    )
                    return 'Please enter a valid count before applying this calculation.';

                html += '<td align="center" width="50%" colspan="2">'+trcount+'.&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_noborder '+id+'_count_obstacle" size="4" id="'+base_id+'_count_obstacle" name="'+base_id+'_count_obstacle" oninput="recalculate_count_ot_slope(\''+id+'\', '+trcount+', \''+unit+'\', 1);"></td>';
                html += '<td align="center" width="50%" colspan="2"><input class="input_noborder '+id+'_count_slope" size="4" id="'+base_id+'_count_slope" name="'+base_id+'_count_slope" oninput="recalculate_count_ot_slope(\''+id+'\', '+trcount+', \''+unit+'\', 1);"></td>';
                break;
        }
        html += '</tr>';
        console.log(html);

        $('#table_'+id+' tbody').append(html);

        switch(type)
        {
            case 'area':
                $('#'+base_id+'_length').val($('#'+id+'_length').val());
                $('#'+base_id+'_width').val($('#'+id+'_width').val());
                break;
            case 'count_area':
                $('#'+base_id+'_count').val($('#'+id+'_count').val());
                break;
            case 'count_ot_slope':
                $('#'+base_id+'_count_obstacle').val($('#'+id+'_count_obstacle').val());
                $('#'+base_id+'_count_slope').val($('#'+id+'_count_slope').val());
                break;
        }
        reset_original(type, id);
        return '';
    }

    function reset_original(type, id)
    {
        switch(type)
        {
            case 'area':
                $('#'+id+'_length').val('');
                $('#'+id+'_width').val('');
                $('.'+id+'_area_original').val('');
                break;
            case 'count_area':
                $('#'+id+'_count').val('');
                break;
            case 'count_ot_slope':
                $('#'+id+'_count_obstacle').val('');
                $('#'+id+'_count_slope').val('');
                break;
        }
    }

    function recalculate_area_before_applying(id)
    {        
        $('.'+id+'_area_original').val($('#'+id+'_length').val() * $('#'+id+'_width').val());
    }
    
    function recalculate_area(id, trcount, unit, saveit)
    {
        if (trcount != -1)
        {
            var base_id = id+trcount;
            $('.'+base_id+'_area').val($('#'+base_id+'_length').val() * $('#'+base_id+'_width').val());
        }

        var length_total = 0;
        $('.'+id+'_length').each(function(){
            length_total += 1*$(this).val();
        });
        $('#'+id+'_length_total').val(length_total);
        
        var width_total = 0;
        $('.'+id+'_width').each(function(){
            width_total += 1*$(this).val();
        });
        $('#'+id+'_width_total').val(width_total);
        
        var area_total = 0;
        $('.'+id+'_area').each(function(){
            area_total += 1*$(this).val();
        });
        if (id == 'mulch')
            area_total = recalculate_mulch(area_total, 1);
        area_total = Math.round(area_total*10)/10;
        $('#'+id+'_area_total').html(area_total+' '+unit);

        if (saveit)
        {
            var values = collectValuesByIdAndSuffixes(id, ['length', 'width']);
            save_data(id, values, area_total);
        }
    }

    function recalculate_count_area(id, trcount, unit, saveit)
    {
        var count_total = 0;
        $('.'+id+'_count').each(function(){
            count_total += 1*$(this).val();
        });
        if (id == 'bed_edge')
            count_total = recalculate_mulch(count_total, 2);
        if (id == 'winter_edge')
        {
            var bed_edge_total_str = $('#bed_edge_count_total').html();
            var spl = bed_edge_total_str.split(' ');
            var bed_edge_total = spl[0]*1;
            if (isNaN(bed_edge_total)) bed_edge_total = 0;
            count_total += bed_edge_total;
        }
        count_total = Math.round(count_total*10)/10;
        if (id == 'shrub_pruning' || id == 'tp_pruning')
            $('#'+id+'_count_total').html(count_total+' '+unit+' / '+(Math.floor(count_total/60*10)/10)+' Hrs');
        else
            $('#'+id+'_count_total').html(count_total+' '+unit);

        if (saveit)
        {
            var values = collectValuesByIdAndSuffixes(id, ['count']);
            save_data(id, values, count_total);
        }
    }
    
    function recalculate_count_ot_slope(id, trcount, unit, saveit)
    {        
        var count_obstacle_total = 0;
        $('.'+id+'_count_obstacle').each(function(){
            count_obstacle_total += 1*$(this).val();
        });
        $('#'+id+'_count_obstacle_total').html(count_obstacle_total+' '+unit);

        var count_slope_total = 0;
        $('.'+id+'_count_slope').each(function(){
            count_slope_total += 1*$(this).val();
        });
        $('#'+id+'_count_slope_total').html(count_slope_total+' '+unit);
        
        if (saveit)
        {
            var values = collectValuesByIdAndSuffixes(id, ['count_obstacle', 'count_slope'], 1);
            save_data(id, values, 'ot_total='+count_obstacle_total+'|slope_total='+count_slope_total);
        }
    }

    function recalculate_mulch_rings(mulch_rings_count, inc, saveit)
    {
        var target = $('#mulch_rings_'+mulch_rings_count);
        if (inc != 0)
        {
            var value = target.val()*1+inc*1;
            target.val(value);
        }

        var dim = dimensions['mulch'];
        recalculate_area(dim[1], -1, dim[3], saveit);

        dim = dimensions['bed_edge'];
        recalculate_count_area(dim[1], -1, dim[3], saveit);

        dim = dimensions['winter_edge'];
        recalculate_count_area(dim[1], -1, dim[3], saveit);

        if (saveit)
        {
            var count_mulch_rings_total = 0;
            var values = [];
            for(var i=0; i<mulch_rings.length; i++)
            {
                var mulch_ring_size = mulch_rings[i][0];
                var value = $('#mulch_rings_'+mulch_ring_size).val()

                values.push({
                    'suffix': mulch_ring_size,
                    'value': value
                });
                count_mulch_rings_total += value*1;
            }
            save_data('mulch_rings', values, count_mulch_rings_total);
        }
    }

    function recalculate_mulch(total, mulch_value_index)
    {
        if (isNaN(total)) total = 0;
        console.log('initial total: '+total);
        for(var i=0; i<mulch_rings.length; i++)
        {
            total += $('#mulch_rings_'+mulch_rings[i][0]).val() * mulch_rings[i][mulch_value_index];
        }
        if (isNaN(total)) total = 0;
        console.log('final total: '+total);
        return total;
    }

    function add_or_subtract(delta, id, trcount)
    {
        var base_id = id+trcount;
        $('.'+base_id+'_count').val(Math.max(0, $('.'+base_id+'_count').val()*1+delta));

        var count_total = 0;
        $('.'+id+'_count').each(function(){
            count_total += 1*$(this).val();
        });
        $('#'+id+'_count_total').val(count_total);
    }

    function collectValuesByIdAndSuffixes(id, suffixes, acceptzerovalue)
    {
        var values = [];

        var count = 1;
        var realcount = 1;
        var elem;
        while (elem = document.getElementById(id+count+'_'+suffixes[0]))
        {
            var hasonenonzerofield = false;
            for(var i=0; i<suffixes.length; i++)
            {
                var suffix = suffixes[i];
                elem = document.getElementById(id+count+'_'+suffix);
                if (elem.value > 0 || acceptzerovalue)
                {
                    values.push({
                        'suffix': suffix,
                        'count': realcount,
                        'value': elem.value
                    });
                    hasonenonzerofield = true;
                }
            }
            count++;
            if (hasonenonzerofield)
                realcount++;
        }
        return values;
    }

    function save_data(id, values_raw, total)
    {
        total = ''+total;
        console.log('SENDING:');
        console.log(values_raw);
        var dataObj = { 'quote_start_id': <cfoutput>#get_quote_start.ID#</cfoutput>, 'id': id, 'values': btoa(JSON.stringify(values_raw)) };
        if (total.indexOf('|') != -1)
        {
            var spl = total.split('|');
            for(var i=0; i<spl.length; i++)
            {
                var sp = spl[i].split('=');
                dataObj[sp[0]] = sp[1];
            }
        }
        else
        {
            dataObj.total = total;
        }

        if (is_new_dimensions)
        {
            dataObj.is_new_dimensions = 1;
            is_new_dimensions = false;
        }

        $.ajax({
            url: 'dimensions_entry_save.cfm',
            type: 'post',
            data: dataObj,
            success: function(data) {
            }
        });
    }
</script>

<!--Html-->
</div>
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="../quoting-new/footer-include.cfm">
<!-- END FOOTER -->
<!--div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div-->
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

</body>
<!-- END BODY -->
</html>
