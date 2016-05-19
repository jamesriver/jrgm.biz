<?php
require_once('../sharedclass.php');

//require_once "extends.php";
//require_once "db_config.php";

$ImageName ="";
$hdVehicleNo = "";
$hdRptDate = "";
$ImageCount = 0;
$DisplayReport = "";
$currentDate = date("Y-m-d");

$DisplayReport = "true";	//Display records on initial load as well as at the time of image loading
$show = "";

function customError($errno, $errstr)
{
    echo "
    <b>
    Error:
    </b>
    [$errno] $errstr";
}

//echo "nice";

$a = "tt  ";
$a .= "
<html>
<head>
<title>
</title>
"; 

/*$conn = new COM("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgList = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImg = new COM("ADODB.RecordSet") or die("Cannot start ADO");*/

$BO_Status = "";
$BO_DrugTest = "";
$BO_MedicalReq  = "";
$BO_AccInv  = "";
$BO_Hospitalized  = "";
$BO_WorkerComp  = "";
$BO_WorkerCompNo  = "";
$BO_Restrictions  = "";
$BO_ListRestrictions  = "";
$BO_LightDuty  = "";
$BO_Facility  = "";
$BO_Physician  = "";
$NatureOfInjury  = "";
$hdRptDate  = "";
$HarmObject  = "";
$ImmActionTaken  = "";
$EmployeeStatement  = "";
$WitnessStatement  = "";
$EmployeeAddress  = "";
$EmpDOB  = "";
$EmployeePhoneNo  = "";
$EmpDOH  = "";
$DutiesTOAYes  = "";
$Explain  = "";
$SafetyFeature  = "";
$PanelofPhysicians  = "";
$MedicalReleaseForm  = "";
$DutiesTOA  = "";
$AccidentPrev  = "";
$EmployeeSex  = "";
$Note = "";

/*$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB;
$conn->open($connStr); //Open the connection to the database*/

