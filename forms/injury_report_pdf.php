<?php
require('fpdf/pdf.php');

$pdf = new PDF();

$pdf->AddPage();

$pdf->SetFont('Arial', '', 17);
$pdf->SetTextColor(0, 87, 61);
$pdf->SetX(10);
$pdf->Cell(0, 0, "Injury Report—For Office Use Only", 0, 1);
$pdf->Ln(8);


$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('Arial', '', 12.5);

$pdf->Cell(80, 10, "ID");

$pdf->Cell(0, 10, "Date", 0, 1);

$pdf->Cell(80, 10, "Location");

$pdf->Cell(0, 10, "Time", 0, 1);

$pdf->Cell(80, 10, "Branch");

$pdf->Cell(0, 10, "Reported To", 0, 1);

$pdf->Cell(80, 10, "Employee");

$pdf->Cell(0, 10, "Reported Date", 0, 1);

$pdf->Cell(80, 10, "Supervisor");

$pdf->Cell(0, 10, "Time Employee Began Work", 0, 1);

$pdf->Cell(0, 10, "Position", 0, 1);

$pdf->Ln(5);

$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Nature of Injury or Illness. Please be Specific:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$content = "Repeat this methodology for any other MultiCell cells, and  Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and    ";
$pdf->displayMultilineContent($content);


$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "What Object Directly Caused Harm to Employee:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$content = "Repeat this methodology for any other MultiCell cells, and  Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and    ";
$pdf->displayMultilineContent($content);


$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Immediate Action Taken:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$content = "Repeat this methodology for any other MultiCell cells, and  Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and    ";
$pdf->displayMultilineContent($content);


$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Employee Statement:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$content = "Repeat this methodology for any other MultiCell cells, and  Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and    ";
$pdf->displayMultilineContent($content);


$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Witness Statement:", 0, 1);

$pdf->SetFont('Arial', '', 12);
$content = "Repeat this methodology for any other MultiCell cells, and  Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and   Repeat this methodology for any other MultiCell cells, and    ";
$pdf->displayMultilineContent($content);


$pdf->Ln(7);


$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Other Vehicle Information", 0, 1);
$pdf->Ln(5);

$pdf->SetFont('Arial', '', 12.5);
$pdf->Cell(0, 10, "Employee Address", 0, 1);
$pdf->Cell(90, 10, "Date of Birth");
$pdf->Cell(0, 10, "Phone Number", 0, 1);
$pdf->Cell(100, 10, "Employee Gender", 0, 1);
$pdf->Cell(0, 10, "Date of Hire", 0, 1);
$pdf->Cell(0, 10, "Were safety features bypassed?", 0, 1);
$pdf->Cell(0, 10, "Was employee given information on Panel of Physicians?", 0, 1);
$pdf->Cell(0, 10, "Was employee given a medical release form?", 0, 1);
$pdf->Cell(0, 10, "Was employee doing something other than required duties at time of accident?", 0, 1);
$pdf->Cell(0, 10, "If so, what and why?", 0, 1);
$pdf->Cell(0, 10, "Could this accident have been prevented?", 0, 1);
$pdf->Cell(0, 10, "Please explain", 0, 1);
$pdf->Cell(0, 10, "What was medical requirement of injury?", 0, 1);
$pdf->Cell(0, 10, "Was employee drug tested?", 0, 1);
$pdf->Cell(0, 10, "Was there a complete accident investigation?", 0, 1);
$pdf->Cell(0, 10, "Was employee hospitalized?", 0, 1);
$pdf->Cell(0, 10, "Was report sent to Workers Comp Carrier?", 0, 1);
$pdf->Cell(0, 10, "Workers Comp Case Number", 0, 1);
$pdf->Cell(0, 10, "Are there any work restrictions?", 0, 1);
$pdf->Cell(0, 10, "List restrictions", 0, 1);
$pdf->Cell(0, 10, "Is employee on light duty?", 0, 1);

$pdf->Ln(5);
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, "Medical Treatment", 0, 1);

$pdf->SetFont('Arial', '', 12.5);
$pdf->Cell(0, 10, "Facility Name & Address:", 0, 1);
$pdf->Cell(0, 10, "Name of Physician", 0, 1);
$pdf->Cell(0, 10, "Status", 0, 1);
$pdf->Output();
?>