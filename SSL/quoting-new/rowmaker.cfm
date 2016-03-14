<cfparam  name="Session.ride_mow_qty" default="0"  >
<cfparam  name="Session.ride_mow_cost" default="0">
<cfparam  name="Session.ride_mow_rate" default="0">
 <cfparam  name="Session.ride_mow_times" default="0">
 <cfparam  name="ride_mow_qty" default="0"  >
<cfparam  name="ride_mow_cost" default="0">
<cfparam  name="ride_mow_rate" default="0">
 <cfparam  name="ride_mow_times" default="0">




					  
                      
                      
                      
 <CFSET Session.ride_mow_service_rate = 11.50>  <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.ride_mow_qty  = get_service_info.ride_mow_qty > 
<cfset Session.ride_mow_cost  = get_service_info.ride_mow_cost>
<cfset Session.ride_mow_rate = get_service_info.ride_mow_rate> 
<cfset Session.ride_mow_hours  = Session.ride_mow_qty/Session.ride_mow_rate>
<cfset Session.ride_mow_actualprice  = Session.ride_mow_hours*Session.ride_mow_cost>
<cfset Session.ride_mow_materials_rate  = 0>
<cfset Session.ride_mow_service_materials  = Session.ride_mow_actualprice+Session.ride_mow_MATERIALS_rate >
<cfset Session.ride_mow_times  = get_service_info.ride_mow_times>
<cfset Session.ride_mow_actual_extended  = Session.ride_mow_times*Session.ride_mow_service_materials>
  
<cfset Session.ride_mow_total_hours = Session.ride_mow_hours*Session.ride_mow_times>
<cfset Session.ride_mow_overtime_adjustment = Session.ride_mow_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.ride_mow_contract_price = Session.ride_mow_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

   <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Ride Mow</td>
                        <td align="right" class="dstable_l3">
                          <input name="ride_mow_qty" type="text" id="ride_mow_qty"   size="8"   value="#Session.ride_mow_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.ride_mow_rate,"999,999")#</td>
                      <input type="hidden"  name="ride_mow_rate" value="#Session.ride_mow_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="ride_mow_rate" type="text" id="ride_mow_rate"   size="8"  value="#Session.ride_mow_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.ride_mow_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="ride_mow_times" type="text"   size="5" value="#Session.ride_mow_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.ride_mow_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.ride_mow_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
