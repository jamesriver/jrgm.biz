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


$to = 'nfirth@jrgm.com'; 
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
                                        <td class="vehicle_inventory">Date</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="text" name="date" id="date" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"   readonly="readonly" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Vehicle Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Vehiclenumber" type="text" id="Vehiclenumber" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter  Vehicle Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Trailer Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Trailernumber" type="text" id="Trailernumber" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Trailer Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Inspection Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Inspectiondue" type="text" id="Inspectiondue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Inspection Due Date" /></td>
                                    </tr>
                                </table>
                            </td>

                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory">Driver's Phone Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="tel" name="tel" id="tel" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Driver's Phone Number" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Driver's Name</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Driversname" type="text" id="Driversname" size="24" data-bvalidator="required,alphanum" maxlength="20" data-bvalidator-msg="Please Enter Driver's Name" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Oil Change Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Oilchangedue" type="text" id="Oilchangedue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Oil Change Due Date" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">&nbsp;</td>
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
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory"><strong>VEHICLE</strong></td>
                                       <!-- <td width="10%" align="center" class="vehicle_inventory">S</td>
                                        <td width="10%" align="center" class="vehicle_inventory">M</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">W</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">F</td>-->
                                        <!--<td width="100%" align="center" class="vehicle_inventory">S</td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">ATF Level -engine hot</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="aleh" value="P"/> P
                      <input type="radio" name="aleh" value="F"/> F
                      <input type="radio" name="aleh" value="NA"/>NA 
                      </td>
                                       
                                       <!-- <td align="center">
                                            <select name="aleh">
                                                <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="afl_m">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="afl_t">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="afl_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="afl_th">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="afl_f">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="afl_sat">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2"/></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Seat Belts</td>
                                         <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="sb" value="P"/> P
                      <input type="radio" name="sb" value="F"/> F
                      <input type="radio" name="sb" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="sb">
                                               <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="eol_m">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="eol_t">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="eol_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="eol_th">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="eol_f">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="eol_sat">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield11" type="text" id="textfield13" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield12" type="text" id="textfield14" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield13" type="text" id="textfield15" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield14" type="text" id="textfield16" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield15" type="text" id="textfield17" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield16" type="text" id="textfield18" size="2" /></td>
                                    <td width="10%" align="center" class="vehicle_inventory">
                                        <input name="textfield17" type="text" id="textfield19" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Glass; clean, breakage</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="gcb" value="P"/> P
                      <input type="radio" name="gcb" value="F"/> F
                      <input type="radio" name="gcb" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="gcb">
                                                <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="dwl_m">
                                               <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="dwl_t">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="dwl_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="dwl_th">
                                               <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="dwl_f">
                                               <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="dwl_sat">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Inside cab free of garbage Air Clean</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="icfgac" value="P"/> P
                      <input type="radio" name="icfgac" value="F"/> F
                      <input type="radio" name="icfgac" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="icfgac">
                                                <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="horn_m">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="horn_t">
                                               <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="horn_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="horn_th">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="horn_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="horn_sat">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Rear vision mirrors</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="rvm" value="P"/> P
                      <input type="radio" name="rvm" value="F"/> F
                      <input type="radio" name="rvm" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="rvm">
                                                 <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="twi_m">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="twi_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="twi_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="twi_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="twi_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="twi_sat">
                                            <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Windshield Wipers</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="ww" value="P"/> P
                      <input type="radio" name="ww" value="F"/> F
                      <input type="radio" name="ww" value="NA"/>NA 
                      </td>

                                        <!--<td align="center">
                                            <select name="ww">
                                                <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="bfrl_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bfrl_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bfrl_w">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bfrl_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bfrl_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bfrl_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Brakes Parking</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="bp" value="P"/> P
                      <input type="radio" name="bp" value="F"/> F
                      <input type="radio" name="bp" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="bp">
                                                 <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="tsf_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tsf_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tsf_w">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tsf_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tsf_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tsf_sat">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!-- <td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Power Steering Fluid level/Condition of Hoses</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="psfl" value="P"/> P
                      <input type="radio" name="psfl" value="F"/> F
                      <input type="radio" name="psfl" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="psfl">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="rcl_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rcl_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rcl_w">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rcl_th">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rcl_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rcl_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!-- <td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Grease Dump body</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="gdp" value="P"/> P
                      <input type="radio" name="gdp" value="F"/> F
                      <input type="radio" name="gdp" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="gdp">
                                                 <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="ras_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        
                                        <!--td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                       <tr>
                                        <td class="vehicle_inventory">Current Registration</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                            <td align="center">
                      <input type="radio"  checked="checked" name="cr" value="P"/> P
                      <input type="radio" name="cr" value="F"/> F
                      <input type="radio" name="cr" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="cr">
                                                 <option value="P"  selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="ras_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ras_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        
                                        <!--td align="center" class="vehicle_inventory">
                                        <input name="textfield" type="text" id="textfield" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield2" type="text" id="textfield2" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield6" type="text" id="textfield8" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield7" type="text" id="textfield9" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield8" type="text" id="textfield10" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield9" type="text" id="textfield11" size="2" /></td>
                                    <td align="center" class="vehicle_inventory">
                                        <input name="textfield10" type="text" id="textfield12" size="2" /></td>-->
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <img src="images/clear.gif" width="40" height="1" /></td>
                            <td valign="top">
                                <table border="0" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td class="vehicle_inventory"><strong>EQUIPMENT</strong></td>
                                        <!--<td width="10%" align="center" class="vehicle_inventory">S</td>
                                        <td width="10%" align="center" class="vehicle_inventory">M</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">W</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">F</td>
                                        <td width="10%" align="center" class="vehicle_inventory">S</td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Air Clean</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="ac" value="P"/> P
                      <input type="radio" name="ac" value="F"/> F
                      <input type="radio" name="ac" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="ac">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       

                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Grease</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="gr" value="P"/> P
                      <input type="radio" name="gr" value="F"/> F
                      <input type="radio" name="gr" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="gr">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       
                                    </tr>
                                       <tr>
                                        <td class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="vehicle_inventory"><strong>SAFETY KIT</strong></td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Fire Extinguisher</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="fe" value="P"/> P
                      <input type="radio" name="fe" value="F"/> F
                      <input type="radio" name="fe" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="fe">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>--> 
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">First Aid Kit (Open/Unopened)</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="fak" value="P"/> P
                      <input type="radio" name="fak" value="F"/> F
                      <input type="radio" name="fak" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="fak">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>--> 
                                    </tr>
                                 <tr>
                                        <td class="vehicle_inventory">Flares</td>
                                         <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td> 
                                      <td align="center">
                      <input type="radio"  checked="checked" name="fl" value="P"/> P
                      <input type="radio" name="fl" value="F"/> F
                      <input type="radio" name="fl" value="NA"/>NA 
                      </td>

                                        <!--<td align="center">
                                            <select name="fl">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td> -->
                                    </tr>
                                 <tr>
                                        <td class="vehicle_inventory">Eyewash</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                      <td align="center">
                      <input type="radio"  checked="checked" name="ew" value="P"/> P
                      <input type="radio" name="ew" value="F"/> F
                      <input type="radio" name="ew" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="ew">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td> -->
                                    </tr>
                                 <tr>
                                        <td class="vehicle_inventory">Emergency / Ins Card</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                      <td align="center">
                      <input type="radio"  checked="checked" name="eic" value="P"/> P
                      <input type="radio" name="eic" value="F"/> F
                      <input type="radio" name="eic" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="eic">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td> -->
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory">Vehicle Satisfactory</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="text" name="Vehiclesatisfactory" id="Vehiclesatisfactory" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Vehicle Satisfactory" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Mileage Beginning</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Mileagebeginning" type="text" id="Mileagebeginning" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Beginning" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Mileage Ending</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Mileageending" type="text" id="Mileageending" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Ending" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory">Problems</td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">
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