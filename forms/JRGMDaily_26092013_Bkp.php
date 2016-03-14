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

//$to = 'nfirth@jrgm.com';
$to = 'sherri@1design.com';

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
                                      <td class="performance">Date</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="" name="date" id="date" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"  readonly="readonly" /></td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Vehicle Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Vehiclenumber" type="text" id="Vehiclenumber" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Vehicle Number" maxlength="10" /></td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Trailer Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Trailernumber" type="text" id="Trailernumber" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Trailer Number" maxlength="10" /></td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Inspection Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Inspectiondue" type="text" id="Inspectiondue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Inspection Due Date"/></td>
                                    </tr>
                                </table>
                            </td>

                            <td valign="top">
                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Driver's Phone Number</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input type="tel" name="tel" id="tel" size="24" data-bvalidator="required" maxlength="10" data-bvalidator-msg="Please Enter Driver's Phone Number"/></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Driver's Name</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Driversname" type="text" id="Driversname" size="24" data-bvalidator="required,alphanum" maxlength="20" data-bvalidator-msg="Please Enter Driver's Name"/></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Oil Change Due</td>
                                        <td align="center" class="vehicle_inventory">
                                            <input name="Oilchangedue" type="text" id="Oilchangedue" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Oil Change Due Date" /></td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                    </table>


                    <div class="spacer20"></div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" class="vehicle_inventory"><strong>Enter "P" for Pass, "F" for Fail or "NA" for Not Available</strong></td>
                        </tr>
                    </table>
                 
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="40%" class="performance"><strong>VEHICLE</strong></td>
                                        <td nowrap="nowrap" class="performance">&nbsp;</td>
                                      
                                    </tr>
                                    <tr>
                                        <td class="performance">Any fluid leaks</td>
                                        
                                         <td class="performance"><div class="radio"> 
                      <input id="afl_P" type="radio"  checked="checked" name="afl" value="P"/>
                      <label for="afl_P">P</label>
                      <input id="afl_F" type="radio" name="afl" value="F"/>
                      <label for="afl_F">F</label>
                      <input id="afl_NA" type="radio" name="afl" value="NA"/>
                      <label for="afl_NA">NA</label> </div>
                      </td>
                                      
                                  </tr>
                                    <tr>
                                      <td class="performance">Engine oil level</td>
                                        
                                         <td class="performance">
                                          <div class="radio">
                      <input id="eol_P" type="radio"  checked="checked" name="eol" value="P"/>
                      <label for="eol_P">P</label>
                      <input id="eol_F" type="radio" name="eol" value="F"/>
                      <label for="eol_F">F</label>
                      <input id="eol_NA" type="radio" name="eol" value="NA"/>
                      <label for="eol_NA">NA</label></div>
                      </td>
                                      
                                    </tr>
                                    <tr>
                                      <td class="performance">Dash warning lights</td>
                                        <td class="performance">
                                          <div class="radio">
                      <input id="dwl_P" type="radio"  checked="checked" name="dwl" value="P"/>
                      <label for="dwl_P">P</label>
                      <input id="dwl_F" type="radio" name="dwl" value="F"/>
                      <label for="dwl_F">F</label>
                      <input id="dwl_NA" type="radio" name="dwl" value="NA"/>
                      <label for="dwl_NA">NA</label></div>
                      </td>
                                         
                                      
                                    </tr>
                                    <tr>
                                      <td class="performance">Horn</td>
                                            <td class="performance">
                                          <div class="radio">
                      <input id="horn_P" type="radio"  checked="checked" name="horn" value="P"/>
                      <label for="horn_P">P</label>
                      <input id="horn_F" type="radio" name="horn" value="F"/>
                      <label for="horn_F">F</label>
                      <input id="horn_NA" type="radio" name="horn" value="NA"/><label for="horn_NA">NA</label></div>
                      </td>
                                        
                                    </tr>
                                    <tr>
                                      <td class="performance">Tires-Wheels-Inflation</td>
                                         <td class="performance">
                                          <div class="radio">
                      <input id="twi_P" type="radio"  checked="checked" name="twi" value="P"/>
                      <label for="twi_P">P</label>
                      <input id="twi_F" type="radio" name="twi" value="F"/>
                      <label for="twi_F">F</label>
                      <input id="twi_NA" type="radio" name="twi" value="NA"/><label for="twi_NA">NA</label></div>
                      </td>
                                         
                                       
                                    </tr>
                                    <tr>
                                      <td class="performance">Brakes fluid reservoir level</td>
                                          <td class="performance">
                                          <div class="radio">
                      <input id="bfrl_P" type="radio"  checked="checked" name="bfrl" value="P"/>
                      <label for="bfrl_P">P</label>
                      <input id="bfrl_F" type="radio" name="bfrl" value="F"/>
                      <label for="bfrl_F">F</label>
                      <input id="bfrl_NA" type="radio" name="bfrl" value="NA"/>
                      <label for="bfrl_NA">NA</label></div>
                      </td>
                                        
                                       
                                    </tr>
                                    <tr>
                                      <td class="performance">Turn signals/4-way flashers</td>
                                        <td class="performance">
                                          <div class="radio">
                      <input id="tsf_P" type="radio"  checked="checked" name="tsf" value="P"/>
                      <label for="tsf_P">P</label>
                      <input id="tsf_F" type="radio" name="tsf" value="F"/>
                      <label for="tsf_F">F</label>
                      <input id="tsf_NA" type="radio" name="tsf" value="NA"/>
                      <label for="tsf_NA">NA</label></div>
                      </td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Radiator coolant level/Condition of Hoses Brakes</td>
                                        <td class="performance">
                                          <div class="radio">
                      <input id="rcl_P" type="radio"  checked="checked" name="rcl" value="P"/>
                      <label for="P">P</label>
                      <input id="rcl_F" type="radio" name="rcl" value="F"/>
                      <label for="rcl_F">F</label>
                      <input id="rcl_NA" type="radio" name="rcl" value="NA"/>
                      <label for="rcl_NA">NA</label></div>
                      </td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Reverse Alert System</td>
                                        <td class="performance">
                                          <div class="radio">
                      <input id="ras_P" type="radio"  checked="checked" name="ras" value="P"/>
                      <label for="P">P</label>
                      <input id="ras_F" type="radio" name="ras" value="F"/>
                      <label for="ras_F">F</label>
                      <input id="ras_NA" type="radio" name="ras" value="NA"/>
                      <label for="ras_NA">NA</label></div>
                      </td>
                                    </tr>
                                
                                    <tr>
                                        <td width="40%" class="performance"><strong>TRAILER</strong></td>
                                        <td class="performance">&nbsp;</td>
                                    </tr>
                                    <tr>
                                       <td class="performance">Couplet safety Pin</td>
                                       
                                         <td class="performance">
                                         <div class="radio">
                      <input id="csp_P" type="radio"  checked="checked" name="csp" value="P"/>
                       <label for="csp_P">P</label>
                      <input id="csp_F" type="radio" name="csp" value="F"/>
                       <label for="csp_F">F</label>
                      <input id="csp_NA" type="radio" name="csp" value="NA"/>
                       <label for="csp_NA">NA</label>
                      </div>
                      </td>
                                      
                                    </tr>
                                    <tr>
                                       <td class="performance">Brake away switch/ cable</td>
                                        
                                        <td class="performance">
                                        <div class="radio">
                      <input id="bas_P" type="radio"  checked="checked" name="bas" value="P"/>
                      <label for="bas_P">P</label>
                      <input id="bas_FP" type="radio" name="bas" value="F"/>
                      <label for="bas_FP">F</label>
                      <input id="bas_NA" type="radio" name="bas" value="NA"/>
                      <label for="bas_NA">NA</label> 
                      </div>
                      </td>
                                       
                                    </tr>
                                    <tr>
                                      <td class="performance">Electic connector plug</td>
                                        
                                         <td class="performance">
                                          <div class="radio">
                      <input id="ecp_P" type="radio"  checked="checked" name="ecp" value="P"/>
                       <label for="P">P</label>
                      <input id="ecp_F" type="radio" name="ecp" value="F"/>
                       <label for="ecp_F">F</label>
                      <input id="ecp_NA" type="radio" name="ecp" value="NA"/>
                       <label for="ecp_NA">NA</label>
                      </div>
                      </td>
                                       
                                  </tr>
                                    <tr>
                                      <td class="performance">Safety chain and hooks</td>
                                  
                                         <td class="performance">
                                          <div class="radio">
                      <input id="sch_P" type="radio" checked="checked" name="sch" value="P"/>
                       <label for="sch_P">P</label>
                      <input id="sch_F" type="radio" name="sch" value="F"/>
                       <label for="sch_F">F</label>
                      <input id="sch_NA" type="radio" name="sch" value="NA"/>
                       <label for="sch_NA">NA</label>
                      </div>
                      </td>
                                      
                                  </tr>
                                    <tr>
                                      <td class="performance">Jack Stand</td>
                                       
                                         <td class="performance">
                                         <div class="radio">
                      <input id="js_P" type="radio"  checked="checked" name="js" value="P"/>
                       <label for="js_P">P</label>
                      <input id="js_F" type="radio" name="js" value="F"/>
                       <label for="js_F">F</label>
                      <input id="js_NA" type="radio" name="js" value="NA"/>
                       <label for="js_NA">NA</label>
                      </div>
                    
                      </td>
                                    
                                  </tr>
                                    <tr>
                                      <td class="performance">Tires-Wheels-Inflation</td>
                                     
                                        <td class="performance">
                                          <div class="radio">
                      <input id="tiwi_P" type="radio"  checked="checked" name="tiwi" value="P"/>
                       <label for="tiwi_P">P</label>
                      <input id="tiwi_F" type="radio" name="tiwi" value="F"/>
                       <label for="tiwi_F">F</label>
                      <input id="tiwi_NA" type="radio" name="tiwi" value="NA"/>
                       <label for="tiwi_NA">NA</label>
                      </div>
                      
                      </td>
                                   
                                  </tr>
                                    <tr>
                                      <td class="performance">Ramp Cables</td>
                                    
                                        <td class="performance">
                                             <div class="radio">
                      <input id="rc_P" type="radio" checked="checked" name="rc" value="P"/>
                       <label for="rc_P">P</label>
                      <input id="rc_F" type="radio" name="rc" value="F"/>
                       <label for="rc_F">F</label>
                      <input id="rc_NA" type="radio" name="rc" value="NA"/>
                       <label for="rc_NA">NA</label>
                      </div>
                     
                      </td>
                                       
                                  </tr>
                                    <tr>
                                      <td class="performance">Springs</td>
                                       
                                        <td class="performance">
                                         <div class="radio">
                      <input id="sp_P" type="radio"  checked="checked" name="sp" value="P"/>
                       <label for="sp_P">P</label>
                      <input id="sp_F" type="radio" name="sp" value="F"/>
                       <label for="sp_F">F</label>
                      <input id="sp_NA" type="radio" name="sp" value="NA"/>
                       <label for="sp_NA">NA</label>
                      </div>
                     
                      </td>
                                      
                                  </tr>
                                    <tr>
                                      <td class="performance">Brakes</td>
                                    
                                        <td class="performance">
                                        <div class="radio">
                      <input id="br_P" type="radio"  checked="checked" name="br" value="P"/>
                       <label for="br_P">P</label>
                      <input id="br_F" type="radio" name="br" value="F"/>
                       <label for="br_F">F</label>
                      <input id="br_NA" type="radio" name="br" value="NA"/>
                       <label for="br_NA">NA</label>
                      </div>
                      
                      </td>
                                      
                                  </tr>
                                    <tr>
                                      <td class="performance">Lights/Reflectors</td>
                                    
                                        <td class="performance">
                                        <div class="radio">
                      <input id="lr_P" type="radio"  checked="checked" name="lr" value="P"/>
                       <label for="lr_P">P</label>
                      <input id="lr_F" type="radio" name="lr" value="F"/>
                       <label for="lr_F">F</label>
                      <input id="lr_NA" type="radio" name="lr" value="NA"/>
                       <label for="lr_NA">NA</label>
                      </div>
                      
                      </td>
                                      
                                  </tr>
                                    <tr>
                                      <td class="performance">Grease dump body Weekly</td>
                                       
                                      <td class="performance">
                                       <div class="radio">
                      <input id="gdbw_P" type="radio"  checked="checked" name="gdbw" value="P"/>
                       <label for="gdbw_P">P</label>
                      <input id="gdbw_F" type="radio" name="gdbw" value="F"/>
                       <label for="gdbw_F">F</label>
                      <input id="gdbw_NA" type="radio" name="gdbw" value="NA"/>
                       <label for="gdbw_NA">NA</label>
                      </div>
                     
                      </td>
                                  
                                    </tr>
                                    
                                    <tr>
                                      <td class="performance"><strong>EQUIPMENT</strong></td>
                                       <td class="performance">&nbsp;</td>
                                  </tr>
                                    <tr>
                                      <td class="performance">Check Oil</td>
                                        
                                      <td class="performance">
                                      <div class="radio">
                      <input id="co_P" type="radio"  checked="checked" name="co" value="P"/>
                       <label for="co_P">P</label>
                      <input id="co_F" type="radio" name="co" value="F"/>
                       <label for="co_F">F</label>
                      <input id="co_NA" type="radio" name="co" value="NA"/>
                       <label for="co_NA">NA</label>
                      </div>
                      </td>
                                      
                                    </tr>
                                    <tr>
                                      <td class="performance">Clean Filters</td>
                                     
                                        <td class="performance">
                                         <div class="radio">
                      <input id="cf_P" type="radio"  checked="checked" name="cf" value="P"/>
                       <label for="cf_P">P</label>
                      <input id="cf_F" type="radio" name="cf" value="F"/>
                       <label for="cf_F">F</label>
                      <input id="cf_NA" type="radio" name="cf" value="NA"/>
                       <label for="cf_NA">NA</label>
                      </div>
                      
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
                                            <input name="Mileageending" type="text" id="Mileageending" size="24" data-bvalidator="required" maxlength="20" data-bvalidator-msg="Please Enter Mileage Ending"/></td>
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
            <!-- to clear footer -->
        </div>

    </form>
</body>
</html>
<?php
}
?>