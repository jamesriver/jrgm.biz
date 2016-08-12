<cfquery name="get_evening_inspections" datasource="jrgm">
SELECT        Inspection_ID, Crew_LeaderID, inspection_date,Inspection_due, Inspection_Type, Problem, Created_By, Created_On, Current_Mileage, vehicleSatisfactory, 
 InspectionMode,Vehicle_Number, Trailer_Number,oil_change_mileage_due
FROM     app_Inspection_Master WHERE  Inspection_ID = #Inspection_ID#
</cfquery>
<cfquery name="get_CL_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch ,phone_cell
FROM app_employees  WHERE  [Employee ID]  = #get_evening_inspections.Crew_LeaderID#
</cfquery>


<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>James River Grounds Management -End of Day Inspection Form</title>
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
      <div class="header">End of Day Inspection Form</div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><table class="tableadmin" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <td>Report ID</td>
                  <td><cfoutput>#get_evening_inspections.Inspection_ID#</cfoutput></td>
                </tr>
                <tr>
                  <td>Branch</td>
                  <td><cfoutput>#get_CL_info.branch#</cfoutput></td>
                </tr>
                <cfoutput query="get_evening_inspections">
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
                  <td><cfoutput>#dateformat(get_evening_inspections.Inspection_Date,"mm/dd/yy")#</cfoutput></td>
                </tr>
                <tr>
                  <td>Driver's Name</td>
                  <td><cfoutput>#get_CL_info.fullname#</cfoutput></td>
                </tr>
                
                 <tr>
              <td>Driver's Phone Number</td>
              <td align="left"><cfoutput>#get_CL_info.phone_cell#</cfoutput></td> 
            </tr>
               <cfoutput query="get_evening_inspections">
               <tr>
                  <td>Current Mileage</td>
                  <td><cfif  get_evening_inspections.Current_Mileage IS ""  OR get_evening_inspections.Current_Mileage EQ 0 >[ Not recorded in app ]<cfelse>#Current_Mileage# </cfif></td>
               </tr>
               <tr>
                  <td>Oil Change Due</td>
                  <td> <cfif  get_evening_inspections.oil_change_mileage_due IS ""  OR get_evening_inspections.oil_change_mileage_due EQ 0 >[ Not recorded in app ]<cfelse>#oil_change_mileage_due# </cfif></td>
               </tr>
            <!--- 
                 <cfoutput query="get_evening_inspections">  
                 <tr>
                    <td>Oil Change Due</td>
                   <td> #oil_change_mileage_due# </td>
                  </tr> --->
               <tr>
                    <td>Inspection Due</td>
                    <td><cfif  get_evening_inspections.Inspection_Due GT '01/01/1900'>#dateformat(get_evening_inspections.Inspection_Due,"mm/dd/yy")#</cfif></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table></td>
        </tr>
      </table>
      <table border="0" width="100%" class="tableadmin" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th align="left">EQUIPMENT</th>
            <th align="center" nowrap="nowrap" >EQ ID</th>
            <th align="center" nowrap="nowrap" > Good Working Order</th>
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
    </div>
  </div>
  <!-- to clear footer -->
</div>
</body>
</html>
