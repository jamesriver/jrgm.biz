<!--- When quote is first started need to insert push_mow_rate,push_mow_cost from quoting_services TABLE
For all services  --->



 

<cfparam  name="Session.gross_margin" default="52"  >
<cfparam  name="gross_margin" default="52"  >

<cfparam  name="Session.push_mow_qty" default="0"  >
<cfparam  name="Session.push_mow_cost" default="0">
<cfparam  name="Session.push_mow_rate" default="0">
 <cfparam  name="Session.push_mow_times" default="0">
 <cfparam  name="push_mow_qty" default="0"  >
<cfparam  name="push_mow_cost" default="0">
<cfparam  name="push_mow_rate" default="0">
 <cfparam  name="push_mow_times" default="0">
 
  
 <cfparam  name="Session.walk_behind_qty" default="0"  >
<cfparam  name="Session.walk_behind_cost" default="0">
<cfparam  name="Session.walk_behind_rate" default="0">
 <cfparam  name="Session.walk_behind_times" default="0">
 <cfparam  name="walk_behind_qty" default="0"  >
<cfparam  name="walk_behind_cost" default="0">
<cfparam  name="walk_behind_rate" default="0">
 <cfparam  name="walk_behind_times" default="0">
 
 
 <cfparam  name="Session.ride_mow_qty" default="0"  >
<cfparam  name="Session.ride_mow_cost" default="0">
<cfparam  name="Session.ride_mow_rate" default="0">
 <cfparam  name="Session.ride_mow_times" default="0">
 <cfparam  name="ride_mow_qty" default="0"  >
<cfparam  name="ride_mow_cost" default="0">
<cfparam  name="ride_mow_rate" default="0">
 <cfparam  name="ride_mow_times" default="0">
 
 <cfparam  name="Session.hard_edge_qty" default="0"  >
<cfparam  name="Session.hard_edge_cost" default="0">
<cfparam  name="Session.hard_edge_rate" default="0">
 <cfparam  name="Session.hard_edge_times" default="0">
 <cfparam  name="hard_edge_qty" default="0"  >
<cfparam  name="hard_edge_cost" default="0">
<cfparam  name="hard_edge_rate" default="0">
 <cfparam  name="hard_edge_times" default="0">
 
 
<cfparam  name="Session.bed_edge_qty" default="0"  >
<cfparam  name="Session.bed_edge_cost" default="0">
<cfparam  name="Session.bed_edge_rate" default="0">
 <cfparam  name="Session.bed_edge_times" default="0">
 <cfparam  name="bed_edge_qty" default="0"  >
<cfparam  name="bed_edge_cost" default="0">
<cfparam  name="bed_edge_rate" default="0">
 <cfparam  name="bed_edge_times" default="0">

 
<cfparam  name="Session.trimo_qty" default="0"  >
<cfparam  name="Session.trimo_cost" default="0">
<cfparam  name="Session.trimo_rate" default="0">
 <cfparam  name="Session.trimo_times" default="0">
 <cfparam  name="trimo_qty" default="0"  >
<cfparam  name="trimo_cost" default="0">
<cfparam  name="trimo_rate" default="0">
 <cfparam  name="trimo_times" default="0">

<cfparam  name="Session.trims_qty" default="0"  >
<cfparam  name="Session.trims_cost" default="0">
<cfparam  name="Session.trims_rate" default="0">
 <cfparam  name="Session.trims_times" default="0">
 <cfparam  name="trims_qty" default="0"  >
<cfparam  name="trims_cost" default="0">
<cfparam  name="trims_rate" default="0">
 <cfparam  name="trims_times" default="0">
 
 
 <cfparam  name="Session.spraying_qty" default="0"  >
<cfparam  name="Session.spraying_cost" default="0">
<cfparam  name="Session.spraying_rate" default="0">
 <cfparam  name="Session.spraying_times" default="0">
 <cfparam  name="Session.spraying_materials_qty" default="0">
  <cfparam  name="Session.spraying_MATERIALS_RATE" default="0">
<cfparam  name="spraying_qty" default="0"  >
<cfparam  name="spraying_cost" default="0">
<cfparam  name="spraying_rate" default="0">
 <cfparam  name="spraying_times" default="0">
 <cfparam  name="spraying_materials_qty" default="0">
   <cfparam  name="spraying_MATERIALS_RATE" default="0">
 
 
<cfparam  name="Session.weeding_qty" default="0"  >
<cfparam  name="Session.weeding_cost" default="0">
<cfparam  name="Session.weeding_rate" default="0">
 <cfparam  name="Session.weeding_times" default="0">
 <cfparam  name="weeding_qty" default="0"  >
<cfparam  name="weeding_cost" default="0">
<cfparam  name="weeding_rate" default="0">
 <cfparam  name="weeding_times" default="0">


<cfparam  name="Session.blowing_qty" default="0"  >
<cfparam  name="Session.blowing_cost" default="0">
<cfparam  name="Session.blowing_rate" default="0">
 <cfparam  name="Session.blowing_times" default="0">
 <cfparam  name="blowing_qty" default="0"  >
<cfparam  name="blowing_cost" default="0">
<cfparam  name="blowing_rate" default="0">
 <cfparam  name="blowing_times" default="0">

<cfparam  name="Session.trashs_qty" default="0"  >
<cfparam  name="Session.trashs_cost" default="0">
<cfparam  name="Session.trashs_rate" default="0">
 <cfparam  name="Session.trashs_times" default="0">
 <cfparam  name="trashs_qty" default="0"  >
<cfparam  name="trashs_cost" default="0">
<cfparam  name="trashs_rate" default="0">
 <cfparam  name="trashs_times" default="0">


<cfparam  name="Session.traveltime_qty" default="0"  >
<cfparam  name="Session.traveltime_cost" default="0">
<cfparam  name="Session.traveltime_rate" default="0">
 <cfparam  name="Session.traveltime_times" default="0">
 <cfparam  name="traveltime_qty" default="0"  >
<cfparam  name="traveltime_cost" default="0">
<cfparam  name="traveltime_rate" default="0">
 <cfparam  name="traveltime_times" default="0">


<cfparam  name="Session.trasho_qty" default="0"  >
<cfparam  name="Session.trasho_cost" default="0">
<cfparam  name="Session.trasho_rate" default="0">
 <cfparam  name="Session.trasho_times" default="0">
 <cfparam  name="trasho_qty" default="0"  >
<cfparam  name="trasho_cost" default="0">
<cfparam  name="trasho_rate" default="0">
 <cfparam  name="trasho_times" default="0">




<cfparam  name="Session.leafrem_qty" default="0"  >
<cfparam  name="Session.leafrem_cost" default="0">
<cfparam  name="Session.leafrem_rate" default="0">
 <cfparam  name="Session.leafrem_times" default="0">
 <cfparam  name="leafrem_qty" default="0"  >
<cfparam  name="leafrem_cost" default="0">
<cfparam  name="leafrem_rate" default="0">
 <cfparam  name="leafrem_times" default="0">





<cfparam  name="Session.cleanup_qty" default="0"  >
<cfparam  name="Session.cleanup_cost" default="0">
<cfparam  name="Session.cleanup_rate" default="0">
 <cfparam  name="Session.cleanup_times" default="0">
 <cfparam  name="cleanup_qty" default="0"  >
<cfparam  name="cleanup_cost" default="0">
<cfparam  name="cleanup_rate" default="0">
 <cfparam  name="cleanup_times" default="0">






 <cfparam  name="Session.turf_preg_qty" default="0"  >
<cfparam  name="Session.turf_preg_cost" default="0">
<cfparam  name="Session.turf_preg_rate" default="0">
 <cfparam  name="Session.turf_preg_times" default="0">
 <cfparam  name="Session.turf_preg_materials_qty" default="0">
  <cfparam  name="Session.TURF_PREG_MATERIALS_RATE" default="0">
<cfparam  name="turf_preg_qty" default="0"  >
<cfparam  name="turf_preg_cost" default="0">
<cfparam  name="turf_preg_rate" default="0">
 <cfparam  name="turf_preg_times" default="0">
 <cfparam  name="turf_preg_materials_qty" default="0">
   <cfparam  name="TURF_PREG_MATERIALS_RATE" default="0">
 
 


 

 <cfif IsDefined("form.btnSumit")  > 
 
<cfquery name="do_update_quote" datasource="jrgm">
UPDATE quote_main SET 
gross_margin = '#gross_margin#'
WHERE ID = 1
</cfquery>

<cfquery name="do_update_services" datasource="jrgm">
UPDATE quote_services SET 
push_mow_qty = '#push_mow_qty#', 
push_mow_times =  '#push_mow_times#',
push_mow_rate = '#push_mow_rate#',
walk_behind_qty = '#walk_behind_qty#', 
walk_behind_times =  '#walk_behind_times#',
walk_behind_rate = '#walk_behind_rate#',
ride_mow_qty = '#ride_mow_qty#', 
ride_mow_times =  '#ride_mow_times#',
ride_mow_rate = '#ride_mow_rate#',

  hard_edge_qty = '#hard_edge_qty#', 
