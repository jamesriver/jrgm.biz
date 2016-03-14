<?php
require_once "fpdf.php";

class PDF extends FPDF
{
    // Page header
    function Header() {
        $this->Ln(12);
    }
    
    // Page footer
    function Footer() {
        $this->SetY(-10);
    }
    
    function displayMultilineContent($content, $row_width, $row_height) {
//        $column_width = 400;
//        $total_string_width = $this->GetStringWidth($content);
//        $number_of_lines = ceil( $total_string_width / ($column_width - 1) );
//        $line_height = 6;
//        $row_height = max(ceil( $number_of_lines * $line_height ), 10); 
//        $this->MultiCell(0, $row_height, $content, 0, 1);
        $this->MultiCell($row_width, $row_height, $content, 0, 1);
    }
}
?>