﻿<?php      

$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 
//$myServer = "server\sqle2008";
//$myUser = "sa";
//$myPass = "sa@2008";
//$myDB = "jrgm"; 

$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet")
or die("Cannot start ADO");
$recordsetImg = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");
$recordsetImgList = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");
$recordsetImgListEml = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");  
$recordset_Supervisor = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");
$recordset_Employee = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");
    
$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
  $conn->open($connStr); //Open the connection to the database


function customError($errno, $errstr)
  {
  echo "<b>Error:</b> [$errno] $errstr";
  }
  
//echo "nice";

$a = "tt  ";
$a .= "<html><head><title></title>"; 
$incidentRpt_Date='';

$VehicleNumber = '';
$IncidentTime ='';
$LicenseNo = '';
$Location ='';
$Employee ='';
$ReportedTo ='';
$Position ='';
$ReportedDate ='';
$Branch='';
$Supervisor_Id='';
$Supervisor ='';
$NatureOfIncident ='';
$OwnerName ='';
$OwnerPhoneNo ='';
$OwnerLicenseNo ='';
$OwnerTypeOfVehicle ='';
$OwnerAddress ='';
$DamegeDesc ='';
$InsuranceInfo ='';
$ImmActionTaken ='';
$EmployeeStatement ='';
$WitnessStatement ='';
$IIC_VisualCheck='';
$IIC_AnyOneInjured='';
$IIC_ImmediateTreatment='';
$IIC_NatureIncident='';
$IIC_LocationIncident='';
$IIC_Lead='';
$IIC_Caused='';
$IIC_GuardinPlace='';
$IIC_WitnessStatement='';
$IIC_PersonalInfo='';
$IIC_ReportIncident='';
$IIC_InsuranceCompany='';
$IIC_IsolateDriver='';
$IIC_RecordName='';
$IIC_FindWitness='';
$IIC_WitnessInfractions='';
$IIC_TakePicture='';
$IIC_PersonalInfoTakePicture='';
$IIC_MechanicalDefects='';
$IIC_WreckerCompany='';
$IIC_PointofImpact='';
$IIC_Measurements='';
$IIC_Sketch='';
$IIC_PoliceIssueCitation='';
$IIC_PoliceOfficerBadge='';
$IIC_Protectcargo='';
$IIC_ArrangeWrecker='';
$IIC_OtherDamage='';
$IIC_FinalExamination='';
$show='';


if (isset($_POST['uploadimg'])) {
       //echo  "# Publish-button was clicked";
    }
    elseif (isset($_POST['btnSumit'])) {
       // echo "# Save-button was clicked";
  }

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
$incidentRpt_Date = $_POST['today_Date']; 
$VehicleNumber = $_POST['Vehicle_Number'];
$IncidentTime = $_POST['time'];
$LicenseNo = $_POST['License_Number'];
$Location = $_POST['Location'];
$Employee = $_POST['Employee_Name'];
$ReportedTo = $_POST['Reported_To'];
$Position = $_POST['Position'];
$ReportedDate = $_POST['Report_date'];
$Branch = $_POST['Branch'];
$Supervisor_Id = $_POST['Supervisor_Id'];
$Supervisor = $_POST['Supervisor_Name'];
$NatureOfIncident = $_POST['nid'];
$OwnerName = $_POST['Owner_name'];
$OwnerPhoneNo = $_POST['Phone_number'];
$OwnerLicenseNo = $_POST['License_Other'];
$OwnerTypeOfVehicle = $_POST['Vehicle_type'];
$OwnerAddress = $_POST['Address'];
$DamegeDesc = $_POST['Damage_description'];
$InsuranceInfo = $_POST['Insurance'];
$ImmActionTaken = $_POST['Action_taken'];
$EmployeeStatement = $_POST['Employee_statement'];
$WitnessStatement = $_POST['Witness_statement'];

$IIC_VisualCheck ="uncheck";
if(isset($_POST['mvb'])){ $IIC_VisualCheck = $_POST['mvb']; }

$IIC_AnyOneInjured ="uncheck";
if(isset($_POST['injured'])){ $IIC_AnyOneInjured = $_POST['injured']; }

$IIC_ImmediateTreatment ="uncheck";
if(isset($_POST['immediatetreatment'])){ $IIC_ImmediateTreatment = $_POST['immediatetreatment']; }

$IIC_NatureIncident ="uncheck ";
if(isset($_POST['nature'])){ $IIC_NatureIncident = $_POST['nature']; }

$IIC_LocationIncident ="uncheck";
if(isset($_POST['checktime'])){ $IIC_LocationIncident = $_POST['checktime']; }

$IIC_Lead ="uncheck ";
if(isset($_POST['checklead'])){ $IIC_Lead = $_POST['checklead']; }

$IIC_GuardinPlace ="uncheck ";
if(isset($_POST['checkguard'])){ $IIC_GuardinPlace = $_POST['checkguard']; }

$IIC_WitnessStatement ="uncheck ";
if(isset($_POST['checkwitneesses'])){ $IIC_WitnessStatement = $_POST['checkwitneesses']; }

$IIC_ReportIncident ="uncheck";
if(isset($_POST['checkpolice'])){ $IIC_ReportIncident = $_POST['checkpolice']; }

$IIC_InsuranceCompany = "uncheck ";
if(isset($_POST['checkisolate'])){ $IIC_InsuranceCompany = $_POST['checkisolate']; }

