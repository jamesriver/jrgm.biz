<?php      

$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 


$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet") or die("Cannot start ADO");

$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database

$sql_Select="";
$sql_Select="Select * from Form_IncidentReport ORDER BY CreatedDate DESC";


try {
	$recordset->open($sql_Select, $conn, 3);
	$errMessage = "";

	$Inspection_Id=0;
	if($recordset->EOF){
		$errMessage = "No Record Found!!!";
	} else {
		$errMessage = "";
	}
} catch(Exception $e) {
	$errMessage = "Incorrect Request ID !!!";
}

?>

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
<div id="centrecontent"><!--centre content goes here -->
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
        <a href="/ssl/admin/directory.cfm"><img src="/ssl/admin/images/directory_icon.png" width="60" height="60" alt="Crews" class="icons" /></a> <a href="/ssl/admin/forms.cfm"><img src="/ssl/admin/images/icon_forms.png" width="60" height="60" alt="Forms" /></a></td>
      <td align="right"><a href="/ssl/admin/default.cfm"><img src="/ssl/admin/images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a> <a href="/index.cfm"><img src="/ssl/admin/images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a> </td>
    </tr>
  </table>
</div>

 
  <div class="centrecontent_inner">  

  <div class="header">Incident Reports</div>
   <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="center">ID</th> 
   <th align="left">Date</th>
   <th align="left">Time</th> 
   <th align="left">Nature of Incident &amp; Damage</th> 
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
      <th align="center">Delete</th>
      </tr> 
</thead> 
  
     <tbody>  
<?php
//$recordset->movefirst();
//echo $recordset->RecordCount() .  "<br>\n"; 
while (!$recordset->EOF) { 
//echo $IncidentID . ' ' .  "<br>\n"; 
	$ID= $recordset->	fields["IR_ID"]->value;
	$IncidentID= $recordset->fields["IncidentRpt_ID"]->value;
	$incidentRpt_Date= $recordset->fields["incidentRpt_Date"]->value; 
	$VehicleNumber= $recordset->fields["VehicleNumber"]->value;
	$IncidentTime= $recordset->fields["IncidentTime"]->	value;
	$LicenseNo= $recordset->fields["LicenseNo"]->value;
	$Location= $recordset->	fields["Location"]->value;
	$Equipment= $recordset->fields["Equipment"]->value;
	$Branch= $recordset->fields["Branch"]->value;
	$Employee= $recordset->fields["Employee"]->value;
	$ReportedTo= $recordset->fields["ReportedTo"]->value;
	$Position= $recordset->fields["Position"]->value;
	$ReportedDate= $recordset->fields["ReportedDate"]->value;
	$Supervisor= $recordset->fields["Supervisor"]->value;	
	$NatureOfIncident= $recordset->fields["NatureOfIncident"]->value;
	$OwnerName= $recordset->fields["OwnerName"]->value;
	$OwnerPhoneNo= $recordset->fields["OwnerPhoneNo"]->value;
	$OwnerLicenseNo= $recordset->fields["OwnerLicenseNo"]->value;
	$OwnerTypeOfVehicle= $recordset->fields["OwnerTypeOfVehicle"]->value;
	$OwnerAddress= $recordset->fields["OwnerAddress"]->value;
	$DamegeDesc = $recordset->fields["DamegeDesc"]->value;
	$InsuranceInfo= $recordset->fields["InsuranceInfo"]->value;
	$ImmActionTaken= $recordset->fields["ImmActionTaken"]->value;
	$EmployeeStatement= $recordset->fields["EmployeeStatement"]->value;
	$WitnessStatement= $recordset->fields["WitnessStatement"]->value;	
	$BO_Status= $recordset->fields["BO_Status"]->value;	
	$BO_DrugTest= $recordset->fields["BO_DrugTest"]->value;
	$BO_WorkerComp= $recordset->fields["BO_WorkerComp"]->value;
	$BO_SafetyUsed= $recordset->fields["BO_SafetyUsed"]->value;
	$BO_IsFine= $recordset->fields["BO_IsFine"]->value;
	$BO_IsPayroll= $recordset->fields["BO_IsPayroll"]->value;
	$BO_Injuries= $recordset->fields["BO_Injuries"]->value;
	$BO_Translator= $recordset->fields["BO_Translator"]->value;  
	$BO_Fine= $recordset->fields["BO_Fine"]->value;
	$BO_EstimatedLoss= $recordset->	fields["BO_EstimatedLoss"]->value;
	$BO_FinalLoss= $recordset->	fields["BO_FinalLoss"]->value;
    $IncidentRpt_File = $recordset->fields["IncidentRpt_File"]->value;

    if(strlen($DamegeDesc) > 50) {
        $DamegeDesc = substr($DamegeDesc, 0, 50) . "...";
    }
    if(strlen($InsuranceInfo) > 50) {
        $InsuranceInfo = substr($InsuranceInfo, 0, 50) . "...";
    }
	?>
 <tr>
    <td align="center"><?php echo $ID ?></td>
	<td nowrap="nowrap"><?php echo $incidentRpt_Date ?></td>
    <td align="left" ><?php echo $IncidentTime ?></td>
    <td align="left"><?php echo $DamegeDesc ?></td>
    <td align="left" ><?php echo $Employee ?></td>
    <td align="left"><?php echo $Position ?></td>    
    <td align="left"><?php echo $Supervisor ?></td>
    <td align="left"><?php echo $Branch ?></td>  
    <td align="left"><?php echo $ReportedTo ?></td>
    <td align="right"><?php echo $ReportedDate ?></td>
    <td align="center"><?php echo $BO_DrugTest ?></td>
    <td align="left"><?php echo $InsuranceInfo ?></td>
    <td align="right"><?php echo $BO_FinalLoss ?></td>
    <td align="right"><?php echo $BO_IsFine ?></td>
    <td align="right"><?php echo $BO_Status ?></td>
    <td align="right"><a href="http://www.jrgm.biz/forms/incidentreport_bo.php?id=<?php echo $ID ?>" target="_blank">View Report</a></td>
    <td align="right">
        <?php if(isset($IncidentRpt_File)) {?>
            <a <?php echo "href='http://www.jrgm.biz/forms/photos/incident_reports/$IncidentRpt_File'"?> target="_blank"><img src="http://www.jrgm.biz/forms/images/pdf_file.png" width="24" height="24" /></a> 
        <?php }?>
    </td>
    <td align="center"><a href="IRList_delete.cfm?ID=<?php echo $ID ?>"><img src="http://www.jrgm.biz/forms/images/del.png" width="12" height="12" /></a></td>
 </tr>
<?php

    $recordset->MoveNext(); 
	
}  

?>
 </tbody>
</table>


   
   
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
