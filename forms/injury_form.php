<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
         <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title>
            James River Grounds Management
         </title>
         <script src="js/Jquery1.9.1.min.js" type="text/javascript"></script>
         <script src="js/Jquerybvalidator.js" type="text/javascript"></script>
         <script src="js/jquery.mask.js" type="text/javascript"></script>
         <script src="js/JavaScript2.js" type="text/javascript"></script>
         <!--
            <script src="js/phplivex_uncompressed.js" type="text/javascript">
            </script>
            -->
<!--         <link rel="stylesheet" href="http://necolas.github.com/normalize.css/2.0.1/normalize.css">-->
         <link href="css/necolas_normalize2.0.1.css" rel="stylesheet" />
         <link href="css/bootstrap.css" rel="stylesheet" />
         <link href="css/StyleSheet.css" rel="stylesheet" />
         <link href="css/styles.css" rel="stylesheet" />
         <!--
            <link href="css/styles1.css" rel="stylesheet" />
            -->
         <link href="css/date.css" rel="stylesheet" />
         <script type="text/javascript">
            $(document).ready(function () {
              $('#myform').bValidator();
            }
                             );
         </script>
         <script type="text/javascript">
            $(function () {
              $("#date").datepicker();
              $("#today_Date").datepicker();//{dateFormat: 'dd-mm-yy'});
              $("#Report_date").datepicker();
              $("#EMPDOB").datepicker({
                  changeMonth: true,
                  changeYear: true
                });
              $("#EMPDOH").datepicker();
              $('#EmployeePhoneNo').mask('(999) 999-9999');
            }
             );
         </script>
      </head>
      </head>
      <body style="margin-top:0">
         <form action="" method="post" id="myform" class="vehicle_inventory" enctype="multipart/form-data" >
            <div id="centrecontent">
               <!--centre content goes here -->
               <div class="centrecontent_inner">
                  <div class="header">
                     Injury Report
                     <input type="hidden" name="InjuryRpt_ID" value="<?php echo $InjuryRpt_ID;?>" />
                  </div>
                  <div class="spacer20">
                  </div>
                  <script type="text/javascript" language="javascript">
                              function __doPostBack() {
                                var theForm = document.forms['myform'];
                                if (!theForm) {
                                  theForm = document.form1;
                                }
                                //$("#Branch").val($("option:selected", $("#Branch_Id")).attr('branch'));
                                //$("#Supervisor_Name").val($("option:selected", $("#Supervisor_Id")).text());
                                $("#Supervisor_Name").val('');
                                $("#Position").val('');
                                $("#Employee_Name").val('');
                                $("#EmployeeAddress").val('');
                                $("#EmpDOB").val('');
                                $("#EmployeePhoneNo").val('');
                                $("#EmpDOH").val('');
                                $("#sex").val('');
                                if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                                  theForm.submit();
                                }
                              }

                              function __doPostBackEmployee() {
                                  $("#Supervisor_Name").val($("option:selected", $("#Employee_Id")).attr('spvr'));
                                $("#Position").val($("option:selected", $("#Employee_Id")).attr('pos'));
                                $("#Employee_Name").val($("option:selected", $("#Employee_Id")).text());
                                $("#EmployeeAddress").val($("option:selected", $("#Employee_Id")).attr('address'));
                                $("#EmpDOB").val($("option:selected", $("#Employee_Id")).attr('dob'));
                                $("#EmployeePhoneNo").val($("option:selected", $("#Employee_Id")).attr('phone'));
                                $("#EmpDOH").val($("option:selected", $("#Employee_Id")).attr('doh'));
                                $("#sex").val($("option:selected", $("#Employee_Id")).attr('sex'));
                              }
                  </script>
                           
                  <table width="99%" border="0" cellpadding="0" cellspacing="0">
                     <tr>
                        <td valign="top">
                           
                           <table width="95%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                 <td class="performance">
                                    Date
                                 </td>
                                 <td class="performance">
                                    <input type="text" name="today_Date" id="today_Date" size="24" data-bvalidator="required" value="<?php echo $InjuryRpt_Date;?>" />
                                 </td>
                                 <td class="performance">
                                    Time
                                 </td>
                                 <td class="performance">
                                    <input type="time" name="time" id="time" size="24" value="<?php echo $InjuryTime; ?>" />
                                 </td>
                              </tr>
                              <tr>
                                 <td class="performance">
                                    Location
                                 </td>
                                 <td class="performance">
                                    <input name="Location" type="text" id="Location" size="24"  data-bvalidator="required" data-bvalidator-msg="Please Enter the Location of the Injury" value="<?php echo $Location;?>" />
                                 </td>
                                 
                                 <td class="performance">
                                    Reported To
                                 </td>
                                 <td class="performance">
                                    <input name="Reported_To" type="text" id="Reported_To" size="24"  data-bvalidator="required" data-bvalidator-msg="Who Was the Injury Reported To" value="<?php echo $ReportedTo;?>"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="performance">
                                    Branch
                                 </td>
                                 <td class="performance">
                                    <select name="Branch_Id" id="Branch_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Select Branch" onchange="javascript:__doPostBack();">
                                       <option value="" branch="">
                                          --Select Branch--
                                       </option>
                                       <?php
                                          while (!$recordset_Branch->EOF) {
                                              $sid     = $recordset_Branch->fields['Branch']->value;
                                              $sname   = $recordset_Branch->fields['Branch']->value;
                                              $sbranch = $recordset_Branch->fields['Branch']->value;
                                              $str     = "
                                              <option value='$sid' branch='$sbranch'";
                                              if (isset($_REQUEST['Branch_Id']))
                                                if ($_REQUEST['Branch_Id'] == $sid)
                                                    $str .= "selected='selected'";
                                              echo $str;
                                              echo ">
                                              $sname";
                                              echo "
                                              </option>
                                              ";
                                              $recordset_Branch->movenext();
                                          }
                                          ?>
                                    </select>
                                    <input type="hidden" name="Branch" id="Branch" size="24" readonly="true" value="<?php echo $Branch;?>"/>
                                 </td>
                                 
                                  <td class="performance">
                                    Date Reported
                                 </td>
                                 <td class="performance">
                                    <input type="text" name="Report_date" id="Report_date" size="24"  data-bvalidator="required"  value="<?php echo $ReportedDate; ?>"/>
                                 </td>
                                 
                              </tr>
                              <tr>
                                 <td class="performance">
                                    Employee
                                 </td>
                                 <td class="performance">
                                    <select name="Employee_Id" id="Employee_Id" style="width: 250px;" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Name" onchange="javascript:__doPostBackEmployee();">
                                       <option value="">
                                          --Select Employee--
                                       </option>
                                       <?php
                                          while (!$recordset_Employee->EOF) {
                                              $eid   = $recordset_Employee->fields['employee_id']->value;
                                              $ename = $recordset_Employee->fields['crew_name']->value;
                                              $eadd = '';
                                              $edob = '';
                                              $eph = $recordset_Employee->fields['Ph Cell']->value;
                                              $Supervisor_Name = $recordset_Employee->fields['SupervisorName']->value;
                                              $Position = $recordset_Employee->fields['Position']->value;
                                              
                                              $esex = '';
                                              $edoh = '';
                                              $str   = "
                                              <option value='$eid' address='$eadd' dob='$edob' phone='$eph' sex='$esex' doh='$edoh' pos='$Position' spvr='$Supervisor_Name'";
                                              if (isset($_REQUEST['Employee_Id']))
                                                if ($_REQUEST['Employee_Id'] == $eid)
                                                    $str .= "selected='selected'";
                                              echo $str;
                                              echo ">
                                              $ename";
                                              echo "
                                              </option>
                                              ";
                                              $recordset_Employee->movenext();
                                          }
                                       ?>
                                    </select>
                                    <input type="hidden" name="Employee_Name" id="Employee_Name" value="<?php echo $Employee;?>" />
                                 </td>
                                 
                                 <td class="performance">
                                    Time Employee Began Work
                                 </td>
                                 <td class="performance">
                                    <input type="time" name="BeganTime" id="BeganTime" size="24"  value="<?php echo $BeganTime;?>"/>
                                 </td>
                              </tr>
                              <tr>
                                <td class="performance">
                                    Supervisor
                                </td>
                                <td class="performance">
                                    <input type="text" name="Supervisor_Name" id="Supervisor_Name" value="<?php echo $Supervisor; ?>" />
                                </td>                                 
                              </tr>
                              <tr>
                                  <td class="performance">
                                    Position
                                </td>
                                <td class="performance">
                                    <input type="text" name="Position" id="Position"  size="24" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Position" value="<?php echo $Position;?>"/>
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
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                     <tr>
                        <td class="performance">
                           <p><strong>Nature of Injury or Illness. Please be Specific:</strong></p>
                           <p>
                               <textarea name="nid" id="nid" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Nature of the Injury" ><?php echo $NatureOfInjury;?></textarea>
                           </p>
                           <p><strong>What Object Directly Caused Harm to Employee:</strong></p>
                           <p>
                               <textarea name="HarmObject" id="HarmObject" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter Object Directly Caused Harm to Employee."><?php echo $HarmObject;?></textarea>
                           </p>
                           <p><strong>Immediate Action Taken:</strong></p>
                           <p>
                               <textarea name="Action_taken" id="Action_taken" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Immediate Action Taken." ><?php echo $ImmActionTaken;?></textarea>
                           </p>
                           <p><strong>Employee Statement:</strong></p>
                           <p>
                               <textarea name="Employee_statement" id="Employee_statement" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Employee Statement." ><?php echo $EmployeeStatement;?></textarea>
                           </p>
                           <p><strong>Witness Statement:</strong></p>
                           <p>
                               <textarea name="Witness_statement" id="Witness_statement" cols="75" rows="5" data-bvalidator="required" data-bvalidator-msg="Please Enter the Witness Statement."><?php echo $WitnessStatement;?></textarea>
                           </p>
                        </td>
                     </tr>
                  </table>

                  <div class="spacer20"></div>
                  <table width="99%" border="0" cellpadding="0" cellspacing="0">
                     <tr>
                        <td valign="top">
                           <table width="99%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                 <td nowrap="nowrap" class="vehicle_inventory">
                                    Employee Address
                                 </td>
                                 <td colspan="3" align="left" class="vehicle_inventory">
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
                                 <td class="performance">
                                    <input type="text" name="EmployeePhoneNo" id="EmployeePhoneNo" size="24" value="<?php echo $EmployeePhoneNo;?>" />
                                 </td>
                              </tr>
                              <tr>  
                                 <td nowrap="nowrap" class="vehicle_inventory">Employee Gender</td>
                                 <td colspan="3" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="sex_Y" type="radio" name="sex" checked="checked"  value="M"
                                          <?php
                                             if ($EmployeeSex == "M") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="sex_Y">
                                       Male
                                       </label>
                                       <input id="sex_N" type="radio" name="sex" value="F"
                                          <?php
                                             if ($EmployeeSex == "F") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="sex_N">
                                       Female
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td nowrap="nowrap" class="vehicle_inventory">
                                    Date of Hire
                                 </td>
                                 <td class="performance">
                                    <input type="text" name="EmpDOH" id="EMPDOH" size="24" value="<?php echo $EmpDOH;?>" />
                                 </td>
                                 <td align="left" nowrap="nowrap" class="vehicle_inventory">&nbsp;

                                 </td>
                                 <td class="performance">&nbsp;

                                 </td>
                              </tr>
                              <tr>
                                 <td nowrap="nowrap" class="vehicle_inventory">
                                    Upload Photos<br /><span class="ui-state-error-text">There is a maximum of 2mb file limit.</span>
                                 </td>
                                 <td colspan="3" align="left" class="vehicle_inventory">
                                    <?php
                                       if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                           $conn    = new COM("ADODB.Connection");
                                           $connStr = "PROVIDER=SQLOLEDB;SERVER=" . $myServer . ";UID=" . $myUser . ";PWD=" . $myPass . ";DATABASE=" . $myDB;
                                           $conn->open($connStr); //Open the connection to the database
                                           $sql_Select = "Select * from Form_InjuryReportImageDetails where Injury_Date='$InjuryRpt_Date' and InjuryRpt_ID='$InjuryRpt_ID'";
                                           $recordsetImgList->open($sql_Select, $conn, 3);
                                           $ImageCnt = 1;
                                           if(!$recordsetImgList->EOF) {
                                    ?>
                                                <table border=""  style="width: 63.5%; margin: 5px;">

                                                <tr>

                                                <th>S No</th>
                                                <th>Image Name</th>
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
                                                    <td> <?php echo $ImageCnt; ?> </td>
                                                    <td> <?php echo $recordsetImgList->fields["ImageName"]->value; ?> </td>
                                                    <td> 
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
                                                    } else {
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
                                    }
                                    ?>
                                    <input type="file" name="file[]" id="file" multiple>
                                    <!--<input type="submit" name="uploadimg" value="Upload Photos">
                                    <?php
                                       echo $show;
                                    ?>-->
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Were safety features bypassed?
                              </td>
                                 <td colspan="2" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="sf_Y" type="radio" name="SafetyFeature" value="Y"
                                          <?php
                                             if ($SafetyFeature == "Y") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="sf_Y">
                                       Yes
                                       </label>
                                       <input id="sf_N" type="radio" name="SafetyFeature" value="N"
                                          <?php
                                             if ($SafetyFeature == "N") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="sf_N">
                                       No
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Was employee given information on Panel of Physicians?
                              </td>
                                 <td colspan="2" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="pop_Y" type="radio" name="PanelofPhysicians" value="Y"
                                          <?php
                                             if ($PanelofPhysicians == "Y") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="pop_Y">
                                       Yes
                                       </label>
                                       <input id="pop_N" type="radio" name="PanelofPhysicians" value="N"
                                          <?php
                                             if ($PanelofPhysicians == "N") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="pop_N">
                                       No
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Was employee given a medical release form?
                              </td>
                                 <td colspan="2" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="mrf_Y" type="radio" name="MedicalReleaseForm" value="Y"
                                          <?php
                                             if ($MedicalReleaseForm == "Y") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="mrf_Y">
                                       Yes
                                       </label>
                                       <input id="mrf_N" type="radio" name="MedicalReleaseForm" value="N"
                                          <?php
                                             if ($MedicalReleaseForm == "N") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="mrf_N">
                                       No
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Was employee doing something other than required duties at time of accident?
                              </td>
                                 <td colspan="2" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="dtoa_Y" type="radio" name="DutiesTOA" value="Y"
                                          <?php
                                             if ($DutiesTOA == "Y") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="dtoa_Y">
                                       Yes
                                       </label>
                                       <input id="dtoa_N" type="radio" name="DutiesTOA" value="N"
                                          <?php
                                             if ($DutiesTOA == "N") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="dtoa_N">
                                       No
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  If so, what and why?
                              </td>
                              <td colspan="2" align="left" class="vehicle_inventory">
                              <textarea name="DutiesTOAYes" id="DutiesTOAYes" rows="3" cols="45"><?php echo $DutiesTOAYes;?></textarea>
                              </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Could this accident have been prevented?
                              </td>
                                 <td colspan="2" align="left" class="vehicle_inventory">
                                    <div class="radio">
                                       <input id="ap_Y" type="radio" name="AccidentPrev" value="Y"
                                          <?php
                                             if ($AccidentPrev == "Y") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="ap_Y">
                                       Yes
                                       </label>
                                       <input id="ap_N" type="radio" name="AccidentPrev" value="N"
                                          <?php
                                             if ($AccidentPrev == "N") {
                                                echo "checked=\"checked\" ";
                                             }
                                             ?>
                                          />
                                       <label for="ap_N">
                                       No
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Please explain
                              </td>
                              <td colspan="2" align="left" class="vehicle_inventory">
                              <textarea name="Explain" id="Explain" rows="3" cols="45" value="<?php echo $Explain;?>"></textarea>
                              </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  <a href="#">Doctor Form</a>
                              </td>
                              <td colspan="2" align="left" class="vehicle_inventory">&nbsp;

                              </td>
                              </tr>
                              <tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  <a href="#">Medical Papers</a>
                              </td>
                              <td colspan="2" align="left" class="vehicle_inventory">&nbsp;

                              </td>
                              </tr>
                              <!--<tr>
                              <td colspan="2" align="left" class="vehicle_inventory">
                                  Status
                              </td>
                              <td colspan="2" align="left" class="vehicle_inventory">
                              <input type="text" name="Status" size="24" value="<?php echo $Status ?>" />
                              </td>
                              </tr>-->
                           </table>
                        </td>
                     </tr>
                  </table>
                  
                  <br />
                  <br />
                  <p>
                     <strong>
                        INJURY INVESTIGATION CHECKLIST
                     </strong>
                  </p>
                  <div class="checkbox">
                     <input id="check1" type="checkbox" name="mvb" value="check"
                        <?php
                           if ($IIC_VisualCheck == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check1">
                     Make a visual check to make sure the scene is protected against further injury.
                     </label>
                     <br/>
                     <input id="check2" type="checkbox" name="injured" value="check"
                        <?php
                           if ($IIC_AnyOneInjured == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check2">
                     Who was injured? Who, what kind of injury and how bad? Where are they now?
                     </label>
                     <br/>
                     <input id="check3" type="checkbox" name="immediatetreatment" value="check"
                        <?php
                           if ($IIC_ImmediateTreatment == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check3">
                     Determine what type of immediate treatment is required for injured party and coordinate. First aid? ER or Med Express?
                     </label>
                     <br/>
                     <input id="check4" type="checkbox" name="nature" value="check"
                        <?php
                           if ($IIC_NatureIncident == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check4">
                     What was the nature of the incident?
                     </label>
                     <br/>
                     <input id="check5" type="checkbox" name="checktime" value="check"
                        <?php
                           if ($IIC_LocationIncident == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check5">
                     Time and exact location of the incident.
                     </label>
                     <br/>
                     <input id="check6" type="checkbox" name="checklead" value="check"
                        <?php
                           if ($IIC_Lead == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check6">
                     What/ who lead to the injury?
                     </label>
                     <br/>
                     <input id="check7" type="checkbox" name="checkguard" value="check"
                        <?php
                           if ($IIC_GuardinPlace == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check7">
                     Find out what the injured employee was doing. What equipment were they using? Were the guards in place? Were any safety features bypassed? Was employee wearing appropriate PPE?
                     </label>
                     <br/>
                     <input id="check8" type="checkbox" name="checkwitneesses" value="check"
                        <?php
                           if ($IIC_WitnessStatement == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check8">
                     If there are any witnesses, get statements from them saying what they saw and contact information.
                     </label>
                     <br/>
                     <input id="check9" type="checkbox" name="checkreport" value="check"
                        <?php
                           if ($IIC_ReportIncident == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check9">
                     Report incident to direct supervisor and discuss next steps / instructions
                     </label>
                  </div>
                  <p class="incident">
                     If incident involves vehicles continue here
                  </p>
                  <div class="checkbox">
                     <input id="check11" type="checkbox" name="checkpolice" value="check"
                        <?php
                           if ($IIC_InsuranceCompany == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check11">
                     Have the police and insurance company been called?
                     </label>
                     <br/>
                     <input id="check12" type="checkbox" name="checkisolate" value="check"
                        <?php
                           if ($IIC_IsolateDriver == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check12">
                     Isolate your driver and find out if he has spoken to anyone and what was said. If sent to the hospital send a company representative with them.
                     </label>
                     <br/>
                     <input id="check13" type="checkbox" name="checkrecord" value="check"
                        <?php
                           if ($IIC_RecordName == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check13">
                     Record names of the drivers of both vehicles. Make, model, license number, occupants, addresses, employer.
                     </label>
                     <br/>
                     <input id="check14" type="checkbox" name="checkfind" value="check"
                        <?php
                           if ($IIC_FindWitness == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check14">
                     Find any witnesses.  Get names, addresses, license number.  Include those who arrived early to the scene.
                     </label>
                     <br/>
                     <input id="check15" type="checkbox" name="checkdid" value="check"
                        <?php
                           if ($IIC_WitnessInfractions == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check15">
                     Did witnesses notice obvious infractions?
                     </label>
                     <br/>
                     <input id="check16" type="checkbox" name="checktake" value="check"
                        <?php
                           if ($IIC_TakePicture == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check16">
                     Take pictures and get any evidence before the vehicles are moved.
                     </label>
                     <br/>
                     <input id="check17" type="checkbox" name="checkgetper" value="check"
                        <?php
                           if ($IIC_PersonalInfoTakePicture == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check17">
                     Get personal information of anyone taking pictures.
                     </label>
                     <br/>
                     <input id="check18" type="checkbox" name="checkcheck" value="check"
                        <?php
                           if ($IIC_MechanicalDefects == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check18">
                     Check the vehicle for any mechanical defects or anything that could cause further damage if the vehicle is operated.
                     </label>
                     <br/>
                     <input id="check19" type="checkbox" name="checkif" value="check"
                        <?php
                           if ($IIC_WreckerCompany == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check19">
                     If vehicles have been removed find out by what wrecker company.
                     </label>
                     <br/>
                     <input id="check20" type="checkbox" name="checkis" value="check"
                        <?php
                           if ($IIC_PointofImpact == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check20">
                     Is the point of impact clearly noted on the roadway?
                     </label>
                     <br/>
                     <input id="check21" type="checkbox" name="checkmake" value="check"
                        <?php
                           if ($IIC_Measurements == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check21">
                     Make measurements of all physical facts, including length and location of skid marks.
                     </label>
                     <br/>
                     <input id="check22" type="checkbox" name="checkdraw" value="check"
                        <?php
                           if ($IIC_Sketch == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check22">
                     Draw a sketch of the scene and vehicle locations.
                     </label>
                     <br/>
                     <input id="check23" type="checkbox" name="checkhave" value="check"
                        <?php
                           if ($IIC_PoliceIssueCitation == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check23">
                     Have police issued citations or made arrests? Who and what are the charges?
                     </label>
                     <br/>
                     <input id="check24" type="checkbox" name="checkoffier" value="check"
                        <?php
                           if ($IIC_PoliceOfficerBadge == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check24">
                     Get the name and badge number of the police officer.
                     </label>
                     <br/>
                     <input id="check25" type="checkbox" name="checkcargo" value="check"
                        <?php
                           if ($IIC_Protectcargo == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check25">
                     Protect cargo.
                     </label>
                     <br/>
                     <input id="check26" type="checkbox" name="checkwrecker" value="check"
                        <?php
                           if ($IIC_ArrangeWrecker == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check26">
                     Arrange for a wrecker.
                     </label>
                     <br/>
                     <input id="check27" type="checkbox" name="checknote" value="check"
                        <?php
                           if ($IIC_OtherDamage == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check27">
                     Note any other property damage.
                     </label>
                     <br/>
                     <input id="check28" type="checkbox" name="checkdo" value="check"
                        <?php
                           if ($IIC_FinalExamination == "check") {
                                echo "checked=\"checked\" ";
                           }
                           ?>
                        />
                     <label for="check28">
                     Do a final examination of the scene.
                     </label>
                  </div>
                  </table>
                  <div align="right">
                     <input type="submit" value="Submit"  name="btnSumit"/>
                  </div>
               </div>
            </div>
         </form>
      </body>
   </html>