$IIC_IsolateDriver = "uncheck ";
if(isset($_POST['checkfind'])){ $IIC_IsolateDriver = $_POST['checkfind']; }


$IIC_RecordName = "uncheck ";
if(isset($_POST['checkrecord'])){ $IIC_RecordName = $_POST['checkrecord']; }

$IIC_FindWitness = "uncheck ";
if(isset($_POST['checkfind'])){ $IIC_FindWitness = $_POST['checkfind']; }


$IIC_WitnessInfractions ="uncheck ";
if(isset($_POST['checkdid'])){ $IIC_WitnessInfractions = $_POST['checkdid']; }

$IIC_TakePicture = "uncheck ";
if(isset($_POST['checktake'])){ $IIC_TakePicture = $_POST['checktake']; }

$IIC_PersonalInfoTakePicture ="uncheck ";
if(isset($_POST['checkgetper'])){ $IIC_PersonalInfoTakePicture = $_POST['checkgetper']; }

$IIC_MechanicalDefects = "uncheck ";
if(isset($_POST['checkcheck'])){ $IIC_MechanicalDefects = $_POST['checkcheck']; }

$IIC_WreckerCompany ="uncheck " ;
if(isset($_POST['checkif'])){ $IIC_WreckerCompany = $_POST['checkif']; }

$IIC_PointofImpact = "uncheck ";
if(isset($_POST['checkis'])){ $IIC_PointofImpact = $_POST['checkis']; }

$IIC_Measurements ="uncheck ";
if(isset($_POST['checkmake'])){ $IIC_Measurements = $_POST['checkmake']; }

$IIC_Sketch ="uncheck ";
if(isset($_POST['checkdraw'])){ $IIC_Sketch = $_POST['checkdraw']; }

$IIC_PoliceIssueCitation ="uncheck ";
if(isset($_POST['checkhave'])){ $IIC_PoliceIssueCitation = $_POST['checkhave']; }

$IIC_PoliceOfficerBadge ="uncheck ";
if(isset($_POST['checkoffier'])){ $IIC_PoliceOfficerBadge = $_POST['checkoffier']; }

$IIC_Protectcargo ="uncheck ";
if(isset($_POST['checkcargo'])){ $IIC_Protectcargo = $_POST['checkcargo']; }

$IIC_ArrangeWrecker ="uncheck ";
if(isset($_POST['checkwrecker'])){ $IIC_ArrangeWrecker = $_POST['checkwrecker']; }

$IIC_OtherDamage = "uncheck ";
if(isset($_POST['checknote'])){ $IIC_OtherDamage = $_POST['checknote']; }

$IIC_FinalExamination ="uncheck ";
if(isset($_POST['checkdo'])){ $IIC_FinalExamination = $_POST['checkdo']; }

$currentDate=date("Y-m-d");

$ImageName = ($_FILES['file']['name']);
$show="";
if (isset($_POST['btnSumit'])) {
$sql_InserMember="INSERT INTO Form_IncidentReport([VehicleNumber],[IncidentTime],[LicenseNo],[Location],[Branch],[Employee],[ReportedTo],[Position],[ReportedDate],[Supervisor],[NatureOfIncident],
[OwnerName],[OwnerPhoneNo],[OwnerLicenseNo],[OwnerTypeOfVehicle],[OwnerAddress],[DamegeDesc],[InsuranceInfo],[ImmActionTaken],[EmployeeStatement],[WitnessStatement],
[IIC_VisualCheck],[IIC_AnyOneInjured],[IIC_ImmediateTreatment],[IIC_NatureIncident],[IIC_LocationIncident],[IIC_Lead],[IIC_GuardinPlace],[IIC_WitnessStatement],
[IIC_ReportIncident],[IIC_InsuranceCompany],[IIC_IsolateDriver],[IIC_RecordName],[IIC_FindWitness],[IIC_WitnessInfractions],[IIC_TakePicture],[IIC_PersonalInfoTakePicture],[IIC_MechanicalDefects],[IIC_WreckerCompany],[IIC_PointofImpact],[IIC_Measurements],[IIC_Sketch],[IIC_PoliceIssueCitation],[IIC_PoliceOfficerBadge],[IIC_Protectcargo],[IIC_ArrangeWrecker],[IIC_OtherDamage],[IIC_FinalExamination],[incidentRpt_Date])


values('$VehicleNumber','$IncidentTime','$LicenseNo','$Location','$Branch','$Employee','$ReportedTo','$Position','$ReportedDate','$Supervisor','$NatureOfIncident','$OwnerName','$OwnerPhoneNo','$OwnerLicenseNo','$OwnerTypeOfVehicle','$OwnerAddress','$DamegeDesc','$InsuranceInfo','$ImmActionTaken','$EmployeeStatement','$WitnessStatement',
'$IIC_VisualCheck','$IIC_AnyOneInjured','$IIC_ImmediateTreatment','$IIC_NatureIncident','$IIC_LocationIncident','$IIC_Lead','$IIC_GuardinPlace','$IIC_WitnessStatement',
'$IIC_ReportIncident','$IIC_InsuranceCompany','$IIC_IsolateDriver','$IIC_RecordName','$IIC_FindWitness','$IIC_WitnessInfractions','$IIC_TakePicture','$IIC_PersonalInfoTakePicture','$IIC_MechanicalDefects','$IIC_WreckerCompany','$IIC_PointofImpact','$IIC_Measurements','$IIC_Sketch','$IIC_PoliceIssueCitation','$IIC_PoliceOfficerBadge','$IIC_Protectcargo','$IIC_ArrangeWrecker','$IIC_OtherDamage','$IIC_FinalExamination','$incidentRpt_Date')";
//echo "$sql_InserMember";
$conn->execute($sql_InserMember);
//echo "Form_IncidentReport";

