<cfinclude template="../quoting-new/include_specsheet_mss.cfm">
<!---cfdump var="#current_quote_services_materials#">
<cfabort--->
<!--- ////////////////////////////////////////////////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ///////////////////////// CREATE HTML PAGE /////////////////////////// --->
<!--- /////////////////////////                  ///////////////////////////--->
<!--- ////////////////////////////////////////////////////////////////////// --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#get_quote_start.opportunity_name#</cfoutput>MAINTENANCE SERVICES SUMMARY</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"  media="all">
<link rel="stylesheet" href="css/styles-summary.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
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
      <td  align="right"> <cfoutput>#DateFormat(get_quote_start.date_quote_updated, "medium")#</cfoutput></td>
    </tr>
  </tbody>
</table>


<cfoutput>
<div id="outerfull">
<!--centre content goes here -->
<div class="container-fluid">
  <div class="contractTerms">
    <div class="row">
      <div align="center"><img src="images/logo_2016.png"  /></div>
      
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
              <td align="justify">JAMES RIVER GROUNDS MANAGEMENT, INC. SHALL PROVIDE THE FOLLOWING SERVICES AT <u>#get_quote_start.opportunity_name#</u>, LOCATED AT <u>#get_quote_start.q_address1#</u>, IN <u>#get_quote_start.q_city#, #get_quote_start.q_address_state#</u>. PLEASE REFER TO THE '<i>DEFINITION OF SERVICES</i>' <i>(Attachment B)</i> FOR MORE DETAILED SERVICE SPECIFICATIONS.</td>
            </tr>
          </table>

          <table width="80%" border="0" cellpadding="0" cellspacing="0" align="center">
              <tbody>
                  <cfset blank_count = 0>
                  <cfset contract_price_array = StructNew()>
                  <cfloop from="1" to="#arrayLen(quote_specsheet)#" index="i">
                    <cfset quote_data_entry_row_order_array = ListToArray(quote_specsheet[i][2])>
                    <cfset contract_price_ID = getRowID(quote_specsheet[i][1])>
                    <cfset StructInsert(contract_price_array, contract_price_ID, 0)>
                    <tr id="tr_#contract_price_ID#">
                      <td colspan="3" style="padding-top: 15px; padding-bottom: 0px; font-weight: bolder"><span style="color: ##3F9F3F !important"><b><u>#UCase(quote_specsheet[i][1])#</u></b><span id="contract_price_#contract_price_ID#"></span></span></td>
                    </tr>
                    <cfloop from="1" to="#arrayLen(quote_data_entry_row_order_array)#" index="ii">
                      <cfset current_row = quote_rows[quote_data_entry_row_order_array[ii]]>
                      <cfset row_ID = getRowID(current_row[1])>
                      <!---cfdump var="#quote_rows_cache[quote_data_entry_row_order_array[ii]]#">
                      <cfabort--->
                      <cfset row_column1 = current_row[3]><!---NUMBER OF TIMES--->

                      <cfset prefix = Replace(getRowID(current_row[3]), '_times', '', 'ALL')>
                      <cfif row_ID EQ 'blank_service'>
                          <cfset blank_count++>
                          <cfset prefix = 'blank' & blank_count>
                          <cfset row_ID = 'BlankService' & blank_count>
                          <cfset row_column2 = current_row[1]>
                      <cfelse>
                          <cfset row_column2 = quote_rows_cache[quote_data_entry_row_order_array[ii]][19]['row_defaultvalue']><!---NAME OF SERVICE--->
                      </cfif>

                      <cfif row_column2 EQ 'Spring Annuals'>
                          <cfset row_column2 = row_column2 & ' - ' & Round(current_quote_services_materials['Annuals_S_materials_qty'])>
                      <cfelseif row_column2 EQ 'Fall Annuals'>
                          <cfset row_column2 = row_column2 & ' - ' & Round(current_quote_services_materials['Annuals_F_materials_qty'])>
                      </cfif>
                       
                      <cfif row_ID NEQ 'TravelTime'>
                          <tr id="#row_ID#">
                            <td  width="25">&nbsp;</td>
                            <td><span class="price">#row_column1#</span></td>
                            <td>#row_column2#</td>
                            <td>&nbsp;</td>
                          </tr>
                      </cfif>

                      <cftry>
                        <cfset contract_price_array[contract_price_ID] += current_quote_main[prefix & '_contract_price']>
                        <cfcatch></cfcatch>
                      </cftry>

                    </cfloop>

                  </cfloop>
              </tbody>
          </table>
          <br />
</cfoutput>
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
          <br />
          <br />
          <br />
          <br />
          <table width="95%" border="0" align="center" >
            <tr>
                <td>Client Initial: <u>____________________</u></td>
                <td align="right">Date: <u>____________________</u></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!-- to clear footer --> 
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
                    <cfif row_ID NEQ 'spanidblankservicespan' AND row_ID NEQ 'spanidblankmaterialspan'>
                        <cfoutput>
                            try
                            {
                                if (document.getElementById(#SQL_field#).innerHTML*1 == 0)
                                    document.getElementById('#row_ID#').style.display = 'none';
                            }
                            catch(ob){}
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

            <!---HIDE EMPTY CATEGORIES--->
            <cfoutput>
                <cfloop from="1" to="#arrayLen(quote_specsheet)#" index="i">
                    <cfset contract_price_ID = getRowID(quote_specsheet[i][1])>

                    <cftry>
                        <cfif contract_price_array[contract_price_ID] EQ 0>
                            try
                            {
                                document.getElementById('tr_#contract_price_ID#').style.display = 'none';
                            }
                            catch(ob){}
                        </cfif>
                    <cfcatch></cfcatch>
                    </cftry>
                </cfloop>
            </cfoutput>

            <!---APPLY CONTRACT PRICE SUMS TO ALL SERVICE LINES--->
            if (confirm('Press OK to show prices.  Press Cancel to keep prices hidden.  (Refresh this page to show this choice again at any time.)'))
            {
                <cfoutput>
                <cfloop from="1" to="#arrayLen(quote_specsheet)#" index="i">
                    <cfset contract_price_ID = getRowID(quote_specsheet[i][1])>

                    <cftry>
                        <cfset contract_price = contract_price_array[contract_price_ID]>
                            try
                            {
                                if (document.getElementById('contract_price_#contract_price_ID#') && #contract_price_array[contract_price_ID]# > 0)
                                    document.getElementById('contract_price_#contract_price_ID#').innerHTML = ' - '+formatDollars('#contract_price_array[contract_price_ID]#');
                            }
                            catch(ob){}
                    <cfcatch></cfcatch>
                    </cftry>
                </cfloop>
                </cfoutput>
            }
        });
    }
  </script>

</body>
</html>
