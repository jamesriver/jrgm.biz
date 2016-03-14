<?php      

//$myServer = "76.12.221.204";
//$myUser = "jrgm";
//$myPass = "webre3abr";
//$myDB = "jrgm"; 
$myServer = "server\sqle2008";
$myUser = "sa";
$myPass = "sa@2008";
$myDB = "jrgm"; 


function customError($errno, $errstr)
  {
  echo "<b>Error:</b> [$errno] $errstr";
  }
  
//echo "nice";

$a = "tt  ";
$a .= "<html><head><title></title>"; 

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet")
  or die("Cannot start ADO");

$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
  $conn->open($connStr); //Open the connection to the database
  
$Review_ID = $_POST['review'];
$Review = $_POST['review'];
$EmployeeName = $_POST['Employee_Name'];
$PerformedBy = $_POST['Performed_by'];
$PM_Attendance = $_POST['attendance'];
$PM_Instruction = $_POST['afi'];
$PM_Communicate = $_POST['cela'];
$PM_WorkingKnowledge = $_POST['hwkea'];
$PM_Demo = $_POST['dwkjse'];
$PM_Adheres = $_POST['acp'];
$Dev_TechAbility = $_POST['Technical_Ability'];
$Dev_Goal = $_POST['Goals'];
$Comment_Emp = $_POST['Employee_comments'];
$Comment_Manager = $_POST['Manager_comments'];
$Employee_Sign = $_POST['Employee_Signature'];
$Employee_SignDate = $_POST['employee_Date'];
$Manager_Sign = $_POST['manager_Signature'];
$Manager_SignDate = $_POST['manager_Date'];
$currentDate=date("Y-m-d");


$M= 'Met Expectations';
$I= 'Improvement Needed';


$sql_InserMember="INSERT INTO Form_CR_Review([Review],[EmployeeName],[PerformedBy],[PM_Attendance],[PM_Instruction],[PM_Communicate],[PM_WorkingKnowledge],[PM_Demo],[PM_Adheres],[Dev_TechAbility],[Dev_Goal],[Comment_Emp],[Comment_Manager],[Employee_Sign],[Employee_SignDate],[Manager_Sign],[Manager_SignDate],[CreatedOn])
values('$Review','$EmployeeName','$PerformedBy','$PM_Attendance' ,'$PM_Instruction','$PM_Communicate','$PM_WorkingKnowledge','$PM_Demo','$PM_Adheres','$Dev_TechAbility','$Dev_Goal','$Comment_Emp','$Comment_Manager','$Employee_Sign','$Employee_SignDate','$Manager_Sign','$Manager_SignDate','$currentDate')";
//echo "$sql_InserMember";
$conn->execute($sql_InserMember);

if($PM_Attendance=="M")
{
$PM_Attendance=$M;
}
else
{
$PM_Attendance=$I;
}

if($PM_Instruction=="M")
{
$PM_Instruction=$M;
}
else
{
$PM_Instruction=$I;
}

if($PM_Communicate=="M")
{
$PM_Communicate=$M;
}
else
{
$PM_Communicate=$I;
}

if($PM_WorkingKnowledge=="M")
{
$PM_WorkingKnowledge=$M;
}
else
{
$PM_WorkingKnowledge=$I;
}


if($PM_Demo=="M")
{
$PM_Demo=$M;
}
else
{
$PM_Demo=$I;
}


if($PM_Adheres=="M")
{
$PM_Adheres=$M;
}
else
{
$PM_Adheres=$I;
}











