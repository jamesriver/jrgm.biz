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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.alertbox {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#F3F3F3;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#FFFFFF;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:5px 5px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}

.eqbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:32px;
	-moz-border-radius-topleft:32px;
	border-top-left-radius:32px;
	-webkit-border-top-right-radius:32px;
	-moz-border-radius-topright:32px;
	border-top-right-radius:32px;
	-webkit-border-bottom-right-radius:32px;
	-moz-border-radius-bottomright:32px;
	border-bottom-right-radius:32px;
	-webkit-border-bottom-left-radius:32px;
	-moz-border-radius-bottomleft:32px;
	border-bottom-left-radius:32px;
	text-indent:9px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#07482f;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:168px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.eqbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}
.eqbutton:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">  
   <div class="centrecontent_inner">
<div class="header">Forms</div>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="details_desc"><a title="Crew Safety Inspection Form" href="https://docs.google.com/a/jrgm.com/forms/d/1Xzca36B_5cezYnvPcVJyg2x8N6eQCADXJPC8ms7ozd0/viewform?usp=send_form" target="_blank">Crew Safety Inspection Form</a></td>
    <td class="details_desc">&nbsp;</td>
  </tr>
  <tr>
    <td class="details_desc"><a href="https://docs.google.com/a/jrgm.com/forms/d/1PKSKtcxDlJNR8FdCL2JKDRGU1zisD521C5LPnJqYMs0/viewform?usp=send_form" target="_blank">Gate Check</a></td>
    <td class="details_desc">&nbsp;</td>
  </tr>
  <tr>
    <td class="details_desc"><a href="/forms/IncidentReport.php" title="Incident Report" target="_blank" >Incident Report</a></td>
    <td class="details_desc"><a href="IRList.php">Incident Report List</a></td>
  </tr>
  <tr>
    <td class="details_desc"><a title="Injury Report" href="/forms/injury.php" target="_blank">Injury Report</a></td>
    <td class="details_desc"><a href="InjuryList.php">Injury Report List</a></td>
  </tr>
  <tr>
    <td class="details_desc"><a title="PTO Request" href="https://docs.google.com/a/jrgm.com/forms/d/1YxbZHPSg6Iw8Ke-SOoJ3j92LTPJsQ0_6CuhzBoHrzOk/viewform" target="_blank">PTO Request</a>
      </li>
      </ul></td>
    <td class="details_desc"></td>
  </tr>
  <tr>
    <td class="details_desc"><a href="https://docs.google.com/a/jrgm.com/forms/d/1RLdgrKjQrwSokB1khL0bVsV5c1vj-Q-MwZotzxrm6GU/viewform?usp=send_form" target="_blank">Quality Control Audit</a></td>
    <td class="details_desc"></td>
  </tr>
  <tr>
         <td class="details_desc"><a href="https://docs.google.com/a/jrgm.com/forms/d/1yHc5FJBRXDKaSBTExF82vrFN-hL8mNquYgAgOJAKf9U/viewform" target="_blank">Shop Inspection Form</a></td>
         <td class="details_desc"></td>
       </tr>
</table>
   </div></div></div></body>
</html>
