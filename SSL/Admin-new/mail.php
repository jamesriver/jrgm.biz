<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
if(isset($_POST['submit']))
{

	$data  = "<b>Comments - </b>" .$_POST['comment']."<br />";
	$data .= "<b>Sender - </b>".$_POST['user']."<br />";
	$data .= "<b>Page   - </b>".$_POST['page_name']."<br />";
	$data .= "<b>Time   - </b>".date('H:i:s');
	$subject = "Feedback Details Of JRGM Branch";
	$from_email = "sherri@429designs.com";
	// $to_email = "mp.narola@narolainfotech.com";
	$to_email = "sherri@429designs.com , pat@1design.com";
	$headers  = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=utf-8\r\n";
	$headers .= "To:  <$to_email>\r\n";
	$headers .= "From:  <$from_email>\r\n";
	$message = $data;
	//echo $data;
	// echo $_SERVER['HTTP_REFERER'];
	if (!mail($to_email, $subject, $message, $headers)) { 
		print_r(error_get_last());
	}
	else { 
		//echo "Send Mail sucessfully"; 
	}  
	header("Location:".$_SERVER['HTTP_REFERER']);
}?>