//echo "$emailvalue";
$msgBody = " ";
$msgBody .= "<html><head><title></title>";
$msgBody .= "<link href='css/bootstrap.css' rel='stylesheet' /> <link href='css/styles.css' rel='stylesheet' />";
$msgBody .= "</head>";
$msgBody .= "<body style='margin-top:100px;'>";
$msgBody .= "<div>";
$msgBody .= "<div style='width: 750px;'><h3>Hello,</h3></div>";
$msgBody .= "<div style='width: 750px;'><h3>Crew Performance Review</h3></div>";
$msgBody .= "<table width='1000px;'><tr>";
$msgBody .= "<td width='400px;'>Review</td><td align='left' >$Review </td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Employee Name</td>";
$msgBody .= "<td align='left' >$EmployeeName</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Performed by</td><td align='left'>$PerformedBy</td></tr></table>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<table width='1000px;'>";
$msgBody .= "<tr><td width='400px;' ><strong>Performance Measurements</strong></td>";
$msgBody .= "<td width='170px;' >&nbsp;</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td  width='200px;'>Attendance</td>";
$msgBody .= "<td >$PM_Attendance</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Ability to follow instructions</td>";
$msgBody .= "<td>$PM_Instruction </td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr>";
$msgBody .= "<td >Communicates effectively and listens attentively</td>";
$msgBody .= "<td >$PM_Communicate</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr>";
$msgBody .= "<td >Has a working knowledge of equipment assigned</td>";
$msgBody .= "<td>$PM_WorkingKnowledge </td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr>";
$msgBody .= "<td >Demonstrates a working knowledge of job site expectations</td>";
$msgBody .= "<td >$PM_Demo</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td >Adheres to company policies (including stafety)</td>";
$msgBody .= "<td >$PM_Adheres</td></tr>";
$msgBody .= "</table>";
$msgBody .= "<table width='1000px;'><tr>";
$msgBody .= "<td width='400px;' ><strong>Development</strong></td>";
$msgBody .= "<td width='170px;' >&nbsp;</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td width='400px' >Technical Ability: List the equipment that employee has become proficient on in the first 30 days.</td>";
$msgBody .= "<td width='170px' align='left' >$Dev_TechAbility</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td width='400px'>Goals: List the specific expectations for the next 30 days</td>";
$msgBody .= "<td width='170px' align='left' >$Dev_Goal</td></tr></table>";
$msgBody .= "<table width='1000px;'><tr>";
$msgBody .= "<td width='400px;' ><strong>Comments</strong></td>";
$msgBody .= "<td width='170px;' >&nbsp;</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td width='400px;' >Employee Comments</td>";
$msgBody .= "<td width='170px;'  align='left' >$Comment_Emp</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td width='400px;' >Manager Comments</td>";
$msgBody .= "<td width='170px;' align='left' >$Comment_Manager</td></tr></table>";
$msgBody .= "<table  width='1000px;'>";
$msgBody .= "<tr><td width='400' >Employee Signature (please enter your initials)</td>";
$msgBody .= "<td align='center'>$Employee_Sign</td><td align='center' >Date</td>";
$msgBody .= "<td align='center' >$Employee_SignDate</td></tr>";
$msgBody .= "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
$msgBody .= "<tr><td>Manger Signature (please enter your initials)</td>";
$msgBody .= "<td align='center' >$Manager_Sign</td><td align='center' >Date</td>";
$msgBody .= "<td align='center' >$Manager_SignDate</td></tr>";
$msgBody .= "</table></td>";
$msgBody .= "</tr></table>";
$msgBody .= "</div></div>";
$msgBody .= "<div style='width: 150px;'><h3>Thanks,</h3></div>";
$msgBody .= "</body></html>";


$to = 'sherri@1design.com'; 
//$to = 'as39274@gmail.com';
$subject = 'Crew Performance Review MAIL'; 
$message = $msgBody; 
$headers = 'From: sherri@1design.com' . "\r\n" . 'Reply-To: sherri@1design.com' . "\r\n" . 'X-Mailer: PHP/' .
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 
phpversion();
mail($to, $subject, $message, $headers, '-fWeekly@example.com');

//header( 'Location: CrewPerformanceReview.php' ) ;

$conn = null;


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>James River Grounds Management</title>
	<script type="text/javascript" language="javascript">
	function redirect(){
		document.location.href=document.location.href;
	}
	</script>
</head>
<body>
	<div align="center" class="details_desc">
				<strong>Thank you. Your form has been submitted</strong></br>
			</div>
