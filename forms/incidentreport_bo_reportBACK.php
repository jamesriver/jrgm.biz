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
                            <input  type="text" id="VehicleNumber" name="VehicleNumber" value="<?php echo $VehicleNumber ?>"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            License Number
                          </td>
                          <td class="performance">
                           <input type="text" name="License_Number" id="License_Number" size="24" value="<?php echo $LicenseNo ?>"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="performance">
                            Reported To
                          </td>
                          <td class="performance">
                            <input name="Reported_To" type="text" id="Reported_To" size="24" value="<?php echo $ReportedTo ?>"/>
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
                       <textarea name="nid" id="nid" cols="75" rows="5" value="" /><?php echo $NatureOfIncident ?></textarea>
                        
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
                           <input type="text" name="Owner_name" id="Owner_name" size="24" value="<?php echo $OwnerName ?>" />
                          </td>
                          <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Phone Number
                          </td>
                          <td class="performance">
                            <input type="text" name="Phone_number" id="Phone_number" size="24" value="<?php echo $OwnerPhoneNo ?>" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            License Number
                          </td>
                          <td class="performance">
                          <input type="text" name="License_Other" id="License_Other" size="24" value="<?php echo $OwnerLicenseNo ?>" />
                          </td>
                          <td align="left" nowrap="nowrap" class="vehicle_inventory">
                            Type of Vehicle
                          </td>
                          <td align="left" class="vehicle_inventory">
                            <input type="text" name="Vehicle_type" id="Vehicle_type" size="24" value="<?php echo $OwnerTypeOfVehicle ?>" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Address
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <input name="Address" type="text" id="Address" size="50" value="<?php echo $OwnerAddress ?>" />
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Description of Damage
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <textarea name="Damage_description" value="" id="Damage_description" cols="75" rows="5"><?php echo $DamegeDesc ?></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Insurance Information
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                           <textarea name="Insurance" value="" id="Insurance" cols="75" rows="5"><?php echo $InsuranceInfo ?></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Immediate Action Taken
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                           <textarea name="Action_taken" id="Action_taken" cols="75" rows="5"  value="<?php echo $ImmActionTaken ?>" /><?php echo $ImmActionTaken ?></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Employee Statement
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                           <textarea name="Employee_statement" id="Employee_statement" cols="75" rows="5" value="<?php echo $EmployeeStatement ?>"  value="<?php echo $EmployeeStatement ?>"/><?php echo $EmployeeStatement ?></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Witness Statement
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                           <textarea name="Witness_statement" id="Witness_statement" cols="75" rows="5" value="<?php echo $WitnessStatement ?>" /><?php echo $WitnessStatement ?></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap" class="vehicle_inventory">
                            Status
                          </td>
                          <td colspan="3" align="left" class="vehicle_inventory">
                            <select name="status"    id="status" style="width: 250px;" data-bvalidator-msg="Please select status">
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
      
          <p>&nbsp;</p>
      
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
            <input type="text" name="EstimatedLoss" id="EstimatedLoss" size="24"  value="<?php echo $BO_EstimatedLoss ?>"  />
          </td>
        </tr>
        <tr>
          <td class="performance">
            Total Value of Loss - Final
          </td>
          <td class="performance">
            <input type="text" name="FinalLoss" id="FinalLoss" size="24"  value="<?php echo $BO_FinalLoss ?>"  />
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
            <input type="text" name="Fine" id="Fine" size="24"  value="<?php echo $BO_Fine ?>" />
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
                Deduction
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
            <input type="text" name="Translator_Name" id="Translator_Name"  value="<?php echo $BO_Translator ?>" size="24" />
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
                                        if(!$recordsetImgList->EOF) {
                                    ?>
                                            <table border=""  style="width: 23.5%; margin: 5px;">
                                            <tr>
                                                <!--<th width="100px">S No</th>
                                                <th width="200px">Image Name</th>-->
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
                                                <!--<td> <?php echo $ImageCnt; ?> </td>
                                                <td> <?php echo $recordsetImgList->fields["ImageName"]->value; ?> </td>-->
                                                <td align="center"> 
                                                <?php 
                                                $tempFile = explode(".", $recordsetImgList->fields["ImageName"]->value);
                                                $fileextension = end($tempFile);
                                                //echo($fileextension);
                                                if ($fileextension == "pdf" || $fileextension == "PDF") {
                                                ?>
                                                    <a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>"  >
                                                    <img src="images/pdf.jpg" width="50px" height="50px" style="text-align:center" />    
                                                    </a>
                                                <?php
                                                }
                                                else
                                                {
                                                    ?>
                                                    <a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>"  >
                                                    <img src="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" width="50px" height="50px" style="text-align:center" />
                                                    </a>
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
                                    
                                    <input type="file" name="file[]" id="file" size="35" multiple>
                                    <!--<input type="submit" name="uploadimg" value="Upload Photos"><?php echo $show; ?></td>-->
                       </tr>
                   </table>
               </td>
        </tr>
      </table>


      <div class="spacer20"></div>

      <div class="spacer20"></div>
      <div align="right">
        <table cellpadding="0" cellspacing="0" width="35%">
        <tr>  
        <td><input type="submit" value="Save" id="btnSumit" name="btnSumit"/></td>
        <td><img src="images/clear.gif" width="60" height="1" /></td>
        <td><input type="submit" value="Save Form as PDF" id="btnSumit" name="btnSumitPDF" /></td>
        </tr>
        </table>
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
    });
  });
</script>