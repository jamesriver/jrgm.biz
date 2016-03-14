<?php ini_set('display_errors',1); 
 error_reporting(E_ALL);
?>


<?php  
 
   $to = 'patrick.hutchinson2@gmail.com,sherri.hutchinson@gmail.com,pat@1design.com'; 
       $subject = 'Injury Report MAIL';
       $message = 'Test';
       $headers = "From: alerts@jrgm.com\r\n";
       $headers .= "Reply-To: alerts@jrgm.com\r\n";
       $headers .= "-Mailer: PHP/MIME-Version: 1.0\r\n";
       $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
       $headers .= "X-Priority: 1\r\n";
       mail($to, $subject, $message, $headers, '-falerts@jrgm.com');
       $conn = null;
?>
ZZZZZ