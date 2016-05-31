<cfinclude template="include_authorization.cfm">

<!--- ======= get injury report ======= --->
<!---
$IR_ID = $recordset["IR_ID"];
$InjuryID = $recordset["InjuryRpt_ID"];
$InjuryRpt_Date = $recordset["InjuryRpt_Date"];
$InjuryTime = $recordset["InjuryTime"];
$Location = $recordset["Location"];
$Branch = $recordset["Branch"];
$Employee = $recordset["Employee"];
$ReportedTo = $recordset["ReportedTo"];
$Position = $recordset["Position"];
$ReportedDate = $recordset["ReportedDate"];
$BeganTime = $recordset["BeganTime"];
$Supervisor = $recordset["Supervisor"];
$NatureOfInjury = $recordset["NatureOfInjury"];
$HarmObject = $recordset["HarmObject"];
$ImmActionTaken = $recordset["ImmActionTaken"];
$EmployeeStatement = $recordset["EmployeeStatement"];
$WitnessStatement = $recordset["WitnessStatement"];
$EmployeePhoneNo = $recordset["EmployeePhoneNo"];
$EmployeeAddress = $recordset["EmployeeAddress"];
$EmpDOB = $recordset["EmpDOB"];
$EmployeeSex = $recordset["EmployeeSex"];
$EmpDOH = $recordset["EmpDOH"];
$SafetyFeature = $recordset["SafetyFeature"];
$PanelofPhysicians = $recordset["PanelofPhysicians"];
$MedicalReleaseForm = $recordset["MedicalReleaseForm"];
$DutiesTOA = $recordset["DutiesTOA"];
$DutiesTOAYes = $recordset["DutiesTOAYes"];
$AccidentPrev = $recordset["AccidentPrev"];
$Explain = $recordset["Explain"];
$Note = $recordset["Note"];
$BO_Status = $recordset["BO_Status"];
$BO_MedicalReq = $recordset["BO_MedicalReq"];
$BO_DrugTest = $recordset["BO_DrugTest"];
$BO_AccInv = $recordset["BO_AccInv"];
$BO_Hospitalized = $recordset["BO_Hospitalized"];
$BO_WorkerComp = $recordset["BO_WorkerComp"];
$BO_WorkerCompNo = $recordset["BO_WorkerCompNo"];
$BO_Restrictions = $recordset["BO_Restrictions"];
$BO_ListRestrictions = $recordset["BO_ListRestrictions"];
$BO_LightDuty = $recordset["BO_LightDuty"];
$BO_Facility = $recordset["BO_Facility"];
$BO_Physician = $recordset["BO_Physician"];
$NatureOfInjury = $recordset["NatureOfInjury"];
$InjuryRpt_File = $recordset["InjuryRpt_File"];
--->
<cfif IsDefined('form.id')>
    <cfquery name="main_query" datasource="jrgm">
        Select * from Form_InjuryReport where IR_ID=<cfqueryparam value="#form.id#" CFSQLType="CF_SQL_INTEGER">
    </cfquery>
    <cfset cv = 0>
    <cfloop query="main_query">
        <cfif cv GT 0>
            <cfset output_str = output_str & multi_delimiter>
        </cfif>
        <cfset output_str = output_str & IR_ID & '|' & InjuryRpt_ID & '|' & InjuryRpt_Date & '|' & InjuryTime & '|' & Location & '|' & Branch & '|' & Employee & '|' & ReportedTo & '|' & Position & '|' & ReportedDate & '|' & BeganTime
             & '|' & Supervisor & '|' & NatureOfInjury & '|' & HarmObject & '|' & ImmActionTaken & '|' & EmployeeStatement & '|' & WitnessStatement & '|' & EmployeePhoneNo & '|' & EmployeeAddress & '|' & EmpDOB & '|' & EmployeeSex & '|' & EmpDOH
             & '|' & SafetyFeature & '|' & PanelOfPhysicians & '|' & MedicalReleaseForm & '|' & DutiesTOA & '|' & DutiesTOAYes & '|' & AccidentPrev & '|' & Explain & '|' & Note & '|' & BO_Status & '|' & BO_MedicalReq
             & '|' & BO_DrugTest & '|' & BO_AccInv & '|' & BO_Hospitalized & '|' & BO_WorkerComp & '|' & BO_WorkerCompNo & '|' & BO_Restrictions & '|' & BO_ListRestrictions & '|' & BO_LightDuty & '|' & BO_Facility
             & '|' & BO_Physician & '|' & InjuryRpt_File>
        <cfset cv++>
    </cfloop>
    <cfinclude template="include_output.cfm">
</cfif>