hard_edge_times =  '#hard_edge_times#',
hard_edge_rate = '#hard_edge_rate#',

bed_edge_qty = '#bed_edge_qty#', 
bed_edge_times =  '#bed_edge_times#',
bed_edge_rate = '#bed_edge_rate#',
 
  trimo_qty = '#TRIM(trimo_qty)#', 
trimo_times =  '#trimo_times#',
trimo_rate = '#trimo_rate#',


 trims_qty = '#trims_qty#', 
trims_times =  '#trims_times#',
trims_rate = '#trims_rate#',
 
 
 spraying_qty = '#spraying_qty#', 
spraying_times =  '#spraying_times#',
spraying_rate = '#spraying_rate#',  
 
 weeding_qty = '#weeding_qty#', 
weeding_times =  '#weeding_times#',
weeding_rate = '#weeding_rate#',
 
 blowing_qty = '#blowing_qty#', 
blowing_times =  '#blowing_times#',
blowing_rate = '#blowing_rate#', 

  trashs_qty = '#trashs_qty#', 
trashs_times =  '#trashs_times#',
trashs_rate = '#trashs_rate#',
 
 
 traveltime_qty = '#traveltime_qty#', 
traveltime_times =  '#traveltime_times#',
traveltime_rate = '#traveltime_rate#',

  trasho_qty = '#trasho_qty#', 
trasho_times =  '#trasho_times#',
trasho_rate = '#trasho_rate#',
 
   leafrem_qty = '#leafrem_qty#', 
leafrem_times =  '#leafrem_times#',
leafrem_rate = '#leafrem_rate#',

cleanup_qty = '#cleanup_qty#', 
cleanup_times =  '#cleanup_times#',
cleanup_rate = '#cleanup_rate#', 
 

turf_preg_qty = '#turf_preg_qty#', 
turf_preg_times =  '#turf_preg_times#',
turf_preg_rate =  '#turf_preg_rate#'
WHERE quote_ID = 1
</cfquery>


<cfquery name="do_update_materials" datasource="jrgm">
UPDATE quote_materials SET 
turf_preg_materials_qty = '#turf_preg_materials_qty#', turf_preg_materials_rate = '#turf_preg_materials_rate#'  ,
spraying_materials_qty = '#spraying_materials_qty#', spraying_materials_rate = '#spraying_materials_rate#'  
WHERE quote_ID = 1
</cfquery>



</cfif>
 
 


 <cfquery name="get_quote_main" datasource="jrgm">
SELECT * FROM quote_main  WHERE  ID  =1
</cfquery>



<cfquery name="get_service_info" datasource="jrgm">
SELECT * FROM quote_services   WHERE quote_id  =1
</cfquery>


<cfquery name="get_materials_info" datasource="jrgm">
SELECT * FROM quote_materials  WHERE quote_id  =1
</cfquery>



<CFSET Session.overtime_adjustment_rate = 1.10>
<CFSET Session.gross_margin = get_quote_main.gross_margin>
<CFSET Session.gross_margin_diff = (100-Session.gross_margin)/100>

<!------------------------------------------------------------------------------------------------------------->

<!--- <CFSET Session.push_mow_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.push_mow_qty  = get_service_info.push_mow_qty > 
<cfset Session.push_mow_cost  = get_service_info.push_mow_cost>
<cfset Session.push_mow_rate = get_service_info.push_mow_rate> 
<cfset Session.push_mow_hours  = Session.push_mow_qty/Session.push_mow_rate>
<cfset Session.push_mow_actualprice  = Session.push_mow_hours*Session.push_mow_cost>
<cfset Session.push_mow_MATERIALS_rate  = 0>
<cfset Session.push_mow_service_materials  = Session.push_mow_actualprice+Session.push_mow_MATERIALS_rate >
<cfset Session.push_mow_times  = get_service_info.push_mow_times>
<cfset Session.push_mow_actual_extended  = Session.push_mow_times*Session.push_mow_service_materials>
  
<cfset Session.push_mow_total_hours = Session.push_mow_hours*Session.push_mow_times>
<cfset Session.push_mow_overtime_adjustment = Session.push_mow_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.push_mow_contract_price = Session.push_mow_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

<!---  <CFSET Session.walk_behind_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.walk_behind_qty  = get_service_info.walk_behind_qty > 
<cfset Session.walk_behind_cost  = get_service_info.walk_behind_cost>
<cfset Session.walk_behind_rate = get_service_info.walk_behind_rate> 
<cfset Session.walk_behind_hours  = Session.walk_behind_qty/Session.walk_behind_rate>
<cfset Session.walk_behind_actualprice  = Session.walk_behind_hours*Session.walk_behind_cost>
<cfset Session.walk_behind_materials_rate  = 0>
<cfset Session.walk_behind_service_materials  = Session.walk_behind_actualprice+Session.walk_behind_MATERIALS_rate >
<cfset Session.walk_behind_times  = get_service_info.walk_behind_times>
<cfset Session.walk_behind_actual_extended  = Session.walk_behind_times*Session.walk_behind_service_materials>
  
<cfset Session.walk_behind_total_hours = Session.walk_behind_hours*Session.walk_behind_times>
<cfset Session.walk_behind_overtime_adjustment = Session.walk_behind_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.walk_behind_contract_price = Session.walk_behind_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->



<!--- <CFSET Session.ride_mow_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
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

<!---  <CFSET Session.hard_edge_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.hard_edge_qty  = get_service_info.hard_edge_qty > 
<cfset Session.hard_edge_cost  = get_service_info.hard_edge_cost>
<cfset Session.hard_edge_rate = get_service_info.hard_edge_rate> 
<cfset Session.hard_edge_hours  = Session.hard_edge_qty/Session.hard_edge_rate>
<cfset Session.hard_edge_actualprice  = Session.hard_edge_hours*Session.hard_edge_cost>
<cfset Session.hard_edge_materials_rate  = 0>
<cfset Session.hard_edge_service_materials  = Session.hard_edge_actualprice+Session.hard_edge_MATERIALS_rate >
<cfset Session.hard_edge_times  = get_service_info.hard_edge_times>
<cfset Session.hard_edge_actual_extended  = Session.hard_edge_times*Session.hard_edge_service_materials>
  
<cfset Session.hard_edge_total_hours = Session.hard_edge_hours*Session.hard_edge_times>
<cfset Session.hard_edge_overtime_adjustment = Session.hard_edge_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.hard_edge_contract_price = Session.hard_edge_overtime_adjustment / Session.gross_margin_diff>

<!------------------------------------------------------------------------------------------------------------->

                      
<!---  <CFSET Session.bed_edge_service_rate = 11.50> --->  <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.bed_edge_qty  = get_service_info.bed_edge_qty > 
<cfset Session.bed_edge_cost  = get_service_info.bed_edge_cost>
<cfset Session.bed_edge_rate = get_service_info.bed_edge_rate> 
<cfset Session.bed_edge_hours  = Session.bed_edge_qty/Session.bed_edge_rate>
<cfset Session.bed_edge_actualprice  = Session.bed_edge_hours*Session.bed_edge_cost>
<cfset Session.bed_edge_materials_rate  = 0>
<cfset Session.bed_edge_service_materials  = Session.bed_edge_actualprice+Session.bed_edge_MATERIALS_rate >
<cfset Session.bed_edge_times  = get_service_info.bed_edge_times>
<cfset Session.bed_edge_actual_extended  = Session.bed_edge_times*Session.bed_edge_service_materials>
  
<cfset Session.bed_edge_total_hours = Session.bed_edge_hours*Session.bed_edge_times>
<cfset Session.bed_edge_overtime_adjustment = Session.bed_edge_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.bed_edge_contract_price = Session.bed_edge_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

<!--- <CFSET Session.trimo_service_rate = 11.50>   ---><!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.trimo_qty  = get_service_info.trimo_qty > 
<cfset Session.trimo_cost  = get_service_info.trimo_cost>
<cfset Session.trimo_rate = get_service_info.trimo_rate> 
<cfset Session.trimo_hours  = Session.trimo_qty/Session.trimo_rate>
<cfset Session.trimo_actualprice  = Session.trimo_hours*Session.trimo_cost>
<cfset Session.trimo_materials_rate  = 0>
<cfset Session.trimo_service_materials  = Session.trimo_actualprice+Session.trimo_MATERIALS_rate >
<cfset Session.trimo_times  = get_service_info.trimo_times>
<cfset Session.trimo_actual_extended  = Session.trimo_times*Session.trimo_service_materials>
  
<cfset Session.trimo_total_hours = Session.trimo_hours*Session.trimo_times>
<cfset Session.trimo_overtime_adjustment = Session.trimo_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.trimo_contract_price = Session.trimo_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->


