<?php
require('fpdf/pdf.php');

$pdf = new PDF();
$pdf->SetLeftMargin(13);
$pdf->AddPage();
$pdf->SetX(11);

$pdf->SetFont('Arial', '', 17);
$pdf->SetTextColor(0, 87, 61);

$pdf->Cell(0, 0, "Injury Report—For Office Use Only", 0, 1);
$pdf->Ln(8);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('Arial', '', 12);

$pdf->Cell(25, 10, "ID");
$pdf->Cell(65, 10, $IR_ID);

$pdf->Cell(60, 10, "Date");
$pdf->Cell(0, 10, $InjuryRpt_Date, 0, 1);

$x = $pdf->GetX(); $y = $pdf->GetY();
$pdf->SetXY($x+90, $y);
$pdf->Cell(60, 10, "Time");
$pdf->Cell(0, 10, $InjuryTime, 0, 1);

$pdf->SetXY($x, $y);
$pdf->Cell(25, 10, "Location");
//$pdf->Cell(65, 10, $Location);
$pdf->displayMultilineContentWithWidth($Location, 65);

$pdf->Cell(25, 10, "Branch");
$pdf->Cell(65, 10, $Branch);

$pdf->Cell(60, 10, "Reported To");
$pdf->Cell(0, 10, $ReportedTo, 0, 1);

$pdf->Cell(25, 10, "Employee");
$pdf->Cell(65, 10, $Employee);

$pdf->Cell(60, 10, "Reported Date");
$pdf->Cell(0, 10, $ReportedDate, 0, 1);

$pdf->Cell(25, 10, "Supervisor");
$pdf->Cell(65, 10, $Supervisor);

$pdf->Cell(60, 10, "Time Employee Began Work");
$pdf->Cell(0, 10, $BeganTime, 0, 1);

$pdf->Cell(25, 10, "Position");
$pdf->Cell(0, 10, $Position, 0, 1);

$pdf->Ln(5);

$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Nature of Injury or Illness. Please be Specific:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($NatureOfInjury);

$pdf->Ln(3);


$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "What Object Directly Caused Harm to Employee:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($HarmObject);

$pdf->Ln(3);


$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Immediate Action Taken:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($ImmActionTaken);

$pdf->Ln(3);


$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Employee Statement:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($EmployeeStatement);

$pdf->Ln(3);


$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Witness Statement:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->displayMultilineContent($WitnessStatement);
            
$pdf->Ln(7);

