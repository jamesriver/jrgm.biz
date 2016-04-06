<cfquery name="get_morning_inspections" datasource="jrgm">
SELECT      Inspection_ID, Crew_LeaderID, inspection_date,Inspection_due, Inspection_Type, Problem, Created_By, Created_On, Current_Mileage, vehicleSatisfactory, 
 InspectionMode,Vehicle_Number, Trailer_Number,oil_change_mileage_due
FROM     app_Inspection_Master WHERE  Inspection_ID = #Inspection_ID#
</cfquery>
<cfquery name="get_CL_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch ,phone_cell
FROM app_employees  WHERE  [Employee ID]  = #get_morning_inspections.Crew_LeaderID#
</cfquery>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>James River Grounds Management-Morning Inspection Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;" />
<title>James River Grounds Management</title>
<link href="assets/admin/layout3/css/inspectionform-style.css" rel="stylesheet" />
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <!--centre content goes here -->
    <div class="centrecontent_innernotop">
     <div class="header">Morning Inspection Form</div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
     <td valign="top">
     
     <table class="tableadmin" border="0" cellspacing="0" cellpadding="0">
	<tbody>
         <tr>
          <td>Report ID</td>
          <td><cfoutput>#get_morning_inspections.Inspection_ID#</cfoutput></td>
          </tr>
        <tr>
          <td>Branch</td>
          <td><cfoutput>#get_CL_info.branch#</cfoutput></td>
          </tr>
        <cfoutput query="get_morning_inspections">
          <tr>
            <td>Vehicle Number</td>
            <td>#Vehicle_Number#</td>
            </tr>
         <tr>
            <td>Trailer Number</td>
            <td>#Trailer_Number#</td>
            </tr>
        </cfoutput></tbody>
      </table> </td><td><table class="tableadmin" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td>Report Date</td>
            <td><cfoutput>#dateformat(get_morning_inspections.Inspection_Date,"mm/dd/yy")#</cfoutput></td>
          </tr>
          <tr>
            <td>Driver's Name</td>
            <td><cfoutput>#get_CL_info.fullname#</cfoutput></td>
          </tr>
      
                 <tr>
              <td>Driver's Phone Number</td>
              <td align="left"><cfoutput>#get_CL_info.phone_cell#</cfoutput></td> 
            </tr>
                   <cfoutput query="get_morning_inspections">
                <!---  <tr>
                    <td>Oil Change Due</td>
                    <td> #dateformat(get_morning_inspections.oil_change_mileage_due,"mm/dd/yy")# </td>
                  </tr>
                  --->
                   <tr>
                    <td>Oil Change Due</td>
                    <td> <cfif  get_morning_inspections.oil_change_mileage_due IS ""  OR get_morning_inspections.oil_change_mileage_due EQ 0 >-<cfelse>#oil_change_mileage_due# </cfif></td>
                  </tr>
                   <tr>
                    <td>Inspection Due</td>
                    <td><cfif  get_morning_inspections.Inspection_Due GT '01/01/1900'>#dateformat(get_morning_inspections.Inspection_Due,"mm/dd/yy")#</cfif></td>
                  </tr>
                </cfoutput>
        </tbody>
      </table></td>
        </tr></table>
        
         <table border="0" width="100%" class="tableadmin" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th align="left">EQUIPMENT</th>
          <th align="center" nowrap="nowrap" >EQ ID</th>
          <th align="center" nowrap="nowrap" >Good Working Order</th>
          <th align="left" nowrap="nowrap" >Comments</th>
          <th align="center" nowrap="nowrap" >Status</th>
          <th align="center" nowrap="nowrap" >Est. Compl. Date</th>
        </tr>
        </thead>
        <tbody>
        <cfquery name="get_equipment_info_MI" datasource="jrgm"  >
   SELECT      ID, Inspection_ID, Equipment_ID, GoodWorking_Order, Comments
FROM        app_Crew_Equipment_Inspection WHERE Inspection_ID = #Inspection_ID#
</cfquery>
        <cfoutput query="get_equipment_info_MI">
          <cfquery name="get_eq_name" datasource="jrgm"  >
   SELECT     product_name,inventory_status FROM equipment WHERE Equipment_ID = '#get_equipment_info_MI.Equipment_ID#'
</cfquery>
          <tr>
            <td align="left">#get_eq_name.product_name#</td>
            <td align="center" nowrap >#Equipment_ID#</td>
            <td align="center" >#GoodWorking_Order#</td>
            <td align="left">#Comments#</td>
            <td align="center"><cfif get_eq_name.inventory_status EQ 1>
                Active
                <cfelseif get_eq_name.inventory_status EQ 2>
                Pending Repair
                <cfelseif  get_eq_name.inventory_status EQ 3>
                In Repair
                <cfelseif get_eq_name.inventory_status EQ 0>
                Inactive
                  <cfelseif get_eq_name.inventory_status EQ 5>
                Completed Repair
                 <cfelse>
                Active
              </cfif></td>
            <td align="center">&nbsp;</td>
          </tr>
        </cfoutput>
        </tbody>
      </table>
      <cfquery name="get_checklist_info" datasource="jrgm">