//DISABLED FOR NOW - READ ONLY
if (0 && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $IR_ID = $_GET['id']; 
    
    $sql_Select = "";
    $sql_Select = "Select * from Form_InjuryReport where IR_ID='{$IR_ID}'";

    $recordset->open($sql_Select, $conn, 3);

    $errMessage = "";

    $Inspection_Id = 0;
    
    if(!$recordset->EOF) {
        $recordset->movefirst();
        $IR_ID = $recordset["IR_ID"];
        $InjuryID = $recordset["InjuryRpt_ID"];
        $InjuryRpt_Date = $recordset["InjuryRpt_Date"]; 
        $InjuryTime = $recordset["InjuryTime"];
        $Location = $recordset["Location"];
        $Branch = $recordset["Branch"];
        $Employee = $recordset["Employee"];
        $ReportedTo = $recordset["ReportedTo"];
        $Position = $recordset["Position"];
        $ReportedDate = $recordset["ReportedDate"];
        $BeganTime = $recordset["BeganTime"];
        $Supervisor = $recordset["Supervisor"];
        $NatureOfInjury = $recordset["NatureOfInjury"];
        $HarmObject = $recordset["HarmObject"];
        $ImmActionTaken = $recordset["ImmActionTaken"];
        $EmployeeStatement = $recordset["EmployeeStatement"];
        $WitnessStatement = $recordset["WitnessStatement"];
        $EmployeePhoneNo = $recordset["EmployeePhoneNo"];
        $EmployeeAddress = $recordset["EmployeeAddress"];
        $EmpDOB = $recordset["EmpDOB"];
        $EmployeeSex = $recordset["EmployeeSex"];
        $EmpDOH = $recordset["EmpDOH"];
        $SafetyFeature = $recordset["SafetyFeature"];
        $PanelofPhysicians = $recordset["PanelofPhysicians"];
        $MedicalReleaseForm = $recordset["MedicalReleaseForm"];
        $DutiesTOA = $recordset["DutiesTOA"];
        $DutiesTOAYes = $recordset["DutiesTOAYes"];
        $AccidentPrev = $recordset["AccidentPrev"];
        $Explain = $recordset["Explain"];
        $Note = $recordset["Note"];
        $BO_Status = $recordset["BO_Status"];    
        $BO_MedicalReq = $recordset["BO_MedicalReq"];
        $BO_DrugTest = $recordset["BO_DrugTest"];
        $BO_AccInv = $recordset["BO_AccInv"];
        $BO_Hospitalized = $recordset["BO_Hospitalized"];
        $BO_WorkerComp = $recordset["BO_WorkerComp"];
        $BO_WorkerCompNo = $recordset["BO_WorkerCompNo"];
        $BO_Restrictions = $recordset["BO_Restrictions"];
        $BO_ListRestrictions = $recordset["BO_ListRestrictions"];
        $BO_LightDuty = $recordset["BO_LightDuty"];
        $BO_Facility = $recordset["BO_Facility"];
        $BO_Physician = $recordset["BO_Physician"];
        $InjuryRpt_File = $recordset["InjuryRpt_File"];
    }
    
    if(isset($_POST['BO_DrugTest'])) { $BO_DrugTest = $_POST['BO_DrugTest']; }
    if(isset($_POST['BO_MedicalReq'])) { $BO_MedicalReq = $_POST['BO_MedicalReq']; }
    if(isset($_POST['BO_AccInv'])) { $BO_AccInv = $_POST['BO_AccInv']; }
    if(isset($_POST['BO_WorkerComp'])) { $BO_WorkerComp = $_POST['BO_WorkerComp']; }
    if(isset($_POST['BO_Restrictions'])) { $BO_Restrictions = $_POST['BO_Restrictions']; }
    if(isset($_POST['BO_LightDuty'])) { $BO_LightDuty = $_POST['BO_LightDuty']; }
    if(isset($_POST['SafetyFeature'])) { $SafetyFeature = trim($_POST['SafetyFeature']); }
    if(isset($_POST['PanelofPhysicians'])) { $PanelofPhysicians = trim($_POST['PanelofPhysicians']); }
    if(isset($_POST['MedicalReleaseForm'])) { $MedicalReleaseForm = trim($_POST['MedicalReleaseForm']); }
    if(isset($_POST['DutiesTOA'])) { $DutiesTOA = trim($_POST['DutiesTOA']); }
    if(isset($_POST['AccidentPrev'])) { $AccidentPrev = trim($_POST['AccidentPrev']); }
    if(isset($_POST['EmployeeSex'])) { $EmployeeSex = trim($_POST['EmployeeSex']); }
    if(isset($_POST['BO_Hospitalized'])) { $BO_Hospitalized   = $_POST['BO_Hospitalized']; }
	    
    $BO_Status = $_POST['status'];
    $BO_WorkerCompNo = escape_characters($_POST['BO_WorkerCompNo']);
    $BO_ListRestrictions = escape_characters($_POST['BO_ListRestrictions']);
    $BO_Facility = escape_characters($_POST['BO_Facility']);
    $BO_Physician = escape_characters($_POST['BO_Physician']);
    $NatureOfInjury = escape_characters($_POST['NatureOfInjury']);
    $hdRptDate = trim($_POST['hdInjuryRpt_Date']);
    $HarmObject = trim(escape_characters($_POST['HarmObject']));
    $ImmActionTaken = trim(escape_characters($_POST['Action_taken']));
    $EmployeeStatement = trim(escape_characters($_POST['Employee_statement']));
    $WitnessStatement = trim(escape_characters($_POST['Witness_statement']));
    $EmployeeAddress = trim(escape_characters($_POST['EmployeeAddress']));
    $EmpDOB = trim($_POST['EmpDOB']);
    $EmployeePhoneNo = trim($_POST['EmployeePhoneNo']);
    $EmpDOH = trim($_POST['EmpDOH']);
    $DutiesTOAYes = trim(escape_characters($_POST['DutiesTOAYes']));
    $Explain = trim(escape_characters($_POST['Explain']));
    $Note = trim(escape_characters($_POST['Note']));


    if(isset($_POST['btnSumit'])) {
        $sql = "UPDATE Form_InjuryReport 
        SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_MedicalReq='$BO_MedicalReq', BO_AccInv='$BO_AccInv', 
        BO_Hospitalized='$BO_Hospitalized', BO_WorkerComp='$BO_WorkerComp', BO_WorkerCompNo='$BO_WorkerCompNo', BO_Restrictions='$BO_Restrictions', 
        BO_ListRestrictions='$BO_ListRestrictions', BO_LightDuty='$BO_LightDuty', BO_Facility='$BO_Facility', BO_Physician='$BO_Physician',
        BO_Update='Complete',NatureOfInjury='$NatureOfInjury' , HarmObject='$HarmObject' , ImmActionTaken='$ImmActionTaken' , 
        EmployeeStatement='$EmployeeStatement' , WitnessStatement='$WitnessStatement' , EmployeeAddress='$EmployeeAddress' , EmpDOB='$EmpDOB' , 
        EmployeePhoneNo='$EmployeePhoneNo' , EmpDOH='$EmpDOH' ,  DutiesTOAYes='$DutiesTOAYes', Explain='$Explain',SafetyFeature='$SafetyFeature',
        PanelofPhysicians='$PanelofPhysicians',MedicalReleaseForm='$MedicalReleaseForm',DutiesTOA ='$DutiesTOA',AccidentPrev='$AccidentPrev',
        EmployeeSex='$EmployeeSex', Note='$Note'
         WHERE IR_ID = '$IR_ID' ";
    }
    elseif(isset($_POST['btnSumitPDF'])) {
        // generate pdf and save
        include "injury_bo_report_pdf.php";
        
        $sql = "UPDATE Form_InjuryReport 
        SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_MedicalReq='$BO_MedicalReq', BO_AccInv='$BO_AccInv', 
        BO_Hospitalized='$BO_Hospitalized', BO_WorkerComp='$BO_WorkerComp', BO_WorkerCompNo='$BO_WorkerCompNo', 
        BO_Restrictions='$BO_Restrictions', BO_ListRestrictions='$BO_ListRestrictions', BO_LightDuty='$BO_LightDuty', 
        BO_Facility='$BO_Facility', BO_Physician='$BO_Physician',BO_Update='Complete',NatureOfInjury='$NatureOfInjury', 
        HarmObject='$HarmObject' , ImmActionTaken='$ImmActionTaken' , EmployeeStatement='$EmployeeStatement' , 
        WitnessStatement='$WitnessStatement', EmployeeAddress='$EmployeeAddress', EmpDOB='$EmpDOB', EmployeePhoneNo='$EmployeePhoneNo', 
        EmpDOH='$EmpDOH', DutiesTOAYes='$DutiesTOAYes', Explain='$Explain',SafetyFeature='$SafetyFeature',
        PanelofPhysicians='$PanelofPhysicians',MedicalReleaseForm='$MedicalReleaseForm',DutiesTOA ='$DutiesTOA',
        AccidentPrev='$AccidentPrev',EmployeeSex='$EmployeeSex', Note='$Note', InjuryRpt_File='$IR_ID.pdf'
         WHERE IR_ID = '$IR_ID' ";
    }
    
    try {
        $conn->execute($sql);
    }
    catch(Exception $e) {
        include "Error_saving_report.php";
        return false;
    }
    
    
    // uploading image
    $show = "";
    $sql_Select = "";

    if ($_FILES['file']['name'][0] != "") {
        $sql_Select = "Select count(Injury_ImgID) as ImageCount from Form_InjuryReportImageDetails where Injury_Date='$hdRptDate' and InjuryRpt_ID='$InjuryID'";
        $recordsetImg->open($sql_Select, $conn, 3);
        if (!$recordsetImg->EOF) {
            $recordsetImg->movefirst();
            $ImageCount = $recordsetImg["ImageCount"] + 1;
        }
        /*
        $datetime = new DateTime($incidentRpt_Date);
        $datetime->createFromFormat('m/d/Y', $incidentRpt_Date);
        $varstring = $datetime->format('mdy');
        $sql_Insertimage = explode(".", $_FILES["file"]["name"]);
        $ImageName = $varstring . '_' . $VehicleNumber . '_' . $ImageCount . '.' . $sql_Insertimage[1];
        */
   
        $varstring = str_replace('/', '', $hdRptDate);
        
        for($i = 0; $i < count($_FILES["file"]["name"]); $i++) {
            $sql_Insertimage = explode(".", $_FILES["file"]["name"][$i]);
//            $ImageName = $varstring . '_' . $ImageCount . '.' . end($sql_Insertimage);
            $ImageName = "Injury_".$IR_ID . '_' . $ImageCount . '.' . end($sql_Insertimage);
            $sql_Insertimage = " ";

//            $allowedExts = array("gif", "jpeg", "jpg", "png", "pdf", "doc", "docx");
//            $allowedFileTypes = array("image/gif", 
//                                  "image/jpeg", 
//                                  "image/jpg", 
//                                  "image/pjpeg", 
//                                  "image/x-PNG", 
//                                  "image/x-JPEG", 
//                                  "image/x-JPG", 
//                                  "application/pdf", 
//                                  "application/PDF",
//								  "application/x-pdf",
//                                  "image/png");
            $temp = explode(".", $_FILES["file"]["name"][$i]);
            $extension = mb_strtolower(end($temp));
            
//            if (in_array($_FILES["file"]["type"][$i], $allowedFileTypes) && in_array($extension, $allowedExts)) {
                if ($_FILES["file"]["error"][$i] > 0) {
                    echo "Return Code: " . $_FILES["file"]["error"][$i] . "<br/>";
                } else {
                    move_uploaded_file($_FILES["file"]["tmp_name"][$i], "photos/" . $ImageName);
                    $sql_Insertimage = "INSERT INTO Form_InjuryReportImageDetails([Injury_Date],[ImageName],[CreatedDate],[InjuryRpt_ID])
                                    values('$hdRptDate','$ImageName','$currentDate','$InjuryID')";
                    $conn->execute($sql_Insertimage);
                }
//            } else {
//                echo "Invalid file";
//            }
            
            $ImageCount++;
            
            $rowcount = 1;
            $ImageList = '';
        }
        
    } else {
        $show = "please choose file.";
//        echo $show;
    }

    
    $DisplayReport = "false";//Displaying saved message

    $saveMessage = "Thank you. <br />
                    Your Injury Report form has been saved.<br />";
    include "Report_saved.php";

}

