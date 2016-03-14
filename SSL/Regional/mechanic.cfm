<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE <!--- (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) --->Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
<script src="js/Jquerybvalidator.js" type="text/javascript"></script>
<script src="js/jquery.mask.js" type="text/javascript"></script>
<script src="js/JavaScript2.js" type="text/javascript"></script>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<link href="css/date.css" rel="stylesheet" />
<script type="text/javascript">
        $(document).ready(function () {
            $('#myform').bValidator();
        });
    </script>
<script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#Inspectiondue").datepicker();
            $("#Oilchangedue").datepicker();

        });
    </script>
<script type="text/javascript">
         $(function () {
             $("#tel").mask("(999) 999-9999");


         });
    </script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
<cfinclude template="includes/topbar_inventory.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">
  <div class="header">Inventory for Repairs</div>
  <table width="100%" border="0" cellpadding="0"cellspacing="0">
    <tr>
      <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
      <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
      <td valign="top" class="vehicle_inventory">&nbsp;</td>
      <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
      <td align="center" valign="top" class="vehicle_inventory"><strong>Comments</strong></td>
    </tr>
    <tr>
      <td valign="top" class="vehicle_inventory">CLASSEN TA-25D AERATOR</td>
      <td align="center" valign="top" class="vehicle_inventory">23-18</td>
      <td valign="top" class="vehicle_inventory">&nbsp;</td>
      <td align="center" valign="top" class="vehicle_inventory"><input type="date" name="date2" id="date2" /></td>
      <td align="center" valign="top" class="vehicle_inventory"><textarea name="textarea" id="textarea" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td valign="top" class="vehicle_inventory">EBZ 7100 BLOWER</td>
      <td align="center" valign="top" class="vehicle_inventory">12348</td>
      <td valign="top" class="vehicle_inventory">&nbsp;</td>
      <td align="center" valign="top" class="vehicle_inventory"><input type="date" name="date2" id="date2" /></td>
      <td align="center" valign="top" class="vehicle_inventory"><textarea name="textarea" id="textarea" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
    <td></tr>    </td>
    </tr>
    <tr>
      <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
      <td align="center" valign="top" class="vehicle_inventory">S-27</td>
      <td valign="top" class="vehicle_inventory">&nbsp;</td>
      <td align="center" valign="top" class="vehicle_inventory"><input type="date" name="date2" id="date2" /></td>
      <td align="center" valign="top" class="vehicle_inventory"><textarea name="textarea" id="textarea" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
    <td></tr>    </td>
    </tr>
  </table>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