$sql_Select="";
$sql_Select="select top 1 IncidentRpt_ID from form_incidentReport order by createdDate desc";


$recordset->open($sql_Select, $conn, 3);

$IncidentRpt_ID=0;

if(!$recordset->EOF){
     $recordset->movefirst();
    $IncidentRpt_ID= $recordset->fields["incidentRpt_ID"]->value;
	  
	  }
}


if (isset($_POST['uploadimg'])) {	
echo $ImageName;
 if (isset($ImageName) )
		{
 
	$sql_Select="Select count(Incident_ImgID) as ImageCount from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and VehicleNo='$VehicleNumber'";
  
  $recordsetImg->open($sql_Select, $conn, 3);	  
	  
	if(!$recordsetImg->EOF){
		  $recordsetImg->movefirst();
		  $ImageCount= $recordsetImg->fields["ImageCount"]->value+1;
	  }
	 // echo createFromFormat('!m/d/Y', $incidentRpt_Date);
	//$datetime = new DateTime($incidentRpt_Date);
	//echo $datetime."<br/>";
	//$datetime->createFromFormat('m/d/Y', $incidentRpt_Date); 
	//echo $datetime."<br/>";
	//$varstring= $datetime->format('mdy');
	$varstring = str_replace('/', '', $incidentRpt_Date);
	  echo $varstring."<br/>";
	$sql_Insertimage=explode(".", $_FILES["file"]["name"]);
	$ImageName = $varstring .'_'.$VehicleNumber.'_'.$ImageCount.'.'.$sql_Insertimage[1];
	echo "enter345 ------> ". $ImageName;
	$sql_Insertimage=" ";
	$sql_Insertimage="INSERT INTO Form_IncidentReportImageDetails( [Incident_Date],[VehicleNo],[ImageName],[CreatedDate])
				   values('$incidentRpt_Date','$VehicleNumber','$ImageName','$currentDate')";
	
 	$conn->execute($sql_Insertimage);
	//echo "$sql_Insertimage";
	$allowedExts = array("gif", "jpeg", "jpg", "png","PNG","JPEG","JPG");
	$temp = explode(".", $_FILES["file"]["name"]);
	$extension = end($temp);
	if ((($_FILES["file"]["type"] == "image/gif")
	|| ($_FILES["file"]["type"] == "image/jpeg")
	|| ($_FILES["file"]["type"] == "image/jpg")
	|| ($_FILES["file"]["type"] == "image/pjpeg")
	|| ($_FILES["file"]["type"] == "image/x-PNG")
	|| ($_FILES["file"]["type"] == "image/x-JPEG")
	|| ($_FILES["file"]["type"] == "image/x-JPG")
	|| ($_FILES["file"]["type"] == "image/png"))
	&& in_array($extension, $allowedExts))
	  {
	  if ($_FILES["file"]["error"] > 0)
		{
		echo "Return Code: " . $_FILES["file"]["error"] . "<br/>";
		}
	  else
		{
	
		if (file_exists("photos/" . $_FILES["file"]["name"]))
		  {
		  echo $_FILES["file"]["name"] . " already exists. ";
		  }
		else
		  {
		  move_uploaded_file($_FILES["file"]["tmp_name"],
		  "photos/" . $ImageName);
		  }
		}
	  }
	else
	  {
	echo "Invalid file";
	  }
	$rowcount=1;
	$ImageList='';
	}
	else
	{
	
$show = "please choose file.";
echo $show;
	}
}	//if (isset($_POST['uploadimg']))


$checkPart="";
$checkboxtable="";

if($IIC_VisualCheck=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Make a visual check to make sure the scene is protected against further incident.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_AnyOneInjured=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Who was injured? Who, what kind of injury and how bad? Where are they now?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_ImmediateTreatment=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_NatureIncident=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="What was the nature of the incident?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_LocationIncident=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Time and exact location of the incident.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_Lead=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="What/ who lead to the injury?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_GuardinPlace=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_WitnessStatement=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="If there are any witnesses, get statements from them saying what they saw and contact information.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_ReportIncident=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Report incident to direct supervisor and discuss next steps / instructions";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}


if($checkPart!="")
{
$checkboxtable="<table style='width: 1000px;' border='0'> ";

$checkboxtable .="<tr style='padding-top: 20px'>";
$checkboxtable .="<td colspan='4'>";
$checkboxtable .="<strong >";
$checkboxtable .="INCIDENT INVESTIGATION CHECKLIS";
$checkboxtable .="</strong >";
$checkboxtable .="</td>";
$checkboxtable .="</tr>";

$checkboxtable.="$checkPart";
$checkboxtable .="</table> ";
}





$checkPart="";
$checkcontinuetable="";


