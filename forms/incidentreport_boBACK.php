<?php      

$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 
//$myServer = "server\sqle2008";
//$myUser = "sa";
//$myPass = "sa@2008";
//$myDB = "jrgm"; 
$ImageName ="";
$hdVehicleNo = "";
$hdRptDate = "";
$ImageCount = 0;
$DisplayReport = "";
$currentDate = date("Y-m-d");

$DisplayReport = "true";	//Display records on initial load as well as at the time of image loading
function customError($errno, $errstr) {
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

$BO_Status = "";
$BO_DrugTest = "";
$BO_WorkerComp = "";
$BO_SafetyUsed = "";
$BO_IsFine = "";
$BO_IsPayroll = "";
$BO_Injuries = "";
$BO_Translator = "";
$BO_Fine = "";
$BO_EstimatedLoss = "";
$BO_FinalLoss = "";
$hdRptDate  = "";
$VehicleNumber = "";
$LicenseNo = "";
$ReportedTo = "";
$NatureOfIncident  = "";

$OwnerName  = "";
$OwnerPhoneNo = "";
$OwnerLicenseNo  = "";
$OwnerTypeOfVehicle  = "";
$OwnerAddress  = "";
$InsuranceInfo  = "";
$DamegeDesc  = "";
$ImmActionTaken  = "";
$EmployeeStatement  = "";
$WitnessStatement  = "";

$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImgList = new COM("ADODB.RecordSet") or die("Cannot start ADO");
$recordsetImg = new COM("ADODB.RecordSet") or die("Cannot start ADO");

$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $IncidentID = $_GET['id']; 
    //echo("  ID   :  "+$IncidentID);
    $sql_Select = "";
    $sql_Select = "Select * from Form_IncidentReport where incidentRpt_ID='".  $IncidentID ."'";

    $recordset->open($sql_Select, $conn, 3);

    $errMessage = "";

    $Inspection_Id = 0;
    if (!$recordset->EOF) {
        $recordset->movefirst();
        $IR_ID = $recordset->fields["IR_ID"]->value;
        $IncidentID = $recordset->fields["IncidentRpt_ID"]->value;
        $incidentRpt_Date = $recordset->fields["incidentRpt_Date"]->value; 
        $VehicleNumber = $recordset->fields["VehicleNumber"]->value;
        $IncidentTime = $recordset->fields["IncidentTime"]->value;
        $LicenseNo = $recordset->fields["LicenseNo"]->value;
        $Location = $recordset->fields["Location"]->value;
        $Equipment = $recordset->fields["Equipment"]->value;
        $Branch = $recordset->fields["Branch"]->value;
        $Employee = $recordset->fields["Employee"]->value;
        $ReportedTo = $recordset->fields["ReportedTo"]->value;
        $Position = $recordset->fields["Position"]->value;
        $ReportedDate = $recordset->fields["ReportedDate"]->value;
        $Supervisor = $recordset->fields["Supervisor"]->value;
        $NatureOfIncident = $recordset->fields["NatureOfIncident"]->value;
        $OwnerName = $recordset->fields["OwnerName"]->value;
        $OwnerPhoneNo = $recordset->fields["OwnerPhoneNo"]->value;
        $OwnerLicenseNo = $recordset->fields["OwnerLicenseNo"]->value;
        $OwnerTypeOfVehicle = $recordset->fields["OwnerTypeOfVehicle"]->value;
        $OwnerAddress = $recordset->fields["OwnerAddress"]->value;
        $DamegeDesc = $recordset->fields["DamegeDesc"]->value;
        $InsuranceInfo = $recordset->fields["InsuranceInfo"]->value;
        $ImmActionTaken = $recordset->fields["ImmActionTaken"]->value;
        $EmployeeStatement = $recordset->fields["EmployeeStatement"]->value;
        $WitnessStatement = $recordset->fields["WitnessStatement"]->value;    
        $BO_Status = $recordset->fields["BO_Status"]->value;    
        $BO_DrugTest = $recordset->fields["BO_DrugTest"]->value;
        $BO_WorkerComp = $recordset->fields["BO_WorkerComp"]->value;
        $BO_SafetyUsed = $recordset->fields["BO_SafetyUsed"]->value;
        $BO_IsFine = $recordset->fields["BO_IsFine"]->value;
        $BO_IsPayroll = $recordset->fields["BO_IsPayroll"]->value;
        $BO_Injuries = $recordset->fields["BO_Injuries"]->value;
        $BO_Translator = $recordset->fields["BO_Translator"]->value;  
        $BO_Fine = $recordset->fields["BO_Fine"]->value;
        $BO_EstimatedLoss = $recordset->fields["BO_EstimatedLoss"]->value;
        $BO_FinalLoss = $recordset->fields["BO_FinalLoss"]->value;
    }
        
    if(isset($_POST['status'])) { $BO_Status=$_POST['status']; }
    if(isset($_POST['dt'])) { $BO_DrugTest = $_POST['dt']; }
    if(isset($_POST['wcc'])) { $BO_WorkerComp = $_POST['wcc']; }
    if(isset($_POST['su'])) { $BO_SafetyUsed = $_POST['su']; }
    if(isset($_POST['if'])) { $BO_IsFine = $_POST['if'];}
    if(isset($_POST['pdc'])) { $BO_IsPayroll = $_POST['pdc']; }
    if(isset($_POST['Injuries'])) { $BO_Injuries = $_POST['Injuries']; }
    if(isset($_POST['Translator_Name'])) { $BO_Translator = $_POST['Translator_Name']; }
    if(isset($_POST['EstimatedLoss'])) { $BO_Fine = $_POST['Fine']; }
    if(isset($_POST['DutiesTOA'])) { $BO_EstimatedLoss = $_POST['EstimatedLoss'];}
    if(isset($_POST['FinalLoss'])) { $BO_FinalLoss = $_POST['FinalLoss']; }
    if(isset($_POST['hdincidentRpt_Date'])) { $hdRptDate = trim($_POST['hdincidentRpt_Date']); }
    if(isset($_POST['VehicleNumber'])) { $VehicleNumber = trim($_POST['VehicleNumber']); }
    if(isset($_POST['License_Number'])) { $LicenseNo = trim($_POST['License_Number']); }
    if(isset($_POST['Reported_To'])) { $ReportedTo = trim($_POST['Reported_To']); }
    if(isset($_POST['nid'])) { $NatureOfIncident = trim($_POST['nid']); }
    if(isset($_POST['Owner_name'])) { $OwnerName = trim($_POST['Owner_name']); }
    if(isset($_POST['Phone_number'])) { $OwnerPhoneNo = trim($_POST['Phone_number']); }
    if(isset($_POST['License_Other'])) { $OwnerLicenseNo = trim($_POST['License_Other']); }
    if(isset($_POST['Vehicle_type'])) { $OwnerTypeOfVehicle = trim($_POST['Vehicle_type']); }
    if(isset($_POST['Address'])) { $OwnerAddress = trim($_POST['Address']); }
    if(isset($_POST['Insurance'])) { $InsuranceInfo = trim($_POST['Insurance']); }
    if(isset($_POST['Damage_description'])) { $DamegeDesc = trim($_POST['Damage_description']); }
    if(isset($_POST['Action_taken'])) { $ImmActionTaken = trim($_POST['Action_taken']); }
    if(isset($_POST['Employee_statement'])) { $EmployeeStatement = trim($_POST['Employee_statement']); }
    if(isset($_POST['Witness_statement'])) { $WitnessStatement = trim($_POST['Witness_statement']); }
 
    $hdRptDate = $_POST['hdincidentRpt_Date'];
    $show = "";

    //echo isset($_POST['uploadimg']);
    $show = "";
    $sql_Select = "";
    if ($_FILES['file']['name'][0] != "") {
         //echo("Entered");
        $sql_Select = "Select count(Incident_ImgID) as ImageCount from Form_IncidentReportImageDetails where Incident_Date='$hdRptDate' and IncidentRpt_ID='$IncidentID'";
        //echo $sql_Select;
        $recordsetImg->open($sql_Select, $conn, 3);      
          
        //echo "Total Employee".$recordsetImg->RecordCount;
        if (!$recordsetImg->EOF) {
            $recordsetImg->movefirst();
            $ImageCount = $recordsetImg->fields["ImageCount"]->value + 1;
        }
        //echo $ImageCount;
        // echo createFromFormat('!m/d/Y', $incidentRpt_Date);
        //$datetime = new DateTime($incidentRpt_Date);
        //echo $datetime."<br/>";
        //$datetime->createFromFormat('m/d/Y', $incidentRpt_Date); 
        //echo $datetime."<br/>";
        //$varstring= $datetime->format('mdy');
        $varstring = str_replace('/', '', $hdRptDate);
        
        for($i = 0; $i < count($_FILES["file"]["name"]); $i++) {
            //echo $varstring."<br/>";
            $sql_Insertimage = explode(".", $_FILES["file"]["name"][$i]);
            $ImageName = $varstring .'_'.$VehicleNumber.'_'.$ImageCount.'.'.$sql_Insertimage[1];
            //echo "enter345 ------> ". $ImageName;
            $sql_Insertimage = " ";
            $sql_Insertimage = "INSERT INTO Form_IncidentReportImageDetails( [Incident_Date],[VehicleNo],[ImageName],[CreatedDate],[IncidentRpt_ID])
                           values('$hdRptDate','$VehicleNumber','$ImageName','$currentDate','$IncidentID')";
            
            $conn->execute($sql_Insertimage);
             
            $allowedExts = array("gif", "jpeg", "jpg", "png", "pdf", "doc", "docx");
            $allowedFileTypes = array("image/gif", 
                                  "image/jpeg", 
                                  "image/jpg", 
                                  "image/pjpeg", 
                                  "image/x-PNG", 
                                  "image/x-JPEG", 
                                  "image/x-JPG", 
                                  "application/pdf", 
                                  "application/PDF",
                                  "image/png");
            $temp = explode(".", $_FILES["file"]["name"][$i]);
            $extension = mb_strtolower(end($temp));
            
             //echo("File extension");
            //echo($_FILES["file"]["type"]);
            //echo("<------------>");
            //echo($extension+"<-------------->"+ $allowedExts);
            if (in_array($_FILES["file"]["type"][$i], $allowedFileTypes) && in_array($extension, $allowedExts)) {
                if ($_FILES["file"]["error"][$i] > 0) {
                    echo "Return Code: " . $_FILES["file"]["error"][$i] . "<br/>";
                } else {
                    if (file_exists("photos/" . $_FILES["file"]["name"][$i])) {
                        echo $_FILES["file"]["name"][$i] . " already exists. ";
                    } else {
                        move_uploaded_file($_FILES["file"]["tmp_name"][$i], "photos/" . $ImageName);
                    }
                }
            } else {
                echo "Invalid file";
            }
            $ImageCount++;
        }
        $rowcount = 1;
        $ImageList = '';
    } else {
        $show = "please choose file.";
        echo $show;
    }
    
    if (isset($_POST['btnSumit'])) {
        $sql = "UPDATE Form_IncidentReport 
        SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_WorkerComp='$BO_WorkerComp', BO_SafetyUsed='$BO_SafetyUsed', 
        BO_IsFine='$BO_IsFine', BO_IsPayroll='$BO_IsPayroll', BO_Translator='$BO_Translator', BO_Fine='$BO_Fine', 
        BO_EstimatedLoss='$BO_EstimatedLoss', BO_FinalLoss='$BO_FinalLoss',BO_Update='Complete', LicenseNo='$LicenseNo' , 
        ReportedTo='$ReportedTo' , NatureOfIncident='$NatureOfIncident' , OwnerName='$OwnerName' , OwnerPhoneNo='$OwnerPhoneNo', 
        OwnerLicenseNo='$OwnerLicenseNo' , OwnerTypeOfVehicle='$OwnerTypeOfVehicle' , OwnerAddress='$OwnerAddress' , 
        InsuranceInfo='$InsuranceInfo' , DamegeDesc='$DamegeDesc' , ImmActionTaken='$ImmActionTaken' , 
        EmployeeStatement='$EmployeeStatement' , WitnessStatement='$WitnessStatement' , BO_Injuries='$BO_Injuries',VehicleNumber='$VehicleNumber'  
        WHERE incidentRpt_ID = '$IncidentID' ";

        $conn->execute($sql);
    }
    elseif (isset($_POST['btnSumitPDF'])) {
        include "incidentreport_bo_report_pdf.php";
        $sql = "UPDATE Form_IncidentReport 
        SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_WorkerComp='$BO_WorkerComp', BO_SafetyUsed='$BO_SafetyUsed', 
        BO_IsFine='$BO_IsFine', BO_IsPayroll='$BO_IsPayroll', BO_Translator='$BO_Translator', BO_Fine='$BO_Fine', 
        BO_EstimatedLoss='$BO_EstimatedLoss', BO_FinalLoss='$BO_FinalLoss',BO_Update='Complete', LicenseNo='$LicenseNo' , 
        ReportedTo='$ReportedTo' , NatureOfIncident='$NatureOfIncident' , OwnerName='$OwnerName' , OwnerPhoneNo='$OwnerPhoneNo', 
        OwnerLicenseNo='$OwnerLicenseNo' , OwnerTypeOfVehicle='$OwnerTypeOfVehicle' , OwnerAddress='$OwnerAddress' , 
        InsuranceInfo='$InsuranceInfo' , DamegeDesc='$DamegeDesc' , ImmActionTaken='$ImmActionTaken' , 
        EmployeeStatement='$EmployeeStatement' , WitnessStatement='$WitnessStatement' , BO_Injuries='$BO_Injuries',
        VehicleNumber='$VehicleNumber',IncidentRpt_File='$IR_ID.pdf'  
        WHERE incidentRpt_ID = '$IncidentID' ";

        $conn->execute($sql);
    }
    $DisplayReport = "false";//Displaying saved message

    include "incidentreport_bo_report_saved.php";	
}
//else
if ($DisplayReport == "true") {
    //echo "Hello";	
	$IncidentID = $_GET['id']; 
    //echo("  ID   :  "+$IncidentID);
    $sql_Select = "";
    $sql_Select = "Select * from Form_IncidentReport where incidentRpt_ID='".  $IncidentID ."'";

    try {
        $recordset->open($sql_Select, $conn, 3);

        $errMessage = "";

        $Inspection_Id = 0;
        if (!$recordset->EOF) {
            $recordset->movefirst();
            $IR_ID = $recordset->fields["IR_ID"]->value;
            $IncidentID = $recordset->fields["IncidentRpt_ID"]->value;
            $incidentRpt_Date = $recordset->fields["incidentRpt_Date"]->value; 
            $VehicleNumber = $recordset->fields["VehicleNumber"]->value;
            $IncidentTime = $recordset->fields["IncidentTime"]->value;
            $LicenseNo = $recordset->fields["LicenseNo"]->value;
            $Location = $recordset->fields["Location"]->value;
            $Equipment = $recordset->fields["Equipment"]->value;
            $Branch = $recordset->fields["Branch"]->value;
            $Employee = $recordset->fields["Employee"]->value;
            $ReportedTo = $recordset->fields["ReportedTo"]->value;
            $Position = $recordset->fields["Position"]->value;
            $ReportedDate = $recordset->fields["ReportedDate"]->value;
            $Supervisor = $recordset->fields["Supervisor"]->value;
            $NatureOfIncident = $recordset->fields["NatureOfIncident"]->value;
            $OwnerName = $recordset->fields["OwnerName"]->value;
            $OwnerPhoneNo = $recordset->fields["OwnerPhoneNo"]->value;
            $OwnerLicenseNo = $recordset->fields["OwnerLicenseNo"]->value;
            $OwnerTypeOfVehicle = $recordset->fields["OwnerTypeOfVehicle"]->value;
            $OwnerAddress = $recordset->fields["OwnerAddress"]->value;
            $DamegeDesc = $recordset->fields["DamegeDesc"]->value;
            $InsuranceInfo = $recordset->fields["InsuranceInfo"]->value;
            $ImmActionTaken = $recordset->fields["ImmActionTaken"]->value;
            $EmployeeStatement = $recordset->fields["EmployeeStatement"]->value;
            $WitnessStatement = $recordset->fields["WitnessStatement"]->value;	
            $BO_Status = $recordset->fields["BO_Status"]->value;	
            $BO_DrugTest = $recordset->fields["BO_DrugTest"]->value;
            $BO_WorkerComp = $recordset->fields["BO_WorkerComp"]->value;
            $BO_SafetyUsed = $recordset->fields["BO_SafetyUsed"]->value;
            $BO_IsFine = $recordset->fields["BO_IsFine"]->value;
            $BO_IsPayroll = $recordset->fields["BO_IsPayroll"]->value;
            $BO_Injuries = $recordset->fields["BO_Injuries"]->value;
            $BO_Translator = $recordset->fields["BO_Translator"]->value;  
            $BO_Fine = $recordset->fields["BO_Fine"]->value;
            $BO_EstimatedLoss = $recordset->fields["BO_EstimatedLoss"]->value;
            $BO_FinalLoss = $recordset->fields["BO_FinalLoss"]->value;

            ////////////////

            //echo "$IncidentID";
            ////////////////

        }
        else {
	        //echo "$IncidentID";
            $errMessage = "Invalid Request ID !!!";
        }
    }
    catch(Exception $e) {
    $errMessage = "Incorrect Request ID !!!";
    }
    
    //echo $errMessage;
    if($errMessage != "") {
        include "incidentreport_bo_error.php";
        return false;
    }

    include "incidentreport_bo_report.php";
}
?>