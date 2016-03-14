<cfquery name="get_weekly_inspections" datasource="jrgm">
SELECT      Inspection_ID, Crew_LeaderID, Inspection_Date, Inspection_Type, Problem, Created_By, Created_On, Current_Mileage, vehicleSatisfactory, 
 InspectionMode,Vehicle_Number, Trailer_Number, oil_change_date_due, inspection_Due,oil_change_mileage_due
 FROM     app_Inspection_Master WHERE  Inspection_ID = #Inspection_ID#
</cfquery>
<cfquery name="get_CL_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch ,phone_cell 
FROM app_employees  WHERE  [Employee ID]  = #get_weekly_inspections.Crew_LeaderID#
</cfquery>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment Maintenance Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="css/form.css" rel="stylesheet" />
<LINK REL="stylesheet" TYPE="text/css" MEDIA="print" HREF="css/print.css">
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <!--centre content goes here -->
    <div class="centrecontent_innernotop">
       
      <div class="header">Weekly Equipment Maintenance Form</div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><table class="tableadmin" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <td>Report ID</td>
                  <td><cfoutput>#get_weekly_inspections.Inspection_ID#</cfoutput></td>
                </tr>
                <tr>
                  <td>Branch</td>
                  <td><cfoutput>#get_CL_info.branch#</cfoutput></td>
                </tr>
                <cfoutput query="get_weekly_inspections">
                  <tr>
                    <td>Vehicle Number</td>
                    <td>#Vehicle_Number#</td>
                  </tr>
                   <tr>
                    <td>Trailer Number</td>
                    <td>#Trailer_Number#</td>
                  </tr>
                </cfoutput>
              </tbody>
            </table></td>
          <td><table class="tableadmin" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <td>Report Date</td>
                  <td><cfoutput>#dateformat(get_weekly_inspections.Inspection_Date,"mm/dd/yy")#</cfoutput></td>
                </tr>
                <tr>
                  <td>Driver's Name</td>
                  <td><cfoutput>#get_CL_info.fullname#</cfoutput></td>
                </tr>
               
                  <tr>
                    <td>Driver's Phone Number</td>
                <td> <cfoutput>#get_CL_info.phone_cell#</cfoutput></td>
                  </tr>
                 <cfoutput query="get_weekly_inspections"> 
                  <tr>
                    <td>Oil Change Due</td>
                      <td><cfif  get_weekly_inspections.oil_change_date_due GT '01/01/1900'>#dateformat(get_weekly_inspections.oil_change_date_due,"mm/dd/yy")#</cfif> </td>  
                  </tr>
                  <tr>
                    <td>Inspection Due</td>
                   <td><cfif  get_weekly_inspections.Inspection_Due GT '01/01/1900'>#dateformat(get_weekly_inspections.Inspection_Due,"mm/dd/yy")#</cfif></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table></td>
        </tr>
      </table>
      <div class="subheader">Equipment&#8212;2 Cycle</div>
      <table border="0" class="tableadmin" width="100%" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td><strong>EQUIPMENT</strong></td>
            <td nowrap="nowrap"><strong>DESC</strong></td>
            <td nowrap="nowrap"><strong>EQ ID</strong></td>
            <td align="center" nowrap="nowrap"><strong>Air Filters Cleaned<br>
              / Replaced</strong></td>
            <td align="center" nowrap="nowrap"><strong>Grease<br>
              Fittings</strong></td>
          </tr>
          <cfquery name="get_weekly_inspections_2cycle" datasource="jrgm">
          SELECT     TOP (2000) ID, Inspection_ID, Engine_cycle, Equipment_ID, Air_Filters_Cleaned_Replaced, Grease_Fittings, Blades_Sharpened_Balanced, Clean_Powerwash, 
                      Current_Hours, Oil_Change_Today, Oil_Change_Due, Oil_Change_Due_Date
FROM       app_Crew_WeeklyEquipment_Inspection WHERE  Inspection_ID  =  #Inspection_ID# AND Engine_cycle =2
          </cfquery>
          <cfoutput query="get_weekly_inspections_2cycle">
            <tr>
              <cfquery name="get_weekly_inspections_2cycle_category" datasource="jrgm">
          SELECT     category,Product_name
FROM      Equipment  WHERE  Equipment_ID  =  '#Equipment_ID#'
          </cfquery>
              <td>#get_weekly_inspections_2cycle_category.category#</td>
               <td>#get_weekly_inspections_2cycle_category.Product_name#</td>
              <td nowrap>#Equipment_ID#</td>
              <td align="center">#Air_Filters_Cleaned_Replaced#</td>
              <td align="center">#Grease_Fittings#</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <div class="subheader">Equipment&#8212;4 Cycle</div>
      <table width="100%" class="tableadmin" border="0" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td><strong>EQUIPMENT</strong></td>
            <td nowrap="nowrap"><strong>DESC</strong></td>
            <td nowrap="nowrap"><strong>EQ ID</strong></td>
            <td align="center" nowrap="nowrap" class="performance_header_4cycle_l"><strong>Current<br>
Hours/Miles</strong></td>
            <td align="center" nowrap="nowrap" class="performance_header_4cycle"><strong>Oil Change<br>
              Today</strong></td>
            <td align="center" nowrap="nowrap" class="performance_header_4cycle_r"><strong>Oil Change<br>
              Due</strong></td>
            <td align="center" nowrap="nowrap"><strong>Air Filters Cleaned<br>
              /Replaced</strong></td>
            <td align="center" nowrap="nowrap"><strong>Blades Sharpened<br>
              /Balanced</strong></td>
            <td align="center" nowrap="nowrap"><strong>Grease<br>
              Fittings</strong></td>
            <td align="center" nowrap="nowrap"><strong>Clean/<br>
              Powerwash</strong></td>
          </tr>
          <cfquery name="get_weekly_inspections_4cycle" datasource="jrgm">
          SELECT   ID, Inspection_ID, Engine_cycle, Equipment_ID, Air_Filters_Cleaned_Replaced, Grease_Fittings, Blades_Sharpened_Balanced, Clean_Powerwash, 
                      Current_Hours, Oil_Change_Today, Oil_Change_Due, Oil_Change_Due_Date,Oil_Change_Due
