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
$conn->
open($connStr); //Open the connection to the database
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
$BO_Status=$_POST['status'];
$BO_DrugTest = $_POST['BO_DrugTest'];
$BO_MedicalReq = $_POST['BO_MedicalReq'];
$BO_AccInv = $_POST['BO_AccInv'];
$BO_Hospitalized = $_POST['BO_Hospitalized'];
$BO_WorkerComp = $_POST['BO_WorkerComp'];
$BO_WorkerCompNo = $_POST['BO_WorkerCompNo'];
$BO_Restrictions = $_POST['BO_Restrictions'];
$BO_ListRestrictions = $_POST['BO_ListRestrictions'];
$BO_LightDuty = $_POST['BO_LightDuty'];
$BO_Facility = $_POST['BO_Facility'];
$BO_Physician = $_POST['BO_Physician'];
$NatureOfInjury = $_POST['NatureOfInjury'];
$hdRptDate = trim($_POST['hdInjuryRpt_Date']);
$HarmObject = trim($_POST['HarmObject']);
$ImmActionTaken = trim($_POST['Action_taken']);
$EmployeeStatement = trim($_POST['Employee_statement']);
$WitnessStatement = trim($_POST['Witness_statement']);
$EmployeeAddress = trim($_POST['EmployeeAddress']);
$EmpDOB = trim($_POST['EmpDOB']);
$EmployeePhoneNo = trim($_POST['EmployeePhoneNo']);
$EmpDOH = trim($_POST['EmpDOH']);
$DutiesTOAYes = trim($_POST['DutiesTOAYes']);
$Explain = trim($_POST['Explain']);
$SafetyFeature = trim($_POST['SafetyFeature']);
$PanelofPhysicians = trim($_POST['PanelofPhysicians']);
$MedicalReleaseForm = trim($_POST['MedicalReleaseForm']);
$DutiesTOA = trim($_POST['DutiesTOA']);
$AccidentPrev = trim($_POST['AccidentPrev']);
$EmployeeSex = trim($_POST['EmployeeSex']);
   $InjuryID = $_GET['id']; 

