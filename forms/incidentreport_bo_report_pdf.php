<?php
require('fpdf/pdf.php');

$pdf = new PDF();
$pdf->SetLeftMargin(13);
$pdf->AddPage();
$pdf->SetX(11);

$pdf->SetFont('Arial', '', 17);
$pdf->SetTextColor(0, 87, 61);

$pdf->Cell(0, 0, "Incident Report—For Office Use Only", 0, 1);
$pdf->Ln(8);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('Arial', '', 12);

$pdf->Cell(30, 10, "ID");
$pdf->Cell(60, 10, $IR_ID);

$pdf->Cell(40, 10, "Supervisor");
$pdf->Cell(0, 10, $Supervisor, 0, 1);

$pdf->Cell(30, 10, "Date");
$pdf->Cell(60, 10, $incidentRpt_Date);

$pdf->Cell(40, 10, "Position");
$pdf->Cell(0, 10, $Position, 0, 1);

$pdf->Cell(30, 10, "Time");
$pdf->Cell(60, 10, $IncidentTime);

$pdf->Cell(40, 10, "Vehicle Number");
$pdf->Cell(0, 10, $VehicleNumber, 0, 1);

$x = $pdf->GetX(); $y = $pdf->GetY();
$pdf->SetXY($x+90, $y);
$pdf->Cell(40, 10, "License Number");
$pdf->Cell(0, 10, $LicenseNo, 0, 1);

$pdf->SetXY($x, $y);
$pdf->Cell(30, 10, "Location");
$pdf->displayMultilineContent($Location, 60, 10);
//$pdf->Cell(60, 10, $Location);

$pdf->Cell(30, 10, "Branch");
$pdf->Cell(60, 10, $Branch);

$pdf->Cell(40, 10, "Reported To");
$pdf->Cell(0, 10, $ReportedTo, 0, 1);

$pdf->Cell(30, 10, "Employee");
$pdf->Cell(60, 10, $Employee);

$pdf->Cell(40, 10, "Reported Date");
$pdf->Cell(0, 10, $ReportedDate, 0, 1);

$pdf->Ln(5);

$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Nature of Incident & Damage. Please be Specific:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($NatureOfIncident, 0, 10);

$pdf->Ln(3);

$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Other Vehicle Information", 0, 1);
$pdf->Ln(3);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(50, 10, "Name of Owner");
$pdf->Cell(60, 10, $OwnerName);
$pdf->Cell(35, 10, "Phone Number");
$pdf->Cell(0, 10, $OwnerPhoneNo, 0, 1);
$pdf->Cell(50, 10, "License Number");
$pdf->Cell(60, 10, $OwnerLicenseNo);
$pdf->Cell(35, 10, "Type of Vehicle");
$pdf->Cell(0, 10, $OwnerTypeOfVehicle, 0, 1);
$pdf->Cell(50, 10, "Address");
$pdf->Cell(0, 10, $OwnerAddress, 0, 1);
$pdf->Cell(50, 10, "Description of Damage");
$pdf->displayMultilineContent($DamegeDesc, 0, 10);
$pdf->Cell(50, 10, "Insurance Information");
$pdf->displayMultilineContent($InsuranceInfo, 0, 10);
$pdf->Cell(50, 10, "Immediate Action Taken");
$pdf->displayMultilineContent($ImmActionTaken, 0, 10);
$pdf->Cell(50, 10, "Employee Statement");
$pdf->displayMultilineContent($EmployeeStatement, 0, 10);
$pdf->Cell(50, 10, "Witness Statement");
$pdf->displayMultilineContent($WitnessStatement, 0, 10);
$pdf->Cell(50, 10, "Note");
$pdf->displayMultilineContent($Note, 0, 10);
$pdf->Cell(50, 10, "Status");
$pdf->Cell(0, 10, $BO_Status, 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(155, 10, "Drug Test");
$pdf->Cell(0, 10, ($BO_DrugTest=="Y")?"Yes":(($BO_DrugTest=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Were there any injuries? If so, a separate injury report will need to be filed.");
$pdf->Cell(0, 10, ($BO_Injuries=="Y")?"Yes":(($BO_Injuries=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Was accident the result of bypassed safety features or improper work technique?");
$pdf->Cell(0, 10, ($BO_SafetyUsed=="Y")?"Yes":(($BO_SafetyUsed=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Filed a claim with JRGM insurance provider?");
$pdf->Cell(0, 10, ($BO_WorkerComp=="Y")?"Yes":(($BO_WorkerComp=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Total Value of Loss - Estimated");
$pdf->Cell(0, 10, $BO_EstimatedLoss, 0, 1);
$pdf->Cell(155, 10, "Total Value of Loss - Final");
$pdf->Cell(0, 10, $BO_FinalLoss, 0, 1);
$pdf->Cell(155, 10, "Will loss result in a fine?");
$pdf->Cell(0, 10, ($BO_IsFine=="Y")?"Yes":(($BO_IsFine=="N")?"No":""), 0, 1);
if($BO_IsFine == "Y") {
    $pdf->Cell(155, 10, "Dollar Amount of Fine");
    $pdf->Cell(0, 10, $BO_Fine, 0, 1);
}
$pdf->Cell(155, 10, "Payroll Deduction or Cash?");
$pdf->Cell(0, 10, ($BO_IsPayroll=="Y")?"Yes":(($BO_IsPayroll=="N")?"No":""), 0, 1);
$pdf->Cell(70, 10, "Translator");
$pdf->Cell(0, 10, $BO_Translator, 0, 1);

$pdf->Cell(70, 10, "File(s)");

$conn = new COM ("ADODB.Connection");
$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database

$sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and VehicleNo='$VehicleNumber'";
$recordsetImgList->open($sql_Select, $conn, 3);      

if (!$recordsetImgList->EOF) {
    $recordsetImgList->movefirst();
    while (!$recordsetImgList->EOF)
    { //will automatically return false when out of records
        $pdf->Cell(0, 10, $recordsetImgList->fields["ImageName"]->value, 0, 2);
        $recordsetImgList->MoveNext(); 
    }
}                            

$pdf->Output("photos/incident_reports/$IR_ID.pdf");
?>