if($IIC_InsuranceCompany=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Have the police and insurance company been called?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_IsolateDriver=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_RecordName=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_FindWitness=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Find any witnesses. Get names, addresses, license number. Include those who arrived early to the scene.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_WitnessInfractions=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Did witnesses notice obvious infractions?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_TakePicture=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Take pictures and get any evidence before the vehicles are moved.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_PersonalInfoTakePicture=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Get personal information of anyone taking pictures.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_MechanicalDefects=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_WreckerCompany=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="If vehicles have been removed find out by what wrecker company.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_PointofImpact=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Is the point of impact clearly noted on the roadway?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_Measurements=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Make measurements of all physical facts, including length and location of skid marks.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_Sketch=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Draw a sketch of the scene and vehicle locations.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_PoliceIssueCitation=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Have police issued citations or made arrests? Who and what are the charges?";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_PoliceOfficerBadge=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Get the name and badge number of the police officer.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_Protectcargo=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Protect cargo.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_ArrangeWrecker=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Arrange for a wrecker.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_OtherDamage=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Note any other property damage.";
$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($IIC_FinalExamination=="check")
{
$checkPart .="<tr>";
$checkPart .="<td style='width: 600px;'>";
$checkPart .="Do a final examination of the scene.";

$checkPart .="</td>";
$checkPart .="<td style='width: 10px;'>:</td>";
$checkPart .="<td style='width: 170px; text-align: left;'>";
$checkPart .="check";
$checkPart .="</td>";
$checkPart .="<td style='width: 180px;'>&nbsp;</td>";
$checkPart .="</tr>";
}

if($checkPart!="")
{
$checkcontinuetable="<table style='width: 1000px;' border='0'> ";

$checkcontinuetable .="<tr style='padding-top: 20px'>";
$checkcontinuetable .="<td colspan='4'>";
$checkcontinuetable .="<strong >";
$checkcontinuetable .="If incident involves vehicles continue here";
$checkcontinuetable .="</strong >";
$checkcontinuetable .="</td>";
$checkcontinuetable .="</tr>";

$checkcontinuetable .="$checkPart";
$checkcontinuetable .="</table> ";
}


//echo "$emailvalue";
$msgBody = " ";
$msgBody .= "<html><head><title></title></head>";
$msgBody .= "<body style='margin-top:70px;'>";
$msgBody .= "<div id='centrecontent'><div class='centrecontent_inner'>";
$msgBody .= "<div  style='padding-bottom:20px;'><h3>Hello,</h3></div>";
$msgBody .= "<div class='header' style='font-size: 24px;'><strong>Incident Report</strong></div>";
$msgBody .= "<table width='800px;'  style='margin-top:30px;'>";
$msgBody .= "<tr><td valign='top'>";
$msgBody .= "<table width='400px;' >";
$msgBody .= "<tr><td  style='width: 130px;'>Date</td>";
$msgBody .= "<td align='left'  style='width: 100px;'>$incidentRpt_Date</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Time</td><td align='left'>$IncidentTime</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Location</td><td align='left' >$Location</td></tr>";
$msgBody .= "</tr><tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Supervisor</td><td align='left' >$Supervisor</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Employee</td><td align='left' >$Employee</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Position</td><td align='left' >$Position</td>";


$msgBody .= "</table>";
$msgBody .= "</td><td valign='top'><table width='400px;'>";
$msgBody .= "<tr><td  style='width: 120px;'>Vehicle Number</td><td align='left'  style='width: 110px;'>$VehicleNumber </td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >License Number</td><td align='left' >$LicenseNo</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Reported To</td><td align='left' >$ReportedTo</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Reported Date</td><td align='left' >$ReportedDate</td></tr>";
$msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Branch</td><td align='left' >$Branch</td></tr>";
$msgBody .= "</table></td></tr></table>";
$msgBody .= "<table width='800px;'><tr><td valign='top'><table width='400px;' >";
$msgBody .= "<tr><td style=' padding-top:20px;'><p><strong>Nature of Incident &amp; Damage. Please be Specific:</strong></p>$NatureOfIncident</td>";
$msgBody .= "</tr>";
$msgBody .= "</table>";
$msgBody .= "</td>";
$msgBody .= "</tr>";
$msgBody .= "</table>";
$msgBody .= "<table width='99%' border='0' cellpadding='0' cellspacing='0'>";
$msgBody .= "<tr>";
$msgBody .= "<td valign='top'><table width='800px;' border='0' cellpadding='0' cellspacing='0'>";
$msgBody .= "<tr>";
$msgBody .= "<td  style=' padding-top:20px;'><p><strong>Other Vehicle Information:</strong></p></td></tr>";
$msgBody .= "<tr>";
$msgBody .= "<td>";
$msgBody .= "<table width='800px;'>";
$msgBody .= "<tr>";
$msgBody .= "<td  style='width: 200px;'>Name of Owner</td>";
$msgBody .= "<td align='left'  style='width: 180px;'>$OwnerName</td>";
$msgBody .= "<td align='left'  style='width: 200px;'>Phone Number</td>";
$msgBody .= "<td align='left'  style='width: 170px;'>$OwnerPhoneNo</td>";                                    
$msgBody .= "</tr>";
$msgBody .= "<tr>";
$msgBody .= "<td>&nbsp;</td>";
$msgBody .= "<td>&nbsp;</td>";
$msgBody .= "<td>&nbsp;</td>";
$msgBody .= "</tr>";  
$msgBody .= "<tr>";
$msgBody .= "<td >License Number</td>";
$msgBody .= "<td align='left' >$OwnerLicenseNo</td>";
$msgBody .= "<td align='left'>Type of Vehicle</td>";
$msgBody .= "<td align='left' >$OwnerTypeOfVehicle</td>";                                  
$msgBody .= "</tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"; 
$msgBody .= "<tr><td >Address</td><td colspan='3' align='left' >$OwnerAddress</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>";
$msgBody .= "</tr> <tr><td >Description of Damage</td>";
$msgBody .= "<td colspan='3' align='left' >$DamegeDesc</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"; 
$msgBody .= "<tr><td >Insurance Information</td>";
$msgBody .= "<td colspan='3' align='left' >$InsuranceInfo</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"; 
$msgBody .= "<tr><td >Immediate Action Taken</td>";
$msgBody .= "<td colspan='3' align='left' >$ImmActionTaken</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"; 
$msgBody .= "<tr><td >Employee Statement</td><td colspan='3' align='left' >$EmployeeStatement</td>";
$msgBody .= "</tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>";
$msgBody .= "</tr> <tr><td >Witness Statement</td><td colspan='3' align='left' >$WitnessStatement</td>";
$msgBody .= "</tr></table></td></tr></table></td></tr>";
$msgBody .= "<tr><td valign='top'>&nbsp;</td></tr></table>";






$msgBody .= "</br> ";
$msgBody .= "</br> ";


$msgBody .= "$checkboxtable";
$msgBody .= "</br> ";
$msgBody .= "</br> ";



$msgBody .= "$checkcontinuetable";
$msgBody .= "</br> ";
$msgBody .= "</br> ";

if (isset($_POST['btnSumit'])) {
	$sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and VehicleNo='$VehicleNumber'";
	
	$recordsetImgListEml->open($sql_Select, $conn, 3);	 
	
	
	$ImageCnt = 1;
	//$recordsetImgList->fields["ImageName"]->value
	if(!$recordsetImgListEml->EOF){
		$msgBody .= "<table  width='500px;'><tr><td nowrap='nowrap' class='vehicle_inventory' ><strong>Upload Images:</strong></td><td> ";
		$msgBody .= "<table border='1'  style='margin-left:0px'><tr> ";
		$msgBody .= "<th>S No</th>";
		$msgBody .= "<th>Image Name</th>";
		$msgBody .= "<th>Image </th></tr> ";
		if(!$recordsetImgListEml->EOF){
			$recordsetImgListEml->movefirst();
			while (!$recordsetImgListEml->EOF){ //will automatically return false when out of records
				$msgBody .= "<tr><td align='center'>$ImageCnt</td> ";
				$msgBody .= "<td><a target='_blank' href='/forms/photos/".$recordsetImgListEml->fields['ImageName']->value."'>".$recordsetImgListEml->fields['ImageName']->value."</a></td>";
				$msgBody .= "<td><Img src='/forms/photos/". $recordsetImgListEml->fields['ImageName']->value."' width='55px' height='30px'></img></td></tr>";
		
				$recordsetImgListEml->MoveNext(); 
				$ImageCnt = $ImageCnt +1;
			}
		}
		$msgBody .= "</table> </td></tr></table>";
		$msgBody .= "</br> ";
		$msgBody .= "</br> ";
	}

//$msgBody .= "<a href='http://localhost:8081/uat/safetyinspection.php?id=".$IncidentRpt_ID."'> Click here to complete the incident report!</a>";
$msgBody .= "<a href='/forms/safetyinspection.php?id=".$IncidentRpt_ID."'> Click here to complete the incident report!</a>";
$msgBody .= "</br> ";
$msgBody .= "</br> ";
$msgBody .= "<div style='padding-top:30px;'><h3>Thanks</h3></div>";                   
$msgBody .= "</div></div></body></html>";

if (isset($_POST['btnSumit'])) {
$to = 'mcandler@jrgm.com,rramirez@jrgm.com,avelasquez@jrgm.com,jbatterson@jrgm.com,jstrohman@jrgm.com,sherri@429designs.com,aman.rajvanshi@gmail.com'; 
//$to = 'as39274@gmail.com';
$subject = 'Incident Report MAIL'; 
$message = $msgBody; 
$headers = 'From: Incident@example.com' . "\r\n" . 'Reply-To: Weekly@example.com' . "\r\n" . 'X-Mailer: PHP/' . 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
phpversion();
mail($to, $subject, $message, $headers, '-fWeekly@example.com');  
}
//header( 'Location: CrewPerformanceReview.php' ) ;   


$conn = null;

?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>James River Grounds Management</title>
	<script type="text/javascript" language="javascript">
	function redirect(){
		document.location.href=document.location.href;
	}
	</script>
</head>
<body>
	<table width='400' height='200' border='0'  align='center' style="margin-top:200px; border-style: solid;  border-width: 5px; border-color:#9999CC; border-radius:25px;">
		<tr>
			<td style="text-align: center; font-size:24px; font-weight:500; color:#9933FF">
				<strong>Thank you. Your form has been submitted</strong></br>
				<input type='button' style='color:#9999FF; ;margin-top:20px;' onclick="redirect()" value="OK!" />
			</td>
		</tr>
	</table>
</body>
<?php
}
}
if (!isset($_POST['btnSumit'])) {
$sql_Select_Supervisor="select * from app_crews where employee_Position_Id in (1) and active_record = 1 Order by crew_name";

$recordset_Supervisor->open($sql_Select_Supervisor, $conn, 3);

if(!$recordset_Supervisor->EOF){
     $recordset_Supervisor->movefirst();
}

if($Supervisor_Id!='')
{
$sql_Select_Employee="select t1.*,t2.* from app_crews t1 inner join app_employees t2 on t1.employee_id = t2.[Employee ID] where crew_leader_id = $Supervisor_Id and t1.active_record = 1 Order by crew_name";

$recordset_Employee->open($sql_Select_Employee, $conn, 3);

if(!$recordset_Employee->EOF){
     $recordset_Employee->movefirst();
}
}
else
{
$sql_Select_Employee="select t1.*,t2.* from app_crews t1 inner join app_employees t2 on t1.employee_id = t2.[Employee ID] where crew_leader_id = -1 and t1.active_record = 1 Order by crew_name";

$recordset_Employee->open($sql_Select_Employee, $conn, 3);

if(!$recordset_Employee->EOF){
     $recordset_Employee->movefirst();
}
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>James River Grounds Management</title>
<script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
    <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/JavaScript2.js" type="text/javascript"></script>
	<!--<script src="js/phplivex_uncompressed.js" type="text/javascript"></script> -->
    <link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
	<!--<link href="css/styles1.css" rel="stylesheet" /> -->
    <link href="css/date.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#myform').bValidator();
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#today_Date").datepicker();//{dateFormat: 'dd-mm-yy'});
            $("#Report_date").datepicker();
			$('#Phone_number').mask('(999) 999-9999');

        });
    </script>
   