SELECT      CheckList_ID, Inspection_ID, AnyFluid, EngineOil, DashLight, Horn, Tires, BrakesFluid, TurnSignal, Radiator, AlertSystem, CoupletPin, Brakeswitch, 
                      ElectricConnector, SafetyChain, JackStand, TireWheel, RampCable, Spring, Brakes, Lights, GreaseDump, CheckOil, CleanFilter, Equ_TireWear, 
                      Saf_Crew_Has_Appropriate_PPE, Saf_Fire_Extinguisher_Tagged_and_Current, Saf_First_Aid_Kit, Saf_Flares, Saf_Eyewash, Saf_Emergency_Contact
FROM         app_Inspection_Daily_CheckList    WHERE  Inspection_ID = #Inspection_ID#
</cfquery>
      <cfoutput query="get_checklist_info">
    <table width="100%" class="tableadmin" border="0" cellpadding="0" cellspacing="0">
    <tbody>
          <tr>
            <td width="40%" ><strong>VEHICLE</strong></td>
            <td nowrap="nowrap" >&nbsp;</td>
            <td nowrap="nowrap" >&nbsp;</td>
            <td><strong>EQUIPMENT</strong></td>
            <td>&nbsp;</td>
            </tr>
          <tr><td>Any fluid leaks</td><td>#AnyFluid#</td>
            <td>&nbsp;</td>
            <td>Check Oil</td>
            <td>#CheckOil# </td>
            </tr>
          <tr><td>Engine oil level</td><td>#EngineOil# </td>
            <td>&nbsp;</td>
            <td>Clean Filters</td>
            <td>#CleanFilter# </td>
            </tr>
          <tr><td>Dash warning lights</td><td>#DashLight# </td>
            <td>&nbsp;</td>
            <td>Tire Wear < 3/32 Replace</td>
            <td>#Equ_TireWear# </td>
            </tr>
          <tr><td>Horn</td><td>#Horn# </td>
            <td>&nbsp;</td>
            <td><strong>SAFETY</strong></td>
            <td>&nbsp;</td>
            </tr>
          <tr><td>Tires-Wheels-Inflation</td><td>#Tires# </td>
            <td>&nbsp;</td>
            <td>Crew Has Appropriate PPE</td>
            <td>#Saf_Crew_Has_Appropriate_PPE# </td>
            </tr>
          <tr><td>Brakes fluid reservoir level</td><td>#BrakesFluid# </td>
            <td>&nbsp;</td>
            <td>Fire Extinguisher&nbsp;Tagged and Current</td>
            <td>#Saf_Fire_Extinguisher_Tagged_and_Current# </td>
            </tr>
          <tr><td>Turn signals/4-way flashers</td><td>#TurnSignal# </td>
            <td>&nbsp;</td>
            <td>First Aid Kit (Open/Unopened)</td>
            <td>#Saf_First_Aid_Kit# </td>
            </tr>
          <tr><td>Radiator coolant level/Condition of Hoses Brakes</td><td>#Radiator# </td>
            <td>&nbsp;</td>
            <td>Flares</td>
            <td>#Saf_Flares# </td>
            </tr>
          <tr><td>Reverse Alert System</td><td>#AlertSystem# </td>
            <td>&nbsp;</td>
            <td>Eyewash</td>
            <td>#Saf_Eyewash# </td>
            </tr>
          <tr>
            <td width="40%" ><strong>TRAILER</strong></td><td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Emergency Contact / Ins. Card</td>
            <td>#Saf_Emergency_Contact# </td>
            </tr>
          <tr><td>Coupler safety pin</td><td>#CoupletPin# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Brake away switch/ cable</td><td>#Brakeswitch# </td>
            <td>&nbsp;</td>
            <td>Vehicle / Trailer Satisfactory:</td>
            <td><cfoutput> #get_morning_inspections.vehicleSatisfactory#</cfoutput></td>
            </tr>
          <tr><td>Electric connector plug</td><td>#ElectricConnector# </td>
            <td>&nbsp;</td>
            <td>Current Mileage: </td>
            <td><cfoutput> #get_morning_inspections.Current_Mileage#</cfoutput></td>
            </tr>
          <tr><td>Safety chain and hooks</td><td>#SafetyChain# </td>
            <td>&nbsp;</td>
            <td>Problems:</td>
            <td><cfoutput>#get_morning_inspections.problem#</cfoutput></td>
            </tr>
          <tr><td>Jack Stand</td><td>#JackStand# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Tires-Wheels-Inflation</td><td>#TireWheel# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Ramp Cables</td><td>#RampCable# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Springs</td><td>#Spring# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Brakes</td><td>#Brakes# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr><td>Lights/Reflectors</td><td>#Lights# </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          
          </tbody>
        </table>
      </cfoutput>
  <!---     <div class="spacer20"></div>
      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr><td>Vehicle / Trailer Satisfactory: <cfoutput> #get_morning_inspections.vehicleSatisfactory#</cfoutput></td>
        </tr>
        <tr><td>Current Mileage: <cfoutput> #get_morning_inspections.Current_Mileage#</cfoutput></td>
        </tr>
        <tr><td>Problems:<cfoutput>#get_morning_inspections.problem#</cfoutput></td>
        </tr>
      </table> --->
      </td>
      </tr>
      </table>
    </div>
  </div>
  <!-- to clear footer -->
</div>
</body>
</html>
