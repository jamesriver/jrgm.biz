 <?php
$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 
function customError($errno, $errstr)
  {
  echo "<b>Error:</b> [$errno] $errstr";
  }

$a = "tt  ";
$a .= "<html><head><title></title>"; 
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{

$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");

$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
  $conn->open($connStr); //Open the connection to the database

$InsectionDate = $_POST['date'];
$InspectionType = "Weekly";
$DriverName = $_POST['Driversname'];
$DriverPhone = $_POST['tel'];
$VehicleNo = $_POST['Vehiclenumber'];
$TrailerNo = $_POST['Trailernumber'];
$OilChangeDate = $_POST['Oilchangedue'];
$InspectionDueDate = $_POST['Inspectiondue'];
$VehicleSatisfactory = $_POST['Vehiclesatisfactory'];
$MileageBegin = $_POST['Mileagebeginning'];
$MileageEnd = $_POST['Mileageending'];
$Problem = $_POST['Problems'];
$CreatedBy = "Arvind";
$ATFLevel = $_POST['aleh'];
$SeatBelt = $_POST['sb'];
$Glass = $_POST['gcb'];
$GarbageAir = $_POST['icfgac'];
$RearVision = $_POST['rvm'];
$WindshieldWiper = $_POST['ww'];
$BrakesParking = $_POST['bp'];
$PowerSteering = $_POST['psfl'];
$GreaseDump = $_POST['gdp'];
$CurrentRegistration = $_POST['cr'];
$AirClean = $_POST['ac'];
$Grease = $_POST['gr'];
$FireExtinguisher = $_POST['fe'];
$FirstAidKit = $_POST['fak'];
$Flare = $_POST['fl'];
$Eyewash = $_POST['ew'];
$EmergencyCard = $_POST['eic'];


$currentDate=date("Y-m-d");
 

$sql_InserMaster="INSERT INTO Form_Inspection_Master([Inspection_Date],[Inspection_Type],[Driver_Name],[Driver_Phone],[Vehicle_No],[Trailer_No],[Oil_Change_Date],[Inspection_Due_Date],[Vehicle_Satisfactory],[Mileage_Begin],[Mileage_End],[Problem],[Created_By],[Created_On])
values('$InsectionDate','$InspectionType','$DriverName','$DriverPhone','$VehicleNo' ,'$TrailerNo','$OilChangeDate','$InspectionDueDate','$VehicleSatisfactory','$MileageBegin','$MileageEnd','$Problem','$CreatedBy','$currentDate')";

$conn->execute($sql_InserMaster);
//echo "$sql_InserMaster";
$sql_Select="";
$sql_Select="Select Max(inspection_id) as inspection_id from Form_Inspection_Master";


$recordset->open($sql_Select, $conn, 3);

$Inspection_Id=0;

if(!$recordset->EOF){
      $recordset->movefirst();
      $Inspection_Id= $recordset->fields["inspection_id"]->value;
}

$sql_InsertTrrans="";
if($InspectionType=="Weekly")
{
$sql_InsertTrrans="INSERT INTO [Jrgm].[dbo].[Form_Inspection_Weekly_CheckList]
           ([Inspection_ID]
           ,[ATFLevel]
           ,[SeatBelt]
           ,[Glass]
           ,[GarbageAir]
           ,[RearVision]
           ,[WindshieldWiper]
           ,[BrakesParking]
           ,[PowerSteering]
           ,[GreaseDump]
           ,[CurrentRegistration]
           ,[AirClean]
           ,[Grease]
           ,[FireExtinguisher]
           ,[FirstAidKit]
           ,[Flare]
           ,[Eyewash]
           ,[EmergencyCard])
     VALUES
           ($Inspection_Id
           ,'$ATFLevel'
           ,'$SeatBelt'
           ,'$Glass'
           ,'$GarbageAir'
           ,'$RearVision'
           ,'$WindshieldWiper'
           ,'$BrakesParking'
           ,'$PowerSteering'
           ,'$GreaseDump'
           ,'$CurrentRegistration'
           ,'$AirClean'
           ,'$Grease'
           ,'$FireExtinguisher'
           ,'$FirstAidKit'
           ,'$Flare'
           ,'$Eyewash'
           ,'$EmergencyCard')";
}


$conn->execute($sql_InsertTrrans);
//echo "$sql_InsertTrrans";
$middlePart="";
$Vechiletable="";
$Problemtable="";

if($_POST['aleh']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="ATF Level -engine hot";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['sb']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Seat Belts";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['gcb']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Glass; clean, breakage";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['icfgac']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Inside cab free of garbage Air Clean";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['rvm']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Rear vision mirrors";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['ww']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Windshield Wipers";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['bp']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Brakes Parking";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['psfl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Power Steering Fluid level/Condition of Hoses";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['gdp']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Grease Dump body";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}
if($_POST['cr']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Current Registration";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($middlePart!="")
{
$Vechiletable="<table style='width: 700px;' border='0'> ";

$Vechiletable .="<tr style='padding-top: 20px'>";
$Vechiletable .="<td colspan='4'>";
$Vechiletable .="<strong>";
$Vechiletable .="VECHILE";
$Vechiletable .="</strong>";
$Vechiletable .="</td>";
$Vechiletable .="</tr>";

$Vechiletable .="$middlePart";
$Vechiletable .="</table> ";
}
 
if($Problem != "")
{
$Problemtable.= "<table style='width: 700px;' border='0'> ";
$Problemtable.= "<tr> ";
$Problemtable.= "<td>Problems</td> ";
$Problemtable.= "</tr> ";
$Problemtable.= "<tr> ";
$Problemtable.= "<td> ";
$Problemtable.= "<span>$Problem</span></td> ";
$Problemtable.= "</tr> ";
$Problemtable.= "</table> ";
}


$middlePart="";
$equipmenttable="";

if($_POST['ac']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Air Clean";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['gr']=="F")
{
$middlePart .="<tr >";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Grease";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($middlePart!="")
{
$equipmenttable="<table style='width: 700px;' border='0'> ";

$equipmenttable .="<tr style='padding-top: 20px'>";
$equipmenttable .="<td colspan='4'>";
$equipmenttable .="<strong >";
$equipmenttable .="EQUIPMENT";
$equipmenttable .="</strong >";
$equipmenttable .="</td>";
$equipmenttable .="</tr>";

$equipmenttable .="$middlePart";
$equipmenttable .="</table> ";
}

$middlePart="";
$safetykittable="";

if($_POST['fe']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Fire Extinguisher";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['fak']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="First Aid Kit (Open/Unopened)";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['fl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Flares";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['ew']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Eyewash";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['eic']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Emergency / Ins Card";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}



if($middlePart!="")
{
$safetykittable="<table style='width: 700px;' border='0'> ";

$safetykittable .="<tr style='padding-top: 20px'>";
$safetykittable .="<td colspan='4'>";
$safetykittable .="<strong >";
$safetykittable .="SAFETY KIT";
$safetykittable .="</strong >";
$safetykittable .="</td>";
$safetykittable .="</tr>";

$safetykittable .="$middlePart";
$safetykittable .="</table> ";
}
  
$msgBody = " ";
$msgBody .= "<html><head><title></title>";
$msgBody .= "<link href='css/bootstrap.css' rel='stylesheet' /> <link href='css/styles.css' rel='stylesheet' />";
$msgBody .= "</head>";
  
$msgBody .= "<body style='margin-top:0'> ";
$msgBody .= "<div> ";
$msgBody .= "<div> ";
$msgBody .= "<div> ";
$msgBody .= "<div  style='color: #550055;'> ";
$msgBody .= "<div style='width: 700px;'><h3>Hello,</h3></div>";
$msgBody .= "<div style='width: 700px;'><h3>PRE-TRIP / WEEKLY VEHICLE / TRAILER INSPECTION REPORT</h3></div>";
$msgBody .= "</div> ";
$msgBody .= "<table style='width: 700px;' border='0'> ";
$msgBody .= "<tr> ";
$msgBody .= "<td  style='width: 3505px; vertical-align: top;'> ";
$msgBody .= "<table  style='width: 350px;' border='0'> ";

$msgBody .= "<tr> ";
$msgBody .= "<td style='width: 170px;'>Date</td>";
$msgBody .= " <td style='width: 10px;'>:</td>";
$msgBody .= "<td  style='width: 170px; text-align: center;'>$InsectionDate</td> ";
$msgBody .= "</tr> ";

$msgBody .= "<tr> ";
$msgBody .= "<td >Vehicle Number</td>";
$msgBody .= "<td>:</td>";
$msgBody .= "<td style='text-align: center;'>$VehicleNo</td> ";
$msgBody .= "</tr> ";

$msgBody .= "<tr> ";
$msgBody .= "<td >Trailer Number</td>";
$msgBody .= "<td>:</td>";
$msgBody .= "<td style='text-align: center;'>$TrailerNo</td> ";
$msgBody .= "</tr> ";

$msgBody .= "<tr> ";
$msgBody .= "<td >Inspection Due</td>";
$msgBody .= "<td>:</td>";
$msgBody .= "<td style='text-align: center;'>$InspectionDueDate</td> ";
$msgBody .= "</tr> ";

$msgBody .= "</table> ";
$msgBody .= "</td> ";
$msgBody .= "<td style='width: 350px; vertical-align: top;'> ";
$msgBody .= "<table style='width: 350px;' border='0'> ";
$msgBody .= "<tr> ";
$msgBody .= "<td  style='width: 170px;'>Driver's Phone Number</td> ";
$msgBody .= "<td  style='width: 10px;'>:</td>";
$msgBody .= "<td style='width: 170px; text-align: center;'>$DriverPhone</td> ";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td >Driver's Name</td> ";
$msgBody .= "<td>:</td>";
$msgBody .= "<td style='text-align: center;'>$DriverName</td> ";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td >Oil Change Due</td> ";
$msgBody .= "<td>:</td>";
$msgBody .= "<td style='text-align: center;'>$OilChangeDate</td> ";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td colspan='3' style='text-align: center;'>&nbsp;</td> ";
$msgBody .= "</tr> ";
$msgBody .= "</table> ";
$msgBody .= "</td> ";
$msgBody .= "</tr> ";
$msgBody .= "</table> ";



$msgBody .= "</br> ";
$msgBody .= "</br> ";


$msgBody .= "$Vechiletable ";
$msgBody .= "</br> ";
$msgBody .= "</br> ";



$msgBody .= "$equipmenttable ";
$msgBody .= "</br> ";
$msgBody .= "</br> ";


$msgBody .= "$safetykittable ";
$msgBody .= "</br> ";
$msgBody .= "</br> ";


$msgBody .= "<table  style='width: 700px;' border='0'> ";
$msgBody .= "<tr> ";
$msgBody .= "<td style='width: 330px;'>Vehicle Satisfactory</td>";
$msgBody .= "<td  style='width: 10px;'>:</td>";
$msgBody .= "<td  style='width: 170px; text-align: center;'>$VehicleSatisfactory</td> ";
$msgBody .= "<td  style='width: 190px;'>&nbsp;</td>";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td >Mileage Beginning</td><td>:</td><td style='text-align: center;'>$MileageBegin</td><td>&nbsp;</td> ";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td >Mileage Ending</td><td>:</td><td style='text-align: center;'>$MileageEnd</td><td>&nbsp;</td>";
$msgBody .= "</tr> ";
$msgBody .= "<tr> ";
$msgBody .= "<td colspan='4'> ";
$msgBody .= "$Problemtable";
$msgBody .= "</td></tr></table><div></div>";
$msgBody .= "<div style='width: 150px;'><h3>Thanks,</h3></div>";
$msgBody .= "</div> ";
$msgBody .= "</div> ";
$msgBody .= "</div> ";
$msgBody .= "</div> ";
$msgBody .= "</body> ";
$msgBody .= "</html>";



$msgBody .= "</br> ";
$msgBody .= "</br> ";
 

$msgBody .= "</div> ";
$msgBody .= "</div> ";
$msgBody .= "</div> ";
$msgBody .= "</body> ";
$msgBody .= "</html>";

//$to = 'aman.rajvanshi@gmail.com'; 
//$subject = 'WEEKLY VEHICLE INSPECTION MAIL'; 
//$message = $msgBody; 
//$headers = 'From: Weekly@example.com' . "\r\n" . 'Reply-To: Weekly@example.com' . "\r\n" . 'X-Mailer: PHP/' .
//$headers  = 'MIME-Version: 1.0' . "\r\n";
//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
//phpversion();
//mail($to, $subject, $message, $headers, '-fWeekly@example.com');


//$to = 'nfirth@jrgm.com'; 
$to = 'sherri@1design.com'; 
$subject = 'WEEKLY VEHICLE INSPECTION MAIL'; 
$message = $msgBody; 
$headers = 'From: sherri@1design.com' . "\r\n" . 'Reply-To: sherri@1design.com' . "\r\n" . 'X-Mailer: PHP/' .
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
phpversion();
mail($to, $subject, $message, $headers, '-fsherri@1design.com');

header( 'Location: JRGMWeekly.php' ) ;

$conn = null;

}
else
{
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;" />
    <title>James River Grounds Management</title>
    <!--<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />-->
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
    <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/date.css" rel="stylesheet" />
    <script src="js/JavaScript2.js" type="text/javascript"></script>
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

</head>
<body style="margin-top:0">
    <form action="" method="post" id="myform" class="vehicle_inventory" >
        <div id="outerfull">
            <div id="centrecontent">
                <!--centre content goes here -->
                <div class="centrecontent_inner">
                    <div class="header">PRE-TRIP / WEEKLY VEHICLE / TRAILER INSPECTION REPORT</div>

                    <div class="spacer20"></div>

                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>

                            <td valign="top">

                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Date</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="text" name="date" id="date" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"   readonly="readonly" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Vehicle Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Vehiclenumber" type="text" id="Vehiclenumber" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter  Vehicle Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Trailer Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Trailernumber" type="text" id="Trailernumber" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Trailer Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Inspection Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Inspectiondue" type="text" id="Inspectiondue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Inspection Due Date" /></td>
                                    </tr>
                                </table>
                            </td>

                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Driver's Phone Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="tel" name="tel" id="tel" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Driver's Phone Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Driver's Name</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Driversname" type="text" id="Driversname" size="24" data-bvalidator="required,alphanum" maxlength="20" data-bvalidator-msg="Please Enter Driver's Name" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Oil Change Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Oilchangedue" type="text" id="Oilchangedue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Oil Change Due Date" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory" data-bvalidator="number,required">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                    </table>


                    <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" class="vehicle_inventory"><strong>Enter "P" for Pass, "F" for Fail or "NA" for Not Available</strong></td>
                        </tr>
                    </table>
                   
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance"><strong>VEHICLE</strong></td>
                                        <td class="performance">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="performance">ATF Level -engine hot</td>
                                         <td class="performance">
                                         <div class="radio"> 
                      <input id="aleh_P" type="radio"  checked="checked" name="aleh" value="P"/>
                      <label for="aleh_P">P</label>
                      <input id="aleh_F" type="radio" name="aleh" value="F"/>
                      <label for="aleh_F">F</label>
                      <input id="aleh_NA" type="radio" name="aleh" value="NA"/>
                      <label for="aleh_NA">NA</label> </div>
                     
                      </td>     
                                  </tr>
                                    <tr>
                                        <td class="performance">Seat Belts</td>
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="sb_P" type="radio"  checked="checked" name="sb" value="P"/>
                      <label for="sb_P">P</label>
                      <input id="sb_F" type="radio" name="sb" value="F"/>
                      <label for="sb_F">F</label>
                      <input id="sb_NA" type="radio" name="sb" value="NA"/>
                      <label for="sb_NA">NA</label> </div>
                   
                      </td>
                                       
                                  </tr>
                                    <tr>
                                        <td class="performance">Glass; clean, breakage</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="gcb_P" type="radio"  checked="checked" name="gcb" value="P"/>
                      <label for="gcb_P">P</label>
                      <input id="gcb_F" type="radio" name="gcb" value="F"/>
                      <label for="gcb_F">F</label>
                      <input id="gcb_NA" type="radio" name="gcb" value="NA"/>
                      <label for="gcb_NA">NA</label> </div>
                      
                      </td>
                                      
                                  </tr>
                                    <tr>
                                        <td class="performance">Inside cab free of garbage Air Clean</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="icfgac_P" type="radio"  checked="checked" name="icfgac" value="P"/>
                      <label for="icfgac_P">P</label>
                      <input id="icfgac_F" type="radio" name="icfgac" value="F"/>
                      <label for="icfgac_F">F</label>
                      <input id="icfgac_NA" type="radio" name="icfgac" value="NA"/>
                      <label for="icfgac_NA">NA</label> </div>
               
                      </td>
                                        
                                  </tr>
                                    <tr>
                                        <td class="performance">Rear vision mirrors</td>
                                        
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="rvm_P" type="radio"  checked="checked" name="rvm" value="P"/>
                      <label for="rvm_P">P</label>
                      <input id="rvm_F" type="radio" name="rvm" value="F"/>
                      <label for="rvm_F">F</label>
                      <input id="rvm_NA" type="radio" name="rvm" value="NA"/>
                      <label for="rvm_NA">NA</label> </div>
                      
                      
                      </td>
                                      
                                  </tr>
                                    <tr>
                                        <td class="performance">Windshield Wipers</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="ww_P" type="radio"  checked="checked" name="ww" value="P"/>
                      <label for="ww_P">P</label>
                      <input id="ww_F" type="radio" name="ww" value="F"/>
                      <label for="ww_F">F</label>
                      <input id="ww_NA" type="radio" name="ww" value="NA"/>
                      <label for="ww_NA">NA</label> </div>
       
                      </td>

                                       
                                  </tr>
                                    <tr>
                                        <td class="performance">Brakes Parking</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="bp_P" type="radio"  checked="checked" name="bp" value="P"/>
                      <label for="bp_P">P</label>
                      <input id="bp_F" type="radio" name="bp" value="F"/>
                      <label for="bp_F">F</label>
                      <input id="bp_NA" type="radio" name="bp" value="NA"/>
                      <label for="bp_NA">NA</label> </div>
                     
                      </td>
                                       
                                  </tr>
                                    <tr>
                                        <td class="performance">Power Steering Fluid level/Condition of Hoses</td>
                                        
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="psfl_P" type="radio"  checked="checked" name="psfl" value="P"/>
                      <label for="psfl_P">P</label>
                      <input id="psfl_F" type="radio" name="psfl" value="F"/>
                      <label for="psfl_F">F</label>
                      <input id="psfl_NA" type="radio" name="psfl" value="NA"/>
                      <label for="psfl_NA">NA</label> </div>
                    
                      </td>
                                      
                                  </tr>
                                    <tr>
                                        <td class="performance">Grease Dump body</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="gdp_P" type="radio"  checked="checked" name="gdp" value="P"/>
                      <label for="gdp_P">P</label>
                      <input id="gdp_F" type="radio" name="gdp" value="F"/>
                      <label for="gdp_F">F</label>
                      <input id="gdp_NA" type="radio" name="gdp" value="NA"/>
                      <label for="gdp_NA">NA</label> </div>
                 
                      </td>
                                      
                                  </tr>
                                       <tr>
                                        <td class="performance">Current Registration</td>
                                        
                                            <td class="performance">
                                             <div class="radio"> 
                      <input id="cr_P" type="radio"  checked="checked" name="cr" value="P"/>
                      <label for="cr_P">P</label>
                      <input id="cr_F" type="radio" name="cr" value="F"/>
                      <label for="cr_F">F</label>
                      <input id="cr_NA" type="radio" name="cr" value="NA"/>
                      <label for="cr_NA">NA</label> </div>
                
                      </td>
                                     
                                  </tr>
                                    <tr>
                                        <td class="performance"><strong>EQUIPMENT</strong></td>
                                      <td class="performance">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Air Clean</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="ac_P" type="radio"  checked="checked" name="ac" value="P"/>
                      <label for="ac_P">P</label>
                      <input id="ac_F" type="radio" name="ac" value="F"/>
                      <label for="ac_F">F</label>
                      <input id="ac_NA" type="radio" name="ac" value="NA"/>
                      <label for="ac_NA">NA</label> </div>
            
                      </td>

                                    </tr>
                                    <tr>
                                        <td class="performance">Grease</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="gr_P" type="radio"  checked="checked" name="gr" value="P"/>
                      <label for="gr_P">P</label>
                      <input id="gr_F" type="radio" name="gr" value="F"/>
                      <label for="gr_F">F</label>
                      <input id="gr_NA" type="radio" name="gr" value="NA"/>
                      <label for="gr_NA">NA</label> </div>
                 
                      </td>
                                       
                                    </tr>
                                    
                                    <tr>
                                        <td class="performance"><strong>SAFETY KIT</strong></td>
                                         <td class="performance">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Fire Extinguisher</td>
                                       
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="fe_P" type="radio"  checked="checked" name="fe" value="P"/>
                      <label for="fe_P">P</label>
                      <input id="fe_F" type="radio" name="fe" value="F"/>
                      <label for="fe_F">F</label>
                      <input id="fe_NA" type="radio" name="fe" value="NA"/>
                      <label for="fe_NA">NA</label> </div>
                 
                      </td>
                                      
                                    </tr>
                                    <tr>
                                        <td class="performance">First Aid Kit (Open/Unopened)</td>
                                        
                                         <td class="performance">
                                          <div class="radio"> 
                      <input id="fak_P" type="radio"  checked="checked" name="fak" value="P"/>
                      <label for="fak_P">P</label>
                      <input id="fak_F" type="radio" name="fak" value="F"/>
                      <label for="fak_F">F</label>
                      <input id="fak_NA" type="radio" name="fak" value="NA"/>
                      <label for="fak_NA">NA</label> </div>
         
                      </td>
                                       
                                    </tr>
                                 <tr>
                                        <td class="performance">Flares</td>
                                         
                                      <td class="performance">
                                       <div class="radio"> 
                      <input id="fl_P" type="radio"  checked="checked" name="fl" value="P"/>
                      <label for="fl_P">P</label>
                      <input id="fl_F" type="radio" name="fl" value="F"/>
                      <label for="fl_F">F</label>
                      <input id="fl_NA" type="radio" name="fl" value="NA"/>
                      <label for="fl_NA">NA</label> </div>
             
                      </td>

                                       
                                  </tr>
                                 <tr>
                                        <td class="performance">Eyewash</td>
                                       
                                      <td class="performance">
                                      <div class="radio"> 
                      <input id="ew_P" type="radio"  checked="checked" name="ew" value="P"/>
                      <label for="ew_P">P</label>
                      <input id="ew_F" type="radio" name="ew" value="F"/>
                      <label for="ew_F">F</label>
                      <input id="ew_NA" type="radio" name="ew" value="NA"/>
                      <label for="ew_NA">NA</label> </div>
                     
                      </td>
                                      
                                  </tr>
                                 <tr>
                                        <td class="performance">Emergency / Ins Card</td>
                                        
                                      <td class="performance">
                                      <div class="radio"> 
                      <input id="eic_P" type="radio"  checked="checked" name="eic" value="P"/>
                      <label for="eic_P">P</label>
                      <input id="eic_F" type="radio" name="eic" value="F"/>
                      <label for="eic_F">F</label>
                      <input id="eic_NA" type="radio" name="eic" value="NA"/>
                      <label for="eic_NA">NA</label> </div>
                     
                      </td>
                                       
                                  </tr>
                                </table>                      
                    <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Vehicle Satisfactory</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="text" name="Vehiclesatisfactory" id="Vehiclesatisfactory" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Vehicle Satisfactory" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Mileage Beginning</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Mileagebeginning" type="text" id="Mileagebeginning" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Beginning" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Mileage Ending</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Mileageending" type="text" id="Mileageending" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Ending" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Problems</td>
                                    </tr>
                                    <tr>
                                        <td class="performance">
                                            <textarea name="Problems" id="Problems" cols="45" rows="10" ></textarea></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Submit" id="btnSumit" name="btnSumit"/>
                    <!--<p><a href="notes.cfm?work_date=#url.work_date#&employee_id=#employee_id#" class="bluebutton">Submit</a> </p>-->
                </div>
            </div>
            
        </div>

    </form>
</body>
</html>
<?php
}
?>