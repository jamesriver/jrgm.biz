<cfinclude template="include_authorization.cfm">

<!--- ======= get injury report ======= --->
<!---
$IR_ID = $recordset->fields["IR_ID"]->value;
$IncidentID = $recordset->fields["IncidentRpt_ID"]->value;
$incidentRpt_Date = $recordset->fields["incidentRpt_Date"]->value;
$VehicleNumber = $recordset->fields["VehicleNumber"]->value;
$IncidentTime = $recordset->fields["IncidentTime"]->value;
$LicenseNo = $recordset->fields["LicenseNo"]->value;
$Location = $recordset->fields["Location"]->value;
$Equipment = $recordset->fields["Equipment"]->value;
$Branch = $recordset->fields["Branch"]->value;
$Employee = $recordset->fields["Employee"]->value;
$ReportedTo = $recordset->fields["ReportedTo"]->value;
$Position = $recordset->fields["Position"]->value;
$ReportedDate = $recordset->fields["ReportedDate"]->value;
$Supervisor = $recordset->fields["Supervisor"]->value;
$NatureOfIncident = $recordset->fields["NatureOfIncident"]->value;
$OwnerName = $recordset->fields["OwnerName"]->value;
$OwnerPhoneNo = $recordset->fields["OwnerPhoneNo"]->value;
$OwnerLicenseNo = $recordset->fields["OwnerLicenseNo"]->value;
$OwnerTypeOfVehicle = $recordset->fields["OwnerTypeOfVehicle"]->value;
$OwnerAddress = $recordset->fields["OwnerAddress"]->value;
$DamegeDesc = $recordset->fields["DamegeDesc"]->value;
$InsuranceInfo = $recordset->fields["InsuranceInfo"]->value;
$ImmActionTaken = $recordset->fields["ImmActionTaken"]->value;
$EmployeeStatement = $recordset->fields["EmployeeStatement"]->value;
$WitnessStatement = $recordset->fields["WitnessStatement"]->value;
$Note = $recordset->fields["Note"]->value;
$BO_Status = $recordset->fields["BO_Status"]->value;
$BO_DrugTest = $recordset->fields["BO_DrugTest"]->value;
$BO_WorkerComp = $recordset->fields["BO_WorkerComp"]->value;
$BO_SafetyUsed = $recordset->fields["BO_SafetyUsed"]->value;
$BO_IsFine = $recordset->fields["BO_IsFine"]->value;
$BO_IsPayroll = $recordset->fields["BO_IsPayroll"]->value;
$BO_Injuries = $recordset->fields["BO_Injuries"]->value;
$BO_Translator = $recordset->fields["BO_Translator"]->value;
$BO_Fine = $recordset->fields["BO_Fine"]->value;
$BO_EstimatedLoss = $recordset->fields["BO_EstimatedLoss"]->value;
$BO_FinalLoss = $recordset->fields["BO_FinalLoss"]->value;
--->
<cfif IsDefined('form.id')>
    <cfquery name="main_query" datasource="jrgm">
        Select * from Form_IncidentReport where IR_ID=<cfqueryparam value="#form.id#" CFSQLType="CF_SQL_INTEGER">
    </cfquery>
    <cfset cv = 0>
    <cfloop query="main_query">
        <cfif cv GT 0>
            <cfset output_str = output_str & multi_delimiter>
        </cfif>
        <cfset output_str = output_str & IR_ID & '|' & IncidentRpt_ID & '|' & incidentRpt_Date & '|' & VehicleNumber & '|' & IncidentTime & '|' & LicenseNo & '|' & Location & '|' & Equipment
             & '|' & Branch & '|' & Employee & '|' & ReportedTo & '|' & Position & '|' & ReportedDate & '|' & Supervisor & '|' & NatureOfIncident & '|' & OwnerName & '|' & OwnerPhoneNo
             & '|' & OwnerLicenseNo & '|' & OwnerTypeOfVehicle & '|' & OwnerAddress & '|' & DamegeDesc & '|' & InsuranceInfo & '|' & ImmActionTaken & '|' & EmployeeStatement & '|' & WitnessStatement
             & '|' & Note & '|' & BO_Status & '|' & BO_DrugTest & '|' & BO_WorkerComp & '|' & BO_SafetyUsed & '|' & BO_IsFine & '|' & BO_IsPayroll & '|' & BO_Injuries & '|' & BO_Translator
             & '|' & BO_Fine & '|' & BO_EstimatedLoss & '|' & BO_FinalLoss
        >
        <cfset cv++>
    </cfloop>
    <cfinclude template="include_output.cfm">
</cfif>