<!---  <CFSET Session.trims_service_rate = 11.50> --->  <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.trims_qty  = get_service_info.trims_qty > 
<cfset Session.trims_cost  = get_service_info.trims_cost>
<cfset Session.trims_rate = get_service_info.trims_rate> 
<cfset Session.trims_hours  = Session.trims_qty/Session.trims_rate>
<cfset Session.trims_actualprice  = Session.trims_hours*Session.trims_cost>
<cfset Session.trims_materials_rate  = 0>
<cfset Session.trims_service_materials  = Session.trims_actualprice+Session.trims_MATERIALS_rate >
<cfset Session.trims_times  = get_service_info.trims_times>
<cfset Session.trims_actual_extended  = Session.trims_times*Session.trims_service_materials>
  
<cfset Session.trims_total_hours = Session.trims_hours*Session.trims_times>
<cfset Session.trims_overtime_adjustment = Session.trims_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.trims_contract_price = Session.trims_overtime_adjustment / Session.gross_margin_diff>

<!------------------------------------------------------------------------------------------------------------->
<!--- <CFSET Session.spraying_service_rate = 11.50>  ---> <!--- Get this from services rate table ---> <!--- It would  be inserted when quote is started --->
<cfset Session.spraying_qty  = get_service_info.spraying_qty > 
<cfset Session.spraying_cost  = get_service_info.spraying_cost>
 <cfset Session.spraying_rate = get_service_info.spraying_rate> 
 <cfset Session.spraying_hours  = Session.spraying_qty/Session.spraying_rate>
 <cfset Session.spraying_actualprice  = Session.spraying_hours*Session.spraying_cost>
 <cfset Session.spraying_materials_rate  = get_materials_info.spraying_materials_rate> <!--- Get this from materials rate table ---> <!--- It would  be inserted when quote is started --->
 <cfset Session.spraying_materials_qty = get_materials_info.spraying_materials_qty> 
 <cfset Session.spraying_materials_actualprice = Session.spraying_MATERIALS_rate*Session.spraying_materials_qty>
  <cfset Session.spraying_service_materials  = Session.spraying_actualprice+Session.spraying_materials_actualprice >
 <cfset Session.spraying_times  = get_service_info.spraying_times>
  <cfset Session.spraying_actual_extended  = Session.spraying_times*Session.spraying_service_materials>
  <cfset Session.spraying_total_hours =  Session.spraying_hours *Session.spraying_times>
 <cfset Session.spraying_overtime_adjustment = Session.spraying_actual_extended* Session.overtime_adjustment_rate>
 <cfset Session.spraying_contract_price = Session.spraying_overtime_adjustment / Session.gross_margin_diff>
 <!------------------------------------------------------------------------------------------------------------->

<!--- <CFSET Session.weeding_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.weeding_qty  = get_service_info.weeding_qty > 
<cfset Session.weeding_cost  = get_service_info.weeding_cost>
<cfset Session.weeding_rate = get_service_info.weeding_rate> 
<cfset Session.weeding_hours  = Session.weeding_qty/Session.weeding_rate>
<cfset Session.weeding_actualprice  = Session.weeding_hours*Session.weeding_cost>
<cfset Session.weeding_materials_rate  = 0>
<cfset Session.weeding_service_materials  = Session.weeding_actualprice+Session.weeding_MATERIALS_rate >
<cfset Session.weeding_times  = get_service_info.weeding_times>
<cfset Session.weeding_actual_extended  = Session.weeding_times*Session.weeding_service_materials>
  
<cfset Session.weeding_total_hours = Session.weeding_hours*Session.weeding_times>
<cfset Session.weeding_overtime_adjustment = Session.weeding_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.weeding_contract_price = Session.weeding_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
<!---  <CFSET Session.blowing_service_rate = 11.50>  ---> <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.blowing_qty  = get_service_info.blowing_qty > 
<cfset Session.blowing_cost  = get_service_info.blowing_cost>
<cfset Session.blowing_rate = get_service_info.blowing_rate> 
<cfset Session.blowing_hours  = Session.blowing_qty/Session.blowing_rate>
<cfset Session.blowing_actualprice  = Session.blowing_hours*Session.blowing_cost>
<cfset Session.blowing_materials_rate  = 0>
<cfset Session.blowing_service_materials  = Session.blowing_actualprice+Session.blowing_MATERIALS_rate >
<cfset Session.blowing_times  = get_service_info.blowing_times>
<cfset Session.blowing_actual_extended  = Session.blowing_times*Session.blowing_service_materials>
  
<cfset Session.blowing_total_hours = Session.blowing_hours*Session.blowing_times>
<cfset Session.blowing_overtime_adjustment = Session.blowing_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.blowing_contract_price = Session.blowing_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->
  <CFSET Session.trashs_service_rate = 11.50>  <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.trashs_qty  = get_service_info.trashs_qty > 
<cfset Session.trashs_cost  = get_service_info.trashs_cost>
<cfset Session.trashs_rate = get_service_info.trashs_rate> 
<cfset Session.trashs_hours  = Session.trashs_qty/Session.trashs_rate>
<cfset Session.trashs_actualprice  = Session.trashs_hours*Session.trashs_cost>
<cfset Session.trashs_materials_rate  = 0>
<cfset Session.trashs_service_materials  = Session.trashs_actualprice+Session.trashs_MATERIALS_rate >
<cfset Session.trashs_times  = get_service_info.trashs_times>
<cfset Session.trashs_actual_extended  = Session.trashs_times*Session.trashs_service_materials>
  
<cfset Session.trashs_total_hours = Session.trashs_hours*Session.trashs_times>
<cfset Session.trashs_overtime_adjustment = Session.trashs_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.trashs_contract_price = Session.trashs_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

   <CFSET Session.traveltime_service_rate = 11.50>  <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.traveltime_qty  = get_service_info.traveltime_qty > 
<cfset Session.traveltime_cost  = get_service_info.traveltime_cost>
<cfset Session.traveltime_rate = get_service_info.traveltime_rate> 
<cfset Session.traveltime_hours  = Session.traveltime_qty/Session.traveltime_rate>
<cfset Session.traveltime_actualprice  = Session.traveltime_hours*Session.traveltime_cost>
<cfset Session.traveltime_materials_rate  = 0>
<cfset Session.traveltime_service_materials  = Session.traveltime_actualprice+Session.traveltime_MATERIALS_rate >
<cfset Session.traveltime_times  = get_service_info.traveltime_times>
<cfset Session.traveltime_actual_extended  = Session.traveltime_times*Session.traveltime_service_materials>
  
<cfset Session.traveltime_total_hours = Session.traveltime_hours*Session.traveltime_times>
<cfset Session.traveltime_overtime_adjustment = Session.traveltime_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.traveltime_contract_price = Session.traveltime_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

   <CFSET Session.trasho_service_rate = 11.50>   <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.trasho_qty  = get_service_info.trasho_qty > 
<cfset Session.trasho_cost  = get_service_info.trasho_cost>
<cfset Session.trasho_rate = get_service_info.trasho_rate> 
<cfset Session.trasho_hours  = Session.trasho_qty/Session.trasho_rate>
<cfset Session.trasho_actualprice  = Session.trasho_hours*Session.trasho_cost>
<cfset Session.trasho_materials_rate  = 0>
<cfset Session.trasho_service_materials  = Session.trasho_actualprice+Session.trasho_MATERIALS_rate >
<cfset Session.trasho_times  = get_service_info.trasho_times>
<cfset Session.trasho_actual_extended  = Session.trasho_times*Session.trasho_service_materials>
  
<cfset Session.trasho_total_hours = Session.trasho_hours*Session.trasho_times>
<cfset Session.trasho_overtime_adjustment = Session.trasho_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.trasho_contract_price = Session.trasho_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

   <CFSET Session.leafrem_service_rate = 11.50>    <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.leafrem_qty  = get_service_info.leafrem_qty > 
<cfset Session.leafrem_cost  = get_service_info.leafrem_cost>
<cfset Session.leafrem_rate = get_service_info.leafrem_rate> 
<cfset Session.leafrem_hours  = Session.leafrem_qty/Session.leafrem_rate>
<cfset Session.leafrem_actualprice  = Session.leafrem_hours*Session.leafrem_cost>
<cfset Session.leafrem_materials_rate  = 0>
<cfset Session.leafrem_service_materials  = Session.leafrem_actualprice+Session.leafrem_MATERIALS_rate >
<cfset Session.leafrem_times  = get_service_info.leafrem_times>
<cfset Session.leafrem_actual_extended  = Session.leafrem_times*Session.leafrem_service_materials>
  
<cfset Session.leafrem_total_hours = Session.leafrem_hours*Session.leafrem_times>
<cfset Session.leafrem_overtime_adjustment = Session.leafrem_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.leafrem_contract_price = Session.leafrem_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->

   <CFSET Session.cleanup_service_rate = 11.50>    <!--- Get this from services rate table ---><!--- It would  be inserted when quote is started --->