//echo("image upload");		
if (isset($_POST['btnSumit'])) {
$sql_Select="";
$sql_Select="Select * from Form_InjuryReport where InjuryRpt_ID='".  $InjuryID ."'";



$sql = "UPDATE Form_InjuryReport 
SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_MedicalReq='$BO_MedicalReq', BO_AccInv='$BO_AccInv', 
BO_Hospitalized='$BO_Hospitalized', BO_WorkerComp='$BO_WorkerComp', BO_WorkerCompNo='$BO_WorkerCompNo', BO_Restrictions='$BO_Restrictions', BO_ListRestrictions='$BO_ListRestrictions', BO_LightDuty='$BO_LightDuty', BO_Facility='$BO_Facility', BO_Physician='$BO_Physician'
,BO_Update='Complete',NatureOfInjury='$NatureOfInjury' , HarmObject='$HarmObject' , ImmActionTaken='$ImmActionTaken' , EmployeeStatement='$EmployeeStatement' , WitnessStatement='$WitnessStatement' , EmployeeAddress='$EmployeeAddress' , EmpDOB='$EmpDOB' , EmployeePhoneNo='$EmployeePhoneNo' , EmpDOH='$EmpDOH' ,  DutiesTOAYes='$DutiesTOAYes', Explain='$Explain',SafetyFeature='$SafetyFeature',PanelofPhysicians='$PanelofPhysicians',MedicalReleaseForm='$MedicalReleaseForm',DutiesTOA ='$DutiesTOA',AccidentPrev='$AccidentPrev',EmployeeSex='$EmployeeSex'
 WHERE InjuryRpt_ID = '$InjuryID' ";




$conn->execute($sql);
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
	<table width='400' height='120' border='0'  align='center' style="margin-top:200px; border-style: solid;  border-width: 3px; border-color:#00573d; border-radius:5px;">
      <tr>
        <td style="text-align: center; font-size:16px; font-weight:300;  font-family: Arial,sans-serif; color:#00573d">
          <strong>
            Thank you. <br />
          Your Injury Report form has been saved.<br />
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
//echo $hdRptDate."<--------------".$InjuryID;
	 if (isset($ImageName) )
		{
 			$sql_Select = "Select count(Injury_ImgID) as ImageCount from Form_InjuryReportImageDetails where Injury_Date='$hdRptDate' and InjuryRpt_ID='$InjuryID'";
   //echo $sql_Select."<br/>";
   $recordsetImg-> open($sql_Select, $conn, 3);
   if (!$recordsetImg-> EOF) {
	   $recordsetImg->   movefirst();
	   $ImageCount = $recordsetImg->   fields["ImageCount"]->   value + 1;
   }
   /*
   $datetime = new DateTime($incidentRpt_Date);
   $datetime->
   createFromFormat('m/d/Y', $incidentRpt_Date);
   $varstring       = $datetime->
   format('mdy');
   $sql_Insertimage = explode(".", $_FILES["file"]["name"]);
   $ImageName       = $varstring . '_' . $VehicleNumber . '_' . $ImageCount . '.' . $sql_Insertimage[1];
   */
//echo "enter"."<br/>";
	$varstring = str_replace('/', '', $hdRptDate);
	//echo "123"."<br/>";
	$sql_Insertimage=explode(".", $_FILES["file"]["name"]);
	//echo "456"."<br/>";
	$ImageName       = $varstring . '_' . $ImageCount . '.' . $sql_Insertimage[1];
	//echo "789"."<br/>";
   $sql_Insertimage = " ";
   $sql_Insertimage = "INSERT INTO Form_InjuryReportImageDetails( [Injury_Date],[ImageName],[CreatedDate],[InjuryRpt_ID])
   values('$hdRptDate','$ImageName','$currentDate','$InjuryID')";
   $conn->   execute($sql_Insertimage);
	 	
	 	//echo $sql_Insertimage;
	 	
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

$InjuryID = $_GET['id']; 

//echo "injury id : ". $InjuryID;

$sql_Select="";
$sql_Select="Select * from Form_InjuryReport where InjuryRpt_ID='".$InjuryID."'";
//echo $sql_Select;
try
{
$recordset->open($sql_Select, $conn, 3);

$errMessage = "";

$Inspection_Id=0;
if(!$recordset->EOF){
$recordset->movefirst();
$IR_ID= $recordset->fields["IR_ID"]->value;
$InjuryID= $recordset->fields["InjuryRpt_ID"]->value;
$InjuryRpt_Date= $recordset->fields["InjuryRpt_Date"]->value; 
$InjuryTime= $recordset->fields["InjuryTime"]->value;
$Location= $recordset->fields["Location"]->value;
$Branch= $recordset->fields["Branch"]->value;
$Employee= $recordset->fields["Employee"]->value;
$ReportedTo= $recordset->fields["ReportedTo"]->value;
$Position= $recordset->fields["Position"]->value;
$ReportedDate= $recordset->fields["ReportedDate"]->value;
$BeganTime= $recordset->fields["BeganTime"]->value;
$Supervisor= $recordset->fields["Supervisor"]->value;
$NatureOfInjury= $recordset->fields["NatureOfInjury"]->value;
$HarmObject= $recordset->fields["HarmObject"]->value;
$ImmActionTaken= $recordset->fields["ImmActionTaken"]->value;
$EmployeeStatement= $recordset->fields["EmployeeStatement"]->value;
$WitnessStatement= $recordset->fields["WitnessStatement"]->value;
$EmployeePhoneNo= $recordset->fields["EmployeePhoneNo"]->value;
$EmployeeAddress= $recordset->fields["EmployeeAddress"]->value;
$EmpDOB= $recordset->fields["EmpDOB"]->value;
$EmployeeSex= $recordset->fields["EmployeeSex"]->value;
$EmpDOH= $recordset->fields["EmpDOH"]->value;
$SafetyFeature= $recordset->fields["SafetyFeature"]->value;
$PanelofPhysicians= $recordset->fields["PanelofPhysicians"]->value;
$MedicalReleaseForm= $recordset->fields["MedicalReleaseForm"]->value;
$DutiesTOA= $recordset->fields["DutiesTOA"]->value;
$DutiesTOAYes= $recordset->fields["DutiesTOAYes"]->value;
$AccidentPrev= $recordset->fields["AccidentPrev"]->value;
$Explain= $recordset->fields["Explain"]->value;
$BO_Status= $recordset->fields["BO_Status"]->value;	
$BO_MedicalReq= $recordset->fields["BO_MedicalReq"]->value;
$BO_DrugTest= $recordset->fields["BO_DrugTest"]->value;
$BO_AccInv= $recordset->fields["BO_AccInv"]->value;
$BO_Hospitalized= $recordset->fields["BO_Hospitalized"]->value;
$BO_WorkerComp= $recordset->fields["BO_WorkerComp"]->value;
$BO_WorkerCompNo= $recordset->fields["BO_WorkerCompNo"]->value;
$BO_Restrictions= $recordset->fields["BO_Restrictions"]->value;
$BO_ListRestrictions= $recordset->fields["BO_ListRestrictions"]->value;
$BO_LightDuty= $recordset->fields["BO_LightDuty"]->value;
$BO_Facility= $recordset->fields["BO_Facility"]->value;
$BO_Physician= $recordset->fields["BO_Physician"]->value;
$NatureOfInjury= $recordset->fields["NatureOfInjury"]->value;

$hdRptDate = $InjuryRpt_Date;
}
else
{//echo "$InjuryID";
$errMessage = "Invalid Request ID !!!";
}
}
catch(Exception $e)
{
echo $e;
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
    <form action="" method="POST" id="myform" class="vehicle_inventory"  enctype="multipart/form-data">
      <div id="centrecontent">
        <!--centre content goes here -->
        <div class="centrecontent_inner">
          <div class="header">
            Injury Report&#8212;For Office Use Only
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
                          <td class="performance">
                            ID
                          </td>
                          <td class="performance">
                            <?php echo $IR_ID ?>
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
                            <?php  echo $Branch ?>
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
                         <tr>
                          <td class="performance">
                            Supervisor
                          </td>
                          <td class="performance">
                            <?php  echo $Supervisor ?>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Position
                          </td>
                          <td class="performance">
                            <?php  echo $Position ?>
                          </td>
                        </tr>
						                      
                      </table>
                    </td>
                    <td valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                       <tr>
                          <td class="performance">
                            Date
                         </td>
                          <td class="performance">
                            <?php echo $InjuryRpt_Date ?>
                            <input  type="hidden" id="hdInjuryRpt_Date" name="hdInjuryRpt_Date" value=" <?php echo $InjuryRpt_Date ?>"/>
                         </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Time
                          </td>
                          <td class="performance">
                            <?php  echo  $InjuryTime ?>
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
                        <tr>
                          <td class="performance">
                            Time Employee Began Work
                          </td>
                          <td class="performance">
                            <?php echo $BeganTime ?>
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
                          Nature of Injury or Illness. Please be Specific:
                        </strong>
                      </p>
                      <p>
                        <textarea name="NatureOfInjury" id="NatureOfInjury" cols="75" rows="5"><?php echo $NatureOfInjury;?></textarea>
                      
                      </p>
					  <p>
                        <strong>
                          What Object Directly Caused Harm to Employee:
                        </strong>
                      </p>
                      <p>
                        <textarea name="HarmObject" id="HarmObject" cols="75" rows="5"><?php echo $HarmObject;?></textarea>
                      </p>
					  <p>
                        <strong>
                          Immediate Action Taken:
                        </strong>
                      </p>
                      <p>
                       <textarea name="Action_taken" id="Action_taken" cols="75" rows="5" ><?php echo $ImmActionTaken;?></textarea>
                      </p>
					  <p>
                        <strong>
                          Employee Statement:
                        </strong>
                      </p>
                      <p>
                        <textarea name="Employee_statement" id="Employee_statement" cols="75" rows="5"><?php echo $EmployeeStatement;?></textarea>
                      </p>
					  <p>
                        <strong>
                          Witness Statement:
                        </strong>
                      </p>
                      <p>
                        <textarea name="Witness_statement" id="Witness_statement" cols="75" rows="5"><?php echo $WitnessStatement;?></textarea>
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
                            Employee Address
                          </td>
                          <td class="performance" colspan="3">
                           <input name="EmployeeAddress" type="text" id="EmployeeAddress" size="75" value="<?php echo $EmployeeAddress;?>" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Date of Birth
                          </td>
                          <td class="performance">
                           <input type="text" name="EmpDOB" id="EMPDOB" size="24" value="<?php echo $EmpDOB;?>" />
                          </td>
                          <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Phone Number
                          </td>
                          <td align="left" class="vehicle_inventory">
                            <input type="text" name="EmployeePhoneNo" id="EmployeePhoneNo" size="24" value="<?php echo $EmployeePhoneNo;?>" />
                          </td>
                        </tr>
                        <tr>
                         <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Employee Gender
                          </td>
                          <td  colspan="3" nowrap="nowrap" class="vehicle_inventory">
                          
                          
                             <div class="radio">
              <input id="EmployeeSex_Y" type="radio" name="EmployeeSex" value="Y" 
              <?php if($EmployeeSex=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="EmployeeSex_Y">
                Male
              </label>
              <input id="EmployeeSex_N" type="radio" name="EmployeeSex" value="N"  
              <?php if($EmployeeSex=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="EmployeeSex_N">
                Female
              </label>
            </div>
                           </td>
                        
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Date of Hire
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <input type="text" name="EmpDOH" id="EMPDOH" size="24" value="<?php echo $EmpDOH;?>" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Were safety features bypassed?
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">   
                           <div class="radio">
              <input id="SafetyFeature_Y" type="radio" name="SafetyFeature" value="Y" 
              <?php if($SafetyFeature=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="SafetyFeature_Y">
                Yes
              </label>
              <input id="SafetyFeature_N" type="radio" name="SafetyFeature" value="N"  
              <?php if($SafetyFeature=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="SafetyFeature_N">
                No
              </label>
            </div>
                           </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Was employee given information on Panel of Physicians?
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                             <div class="radio">
              <input id="PanelofPhysicians_Y" type="radio" name="PanelofPhysicians" value="Y" 
              <?php if($PanelofPhysicians=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="PanelofPhysicians_Y">
                Yes
              </label>
              <input id="PanelofPhysicians_N" type="radio" name="PanelofPhysicians" value="N"  
              <?php if($PanelofPhysicians=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="PanelofPhysicians_N">
                No
              </label>
            </div>
                           </td>
                        </tr>
						<tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Was employee given a medical release form?
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                          
                            <div class="radio">
              <input id="MedicalReleaseForm_Y" type="radio" name="MedicalReleaseForm" value="Y" 
              <?php if($MedicalReleaseForm=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="MedicalReleaseForm_Y">
                Yes
              </label>
              <input id="MedicalReleaseForm_N" type="radio" name="MedicalReleaseForm" value="N"  
              <?php if($MedicalReleaseForm=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="MedicalReleaseForm_N">
                No
              </label>
            </div>
                           </td>
                        </tr>
						<tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Was employee doing something other than required duties at time of accident? 
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                          
                             <div class="radio">
              <input id="DutiesTOA_Y" type="radio" name="DutiesTOA" value="Y" 
              <?php if($DutiesTOA=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="DutiesTOA_Y">
                Yes
              </label>
              <input id="DutiesTOA_N" type="radio" name="DutiesTOA" value="N"  
              <?php if($DutiesTOA=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="DutiesTOA_N">
                No
              </label>
            </div>
            
                            
                          </td>
                        </tr>
						<tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            If so, what and why?
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                            <textarea name="DutiesTOAYes" id="DutiesTOAYes" rows="3" cols="45"><?php echo $DutiesTOAYes;?></textarea>
                          </td>
                        </tr>
						<tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Could this accident have been prevented?
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                           <div class="radio">
              <input id="AccidentPrev_Y" type="radio" name="AccidentPrev" value="Y" 
              <?php if($AccidentPrev=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="AccidentPrev_Y">
                Yes
              </label>
              <input id="AccidentPrev_N" type="radio" name="AccidentPrev" value="N"  
              <?php if($AccidentPrev=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="AccidentPrev_N">
                No
              </label>
            </div>
                           </td>
                        </tr>
						<tr>
                          <td nowrap="nowrap" class="vehicle_inventory" colspan="2">
                            Please explain
                          </td>
                          <td colspan="2" align="left" class="vehicle_inventory">
                            <textarea name="Explain" id="Explain" rows="3" cols="45" ><?php echo $Explain?></textarea>
                            
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
            What were medical requirement of injury?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_MedicalReq_FA" type="radio" name="BO_MedicalReq" value="FA" 
              <?php if($BO_MedicalReq=="FA"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_MedicalReq_FA">
                First Aid
              </label>
              <input id="BO_MedicalReq_ER" type="radio" name="BO_MedicalReq" value="ER"  
              <?php if($BO_MedicalReq=="ER"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_MedicalReq_ER">
                ER
              </label>
			  <input id="BO_MedicalReq_ME" type="radio" name="BO_MedicalReq"  value="ME" 
              <?php if($BO_MedicalReq=="ME"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_MedicalReq_ME">
                Med Express
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Was employee drug tested?
          </td>
          <td class="performance">
          
           <div class="radio">
              <input id="BO_DrugTest_Y" type="radio" name="BO_DrugTest" value="Y" 
              <?php if($BO_DrugTest=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_DrugTest_Y">
                Yes
              </label>
              <input id="BO_DrugTest_N" type="radio" name="BO_DrugTest" value="N"  
              <?php if($BO_DrugTest=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_DrugTest_N">
                No
              </label>
            </div>
          
          
          
          
          
          
          
          
          
          </td>
        </tr>
        <tr>
          <td class="performance">
            Was there a complete accident investigation?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_AccInv_Y" type="radio" name="BO_AccInv" value="Y" 
              <?php if($BO_AccInv=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_AccInv_Y">
                Yes
              </label>
              <input id="BO_AccInv_N" type="radio" name="BO_AccInv" value="N"  
              <?php if($BO_AccInv=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_AccInv_N">
                No
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <td class="performance">
            Was employee hospitalized?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_Hospitalized_Y" type="radio" name="BO_Hospitalized" value="Y" 
              <?php if($BO_Hospitalized=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_Hospitalized_Y">
                Yes
              </label>
              <input id="BO_Hospitalized_N" type="radio" name="BO_Hospitalized" value="N"  
              <?php if($BO_Hospitalized=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_Hospitalized_N">
                No
              </label>
            </div>
          </td>
        </tr>
		<tr>
          <td class="performance">
            Was report sent to Workers Comp Carrier?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_WorkerComp_Y" type="radio" name="BO_WorkerComp" value="Y" 
              <?php if($BO_WorkerComp=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_WorkerComp_Y">
                Yes
              </label>
              <input id="BO_WorkerComp_N" type="radio" name="BO_WorkerComp" value="N"  
              <?php if($BO_WorkerComp=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_WorkerComp_N">
                No
              </label>
            </div>
          </td>
        </tr>
		<tr>
          <td class="performance">
            Workers Comp Case Number
          </td>
          <td class="performance">
            <input type="text" name="BO_WorkerCompNo" id="BO_WorkerCompNo"  value="<?php echo $BO_WorkerCompNo ?>" size="24" />
          </td>
        </tr>
		<tr>
          <td class="performance">
            Are there any work restrictions?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_Restrictions_Y" type="radio" name="BO_Restrictions" value="Y" 
              <?php if($BO_Restrictions=="Y"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_Restrictions_Y">
                Yes
              </label>
              <input id="BO_Restrictions_N" type="radio" name="BO_Restrictions" value="N"  
              <?php if($BO_Restrictions=="N"){echo "checked=\"checked\" ";} ?>
              />
              <label for="BO_Restrictions_N">
                No
              </label>
            </div>
          </td>
        </tr>
		<tr id="restblock" <?php if(trim($BO_Restrictions)=="N"){ echo "style='display: none;'";} ?>>
          <td class="performance">
            List restrictions
          </td>
          <td class="performance">
            <textarea name="BO_ListRestrictions" id="BO_ListRestrictions" rows="5" cols="45"><?php echo $BO_ListRestrictions ?></textarea>
          </td>
        </tr>
		<tr>
          <td class="performance">
            Is employee on light duty?
          </td>
          <td class="performance">
            <div class="radio">
              <input id="BO_LightDuty_Y" type="radio" name="BO_LightDuty" value="Y" 
              <?php if($BO_LightDuty=="Y"){echo "checked=\"checked\" ";} ?> />
              <label for="BO_LightDuty_Y">
                Yes
              </label>
              <input id="BO_LightDuty_N" type="radio" name="BO_LightDuty" value="N" <?php if($BO_LightDuty=="N"){echo "checked=\"checked\" ";} ?> />
              <label for="BO_LightDuty_N">
                No
              </label>
            </div>
          </td>
        </tr>
		<tr>
          <td class="performance">
            <strong>Medical Treatment</strong>	
          </td>
          <td class="performance">&nbsp;
            
          </td>
        </tr>
		<tr>
          <td class="performance">
            Facility Name & Address:
          </td>
          <td class="performance">
            <textarea name="BO_Facility" id="BO_Facility" rows="5" cols="45"><?php echo $BO_Facility ?></textarea>
          </td>
        </tr>
		<tr>
          <td class="performance">
            Name of Physician
          </td>
          <td class="performance">
            <input type="text" name="BO_Physician" id="BO_Physician"  value="<?php echo $BO_Physician ?>" size="50" />
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
										$sql_Select = "Select * from Form_InjuryReportImageDetails where Injury_Date='$hdRptDate' and InjuryRpt_ID='$InjuryID'";
										$recordsetImgList->open($sql_Select, $conn, 3);	  
										
										//echo($sql_Select);
										//echo "Total Employee".$recordset_Employee->RecordCount;
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
<table cellpadding="0" cellspacing="0" width="35%">
<tr>  
<td><input type="submit" value="Save" id="btnSumit" name="btnSumit"/></td>
<td><img src="images/clear.gif" width="60" height="1" /></td>
<td><input type="submit" value="Save Form as PDF" id="btnSumit" name="btnSumit" /></td>
</tr></table>
</div>




</div>
</div>

</form>
</body>
</html>
<script type="text/javascript">
  $(document).ready(function(){
    $('input[name="BO_Restrictions"]').click(function(){
      if($(this).attr("value")=="Y"){
        $("#restblock").show();
      }
      else
      {
        $("#restblock").hide();
      }
    }
                               );
  }
                   );
</script>

<?php
}
?>