</body>
<?php
}
else
{
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;" />
    <title>James River Grounds Management</title>
 <script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
    <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/JavaScript2.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
	 <link href="css/stylesheet1.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/date.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#myform').bValidator();
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#employee_Date").datepicker();
            $("#manager_Date").datepicker();

        });
    </script>
     <script type="text/javascript">
         $(function () {
             $("#tel").mask("(999) 999-9999");


         });
    </script>
	

</head>
<body style="margin-top:0">
    <form action="" method="post" id="myform" class="performance" >
            <div id="centrecontent">
                <!--centre content goes here -->
              <div class="centrecontent_inner">
                    <div class="header">Crew  Performance Review</div>

                  <div class="spacer20"></div>

                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>

                            <td valign="top">

                                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Review</td>
                                        <td align="left" class="performance">
                                        <div class="radio">
                                        <input id="review_30" type="radio" name="review" value="30" checked="checked" />
			                            <label for="review_30">30 Day</label>
			                            <input id="review_60" type="radio" name="review" value="60" />
			                            <label for="review_60">60 Day</label>
                                         <input id="review_90" type="radio" name="review" value="90" />
			                            <label for="review_90">90 Day</label></div>

</td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Employee Name</td>
                                        <td align="left" class="performance">
                                            <input name="Employee_Name" type="text" id="Employee_Name" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Employee's Name" maxlength="100" /></td>
                                    </tr>
                                     <tr>
                                        <td class="performance">Performed by</td>
                                        <td align="left" class="performance">
                                            <input type="text" name="Performed_by" id="Performed_by" size="24" data-bvalidator="required" maxlength="100" data-bvalidator-msg="Please Enter the Name of the Person Performing the Interview"/></td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                    </table>


                    <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        
                  </table>
                  <table width="99%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                          <td valign="top">
                              <table border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                      <td class="performance"><strong>Performance Measurements</strong></td>
                                      <td nowrap="nowrap" class="performance">&nbsp;</td>
                                </tr>
                                  <tr>
                                      <td class="performance">Attendance</td>
                                      <td nowrap="nowrap" class="performance"> 
                                      <div class="radio">
                                        <input id="attendance_M" type="radio" name="attendance" checked="checked" value="M" />
			                            <label for="attendance_MP">M</label>
                                        <input id="attendance_I" type="radio" name="attendance" value="I" />
		                              <label for="attendance_I">I</label></div></td>
                                        
                                </tr>
                                  <tr>
                                      <td class="performance">Ability to follow instructions</td>
                                     <td nowrap="nowrap" class="performance"> <div class="radio">
                                       <input id="afi_M" type="radio" name="afi" checked="checked" value="M"  />
		                               <label for="afi_M">M</label>
                                       <input id="afi_I" type="radio" name="afi" value="I" />
	                                  <label for="afi_I">I</label></div></td>
                                </tr>
                                  <tr>
                                      <td class="performance">Communicates effectively and listens attentively</td>
                                     <td nowrap="nowrap" class="performance"> <div class="radio">
                                       <input id="cela_M" type="radio" name="cela" value="M" checked="checked" />
		                               <label for="cela_M">M</label>
                                       <input id="cela_I" type="radio" name="cela" value="I" />
	                                  <label for="cela_I">I</label></div></td>
                                </tr>
                                  <tr>
                                      <td class="performance">Has a working knowledge of equipment assigned</td>
                                       <td nowrap="nowrap" class="performance"> <div class="radio">
                                        <input id="hwkea_M" type="radio" name="hwkea" value="M" checked="checked" />
			                            <label for="hwkea_M">M</label>
                                        <input id="hwkea_I" type="radio" name="hwkea" value="I" />
		                              <label for="hwkea_I">I</label></div></td>
                                </tr>
                                  <tr>
                                      <td class="performance">Demonstrates a working knowledge of job site expectations</td>
                                    <td nowrap="nowrap" class="performance"> <div class="radio">
                                      <input id="dwkjse_M" type="radio" name="dwkjse" value="M" checked="checked" />
		                              <label for="dwkjse_M">M</label>
                                      <input id="dwkjse_I" type="radio" name="dwkjse" value="I" />
		                              <label for="dwkjse_I">I</label></div></td>
                                </tr>
                                  <tr>
                                      <td class="performance">Adheres to company policies (including stafety)</td>
                                     <td nowrap="nowrap" class="performance"> <div class="radio">
                                       <input id="acp_M" type="radio" name="acp" value="M" checked="checked" />
		                               <label for="acp_M">M</label>
                                       <input id="acp_I" type="radio" name="acp" value="I" />
	                                  <label for="acp_I">I</label></div></td>
                                </tr>
                              </table>
                          </td>
                          <td width="25%" valign="top" class="description">
                             
                                      <p><strong>M- Met Expectations: </strong><br />
                                        Performance fully met the established job expectations and may have on occasion exceeded expectations. The employee generally performs very well and requires little additional guidance. </p>
                                      <p><strong>I- Improvement Needed:</strong><br />
                                      Performance met some of the job expectations but did not fully meet all. Them employee generally performs at a minimal level and the deficiencies were due to the employees lack of skill or effort.</p></td>
                                       
                    </tr>
                              </table>
                          
                      
                  
                <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table width="99%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                      <td width="60%" class="performance"><strong>Development</strong></td>
                                      <td width="40%" nowrap="nowrap" class="performance">&nbsp;</td>
                                </tr>
                                    <tr>
                                        <td width="60%" class="performance">Technical Ability: List the equipment that employee has become proficient on in the first 30 days.</td>
                                        <td width="40%" align="center" class="performance">
                                        <textarea name="Technical_Ability" id="Technical_Ability" cols="45" rows="5"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td width="60%" class="performance">Goals: List the specific expectations for the next 30 days</td>
                                        <td width="40%" align="center" class="performance"><textarea name="Goals" id="Goals" cols="45" rows="5"></textarea></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table width="99%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="60%" class="performance"><strong>Comments</strong></td>
                                      <td width="40%" colspan="3" nowrap="nowrap" class="performance">&nbsp;</td>
                                </tr>
                                    <tr>
                                      <td width="60%" class="performance">Employee Comments</td>
                                        <td width="40%" colspan="3" align="center" class="performance">
                                        <textarea name="Employee_comments" id="Employee_comments" cols="45" rows="5"></textarea></td>
                                    </tr>
                                    <tr>
                                      <td width="60%" class="performance">Manager Comments</td>
                                        <td width="40%" colspan="3" align="center" class="performance"><textarea name="Manager_comments" id="Manager_comments" cols="45" rows="5"></textarea></td>
                                    </tr></table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                      <td class="performance">Employee Signature (please enter your initials)</td>
                                      <td align="center" class="performance"><input name="Employee_Signature" type="text" id="Employee_Signature" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Your Initials" maxlength="10" /></td>
                                      <td align="center" class="performance">Date</td>
                                      <td align="center" class="performance"><input name="employee_Date" type="text" id="employee_Date" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"/></td>
                                    </tr>
                                    <tr>
                                      <td class="performance">Manger Signature (please enter your initials)</td>
                                      <td align="center" class="performance"><input name="manager_Signature" type="text" id="manager_Signature" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter Your Initials" maxlength="10" /></td>
                                      <td align="center" class="performance">Date</td>
                                      <td align="center" class="performance"><input name="manager_Date" type="text" id="manager_Date" readonly="readonly" size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Date"/></td>
                                    </tr>
                                </table>
                          </td>
                        </tr>
                    </table>
                    <div class="spacer20"></div>
                     
                <div align="right"><input type="submit" value="Submit" id="btnSumit" name="btnSumit"/></div>
                    <!--<p><a href="notes.cfm?work_date=#url.work_date#&employee_id=#employee_id#" class="bluebutton">Submit</a> </p>-->
                </div>
            </div>

    </form>
</body>
</html>
<?php
}
?>