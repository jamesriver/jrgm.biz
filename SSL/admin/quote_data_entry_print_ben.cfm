<cfif !IsDefined('url.ID')>
    FAILED - no ID detected
    <cfabort>
</cfif>
<cfif url.ID EQ ''>
    FAILED - no ID detected
    <cfabort>
</cfif>

<cfinclude template="include_sql_quote_data_entry_calculations.cfm">

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
    <div class="left-table2"> <cfoutput query="get_quote_start">
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
    <div class="right-table2"> <cfoutput query="get_quote_start">
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

  <!--- BEGIN OUTPUT --->
    <table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
          <table class="table" cellpadding="5" cellspacing="0">
            <thead>
             <tr>
               <th colspan="2"   align="left" bgcolor="#FFFFFF"  bordercolor="#000000">&nbsp;<strong class="headbig">Service</strong></th>
               <th colspan="5" align="center"  bgcolor="#FFFFFF"><strong class="headbig">Labor</strong></th>
               <th colspan="5" align="center" bgcolor="#FFFFFF"><strong class="headbig">Materials</strong></th>
               <th width="25">&nbsp;</th>
               <th colspan="7" align="center" bgcolor="#FFFFFF"><strong class="headbig">Totals</strong></th>
             </tr>
              <tr bgcolor="#EDF3F8">
                  <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                      <th align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><cfoutput>#quote_column_headers[i].column_name#</cfoutput></th>
                      <cfif i EQ 9>
                          <th align="left"><-Formula</th>
                      </cfif>
                  </cfloop>
              </tr>
            </thead>
            <tbody>
              <tr>
                  <td align="right" colspan="<cfoutput>#(total_columns+3)#</cfoutput>"><!--i>Profit Margin must be greater than 50%</i--></td>
                  <td align="right"><input id="gross_margin" name="gross_margin" oninput="apply_profit_margin(this.value)" size="6" value="<cfoutput>#get_quote_main.gross_margin#</cfoutput>"></td>
                  <td align="left">&nbsp;</td>
              </tr>
              <cfset alternator = 1>
              <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                  <cfset quote_row_index = row_order_array[wrapi]>
                  <cfset tr_class = (alternator % 2?' bgcolor="##e5e5e5"':'')>
                  <cfset alternator = 1-alternator>
                  <tr <cfoutput>#tr_class#</cfoutput>>
                      <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                          <cfset current_row = quote_rows[quote_row_index][i]>
                          <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                          <cfif current_row.row_active EQ 1>
                              <td align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>">
                                  <cfif current_column.ID EQ 20>
                                      <cfoutput><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                                      <cfoutput><input class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field# subtotal<cfoutput>#current_row.row_order#</cfoutput> totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" type="hidden" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#"></cfoutput>
                                  <cfelse>
                                      <cfif current_row.quote_services_field NEQ ''>
                                          <cfif (current_column.column_editable EQ 1 AND (current_column.ID NEQ 18 OR current_row.row_defaultvalue NEQ 40)) OR (current_row.row_order GT 55 AND (current_column.ID EQ 1 OR current_column.ID EQ 3 OR current_column.ID EQ 4 OR current_column.ID EQ 6))>
                                              <cfoutput><input class="column<cfoutput>#current_column.ID#</cfoutput>" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" oninput="recalculate_row<cfoutput>#quote_row_index#</cfoutput>(); recalculate_totals();" /></cfoutput>
                                          <cfelse>
                                              <cfoutput><input disabled="true" class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field#" type="text" size="6" value="#current_row.row_defaultvalue#" /></cfoutput>
                                              <cfoutput><input type="hidden" class="column<cfoutput>#current_column.ID#</cfoutput> #current_row.quote_services_field# totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" id="#current_row.quote_services_field#" name="#current_row.quote_services_field#" value="#current_row.row_defaultvalue#" /></cfoutput>
                                          </cfif>
                                      <cfelse>
                                          <cfoutput><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#">#current_row.row_defaultvalue#</span></cfoutput>
                                          <cfoutput><input class="column<cfoutput>#current_column.ID#</cfoutput> totaltype_<cfoutput>#current_row.row_totaltype#</cfoutput>" type="hidden" id="row#current_row.ID#_numeric" value="#current_row.row_defaultvalue#"></cfoutput>
                                      </cfif>
                                  </cfif>
                              </td>
                          <cfelse>
                              <cfoutput><td align="<cfoutput>#quote_column_headers[i].column_displayalign#</cfoutput>"><span class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#"></span></td></cfoutput>
                              <cfoutput><input type="hidden" class="column<cfoutput>#current_column.ID#</cfoutput>" id="row#current_row.ID#_numeric" value="0"></td></cfoutput>
                          </cfif>
                          <cfif current_column.ID EQ 9>
                              <cfoutput><td align="left">#Replace(current_row.row_formula, '[2]', '[Qty/SqFt]', 'ALL')#</td></cfoutput>
                          </cfif>
                      </cfloop>
                  </tr>
              </cfloop>
              <tr bgcolor="#EDF3F8">
                  <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                          <cfset current_column = quote_column_headers[i]>
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
                                          Seasonal Hours
                                      </th>
                                      <th></th>
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
                      </th>
                  </cfloop>
              </tr>
              <cfoutput>
              <tr>
                  <td align="right" colspan="#total_columns#">&nbsp;</td>
                  <td align="right" colspan="4"><a href="quote_notes.cfm?opportunity_id_original=#url.id#&opportunity_id=#url.id#&note_type=5"><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp; <strong>Contract Adjustment</strong></td>
                  <td align="left">
                    <input id="contract_adjustment" name="contract_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
              </tr>
              <tr>
                  <td align="left" colspan="#total_columns#">
                      <table>
                          <tr>
                              <td>Turf Sq. Footage:&nbsp;</td>
                              <td><input  name="turf_sqft"  type="text" size="5"  value="#get_quote_main.turf_sqft#" /></td>
                              <td width="100">&nbsp;</td>
                              <td>Bed Sq. Footage:&nbsp;</td>
                              <td><input  name="bed_sqft"  type="text" size="5"  value="#get_quote_main.bed_sqft#" /></td>
                              <td width="100">&nbsp;</td>
                          </tr>
                      </table>
                  </td>
                  <td align="right" colspan="4"><a href="quote_notes.cfm?opportunity_id_original=#url.id#&opportunity_id=#url.id#&note_type=6"><i class="fa fa-file-text mysize font-blue">&nbsp;Note</i></a>&nbsp;&nbsp;&nbsp; <strong>Discount Adjustment</strong></td>
                  <td align="left">
                    <input id="discount_adjustment" name="discount_adjustment" type="text" class="noMargin"  size="6" oninput="recalculate_totals()" /></td>
              </tr>
              <tr bgcolor="##EDF3F8" style="font-weight: bold">
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

    <cfinclude template="include_js_quote_data_entry_calculations.cfm">
  <!--- END OUTPUT --->

  <table width="98%" border="0" cellspacing="0" cellpadding="0" >
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
  </table>
  <cfquery name="get_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  opportunity_id_original=#url.ID#
 </cfquery>
  <cfif get_quote_notes.recordcount GT 0>
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
  </cfif>
</div>
</div>
<!--Html-->
</div>
</div>

<cfinclude template="include_js_quote_data_entry_calculations.cfm">

<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<!---cfinclude template="footer-include.cfm"--->
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
