<?php
$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 

function customError($errno, $errstr)
  {
  echo "<b>Error:</b> [$errno] $errstr";
  }

//echo "nice";

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
$InspectionType = "Daily";
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
$AnyFluid = $_POST['afl'];
$EngineOil = $_POST['eol'];
$DashLight = $_POST['dwl'];
$Horn = $_POST['horn'];
$Tires = $_POST['twi'];
$BrakesFluid = $_POST['bfrl'];
$TurnSignal = $_POST['tsf'];
$Radiator = $_POST['rcl'];
$AlertSystem = $_POST['ras'];
$CoupletPin = $_POST['csp'];
$Brakeswitch = $_POST['bas'];
$ElectricConnector = $_POST['ecp'];
$SafetyChain = $_POST['sch'];
$JackStand = $_POST['js'];
$TireWheel = $_POST['tiwi'];
$RampCable = $_POST['rc'];
$Spring = $_POST['sp'];
$Brakes = $_POST['br'];
$Lights = $_POST['lr'];
$GreaseDump = $_POST['gdbw'];
$CheckOil = $_POST['co'];
$CleanFilter = $_POST['cf'];

$currentDate=date("Y-m-d");


$sql_InserMaster="INSERT INTO Form_Inspection_Master([Inspection_Date],[Inspection_Type],[Driver_Name],[Driver_Phone],[Vehicle_No],[Trailer_No],[Oil_Change_Date],[Inspection_Due_Date],[Vehicle_Satisfactory],[Mileage_Begin],[Mileage_End],[Problem],[Created_By],[Created_On])
values('$InsectionDate','$InspectionType','$DriverName','$DriverPhone','$VehicleNo' ,'$TrailerNo','$OilChangeDate','$InspectionDueDate','$VehicleSatisfactory','$MileageBegin','$MileageEnd','$Problem','$CreatedBy','$currentDate')";

$conn->execute($sql_InserMaster);

$sql_Select="";
$sql_Select="Select Max(inspection_id) as inspection_id from Form_Inspection_Master";


$recordset->open($sql_Select, $conn, 3);

$Inspection_Id=0;

if(!$recordset->EOF){
      $recordset->movefirst();
      $Inspection_Id= $recordset->fields["inspection_id"]->value;
}

$sql_InsertTrrans="";
if($InspectionType=="Daily")
{
$sql_InsertTrrans="INSERT INTO [Jrgm].[dbo].[Form_Inspection_Daily_CheckList]
           ([Inspection_ID]
           ,[AnyFluid]
           ,[EngineOil]
           ,[DashLight]
           ,[Horn]
           ,[Tires]
           ,[BrakesFluid]
           ,[TurnSignal]
           ,[Radiator]
           ,[AlertSystem]
           ,[CoupletPin]
           ,[Brakeswitch]
           ,[ElectricConnector]
           ,[SafetyChain]
           ,[JackStand]
           ,[TireWheel]
           ,[RampCable]
           ,[Spring]
           ,[Brakes]
           ,[Lights]
           ,[GreaseDump]
           ,[CheckOil]
           ,[CleanFilter])
     VALUES
           ($Inspection_Id
           ,'$AnyFluid'
           ,'$EngineOil'
           ,'$DashLight'
           ,'$Horn'
           ,'$Tires'
           ,'$BrakesFluid'
           ,'$TurnSignal'
           ,'$Radiator'
           ,'$AlertSystem'
           ,'$CoupletPin'
           ,'$Brakeswitch'
           ,'$ElectricConnector'
           ,'$SafetyChain'
           ,'$JackStand'
           ,'$TireWheel'
           ,'$RampCable'
           ,'$Spring'
           ,'$Brakes'
           ,'$Lights'
           ,'$GreaseDump'
           ,'$CheckOil'
           ,'$CleanFilter')";
}
$conn->execute($sql_InsertTrrans);
//echo "$sql_InsertTrrans"; 

$middlePart="";
$Vechiletable="";
$Problemtable="";