</head>
</head>
<body style="margin-top:0">
    <form action="" method="post" id="myform" class="vehicle_inventory" enctype="multipart/form-data" >
            <div id="centrecontent">
                <!--centre content goes here -->
              <div class="centrecontent_inner">
                    <div class="header">Incident Report</div>

                  <div class="spacer20"></div>

                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>

                            <td valign="top">

                                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Date</td>
                                     
                  <td class="performance"><input type="text" name="today_Date" id="today_Date" size="24" data-bvalidator="required" value="<?php echo $incidentRpt_Date ?>" /></td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Time</td>
                                     <td class="performance">
                                      <input type="time" name="time" id="time" size="24" data-bvalidator="required" value="<?php echo $IncidentTime ?>" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Location</td>
                                       <td class="performance">
                                      <input name="Location" type="text" id="Location" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the Location of the Incident" value="<?php echo $Location ?>" /></td>
                                    </tr>
									<tr>
                                       <td class="performance">Production Manager</td>
                                      <td class="performance">
									  <script type="text/javascript" language="javascript">
									  	function __doPostBack() {
											var theForm = document.forms['myform'];
											if (!theForm) {
												theForm = document.form1;
											}
											$("#Branch").val($("option:selected", $("#Supervisor_Id")).attr('branch'));
											$("#Supervisor_Name").val($("option:selected", $("#Supervisor_Id")).text());
											if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
												theForm.submit();
											}
										}
										
										function __doPostBackEmployee() {
											$("#Employee_Name").val($("option:selected", $("#Employee_Id")).text());
										}
									  </script>
									  <select name="Supervisor_Id" id="Supervisor_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Enter the Supervisor Name" onchange="javascript:__doPostBack();">
									  <option value="" branch="">--Select Supervisor--</option>
									  <?php
									  	while (!$recordset_Supervisor->EOF)
										{
											$sid=$recordset_Supervisor->fields['employee_id']->value;
											$sname = $recordset_Supervisor->fields['crew_name']->value;
											$sbranch = $recordset_Supervisor->fields['employee_branch']->value;
											$str="<option value='$sid' branch='$sbranch'";
											if(isset($_REQUEST['Supervisor_Id']))
											if($_REQUEST['Supervisor_Id']==$sid)
											$str .= "selected='selected'";
											echo $str;
											echo ">$sname";
											echo "</option>";
											$recordset_Supervisor->movenext();
										}
									  ?>
									  </select>
									  <input type="hidden" name="Supervisor_Name" id="Supervisor_Name" value="<?php echo $Supervisor ?>" />
									  </td>
                                     </tr>
                                     <tr>
                                        <td class="performance">Employee</td>
                                       <td class="performance">
									   <select name="Employee_Id" id="Employee_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Name" onchange="javascript:__doPostBackEmployee();">
									   <option value="">--Select Employee--</option>
									   <?php
									  	while (!$recordset_Employee->EOF)
										{
											$eid=$recordset_Employee->fields['employee_id']->value;
											$ename = $recordset_Employee->fields['crew_name']->value;
											$str="<option value='$eid'";
											if(isset($_REQUEST['Employee_Id']))
											if($_REQUEST['Employee_Id']==$eid)
											$str .= "selected='selected'";
											echo $str;
											echo ">$ename";
											echo "</option>";
											$recordset_Employee->movenext();
										}
									  ?>
									   </select>
									   <input type="hidden" name="Employee_Name" id="Employee_Name" value="<?php echo $Employee ?>" />
                                    </tr>
                                     <tr>
                                       <td class="performance">Position</td>
                                      <td class="performance"><input type="text" name="Position" id="Position"  size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Position" value="<?php echo $Position ?>"/></td>
                                     </tr>
                                </table>
                            </td>
                            <td valign="top">

                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                     <tr>
                                       <td class="performance">Vehicle Number</td>
                                      <td class="performance"><input type="text" name="Vehicle_Number" id="Vehicle_Number" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the Vehicle Number" value="<?php echo $VehicleNumber ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">License Number</td>
                                      <td class="performance"><input type="text" name="License_Number" id="License_Number" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the License Number" value="<?php echo $LicenseNo ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">Reported To</td>
                                      <td class="performance"><input name="Reported_To" type="text" id="Reported_To" size="24"  data-bvalidator="required" data-bvalidator-msg="Who Was the Incident Reported To" value="<?php echo $ReportedTo ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">Reported Date</td>
                                      <td class="performance"><input type="text" name="Report_date" id="Report_date" size="24"  data-bvalidator="required"  value="<?php echo $ReportedDate ?>"/></td>
                                     </tr>
									 <tr>
                                       <td class="performance">Branch</td>
                                      <td class="performance"><input type="text" name="Branch" id="Branch" size="24" readonly="true" value="<?php echo $Branch ?>"/></td>
                                     </tr>
                                </table>
                            </td>

                        </tr>

                    </table>

                    <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        
                  </table>
                  <table width="99%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                          <td valign="top">
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                      <td class="performance"><p><strong>Nature of Incident &amp; Damage. Please be Specific:</strong></p>
                                      <p>
                                        <textarea name="nid" id="nid" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Nature of the Incident and Damage." value="" /><?php echo $NatureOfIncident ?></textarea>
                                      </p></td>
                                </tr>
                              </table>
                          </td>
                    </tr>
                              </table>
                          
                      
                  
                <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top"><table width="99%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                               <td class="performance"><p><strong>Other Vehicle Information</strong></p></td></tr>
                                <tr>
                                  <td>
                                     
                                     <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Name of Owner</td>
                                   <td class="performance"><input type="text" name="Owner_name" id="Owner_name" size="24" value="<?php echo $OwnerName ?>" /></td>
                                    <td align="left" nowrap="nowrap" class="vehicle_inventory">Phone Number</td>
