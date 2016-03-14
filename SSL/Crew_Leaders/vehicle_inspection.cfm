<cfset Now_Time = Now()>
<cfparam name="Session.job_id" default="0000">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM jobs WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid#  
ORDER by Work_Loc_Name
</cfquery>
<cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader_ID, crew_name AS employee_name  FROM crews WHERE (Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#)  
</cfquery>
<CFSET mylist ="#SESSION.userid#">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<cfquery name="get_if_any_employee_clocked_in" datasource="jrgm" >
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Vehicle Inspection Report</td>
          <td align="right" class="header"><!---<cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>--->
            <table border="0" cellspacing="0" cellpadding="0">
              <!---              <cfoutput>
--->
              <tr>
                <td><!---<a href="job_list.cfm?work_date=#dateformat(yesterday,"mm/dd/yyyy")#&job_id=#job_id#">--->
                  <img src="images/minus.gif" width="36" height="36" /></a></td>
                <td class="date"><!--#DateFormat(todayDate, "ddd, mmmm dd, yyyy")#-->
                  Tuesday, March 12, 2013</td>
                <td><!---<a href="job_list.cfm?work_date=#dateformat(tomorrow,"mm/dd/yyyy")#&job_id=#job_id#">--->
                  <img src="images/plus.gif" width="36" height="36" /></a></td>
              </tr>
              <!---              </cfoutput>
--->
            </table></td>
        </tr>
      </table>
      <div class="spacer20"></div>
      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><table width="80%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="vehicle_inventory">Driver's Name</td>
                <td align="center" class="vehicle_inventory"><input name="textfield3" type="text" id="textfield3" size="10" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Driver's Phone</td>
                <td align="center" class="vehicle_inventory"><input name="textfield3" type="text" id="textfield3" size="10" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Vehicle Number</td>
                <td align="center" class="vehicle_inventory"><input name="textfield3" type="text" id="textfield4" size="10" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Trailer Number</td>
                <td align="center" class="vehicle_inventory"><input name="textfield5" type="text" id="textfield7" size="10" /></td>
              </tr>
            </table></td>
          <td valign="top"><table width="80%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="vehicle_inventory">Beginning Mileage</td>
                <td align="center" class="vehicle_inventory"><input name="textfield4" type="text" id="textfield5" size="10" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Inspection Due</td>
                <td align="center" class="vehicle_inventory"><input name="textfield4" type="text" id="textfield5" size="10" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">P.M. Due</td>
                <td align="center" class="vehicle_inventory"><input name="textfield4" type="text" id="textfield6" size="10" /></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <div class="spacer20"></div>
      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="vehicle_inventory"><strong>VEHICLE</strong></td>
                <td width="10%" align="center" class="vehicle_inventory">Pass</td>
                <td width="10%" align="center" class="vehicle_inventory">Fail</td>
              </tr>
              <tr>
                <td class="vehicle_inventory">ATF Level</span></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Belts Tension & Condition</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Engine Oil Level</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Power Steering Fluid Level/Condition of Hoses</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Radiator Coolant Level/Condition of Hoses</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Brakes Parking</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Brakes Fluid Reservior Level</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Dash Guage Oil, AMP, Temp</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Door/Window Handles</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Seat Belts</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Glass, Clean, Breakage</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Heater and Defrosters</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Horn</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Inside Cab Free of Garbage</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Rear Vision Mirrors</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Windshield Wipers</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Body/Tailgate</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Tires-Condition, Proper Inflation</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Transmission Operation, Leaks</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Turn Signals/4-Way Flashers</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Reverse Alert System</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Wheel-Cracks</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Current Registration</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Safety Kit</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Any Fluid Leaks</td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="10%" align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio" value="radio" /></td>
              </tr>
            </table></td>
          <td valign="top"><img src="images/clear.gif" width="40" height="1" /></td>
          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="vehicle_inventory"><strong>TRAILER</strong></td>
                <td align="center" class="vehicle_inventory">Pass</td>
                <td align="center" class="vehicle_inventory">Fail</td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Couplet Safety Bolt</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Brake Away Switch/Cable</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Electic Connector Plug</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Safety Chain and Hooks</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Jack Stand</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Grease Dump Body</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Tires-Condition/Inflation</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Wheels and Rims-Cracks</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Wheel Lugs; Loose or Missing</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Springs</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Brakes</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Lights/Reflectors</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory_none">&nbsp;</td>
                <td align="center" class="vehicle_inventory_none">&nbsp;</td>
                <td align="center" class="vehicle_inventory_none">&nbsp;</td>
              </tr>
              <tr>
                <td class="vehicle_inventory"><strong>TRACTORS:</strong></td>
                <td align="center" class="vehicle_inventory">&nbsp;</td>
                <td align="center" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Check Oil</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Clean Filters</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Air Clean (Weekly)</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Grease</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory_none">&nbsp;</td>
                <td align="center" class="vehicle_inventory_none">&nbsp;</td>
                <td align="center" class="vehicle_inventory_none">&nbsp;</td>
              </tr>
              <tr>
                <td class="vehicle_inventory"><strong>SAFETY SUPPLIES:</strong></td>
                <td align="center" class="vehicle_inventory">&nbsp;</td>
                <td align="center" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Fire Extinguisher</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">First Aid Kit (Open/Unopened)</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Flares</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Eyewash</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
              <tr>
                <td class="vehicle_inventory">Emergency Instructions</td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td align="center" class="vehicle_inventory"><input type="radio" name="radio" id="radio2" value="radio" /></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <div class="spacer20"></div>
      <a href="notes.cfm?work_date=#url.work_date#&employee_id=#employee_id#" class="bluebutton">Add Notes</a> </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