//else
if ($DisplayReport == "true") {
    $IR_ID = $_GET['id'];

    try {
        $edata = sharedclass::callAPIReceiver('biz_getinjuryreport', array('id'=>$IR_ID));
        $spl = explode('`', $edata);
        foreach($spl as $sp)
        {
            $s = explode('|', $sp);
            if (count($s) == 3)
            {
                $emps[$s[0]] = $s[1];
                if ($s[2])
                    $production_managers[$s[0]] = $s[1];
            }
        }

        $errMessage = "";

        $Inspection_Id = 0;
        
        if($recordset) {
            $IR_ID = $recordset["IR_ID"];
            $InjuryID = $recordset["InjuryRpt_ID"];
            $InjuryRpt_Date = $recordset["InjuryRpt_Date"]; 
            $InjuryTime = $recordset["InjuryTime"];
            $Location = $recordset["Location"];
            $Branch = $recordset["Branch"];
            $Employee = $recordset["Employee"];
            $ReportedTo = $recordset["ReportedTo"];
            $Position = $recordset["Position"];
            $ReportedDate = $recordset["ReportedDate"];
            $BeganTime = $recordset["BeganTime"];
            $Supervisor = $recordset["Supervisor"];
            $NatureOfInjury = $recordset["NatureOfInjury"];
            $HarmObject = $recordset["HarmObject"];
            $ImmActionTaken = $recordset["ImmActionTaken"];
            $EmployeeStatement = $recordset["EmployeeStatement"];
            $WitnessStatement = $recordset["WitnessStatement"];
            $EmployeePhoneNo = $recordset["EmployeePhoneNo"];
            $EmployeeAddress = $recordset["EmployeeAddress"];
            $EmpDOB = $recordset["EmpDOB"];
            $EmployeeSex = $recordset["EmployeeSex"];
            $EmpDOH = $recordset["EmpDOH"];
            $SafetyFeature = $recordset["SafetyFeature"];
            $PanelofPhysicians = $recordset["PanelofPhysicians"];
            $MedicalReleaseForm = $recordset["MedicalReleaseForm"];
            $DutiesTOA = $recordset["DutiesTOA"];
            $DutiesTOAYes = $recordset["DutiesTOAYes"];
            $AccidentPrev = $recordset["AccidentPrev"];
            $Explain = $recordset["Explain"];
            $Note = $recordset["Note"];
            $BO_Status = $recordset["BO_Status"];	
            $BO_MedicalReq = $recordset["BO_MedicalReq"];
            $BO_DrugTest = $recordset["BO_DrugTest"];
            $BO_AccInv = $recordset["BO_AccInv"];
            $BO_Hospitalized = $recordset["BO_Hospitalized"];
            $BO_WorkerComp = $recordset["BO_WorkerComp"];
            $BO_WorkerCompNo = $recordset["BO_WorkerCompNo"];
            $BO_Restrictions = $recordset["BO_Restrictions"];
            $BO_ListRestrictions = $recordset["BO_ListRestrictions"];
            $BO_LightDuty = $recordset["BO_LightDuty"];
            $BO_Facility = $recordset["BO_Facility"];
            $BO_Physician = $recordset["BO_Physician"];
            $NatureOfInjury = $recordset["NatureOfInjury"];
            $InjuryRpt_File = $recordset["InjuryRpt_File"];
            
            $hdRptDate = $InjuryRpt_Date;
        } else {//echo "$InjuryID";
            include "Error_no_injury_report.php";
            return;
        }
    }
    catch(Exception $e) {
        include "Error_no_injury_report.php";
        return false;
    }
    
    include "injury_bo_report.php";
}
?>