$pdf->SetFont('Arial', 'B', 13);
$pdf->Cell(0, 10, "Other Vehicle Information", 0, 1);
$pdf->Ln(3);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(50, 10, "Employee Address");
$pdf->Cell(0, 10, $EmployeeAddress, 0, 1);
$pdf->Cell(50, 10, "Date of Birth");
$pdf->Cell(50, 10, $EmpDOB);
$pdf->Cell(40, 10, "Phone Number");
$pdf->Cell(0, 10, $EmployeePhoneNo, 0, 1);
$pdf->Cell(50, 10, "Employee Gender");
$pdf->Cell(0, 10, ($EmployeeSex=="M")?"Male":(($EmployeeSex=="F")?"Female":""), 0, 1);
$pdf->Cell(50, 10, "Date of Hire");
$pdf->Cell(50, 10, $EmpDOH, 0, 1);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(155, 10, "Were safety features bypassed?");
$pdf->Cell(0, 10, ($SafetyFeature=="Y")?"Yes":(($SafetyFeature=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Was employee given information on Panel of Physicians?");
$pdf->Cell(0, 10, ($PanelofPhysicians=="Y")?"Yes":(($PanelofPhysicians=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Was employee given a medical release form?");
$pdf->Cell(0, 10, ($MedicalReleaseForm=="Y")?"Yes":(($MedicalReleaseForm=="N")?"No":""), 0, 1);
$pdf->Cell(155, 10, "Was employee doing something other than required duties at time of accident?");
$pdf->Cell(0, 10, ($DutiesTOA=="Y")?"Yes":(($DutiesTOA=="N")?"No":""), 0, 1);
$pdf->Cell(70, 10, "If so, what and why?");
$pdf->displayMultilineContent($DutiesTOAYes);

$pdf->Cell(155, 10, "Could this accident have been prevented?");
$pdf->Cell(0, 10, ($AccidentPrev=="Y")?"Yes":(($AccidentPrev=="N")?"No":""), 0, 1);
$pdf->Cell(70, 10, "Please explain");
$pdf->displayMultilineContent($Explain);

$pdf->Ln(6);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(100, 10, "What was medical requirement of injury?");
$output = "";
if($BO_MedicalReq == "FA") $output = "First Aid";
elseif ($BO_MedicalReq == "ER") $output = "ER";
elseif ($BO_MedicalReq == "ME") $output = "Med Express";
$pdf->Cell(0, 10, $output, 0, 1);
$pdf->Cell(100, 10, "Was employee drug tested?");
$pdf->Cell(0, 10, ($BO_DrugTest=="Y")?"Yes":(($BO_DrugTest=="N")?"No":""), 0, 1);
$pdf->Cell(100, 10, "Was there a complete accident investigation?");
$pdf->Cell(0, 10, ($BO_AccInv=="Y")?"Yes":(($BO_AccInv=="N")?"No":""), 0, 1);
$pdf->Cell(100, 10, "Was employee hospitalized?");
$pdf->Cell(0, 10, ($BO_Hospitalized=="Y")?"Yes":(($BO_Hospitalized=="N")?"No":""), 0, 1);
$pdf->Cell(100, 10, "Was report sent to Workers Comp Carrier?");
$pdf->Cell(0, 10, ($BO_WorkerComp=="Y")?"Yes":(($BO_WorkerComp=="N")?"No":""), 0, 1);
$pdf->Cell(100, 10, "Workers Comp Case Number");
$pdf->Cell(0, 10, $BO_WorkerCompNo, 0, 1);
$pdf->Cell(100, 10, "Are there any work restrictions?");
$pdf->Cell(0, 10, ($BO_Restrictions=="Y")?"Yes":(($BO_Restrictions=="N")?"No":""), 0, 1);
if($BO_Restrictions != "N") {
    $pdf->Cell(100, 10, "List restrictions");
    $pdf->displayMultilineContent($BO_ListRestrictions);
}

$pdf->Cell(100, 10, "Is employee on light duty?");
$pdf->Cell(0, 10, ($BO_LightDuty=="Y")?"Yes":(($BO_LightDuty=="N")?"No":""), 0, 1);

$pdf->Ln(5);
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Medical Treatment", 0, 1);

$pdf->SetFont('Arial', '', 12.5);
$pdf->Cell(70, 10, "Facility Name & Address:");
$pdf->displayMultilineContent($BO_Facility);

$pdf->Cell(70, 10, "Name of Physician");
$pdf->Cell(0, 10, $BO_Physician, 0, 1);
$pdf->Cell(70, 10, "Status");
$pdf->Cell(0, 10, $BO_Status, 0, 1);

$pdf->Cell(70, 10, "File(s)");

$conn = new COM ("ADODB.Connection");
$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database

$sql_Select = "Select * from Form_InjuryReportImageDetails where Injury_Date='$hdRptDate' and InjuryRpt_ID='$InjuryID'";
$recordsetImgList->open($sql_Select, $conn, 3);      

if (!$recordsetImgList->EOF) {
    $recordsetImgList->movefirst();
    while (!$recordsetImgList->EOF)
    { //will automatically return false when out of records
        $pdf->Cell(0, 10, $recordsetImgList->fields["ImageName"]->value, 0, 2);
        $recordsetImgList->MoveNext(); 
    }
}                            

$pdf->Output("photos/injury_reports/$IR_ID.pdf");

?>