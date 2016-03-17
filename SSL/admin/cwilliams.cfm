<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
html {
	position: relative;
	min-height: 100%;
}
body {
	margin: 0 0 100px; /* bottom = footer height */
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 100px;
	width: 100%;
	}
.dstableno {
	padding: 8px;
	color: #000;
	font: normal .8em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
li {
	font: normal .9em Arial, Helvetica, sans-serif;
	line-height: 24px;
}
 </style>
 <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar_cw.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="subheader"> Administrative Forms <br />
    </div>
<table>
 <tr>  
 <td>
   <div class="dashboardHeader">Incident</div>
    <ul>
      <li><a href="http://jrgm.biz/forms/irlist.cfm">Incident Report List</a></li>
      <li><a href="/forms/IncidentReport.php" target="_blank">Start a new Incident Report</a></li>
    </ul>
 <div class="dashboardHeader">Injury</div>
    <ul>
      <li><a href="http://jrgm.biz/forms/injurylist.php">Injury Report List</a></li>
      <li><a href="/forms/injury.php" target="_blank">Start a new Injury Report</a></li>
    </ul>
  </td>
 </tr>
 </table>
 </div>
 </div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
