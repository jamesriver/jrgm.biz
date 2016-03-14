<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 <style>
 .arialfont {
	font: bold .9em Arial, Helvetica, sans-serif;
}

 .arialfontnb {
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

table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
	}
	
	table.sortable tbody td:a {
	font:   1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	}
	
	table.sortable tbody td:a:hover {
	font:   1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	border-bottom: 1px solid #c0c0c0;
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
 
 
</style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
   <!--centre content goes here -->
  <div class="centrecontent_inner"> 
     <div class="header">Todays Crews List </div>
 <CFSET DateRequested = #DateFormat(Now(), "mm/dd/yyyy")#>
 <cfquery name="get_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT employee_ID FROM app_employee_payroll_clock   WHERE ds_date = '#DateRequested#'
 </cfquery>
 
  <cfquery name="get_number_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT ID FROM app_daily_sheets   WHERE ds_date = '#DateRequested#'
 </cfquery>
  <strong><cfoutput>  <span class="arialfont">#get_daily_sheets.recordcount# </span></cfoutput><span class="arialfont"> employees working today on <cfoutput>  #get_number_daily_sheets.recordcount#</cfoutput> crews</span></strong><br />
     <br />
 
 <table class="sortable" border="1" cellpadding="5" cellspacing="0" class="arialfont">
   <tr>
    <th align="left" bgcolor="#CCCCCC" class="arialfont"><strong>Emp ID</strong></th>
    <th align="left" bgcolor="#CCCCCC"><strong><span class="arialfont">Crew Name</span></strong></th>
    <th bgcolor="#CCCCCC"><strong><span class="arialfont">#</span></strong></th>
    <th align="right" bgcolor="#CCCCCC"><strong><span class="arialfont">DSID</span></strong></th>
 
  </tr>
   <strong>
   <cfloop query="get_daily_sheets">
     <cfquery name="get_cl_wo_ds_pw" datasource="jrgm">
 SELECT employee_ID,COUNT(DISTINCT ds_id) AS Count FROM  app_employee_payroll_clock   WHERE employee_ID =#get_daily_sheets.employee_ID# AND ds_date ='#DateRequested#' 
GROUP by employee_ID
     </cfquery>
     <cfoutput query="get_cl_wo_ds_pw">   
       
     </cfoutput>
   </cfloop>
   </strong>
   <cfloop query="get_daily_sheets">
     <cfoutput query="get_cl_wo_ds_pw">
       <tr>
         <th align="left"><strong><span class="arialfontnb">#employee_ID#</span></strong></th>
         <cfquery name="get_name" datasource="jrgm">
 SELECT crew_name FROM  app_crews   WHERE employee_ID =#get_daily_sheets.employee_ID#  
   </cfquery>
         <th align="left"><strong><span class="arialfontnb">#get_name.crew_name#</span></strong></th>  
         <th><strong><span class="arialfont">#Count#</span></strong></th>
         <cfif Count GT 1>
           <cfquery name="get_dsids" datasource="jrgm">
    SELECT DISTINCT ds_id FROM  app_employee_payroll_clock   WHERE employee_ID =#get_daily_sheets.employee_ID# AND ds_date ='#DateRequested#' 
         </cfquery>
           <cfloop query="get_dsids">  
             <th align="right"> <strong><span class="arialfontnb">#get_dsids.ds_id#</span></strong> </th></cfloop>
    <cfelse>
    <th><strong>-</strong></th>
    </cfif>
  </tr>
</cfoutput>
    </cfloop>

</table>  
  
</div></div></div>
<br />
<br />

<div id="clearfooter"></div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
