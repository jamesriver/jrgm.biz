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
$hdVehicleNo="";
$hdRptDate="";
$ImageCount=0;
$DisplayReport="";
$currentDate=date("Y-m-d");

$DisplayReport="true";	//Display records on initial load as well as at the time of image loading
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

$conn = new COM ("ADODB.Connection");
$recordset = new COM("ADODB.RecordSet")
or die("Cannot start ADO");

$recordsetImgList = new COM("ADODB.RecordSet")
or die("Cannot start ADO");

$recordsetImg = new COM("ADODB.RecordSet")
or die("Cannot start ADO");


$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->open($connStr); //Open the connection to the database

if ($_SERVER['REQUEST_METHOD'] == 'POST')	
{
	echo "$IncidentID111";
$BO_Status=$_POST['status'];
$BO_DrugTest = $_POST['dt'];
$BO_WorkerComp = $_POST['wcc'];
$BO_SafetyUsed = $_POST['su'];
$BO_IsFine = $_POST['if'];
$BO_IsPayroll = $_POST['pdc'];
$BO_Injuries = $_POST['Injuries'];
$BO_Translator = $_POST['Translator_Name'];
$BO_Fine = $_POST['Fine'];
$BO_EstimatedLoss = $_POST['EstimatedLoss'];
$BO_FinalLoss = $_POST['FinalLoss'];
$hdRptDate = trim($_POST['hdincidentRpt_Date']);
$hdVehicleNo = trim($_POST['hdVehicleNumber']);

$IncidentID = $_GET['id']; 
//echo"11111111";
$ImageName = ($_FILES['file']['name']);
//echo $_FILES['file']['name'];
//echo"2222222";
$show="";


//echo isset($_POST['uploadimg']);
if (isset($_POST['btnSumit'])) {
	//echo "idea";
$sql_Select="";
$sql_Select="Select * from Form_IncidentReport where incidentRpt_ID='".  $IncidentID ."'";

$sql = "UPDATE Form_IncidentReport 
SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_WorkerComp='$BO_WorkerComp', BO_SafetyUsed='$BO_SafetyUsed', 
BO_IsFine='$BO_IsFine', BO_IsPayroll='$BO_IsPayroll', BO_Translator='$BO_Translator', BO_Fine='$BO_Fine', BO_EstimatedLoss='$BO_EstimatedLoss', BO_FinalLoss='$BO_FinalLoss',BO_Update='Complete', BO_Injuries='$BO_Injuries' WHERE incidentRpt_ID = '$IncidentID' ";

//echo $sql;


$conn->
execute($sql);

$DisplayReport="false";//Displaying saved message
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>
      James River Grounds Management
    </title>
    <script type="text/javascript" language="javascript">
      function redirect(){
        document.location.href=document.location.href;
      }
    </script>
  </head>
  <body>
	<table width='400' height='200' border='0'  align='center' style="margin-top:200px; border-style: solid;  border-width: 5px; border-color:#00573d; border-radius:25px;">
      <tr>
        <td style="text-align: center; font-size:24px; font-weight:500; color:#00573d">
          <strong>
            Thank you. Your form has been submitted
          </strong>
        </br>
      <input type='button' style='color:#00573d; ;margin-top:20px;' onclick="redirect()" value="OK!" />
    </td>
  </tr>
</table>
</body>

</html>
<?php
}
elseif (isset($_POST['uploadimg'])) {
	//echo "123------->".$_FILES['file'];
$ImageName = ($_FILES['file']['name']);
$show="";
//echo($ImageName);
$sql_Select="";
//echo "<--------------";
	 if (isset($ImageName) )
		{
 			//echo("Entered");
			$sql_Select="Select count(Incident_ImgID) as ImageCount from Form_IncidentReportImageDetails where Incident_Date='$hdRptDate' and VehicleNo='$hdVehicleNo'";
  //echo $sql_Select;
	  $recordsetImg->open($sql_Select, $conn, 3);	  
		  
		  //echo "Total Employee".$recordsetImg->RecordCount;
		if(!$recordsetImg->EOF){
			  $recordsetImg->movefirst();
			  $ImageCount= $recordsetImg->fields["ImageCount"]->value+1;
		  }
		  //echo $ImageCount;
		 // echo createFromFormat('!m/d/Y', $incidentRpt_Date);
		//$datetime = new DateTime($incidentRpt_Date);
		//echo $datetime."<br/>";
		//$datetime->createFromFormat('m/d/Y', $incidentRpt_Date); 
		//echo $datetime."<br/>";
		//$varstring= $datetime->format('mdy');
		$varstring = str_replace('/', '', $hdRptDate);
		  //echo $varstring."<br/>";
		$sql_Insertimage=explode(".", $_FILES["file"]["name"]);
		$ImageName = $varstring .'_'.$hdVehicleNo.'_'.$ImageCount.'.'.$sql_Insertimage[1];
		//echo "enter345 ------> ". $ImageName;
		$sql_Insertimage=" ";
		$sql_Insertimage="INSERT INTO Form_IncidentReportImageDetails( [Incident_Date],[VehicleNo],[ImageName],[CreatedDate])
					   values('$hdRptDate','$hdVehicleNo','$ImageName','$currentDate')";
		//echo "$sql_Insertimage";
		
	 $conn->execute($sql_Insertimage);
	 	
	 	$allowedExts = array("gif", "jpeg", "jpg", "png","PNG","JPEG","JPG", "PDF", "pdf");
		$temp = explode(".", $_FILES["file"]["name"]);
		$extension = end($temp);
		
	 	//echo("File extension");
		//echo($_FILES["file"]["type"]);
		//echo("<------------>");
		//echo($extension+"<-------------->"+ $allowedExts);
		

		if ((($_FILES["file"]["type"] == "image/gif")
		|| ($_FILES["file"]["type"] == "image/jpeg")
		|| ($_FILES["file"]["type"] == "image/jpg")
		|| ($_FILES["file"]["type"] == "image/pjpeg")
		|| ($_FILES["file"]["type"] == "image/x-PNG")
		|| ($_FILES["file"]["type"] == "image/x-JPEG")
		|| ($_FILES["file"]["type"] == "image/x-JPG")
		|| ($_FILES["file"]["type"] == "application/pdf")
		|| ($_FILES["file"]["type"] == "application/PDF")
		|| ($_FILES["file"]["type"] == "image/png"))
		&& in_array($extension, $allowedExts))
		  {
		  if ($_FILES["file"]["error"] > 0)
			{
			echo "Return Code: " . $_FILES["file"]["error"] . "<br/>";
			}
		  else
			{
		
			if (file_exists("photos/" . $_FILES["file"]["name"]))
			  {
			  echo $_FILES["file"]["name"] . " already exists. ";
			  }
			else
			  {
			  move_uploaded_file($_FILES["file"]["tmp_name"],
			  "photos/" . $ImageName);
			  }
			}
		  }
		else
		  {
		echo "Invalid file";
		  }
		$rowcount=1;
		$ImageList='';
	}																													
	 else
	{
			$show = "please choose file.";
			echo $show;
	}				
}	//if (isset($_POST['uploadimg']))
	
}
//else
if($DisplayReport=="true")
{
	//echo "Hello";	
	$IncidentID = $_GET['id']; 
//echo("  ID   :  "+$IncidentID);
$sql_Select="";
$sql_Select="Select * from Form_IncidentReport where incidentRpt_ID='".  $IncidentID ."'";

try
{
$recordset->
open($sql_Select, $conn, 3);

$errMessage = "";

$Inspection_Id=0;
if(!$recordset->
EOF){
$recordset->
movefirst();
$IR_ID= $recordset->fields["IR_ID"]->value;
$IncidentID= $recordset->
fields["IncidentRpt_ID"]->
value;
$incidentRpt_Date= $recordset->
fields["incidentRpt_Date"]->
value; 
$VehicleNumber= $recordset->
fields["VehicleNumber"]->
value;
$IncidentTime= $recordset->
fields["IncidentTime"]->
value;
$LicenseNo= $recordset->
fields["LicenseNo"]->
value;
$Location= $recordset->
fields["Location"]->
value;
$Equipment= $recordset->
fields["Equipment"]->
value;
$Branch= $recordset->
fields["Branch"]->
value;
$Employee= $recordset->
fields["Employee"]->
value;
$ReportedTo= $recordset->
fields["ReportedTo"]->
value;
$Position= $recordset->
fields["Position"]->
value;
$ReportedDate= $recordset->
fields["ReportedDate"]->
value;
$Supervisor= $recordset->
fields["Supervisor"]->
value;
$NatureOfIncident= $recordset->
fields["NatureOfIncident"]->
value;
$OwnerName= $recordset->
fields["OwnerName"]->
value;
$OwnerPhoneNo= $recordset->
fields["OwnerPhoneNo"]->
value;
$OwnerLicenseNo= $recordset->
fields["OwnerLicenseNo"]->
value;
$OwnerTypeOfVehicle= $recordset->
fields["OwnerTypeOfVehicle"]->
value;
$OwnerAddress= $recordset->
fields["OwnerAddress"]->
value;
$DamegeDesc= $recordset->
fields["DamegeDesc"]->
value;
$InsuranceInfo= $recordset->
fields["InsuranceInfo"]->
value;
$ImmActionTaken= $recordset->
fields["ImmActionTaken"]->
value;
$EmployeeStatement= $recordset->
fields["EmployeeStatement"]->
value;
$WitnessStatement= $recordset->
fields["WitnessStatement"]->
value;	
$BO_Status= $recordset->
fields["BO_Status"]->
value;	
$BO_DrugTest= $recordset->
fields["BO_DrugTest"]->
value;
$BO_WorkerComp= $recordset->
fields["BO_WorkerComp"]->
value;
$BO_SafetyUsed= $recordset->
fields["BO_SafetyUsed"]->
value;
$BO_IsFine= $recordset->
fields["BO_IsFine"]->
value;
$BO_IsPayroll= $recordset->
fields["BO_IsPayroll"]->
value;
$BO_Injuries= $recordset->
fields["BO_Injuries"]->
value;
$BO_Translator= $recordset->
fields["BO_Translator"]->
value;  
$BO_Fine= $recordset->
fields["BO_Fine"]->
value;
$BO_EstimatedLoss= $recordset->
fields["BO_EstimatedLoss"]->
value;
$BO_FinalLoss= $recordset->
fields["BO_FinalLoss"]->
value;

////////////////

//echo "$IncidentID";
////////////////

}
else
{
	//echo "$IncidentID";
$errMessage = "Invalid Request ID !!!";
}
}
catch(Exception $e)
{
$errMessage = "Incorrect Request ID !!!";
}
//echo $errMessage;
if($errMessage != "")
{
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>
      James River Grounds Management
    </title>
    
  </head>
  <body>
	<table width='400' height='200' border='0'  align='center' style="margin-top:200px; border-style: solid;  border-width: 5px; border-color:#9999CC; border-radius:25px;">
      <tr>
        <td style="text-align: center; font-size:24px; font-weight:500; color:#9933FF">
          <strong>
            <?php echo $errMessage; ?>
          </strong>
        </br>
      
    </td>
  </tr>
</table>
</body>

</html>
<?php
return false;
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>
      James River Grounds Management
    </title>
    <script src="js/Jquery1.9.1.min.js" type="text/javascript">
    </script>
    <script src="js/Jquerybvalidator.js" type="text/javascript">
    </script>
    <script src="js/jquery.mask.js" type="text/javascript">
    </script>
    <script src="js/JavaScript2.js" type="text/javascript">
    </script>
    <link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/date.css" rel="stylesheet" />
    <script type="text/javascript">
      $(document).ready(function () {
        $('#myform').bValidator();
      }
                       );
    </script>
    <script type="text/javascript">
      $(function () {
        //$("#date").datepicker();
        //$("#today_Date").datepicker();
        //$("#Report_date").datepicker();
        
      }
       );
    </script>
    <script type="text/javascript">
      $(function () {
        $("#tel").mask("(999) 999-9999");
        
        
      }
       );
    </script>
    
  </head>
  
  <body style="margin-top:0">
    <form action="" method="POST" id="myform" class="vehicle_inventory" enctype="multipart/form-data">
      <div id="centrecontent">
        <!--centre content goes here -->
        <div class="centrecontent_inner">
          <div class="header">
            Incident Report&#8212;For Office Use Only
          </div>
          
          <div class="spacer20">
          </div>
          
          <table width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              
              <td valign="top">
                <table width="99%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top">
                      <table width="95%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="performance">ID</td>
                          <td class="performance"> <?php echo $IR_ID ?></td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Date
                          </td>
                          <td class="performance">
                            <?php echo $incidentRpt_Date ?>
                            <input  type="hidden" id="hdincidentRpt_Date" name="hdincidentRpt_Date" value=" <?php echo $incidentRpt_Date ?>"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Time
                          </td>
                          <td class="performance">
                            <?php  echo  $IncidentTime ?>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Location
                          </td>
                          <td class="performance">
                            <?php   echo  $Location ?>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Branch
                          </td>
                          <td class="performance">
                            <?php echo $Branch ?>
                          </td>
                        </tr>
                        
                        <tr>
                          <td class="performance">
                            Employee
                          </td>
                          <td class="performance">
                            <?php  echo  $Employee ?>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <td valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="performance"> Supervisor </td>
                          <td class="performance"><?php  echo $Supervisor ?></td>
                        </tr>
                        <tr>
                          <td class="performance"> Position </td>
                          <td class="performance"><?php  echo $Position ?></td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Vehicle Number
                          </td>
                          <td class="performance">
                            <?php  echo $VehicleNumber ?>
                            <input  type="hidden" id="hdVehicleNumber" name="hdVehicleNumber" value=" <?php echo $VehicleNumber ?>"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            License Number
                          </td>
                          <td class="performance">
                            <?php  echo $LicenseNo ?>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Reported To
                          </td>
                          <td class="performance">
                            <?php echo $ReportedTo ?>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Reported Date
                          </td>
                          <td class="performance">
                            <?php echo $ReportedDate ?>
                          </td>
                        </tr>
                        
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="performance">
                      <p>
                        <strong>
                          Nature of Incident &amp; Damage. Please be Specific:
                        </strong>
                      </p>
                      <p>
                        <?php echo $NatureOfIncident   ?>
                        
                      </p>
                    </td>
                  </tr>
                </table>
                <table width="99%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="performance">
                      <p>
                        <strong>
                          Other Vehicle Information
                        </strong>
                      </p>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Name of Owner
                          </td>
                          <td class="performance">
                            <?php echo $OwnerName ?>
                          </td>
                          <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Phone Number
                          </td>
                          <td class="performance">
                            <?php echo $OwnerPhoneNo ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            License Number
                          </td>
                          <td class="performance">
                            <?php echo $OwnerLicenseNo ?>
                          </td>
                          <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Type of Vehicle
                          </td>
                          <td align="left" class="vehicle_inventory">
                            <?php echo $OwnerTypeOfVehicle ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Address
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <?php echo $OwnerAddress ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Description of Damage
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <?php echo $DamegeDesc ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Insurance Information
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <?php echo $InsuranceInfo ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Immediate Action Taken
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <?php echo $ImmActionTaken ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Employee Statement
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            
                            
         <input type="text" name="Employee_statement" id="Employee_statement" size="24"  value="
<?php echo $EmployeeStatement ?>
" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Witness Statement
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <?php echo $WitnessStatement ?>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Status
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
							<select name="status"	id="status" style="width: 250px;" data-bvalidator-msg="Please select status">
				            	<option  value="Open" <?php if($BO_Status=="Open"){echo "selected";} ?>>Open</option>
				            	<option value="Close" <?php if($BO_Status=="Close"){echo "selected";} ?>>Closed</option>
                                <option value="Pending" <?php if($BO_Status=="Pending"){echo "selected";} ?>>Pending</option>
				            </select>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </table>
            
          </td>
        </tr>
      </table>
      
      <p>&nbsp;
        
      </p>
      
      <table width="95%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="performance">
            Drug Test
          </td>
          <td class="performance">
            <div class="radio">
              <input id="dt_Y" type="radio" name="dt" value="Y" 
              <?php if($BO_DrugTest=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="dt_Y">
                Yes
              </label>
              <input id="dt_N" type="radio" name="dt" value="N"  
              <?php if($BO_DrugTest=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="dt_N">
                No
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Were there any injuries? If so, a separate 
            <a href="injury.php">
              injury report
            </a>
            will need to be filed.
          </td>
          <td class="performance">
            
			<div class="radio">
              <input id="Inj_Y" type="radio" name="Injuries" value="Y"  
              <?php if($BO_Injuries=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="Inj_Y">
                Yes
              </label>
              <input id="Inj_N" type="radio" name="Injuries" value="N"  
              <?php if($BO_Injuries=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="Inj_N">
                No
              </label>
            </div>

          </td>
        </tr>
        <tr>
          <td class="performance">
            Was accident the result of bypassed safety features or improper work technique?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="su_Y" type="radio" name="su" value="Y"  
              <?php if($BO_SafetyUsed=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="su_Y">
                Yes
              </label>
              <input id="su_N" type="radio" name="su" value="N" 
              <?php if($BO_SafetyUsed=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="su_N">
                No
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Filed a claim with JRGM insurance provider?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="wcc_Y" type="radio" name="wcc" value="Y" 
              <?php if($BO_WorkerComp=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="wcc_Y">
                Yes
              </label>
              <input id="wcc_N" type="radio" name="wcc" value="N" 
              <?php if($BO_WorkerComp=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="wcc_N">
                No
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Total Value of Loss - Estimated
          </td>
          <td class="performance">
            <input type="text" name="EstimatedLoss" id="EstimatedLoss" size="24"  value="
<?php echo $BO_EstimatedLoss ?>
"  />
          </td>
        </tr>
        <tr>
          <td class="performance">
            Total Value of Loss - Final
          </td>
          <td class="performance">
            <input type="text" name="FinalLoss" id="FinalLoss" size="24"  value="
<?php echo $BO_FinalLoss ?>
"  />
          </td>
        </tr>
        <tr>
          <td class="performance">
            Will loss result in a fine?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="if_Y" type="radio" name="if" value="Y" 
              <?php if($BO_IsFine=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="if_Y">
                Yes
              </label>
              <input id="if_N" type="radio" name="if" value="N" 
              <?php if($BO_IsFine=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="if_N">
                No
              </label>
            </div>
          </td>
        </tr>
        <tr id="fineblock" 
        <?php if($BO_IsFine=="Y"){ echo "style='display: block;'";} else{ echo "style='display: none;'"; } ?>
          >
          <td class="performance">
            Dollar Amount of Fine
          </td>
          <td class="performance">
            <input type="text" name="Fine" id="Fine" size="24"  value="
<?php echo $BO_Fine ?>
" />
          </td>
        </tr>
        <tr>
          <td class="performance">
            Payroll Deduction or Cash?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="pdc_Y" type="radio" name="pdc" value="Y" 
              <?php if($BO_IsPayroll=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="pdc_Y">
                Payroll Deduction
              </label>
              <input id="pdc_N" type="radio" name="pdc" value="N" 
              <?php if($BO_IsPayroll=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="pdc_N">
                Cash
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Translator
          </td>
          <td class="performance">
            <input type="text" name="Translator_Name" id="Translator_Name"  value="
<?php echo $BO_Translator ?>
" size="24" />
          </td>
        </tr>
        <tr>
               <td colspan="2">
               	<table>
               		<tr>
									<td nowrap="nowrap" class="vehicle_inventory">Upload Photos</td>
									<td colspan="3" align="left" class="vehicle_inventory">
									<?php
		
									//if ($_SERVER['REQUEST_METHOD'] == 'POST')
									//{
										$conn = new COM ("ADODB.Connection");
										$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
										$conn->open($connStr); //Open the connection to the database
										
										
										$sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and VehicleNo='$VehicleNumber'";
										
										$recordsetImgList->open($sql_Select, $conn, 3);	  
										
										
										$ImageCnt = 1;
										if(!$recordsetImgList->EOF)
										{
									?>
											<table border=""  style="width: 63.5%; margin: 5px;">
											
											<tr>
											
											<th width="100px">S No</th>
											<th width="200px">Image Name</th>
											<th>Image </th>
											</tr>
											<?php
											$tempFile="";
											$fileextension="";
											
											$recordsetImgList->movefirst();
											while (!$recordsetImgList->EOF)
											{ //will automatically return false when out of records
											?>
												<tr>
												<td> <?php echo $ImageCnt; ?> </td>
												<td> <?php echo $recordsetImgList->fields["ImageName"]->value; ?> </td>
												<td> 
												<?php 
												$tempFile = explode(".", $recordsetImgList->fields["ImageName"]->value);
												$fileextension = end($tempFile);
												//echo($fileextension);
												if($fileextension=="pdf"||$fileextension=="PDF")
												{
													?>
													
													<a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>"  >
													<img src="images/pdf.jpg" width="50px" height="50px" style="text-align:center" />	
													</a>
													<?php
												}
												else
												{
													?>
													<img src="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" width="50px" height="50px" style="text-align:center" />
													<?php
												}
												 ?>
												 </td></tr>
												<?php
												//$ImageList=$recordsetImgList->fields["Incident_ImgID"]->value.'---'. $recordsetImgList->fields["ImageName"]->value."</br>";
												//echo $ImageList;
												$recordsetImgList->MoveNext(); 
												$ImageCnt = $ImageCnt +1;
											}
											?>
									</table>
									<?php
										}
									//}
									?>	
									
									<input type="file" name="file" id="file" size="35">
									
									<input type="submit" name="uploadimg" value="Upload Photos"><?php echo $show; ?></td>

               		</tr>
               	</table>
               </td>
		</tr>
      </table>
    </td>
  </tr>
</table>


<div class="spacer20">
</div>
<table width="99%" border="0" cellpadding="0" cellspacing="0">
  
</table>
<div class="spacer20">
</div>
<div align="right">
  <input type="submit" value="Submit" id="btnSumit" name="btnSumit"/>
</div>
</div>
</div>

</form>
</body>
</html>
<script type="text/javascript">
  $(document).ready(function(){
    $('input[name="if"]').click(function(){
      if($(this).attr("value")=="Y"){
        $("#fineblock").show();
      }
      else
      {
        $("#fineblock").hide();
      }
    }
                               );
  }
                   );
</script>

<?php
}
?>