<cfset Session.cleanup_qty  = get_service_info.cleanup_qty > 
<cfset Session.cleanup_cost  = get_service_info.cleanup_cost>
<cfset Session.cleanup_rate = get_service_info.cleanup_rate> 
<cfset Session.cleanup_hours  = Session.cleanup_qty/Session.cleanup_rate>
<cfset Session.cleanup_actualprice  = Session.cleanup_hours*Session.cleanup_cost>
<cfset Session.cleanup_materials_rate  = 0>
<cfset Session.cleanup_service_materials  = Session.cleanup_actualprice+Session.cleanup_MATERIALS_rate >
<cfset Session.cleanup_times  = get_service_info.cleanup_times>
<cfset Session.cleanup_actual_extended  = Session.cleanup_times*Session.cleanup_service_materials>
  
<cfset Session.cleanup_total_hours = Session.cleanup_hours*Session.cleanup_times>
<cfset Session.cleanup_overtime_adjustment = Session.cleanup_actual_extended* Session.overtime_adjustment_rate>
<cfset Session.cleanup_contract_price = Session.cleanup_overtime_adjustment / Session.gross_margin_diff>
<!------------------------------------------------------------------------------------------------------------->



<!--- <CFSET Session.turf_preg_service_rate = 20.50>  ---> <!--- Get this from services rate table ---> <!--- It would  be inserted when quote is started --->
<cfset Session.turf_preg_qty  = get_service_info.turf_preg_qty > 
<cfset Session.turf_preg_cost  = get_service_info.turf_preg_cost>
 <cfset Session.turf_preg_rate = get_service_info.turf_preg_rate> 
 <cfset Session.turf_preg_hours  = Session.turf_preg_qty/Session.turf_preg_rate>
 <cfset Session.turf_preg_actualprice  = Session.turf_preg_hours*Session.turf_preg_cost>
 <cfset Session.turf_preg_materials_rate  = get_materials_info.turf_preg_materials_rate> <!--- Get this from materials rate table ---> <!--- It would  be inserted when quote is started --->
 <cfset Session.turf_preg_materials_qty = get_materials_info.turf_preg_materials_qty> 
 <cfset Session.turf_preg_materials_actualprice = Session.turf_preg_MATERIALS_rate*Session.turf_preg_materials_qty>
  <cfset Session.turf_preg_service_materials  = Session.turf_preg_actualprice+Session.turf_preg_materials_actualprice >
 <cfset Session.turf_preg_times  = get_service_info.turf_preg_times>
  <cfset Session.turf_preg_actual_extended  = Session.turf_preg_times*Session.turf_preg_service_materials>
  <cfset Session.turf_preg_total_hours =  Session.turf_preg_hours *Session.turf_preg_times>
 <cfset Session.turf_preg_overtime_adjustment = Session.turf_preg_actual_extended* Session.overtime_adjustment_rate>
 <cfset Session.turf_preg_contract_price = Session.turf_preg_overtime_adjustment / Session.gross_margin_diff>

<!------------------------------------------------------------------------------------------------------------->

 
 
<cfset Session.total_actual_extended = Session.push_mow_actual_extended  + Session.walk_behind_actual_extended+ Session.ride_mow_actual_extended+Session.hard_edge_actual_extended+

+Session.bed_edge_actual_extended
+Session.trimo_actual_extended
+Session.trims_actual_extended
+Session.spraying_actual_extended
+Session.weeding_actual_extended
+Session.blowing_actual_extended

+Session.trashs_actual_extended
+Session.traveltime_actual_extended
+Session.trasho_actual_extended
+Session.leafrem_actual_extended
+Session.cleanup_actual_extended


 + Session.turf_preg_actual_extended>
<cfset Session.total_hours = Session.push_mow_total_hours +Session.walk_behind_total_hours + Session.ride_mow_total_hours+Session.hard_edge_total_hours+ 

+Session.bed_edge_total_hours
+Session.trimo_total_hours
+Session.trims_total_hours
+Session.spraying_total_hours
+Session.weeding_total_hours
+Session.blowing_total_hours

+Session.trashs_total_hours
+Session.traveltime_total_hours
+Session.trasho_total_hours
+Session.leafrem_total_hours
+Session.cleanup_total_hours


 +Session.turf_preg_total_hours
>
<cfset Session.total_overtime_adjustment = Session.push_mow_overtime_adjustment + Session.walk_behind_overtime_adjustment+ Session.ride_mow_overtime_adjustment+Session.hard_edge_overtime_adjustment
+Session.bed_edge_overtime_adjustment
+Session.trimo_overtime_adjustment
+Session.trims_overtime_adjustment
+Session.spraying_overtime_adjustment
+Session.weeding_overtime_adjustment
+Session.blowing_overtime_adjustment

+Session.trashs_overtime_adjustment
+Session.traveltime_overtime_adjustment
+Session.trasho_overtime_adjustment
+Session.leafrem_overtime_adjustment
+Session.cleanup_overtime_adjustment
  +  Session.turf_preg_overtime_adjustment>

<cfset Session.total_contract_price = Session.push_mow_contract_price  + Session.walk_behind_contract_price+Session.ride_mow_contract_price+Session.hard_edge_contract_price
+Session.bed_edge_contract_price
+Session.trimo_contract_price
+Session.trims_contract_price
+Session.spraying_contract_price
+Session.weeding_contract_price
+Session.blowing_contract_price

+Session.trashs_contract_price
+Session.traveltime_contract_price
+Session.trasho_contract_price
+Session.leafrem_contract_price
+Session.cleanup_contract_price
  + Session.turf_preg_contract_price>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">

   
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
            <div class="header">Quote Input Form&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="QuoteDataEdit1.cfm">Dimensions Entry Sheet </a>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="dstable_l4">Quote ID</td>
                      <td class="dstable_l4">Q8894</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Quote Status</td>
                      <td class="dstable_l4">Lead</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Customer</td>
                      <td colspan="4" class="dstable_l4">The Breeden Company</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Job Location</td>
                      <td colspan="4"  class="dstable_l4">Ashton Village</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Contact</td>
                      <td class="dstable_l4">Ann King</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Phone</td>
                      <td class="dstable_l4">757-486-1000</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">RFQ/PO No.</td>
                      <td class="dstable_l4">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Lead Ref No</td>
                      <td class="dstable_l4">1517</td>
                    </tr>
                  </table></td>
                  <td><img src="images/clear.gif" width="40" height="1" /></td>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="dstable">Estimator</td>
                      <td class="dstable_l4">Charlie Ober</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Quote Status</td>
                      <td class="dstable_l4">Lead</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Branch</td>
                      <td colspan="4" class="dstable_l4">The Breeden Company</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Contract ID</td>
                      <td colspan="4"  class="dstable_l4">Ashton Village</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Date Created</td>
                      <td class="dstable_l4">May  25, 2014</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Followup</td>
                      <td class="dstable_l4">May 27, 2014</td>
                    </tr>
                    <tr>
                      <td class="dstable_l4">Date Modified</td>
                      <td class="dstable_l4">May 25, 2014</td>
                      <td>&nbsp;</td>
                      <td class="dstable_l4">Due Date</td>
                      <td class="dstable_l4">May 27, 2014</td>
                    </tr>
                  </table></td>
                </tr>
              </table><br /><br />
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top">
                      <form method="post" action="QuoteDataEdit1.cfm">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <cfif NOT IsDefined("url.enter_service_rate")>
                        <td align="left"> <a href="QuoteDataEdit1.cfm?enter_service_rate=yes" class="tsc_buttons2 small light_blue">Edit</a  ></td>
                        <cfelse>
                        <td align="left"> 
                        <input name="btnSumit" type="submit" class="tsc_buttons2 small light_blue" id="btnSumit" value="Save Rates"/>
                        
                        </td>
                      </cfif>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td rowspan="51"><img src="images/clear.gif" width="20" height="1" /></td>
                        <td align="left">&nbsp;</td><td align="right">&nbsp;</td>
                       <cfif NOT IsDefined("url.enter_materials_rate")><td align="left"> <a href="QuoteDataEdit1.cfm?enter_materials_rate=yes" class="tsc_buttons2 small light_blue">Edit</a  ></td>
                        <cfelse>
                        <td align="left">  
                        <input name="btnSumit" type="submit" class="tsc_buttons2 small light_blue" id="btnSumit" value="Save Rates"/>
                         </td>
                      </cfif>
                        
                        <td align="right">&nbsp;</td>
                        <td rowspan="51"><img src="images/clear.gif" width="20" height="1" /></td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="totals_subheaderwh">10%</td>
                        <td align="right" class="totals_subheaderwh"><input name="gross_margin" type="text" class="input-header"    <cfoutput>value="#Session.gross_margin#"</cfoutput> size="5" /></td>
                        <td align="right" >&nbsp;</td>
                      </tr>
                    
                      <tr>
                        <td class="dstable_subheader">Service</td>
                        <td align="left" class="dstable_subheader">Qty/SqFt</td>
                        <td class="dstable_subheader">Actual <br />
