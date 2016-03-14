<?php      

$myServer = "76.12.221.204";
$myUser = "jrgm";
$myPass = "webre3abr";
$myDB = "jrgm"; 
//$myServer = "server\sqle2008";
//$myUser = "sa";
//$myPass = "sa@2008";
//$myDB = "jrgm"; 


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

$connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
$conn->
open($connStr); //Open the connection to the database
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
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

$IncidentID = $_GET['id']; 

$sql_Select="";
$sql_Select="Select * from Form_IncidentReport where incidentRpt_ID='".  $IncidentID ."'";



$sql = "UPDATE Form_IncidentReport 
SET BO_Status='$BO_Status', BO_DrugTest ='$BO_DrugTest', BO_WorkerComp='$BO_WorkerComp', BO_SafetyUsed='$BO_SafetyUsed', 
BO_IsFine='$BO_IsFine', BO_IsPayroll='$BO_IsPayroll', BO_Translator='$BO_Translator', BO_Fine='$BO_Fine', BO_EstimatedLoss='$BO_EstimatedLoss', BO_FinalLoss='$BO_FinalLoss',BO_Update='Complete', BO_Injuries='$BO_Injuries' WHERE incidentRpt_ID = '$IncidentID' ";

//echo $sql;


$conn->
execute($sql);


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
else
{
$IncidentID = $_GET['id']; 

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



}
else
{//echo "$IncidentID";
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
    <form action="" method="POST" id="myform" class="vehicle_inventory" >
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
                            <?php echo $EmployeeStatement ?>
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
				            	<option value="Close" <?php if($BO_Status=="Close"){echo "selected";} ?>>Close</option>
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
              <input id="dt_Y" type="radio" name="dt" checked="checked"  value="Y" 
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
              <input id="su_Y" type="radio" name="su" checked="checked" value="Y"  
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
              <input id="wcc_Y" type="radio" name="wcc" checked="checked" value="Y" 
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
              <input id="if_Y" type="radio" name="if" checked="checked" value="Y" 
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
              <input id="pdc_Y" type="radio" name="pdc" checked="checked" value="Y" 
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