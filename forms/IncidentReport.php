<?php      
require_once "extends.php";
require_once "db_config.php";
include 'Receivers.php';

function getGUID(){
    if (function_exists('com_create_guid')){
        return com_create_guid();
    } else{
        mt_srand((double)microtime() * 10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = //chr(123)// "{".
            substr($charid, 0, 8).$hyphen.
            substr($charid, 8, 4).$hyphen.
            substr($charid,12, 4).$hyphen.
            substr($charid,16, 4).$hyphen.
            substr($charid,20,12)
            //.chr(125);// "}"
            ;
        return $uuid;
    }
}

$IncidentRpt_ID = getGUID();

$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImg = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgList = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgListEml = new COM("ADODB.RecordSet") or die("Cannot start ADO");  
$recordset_Branch = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordset_Employee = new COM("ADODB.RecordSet") or die("Cannot start ADO");
    
$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database


function customError($errno, $errstr) {
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
$Employee_ID='';
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
$Note='';
$show='';


if (isset($_POST['uploadimg'])) {
    //echo  "# Publish-button was clicked";
} elseif (isset($_POST['btnSumit'])) {
    // echo "# Save-button was clicked";
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //echo "employee : - ". $_POST['Employee'];

    if(isset($_POST['Vehicle_Number'])) { $VehicleNumber = $_POST['Vehicle_Number']; }
    if(isset($_POST['License_Number'])) { $LicenseNo = $_POST['License_Number']; }
    if(isset($_POST['Employee_ID'])) { $Employee_ID = $_POST['Employee_ID']; }
    if(isset($_POST['Reported_To'])) { $ReportedTo = $_POST['Reported_To']; }
    if(isset($_POST['Position'])) { $Position = $_POST['Position']; }
    if(isset($_POST['Report_date'])) { $ReportedDate = $_POST['Report_date'];; }
    if(isset($_POST['Supervisor_Id'])) { $Supervisor_Id = $_POST['Supervisor_Id']; }
    if(isset($_POST['Supervisor_Name'])) { $Supervisor = $_POST['Supervisor_Name']; }
    if(isset($_POST['nid'])) { $NatureOfIncident = $_POST['nid']; }
    if(isset($_POST['Owner_name'])) { $OwnerName = $_POST['Owner_name']; }
    if(isset($_POST['Phone_number'])) { $OwnerPhoneNo = $_POST['Phone_number']; }
    if(isset($_POST['License_Other'])) { $OwnerLicenseNo = $_POST['License_Other']; }
    if(isset($_POST['Vehicle_type'])) { $OwnerTypeOfVehicle = $_POST['Vehicle_type']; }
    if(isset($_POST['Address'])) { $OwnerAddress = $_POST['Address']; }
    if(isset($_POST['Damage_description'])) { $DamegeDesc = $_POST['Damage_description']; }	
    if(isset($_POST['Insurance'])) { $InsuranceInfo = $_POST['Insurance']; }
    if(isset($_POST['Action_taken'])) { $ImmActionTaken = $_POST['Action_taken']; }
    if(isset($_POST['Employee_statement'])) { $EmployeeStatement = $_POST['Employee_statement']; }
    if(isset($_POST['Witness_statement'])) { $WitnessStatement = $_POST['Witness_statement']; }
    if(isset($_POST['Note'])) { $Note = $_POST['Note']; }
    if(isset($_POST['today_Date'])) { $incidentRpt_Date = $_POST['today_Date']; }
    if(isset($_POST['time'])) { $IncidentTime = $_POST['time']; }
    if(isset($_POST['Location'])) { $Location = $_POST['Location']; }
    if(isset($_POST['Branch_Id'])) { $Branch = $_POST['Branch_Id']; }									

    $Employee = $_POST['Employee'];

    $IIC_VisualCheck = isset($_POST['mvb']) ? $_POST['mvb'] : "uncheck";
    $IIC_AnyOneInjured = isset($_POST['injured']) ? $_POST['injured'] : "uncheck";
    $IIC_ImmediateTreatment = isset($_POST['immediatetreatment']) ? $_POST['immediatetreatment'] : "uncheck";
    $IIC_NatureIncident = isset($_POST['nature']) ? $_POST['nature'] : "uncheck";
    $IIC_LocationIncident = isset($_POST['checktime']) ? $_POST['checktime'] : "uncheck";
    $IIC_Lead = isset($_POST['checklead']) ? $_POST['checklead'] : "uncheck ";
    $IIC_GuardinPlace = isset($_POST['checkguard']) ? $_POST['checkguard'] : "uncheck ";
    $IIC_WitnessStatement = isset($_POST['checkwitneesses']) ? $_POST['checkwitneesses'] : "uncheck ";
    $IIC_ReportIncident = isset($_POST['checkpolice']) ? $_POST['checkpolice'] : "uncheck";
    $IIC_InsuranceCompany = isset($_POST['checkisolate']) ? $_POST['checkisolate'] : "uncheck ";
    $IIC_IsolateDriver = isset($_POST['checkfind']) ? $_POST['checkfind'] : "uncheck ";
    $IIC_RecordName = isset($_POST['checkrecord']) ? $_POST['checkrecord'] : "uncheck ";
    $IIC_FindWitness = isset($_POST['checkfind']) ? $_POST['checkfind'] : "uncheck ";
    $IIC_WitnessInfractions = isset($_POST['checkdid']) ? $_POST['checkdid'] : "uncheck ";
    $IIC_TakePicture = isset($_POST['checktake']) ? $_POST['checktake'] : "uncheck ";
    $IIC_PersonalInfoTakePicture = isset($_POST['checkgetper']) ? $_POST['checkgetper'] : "uncheck ";
    $IIC_MechanicalDefects = isset($_POST['checkcheck']) ? $_POST['checkcheck'] : "uncheck ";
    $IIC_WreckerCompany = isset($_POST['checkif']) ? $_POST['checkif'] : "uncheck " ;
    $IIC_PointofImpact = isset($_POST['checkis']) ? $_POST['checkis'] : "uncheck ";
    $IIC_Measurements = isset($_POST['checkmake']) ? $_POST['checkmake'] : "uncheck ";
    $IIC_Sketch = isset($_POST['checkdraw']) ? $_POST['checkdraw'] : "uncheck ";
    $IIC_PoliceIssueCitation = isset($_POST['checkhave']) ? $_POST['checkhave'] : "uncheck ";
    $IIC_PoliceOfficerBadge = isset($_POST['checkoffier']) ? $_POST['checkoffier'] : "uncheck ";
    $IIC_Protectcargo = isset($_POST['checkcargo']) ? $_POST['checkcargo'] : "uncheck ";
    $IIC_ArrangeWrecker = isset($_POST['checkwrecker']) ? $_POST['checkwrecker'] : "uncheck ";
    $IIC_OtherDamage = isset($_POST['checknote']) ? $_POST['checknote'] : "uncheck ";
    $IIC_FinalExamination = isset($_POST['checkdo']) ? $_POST['checkdo'] : "uncheck ";
    
    $currentDate = date("Y-m-d");

    $show = "";

    if (isset($_POST['btnSumit'])) {
        $VehicleNumber = escape_characters($VehicleNumber); 
        $LicenseNo = escape_characters($LicenseNo);
        $Employee_ID = escape_characters($Employee_ID);
        $ReportedTo = escape_characters($ReportedTo);
        $Position = escape_characters($Position);
        $Supervisor_Id = escape_characters($Supervisor_Id);
        $Supervisor = escape_characters($Supervisor);
        $NatureOfIncident = escape_characters($NatureOfIncident);
        $OwnerName = escape_characters($OwnerName);
        $OwnerPhoneNo = escape_characters($OwnerPhoneNo);
        $OwnerLicenseNo = escape_characters($OwnerLicenseNo);
        $OwnerTypeOfVehicle = escape_characters($OwnerTypeOfVehicle);
        $OwnerAddress = escape_characters($OwnerAddress);
        $DamegeDesc = escape_characters($DamegeDesc);
        $InsuranceInfo = escape_characters($InsuranceInfo);
        $ImmActionTaken = escape_characters($ImmActionTaken);
        $EmployeeStatement = escape_characters($EmployeeStatement);
        $WitnessStatement = escape_characters($WitnessStatement);
        $Location = escape_characters($Location);
        $Note = escape_characters($Note);
        
        $IncidentRpt_ID = str_replace(array("{", "}"), "", $IncidentRpt_ID);
        $Employee = trim($Employee);
        $Supervisor = trim($Supervisor);
        
        //insert data
        $sql_InserMember="INSERT INTO Form_IncidentReport([IncidentRpt_ID], [VehicleNumber],[IncidentTime],[LicenseNo],[Location],[Branch],[Employee],[ReportedTo],[Position],
                        [ReportedDate],[Supervisor],[NatureOfIncident],[OwnerName],[OwnerPhoneNo],[OwnerLicenseNo],[OwnerTypeOfVehicle],[OwnerAddress],
                        [DamegeDesc],[InsuranceInfo],[ImmActionTaken],[EmployeeStatement],[WitnessStatement],[IIC_VisualCheck],[IIC_AnyOneInjured],
                        [IIC_ImmediateTreatment],[IIC_NatureIncident],[IIC_LocationIncident],[IIC_Lead],[IIC_GuardinPlace],[IIC_WitnessStatement],
                        [IIC_ReportIncident],[IIC_InsuranceCompany],[IIC_IsolateDriver],[IIC_RecordName],[IIC_FindWitness],[IIC_WitnessInfractions],
                        [IIC_TakePicture],[IIC_PersonalInfoTakePicture],[IIC_MechanicalDefects],[IIC_WreckerCompany],[IIC_PointofImpact],[IIC_Measurements],
                        [IIC_Sketch],[IIC_PoliceIssueCitation],[IIC_PoliceOfficerBadge],[IIC_Protectcargo],[IIC_ArrangeWrecker],[IIC_OtherDamage],
                        [IIC_FinalExamination],[incidentRpt_Date],[Note])

                values('$IncidentRpt_ID', '$VehicleNumber','$IncidentTime','$LicenseNo','$Location','$Branch','$Employee_ID','$ReportedTo','$Position',
                       '$ReportedDate','$Supervisor','$NatureOfIncident','$OwnerName','$OwnerPhoneNo','$OwnerLicenseNo','$OwnerTypeOfVehicle','$OwnerAddress',
                       '$DamegeDesc','$InsuranceInfo','$ImmActionTaken','$EmployeeStatement','$WitnessStatement','$IIC_VisualCheck','$IIC_AnyOneInjured',
                       '$IIC_ImmediateTreatment','$IIC_NatureIncident','$IIC_LocationIncident','$IIC_Lead','$IIC_GuardinPlace','$IIC_WitnessStatement',
                       '$IIC_ReportIncident','$IIC_InsuranceCompany','$IIC_IsolateDriver','$IIC_RecordName','$IIC_FindWitness','$IIC_WitnessInfractions',
                       '$IIC_TakePicture','$IIC_PersonalInfoTakePicture','$IIC_MechanicalDefects','$IIC_WreckerCompany','$IIC_PointofImpact','$IIC_Measurements',
                       '$IIC_Sketch','$IIC_PoliceIssueCitation','$IIC_PoliceOfficerBadge','$IIC_Protectcargo','$IIC_ArrangeWrecker','$IIC_OtherDamage',
                       '$IIC_FinalExamination','$incidentRpt_Date','$Note')";
        //echo "$sql_InserMember";
        try {
            $conn->execute($sql_InserMember);
        }
        catch(Exception $e) {
            include "Error_saving_report.php";
            exit;
        }
        //echo "Form_IncidentReport";

        $sql_Select = "";
        $sql_Select = "select top 1 IR_ID from form_incidentReport where IncidentRpt_ID='$IncidentRpt_ID'";

        $recordset->open($sql_Select, $conn, 3);

        if(!$recordset->EOF) {
            $recordset->movefirst();
            $IR_ID = $recordset->fields["IR_ID"]->value;
	    }
        
        //image uploading
        if ($_FILES['file']['name'][0] != "") {
            $sql_Select = "Select count(Incident_ImgID) as ImageCount from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and IncidentRpt_ID='$IncidentRpt_ID'";
          
            $recordsetImg->open($sql_Select, $conn, 3);      
              
            if(!$recordsetImg->EOF){
                $recordsetImg->movefirst();
                $ImageCount = $recordsetImg->fields["ImageCount"]->value + 1;
            }
             // echo createFromFormat('!m/d/Y', $incidentRpt_Date);
            //$datetime = new DateTime($incidentRpt_Date);
            //echo $datetime."<br/>";
            //$datetime->createFromFormat('m/d/Y', $incidentRpt_Date); 
            //echo $datetime."<br/>";
            //$varstring= $datetime->format('mdy');
            
            //echo $varstring."<br/>";
            for($i = 0; $i < count($_FILES["file"]["name"]); $i++) {  
                $temp = explode(".", $_FILES["file"]["name"][$i]);
                $ImageName = "Incident_".$IR_ID .'_'.$ImageCount.'.'.end($temp);

                $sql_Insertimage = " ";
                
//                $allowedExts = array("gif", "jpeg", "jpg", "png", "pdf");
//                $allowedFileTypes = array("image/gif", 
//                                          "image/jpeg", 
//                                          "image/jpg", 
//                                          "image/pjpeg", 
//                                          "image/x-PNG", 
//                                          "image/x-JPEG", 
//                                          "image/x-JPG", 
//                                          "application/pdf", 
//                                          "application/PDF",
//                                          "image/png");
                
                $extension = mb_strtolower(end($temp));
                
//                if (in_array($_FILES["file"]["type"][$i], $allowedFileTypes) && in_array($extension, $allowedExts)) {
                    if ($_FILES["file"]["error"][$i] > 0) {
                        echo "Return Code: " . $_FILES["file"]["error"][$i] . "<br/>";
                    } else {
                        move_uploaded_file($_FILES["file"]["tmp_name"][$i], "photos/" . $ImageName);
                        $sql_Insertimage = "INSERT INTO Form_IncidentReportImageDetails( [Incident_Date],[VehicleNo],[ImageName],[CreatedDate],[IncidentRpt_ID])
                               values('$incidentRpt_Date','$VehicleNumber','$ImageName','$currentDate','$IncidentRpt_ID')";
                        $conn->execute($sql_Insertimage);
                    }
//                } else {
//                    echo "Invalid file";
//                 }
                
                $ImageCount++;
            }
            $rowcount = 1;
            $ImageList = '';
            
        } else {
            $show = "please choose file.";
//            echo $show;
        }
    }       
    
    $checkPart = "";
    $checkboxtable = "";

    if($IIC_VisualCheck == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Make a visual check to make sure the scene is protected against further incident.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_AnyOneInjured == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Who was injured? Who, what kind of injury and how bad? Where are they now?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_ImmediateTreatment == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_NatureIncident == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "What was the nature of the incident?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_LocationIncident == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Time and exact location of the incident.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_Lead == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "What/ who lead to the injury?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_GuardinPlace == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_WitnessStatement == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "If there are any witnesses, get statements from them saying what they saw and contact information.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_ReportIncident == "check"){
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Report incident to direct supervisor and discuss next steps / instructions";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($checkPart != "") {
        $checkboxtable = "<table style='width: 1000px;' border='0'> ";

        $checkboxtable .= "<tr style='padding-top: 20px'>";
        $checkboxtable .= "<td colspan='4'>";
        $checkboxtable .= "<strong >";
        $checkboxtable .= "INCIDENT INVESTIGATION CHECKLIS";
        $checkboxtable .= "</strong >";
        $checkboxtable .= "</td>";
        $checkboxtable .= "</tr>";

        $checkboxtable .= "$checkPart";
        $checkboxtable .= "</table> ";
    }

    $checkPart = "";
    $checkcontinuetable = "";

    if ($IIC_InsuranceCompany == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Have the police and insurance company been called?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if($IIC_IsolateDriver == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_RecordName == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_FindWitness == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Find any witnesses. Get names, addresses, license number. Include those who arrived early to the scene.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_WitnessInfractions == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Did witnesses notice obvious infractions?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_TakePicture == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Take pictures and get any evidence before the vehicles are moved.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_PersonalInfoTakePicture == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Get personal information of anyone taking pictures.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_MechanicalDefects == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_WreckerCompany == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "If vehicles have been removed find out by what wrecker company.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_PointofImpact == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Is the point of impact clearly noted on the roadway?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_Measurements == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Make measurements of all physical facts, including length and location of skid marks.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_Sketch == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Draw a sketch of the scene and vehicle locations.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_PoliceIssueCitation == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Have police issued citations or made arrests? Who and what are the charges?";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_PoliceOfficerBadge == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Get the name and badge number of the police officer.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_Protectcargo == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Protect cargo.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_ArrangeWrecker == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Arrange for a wrecker.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_OtherDamage == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Note any other property damage.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($IIC_FinalExamination == "check") {
        $checkPart .= "<tr>";
        $checkPart .= "<td style='width: 600px;'>";
        $checkPart .= "Do a final examination of the scene.";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 10px;'>:</td>";
        $checkPart .= "<td style='width: 170px; text-align: left;'>";
        $checkPart .= "check";
        $checkPart .= "</td>";
        $checkPart .= "<td style='width: 180px;'>&nbsp;</td>";
        $checkPart .= "</tr>";
    }

    if ($checkPart != "") {
        $checkcontinuetable = "<table style='width: 1000px;' border='0'> ";

        $checkcontinuetable .= "<tr style='padding-top: 20px'>";
        $checkcontinuetable .= "<td colspan='4'>";
        $checkcontinuetable .= "<strong >";
        $checkcontinuetable .= "If incident involves vehicles continue here";
        $checkcontinuetable .= "</strong >";
        $checkcontinuetable .= "</td>";
        $checkcontinuetable .= "</tr>";

        $checkcontinuetable .= "$checkPart";
        $checkcontinuetable .= "</table> ";
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
    $msgBody .= "<tr><td>Time</td><td align='left'>$IncidentTime</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Location</td><td align='left' >$Location</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Branch</td><td align='left' >$Branch</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Employee</td><td align='left' >$Employee_ID</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Production Manager</td><td align='left' >$Supervisor</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Position</td><td align='left' >$Position</td></tr>";
    $msgBody .= "</table>";
    
    $msgBody .= "</td><td valign='top'><table width='400px;'>";
    $msgBody .= "<tr><td style='width: 120px;'>Vehicle Number</td><td align='left'  style='width: 110px;'>$VehicleNumber </td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>License Number</td><td align='left' >$LicenseNo</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Reported To</td><td align='left' >$ReportedTo</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";
    $msgBody .= "<tr><td>Reported Date</td><td align='left' >$ReportedDate</td></tr>";
    $msgBody .= "<tr><td> &nbsp;</td><td>&nbsp;</td></tr>";

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
	    $sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and IncidentRpt_ID='$IncidentRpt_ID'";

	    $recordsetImgListEml->open($sql_Select, $conn, 3);	 
	    
	    // $ImageCnt = 1;
	    // if(!$recordsetImgListEml->EOF){
		   //  $msgBody .= "<table  width='500px;'><tr><td nowrap='nowrap' class='vehicle_inventory' ><strong>Upload Files:</strong></td><td> ";
		   //  $msgBody .= "<table border='1'  style='margin-left:0px'><tr> ";
		   //  $msgBody .= "<th>S No</th>";
		   //  $msgBody .= "<th>File Name</th>";
		   //  $msgBody .= "<th>File </th></tr> ";
		   //  if(!$recordsetImgListEml->EOF){
			  //   $recordsetImgListEml->movefirst();
			  //   while (!$recordsetImgListEml->EOF){ //will automatically return false when out of records
     //                $tempFile = explode(".", $recordsetImgListEml->fields["ImageName"]->value);
     //                $fileextension = mb_strtolower(end($tempFile));
				 //    $msgBody .= "<tr><td align='center'>$ImageCnt</td> ";
				 //    $msgBody .= "<td><a target='_blank' href='http://jrgm.biz/forms/photos/".$recordsetImgListEml->fields['ImageName']->value."'>".$recordsetImgListEml->fields['ImageName']->value."</a></td>";
     //                if ($fileextension == "pdf") {
     //                    $msgBody .= "<td><Img src='http://jrgm.biz/forms/images/pdf.jpg' width='55px' height='30px'></img></td></tr>";
     //                } else if (in_array($fileextension, array('png','jpeg','jpg','gif','pjpeg'))) {
     //                    $msgBody .= "<td><Img src='http://jrgm.biz/forms/photos/". $recordsetImgListEml->fields['ImageName']->value."' width='55px' height='30px'></img></td></tr>";
     //                }
     //                else {
     //                    $msgBody .= "<td><Img src='http://jrgm.biz/forms/images/file.jpg' width='55px' height='30px'></img></td></tr>";
     //                }
				     
				 //    $recordsetImgListEml->MoveNext(); 
				 //    $ImageCnt = $ImageCnt + 1;
			  //   }
		   //  }
		   //  $msgBody .= "</table> </td></tr></table>";
		   //  $msgBody .= "</br> ";
		   //  $msgBody .= "</br> ";
	    // }

        //$msgBody .= "<a href='http://localhost:8081/uat/incidentreport_bo.php?id=".$IncidentRpt_ID."'> Click here to complete the incident report!</a>";
        $msgBody .= "<a href='http://jrgm.biz/forms/incidentreport_bo.php?id=".$IR_ID."'> Click here to complete the incident report!</a>";
        $msgBody .= "</br> ";
        $msgBody .= "</br> ";
        $msgBody .= "<div style='padding-top:30px;'><h3>Thanks</h3></div>";                   
        $msgBody .= "</div></div></body></html>";

        //$to = 'mcandler@jrgm.com,jknight@jrgm.com,rramirez@jrgm.com,avelasquez@jrgm.com,jbatterson@jrgm.com,kbautista@jrgm.com,gmeagher@jrgm.com,stoliver@jrgm.com,mreynal@jrgm.com,jtilley@jrgm.com,shazelwood@jrgm.com,rclavender@jrgm.com,candlermaria@gmail.com,sherri.hutchinson@gmail.com,bsutton@jrgm.com,pat@1design.com'; 
        // $to = 'n.andreev.211@gmail.com';
        $subject = 'Incident Report MAIL'; 
        $message = $msgBody; 
        $headers = 'From: alerts@jrgm.com' . "\r\n" . 'Reply-To: alerts@jrgm.com' . "\r\n" . 'X-Mailer: PHP/' . 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
		foreach ($receivers as $to)
		{
			mail($to, $subject, $message, $headers, '-falerts@jrgm.com'); 
		}
         
        //header( 'Location: CrewPerformanceReview.php' );
        $conn = null;

        $saveMessage = "Thank you. <br />
                        Your Incident Report form has been saved.<br />";
        include "Report_saved.php";
    
    }
}


if (!isset($_POST['btnSumit'])) {
    //$sql_Select_Supervisor="select * from app_crews where employee_Position_Id in (1) and active_record = 1 Order by crew_name";
    $sql_Select_Branch="select distinct Employee_Branch Branch from app_crews order by 1";
    $recordset_Branch->open($sql_Select_Branch, $conn, 3);

    if (!$recordset_Branch->EOF){
         $recordset_Branch->movefirst();
    }

    if ($Branch != '') {
        if ($Branch == "Corporate") {
            $sql_Select_Employee = "SELECT ID, [Employee ID] AS employee_id, [Name FirstLast] AS crew_name, 
                    First_name, Last_name, Position, [Ph Home], Phone_Cell, [Ph Cell] AS [Ph Cell], 
                    [Direct Supervisor], [Name LastFirst], Branch, 'Maria Candler' As [SupervisorName]
                    FROM app_employees 
                    WHERE (Branch = 'Corporate') 
                    ORDER BY First_name, Last_name";
        }
        else {
            $sql_Select_Employee="select t1.*, t2.Position from 
            (select distinct employee_ID, crew_name, supervisor_ID, Employee_Branch , t2.[Name FirstLast] SupervisorName, Employee_Position_ID
            from app_crews t1 inner join app_employees t2 on t1.supervisor_id = t2.[Employee ID]
            where Employee_Branch = '$Branch' and t1.active_record = 1 and supervisor_id > 0) t1 
            inner join app_employees t2 on t1.employee_ID = t2.[employee ID]
            Order by crew_name";
        }
        //select t1.*,t2.* from app_crews t1 inner join app_employees t2 on t1.employee_id = t2.[Employee ID] where Employee_Branch = $Branch and t1.active_rec//ord = 1 Order by crew_name";
        //echo $sql_Select_Employee;
        $recordset_Employee->open($sql_Select_Employee, $conn, 3);
        //echo "Total Employee".$recordset_Employee->RecordCount;
        if(!$recordset_Employee->EOF){
             $recordset_Employee->movefirst();
        }
    } else {
        $sql_Select_Employee="select t1.*,t2.* from app_crews t1 inner join app_employees t2 on t1.employee_id = t2.[Employee ID] where crew_leader_id = -1 and t1.active_record = 1 Order by crew_name";

        $recordset_Employee->open($sql_Select_Employee, $conn, 3);

        if(!$recordset_Employee->EOF){
             $recordset_Employee->movefirst();
        }
    }

    if( $Employee_ID!='') {
	    
    }

    include "IncidentReport_form.php";
}

?>