FROM       app_Crew_WeeklyEquipment_Inspection WHERE  Inspection_ID  =  #Inspection_ID# AND Engine_cycle =4
          </cfquery>
          <cfoutput query="get_weekly_inspections_4cycle">
            <tr>
              <cfquery name="get_weekly_inspections_4cycle_category" datasource="jrgm">
          SELECT     category,Product_name,HOURS_MILEAGE 
FROM      Equipment  WHERE  Equipment_ID  =  '#Equipment_ID#'
          </cfquery>
              <td>#get_weekly_inspections_4cycle_category.category#</td>
              <td>#get_weekly_inspections_4cycle_category.Product_name#</td>
           <td align="center">#Equipment_ID#</td>
              
             <CFIF get_weekly_inspections_4cycle_category.hours_mileage LT 3>    
         <td align="center" class="performance_4cycle_l">#Current_Hours#</td>
          <cfelse> 
         <td align="center" class="performance_4cycle_l">-</td>  
         </cfif>
     <td align="center" class="performance_4cycle"><cfif Oil_Change_Today EQ 1>
                  Yes
                </cfif>
                &nbsp;</td>
               
               <td align="center" class="performance_4cycle_r">#Oil_Change_Due#</td>
              <td align="center">#Air_Filters_Cleaned_Replaced#</td>
              <td align="center">#Blades_Sharpened_Balanced#</td>
              <td align="center">#Grease_Fittings# </td>
              <td align="center">#Clean_Powerwash# </td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <cfquery name="get_weekly_inspections_vehicle" datasource="jrgm">
          SELECT      CheckList_ID, Inspection_ID, Vehicle_ID, Current_Mileage, Oil_Change_Due, ATF_Level_Engine_Hot, Inspect_Seat_Belts, 
                      Clean_Glass_Check_for_breakage, Inside_cab_free_garbage, Wash_Vehicle, Rear_vision_mirrors, Windshield_wipers, Parking_brake, Check_power_steering, 
                      Grease_axle_dump_body, Check_for_current_registration, Trailer_ID, Trailer_Grease_axle_dump_body,oil_change_due
FROM         app_Inspection_Weekly_CheckList WHERE Inspection_ID =#Inspection_ID#
      </cfquery>
      <table border="0" class="tableadmin" width="100%" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td><div class="subheader">Vehicle ID <cfoutput>#get_weekly_inspections_vehicle.Vehicle_ID#</cfoutput></div></td>
            <td align="center" nowrap="nowrap"><strong>Complete or NA</strong></td>
            <td align="center" nowrap="nowrap">&nbsp;</td>
            <td align="center" nowrap="nowrap">&nbsp;</td>
            <td align="center" nowrap="nowrap"><strong>Complete or NA</strong></td>
          </tr>
          <cfoutput query="get_weekly_inspections_vehicle">
            <tr>
              <td>Current Mileage</td>
              <td align="center">#Current_Mileage#</td>
              <td align="center">&nbsp;</td>
              <td>Rear vision mirrors</td>
              <td align="center">#Rear_vision_mirrors#</td>
            </tr>
            <tr>
              <td>Oil Change Due</td>
              <td align="center">#oil_change_due#</td>
              <td align="left"><img src="images/clear.gif" width="40" height="1" /></td>
              <td>Windshield wipers</td>
              <td align="center">#Windshield_wipers#</td>
            </tr>
            <tr>
              <td>ATF Level Engine Hot</td>
              <td align="center">#ATF_Level_Engine_Hot#</td>
              <td align="left">&nbsp;</td>
              <td align="left">Parking brake</td>
              <td align="center">#Parking_brake#</td>
            </tr>
            <tr>
              <td>Inspect Seat Belts</td>
              <td align="center">#Inspect_Seat_Belts#</td>
              <td align="left">&nbsp;</td>
              <td align="left">Check power steering fluid level, condition of hoses</td>
              <td align="center">#Check_power_steering#</td>
            </tr>
            <tr>
              <td>Clean Glass, Check for breakage</td>
              <td align="center">#Clean_Glass_Check_for_breakage#</td>
              <td align="left">&nbsp;</td>
              <td align="left">Grease / axle dump body</td>
              <td align="center">#Grease_axle_dump_body#</td>
            </tr>
            <tr>
              <td>Inside cab free garbage</td>
              <td align="center">#Inside_cab_free_garbage#</td>
              <td align="left">&nbsp;</td>
              <td align="left">Check for current registration</td>
              <td align="center">#Check_for_current_registration#</td>
            </tr>
            <tr>
              <td>Wash Vehicle</td>
              <td align="center">#Wash_Vehicle#</td>
              <td align="left">&nbsp;</td>
              <td align="left">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <cfoutput query="get_weekly_inspections_vehicle">
        <table border="0" class="tableadmin" width="60%" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td><div class="subheader">Trailer ID #Trailer_ID#</div></td>
              <td align="center" nowrap="nowrap"><strong>Complete or NA</strong></td>
            </tr>
            <tr>
              <td width="80%">Grease / axle Dump Body</td>
              <td align="center">#Trailer_Grease_axle_dump_body#</td>
            </tr>
          </tbody>
        </table>
      </cfoutput> </div>
  </div>
</div>
</body>
</html>
