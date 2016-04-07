<?php
require_once "extends.php";
require_once "db_config.php";

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

$conn     = new COM("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImg = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgList = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgListEml = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordset_Supervisor = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordset_Branch = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordset_Employee = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$connStr = "PROVIDER=SQLOLEDB;SERVER=" . $myServer . ";UID=" . $myUser . ";PWD=" . $myPass . ";DATABASE=" . $myDB;
$conn->open($connStr); //Open the connection to the database
   
$InjuryRpt_ID = getGUID();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $InjuryRpt_ID = $_POST['InjuryRpt_ID'];
}
   
function customError($errno, $errstr)
{
   echo "
   <b>
   Error:
   </b>
   [$errno] $errstr";
}

$a = "tt  ";
$a .= "
<html>
<head>
<title>
</title>
";

{
$InjuryRpt_Date              = '';
$InjuryTime                  = '';
$Location                    = '';
$Employee                    = '';
$ReportedTo                  = '';
$Position                    = '';
$ReportedDate                = '';
$Branch                      = '';
$Supervisor_Id               = '';
$Supervisor                  = '';
$BeganTime                   = '';
$NatureOfInjury              = '';
$HarmObject                  = '';
$ImmActionTaken              = '';
$EmployeeStatement           = '';
$WitnessStatement            = '';
$EmployeePhoneNo             = '';
$EmployeeAddress             = '';
$EmpDOB       	            = '';
$EmployeeSex   	            = '';
$EmpDOH        		        = '';
$SafetyFeature   	        = '';
$PanelofPhysicians           = '';
$MedicalReleaseForm          = '';
$DutiesTOA  		 	        = '';
$DutiesTOAYes  		        = '';
$AccidentPrev   		        = '';
$Explain   			        = '';
$Status   			        = '';
$Note                        = '';
$IIC_VisualCheck             = '';
$IIC_AnyOneInjured           = '';
$IIC_ImmediateTreatment      = '';
$IIC_NatureIncident          = '';
$IIC_LocationIncident        = '';
$IIC_Lead                    = '';
$IIC_Caused                  = '';
$IIC_GuardinPlace            = '';
$IIC_WitnessStatement        = '';
$IIC_PersonalInfo            = '';
$IIC_ReportIncident          = '';
$IIC_InsuranceCompany        = '';
$IIC_IsolateDriver           = '';
$IIC_RecordName              = '';
$IIC_FindWitness             = '';
$IIC_WitnessInfractions      = '';
$IIC_TakePicture             = '';
$IIC_PersonalInfoTakePicture = '';
$IIC_MechanicalDefects       = '';
$IIC_WreckerCompany          = '';
$IIC_PointofImpact           = '';
$IIC_Measurements            = '';
$IIC_Sketch                  = '';
$IIC_PoliceIssueCitation     = '';
$IIC_PoliceOfficerBadge      = '';
$IIC_Protectcargo            = '';
$IIC_ArrangeWrecker          = '';
$IIC_OtherDamage             = '';
$IIC_FinalExamination        = '';
$show                        = '';
}
   
