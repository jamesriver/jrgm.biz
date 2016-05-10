<cfif !IsDefined('url.ID')>
    FAILED - no ID detected
    <cfabort>
</cfif>
<cfif url.ID EQ ''>
    FAILED - no ID detected
    <cfabort>
</cfif>

<cfinclude template="../quoting-new/include_cffunctions.cfm">
<cfinclude template="../quoting-new/include_sql_quote_data_entry_calculations.cfm">
<cfset total_columns = arrayLen(quote_column_headers) - 5>

<!--- ////////////////////////////////////////////////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ///////////////////////// CREATE HTML PAGE /////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ////////////////////////////////////////////////////////////////////// --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#get_quote_start.opportunity_name#</cfoutput>Pricing Sheet</title>
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
<cfinclude template="../quoting-new/header-include.cfm">
  <!---<div class="page-header-menu">
    <div class="container-fluid">
      <div id="hor-menu-default" class="hor-menu"> </div>
    </div>--->
  </div>
</div>--->
<!-- END HEADER SECTION -->
<cfoutput query="get_quote_start">
<!---div class="page-head">
  <div class="container-fluid">
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>Quote Pricing Sheet: #opportunity_name#</h1>
    </div>
  </div>
</div--->

<style>
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

<div style="float: left">
    <h1>&nbsp;&nbsp;&nbsp;Quote Pricing Sheet</h1>
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
                <td class="td_left"><b>Annual Contract Price</b>:</td>
                <td class="td_right"><span class="adjusted_contract_price_formatted"></span></td>
            </tr>
            <tr>
                <td class="td_left"><b>Bill Price</b>:</td>
                <td class="td_right"><span id="monthly_contract_price_formatted"></span> (#get_quote_main.contract_installments#<input type="hidden" id="contract_installments" value="#get_quote_main.contract_installments#"> times per year)</td>
            </tr>
        </table>
    </td></tr></table>
</div>
<!---div class="page-content">
  <div class="container-fluid">
    <div class="left-table2">
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
            <td><strong>Quote Status : <cfif opportunity_state EQ ''>RENEWAL<cfelse>#opportunity_state#</cfif> </strong></td>
            <td></td>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </cfoutput> </div>
    <div class="right-table2"> <cfoutput query="get_quote_start">
        <table class="table">
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
            <td nowrap="nowrap"   colspan="2"  align="left"><strong>Contract End Date : #dateformat(get_quote_main.contract_end_date,"mm/dd/yyyy")# &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments : #get_quote_main.contract_installments#<input type="hidden" id="contract_installments" value="#get_quote_main.contract_installments#"></strong></td>
          </tr>
          <tr>
            <td  nowrap="nowrap"><strong>Annual Contract Price :  <span class="adjusted_contract_price_formatted"></span></strong></td>
            <td>&nbsp;</td>
            <td nowrap="nowrap"><strong>Monthly Contract Price :  <span id="monthly_contract_price_formatted"></span></strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
  </div>
  </div--->

  </cfoutput>

  <!--- BEGIN OUTPUT --->
  <style>
    input {
        border: 0;
    }
  </style>

    <table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
          <table class="table" cellpadding="5" style="pointer-events: none">
            <thead>
             <tr>
               <th colspan="2"   align="left" bgcolor="#FFFFFF">&nbsp;<strong class="headbig">Service</strong></th>
               <th colspan="5" align="center"  bgcolor="#FFFFFF"><strong class="headbig">Labor</strong></th>
               <th colspan="5" align="center" bgcolor="#FFFFFF"><strong class="headbig">Materials</strong></th>
               <th width="25">&nbsp;</th>
               <th colspan="7" align="center" bgcolor="#FFFFFF"><strong class="headbig">Totals</strong></th>
             </tr>
              <tr>
                  <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfif quote_column_headers[i].column_active EQ 1>
                      <th align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><cfoutput>#quote_column_headers[i].column_name#</cfoutput></th>
                      <!---cfif i EQ 9>
                          <th align="left">Formula</th>
                      </cfif--->
                    </cfif>
                  </cfloop>
              </tr>
            </thead>
            <tbody>
              <cfset alternator = 1>
              <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                  <cfset quote_row_index = row_order_array[wrapi]>
                  <cfset tr_class = ''>
                  <cfset alternator = 1-alternator>
                  <tr id="tr_row<cfoutput>#quote_row_index#</cfoutput>" <cfoutput>#tr_class#</cfoutput>>
                      <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                          <cfset current_row = quote_rows[quote_row_index][i]>
                          <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                          <cfif current_column.column_active EQ 1>
                              <cfif current_row.row_active EQ 1>
                                  <td align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>">
                                    <cfif current_column.ID EQ 18>
                                        <cfoutput><input type="text" style="border: none" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" /></cfoutput>
                                    <cfelse>
                                      <cfif current_column.ID EQ 20>
                                          <cfoutput><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                                          <cfoutput><input class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field# subtotal<cfoutput>#current_row.row_order#</cfoutput> totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" type="hidden" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#"></cfoutput>
                                      <cfelse>
                                          <cfif current_row.quote_services_field NEQ ''>
                                              <cfif (current_column.column_editable EQ 1 AND (current_column.ID NEQ 18 OR current_row.row_defaultvalue NEQ 40)) OR (current_row.row_order GT 55 AND (current_column.ID EQ 1 OR current_column.ID EQ 3 OR current_column.ID EQ 4 OR current_column.ID EQ 6))>
                                                  <cfoutput><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#"></span></cfoutput>
                                              <cfelse>
                                                  <cfoutput><input style="text-align: right" class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" /></cfoutput>
                                                  <cfoutput><input type="hidden" class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field# totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" value="#current_row.row_defaultvalue#" /></cfoutput>
                                              </cfif>
                                          <cfelse>
                                              <cfoutput><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                                              <cfoutput><input class="column<cfoutput>#current_column.ID#</cfoutput> totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" type="hidden" id="row#current_row.ID#_numeric" value="#current_row.row_defaultvalue#"></cfoutput>
                                          </cfif>
                                      </cfif>
                                    </cfif>
                                  </td>
                              <cfelse>
                                  <cfoutput><td align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#"></span></td></cfoutput>
                                  <cfoutput><input type="hidden" class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#_numeric" value="0"></td></cfoutput>
                              </cfif>
                              <!---cfif current_column.ID EQ 9>
                                  <cfoutput><td align="left">#Replace(current_row.row_formula, '[2]', '[Qty/SqFt]', 'ALL')#</td></cfoutput>
                              </cfif--->
                          </cfif>
                      </cfloop>
                  </tr>
              </cfloop>
              <tr>
                  <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                          <cfset current_column = quote_column_headers[i]>
                          <cfif current_column.column_active EQ 1>
                              <cfif current_column.ID EQ 1 OR current_column.ID EQ 2>
                                  <cfif current_column.ID EQ 1>
                                      <th align="<cfoutput>#current_column.column_displayalign#</cfoutput>" colspan="2">
                                          Totals (Unadjusted)
                                      </th>
                                  </cfif>
                              <cfelse>
                                  <cfif current_column.ID EQ 6 OR current_column.ID EQ 7 OR current_column.ID EQ 5>
                                      <cfif current_column.ID EQ 6>
                                          <th align="left" colspan="2">
                                              &nbsp;&nbsp;&nbsp;Seasonal Hours
                                          </th>
                                          <!---th></th--->
                                      <cfelse>
                                          <cfif current_column.ID EQ 5>
                                              <cfoutput>
                                                  <th align="<cfoutput>#current_column.column_displayalign#</cfoutput>">
                                                      <span id="seasonal_hours_formatted"></span>
                                                  </th>
                                              </cfoutput>
                                          </cfif>
                                      </cfif>
                                  <cfelse>
                                      <th align="<cfoutput>#current_column.column_displayalign#</cfoutput>">
                                      <cfif current_column.column_totalable EQ 1>
                                          <cfoutput>
                                              <span class="total#current_column.ID#"></span>
                                          </cfoutput>
                                      <cfelse>
                                          <cfif current_column.column_totalable EQ 2>
                                              <cfoutput>
                                                  <span class="avg#current_column.ID#"></span>
                                              </cfoutput>
                                          <cfelse>
                                              &nbsp;
                                          </cfif>
                                      </cfif>
                                  </cfif>
                              </cfif>
                          </cfif>
                      </th>
                  </cfloop>
              </tr>
              <cfoutput>
              <tr>
                  <td align="right" colspan="#total_columns#">&nbsp;</td>
                  <td align="right" colspan="4"><strong>Contract Adjustment</strong></td>
                  <td align="left">
                    <input id="contract_adjustment" name="contract_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
              </tr>
              <tr>
                  <td align="left" colspan="#total_columns#">
                      <table>
                          <tr>
                              <td>Turf Sq. Footage:&nbsp;</td>
                              <td><input  name="turf_sqft"  type="text" size="8"  value="#get_quote_main.turf_sqft#" /></td>
                              <td width="100">&nbsp;</td>
                              <td>Bed Sq. Footage:&nbsp;</td>
                              <td><input  name="bed_sqft"  type="text" size="8"  value="#get_quote_main.bed_sqft#" /></td>
                              <td width="100">&nbsp;</td>
                          </tr>
                      </table>
                  </td>
                  <td align="right" colspan="4"><strong>Discount Adjustment</strong></td>
                  <td align="left">
                    <input id="discount_adjustment" name="discount_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
              </tr>
              <tr style="font-weight: bold">
                  <td align="right" colspan="#total_columns#">&nbsp;</td>
                  <td align="right" colspan="4"><strong>Total Adjusted Contract Price</strong></td>
                  <td align="left">
                    <span class="adjusted_contract_price_formatted" style="font-weight: bold" /></span>
                  </td>
              </tr>
              </cfoutput>
              <input type="hidden" id="total_contract_price" name="total_contract_price">
            </tbody>
          </table>
        </td>
      </tr>
    </table>

    <cfinclude template="../quoting-new/include_js_quote_data_entry_calculations.cfm">

    <script>
        function init_after()
        {
            <!--- REMOVE 0 TIMES ROWS FROM PRICE SHEET TO MAKE IT SIMPLER --->
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
              <cfset quote_row_index = row_order_array[wrapi]>
              <cfset SQL_field = 'row' & quote_rows[quote_row_index][13].ID & '_numeric'>
                <cfoutput>
                    if (document.getElementById('#SQL_field#').value == 0)
                        document.getElementById('tr_row#quote_row_index#').style.display = 'none';
                </cfoutput>
            </cfloop>
        }
    </script>
  <!--- END OUTPUT --->

  <table   width="98%"border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td valign="top"><table class="table"  >
            <cfoutput>
              <cfoutput>
              <tr>
                <td colspan="2" align="center" nowrap="nowrap"><strong>CONTRACT INFO</strong></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td colspan="2" align="center" nowrap="nowrap"><strong>BILLING INFO</strong></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Suggested Contract Price</td>
                <td align="right" nowrap="nowrap"><span class="total20"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td nowrap="nowrap">Grounds Maintenance Contract</td>
                <td  align="right" nowrap="nowrap"><span id="grounds_maintenance_contract_formatted"></span><input type="hidden" id="Grounds_Maintenance_Contract" name="Grounds_Maintenance_Contract"></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Contract Adjustment</td>
                <td align="right" nowrap="nowrap"><span id="contract_adjustment_formatted"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td nowrap="nowrap">Irrigation Contract</td>
                <td  align="right" nowrap="nowrap"><span id="irrigation_contract_formatted"></span><input type="hidden" id="Irrigation_Contract" name="Irrigation_Contract"></td>
              </tr>
              <tr>
                <td nowrap="nowrap">Discount Adjustment</td>
                <td align="right" nowrap="nowrap"><span id="discount_adjustment_formatted"></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td nowrap="nowrap">&nbsp;</td>
                <td  align="right" nowrap="nowrap">&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap"><strong>Total Adjusted Contract Price</strong></td>
                <td align="right" nowrap="nowrap"><strong><span class="adjusted_contract_price_formatted"></span></strong><input type="hidden" id="adjusted_contract_price" name="adjusted_contract_price"></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td>Bill To Company</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_bill_to_company#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td align="right" nowrap="nowrap"></td>
                <td width="150" align="right" nowrap="nowrap"></td>
                <td>Billing Contact</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_billing_contact#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Total Labor</td>
                <td align="right" nowrap="nowrap"><span id="total_labor_formatted" class="total14"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td>Billing Contact Phone</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_billing_contact_phone#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Total Materials</td>
                <td align="right" nowrap="nowrap"><span id="total_materials_formatted"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td nowrap="nowrap">Billing Contact Email Address</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_billing_contact_email#</td>
              </tr>
              <tr>
                <td nowrap="nowrap"><strong>Total Direct Costs</strong></td>
                <td align="right" nowrap="nowrap"><strong><span id="total_direct_costs_formatted"></span></strong></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td align="right" nowrap="nowrap">&nbsp;</td>
                <td align="right" nowrap="nowrap">&nbsp;</td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td align="right" nowrap="nowrap"></td>
                <td width="150" align="right" nowrap="nowrap"></td>
                <td>Billing Address</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_address1#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Gross Profit</td>
                <td align="right" nowrap="nowrap"><span id="gross_profit_formatted"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td>Billing Address2</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_address2#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">OH Recovery (40%)</td>
                <td align="right" nowrap="nowrap"><span id="margin_formatted"></span></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td>Billing City </td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_city#</td>
              </tr>
              <tr>
                <td nowrap="nowrap"><strong>Operating Profit</strong></td>
                <td align="right" nowrap="nowrap"><strong><span id="operating_profit_formatted"></span></strong></td>
                <td width="150" align="right" nowrap="nowrap">&nbsp;</td>
                <td>Billing State</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_address_state#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">Operating Profit %</td>
                <td align="right" nowrap="nowrap"><span id="net_cash_flow_percentage_formatted"></span></td>
                <td align="right" nowrap="nowrap">&nbsp;</td>
                <td>Billing Zip</td>
                <td align="right" nowrap="nowrap">#get_quote_start.q_address_zip#</td>
              </tr>
              <tr>
                <td nowrap="nowrap">&nbsp;</td>
                <td  align="right" nowrap="nowrap">&nbsp;</td>
                <td width="150"  align="right" nowrap="nowrap">&nbsp;</td>
                <td>&nbsp;</td>
                <td  align="right" nowrap="nowrap">&nbsp;</td>
              </tr>
            </cfoutput>
            </cfoutput>
          </table>
          <p>&nbsp;</p></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td valign="top">
          <!---br />
          <br />
          <br />
          <br />
          <div class="container-buttons">
            <div class="left-buttons">
              <cfif get_quote_start.quote_approved EQ 1>
                  <cfoutput>
                      <font color=##00AA00><b>APPROVED #dateformat(get_quote_start.biz_approved_date,"mm/dd/yyyy")#</b></font>
                  </cfoutput>
              <cfelse>

              </cfif>
            </div>
          </div--->

          <cfquery name="get_quote_notes" datasource="jrgm">
               SELECT * FROM quote_notes qn
               INNER JOIN note_type nt ON nt.note_type=qn.note_type
               WHERE qn.opportunity_id_original=#url.ID#

            </cfquery>
            <cfif get_quote_notes.recordcount GT 0>
              <div class="page-title">
                <h3>&nbsp;&nbsp;&nbsp;Notes</h3>
              </div>
              <table class="table">
                <cfoutput query="get_quote_notes">
                  <tr>
                    <td><b>#note_name#</b>: #note_body#</td>
                  </tr>
                </cfoutput>
              </table>
            </cfif>
        </td>
      </tr>
    </table>
</div>
</div>
<!--Html-->
</div>
</div>

<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="../quoting-new/footer-include.cfm">
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