Cost</td>
                        <td align="left" class="dstable_subheader">Rate</td>
                        <td align="right" class="dstable_subheader">Unit</td>
                        <td align="right" class="dstable_subheader">Actual <br />
Price</td>
                        <td align="right" class="dstable_subheader">Hrs</td>
                        <td align="left" class="dstable_subheader">Materials</td>
                        <td align="left" class="dstable_subheader">Qty</td>
                        <td align="left" class="dstable_subheader" nowrap="nowrap">Actual <br />
Rate</td>
                        <td align="right" class="dstable_subheader">Actual <br />
Price</td>
                        <td align="right" class="dstable_subheader" nowrap="nowrap">Svc &amp; Mtl</td>
                        <td align="center" class="dstable_subheader">Times</td>
                        <td align="right" class="dstable_subheader">Actual <br />
Extended</td>
                        <td align="right" class="dstable_subheader">Total <br />
Hours</td>
                        <td align="right" class="dstable_subheader">Overtime <br />
Adjustment</td>
                        <td align="center" class="dstable_subheader">Gross Margin</td>
                        <td align="right" class="totals_subheader">Contract Price</td>
                      </tr>
                     <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Push Mow</td>
                        <td align="right" class="dstable_l3">
                          <input name="push_mow_qty" type="text" id="push_mow_qty"   size="8"    value="#Session.push_mow_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                        <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.push_mow_rate,"999,999")#</td>
                         <input type="hidden"  name="push_mow_rate" value="#Session.push_mow_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="push_mow_rate" type="text" id="pushmow_rate"   size="8"  value="#Session.push_mow_rate#"/></td>
                       </cfif>
                        
                     
                        <td nowrap="nowrap" class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$ #NumberFormat(Session.push_mow_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.push_mow_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$ #NumberFormat(Session.push_mow_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="push_mow_times" type="text" class="form_buttons" id="push_mow_times"  size="3"  value="#Session.push_mow_times#"/></td>
                        <td align="right" class="dstable_l3">$ #NumberFormat(Session.push_mow_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.push_mow_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.push_mow_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.push_mow_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                   
        <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Walk Behind</td>
                        <td align="right" class="dstable_l5">
                          <input name="walk_behind_qty" type="text" id="walk_behind_qty"   size="8"   value="#Session.walk_behind_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.walk_behind_rate,"999,999")#</td>
                                <input type="hidden"  name="walk_behind_rate" value="#Session.walk_behind_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="walk_behind_rate" type="text" id="walk_behind_rate"   size="8"  value="#Session.walk_behind_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.walk_behind_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.walk_behind_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.walk_behind_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="walk_behind_times" type="text"   size="3" value="#Session.walk_behind_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.walk_behind_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.walk_behind_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.walk_behind_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.walk_behind_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
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
                        <td align="right" class="dstable_l3"><input name="ride_mow_times" type="text"   size="3" value="#Session.ride_mow_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.ride_mow_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.ride_mow_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.ride_mow_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Hard Edge (long runs)</td>
                        <td align="right" class="dstable_l5">
                          <input name="hard_edge_qty" type="text" id="hard_edge_qty"   size="8"   value="#Session.hard_edge_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.hard_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="hard_edge_rate" value="#Session.hard_edge_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="hard_edge_rate" type="text" id="hard_edge_rate"   size="8"  value="#Session.hard_edge_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">LF</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.hard_edge_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.hard_edge_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.hard_edge_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="hard_edge_times" type="text"   size="3" value="#Session.hard_edge_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.hard_edge_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.hard_edge_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.hard_edge_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.hard_edge_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Bed Edge</td>
                        <td align="right" class="dstable_l3">
                          <input name="bed_edge_qty" type="text" id="bed_edge_qty"   size="8"   value="#Session.bed_edge_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.bed_edge_rate,"999,999")#</td>
                      <input type="hidden"  name="bed_edge_rate" value="#Session.bed_edge_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="bed_edge_rate" type="text" id="bed_edge_rate"   size="8"  value="#Session.bed_edge_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">LF</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.bed_edge_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.bed_edge_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.bed_edge_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="bed_edge_times" type="text"   size="3" value="#Session.bed_edge_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.bed_edge_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.bed_edge_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.bed_edge_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.bed_edge_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>


  <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Trim, O</td>
                        <td align="right" class="dstable_l5">
                          <input name="trimo_qty" type="text" id="trimo_qty"   size="8"   value="#Session.trimo_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.trimo_rate,"999,999")#</td>
                      <input type="hidden"  name="trimo_rate" value="#Session.trimo_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="trimo_rate" type="text"   size="8"  value="#Session.trimo_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.trimo_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.trimo_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.trimo_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="trimo_times" type="text"   size="3" value="#Session.trimo_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.trimo_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.trimo_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.trimo_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.trimo_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                        <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Trim, S</td>
                        <td align="right" class="dstable_l3">
                          <input name="trims_qty" type="text" id="trims_qty"   size="8"   value="#Session.trims_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.trims_rate,"999,999")#</td>
                      <input type="hidden"  name="trims_rate" value="#Session.trims_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="trims_rate" type="text" id="trims_rate"   size="8"  value="#Session.trims_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trims_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trims_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trims_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="trims_times" type="text"   size="3" value="#Session.trims_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trims_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trims_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trims_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.trims_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Spraying</td>
                        <td align="right" class="dstable_l5">
                          <input name="spraying_qty" type="text" id="spraying_qty"   size="8"   value="#Session.spraying_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.spraying_rate,"999,999")#</td>
                      <input type="hidden"  name="spraying_rate" value="#Session.spraying_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="spraying_rate" type="text" id="spraying_rate"   size="8"  value="#Session.spraying_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.spraying_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.spraying_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">Non-sel. Herbicide (oz)</td>
                         <td align="right" class="dstable_l5"><input name="spraying_materials_qty" type="text" id="spraying_materials_qty"   size="8"    value="#Session.spraying_materials_qty#"/>  </td>
                        
                        
                        
                         <cfif NOT IsDefined("url.enter_materials_rate")>
                          <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.spraying_MATERIALS_rate,"999,999.99")#</td>
                              <input type="hidden"  name="spraying_MATERIALS_rate" value="#Session.spraying_MATERIALS_rate#"/>
                          
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="spraying_MATERIALS_rate" type="text" id="spraying_rate"   size="8"  value="#Session.spraying_MATERIALS_rate#"/></td>
                       </cfif>
                       
                         <td align="right" class="dstable_l5">$ #NumberFormat(Session.spraying_materials_actualprice,"999.99")#</td>   
                        <td align="right" class="dstable_l5" nowrap="nowrap">$ #NumberFormat(Session.spraying_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="spraying_times" type="text" class="form_buttons"    size="3"  value="#Session.spraying_times#"/></td>
                        <td align="right" class="dstable_l5">$ #NumberFormat(Session.spraying_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.spraying_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.spraying_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.spraying_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>

   <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Weeding</td>
                        <td align="right" class="dstable_l3">
                          <input name="weeding_qty" type="text" id="weeding_qty"   size="8"   value="#Session.weeding_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.weeding_rate,"999,999")#</td>
                      <input type="hidden"  name="weeding_rate" value="#Session.weeding_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="weeding_rate" type="text" id="weeding_rate"   size="8"  value="#Session.weeding_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.weeding_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.weeding_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.weeding_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="weeding_times" type="text"   size="3" value="#Session.weeding_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.weeding_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.weeding_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.weeding_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.weeding_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Blowing</td>
                        <td align="right" class="dstable_l5">
                          <input name="blowing_qty" type="text" id="blowing_qty"   size="8"   value="#Session.blowing_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.blowing_rate,"999,999")#</td>
                      <input type="hidden"  name="blowing_rate" value="#Session.blowing_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="blowing_rate" type="text" id="blowing_rate"   size="8"  value="#Session.blowing_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.blowing_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.blowing_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.blowing_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="blowing_times" type="text"   size="3" value="#Session.blowing_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.blowing_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.blowing_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.blowing_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.blowing_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>

 <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Trash, S</td>
                        <td align="right" class="dstable_l3">
                          <input name="trashs_qty" type="text" id="trashs_qty"   size="8"   value="#Session.trashs_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.trashs_rate,"999,999")#</td>
                      <input type="hidden"  name="trashs_rate" value="#Session.trashs_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="trashs_rate" type="text" id="trashs_rate"   size="8"  value="#Session.trashs_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trashs_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trashs_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trashs_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="trashs_times" type="text"   size="3" value="#Session.trashs_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trashs_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trashs_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trashs_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.trashs_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                         <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Travel Time</td>
                        <td align="right" class="dstable_l5">
                          <input name="traveltime_qty" type="text" id="traveltime_qty"   size="8"   value="#Session.traveltime_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.traveltime_rate,"999,999")#</td>
                      <input type="hidden"  name="traveltime_rate" value="#Session.traveltime_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="traveltime_rate" type="text" id="traveltime_rate"   size="8"  value="#Session.traveltime_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.traveltime_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.traveltime_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.traveltime_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="traveltime_times" type="text"   size="3" value="#Session.traveltime_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.traveltime_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.traveltime_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.traveltime_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.traveltime_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Trash, Off</td>
                        <td align="right" class="dstable_l3">
                          <input name="trasho_qty" type="text" id="trasho_qty"   size="8"   value="#Session.trasho_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.trasho_rate,"999,999")#</td>
                      <input type="hidden"  name="trasho_rate" value="#Session.trasho_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="trasho_rate" type="text" id="trasho_rate"   size="8"  value="#Session.trasho_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trasho_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trasho_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trasho_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="trasho_times" type="text"   size="3" value="#Session.trasho_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trasho_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.trasho_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.trasho_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.trasho_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>

  <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l5">Leaf Rem</td>
                        <td align="right" class="dstable_l5">
                          <input name="leafrem_qty" type="text" id="leafrem_qty"   size="8"   value="#Session.leafrem_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l5">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l5"> #NumberFormat(Session.leafrem_rate,"999,999")#</td>
                      <input type="hidden"  name="leafrem_rate" value="#Session.leafrem_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l5"><input name="leafrem_rate" type="text" id="leafrem_rate"   size="8"  value="#Session.leafrem_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.leafrem_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.leafrem_hours,"999.9")#</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.leafrem_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l5"><input name="leafrem_times" type="text"   size="3" value="#Session.leafrem_times#"/></td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.leafrem_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.leafrem_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l5">$#NumberFormat(Session.leafrem_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l5">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.leafrem_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>

 <cfoutput> <tr>
                        <td nowrap="nowrap" class="dstable_l3">Cleanup</td>
                        <td align="right" class="dstable_l3">
                          <input name="cleanup_qty" type="text" id="cleanup_qty"   size="8"   value="#Session.cleanup_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$11.50</td>
                          <cfif NOT IsDefined("url.enter_service_rate")>
                            <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.cleanup_rate,"999,999")#</td>
                      <input type="hidden"  name="cleanup_rate" value="#Session.cleanup_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="cleanup_rate" type="text" id="cleanup_rate"   size="8"  value="#Session.cleanup_rate#"/></td>
                       </cfif>
                        <td nowrap="nowrap" class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.cleanup_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.cleanup_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.cleanup_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="cleanup_times" type="text"   size="3" value="#Session.cleanup_times#"/></td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.cleanup_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.cleanup_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.cleanup_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.cleanup_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>


                     <cfoutput> <tr>
                      <td class="dstable_l3">Turf Pre (g)</td>
                        <td align="right" class="dstable_l3">
                           <input name="turf_preg_qty" type="text" id="turf_preg_qty"   size="8"    value="#Session.turf_preg_qty#"/>
                        </td>
                        <td nowrap="nowrap" class="dstable_l3">$20.00</td>
                        
                      <cfif NOT IsDefined("url.enter_service_rate")>
                          <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.turf_preg_rate,"999,999")#</td>
                            <input type="hidden"  name="turf_preg_rate" value="#Session.turf_preg_rate#"/>
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="turf_preg_rate" type="text" id="turf_preg_rate"   size="8"  value="#Session.turf_preg_rate#"/></td>
                       </cfif>
                        
                        
                       
                        <td nowrap="nowrap" class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$ #NumberFormat(Session.turf_preg_actualprice,"999.99")# </td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.turf_preg_hours,"999.9")#</td>
                        <td align="left" class="dstable_l3">Granular pre-em w/ 16-4-8 Fert (lb)</td>
                       
                       
                        <td align="right" class="dstable_l3"><input name="turf_preg_materials_qty" type="text" id="turf_preg_materials_qty"   size="8"    value="#Session.turf_preg_materials_qty#"/>  </td>
                        
                        
                        
                         <cfif NOT IsDefined("url.enter_materials_rate")>
                          <td align="left" nowrap="nowrap" class="dstable_l3"> #NumberFormat(Session.turf_preg_MATERIALS_rate,"999,999.99")#</td>
                              <input type="hidden"  name="turf_preg_MATERIALS_rate" value="#Session.turf_preg_MATERIALS_rate#"/>
                          
                        <cfelse>
                         <td align="left" nowrap="nowrap" class="dstable_l3"><input name="turf_preg_MATERIALS_rate" type="text" id="turf_preg_rate"   size="8"  value="#Session.turf_preg_MATERIALS_rate#"/></td>
                       </cfif>
                       
                         <td align="right" class="dstable_l3">$ #NumberFormat(Session.turf_preg_materials_actualprice,"999.99")#</td>   
                        <td align="right" class="dstable_l3" nowrap="nowrap">$ #NumberFormat(Session.turf_preg_service_materials,"999.99")#</td>
                        <td align="right" class="dstable_l3"><input name="turf_preg_times" type="text" class="form_buttons"    size="3"  value="#Session.turf_preg_times#"/></td>
                        <td align="right" class="dstable_l3">$ #NumberFormat(Session.turf_preg_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l3">#NumberFormat(Session.turf_preg_total_hours,"9,999.9")#</td>
                        <td align="right" class="dstable_l3">$#NumberFormat(Session.turf_preg_overtime_adjustment,"999,999.99")#</td>   
                        <td align="center" class="dstable_l3">#NumberFormat(Session.gross_margin,"999,999.99")#%</td>  
                        <td align="right" class="totals">$#NumberFormat(Session.turf_preg_contract_price,"999,999.99")#</td> 
                      </tr></cfoutput>
                      
                       <cfoutput> <tr>
                        <td class="dstable_l5">Totals</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$ #NumberFormat(Session.total_actual_extended,"999,999.99")#</td>
                        <td align="right" class="dstable_l5">#NumberFormat(Session.total_hours,"999,999.9")#</td>
                        <td align="right" class="dstable_l5">$ #NumberFormat(Session.total_overtime_adjustment,"999,999.99")#</td>
                        <td align="center" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="totals">$ #NumberFormat(Session.total_contract_price,"999,999.99")#</td>
                      </tr>
					  </cfoutput>
                        
                     <!---  
                       
                       
                       
             
                      <tr>
                        <td class="dstable_l5">Turf Pre (g)</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="150,000" size="8" /></td>
                        <td class="dstable_l5">$20.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="35,000" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$85.71</td>
                        <td align="right" class="dstable_l5">4.3</td>
                        <td align="left" class="dstable_l5">Granular pre-em w/ 16-4-8 Fert (lb)</td>
                        <td align="right" class="dstable_l5"><input name="textfield4" type="text" id="textfield4" value="724.6" size="5" /></td>
                        <td align="right" class="dstable_l5">$0.45</td>
                        <td align="right" class="dstable_l5">$326.09</td>
                        <td align="right" class="dstable_l5">$411.80</td>
                        <td align="right" class="dstable_l5"><input name="textfield75" type="text" class="form_buttons" id="textfield75" value="1" size="5" /></td>
                        <td align="right" class="dstable_l5">$412.00</td>
                        <td align="right" class="dstable_l5">4.3</td>
                        <td align="right" class="dstable_l5">$416.30</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$858.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Turf Pre (I)</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="0" size="8" /></td>
                        <td class="dstable_l3">$20.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="44,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">Barricade liquid pre-em (oz)</td>
                        <td align="right" class="dstable_l3"><input name="textfield9" type="text" id="textfield9" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$11.48</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield51" type="text" class="form_buttons" id="textfield51" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Turf Post</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="150,000" size="8" /></td>
                        <td class="dstable_l5">$20.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="44,000" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$68.18</td>
                        <td align="right" class="dstable_l5">3.4</td>
                        <td align="left" class="dstable_l5">Trimec Selective Herbicide (oz)</td>
                        <td align="right" class="dstable_l5"><input name="textfield10" type="text" id="textfield10" value="258.6" size="5" /></td>
                        <td align="right" class="dstable_l5">$0.62</td>
                        <td align="right" class="dstable_l5">$106.34</td>
                        <td align="right" class="dstable_l5">$228.53</td>
                        <td align="right" class="dstable_l5"><input name="textfield76" type="text" class="form_buttons" id="textfield76" value="2" size="5" /></td>
                        <td align="right" class="dstable_l5">$457.00</td>
                        <td align="right" class="dstable_l5">6.8</td>
                        <td align="right" class="dstable_l5">$463.80</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$956.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Turf Fert</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="150,000" size="8" /></td>
                        <td class="dstable_l3">$20.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="35,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$85.71</td>
                        <td align="right" class="dstable_l3">4.3</td>
                        <td align="left" class="dstable_l3">10-10-1 Starter Fert</td>
                        <td align="right" class="dstable_l3"><input name="textfield36" type="text" id="textfield36" value="625" size="5" /></td>
                        <td align="right" class="dstable_l3">$0.40</td>
                        <td align="right" class="dstable_l3">$250.00</td>
                        <td align="right" class="dstable_l3">$335.71</td>
                        <td align="right" class="dstable_l3"><input name="textfield52" type="text" class="form_buttons" id="textfield52" value="2" size="5" /></td>
                        <td align="right" class="dstable_l3">$671.00</td>
                        <td align="right" class="dstable_l3">8.6</td>
                        <td align="right" class="dstable_l3">$679.60</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$1,401.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Turf Lime</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="150,000" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="25,000" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$69.00</td>
                        <td align="right" class="dstable_l5">6.0</td>
                        <td align="left" class="dstable_l5">Pelletzed Line (lb)</td>
                        <td align="right" class="dstable_l5"><input name="textfield37" type="text" id="textfield37" value="3,750" size="5" /></td>
                        <td align="right" class="dstable_l5">$.088</td>
                        <td align="right" class="dstable_l5">$528.00</td>
                        <td align="right" class="dstable_l5">$331.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield77" type="text" class="form_buttons" id="textfield77" value="1" size="5" /></td>
                        <td align="right" class="dstable_l5">$332.00</td>
                        <td align="right" class="dstable_l5">6.0</td>
                        <td align="right" class="dstable_l5">$335.45</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$692.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Turf Aer (h)</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="150,000" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="5,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$345.00</td>
                        <td align="right" class="dstable_l3">30.0</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$345.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield53" type="text" class="form_buttons" id="textfield53" value="1" size="5" /></td>
                        <td align="right" class="dstable_l3">$345.00</td>
                        <td align="right" class="dstable_l3">30.0</td>
                        <td align="right" class="dstable_l3">$362.25</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$747.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Turf Aer (t)</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="20,000" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield78" type="text" class="form_buttons" id="textfield78" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Turf Seed</td>
                        <td align="right" class="dstable_l3"><input name="textfield15" type="text" id="textfield15" value="150,000" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="25,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$69.00</td>
                        <td align="right" class="dstable_l3">6.0</td>
                        <td align="left" class="dstable_l3">Fescue Seed (lbs)</td>
                        <td align="right" class="dstable_l3"><input name="textfield38" type="text" id="textfield38" value="480" size="5" /></td>
                        <td align="right" class="dstable_l3">$0.50</td>
                        <td align="right" class="dstable_l3">$240.02</td>
                        <td align="right" class="dstable_l3">$597.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield54" type="text" class="form_buttons" id="textfield54" value="1" size="5" /></td>
                        <td align="right" class="dstable_l3">$597.00</td>
                        <td align="right" class="dstable_l3">6.0</td>
                        <td align="right" class="dstable_l3">$600.45</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$1,238.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Pruning, T/p</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="25" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">$287.50</td>
                        <td align="right" class="dstable_l5">25.0</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$287.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield79" type="text" class="form_buttons" id="textfield79" value="1" size="5" /></td>
                        <td align="right" class="dstable_l5">$288.00</td>
                        <td align="right" class="dstable_l5">25.0</td>
                        <td align="right" class="dstable_l5">$302.38</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$623.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Pruning, S</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="35" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$402.50</td>
                        <td align="right" class="dstable_l3">35.0</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">$402.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield55" type="text" class="form_buttons" id="textfield55" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$1,208.00</td>
                        <td align="right" class="dstable_l3">105.0</td>
                        <td align="right" class="dstable_l3">$1,268.38</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$2,615.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">T&amp;S, Fert</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="16,000" size="8" /></td>
                        <td class="dstable_l5">$20.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="8,000" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">$40.00</td>
                        <td align="right" class="dstable_l5">2.0</td>
                        <td align="left" class="dstable_l5">Fertilizer 14-14-14  (lbs)</td>
                        <td align="right" class="dstable_l5"><input name="textfield39" type="text" id="textfield39" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$0.50</td>
                        <td align="right" class="dstable_l5">$240.02</td>
                        <td align="right" class="dstable_l5">$280.02</td>
                        <td align="right" class="dstable_l5"><input name="textfield80" type="text" class="form_buttons" id="textfield80" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$280.00</td>
                        <td align="right" class="dstable_l5">2.0</td>
                        <td align="right" class="dstable_l5">$282.00</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$581.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">T&amp;S, Insect</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="2" size="8" /></td>
                        <td class="dstable_l3">$20.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">$40.00</td>
                        <td align="right" class="dstable_l3">2.0</td>
                        <td align="left" class="dstable_l3">Bifenthrin Tree &amp; Shrub Insecticide (oz.)</td>
                        <td align="right" class="dstable_l3"><input name="textfield40" type="text" id="textfield40" value="4" size="5" /></td>
                        <td align="right" class="dstable_l3">$0.75</td>
                        <td align="right" class="dstable_l3">$3.00</td>
                        <td align="right" class="dstable_l3">$43.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield56" type="text" class="form_buttons" id="textfield56" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$86.00</td>
                        <td align="right" class="dstable_l3">4.0</td>
                        <td align="right" class="dstable_l3">$90.00</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$186.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">T&amp;S, Hort Oil</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="2" size="8" /></td>
                        <td class="dstable_l5">$20.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">$40.00</td>
                        <td align="right" class="dstable_l5">2.0</td>
                        <td align="left" class="dstable_l5">Hort/Dormant Oil</td>
                        <td align="right" class="dstable_l5"><input name="textfield41" type="text" id="textfield41" value="256" size="5" /></td>
                        <td align="right" class="dstable_l5">$0.60</td>
                        <td align="right" class="dstable_l5">$153.60</td>
                        <td align="right" class="dstable_l5">$193.60</td>
                        <td align="right" class="dstable_l5"><input name="textfield81" type="text" class="form_buttons" id="textfield81" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$194.00</td>
                        <td align="right" class="dstable_l5">2.0</td>
                        <td align="right" class="dstable_l5">$196.00</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$404.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Mulch, Pre</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="11,340" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="8,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$16.30</td>
                        <td align="right" class="dstable_l3">1.4</td>
                        <td align="left" class="dstable_l3">Pre-em 0-0-7 w/ 86% Pendemethaline (lbs) </td>
                        <td align="right" class="dstable_l3"><input name="textfield42" type="text" id="textfield42" value="1.4" size="5" /></td>
                        <td align="right" class="dstable_l3">$0.25</td>
                        <td align="right" class="dstable_l3">$0.35</td>
                        <td align="right" class="dstable_l3">$16.66</td>
                        <td align="right" class="dstable_l3"><input name="textfield57" type="text" class="form_buttons" id="textfield57" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$17.00</td>
                        <td align="right" class="dstable_l3">1.4</td>
                        <td align="right" class="dstable_l3">$17.81</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$37.00</td>
                      </tr>
                      <tr>
                        <td nowrap="nowrap" class="dstable_l5">Mulch, Edging</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="8,750" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="250" size="8" /></td>
                        <td class="dstable_l5">LF</td>
                        <td align="right" class="dstable_l5">$402.50</td>
                        <td align="right" class="dstable_l5">35.0</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">$402.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield82" type="text" class="form_buttons" id="textfield82" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$403.00</td>
                        <td align="right" class="dstable_l5">35.0</td>
                        <td align="right" class="dstable_l5">$423.13</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">$872.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Mulch, S</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="11,340" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="186" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">$701.13</td>
                        <td align="right" class="dstable_l3">61.0</td>
                        <td align="left" class="dstable_l3">Dyed Mulch</td>
                        <td align="right" class="dstable_l3"><input name="textfield43" type="text" id="textfield43" value="70" size="5" /></td>
                        <td align="right" class="dstable_l3">$19.00</td>
                        <td align="right" class="dstable_l3">$1,330.00</td>
                        <td align="right" class="dstable_l3">$2,031.13</td>
                        <td align="right" class="dstable_l3"><input name="textfield58" type="text" class="form_buttons" id="textfield58" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$2,031.00</td>
                        <td align="right" class="dstable_l3">61.0</td>
                        <td align="right" class="dstable_l3">$2,066.08</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">$4,260.00</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Mulch, F</td>
                        <td align="right" class="dstable_l5"><input name="textfield16" type="text" id="textfield16" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="372" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">Dyed Mulch</td>
                        <td align="right" class="dstable_l5"><input name="textfield44" type="text" id="textfield44" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$19.00</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield83" type="text" class="form_buttons" id="textfield83" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Mulch, F</td>
                        <td align="right" class="dstable_l3"><input name="textfield17" type="text" id="textfield17" value="0" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="372" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">non-Dyed Mulch</td>
                        <td align="right" class="dstable_l3"><input name="textfield47" type="text" id="textfield47" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$14.00</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield59" type="text" class="form_buttons" id="textfield59" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Mulch, S</td>
                        <td align="right" class="dstable_l5"><input name="textfield18" type="text" id="textfield18" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="386" size="8" /></td>
                        <td class="dstable_l5">SF</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">non-Dyed Mulch</td>
                        <td align="right" class="dstable_l5"><input name="textfield45" type="text" id="textfield45" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$14.00</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield84" type="text" class="form_buttons" id="textfield84" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Pine Tags</td>
                        <td align="right" class="dstable_l3"><input name="textfield19" type="text" id="textfield19" value="0" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1,250" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">Pine Tags (bales)</td>
                        <td align="right" class="dstable_l3"><input name="textfield48" type="text" id="textfield48" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$6.00</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield60" type="text" class="form_buttons" id="textfield60" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Annuals, S</td>
                        <td align="right" class="dstable_l5"><input name="textfield20" type="text" id="textfield20" value="0" size="8" /></td>
                        <td class="dstable_l5">$12.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="25" size="8" /></td>
                        <td class="dstable_l5">Pots</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">Flowers (6&quot; pots)</td>
                        <td align="right" class="dstable_l5"><input name="textfield46" type="text" id="textfield46" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">$1.80</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield85" type="text" class="form_buttons" id="textfield85" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Annuals, F</td>
                        <td align="right" class="dstable_l3"><input name="textfield21" type="text" id="textfield21" value="0" size="8" /></td>
                        <td class="dstable_l3">$12.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="25" size="8" /></td>
                        <td class="dstable_l3">Pots</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">Flowers (6&quot; pots)</td>
                        <td align="right" class="dstable_l3"><input name="textfield49" type="text" id="textfield49" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">$1.80</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield61" type="text" class="form_buttons" id="textfield61" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Irrigation, SU</td>
                        <td align="right" class="dstable_l5"><input name="textfield22" type="text" id="textfield22" value="0" size="8" /></td>
                        <td class="dstable_l5">$65.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield86" type="text" class="form_buttons" id="textfield86" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Irrigation, W</td>
                        <td align="right" class="dstable_l3"><input name="textfield23" type="text" id="textfield23" value="0" size="8" /></td>
                        <td class="dstable_l3">$65.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield62" type="text" class="form_buttons" id="textfield62" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Irrigation, I</td>
                        <td align="right" class="dstable_l5"><input name="textfield24" type="text" id="textfield24" value="0" size="8" /></td>
                        <td class="dstable_l5">$65.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield87" type="text" class="form_buttons" id="textfield87" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Irrigation, T/M</td>
                        <td align="right" class="dstable_l3"><input name="textfield25" type="text" id="textfield25" value="0" size="8" /></td>
                        <td class="dstable_l3">$65.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield63" type="text" class="form_buttons" id="textfield63" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Irrigation, BFI</td>
                        <td align="right" class="dstable_l5"><input name="textfield26" type="text" id="textfield26" value="0" size="8" /></td>
                        <td class="dstable_l5">$65.00</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield88" type="text" class="form_buttons" id="textfield88" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Pond Maint.</td>
                        <td align="right" class="dstable_l3"><input name="textfield27" type="text" id="textfield27" value="0" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield64" type="text" class="form_buttons" id="textfield64" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Trim, Hillside</td>
                        <td align="right" class="dstable_l5"><input name="textfield28" type="text" id="textfield28" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield89" type="text" class="form_buttons" id="textfield89" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Addt'l Mowing</td>
                        <td align="right" class="dstable_l3"><input name="textfield29" type="text" id="textfield29" value="0" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield65" type="text" class="form_buttons" id="textfield65" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Day Porter</td>
                        <td align="right" class="dstable_l5"><input name="textfield30" type="text" id="textfield30" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield90" type="text" class="form_buttons" id="textfield90" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Bush Hog</td>
                        <td align="right" class="dstable_l3"><input name="textfield31" type="text" id="textfield31" value="0" size="8" /></td>
                        <td class="dstable_l3">$35.00</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="44,000" size="8" /></td>
                        <td class="dstable_l3">SF</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield66" type="text" class="form_buttons" id="textfield66" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5">Trail Maint</td>
                        <td align="right" class="dstable_l5"><input name="textfield32" type="text" id="textfield32" value="0" size="8" /></td>
                        <td class="dstable_l5">$11.50</td>
                        <td align="right" class="dstable_l5"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l5">HR</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="left" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5"><input name="textfield91" type="text" class="form_buttons" id="textfield91" value="0" size="5" /></td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="center" class="dstable_l5">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l3">Natural Area</td>
                        <td align="right" class="dstable_l3"><input name="textfield33" type="text" id="textfield33" value="0" size="8" /></td>
                        <td class="dstable_l3">$11.50</td>
                        <td align="right" class="dstable_l3"><input name="textfield" type="text" id="textfield" value="1" size="8" /></td>
                        <td class="dstable_l3">HR</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="left" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3"><input name="textfield67" type="text" class="form_buttons" id="textfield67" value="0" size="5" /></td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="right" class="dstable_l3">&nbsp;</td>
                        <td align="center" class="dstable_l3">52%</td>
                        <td align="right" class="totals">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="dstable_l5" colspan="3">&nbsp;</td>
                        <td class="dstable_l5" align="right">&nbsp;</td>
                        <td class="dstable_l5">&nbsp;</td>
                        <td class="dstable_l5" align="right">&nbsp;</td>
                        <td class="dstable_l5" align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="4" class="dstable_l5" >&nbsp;</td>
                         <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$17,085.00</td>
                        <td align="right" class="dstable_l5">1,191.70</td>
                        <td align="right" class="dstable_l5">$18,482.00</td>
                        <td align="center">&nbsp;</td>
                        <td align="right" class="totalsBot">$38,107.00</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$3,258.73</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$14,526.87</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$697.00</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$18,482.00</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="left">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="dstable_l5">$38,107.00</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="right">&nbsp;</td> 
                      </tr>--->
                    
                    </table>
                    
                       <div class="spacer20"></div>
  <div align="right"><input name="btnSumit" type="submit" class="bluebutton" id="btnSumit" value="Calculate & Save"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="btnSumit"  class="bluebutton" id="btnSumit" value="Approve"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="btnSumit"  class="bluebutton" id="btnSumit" value="Print"/></div>
    
    </form>
                 </td>
                </tr>
              </table>
            
            
         </td>
        </tr>
      </table>
      <p>&nbsp;</p>
    <!---   <div class="header">Job Costing Scenario</div>
      <table cellspacing="0" cellpadding="0">
        <tr>
          <td class="dstable_subheader">Direct Cost Overage</td>
          <td class="dstable_subheader">Direct Costs</td>
          <td class="dstable_subheader">Gross Margin</td>
          <td class="dstable_subheader">Overhead</td>
          <td class="dstable_subheader">Net Profit</td>
          <td class="dstable_subheader">Net Proift %</td>
        </tr>
        <tr>
          <td class="dstable_l3">0%</td>
          <td align="right" class="dstable_l3">$18,482.00</td>
          <td align="right" class="dstable_l3">$19,625.00</td>
          <td align="right" class="dstable_l3">$14,480.66</td>
          <td align="right" class="dstable_l3">$5,144.34</td>
          <td class="dstable_l3">13.50%</td>
        </tr>
        <tr>
          <td class="dstable_l5">15%</td>
          <td align="right" class="dstable_l5">$21,254.30</td>
          <td align="right" class="dstable_l5">$16,852.70</td>
          <td align="right" class="dstable_l5">$14,480.66</td>
          <td align="right" class="dstable_l5">$2,372.04</td>
          <td class="dstable_l5">6.22%</td>
        </tr>
        <tr>
          <td class="dstable_l3">Difference</td>
          <td align="right" class="dstable_l3">$(2,772.30)</td>
          <td align="right" class="dstable_l3">$2,772.30 </td>
          <td align="right" class="dstable_l3">$-</td>
          <td align="right" class="dstable_l3">$2,772.30 </td>
          <td class="dstable_l3">7.28%</td>
        </tr>
        <tr>
          <td class="dstable_l5">Difference in Man Hours</td>
          <td align="right" class="dstable_l5">264.03</td>
          <td class="dstable_l5"></td>
          <td class="dstable_l5"></td>
          <td class="dstable_l5"></td>
          <td class="dstable_l5"></td>
        </tr>
      </table> --->
   <!---   <div class="spacer20"></div>
  <div align="right"><input name="btnSumit" type="submit" class="bluebutton" id="btnSumit" value="Calculate & Save"/></div> --->
    </div>
   
  </div>
  <!-- to clear footer -->
</div>


</body>
</html>
