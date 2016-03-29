 
 <!---<cfoutput>#APPLICATION.pay_period_number_current_calendar#</cfoutput> --->
<CFPARAM name="random" default="0">
<cfquery name="get_payroll_block_info" datasource="jrgm" maxrows="1">
SELECT * FROM payroll_block 
ORDER by ID DESC
</cfquery>
<cfoutput query="get_payroll_block_info">
  <CFSET block_date ='#block_date#'>
  <CFSET pay_period_week1 =#pay_period_week1#>
  <CFSET pay_period_week2 =#pay_period_week2#>
  <CFSET pay_period_number =#pay_period_number#>
  <CFSET week1_date_available ='#week1_date_available#'>
  <CFSET week2_date_available ='#week2_date_available#'>
  <CFSET pay_period_week1_date ='#pay_period_week1_date#'>
  <CFSET pay_period_week2_date ='#pay_period_week2_date#'>
  <!--- Set prior variables--->
  <CFSET block_date_prior = dateadd("d",-14,block_date)>
  <CFSET pay_period_week1_prior =#pay_period_week1#-2>
  <CFSET pay_period_week2_prior =#pay_period_week2#-2>
  <CFSET pay_period_number_prior =#pay_period_number#-1>
  <CFSET week1_date_available_prior=  dateadd("d",-14,week1_date_available)>
  <CFSET week2_date_available_prior =  dateadd("d",-14,week2_date_available)>
  <CFSET pay_period_week1_date_prior =  dateadd("d",-14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_prior  = dateadd("d",-14,pay_period_week2_date)>
  
  <!--- Set next variables--->
  <CFSET block_date_next = dateadd("d",14,block_date)>
  <CFSET pay_period_week1_next =#pay_period_week1#+2>
  <CFSET pay_period_week2_next =#pay_period_week2#+2>
  <CFSET pay_period_number_next =#pay_period_number#+1>
  <CFSET week1_date_available_next=  dateadd("d",14,week1_date_available)>
  <CFSET week2_date_available_next =  dateadd("d",14,week2_date_available)>
  <CFSET pay_period_week1_date_next =  dateadd("d",14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_next  = dateadd("d",14,pay_period_week2_date)>
</cfoutput>
<cfif IsDefined("url.change") AND url.change EQ 'prior'>
<!---  Do change to prior--->
  <cfquery name="update_payroll_block_info_prior" datasource="jrgm" >
UPDATE payroll_block 
SET 
block_date = #block_date_prior#,
pay_period_week1 =#pay_period_week1_prior#,
pay_period_week2 =#pay_period_week2_prior#,
pay_period_number =#pay_period_number_prior#,
week1_date_available=  #week1_date_available_prior#,
week2_date_available=  #week2_date_available_prior#, 
pay_period_week1_date =  #pay_period_week1_date_prior#, 
pay_period_week2_date =  #pay_period_week2_date_prior#
</cfquery>
</cfif>

<cfif IsDefined("url.change") AND url.change EQ 'next'>
 <!--- Do change to next--->
 <cfquery name="update_payroll_block_info_next" datasource="jrgm" >
 UPDATE payroll_block 
SET 
block_date = #block_date_next#,
pay_period_week1 =#pay_period_week1_next#,
pay_period_week2 =#pay_period_week2_next#,
pay_period_number =#pay_period_number_next#,
week1_date_available=  #week1_date_available_next#,
week2_date_available=  #week2_date_available_next#, 
pay_period_week1_date =  #pay_period_week1_date_next#, 
pay_period_week2_date =  #pay_period_week2_date_next#
</cfquery>
</cfif>


<cfquery name="get_payroll_block_info" datasource="jrgm" maxrows="1">
SELECT * FROM payroll_block 
ORDER by ID DESC
</cfquery>
<cfoutput query="get_payroll_block_info">
  <CFSET block_date ='#block_date#'>
  <CFSET pay_period_week1 =#pay_period_week1#>
  <CFSET pay_period_week2 =#pay_period_week2#>
  <CFSET pay_period_number =#pay_period_number#>
  <CFSET week1_date_available ='#week1_date_available#'>
  <CFSET week2_date_available ='#week2_date_available#'>
  <CFSET pay_period_week1_date ='#pay_period_week1_date#'>
  <CFSET pay_period_week2_date ='#pay_period_week2_date#'>
  <!--- Set prior variables--->
  <CFSET block_date_prior = dateadd("d",-14,block_date)>
  <CFSET pay_period_week1_prior =#pay_period_week1#-2>
  <CFSET pay_period_week2_prior =#pay_period_week2#-2>
  <CFSET pay_period_number_prior =#pay_period_number#-1>
  <CFSET week1_date_available_prior=  dateadd("d",-14,week1_date_available)>
  <CFSET week2_date_available_prior =  dateadd("d",-14,week2_date_available)>
  <CFSET pay_period_week1_date_prior =  dateadd("d",-14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_prior  = dateadd("d",-14,pay_period_week2_date)>
  
  <!--- Set next variables--->
  <CFSET block_date_next = dateadd("d",14,block_date)>
  <CFSET pay_period_week1_next =#pay_period_week1#+2>
  <CFSET pay_period_week2_next =#pay_period_week2#+2>
  <CFSET pay_period_number_next =#pay_period_number#+1>
  <CFSET week1_date_available_next=  dateadd("d",14,week1_date_available)>
  <CFSET week2_date_available_next =  dateadd("d",14,week2_date_available)>
  <CFSET pay_period_week1_date_next =  dateadd("d",14,pay_period_week1_date)>
  <CFSET pay_period_week2_date_next  = dateadd("d",14,pay_period_week2_date)>
</cfoutput>


<CFSET pay_period_end_week_L  =  pay_period_number-1>
<CFSET pay_period_week_week1  =  pay_period_week-1>
<CFSET pay_period_end_week  =  pay_period_number>
<cfquery name="app_payroll_periods_W" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #APPLICATION.pay_period_number_current_calendar#
 </cfquery>
<cfquery name="app_payroll_periods_C" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
 </cfquery>
<cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_number = #pay_period_end_week_L#
 </cfquery>
<CFSET pay_period_end_week_plusone =  dateadd("d",1,app_payroll_periods_L.pay_period_end)>
<CFSET pay_period_end_week_plusoneC =  dateadd("d",1,app_payroll_periods_C.pay_period_end)>
<cfquery name="app_payroll_periods_Week1" datasource="jrgm">
 SELECT  pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week_week1#
 </cfquery>
<!--- <cfdump var="#app_payroll_periods_Week1#">--->
<CFSET pay_period_end_week1_plusone =  dateadd("d",1,app_payroll_periods_Week1.pay_period_end)>
<CFSET pay_period_number_for_csv = pay_period_number -1>
<CFSET adp_approval_date_next  =  dateadd("d",2,APPLICATION.pay_period_week2_date)>
<CFSET next_adp_block_date  =  dateadd("d",14,APPLICATION.blockdate)>
<CFSET prior_adp_block_date  =  dateadd("d",-14,APPLICATION.blockdate)>
<cfset somedate = todayDate>
<cfset today = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet" />
<link href="../assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet" />
<link href="../assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="../assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="../assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="../assets/admin/layout3/css/custom-pat.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style>
.bigfont {
	padding: 5px;
	color: #000;
	font: bold 18px Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .6em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: bold .9em Arial, Helvetica, sans-serif;
}
.dashboardHeader {
	margin-top: 10px;
	color: #333;
	font: bold 16px Arial, Helvetica, sans-serif;
}
a {
	color: #006fa7;
	text-decoration: none;
}
a:hover {
	color: #000;
	text-decoration: none;
}
.greenText {
	color: green;
}
.table {
	width: 90%;
 padding-bottom:
}
.panel .panel-body {
	font-size: 14px;
	padding: 5px;
	padding-left: 15px;
	background-color: #DBEBF8
}
th {
	text-align: center;
	vertical-align: bottom;
	padding: 10px 5px 4px 5px;
	margin-right: 50px;
}
.th1 {
	text-align: left;
	vertical-align: bottom;
	padding: 10px 5px 4px 5px;
	margin-right: 50px;
}
.td {
	padding-bottom: 20px;
}
.header {
	padding-right: 20px;
	padding-bottom: 10px;
	font: 28px Arial, Helvetica, sans-serif;
	color: #00573d;
}
.style21 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>

<CFIF APPLICATION.pay_period_number_current_calendar NEQ #pay_period_number#>
 <table width="100%" cellpadding="0" cellspacing="0">
  <tr bgcolor="#B90000">
    <td colspan="2" align="center" valign="middle" nowrap="nowrap" class="style21" height="30"  >ALERT!<br />
THE PAYROLL BLOCK IS NOT IN THE CURRENT PERIOD. PLEASE CORRECT.</td>
  </tr>
</table>   


</CFIF>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="../header-include-betty.cfm">
  <cfinclude template="../header-menu-betty.cfm">
</div>
<cfoutput>
  <div class="panel panel-info">
  <div class="panel-body"> <strong>Today's Date : #DateFormat("#theDate#", "mmmm dd,yyyy")# &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next  Payroll Approval Date for ADP : Monday #DateFormat("#adp_approval_date_next#",  "mmmm dd,yyyy")# </strong></div>
  <div class="panel-body">
  <table>
    <tbody>
      <tr>
        <td>Current Payroll Period ##<strong>#pay_period_number#</strong></td>
        <td>&nbsp;</td>
        <td>Current Payroll Period Dates <strong>#DateFormat("#app_payroll_periods_C.pay_period_start#", "mm/dd/yyyy")# - #DateFormat("#app_payroll_periods_C.pay_period_end#", "mm/dd/yyyy")#</strong></td>
      </tr>
      <!---<tr>
        <td>Current Payroll Week ##<strong>#pay_period_week#</strong></td>
        <td width="25">&nbsp;</td>
        <td>Current Payroll Week Dates&nbsp; <strong>#DateFormat("#app_payroll_periods_W.pay_period_start#", "mm/dd/yyyy")# - #DateFormat("#app_payroll_periods_W.pay_period_end#", "mm/dd/yyyy")#</strong></td>
      </tr>--->
    </tbody>
  </table>
</cfoutput>
</div>
</div>
<table width="90%" border="0" align="center">
  <tbody>
    <tr>
      <td><br />
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="header">Payroll Block</span></td>
            <td align="right"><a href="payrollBetty.cfm"  class="bluebutton"> Go to  Main Payroll Page </a></td>
          </tr>
        </table>
        <p><br />
        </p>
        <table width="100%" border="0" align="center">
          <tbody>
            <tr>
              <td><p><span class="bigfont">The payroll block is implemented for <cfoutput>#DateFormat("#APPLICATION.blockdate#", "mmmm dd,yyyy")#</cfoutput>. 
                  Any payroll prior to this date cannot be edited.</span><br />
                </p>
                <cfoutput>
                  <table border="0" width="650">
                    <tbody>
                      <tr>
                        <td colspan="5" align="center" bgcolor="##D5F7D4" height="40"><strong>This is the current information in the application.cfm</strong></td>
                      </tr>
                      <tr>
                        <td bgcolor="##D5F7D4">Payroll Blockdate</td>
                        <td bgcolor="##D5F7D4">#DateFormat("#block_date#", "mm/dd/yyyy")#</td>
                        <td width="100" bgcolor="##D5F7D4">&nbsp;</td>
                        <td bgcolor="##D5F7D4">Pay Period Number</td>
                        <td bgcolor="##D5F7D4">#pay_period_number#</td>
                      </tr>
                      <tr>
                        <td bgcolor="##D5F7D4">Pay Period Week 1</td>
                        <td bgcolor="##D5F7D4">#pay_period_week1#</td>
                        <td width="100" bgcolor="##D5F7D4">&nbsp;</td>
                        <td bgcolor="##D5F7D4">Pay Period Week 2</td>
                        <td bgcolor="##D5F7D4">#pay_period_week2#</td>
                      </tr>
                      <tr>
                        <td bgcolor="##D5F7D4">Pay Period Week 1 Date</td>
                        <td bgcolor="##D5F7D4">#DateFormat("#pay_period_week1_date#", "mm/dd/yyyy")#</td>
                        <td width="100" bgcolor="##D5F7D4">&nbsp;</td>
                        <td bgcolor="##D5F7D4">Pay Period Week 2 Date</td>
                        <td bgcolor="##D5F7D4">#DateFormat("#pay_period_week2_date#", "mm/dd/yyyy")#</td>
                      </tr>
                      <tr>
                        <td bgcolor="##D5F7D4">Week 1 Date Available</td>
                        <td bgcolor="##D5F7D4">#DateFormat("#week1_date_available#", "mm/dd/yyyy")#</td>
                        <td width="100" bgcolor="##D5F7D4">&nbsp;</td>
                        <td bgcolor="##D5F7D4">Week 2 Date Available</td>
                        <td bgcolor="##D5F7D4">#DateFormat("#week2_date_available#", "mm/dd/yyyy")#</td>
                      </tr>
                    </tbody>
                  </table>
                </cfoutput></td>
            </tr>
          </tbody>
        </table>
        <p><br />
          <br />
          <br />
        
        
        <table width="90%" border="0">
          <tbody>
            <tr>
              <td>
			  
			  <CFIF APPLICATION.pay_period_number_current_calendar LTE #pay_period_number#>
			  <CFSET random = #random# -1>
              Do you want to change the payroll block date to the <u>prior</u> pay period?<br />
                This action will make the payroll block date <cfoutput><strong>#DateFormat("#block_date_prior#", "mmmm dd,yyyy")#</strong></cfoutput>. <br />
                <br />
                <p><a href="payroll_block.cfm?change=prior&random=<cfoutput>#random#</cfoutput>" class="btn btn-success" role="button" ><strong>Yes</strong></a> </p>
                <p>&nbsp;</p></CFIF>
                </td>
              <td>&nbsp;</td>
              <td>
                 <CFIF today GTE #week2_date_available#>
                 <CFSET random = #random# +1> Do you want to change the date to the <u>next</u> pay period? <br />
                  This action will make the payroll block date <strong><cfoutput>#DateFormat("#block_date_next#", "mmmm dd,yyyy")#</cfoutput>. </strong> <br />
                  <br />
                  <p  text-indent: 50px><a href="payroll_block.cfm?change=next&random=<cfoutput>#random#</cfoutput>" class="btn btn-success" role="button"><strong>Yes</strong></a> </p>
                  <p>
                 </CFIF></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<!-- end outer div -->
<cfinclude template="../footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
<!-- END BODY -->
</html>