if($_POST['afl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Any fluid leaks";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['eol']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Engine oil level";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['dwl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Dash warning lights";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['horn']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Horn";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['twi']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Tires-Wheels-Inflation";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['bfrl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Brakes fluid reservoir level";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['tsf']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Turn signals/4-way flashers";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['rcl']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Radiator coolant level/Condition of Hoses Brakes";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['ras']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Reverse Alert System";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style=[width: 180px;[>&nbsp;</td>";
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
$trailertable="";

if($_POST['csp']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Couplet safety Pin";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['bas']=="F")
{
$middlePart .="<tr >";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Brake away switch/ cable";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['ecp']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Electic connector plug";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['sch']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Safety chain and hooks";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['js']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Jack Stand";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['tiwi']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Tires-Wheels-Inflation";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['rc']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Ramp Cables";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['sp']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Springs";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['br']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Brakes";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['lr']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Lights/Reflectors";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['gdbw']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Grease dump body Weekly";
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
$trailertable="<table style='width: 700px;' border='0'> ";

$trailertable .="<tr style='padding-top: 20px'>";
$trailertable .="<td colspan='4'>";
$trailertable .="<strong >";
$trailertable .="TRAILER";
$trailertable .="</strong >";
$trailertable .="</td>";
$trailertable .="</tr>";

$trailertable .="$middlePart";
$trailertable .="</table> ";
}


$middlePart="";
$equipmenttable="";

if($_POST['co']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Check Oil";
$middlePart .="</td>";
$middlePart .="<td style='width: 10px;'>:</td>";
$middlePart .="<td style='width: 170px; text-align: center;'>";
$middlePart .="Fail";
$middlePart .="</td>";
$middlePart .="<td style='width: 180px;'>&nbsp;</td>";
$middlePart .="</tr>";
}

if($_POST['cf']=="F")
{
$middlePart .="<tr>";
$middlePart .="<td style='width: 340px;'>";
$middlePart .="Clean Filter";
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
$msgBody .= "<div style='width: 700px;'><h3>PRE-TRIP / DAILY VEHICLE / TRAILER INSPECTION REPORT</h3></div>";
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
$msgBody .= "<td  style='text-align: center;'>$TrailerNo</td> ";
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



$msgBody .= "$trailertable ";
$msgBody .= "</br> ";
$msgBody .= "</br> ";




$msgBody .= "$equipmenttable ";
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

//$to = 'aman.rajvanshi@gmail.com'; 
//$subject = 'DAILY VEHICLE INSPECTION MAIL'; 
//$message = $msgBody; 
//$headers = 'From: Daily@example.com' . "\r\n" . 'Reply-To: Daily@example.com' . "\r\n" . 'X-Mailer: PHP/' .
//$headers  = 'MIME-Version: 1.0' . "\r\n";
//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
//phpversion();
//mail($to, $subject, $message, $headers, '-fDaily@example.com'); 

$to = 'nfirth@jrgm.com';

$subject = 'DAILY VEHICLE INSPECTION MAIL'; 
$message = $msgBody; 
$headers = 'From: sherri@1design.com' . "\r\n" . 'Reply-To: sherri@1design.com' . "\r\n" . 'X-Mailer: PHP/' .
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
phpversion();
mail($to, $subject, $message, $headers, '-fsherri@1design.com');


$conn = null;
header( 'Location: JRGMDaily.php' ) ;
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
    <script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
    <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/JavaScript2.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/date.css" rel="stylesheet" />
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
                    <div class="header">PRE-TRIP / DAILY VEHICLE / TRAILER INSPECTION REPORT</div>

                    <div class="spacer20"></div>

                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>

                            <td valign="top">

                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory">Date</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="" name="date" id="date" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"  readonly="readonly" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Vehicle Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Vehiclenumber" type="text" id="Vehiclenumber" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Vehicle Number" maxlength="10" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Trailer Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Trailernumber" type="text" id="Trailernumber" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Trailer Number" maxlength="10" /></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Inspection Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Inspectiondue" type="text" id="Inspectiondue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Inspection Due Date"/></td>
                                    </tr>
                                </table>
                            </td>

                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="vehicle_inventory">Driver's Phone Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="tel" name="tel" id="tel" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Driver's Phone Number"/></td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Driver's Name</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Driversname" type="text" id="Driversname" size="24" data-bvalidator="required,alphanum" maxlength="20" data-bvalidator-msg="Please Enter Driver's Name"/></td>
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
                                        <td class="vehicle_inventory">Any fluid leaks</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="afl" value="P"/> P
                      <input type="radio" name="afl" value="F"/> F
                      <input type="radio" name="afl" value="NA"/>NA 
                      </td>
                                      <!--  <td align="center">
                                            <select name="afl">
                                                <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select>
                                           </td>-->
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
                                        <td class="vehicle_inventory">Engine oil level</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="eol" value="P"/> P
                      <input type="radio" name="eol" value="F"/> F
                      <input type="radio" name="eol" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="eol">
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
                                        <td class="vehicle_inventory">Dash warning lights</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="dwl" value="P"/> P
                      <input type="radio" name="dwl" value="F"/> F
                      <input type="radio" name="dwl" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="dwl">
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
                                        <td class="vehicle_inventory">Horn</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="horn" value="P"/> P
                      <input type="radio" name="horn" value="F"/> F
                      <input type="radio" name="horn" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="horn">
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
                                        <td class="vehicle_inventory">Tires-Wheels-Inflation</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="twi" value="P"/> P
                      <input type="radio" name="twi" value="F"/> F
                      <input type="radio" name="twi" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="twi">
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
                                        <td class="vehicle_inventory">Brakes fluid reservoir level</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="bfrl" value="P"/> P
                      <input type="radio" name="bfrl" value="F"/> F
                      <input type="radio" name="bfrl" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="bfrl">
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
                                        <td class="vehicle_inventory">Turn signals/4-way flashers</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="tsf" value="P"/> P
                      <input type="radio" name="tsf" value="F"/> F
                      <input type="radio" name="tsf" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="tsf">
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
                                        <td class="vehicle_inventory">Radiator coolant level/Condition of Hoses Brakes</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="rcl" value="P"/> P
                      <input type="radio" name="rcl" value="F"/> F
                      <input type="radio" name="rcl" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="rcl">
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
                                        <td class="vehicle_inventory">Reverse Alert System</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="ras" value="P"/> P
                      <input type="radio" name="ras" value="F"/> F
                      <input type="radio" name="ras" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="ras">
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
                                        <td class="vehicle_inventory"><strong>TRAILER</strong></td>
                                        <!--<td width="10%" align="center" class="vehicle_inventory">S</td>
                                        <td width="10%" align="center" class="vehicle_inventory">M</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">W</td>
                                        <td width="10%" align="center" class="vehicle_inventory">T</td>
                                        <td width="10%" align="center" class="vehicle_inventory">F</td>
                                        <td width="10%" align="center" class="vehicle_inventory">S</td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Couplet safety Pin</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="csp" value="P"/> P
                      <input type="radio" name="csp" value="F"/> F
                      <input type="radio" name="csp" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">


                                            <select name="csp">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select>
                                             </td>-->
                                        <!--<td align="center">
                                            <select id="csp_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="csp_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="csp_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="csp_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="csp_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="csp_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Brake away switch/ cable</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="bas" value="P"/> P
                      <input type="radio" name="bas" value="F"/> F
                      <input type="radio" name="bas" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="bas">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="bas_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bas_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bas_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bas_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bas_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="bas_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield27" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield28" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield29" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield30" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield31" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield32" size="2" /></td>
                                        <td width="10%" align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield33" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Electic connector plug</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="ecp" value="P"/> P
                      <input type="radio" name="ecp" value="F"/> F
                      <input type="radio" name="ecp" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="ecp">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="ecp_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ecp_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ecp_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ecp_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ecp_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="ecp_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Safety chain and hooks</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="sch" value="P"/> P
                      <input type="radio" name="sch" value="F"/> F
                      <input type="radio" name="sch" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="sch">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="sch_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sch_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sch_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sch_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sch_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sch_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Jack Stand</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                         <td align="center">
                      <input type="radio"  checked="checked" name="js" value="P"/> P
                      <input type="radio" name="js" value="F"/> F
                      <input type="radio" name="js" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="js">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="js_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="js_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="js_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="js_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="js_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="js_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Tires-Wheels-Inflation</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="tiwi" value="P"/> P
                      <input type="radio" name="tiwi" value="F"/> F
                      <input type="radio" name="tiwi" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="tiwi">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="tiwi_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tiwi_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tiwi_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tiwi_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tiwi_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="tiwi_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Ramp Cables</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="rc" value="P"/> P
                      <input type="radio" name="rc" value="F"/> F
                      <input type="radio" name="rc" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="rc">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="rc_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rc_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rc_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rc_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rc_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="rc_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Springs</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="sp" value="P"/> P
                      <input type="radio" name="sp" value="F"/> F
                      <input type="radio" name="sp" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="sp">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="sp_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sp_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sp_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sp_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sp_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="sp_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Brakes</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="br" value="P"/> P
                      <input type="radio" name="br" value="F"/> F
                      <input type="radio" name="br" value="NA"/>NA 
                      </td>
                                        <!--<td align="center">
                                            <select name="br">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="br_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="br_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="br_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="br_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="br_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="br_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield20" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield21" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield22" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield23" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield24" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield25" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield18" type="text" id="textfield26" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Lights/Reflectors</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="lr" value="P"/> P
                      <input type="radio" name="lr" value="F"/> F
                      <input type="radio" name="lr" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="lr">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="lr_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="lr_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="lr_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="lr_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="lr_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="lr_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield34" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield35" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield36" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield37" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield38" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield39" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield40" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Grease dump body Weekly</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="gdbw" value="P"/> P
                      <input type="radio" name="gdbw" value="F"/> F
                      <input type="radio" name="gdbw" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="gdbw">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center">
                                            <select id="gdbw_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="gdbw_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="gdbw_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="gdbw_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="gdbw_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="gdbw_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                        <!--<td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield41" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield42" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield43" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield44" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield45" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield46" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield19" type="text" id="textfield47" size="2" /></td>-->
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
                                        <td class="vehicle_inventory"><strong>EQUIPMENT</strong></td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                        <td align="center" class="vehicle_inventory">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Check Oil</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="co" value="P"/> P
                      <input type="radio" name="co" value="F"/> F
                      <input type="radio" name="co" value="NA"/>NA 
                      </td>
                                       <!-- <td align="center">
                                            <select name="co">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="co_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="co_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="co_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="co_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="co_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="co_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield48" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield49" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield50" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield51" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield52" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield53" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield20" type="text" id="textfield54" size="2" /></td>-->
                                    </tr>
                                    <tr>
                                        <td class="vehicle_inventory">Clean Filters</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">
                      <input type="radio"  checked="checked" name="cf" value="P"/> P
                      <input type="radio" name="cf" value="F"/> F
                      <input type="radio" name="cf" value="NA"/>NA 
                      </td> 
                                        <!--<td align="center">
                                            <select name="cf">
                                                 <option value="P" selected="selected">P</option>
                                                <option value="F">F</option>
                                                <option value="NA">NA</option>
                                            </select></td>-->
                                        <!--<td align="center">
                                            <select id="cf_m">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="cf_t">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="cf_w">
                                                <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="cf_th">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="cf_f">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>
                                        <td align="center">
                                            <select id="cf_sat">
                                                 <option value="P">P</option>
                                                <option value="F">F</option>
                                                <option value="NA" selected="selected">NA</option>
                                            </select></td>-->
                                       <!-- <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield55" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield56" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield57" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield58" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield59" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield60" size="2" /></td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="textfield21" type="text" id="textfield61" size="2" /></td>-->
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
                                            <input name="Mileageending" type="text" id="Mileageending" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Ending"/></td>
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
            <!-- to clear footer -->
        </div>

    </form>
</body>
</html>
<?php
}
?>