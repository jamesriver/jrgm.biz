 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="/ssl/branch/css/styles.css" rel="stylesheet" type="text/css" />
<link href="/ssl/branch/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="/ssl/branch/css/bootstrap.css" rel="stylesheet" />
<link href="/ssl/branch/css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="/ssl/branch/css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<script src="/ssl/branch/js/sorttable.js"></script>
<script src="/ssl/branch/js/sorttable_v1.js"></script>
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
  
</style>

</head>
<body>
<div id="outerfull">
<div id="centrecontent"><!--centre content goes here -->
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
   <div class="centrecontent_inner">  
          <div class="header">Incident Reports</div>
   <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="center">ID</th> 
   <th align="left">Date</th>
   <th align="left">Time</th> 
   <th align="left">Nature of Incident</th>
   <th align="left">Location</th> 
    <th align="left">Employee</th> 
    <th align="left">Postition</th>  
    <th align="left">Supervisor</th>
    <th align="left">Branch</th>  
     <th align="left">Reported To</th>
      <th align="right">Reported Date</th>
      <th align="center">Drug Tested</th>
      <th align="left">Ins Claim</th>
      <th align="right">Cost of Damage</th>
      <th align="right">Employee Fined / Amt</th>
      <th align="right">Status</th>
      <th align="right">Full Report</th>
      <th align="center">PDF</th>
       </tr> 
</thead> 

<cfquery name="get_IR_List" datasource="jrgm"  > 
SELECT  * FROM Form_IncidentReport   ORDER  by  IR_ID DESC
 </cfquery>
 <tbody>  
<cfoutput query="get_IR_List">  
<tr>
    <td align="center">#IR_ID#</td>
	<td nowrap="nowrap">#DateFormat("#incidentRpt_Date#", "mm/dd/yyyy")#</td>
    <td align="left" >#IncidentTime#</td>
    <td align="left">#DamegeDesc#</td>
    <td align="left" >#Location#</td>
    <td align="left" >#Employee#</td>
    <td align="left">#Position#</td>    
    <td align="left">#Supervisor#</td>
    <td align="left">#Branch#</td>  
    <td align="left">#ReportedTo#</td>
    <td nowrap="nowrap">#DateFormat("#ReportedDate#", "mm/dd/yyyy")#</td>
     <td align="center">#BO_DrugTest#</td>
    <td align="left">#InsuranceInfo#</td>
    <td align="right">#BO_FinalLoss#</td>
    <td align="right">#BO_IsFine#</td>
    <td align="right">#BO_Status#</td>
    <td align="right"><a href="http://www.jrgm.biz/forms/incidentreport_bo.php?id=#IR_ID#" target="_blank">View Report</a></td>
    <cfdirectory action="list" directory="C:\inetpub\websites\jrgm.biz\forms\photos\incident_reports\" name="incident_reports" recurse="true">
    <cfquery name="incident_reports" dbtype="query">
    SELECT   *
    from incident_reports
   WHERE name LIKE '#IR_ID#%'
</cfquery>
<cfif  incident_reports.recordcount GT 0>
  <td align="right">
         <a href="http://www.jrgm.biz/forms/photos/incident_reports/#IR_ID#.pdf">  <img src="images/pdf_file.png" width="24" height="24" /> </a>
     </td>
     <cfelse>
       <td align="right">
    -
     </td>
     </cfif>
   </tr>
 </cfoutput>
  </tbody>
</table><br />
<br />
<br />
    
   
  </div>  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="/ssl/branch/js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="/ssl/branch/js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="/ssl/branch/js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		//$('.accordion-a').accordionA();
	});
	</script>
    
     <script src="/ssl/branch/js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        //$(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        //$(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="/ssl/branch/js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