if ($_SERVER['REQUEST_METHOD'] == 'POST') {    
    $InjuryRpt_Date     = $_POST['today_Date'];
    $InjuryTime         = $_POST['time'];
    $Location           = $_POST['Location'];
    $Employee           = $_POST['Employee_Name'];
    $ReportedTo         = $_POST['Reported_To'];
    $Position           = $_POST['Position'];
    $BeganTime          = $_POST['BeganTime'];
    $ReportedDate       = $_POST['Report_date'];
    $Branch             = $_POST['Branch_Id'];
    //$Supervisor_Id      = $_POST['Supervisor_Id'];
    $Supervisor         = $_POST['Supervisor_Name'];
    $NatureOfInjury     = $_POST['nid'];
    $ImmActionTaken     = $_POST['Action_taken'];
    $EmployeeStatement  = $_POST['Employee_statement'];
    $WitnessStatement   = $_POST['Witness_statement'];
    $HarmObject         = $_POST['HarmObject'];
    $EmployeePhoneNo    = $_POST['EmployeePhoneNo'];
    $EmployeeAddress    = $_POST['EmployeeAddress'];
    $EmpDOB             = $_POST['EmpDOB'];
    $EmployeeSex        = $_POST['sex'];
    $EmpDOH             = $_POST['EmpDOH'];
    $Note               = $_POST['Note'];
   
    if(isset($_POST['SafetyFeature'])){ $SafetyFeature   = $_POST['SafetyFeature']; }
    if(isset($_POST['PanelofPhysicians'])){ $PanelofPhysicians   = $_POST['PanelofPhysicians']; }
    if(isset($_POST['MedicalReleaseForm'])){ $MedicalReleaseForm   = $_POST['MedicalReleaseForm']; }
    if(isset($_POST['DutiesTOA'])){ $DutiesTOA   = $_POST['DutiesTOA']; }
    if(isset($_POST['AccidentPrev'])){ $AccidentPrev   = $_POST['AccidentPrev']; }
    if(isset($_POST['Status'])){ $Status   = $_POST['Status']; }
    
    $DutiesTOAYes   = $_POST['DutiesTOAYes'];    
    $Explain   = $_POST['Explain'];
    
    $IIC_VisualCheck = isset($_POST['mvb']) ? $_POST['mvb'] : "uncheck";
    $IIC_AnyOneInjured = isset($_POST['injured']) ? $_POST['injured'] : "uncheck";
    $IIC_ImmediateTreatment = isset($_POST['immediatetreatment']) ? $_POST['immediatetreatment'] : "uncheck";
    $IIC_NatureIncident = isset($_POST['nature']) ? $_POST['nature'] : "uncheck ";
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
    $IIC_WreckerCompany = isset($_POST['checkif']) ? $_POST['checkif'] : "uncheck ";
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
   
    if (isset($_POST['btnSumit'])) {
        $Location           = escape_characters($Location);
        $Employee           = escape_characters($Employee);
        $ReportedTo         = escape_characters($ReportedTo);
        $Position           = escape_characters($Position);
        $Supervisor         = escape_characters($Supervisor);
        $NatureOfInjury     = escape_characters($NatureOfInjury);
        $ImmActionTaken     = escape_characters($ImmActionTaken);
        $EmployeeStatement  = escape_characters($EmployeeStatement);
        $WitnessStatement   = escape_characters($WitnessStatement);
        $HarmObject         = escape_characters($HarmObject);
        $EmployeePhoneNo    = escape_characters($EmployeePhoneNo);
        $EmployeeAddress    = escape_characters($EmployeeAddress);
        $DutiesTOAYes       = escape_characters($DutiesTOAYes);    
        $Explain            = escape_characters($Explain);
        $Note               = escape_characters($Note);

        $InjuryRpt_ID = str_replace(array("{", "}"), "", $InjuryRpt_ID);
        $Employee = trim($Employee);
        $Supervisor = trim($Supervisor);

        $sql_InserMember = "INSERT INTO Form_InjuryReport([InjuryRpt_ID],[InjuryRpt_Date],[InjuryTime],[Location],[Employee],[ReportedTo],[Position],[ReportedDate],[Supervisor]
                ,[BeganTime],[NatureOfinjury],[HarmObject],[ImmActionTaken],[EmployeeStatement],[WitnessStatement],[EmployeeAddress],[EmpDOB],[EmployeePhoneNo],[EmployeeSex]
               ,[EmpDOH],[SafetyFeature],[PanelofPhysicians],[MedicalReleaseForm],[DutiesTOA],[DutiesTOAYes],[AccidentPrev],[Explain],[Status],[IIC_VisualCheck],[IIC_AnyOneInjured]
               ,[IIC_Natureinjury],[IIC_Locationinjury],[IIC_Lead],[IIC_Caused],[IIC_GuardinPlace],[IIC_WitnessStatement],[IIC_PersonalInfo],[IIC_Reportinjury],[IIC_InsuranceCompany]
               ,[IIC_IsolateDriver],[IIC_RecordName],[IIC_FindWitness],[IIC_WitnessInfractions],[IIC_TakePicture],[IIC_PersonalInfoTakePicture],[IIC_MechanicalDefects]
               ,[IIC_WreckerCompany],[IIC_PointofImpact],[IIC_Measurements],[IIC_Sketch],[IIC_PoliceIssueCitation],[IIC_PoliceOfficerBadge],[IIC_Protectcargo],[IIC_ArrangeWrecker]
               ,[IIC_OtherDamage],[IIC_FinalExamination],[IIC_ImmediateTreatment],[Branch],[Note]) 
               
                values('$InjuryRpt_ID','$InjuryRpt_Date','$InjuryTime','$Location','$Employee','$ReportedTo','$Position','$ReportedDate','$Supervisor','$BeganTime','$NatureOfInjury',
                 '$HarmObject','$ImmActionTaken','$EmployeeStatement','$WitnessStatement','$EmployeeAddress','$EmpDOB','$EmployeePhoneNo','$EmployeeSex','$EmpDOH','$SafetyFeature',
              '$PanelofPhysicians','$MedicalReleaseForm','$DutiesTOA','$DutiesTOAYes','$AccidentPrev','$Explain','$Status','$IIC_VisualCheck','$IIC_AnyOneInjured'
               ,'$IIC_NatureIncident','$IIC_LocationIncident','$IIC_Lead','$IIC_Caused','$IIC_GuardinPlace','$IIC_WitnessStatement','$IIC_PersonalInfo','$IIC_ReportIncident',
               '$IIC_InsuranceCompany','$IIC_IsolateDriver','$IIC_RecordName','$IIC_FindWitness','$IIC_WitnessInfractions','$IIC_TakePicture',
               '$IIC_PersonalInfoTakePicture','$IIC_MechanicalDefects','$IIC_WreckerCompany','$IIC_PointofImpact','$IIC_Measurements','$IIC_Sketch','$IIC_PoliceIssueCitation',
               '$IIC_PoliceOfficerBadge','$IIC_Protectcargo','$IIC_ArrangeWrecker'
               ,'$IIC_OtherDamage','$IIC_FinalExamination','$IIC_ImmediateTreatment','$Branch','$Note')";
        //echo "$sql_InserMember";
        try {
            $conn->execute($sql_InserMember);
        }
        catch(Exception $e){
            include "Error_saving_report.php";
            exit;
        }
        
        $sql_Select = "";
        $sql_Select = "select top 1 IR_ID from Form_InjuryReport where InjuryRpt_ID='$InjuryRpt_ID'";

        $recordset->open($sql_Select, $conn, 3);

        if(!$recordset->EOF) {
            $recordset->movefirst();
            $IR_ID = $recordset->fields["IR_ID"]->value;
        }

        // file uploading
        if ($_FILES['file']['name'][0] != "") {
            $sql_Select = "Select count(Injury_ImgID) as ImageCount from Form_InjuryReportImageDetails where Injury_Date='$InjuryRpt_Date' and InjuryRpt_ID='$InjuryRpt_ID'";
            //echo $sql_Select."<br/>";
            $recordsetImg->open($sql_Select, $conn, 3);
            if (!$recordsetImg->EOF) {
                $recordsetImg->movefirst();
                $ImageCount = $recordsetImg->fields["ImageCount"]->value + 1;
            }
            /*
            $datetime = new DateTime($incidentRpt_Date);
            $datetime->createFromFormat('m/d/Y', $incidentRpt_Date);
            $varstring       = $datetime->format('mdy');
            $sql_Insertimage = explode(".", $_FILES["file"]["name"]);
            $ImageName       = $varstring . '_' . $VehicleNumber . '_' . $ImageCount . '.' . $sql_Insertimage[1];
            */
            //echo "enter"."<br/>";
            
            for($i = 0; $i < count($_FILES["file"]["name"]); $i++) {
                $temp = explode(".", $_FILES["file"]["name"][$i]);
                $ImageName = "Injury_" . $IR_ID . '_' . $ImageCount . '.' . end($temp);
                $sql_Insertimage = " ";
                
                //$allowedExts = array("gif", "jpeg", "jpg", "png", "pdf", "doc", "docx");
//                $allowedFileTypes = array("image/gif", 
//                                      "image/jpeg", 
//                                      "image/jpg", 
//                                      "image/pjpeg", 
//                                      "image/x-PNG", 
//                                      "image/x-JPEG", 
//                                      "image/x-JPG", 
//                                      "application/pdf", 
//                                      "application/PDF",
//                                      "image/png");
                
                $extension = mb_strtolower(end($temp));

//                if (in_array($_FILES["file"]["type"][$i], $allowedFileTypes) && in_array($extension, $allowedExts)) {       
                    if ($_FILES["file"]["error"][$i] > 0) {
                        echo "Return Code: " . $_FILES["file"]["error"][$i] . "<br/>";
                    } else {
                        $sql_Insertimage = "INSERT INTO Form_InjuryReportImageDetails( [Injury_Date],[ImageName],[CreatedDate],[InjuryRpt_ID])
                                            values('$InjuryRpt_Date','$ImageName','$currentDate','$InjuryRpt_ID')";
                        $conn->execute($sql_Insertimage);
                        move_uploaded_file($_FILES["file"]["tmp_name"][$i], "photos/" . $ImageName);
                    }
//                } else {
//                    $show = "Invalid file";
//                    echo "Invalid file";
//                }

                $ImageCount++;
                
                $rowcount  = 1;
                $ImageList = '';
            }
       } else {
            $show = "please choose file.";
       }
        
        //echo "Form_InjuryReport";
    }
   
    
   $checkPart     = "";
   $checkboxtable = "";
   
   if ($IIC_VisualCheck == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Make a visual check to make sure the scene is protected against further incident.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_AnyOneInjured == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Who was injured? Who, what kind of injury and how bad? Where are they now?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_ImmediateTreatment == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_NatureIncident == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "What was the nature of the incident?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_LocationIncident == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Time and exact location of the incident.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_Lead == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "What/ who lead to the injury?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_GuardinPlace == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_WitnessStatement == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "If there are any witnesses, get statements from them saying what they saw and contact information.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_ReportIncident == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Report incident to direct supervisor and discuss next steps / instructions";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($checkPart != "") {
       $checkboxtable = "
       <table style='width: 1000px;' border='0'>
       ";
       $checkboxtable .= "
       <tr style='padding-top: 20px'>
       ";
       $checkboxtable .= "
       <td colspan='4'>
       ";
       $checkboxtable .= "
       <strong >
       ";
       $checkboxtable .= "INCIDENT INVESTIGATION CHECKLIS";
       $checkboxtable .= "
       </strong >
       ";
       $checkboxtable .= "
       </td>
       ";
       $checkboxtable .= "
       </tr>
       ";
       $checkboxtable .= "$checkPart";
       $checkboxtable .= "
       </table>
       ";
   }
   
   $checkPart          = "";
   $checkcontinuetable = "";
   if ($IIC_InsuranceCompany == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Have the police and insurance company been called?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_IsolateDriver == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_RecordName == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_FindWitness == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Find any witnesses. Get names, addresses, license number. Include those who arrived early to the scene.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_WitnessInfractions == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Did witnesses notice obvious infractions?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_TakePicture == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Take pictures and get any evidence before the vehicles are moved.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_PersonalInfoTakePicture == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Get personal information of anyone taking pictures.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_MechanicalDefects == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_WreckerCompany == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "If vehicles have been removed find out by what wrecker company.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_PointofImpact == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Is the point of impact clearly noted on the roadway?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_Measurements == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Make measurements of all physical facts, including length and location of skid marks.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_Sketch == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Draw a sketch of the scene and vehicle locations.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_PoliceIssueCitation == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Have police issued citations or made arrests? Who and what are the charges?";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_PoliceOfficerBadge == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Get the name and badge number of the police officer.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_Protectcargo == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Protect cargo.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_ArrangeWrecker == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Arrange for a wrecker.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_OtherDamage == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Note any other property damage.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($IIC_FinalExamination == "check") {
       $checkPart .= "
       <tr>
       ";
       $checkPart .= "
       <td style='width: 600px;'>
       ";
       $checkPart .= "Do a final examination of the scene.";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 10px;'>
       :
       </td>
       ";
       $checkPart .= "
       <td style='width: 170px; text-align: left;'>
       ";
       $checkPart .= "check";
       $checkPart .= "
       </td>
       ";
       $checkPart .= "
       <td style='width: 180px;'>
       &nbsp;
       </td>
       ";
       $checkPart .= "
       </tr>
       ";
   }
   
   if ($checkPart != "") {
       $checkcontinuetable = "
       <table style='width: 1000px;' border='0'>
       ";
       $checkcontinuetable .= "
       <tr style='padding-top: 20px'>
       ";
       $checkcontinuetable .= "
       <td colspan='4'>
       ";
       $checkcontinuetable .= "
       <strong >
       ";
       $checkcontinuetable .= "If incident involves vehicles continue here";
       $checkcontinuetable .= "
       </strong >
       ";
       $checkcontinuetable .= "
       </td>
       ";
       $checkcontinuetable .= "
       </tr>
       ";
       $checkcontinuetable .= "$checkPart";
       $checkcontinuetable .= "
       </table>
       ";
   }
   
   //echo "$emailvalue";
   $msgBody = " ";
   $msgBody .= "
   <html>
   <head>
   <title>
   </title>
   </head>
   ";
   $msgBody .= "
   <body style='margin-top:70px;'>
   ";
   $msgBody .= "
   <div id='centrecontent'>
   <div class='centrecontent_inner'>
   ";
   $msgBody .= "
   <div  style='padding-bottom:20px;'>
   <h3>
   Hello,
   </h3>
   </div>
   ";
   $msgBody .= "
   <div class='header' style='font-size: 24px;'>
   <strong>
   Injury Report
   </strong>
   </div>
   ";
   $msgBody .= "
   <table width='800px;'  style='margin-top:30px;'>
   ";
   $msgBody .= "
   <tr>
   <td valign='top'>
   ";
   $msgBody .= "
   <table width='400px;' >
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 130px;'>
   Date
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 100px;'>
   $InjuryRpt_Date
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Location
   </td>
   <td align='left' >
   $Location
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Branch
   </td>
   <td align='left' >
   $Branch
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Employee
   </td>
   <td align='left' >
   $Employee
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Position
   </td>
   <td align='left' >
   $Position
   </td>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";

   $msgBody .= "
   </table>
   ";
   $msgBody .= "
   </td>
   <td valign='top'>
   <table width='400px;'>
   ";
   $msgBody .= "
   <tr>
   <td >
   Time
   </td>
   <td align='left'>
   $InjuryTime
   </td>
   </tr>
   ";
   $msgBody .= "
   </tr>
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Supervisor
   </td>
   <td align='left' >
   $Supervisor
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Reported To
   </td>
   <td align='left' >
   $ReportedTo
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Reported Date
   </td>
   <td align='left' >
   $ReportedDate
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td>
   &nbsp;
   </td>
   <td>
   &nbsp;
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td >
   Time Employee Began Work
   </td>
   <td align='left' >
   $BeganTime
   </td>
   </tr>
   ";
   $msgBody .= "
   </table>
   </td>
   </tr>
   </table>
   ";
   $msgBody .= "
   <table width='800px;'>
   <tr>
   <td valign='top'>
   <table width='400px;' >
   ";
   $msgBody .= "
   <tr>
   <td style=' padding-top:20px;'>
   <p>
   <strong>
   Nature of Injury or Illness. Please be Specific:
   </strong>
   </p>
   $NatureOfInjury
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td style=' padding-top:20px;'>
   <p>
   <strong>
   What Object Directly Caused Harm to Employee:
   </strong>
   </p>
   $HarmObject
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td style=' padding-top:20px;'>
   <p>
   <strong>
   Immediate Action Taken:
   </strong>
   </p>
   $ImmActionTaken
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td style=' padding-top:20px;'>
   <p>
   <strong>
   Employee Statement:
   </strong>
   </p>
   $EmployeeStatement
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td style=' padding-top:20px;'>
   <p>
   <strong>
   Witness Statement:
   </strong>
   </p>
   $WitnessStatement
   </td>
   </tr>
   ";
   $msgBody .= "
   </table>
   ";
   $msgBody .= "
   </td>
   ";
   $msgBody .= "
   </tr>
   ";
   $msgBody .= "
   </table>
   ";
   $msgBody .= "
   <table width='99%' border='0' cellpadding='0' cellspacing='0'>
   ";
   $msgBody .= "
   <tr>
   ";
   $msgBody .= "
   <td valign='top'>
   <table width='800px;' border='0' cellpadding='0' cellspacing='0'>
   ";
   $msgBody .= "
   <tr>
   ";
   $msgBody .= "
   <td>
   ";
   $msgBody .= "
   <table width='800px;'>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Employee Address
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $EmployeeAddress
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Date of Birth
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $EmpDOB
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Phone Number
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $EmployeePhoneNo
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td align='left'  style='width: 180px;'>" +
   $EmployeeSex=="M" ? "Male" : "Female" + "
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Date of Hire
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $EmpDOH
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Were safety features bypassed?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $SafetyFeature
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Was employee given information on Panel of Physicians?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $PanelofPhysicians
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Was employee given a medical release form?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $MedicalReleaseForm
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Was employee doing something other than required duties at time of accident?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $DutiesTOA
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   If so, what and why?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $DutiesTOAYes
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Could this accident have been prevented?
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $AccidentPrev
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Please explain
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $Explain
   </td>
   </tr>
   ";
   $msgBody .= "
   <tr>
   <td  style='width: 200px;'>
   Status
   </td>
   ";
   $msgBody .= "
   <td align='left'  style='width: 180px;'>
   $Status
   </td>
   </tr>
   ";
   $msgBody .= "
   </table>
   </td>
   </tr>
   </table>
   ";
   $msgBody .= "
   </br>
   ";
   $msgBody .= "
   </br>
   ";
   $msgBody .= "$checkboxtable";
   $msgBody .= "
   </br>
   ";
   $msgBody .= "
   </br>
   ";
   $msgBody .= "$checkcontinuetable";
   $msgBody .= "
   </br>
   ";
   $msgBody .= "
   </br>
   ";
   
   if (isset($_POST['btnSumit'])) {
       $sql_Select = "Select * from Form_InjuryReportImageDetails where Injury_Date='$InjuryRpt_Date' and InjuryRpt_ID='$InjuryRpt_ID'";
  	    
	    $recordsetImgListEml->open($sql_Select, $conn, 3);	 

	    $ImageCnt = 1;
	    //$recordsetImgList->fields["ImageName"]->value
	    if(!$recordsetImgListEml->EOF){
		    $msgBody .= "<table  width='500px;'><tr><td nowrap='nowrap' class='vehicle_inventory' ><strong>Upload Files:</strong></td><td> ";
		    $msgBody .= "<table border='1'  style='margin-left:0px'><tr> ";
		    $msgBody .= "<th>S No</th>";
		    $msgBody .= "<th>File Name</th>";
		    $msgBody .= "<th>File </th></tr> ";
		    if(!$recordsetImgListEml->EOF){
			    $recordsetImgListEml->movefirst();
			    while (!$recordsetImgListEml->EOF){ //will automatically return false when out of records
                    $tempFile = explode(".", $recordsetImgListEml->fields["ImageName"]->value);
                    $fileextension = mb_strtolower(end($tempFile));
				    $msgBody .= "<tr><td align='center'>$ImageCnt</td> ";
				    $msgBody .= "<td><a target='_blank' href='/forms/photos/".$recordsetImgListEml->fields['ImageName']->value."'>".$recordsetImgListEml->fields['ImageName']->value."</a></td>";

		            if ($fileextension == "pdf") {
                        $msgBody .= "<td><Img src='/forms/images/pdf.jpg' width='55px' height='30px'></img></td></tr>";
                    } else if (in_array($fileextension, array('png','jpeg','jpg','gif','pjpeg'))) {
                        $msgBody .= "<td><Img src='/forms/photos/". $recordsetImgListEml->fields['ImageName']->value."' width='55px' height='30px'></img></td></tr>";
                    }
                    else {
                        $msgBody .= "<td><Img src='/forms/images/file.jpg' width='55px' height='30px'></img></td></tr>";
                    }
				    $recordsetImgListEml->MoveNext(); 
				    $ImageCnt = $ImageCnt +1;
			    }
		    }
		    $msgBody .= "</table> </td></tr></table>";
		    $msgBody .= "</br> ";
		    $msgBody .= "</br> ";
	    }
        $msgBody .= "
           <a href='/forms/injury_bo.php?id=".$IR_ID."'>
           Click here to complete the Injury report!
           </a>
           ";
        $msgBody .= "</br></br>";
        $msgBody .= "
           <div style='padding-top:30px;'>
           <h3>
           Thanks
           </h3>
           </div>
           ";
        $msgBody .= "
           </div>
           </div>
           </body>
           </html>
           ";
      

       $to = 'patrick.hutchinson2@gmail.com,sherri.hutchinson@gmail.com,pat@1design.com'; 
       $subject = 'Injury Report MAIL';
       $message = $msgBody;
       $headers = "From: alerts@jrgm.com\r\n";
       $headers .= "Reply-To: alerts@jrgm.com\r\n";
       $headers .= "-Mailer: PHP/MIME-Version: 1.0\r\n";
       $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
       $headers .= "X-Priority: 1\r\n";
       mail($to, $subject, $message, $headers, '-falerts@jrgm.com');
       $conn = null;
       
       $saveMessage = "Thank you. <br />
                    Your Injury Report form has been saved.<br />";
       include "Report_saved.php";
      }
}

  if (!isset($_POST['btnSumit'])) {
	  $sql_Select_Supervisor = "select distinct Employee_Branch Branch from app_crews order by 1";
	  $recordset_Branch->open($sql_Select_Supervisor, $conn, 3);
	  if (!$recordset_Branch->EOF) {
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
              //$sql_Select_Employee = "select t1.*,t2.* from app_crews t1 inner join app_employees t2 
//                                    on t1.employee_id = t2.[Employee ID] 
//                                    where crew_leader_id = $Supervisor_Id and t1.active_record = 1 
//                                    Order by crew_name";
                  
              $sql_Select_Employee="select t1.*, t2.Position, t2.[Ph cell] from 
                (select distinct employee_ID, crew_name, supervisor_ID, Employee_Branch , t2.[Name FirstLast] SupervisorName, Employee_Position_ID
                from app_crews t1 inner join app_employees t2 on t1.supervisor_id = t2.[Employee ID]
                where Employee_Branch = '$Branch' and t1.active_record = 1 and supervisor_id > 0) t1 
                inner join app_employees t2 on t1.employee_ID = t2.[employee ID]
                Order by crew_name";
          }

		  $recordset_Employee->open($sql_Select_Employee, $conn, 3);
//		  echo "Total Employee".$recordset_Employee->RecordCount; exit;
		  if(!$recordset_Employee->EOF){
			$recordset_Employee->movefirst();
		  }
      } else {
		  $sql_Select_Employee = "select t1.*,t2.* from app_crews t1 inner join app_employees t2 
                                  on t1.employee_id = t2.[Employee ID] 
                                  where crew_leader_id = -1 and t1.active_record = 1 Order by crew_name";
		  $recordset_Employee->open($sql_Select_Employee, $conn, 3);
		  if (!$recordset_Employee->EOF) {
			$recordset_Employee->movefirst();
		  }
      }
      
      include "injuryReport_form.php";
  }
?>