<td class="performance"><input type="text" name="Phone_number" id="Phone_number" size="24" value="<?php echo $OwnerPhoneNo ?>" /></td>                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">License Number</td>
                                   <td class="performance"><input type="text" name="License_Other" id="License_Other" size="24" value="<?php echo $OwnerLicenseNo ?>" /></td>
                                    <td align="left" nowrap="nowrap" class="vehicle_inventory">Type of Vehicle</td>
<td align="left" class="vehicle_inventory"><input type="text" name="Vehicle_type" id="Vehicle_type" size="24" value="<?php echo $OwnerTypeOfVehicle ?>" /></td>                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Address</td>
                                    <td colspan="3" align="left" class="vehicle_inventory"><input name="Address" type="text" id="Address" size="50" value="<?php echo $OwnerAddress ?>" /></td>
                                    </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Description of Damage</td>
                                    <td colspan="3" align="left" class="vehicle_inventory"><textarea name="Damage_description" value="" id="Damage_description" cols="75" rows="5"><?php echo $DamegeDesc ?></textarea></td>
                                    </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Insurance Information</td>

                                    <td colspan="3" align="left" class="vehicle_inventory"><textarea name="Insurance" value="" id="Insurance" cols="75" rows="5"><?php echo $InsuranceInfo ?></textarea></td>
                                    </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Immediate Action Taken</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Action_taken" id="Action_taken" cols="75" rows="5"  value="<?php echo $ImmActionTaken ?>" data-bvalidator="required" data-bvalidator-msg="Please Enter the Immediate Action Taken." /><?php echo $ImmActionTaken ?></textarea></td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Employee Statement</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Employee_statement" id="Employee_statement" cols="75" rows="5" value="<?php echo $EmployeeStatement ?>" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Statement." value="<?php echo $EmployeeStatement ?>"/><?php echo $EmployeeStatement ?></textarea></td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Witness Statement</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Witness_statement" id="Witness_statement" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Witness Statement." value="<?php echo $WitnessStatement ?>" /><?php echo $WitnessStatement ?></textarea>
                                    </td>
                                  </tr>
								  <tr>
									<td nowrap="nowrap" class="vehicle_inventory">Upload Photos</td>
									<td colspan="3" align="left" class="vehicle_inventory">
									<?php
		
									if ($_SERVER['REQUEST_METHOD'] == 'POST')
									{
										$conn = new COM ("ADODB.Connection");
										$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
										$conn->open($connStr); //Open the connection to the database
										
										
										$sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and VehicleNo='$VehicleNumber'";
										
										$recordsetImgList->open($sql_Select, $conn, 3);	  
										
										
										$ImageCnt = 1;
										if(!$recordsetImgList->EOF)
										{
									?>
											<table border=""  style="width: 63.5%; margin: 5px;">
											
											<tr>
											
											<th>S No</th>
											<th>Image Name</th>
											<th>Image </th>
											</tr>
											<?php
											$recordsetImgList->movefirst();
											while (!$recordsetImgList->EOF)
											{ //will automatically return false when out of records
											?>
												<tr>
												<td> <?php echo $ImageCnt; ?> </td>
												<td> <?php echo $recordsetImgList->fields["ImageName"]->value; ?> </td>
												<td> <img src="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" width="50px" height="30px" style="text-align:center" /> </td></tr>
												<?php
												//$ImageList=$recordsetImgList->fields["Incident_ImgID"]->value.'---'. $recordsetImgList->fields["ImageName"]->value."</br>";
												//echo $ImageList;
												$recordsetImgList->MoveNext(); 
												$ImageCnt = $ImageCnt +1;
											}
											?>
									</table>
									<?php
										}
									}
									?>	
									
									<input type="file" name="file" id="file" size="35">
									
									<input type="submit" name="uploadimg" value="Upload Photos"><?php echo $show; ?></td>
							      </tr>
                                  </table></td>
                              </tr>
                            </table></td>
					
                        </tr>
                        <tr>
                            <td valign="top">&nbsp;</td>
                        </tr>
                    </table>
                    <br /><br />  <p><strong>INCIDENT INVESTIGATION CHECKLIST</strong></p>
                    <div class="checkbox">
			<input id="check1" type="checkbox" name="mvb" value="check" <?php if($IIC_VisualCheck=="check"){echo "checked=\"checked\" ";} ?>  />
			<label for="check1">Make a visual check to make sure the scene is protected against further incident.</label>
			<br/>
			<input id="check2" type="checkbox" name="injured" value="check"  <?php if($IIC_AnyOneInjured=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check2">Who was injured? Who, what kind of injury and how bad? Where are they now?</label>
			<br/>
			<input id="check3" type="checkbox" name="immediatetreatment" value="check"  <?php if($IIC_ImmediateTreatment=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check3">Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?</label>
            <br/>
			<input id="check4" type="checkbox" name="nature" value="check"  <?php if($IIC_NatureIncident=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check4">What was the nature of the incident?</label>
              <br/>
			<input id="check5" type="checkbox" name="checktime" value="check"  <?php if($IIC_LocationIncident=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check5">Time and exact location of the incident.</label>
               <br/>
			<input id="check6" type="checkbox" name="checklead" value="check"  <?php if($IIC_Lead=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check6">What/ who lead to the injury?</label>
             <br/>
			<input id="check7" type="checkbox" name="checkguard" value="check"  <?php if($IIC_GuardinPlace=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check7">Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?</label>
             <br/>
			<input id="check8" type="checkbox" name="checkwitneesses" value="check"  <?php if($IIC_WitnessStatement=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check8">If there are any witnesses, get statements from them saying what they saw and contact information.</label>
              <br/>
			<input id="check9" type="checkbox" name="checkreport" value="check"  <?php if($IIC_ReportIncident=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check9">Report incident to direct supervisor and discuss next steps / instructions</label>
                    
		</div>
                    
                                     
                <p class="incident">If incident involves vehicles continue here</p>
                 <div class="checkbox">
			<input id="check11" type="checkbox" name="checkpolice" value="check"  <?php if($IIC_InsuranceCompany=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check11">Have the police and insurance company been called?</label>
			<br/>
			<input id="check12" type="checkbox" name="checkisolate" value="check"  <?php if($IIC_IsolateDriver=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check12">Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.</label>
            <br/>
			<input id="check13" type="checkbox" name="checkrecord" value="check"  <?php if($IIC_RecordName=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check13">Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.</label>
              <br/>
			<input id="check14" type="checkbox" name="checkfind" value="check"  <?php if($IIC_FindWitness=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check14">Find any witnesses.  Get names, addresses, license number.  Include those who arrived early to the scene.</label>
               <br/>
			<input id="check15" type="checkbox" name="checkdid" value="check"  <?php if($IIC_WitnessInfractions=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check15">Did witnesses notice obvious infractions?</label>
             <br/>
			<input id="check16" type="checkbox" name="checktake" value="check" <?php if($IIC_TakePicture=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check16">Take pictures and get any evidence before the vehicles are moved.</label>
            <br/>
			<input id="check17" type="checkbox" name="checkgetper" value="check"  <?php if($IIC_PersonalInfoTakePicture=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check17">Get personal information of anyone taking pictures.</label>
             <br/>
			<input id="check18" type="checkbox" name="checkcheck" value="check"  <?php if($IIC_MechanicalDefects=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check18">Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.</label>
              <br/>
			<input id="check19" type="checkbox" name="checkif" value="check"  <?php if($IIC_WreckerCompany=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check19">If vehicles have been removed find out by what wrecker company.</label>
              <br/>
			<input id="check20" type="checkbox" name="checkis" value="check"  <?php if($IIC_PointofImpact=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check20">Is the point of impact clearly noted on the roadway?</label>
             <br/>
			<input id="check21" type="checkbox" name="checkmake" value="check"  <?php if($IIC_Measurements=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check21">Make measurements of all physical facts, including length and location of skid marks.</label>
             <br/>
			<input id="check22" type="checkbox" name="checkdraw" value="check"  <?php if($IIC_Sketch=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check22">Draw a sketch of the scene and vehicle locations.</label>
             <br/>
			<input id="check23" type="checkbox" name="checkhave" value="check"  <?php if($IIC_PoliceIssueCitation=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check23">Have police issued citations or made arrests? Who and what are the charges?</label>
             <br/>
			<input id="check24" type="checkbox" name="checkoffier" value="check"  <?php if($IIC_PoliceOfficerBadge=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check24">Get the name and badge number of the police officer.</label>
             <br/>
			<input id="check25" type="checkbox" name="checkcargo" value="check"  <?php if($IIC_Protectcargo=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check25">Protect cargo.</label>
             <br/>
			<input id="check26" type="checkbox" name="checkwrecker" value="check"  <?php if($IIC_ArrangeWrecker=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check26">Arrange for a wrecker.</label>
             <br/>
			<input id="check27" type="checkbox" name="checknote" value="check"  <?php if($IIC_OtherDamage=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check27">Note any other property damage.</label>
              <br/>
			<input id="check28" type="checkbox" name="checkdo" value="check"  <?php if($IIC_FinalExamination=="check"){echo "checked=\"checked\" ";} ?>/>
			<label for="check28">Do a final examination of the scene.</label>
                    
		</div>
	


		
		</table>
		
		
                   
                             
                    <div align="right"><input type="submit" value="Submit"  name="btnSumit"/></div>
              </div>
            </div>
              
			

    </form>
	
	
	
	

</body>
</html>
<?php

}

?>


