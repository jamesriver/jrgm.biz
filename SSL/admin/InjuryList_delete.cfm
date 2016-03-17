
<cfif IsDefined("deleteme")  AND deleteme  EQ 'yes'>
 <cfquery name="delete_InjuryReport" datasource="jrgm">
DELETE  FROM Form_InjuryReport WHERE   IR_ID  = #url.ID# 
 </cfquery>
 <cflocation url="InjuryList.php">
</cfif>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="/ssl/admin/css/styles.css" rel="stylesheet" type="text/css" />
<link href="/ssl/admin/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="/ssl/admin/css/bootstrap.css" rel="stylesheet" />
<link href="/ssl/admin/css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="/ssl/admin/css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<script src="/ssl/admin/js/sorttable.js"></script>
<script src="/ssl/admin/js/sorttable_v1.js"></script>
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
 
 table.sortable thead th {
	font: bold .75em Arial, Helvetica, sans-serif;
	}

table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
	}
	
	table.sortable tbody td:a {
	font: bold 1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	}
	
	table.sortable tbody td:a:hover {
	font: bold 1em Arial, Helvetica, sans-serif;
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
.eqbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}.eqbutton:active {
	position:relative;
	top:1px;
}
 
</style>

</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="57"><a href="/ssl/admindefault.cfm"><img src="../images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a></td>
      <td class="subbartxt">Welcome: JRGM Admin</td>
      <td width="42"><!--<a href="supervisors/setting.cfm" class="first"><img src="/ssl/admin/images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
      <td width="20"><img src="/ssl/admin/images/clear.gif" width="20" height="2" alt="" /></td>
    </tr>
  </table>
</div>

<div class="topbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="jobbutton">
        
        <a href=""><img src="/ssl/admin/images/icon_payroll.png"  width="60" height="60"  class="icons"/></a> <a href="/ssl/admin/daily_sheet_listing.cfm"><img src="/ssl/admin/images/icon_dailysheet.png" width="60" height="60"  class="icons"/></a> <a href="/ssl/admin/scheduler_select.cfm"><img src="/ssl/admin/images/icon_jobs.png" width="60" height="60" alt="Jobs" class="icons" /></a> <a href="/ssl/admin/scheduler_select.cfm"><img src="/ssl/admin/images/icon_crews.png" width="60" height="60" alt="Crews" class="icons" /></a>
        <a href="/ssl/admin/inventory.cfm"><img src="/ssl/admin/images/icon_inventory.png" width="60" height="60" alt="Crews" class="icons" /></a>
        <a href="/ssl/admin/directory.cfm"><img src="/ssl/admin/images/directory_icon.png" width="60" height="60" alt="Crews" class="icons" /></a>
         <a href="forms.cfm"><img src="/ssl/admin/images/icon_forms.png" width="60" height="60" alt="Forms" /></a></td> </td>
      <td align="right"><a href="/ssl/admin/default.cfm"><img src="/ssl/admin/images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a> <a href="/ssl/admin/index.cfm"><img src="/ssl/admin/images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a> </td>
    </tr>
  </table>
</div>

 
  <!--centre content goes here -->
  <div class="centrecontent_inner">  
  
   

    <div class="header">Injury Reports</div>
   <div class="lgaddress">Are you sure you want to delete this report?</div>
    
      <p align="left"><cfoutput><a href="InjuryList_delete.cfm?ID=#url.ID#&deleteme=yes"  class="materialsbutton">
        Yes</a> </cfoutput>  
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  <a href="InjuryList.php"  class="materialsbutton">No  </a><br />
        
          <div class="lgaddress">Choosing yes will delete the report.</div>
     </td>
  </tr>
</table>

<br /><br />
   
  </div>  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="/ssl/admin/js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="/ssl/admin/js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="/ssl/admin/js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		//$('.accordion-a').accordionA();
	});
	</script>
    
     <script src="/ssl/admin/js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        //$(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        //$(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="/ssl/admin/js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
