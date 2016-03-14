<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>James River Grounds Management</title>
    <script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
    <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/JavaScript2.js" type="text/javascript"></script>
    <!--<script src="js/phplivex_uncompressed.js" type="text/javascript"></script> -->
    <link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <!--<link href="css/styles1.css" rel="stylesheet" /> -->
    <link href="css/date.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#myform').bValidator();
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#today_Date").datepicker();//{dateFormat: 'dd-mm-yy'});
            $("#Report_date").datepicker();
            $('#Phone_number').mask('(999) 999-9999');

        });
    </script>
</head>

<body style="margin-top:0">
    <form action="" method="post" id="myform" class="vehicle_inventory" enctype="multipart/form-data" >
            <div id="centrecontent">
                <!--centre content goes here -->
              <div class="centrecontent_inner">
                    <div class="header">Incident Report</div>

                    <div class="spacer20"></div>

                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>

                            <td valign="top">
                                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="performance">Date</td>
                                        <td class="performance"><input type="text" name="today_Date" id="today_Date" size="24" data-bvalidator="required" value="<?php echo $incidentRpt_Date ?>" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Time</td>
                                        <td class="performance">
                                      <input type="time" name="time" id="time" size="24" value="<?php echo $IncidentTime ?>" /></td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Location</td>
                                        <td class="performance">
                                            <input name="Location" type="text" id="Location" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the Location of the Incident" value="<?php echo $Location ?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="performance">Branch</td>
                                        <td class="performance">
                                            <script type="text/javascript" language="javascript">
                                              function __doPostBack() {
                                                var theForm = document.forms['myform'];
                                                if (!theForm) {
                                                    theForm = document.form1;
                                                }
                                                //$("#Branch").val($("option:selected", $("#Supervisor_Id")).attr('branch'));
                                                //$("#Supervisor_Name").val($("option:selected", $("#Supervisor_Id")).text());
                                                if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                                                    theForm.submit();
                                                }
                                            }
                                            
                                            function __doPostBackEmployee() {
                                                //alert('supervisor : '+$("option:selected", $("#Employee_Id")).attr('spvr')+' position'+ $("option:selected", $("#Employee_Id")).attr('pos'))
                                                $("#Employee_ID").val($("option:selected", $("#Employee_Id")).text());
                                                $("#Supervisor_Name").val($("option:selected", $("#Employee_Id")).attr('spvr'));
                                                $("#Position").val($("option:selected", $("#Employee_Id")).attr('pos'));
                                                //alert($("#Supervisor_Name").val());
                                            }
                                          </script>
                                          <select name="Branch_Id" id="Branch_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Select Branch" onchange="javascript:__doPostBack();">
                                          <option value="">--Select Branch--</option>
                                          <?php
                                              while (!$recordset_Branch->EOF) {                                        
                                                $sbranch = $recordset_Branch->fields['branch']->value;
                                                $str = "<option value='$sbranch'";
                                                if (isset($_REQUEST['Supervisor_Id']))
                                                    if ($_REQUEST['Branch_Id'] == $sbranch)
                                                        $str .= "selected='selected'";
                                                echo $str;
                                                echo ">$sbranch";
                                                echo "</option>";
                                                $recordset_Branch->movenext();
                                            }
                                            $str = "<option value='Corporate'";
                                            if (isset($_REQUEST['Supervisor_Id']))
                                                if ($_REQUEST['Branch_Id'] == "Corporate")
                                                    $str .= "selected='selected'";
                                            echo $str;
                                            echo ">Corporate";
                                            echo "</option>";
                                          ?>
                                          </select>
                                          <input type="hidden" name="Branch" id="Branch" size="24" readonly="true" value="<?php echo $Branch ?>"/>
                                      </td>
                                     </tr>
                                     <tr>
                                        <td class="performance">Employee</td>
                                        <td class="performance">
                                            <select name="Employee_Id" id="Employee_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Name" onchange="javascript:__doPostBackEmployee();">
                                            <option value="">--Select Employee--</option>
                                            <?php
                                              while (!$recordset_Employee->EOF) {
                                                $eid = $recordset_Employee->fields['employee_id']->value;
                                                $ename = $recordset_Employee->fields['crew_name']->value;
                                                $Supervisor_Name = $recordset_Employee->fields['SupervisorName']->value;
                                                $Position = $recordset_Employee->fields['Position']->value;
                                                
                                                $str = "<option value='$eid' spvr='$Supervisor_Name' pos='$Position'";
                                                if (isset($_REQUEST['Employee_Id']))
                                                    if ($_REQUEST['Employee_Id'] == $eid)
                                                        $str .= "selected='selected'";
                                                echo $str;
                                                echo ">$ename";
                                                echo "</option>";
                                                $recordset_Employee->movenext();
                                            }
                                            ?>
                                            </select>
                                           
                                            <input type="hidden" name="Employee_ID" id="Employee_ID" value="<?php echo $Employee_ID ?>" />
                                            <input type="hidden" name="Employee_Name" id="Employee_Name" value="<?php echo $Employee ?>" />
                                        </td>
                                    </tr>
                                    <tr>
                                       <td class="performance">Production Manager</td>
                                      <td class="performance">
                                     <input type="hidden" name="Supervisor_Id" id="Supervisor_Id"  size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Position" value="<?php echo $Position ?>"/>
                                      <input type="text" name="Supervisor_Name" id="Supervisor_Name"  value="<?php echo $Supervisor; ?>" />
                                      </td>
                                     </tr>
                                     <tr>
                                       <td class="performance">Position</td>
                                      <td class="performance"><input type="text" name="Position" id="Position"  size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Position" value="<?php echo $Position ?>"/></td>
                                     </tr>
                                </table>
                            </td>
                            <td valign="top">

                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                     <tr>
                                       <td class="performance">Vehicle Number</td>
                                      <td class="performance"><input type="text" name="Vehicle_Number" id="Vehicle_Number" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the Vehicle Number" value="<?php echo $VehicleNumber ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">License Number</td>
                                      <td class="performance"><input type="text" name="License_Number" id="License_Number" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the License Number" value="<?php echo $LicenseNo ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">Reported To</td>
                                      <td class="performance"><input name="Reported_To" type="text" id="Reported_To" size="24"  data-bvalidator="required" data-bvalidator-msg="Who Was the Incident Reported To" value="<?php echo $ReportedTo ?>"/></td>
                                     </tr>
                                     <tr>
                                       <td class="performance">Reported Date</td>
                                      <td class="performance"><input type="text" name="Report_date" id="Report_date" size="24"  data-bvalidator="required"  value="<?php echo $ReportedDate ?>"/></td>
                                     </tr>
                                     <!--tr>
                                       <td class="performance">Branch</td>
                                      <td class="performance"></td>
                                     </tr-->
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
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                      <td class="performance"><p><strong>Nature of Incident &amp; Damage. Please be Specific:</strong></p>
                                      <p>
                                        <textarea name="nid" id="nid" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Nature of the Incident and Damage." value="" /><?php echo $NatureOfIncident ?></textarea>
                                      </p></td>
                                </tr>
                              </table>
                          </td>
                    </tr>
                              </table>
                          
                      
                  
                <div class="spacer20"></div>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top"><table width="99%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                               <td class="performance"><p><strong>Other Vehicle Information</strong></p></td></tr>
                                <tr>
                                  <td>
                                     
                                     <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Name of Owner</td>
                                    <td class="performance"><input type="text" name="Owner_name" id="Owner_name" size="24" value="<?php echo $OwnerName ?>" /></td>
                                    <td align="left" nowrap="nowrap" class="vehicle_inventory">Phone Number</td>
                                    <td class="performance"><input type="text" name="Phone_number" id="Phone_number" size="24" value="<?php echo $OwnerPhoneNo ?>" /></td>                                  
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">License Number</td>
                                    <td class="performance"><input type="text" name="License_Other" id="License_Other" size="24" value="<?php echo $OwnerLicenseNo ?>" /></td>
                                    <td align="left" nowrap="nowrap" class="vehicle_inventory">Type of Vehicle</td>
                                    <td align="left" class="vehicle_inventory">
                                        <input type="text" name="Vehicle_type" id="Vehicle_type" size="24" value="<?php echo $OwnerTypeOfVehicle ?>" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Address</td>
                                    <td colspan="3" align="left" class="vehicle_inventory"><input name="Address" type="text" id="Address" size="50" value="<?php echo $OwnerAddress ?>" /></td>
                                    </tr>
                                     <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Insurance Information</td>

                                    <td colspan="3" align="left" class="vehicle_inventory"><textarea name="Insurance" value="" id="Insurance" cols="75" rows="5"><?php echo $InsuranceInfo ?></textarea></td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Description of Damage</td>
                                    <td colspan="3" align="left" class="vehicle_inventory"><textarea name="Damage_description" value="" id="Damage_description" cols="75" rows="5"><?php echo $DamegeDesc ?></textarea></td>
                                    </tr>
                                 
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Immediate Action Taken</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Action_taken" id="Action_taken" cols="75" rows="5"  value="<?php echo $ImmActionTaken ?>" data-bvalidator="required" data-bvalidator-msg="Please Enter the Immediate Action Taken." /><?php echo $ImmActionTaken ?></textarea></td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Employee Statement</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Employee_statement" id="Employee_statement" cols="75" rows="5" value="<?php echo $EmployeeStatement ?>" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Statement." value="<?php echo $EmployeeStatement ?>"/></textarea></td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Witness Statement</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Witness_statement" id="Witness_statement" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Witness Statement." value="<?php echo $WitnessStatement ?>" /><?php echo $WitnessStatement ?></textarea>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Note</td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <textarea name="Note" id="Note" cols="75" rows="5" value="<?php echo $Note ?>" /><?php echo $Note; ?></textarea>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td nowrap="nowrap" class="vehicle_inventory">Upload Files<br />
                                      <span class="ui-state-error-text">There is a maximum of 2mb file limit.</span></td>
                                    <td colspan="3" align="left" class="vehicle_inventory">
                                    <?php
        
                                    if ($_SERVER['REQUEST_METHOD'] == 'POST')
                                    {
                                        $conn = new COM ("ADODB.Connection");
                                        $connStr = "PROVIDER=SQLOLEDB;SERVER=".$myServer.";UID=".$myUser.";PWD=".$myPass.";DATABASE=".$myDB; 
                                        $conn->open($connStr); //Open the connection to the database
                                        
                                        //$sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='' and VehicleNo=''";
                                        //echo($sql_Select);
                                        $sql_Select="Select * from Form_IncidentReportImageDetails where Incident_Date='$incidentRpt_Date' and IncidentRpt_ID='$IncidentRpt_ID'";
                                        //echo($sql_Select);
                                        $recordsetImgList->open($sql_Select, $conn, 3);      
                                        
                                        $ImageCnt = 1;
                                        if (!$recordsetImgList->EOF)
                                        {
                                    ?>
                                            <table border=""  style="width: 23.5%; margin: 5px;">
                                            
                                            <tr>
                                                <!--<th>S No</th>
                                                <th>Image Name</th>-->
                                                <th>Image </th>
                                            </tr>
                                            <?php
                                            $tempFile = "";
                                            $fileextension = "";
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
                                                $fileextension = mb_strtolower(end($tempFile));
                                                //echo($fileextension);
                                                if ($fileextension == "pdf") {
                                                ?>
                                                    <a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" target="_blank" >
                                                        <img src="images/pdf.jpg" width="50px" height="50px" style="text-align:center" />    
                                                    </a>
                                                <?php
                                                } else if (in_array($fileextension, array('png','jpeg','jpg','gif','pjpeg'))){
                                                ?>
                                                    <a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" target="_blank" >
                                                        <img src="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" width="50px" height="50px" style="text-align:center" />
                                                    </a>
                                                <?php
                                                } else {
                                                ?>
                                                    <a href="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" target="_blank" >
                                                        <img src="images/file.jpg" width="50px" height="50px" style="text-align:center" />    
                                                    </a>
                                                <?php
                                                }
                                                ?>
                                                 </td></tr>
                                                 
                                                <!-- tr>
                                                <td> <?php echo $ImageCnt; ?> </td>
                                                <td> <?php echo $recordsetImgList->fields["ImageName"]->value; ?> </td>
                                                <td> 
                                                <img src="photos/<?php echo $recordsetImgList->fields["ImageName"]->value?>" width="50px" height="30px" style="text-align:center" /> </td></tr -->
                                                <?php
                                                //$ImageList=$recordsetImgList->fields["Incident_ImgID"]->value.'---'. $recordsetImgList->fields["ImageName"]->value."</br>";
                                                //echo $ImageList;
                                                $recordsetImgList->MoveNext(); 
                                                $ImageCnt = $ImageCnt + 1;
                                            }
                                            ?>
                                            </table>
                                    <?php
                                        }
                                    }
                                    ?>    
                                    
                                    <input type="file" name="file[]" id="file" size="35" multiple>
                                    <!--<input type="submit" name="uploadimg" value="Upload Photos">?php echo $show; ?></td>-->
                                  </tr>
                                  </table></td>
                              </tr>
                            </table></td>
                    
                        </tr>
                        <tr>
                            <td valign="top">&nbsp;</td>
                        </tr>
                    </table>
                    <br /><br />  <p><strong>INCIDENT INVESTIGATION CHECKLIST</strong></p>
                    <div class="checkbox">
                        <input id="check1" type="checkbox" name="mvb" value="check" <?php if($IIC_VisualCheck=="check"){echo "checked=\"checked\" ";} ?>  />
                        <label for="check1">Make a visual check to make sure the scene is protected against further incident.</label>
                        <br/>
                        <input id="check2" type="checkbox" name="injured" value="check"  <?php if($IIC_AnyOneInjured=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check2">Who was injured? Who, what kind of injury and how bad? Where are they now?</label>
                        <br/>
                        <input id="check3" type="checkbox" name="immediatetreatment" value="check"  <?php if($IIC_ImmediateTreatment=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check3">Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?</label>
                        <br/>
                        <input id="check4" type="checkbox" name="nature" value="check"  <?php if($IIC_NatureIncident=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check4">What was the nature of the incident?</label>
                          <br/>
                        <input id="check5" type="checkbox" name="checktime" value="check"  <?php if($IIC_LocationIncident=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check5">Time and exact location of the incident.</label>
                           <br/>
                        <input id="check6" type="checkbox" name="checklead" value="check"  <?php if($IIC_Lead=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check6">What/ who lead to the injury?</label>
                         <br/>
                        <input id="check7" type="checkbox" name="checkguard" value="check"  <?php if($IIC_GuardinPlace=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check7">Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?</label>
                         <br/>
                        <input id="check8" type="checkbox" name="checkwitneesses" value="check"  <?php if($IIC_WitnessStatement=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check8">If there are any witnesses, get statements from them saying what they saw and contact information.</label>
                          <br/>
                        <input id="check9" type="checkbox" name="checkreport" value="check"  <?php if($IIC_ReportIncident=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check9">Report incident to direct supervisor and discuss next steps / instructions</label>
                                
                    </div>
                
                    <p class="incident">If incident involves vehicles continue here</p>
                    <div class="checkbox">
                        <input id="check11" type="checkbox" name="checkpolice" value="check"  <?php if($IIC_InsuranceCompany=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check11">Have the police and insurance company been called?</label>
                        <br/>
                        <input id="check12" type="checkbox" name="checkisolate" value="check"  <?php if($IIC_IsolateDriver=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check12">Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.</label>
                        <br/>
                        <input id="check13" type="checkbox" name="checkrecord" value="check"  <?php if($IIC_RecordName=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check13">Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.</label>
                          <br/>
                        <input id="check14" type="checkbox" name="checkfind" value="check"  <?php if($IIC_FindWitness=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check14">Find any witnesses.  Get names, addresses, license number.  Include those who arrived early to the scene.</label>
                           <br/>
                        <input id="check15" type="checkbox" name="checkdid" value="check"  <?php if($IIC_WitnessInfractions=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check15">Did witnesses notice obvious infractions?</label>
                         <br/>
                        <input id="check16" type="checkbox" name="checktake" value="check" <?php if($IIC_TakePicture=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check16">Take pictures and get any evidence before the vehicles are moved.</label>
                        <br/>
                        <input id="check17" type="checkbox" name="checkgetper" value="check"  <?php if($IIC_PersonalInfoTakePicture=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check17">Get personal information of anyone taking pictures.</label>
                         <br/>
                        <input id="check18" type="checkbox" name="checkcheck" value="check"  <?php if($IIC_MechanicalDefects=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check18">Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.</label>
                          <br/>
                        <input id="check19" type="checkbox" name="checkif" value="check"  <?php if($IIC_WreckerCompany=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check19">If vehicles have been removed find out by what wrecker company.</label>
                          <br/>
                        <input id="check20" type="checkbox" name="checkis" value="check"  <?php if($IIC_PointofImpact=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check20">Is the point of impact clearly noted on the roadway?</label>
                         <br/>
                        <input id="check21" type="checkbox" name="checkmake" value="check"  <?php if($IIC_Measurements=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check21">Make measurements of all physical facts, including length and location of skid marks.</label>
                         <br/>
                        <input id="check22" type="checkbox" name="checkdraw" value="check"  <?php if($IIC_Sketch=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check22">Draw a sketch of the scene and vehicle locations.</label>
                         <br/>
                        <input id="check23" type="checkbox" name="checkhave" value="check"  <?php if($IIC_PoliceIssueCitation=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check23">Have police issued citations or made arrests? Who and what are the charges?</label>
                         <br/>
                        <input id="check24" type="checkbox" name="checkoffier" value="check"  <?php if($IIC_PoliceOfficerBadge=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check24">Get the name and badge number of the police officer.</label>
                         <br/>
                        <input id="check25" type="checkbox" name="checkcargo" value="check"  <?php if($IIC_Protectcargo=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check25">Protect cargo.</label>
                         <br/>
                        <input id="check26" type="checkbox" name="checkwrecker" value="check"  <?php if($IIC_ArrangeWrecker=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check26">Arrange for a wrecker.</label>
                         <br/>
                        <input id="check27" type="checkbox" name="checknote" value="check"  <?php if($IIC_OtherDamage=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check27">Note any other property damage.</label>
                          <br/>
                        <input id="check28" type="checkbox" name="checkdo" value="check"  <?php if($IIC_FinalExamination=="check"){echo "checked=\"checked\" ";} ?>/>
                        <label for="check28">Do a final examination of the scene.</label>
                                
                    </div>
        
                </table>
        
                <div align="right"><input type="submit" value="Submit"  name="btnSumit"/></div>
              </div>
            </div>

    </form>
</body>
</html>