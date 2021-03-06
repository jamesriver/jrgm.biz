<cfinclude template="../quoting-new/include_specsheet_mss.cfm">

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
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />

<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->

<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style type="text/css">
.noMargin {
	margin: -2px;
}
.headbig {
	font-size: 16px;
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
.table2 {
	border-top-color: rgba(244,10,10,1.00)
}
.td_left {
    text-align: right;
    padding-right: 10px;
    padding-bottom: 5px;
}
.td_right {
    padding-right: 10px;
    padding-bottom: 5px;
}
</style>
</head>

<cfquery name="get_employees" datasource="jrgm">
    SELECT  [Employee ID] as employee_id, [Name FirstLast] AS employee_Name FROM app_employees WHERE active_record=1 AND [Employee ID] < 9999
</cfquery>

<body>
<cfoutput query="get_quote_start">
<div style="float: left">
    <h1>&nbsp;&nbsp;&nbsp;Quote Spec Sheet</h1>
</div>
<div style="float: right; margin-top: 10px">
    <table><tr><td>
        <table>
            <tr>
                <td class="td_left"><b>Branch</b>:</td>
                <td class="td_right">#q_branch#</td>
            </tr>
            <tr>
                <td class="td_left"><b>Customer</b>:</td>
                <td class="td_right">#opportunity_name#</td>
            </tr>
            <tr>
                <td class="td_left"><b>Job Location</b>:</td>
                <td class="td_right">#q_address1#, #q_city#, #q_address_state#, #q_address_zip#</td>
            </tr>
        </table>
    </td>
    <td>
        <table>
            <tr>
                <td class="td_left"><b>Contract Dates</b>:</td>
                <td class="td_right">#dateformat(get_quote_main.contract_start_date,"mm/dd/yyyy")# - #dateformat(get_quote_main.contract_end_date,"mm/dd/yyyy")#</td>
            </tr>
            <tr>
                <td class="td_left"><b>Manager</b>:</td>
                <td class="td_right">
                    <cfif responsible_user_Employee_ID NEQ "">
                        <cfquery name="get_pm"   dbtype="query">
                            SELECT employee_Name AS PM_Name FROM get_employees WHERE  employee_id = #responsible_user_Employee_ID#
                        </cfquery>
                        #get_pm.PM_Name#
                    <cfelse>
                        --
                    </cfif>
                </td>
            </tr>
            <tr>
                <td class="td_left"><b>Quote Modified</b>:</td>
                <td class="td_right">#dateformat(date_quote_updated,"mm/dd/yyyy")#</td>
            </tr>
        </table>
    </td></tr></table>
</div>
</cfoutput>

<div class="page-content">
  <div class="container-fluid">
    <div class="container-table">
      <!---cfoutput query="get_quote_start">
        <table width="98%" border="0" cellspacing="0" cellpadding="0"  align="center">
        <tr>
        <td valign="top">
        <table width="100%" border="0">
          <tbody>
            <tr>
              <td height="35" style="font-size: 15px"><strong>James River Grounds Management</strong></td>
              <td height="35" style="font-size: 15px">&nbsp;</td>
              <td height="35" align="right" style="font-size: 15px"><strong>Job Detail Sheet</strong></td>
            </tr>
          </tbody>
        </table>
        <table width="100%" align="center" border="1"   class="table2">
          <tr>
            <td width="160" bgcolor="##ECECEC"><strong>Job No : </strong></td>
            <td><strong><!---#opportunity_id#---><!---#opportunity_state#---></strong></td>
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9"><strong>Manager :</strong></td>
            <cfif responsible_user_Employee_ID NEQ "">
              <cfquery name="get_pm"   dbtype="query">
              SELECT employee_Name AS PM_Name FROM get_employees WHERE  employee_id = #responsible_user_Employee_ID#
              </cfquery>
              <td width="125">#get_pm.PM_Name#</td>
              <cfelse>
              <td width="125">-</td>
            </cfif>
            <td bgcolor="##E9E9E9"><strong>Location:</strong></td>
            <td colspan="3" bgcolor="##E9E9E9"><strong>#q_branch# </strong></td>
          </tr>
          <tr>
            <td width="160" bgcolor="##ECECEC"><strong>Customer : </strong></td>
            <td><strong>#opportunity_name#</strong></td>
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9"><strong>Crew Lead : </strong></td>
            <cfif get_project_info.recordcount  GT 0 AND  get_project_info.Crew_leader_ID NEQ "">
              <cfquery name="get_CL"   dbtype="query">
              SELECT employee_Name AS CL_Name FROM get_employees WHERE  employee_id = #get_project_info.Crew_leader_ID#
              </cfquery>
              <td width="125">#get_cl.CL_Name#</td>
              <cfelse>
              <td width="125">-</td>
            </cfif>
            <td colspan="5"><strong>#q_address1# #q_address2#</strong></td>
          </tr>
          <tr>
            <td width="160" bgcolor="##ECECEC"><strong>Contact : </strong></td>
            <td>#opportunity_field_20#</td>
            <!---
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9"><strong>Spray Tech : </strong></td>
            <cfif get_project_info.recordcount  GT 0  AND  get_project_info.Spray_Tech_ID NEQ "">
              <cfquery name="get_ST"   dbtype="query">
              SELECT employee_Name AS ST_Name FROM get_employees WHERE  employee_id = #get_project_info.Spray_Tech_ID#
              </cfquery>
              <td width="125">#get_ST.ST_Name#</td>
              <cfelse>
              <td width="125">-</td>
            </cfif>
            --->
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9">&nbsp;</td>
            <td width="125">&nbsp;</td>
            <td colspan="4"><strong>#q_city#, #q_address_state#, #q_address_zip#</strong></td-->
          </tr>
          <tr>
            <td width="160" bgcolor="##ECECEC"><strong>Phone : </strong></td>
            <td>#opportunity_field_21#</td>
            <!---
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9"><strong>Irrig Tech : </strong></td>
            <cfif get_project_info.recordcount  GT 0  AND  get_project_info.Irrigation_Tech_ID NEQ "">
              <cfquery name="get_IT"   dbtype="query">
              SELECT employee_Name AS IT_Name FROM get_employees WHERE  employee_id = #get_project_info.Irrigation_Tech_ID#
              </cfquery>
              <td width="125">#get_IT.IT_Name#</td>
              <cfelse>
              <td width="125">-</td>
            </cfif>
            --->
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9">&nbsp;</td>
            <td width="125">&nbsp;</td>
            <td colspan="4"><strong>&nbsp;</strong></td>
          </tr>
          <tr>
            <td width="160" bgcolor="##ECECEC"><strong>Email : </strong></td>
            <td>#opportunity_field_22#</td>
            <!---
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9"><strong>Irrigation Contractor:</strong></td>
            <td>&nbsp;</td>
            --->
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9">&nbsp;</td>
            <td width="125">&nbsp;</td>
            <td><strong>Start Date: </strong></td>
            <td>#dateformat(q_start_date,"mm/dd/yyyy")#</td>
            <td><strong>Expires:</strong></td>
            <td>#dateformat(q_end_date,"mm/dd/yyyy")#</td>
          </tr>
          <!--tr>
            <td width="150" bgcolor="##ECECEC"><strong>&nbsp;</strong></td>
            <td>&nbsp;</td>
            <td width="150" nowrap="nowrap" bgcolor="##E9E9E9">&nbsp;</td>
            <td>&nbsp;</td>
            <td><strong>Day : </strong></td>
            <td>#q_start_date#</td>
            <td><strong>Expires:</strong></td>
            <td>#q_end_date#</td>
          </tr-->
        </table>
      </cfoutput> <br /--->
      <table   width="100%" cellpadding="2" cellspacing="0" border="1" class="table2">
        <tr>
          <td align="left"  style="font-size: 14px; font-weight: bold;">Svc Id</td>
          <td align="left"   style="font-size: 14px; font-weight: bold;">Service Description</td>
          <td align="left"   style="font-size: 14px; font-weight: bold;">Times</td>
          <td align="left"  style="font-size: 14px; font-weight: bold;">Hours/Occ</td>
          <td align="left"  style="font-size: 14px; font-weight: bold;">Materials</td>
          <td  style="font-size: 14px; font-weight: bold;">Quantity</td>
        </tr>
        <tr bgcolor="#ECECEC">
          <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
            <cfset current_column = quote_column_headers[i]>
            <cfif current_column.column_visibleonspecsheet GT 0>
              <th  colspan="6" align="<cfoutput>#current_column.column_displayalign#</cfoutput>"><cfoutput><strong>#current_column.column_name#</strong></cfoutput></th>
            </cfif>
          </cfloop>
        </tr>
          </thead>
        
        <tbody>
          <cfoutput>
            <cfset blank_count = 0>
            <cfloop from="1" to="#arrayLen(quote_specsheet)#" index="i">
              <tr style="background-color: ##ECECEC; color: black">
                <td colspan="6"><strong>#quote_specsheet[i][1]#</strong></td>
              </tr>
              <cfset quote_data_entry_row_order_array = ListToArray(quote_specsheet[i][2])>
              <cfset seasonal_hours = 0>
              <cfloop from="1" to="#arrayLen(quote_data_entry_row_order_array)#" index="ii">
                <cfset current_row = quote_rows[quote_data_entry_row_order_array[ii]]>
                <cfset row_ID = getRowID(current_row[1])>
                <cfif row_ID EQ 'blank_service'>
                    <cfset blank_count++>
                    <cfset row_ID = 'BlankService' & blank_count>
                </cfif>
                <tr id="#row_ID#">
                  <cfloop from="1" to="#arrayLen(current_row)#" index="iii">
                    <!---cfdump var="#quote_rows_cache[quote_data_entry_row_order_array[ii]]#">
                    <cfabort--->
                    <cfswitch expression="#iii#">
                        <cfcase value="1">
                            <cfif row_ID CONTAINS 'BlankService'>
                                <cfset row_column = 'Additional Service ' & blank_count>
                            <cfelse>
                                <cfset row_column = quote_rows_cache[quote_data_entry_row_order_array[ii]][1]['row_defaultvalue']>
                            </cfif>
                        </cfcase>
                        <cfcase value="2">
                            <cfif row_ID CONTAINS 'BlankService'>
                                <cfset row_column = '<span id="blank' & blank_count & '_service"></span>'>
                            <cfelse>
                                <cfset row_column = quote_rows_cache[quote_data_entry_row_order_array[ii]][service_descriptions_row]['row_defaultvalue']>
                            </cfif>
                        </cfcase>
                        <cfcase value="5">
                            <cfif row_ID CONTAINS 'BlankService'>
                                <cfset row_column = '<span id="blank' & blank_count & '_material"></span>'>
                            <cfelse>
                                <cfset row_column = quote_rows_cache[quote_data_entry_row_order_array[ii]][service_descriptions_row]['row_defaultvalue']>
                            </cfif>
                        </cfcase>
                        <cfdefaultcase>
                            <cfset row_column = current_row[iii]>
                        </cfdefaultcase>
                    </cfswitch>
                    <td style="font-size: 8pt !important"><strong>#row_column#</strong></td>
                  </cfloop>
                </tr>
              </cfloop>
              <cfif i EQ 1>
                  <tr>
                      <td style="font-weight: bold; font-size: 8pt !important">Total Seasonal Hours</td>
                      <td></td>
                      <td></td>
                      <td style="font-size: 8pt !important"><span id="span_seasonal_hours_total" style="font-weight: bold"></td>
                      <td></td>
                      <td></td>
                  </tr>
              </cfif>
            </cfloop>
          </cfoutput>
        </tbody>
      </table>
      </td>
      </tr>
      </table>
      <br />
      <br />
      <cfquery name="get_all_notes_3"   datasource="jrgm">
    SELECT       ID, opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date, note_type
FROM         quote_notes  WHERE  opportunity_id = #url.id# AND  opportunity_id_original = #url.id# AND note_type= 3
</cfquery>
      <table width="98%"   align="center" border="1"  class="table2">
        <tr      bgcolor="#EDF3F8">
          <td width="125" nowrap="nowrap" bgcolor="#E9E9E9"><strong>General Notes :</strong></td>
          <td colspan="2" align="right" bgcolor="#E9E9E9"><strong><cfoutput>Total SF Bed: #NumberFormat(get_quote_main.bed_sqft ,"999,999,999")# &nbsp;&nbsp;&nbsp;&nbsp;Total SF Turf: #NumberFormat(get_quote_main.turf_sqft ,"999,999,999")#&nbsp;</cfoutput></strong></td>
        </tr>
        <CFIF get_all_notes_3.recordcount GT 0>
          <cfoutput query="get_all_notes_3">
            <tr>
              <td  width="100" colspan="2" valign="top"><strong>#dateformat(note_date,"mm/dd/yyyy")#</strong></td>
              <td valign="top" align="left" style="font-size: 8pt !important"><strong>#note_body#</strong></td>
            </tr>
          </cfoutput>
          <cfelse>
          <tr>
            <td valign="top" colspan="3">No Spec Sheet Notes</td>
          </tr>
        </cfif>
      </table><br />
<br />
<!---
      <ol>
        <li>Add Total Seasonal Maintenance hours -After Season Maintenance Group</li>
        <li><strike>Exclude 0 hours/ 0 times service rows</strike></li>
        <li>Show hours per occurence/ not total hours</li>
        <li>Production Primary Contacts, may need to get these from Insightly</li>
        <li><strike>On /ssl/quoting-new/quote_data_entry_print.cfm&nbsp;-Exclude 0 hours/ 0 times service rows</strike></li>
      </ol>
      <p><br />
    </p>
--->
    </div>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/2.6.0/math.min.js"></script> 
<script>
    function formatDollars(value_raw) {
        var value_rounded = getValueRounded(value_raw);
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
        while (html.indexOf('$') != -1) html = html.replace('$' ,'');
        while (html.indexOf(',') != -1) html = html.replace(',' ,'');
        return 1*html;
    }

    function formatNumber (num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
    }

    window.onload = function(){
        $( document ).ready(function() {
            var initial_element;
            <cfloop collection=#current_quote_services_materials# item="field">
                <cfset field = LCase(field)>
                <cfif field DOES NOT CONTAIN 'date'>
                    <cfset value = replace(current_quote_services_materials[field], "'", "\'", 'ALL')>
                    <cfoutput>
                        initial_element = document.getElementById('#field#');
                        if (initial_element)
                        {
                            initial_element.innerHTML = '#value#';
                        }
                    </cfoutput>
                </cfif>
            </cfloop>

            <!--- REMOVE ALL 0 TIMES ROWS SO THEY'RE NOT VISIBLE WHEN PRINTING PRICING SHEET --->
            <cfloop from="1" to="#arrayLen(quote_specsheet)#" index="i">
              <cfset quote_data_entry_row_order_array = ListToArray(quote_specsheet[i][2])>
                  <cfloop from="1" to="#arrayLen(quote_data_entry_row_order_array)#" index="ii">
                    <cfset current_row = quote_rows[quote_data_entry_row_order_array[ii]]>
                    <cfset SQL_field = getSQLField(current_row[3])>
                    <cfset row_ID = getRowID(current_row[1])>
                    <cfif row_ID NEQ 'blank_service'>
                        <cfoutput>
                            if (document.getElementById(#SQL_field#).innerHTML*1 == 0)
                                document.getElementById('#row_ID#').style.display = 'none';
                        </cfoutput>
                    </cfif>
                  </cfloop>
            </cfloop>

            if (document.getElementById('blank1_times').innerHTML*1 == 0)
                document.getElementById('BlankService1').style.display = 'none';
            if (document.getElementById('blank2_times').innerHTML*1 == 0)
                document.getElementById('BlankService2').style.display = 'none';
            if (document.getElementById('blank3_times').innerHTML*1 == 0)
                document.getElementById('BlankService3').style.display = 'none';
            if (document.getElementById('blank4_times').innerHTML*1 == 0)
                document.getElementById('BlankService4').style.display = 'none';
            if (document.getElementById('blank5_times').innerHTML*1 == 0)
                document.getElementById('BlankService5').style.display = 'none';

            <!--- CALCULATE SEASONAL HOURS --->
            var seasonal_hours_total = 0;
            $('span[id$="_hoursperocc"]').each(function(){
                var target = $(this).attr('id');
                var id = target.replace('_hoursperocc', '');
                var value;
                if (id == 'push_mow' || id == 'walk_behind' || id == 'ride_mow' || id == 'hard_edge' || id == 'bed_edge' || id == 'trim_o' || id == 'trim_s' || id == 'spraying' || id == 'weeding' || id == 'blowing' || id == 'trash_s' || id == 'traveltime')
                {
                    value = $('#'+target).html()*1;
                    console.log(value);
                    if (!isNaN(value))
                    {
                        seasonal_hours_total += value;
                        console.log(seasonal_hours_total);
                    }
                }
            });
            seasonal_hours_total = Math.round(seasonal_hours_total*10)/10;
            $('#span_seasonal_hours_total').html(seasonal_hours_total);

        });
    }
  </script> 
<br />
<br />
<br />
<br />

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
