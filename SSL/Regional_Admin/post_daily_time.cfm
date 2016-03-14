<CFSET DS_ID = url.ds_id>
<CFSET mylist = url.mylist>
<CFSET ds_date = url.ds_date>
<CFSET CREW_LEADER_ID = url.CREW_LEADER_ID>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
<link rel="stylesheet" href="css/timepicker_bootstrap_min.css" type="text/css" media="screen" />
<link href="css/bootstrap-timepicker.min.css" type="text/css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
<cfinclude template="includes/topbar.cfm">
<cfquery name="get_this_crew_leader" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM APP_employees WHERE [Employee ID] =   #CREW_LEADER_ID#  
</cfquery>
<!--centre content goes here -->
<div class="centrecontent_inner">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="5" class="header">Daily Sheet </td>
  </tr>
  <tr>
    <td class="dailysheet_header">Crew Leader : </td>
    <td  class="subheadersp">&nbsp;<cfoutput>#get_this_crew_leader.EMPLOYEE_NAME#</cfoutput> </td>
    <td width="40"></td>
    <td class="dailysheet_header">Work Date : </td>
    <td  class="subheadersp">&nbsp;<cfoutput>#url.ds_date#</cfoutput> </td>
  </tr>
</table>
<div class="spacer10"></div>
<form class="css_form" action="employee_time_logic.cfm" method="post">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="timesheet_header">Employee Name</td>
      <td class="timesheet_header">Time In</td>
      <td class="timesheet_header">Time Out</td>
      <td class="timesheet_header">Time In</td>
      <td class="timesheet_header">Time Out</td>
    </tr>
    <cfquery name="get_employees_for_ds" datasource="jrgm">
SELECT [Name FirstLast] AS employee_name,[employee id] as employee_ID
FROM APP_employees WHERE   [Employee ID] IN (#mylist#)
</cfquery>
    <CFSET boxcounterplus =0>
    <cfoutput query="get_employees_for_ds">
      <tr>
        <td class="timesheet_data" valign="middle">#EMPLOYEE_NAME#</td>
        <td class="timesheet_data" valign="middle"><CFSET boxcounterplus=boxcounterplus+1>
          <div class="well">
          <div id="datetimepicker3" class="input-append">
          <div class="input-append bootstrap-timepicker">
            <input id="timepicker#boxcounterplus#" type="text" class="input-small" name="timeina_#Employee_ID#" />
            <span class="add-on"><i class="icon-time"></i></span> </div></td>
        <td class="timesheet_data" valign="middle"><CFSET boxcounterplus=boxcounterplus+1>
          <div class="well">
          <div id="datetimepicker3" class="input-append">
          <div class="input-append bootstrap-timepicker">
            <input id="timepicker#boxcounterplus#" type="text" class="input-small" name="timeouta_#Employee_ID#" />
            <span class="add-on"><i class="icon-time"></i></span> </div></td>
        <td class="timesheet_data" valign="middle"><CFSET boxcounterplus=boxcounterplus+1>
          <div class="well">
          <div id="datetimepicker3" class="input-append">
          <div class="input-append bootstrap-timepicker">
            <input id="timepicker#boxcounterplus#" type="text" class="input-small" name="timeinb_#Employee_ID#" />
            <span class="add-on"><i class="icon-time"></i></span> </div></td>
        <td class="timesheet_data" valign="middle"><CFSET boxcounterplus=boxcounterplus+1>
          <div class="well">
          <div id="#boxcounterplus#" class="input-append">
          <div class="input-append bootstrap-timepicker">
            <input id="timepicker#boxcounterplus#" type="text" class="input-small" name="timeoutb_#Employee_ID#" />
            <span class="add-on"><i class="icon-time"></i></span> </div></td>
      </tr>
    </cfoutput>
    <tr>
      <td class="services_list">&nbsp;</td>
      <td class="services_list">&nbsp;</td>
      <td class="services_list">&nbsp;</td>
      <td class="services_list">&nbsp;</td>
      <td class="services_list"><div class="spacer10"></div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><cfoutput>
          <input type="hidden" name="ds_date"   value="#ds_date#" />
          <input type="hidden" name="ds_id"   value="#ds_id#" />
          <input type="hidden" name="CREW_LEADER_ID"   value="#CREW_LEADER_ID#" />
        </cfoutput>
        <input type="submit" name="submit_hours"   value="SUBMIT" class="bluebutton" />
        &nbsp;</td>
    </tr>
  </table>
</form>
<div class="spacer20"></div>
<!-- to clear footer -->
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script src="js/jquery.pageslide.min.js"></script>
<script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script type="text/javascript">
$('#timepicker1').timepicker();
</script>
<script type="text/javascript">
$('#timepicker2').timepicker();
</script>
<script type="text/javascript">
$('#timepicker3').timepicker();
</script>
<script type="text/javascript">
$('#timepicker4').timepicker();
</script>
<script type="text/javascript">
$('#timepicker5').timepicker();
</script>
<script type="text/javascript">
$('#timepicker6').timepicker();
</script>
<script type="text/javascript">
$('#timepicker7').timepicker();
</script>
<script type="text/javascript">
$('#timepicker8').timepicker();
</script>
<script type="text/javascript">
$('#timepicker9').timepicker();
</script>
<script type="text/javascript">
$('#timepicker10').timepicker();
</script>
<script type="text/javascript">
$('#timepicker11').timepicker();
</script>
<script type="text/javascript">
$('#timepicker12').timepicker();
</script>
<script type="text/javascript">
$('#timepicker13').timepicker();
</script>
<script type="text/javascript">
$('#timepicker14').timepicker();
</script>
<script type="text/javascript">
$('#timepicker15').timepicker();
</script>
<script type="text/javascript">
$('#timepicker16').timepicker();
</script>
</body>
</html>
