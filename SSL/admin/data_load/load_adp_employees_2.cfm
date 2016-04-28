 <CFSET checkdate = '#DateFormat(DateAdd('d', -30,Now()),'mm/dd/yyyy')#'>

<!---Make backups for crews and employees tables in case of problems--->
<cfquery name="drop_delete_this_employees_backup" datasource="jrgm">
IF OBJECT_ID('dbo.Delete_this_employees_backup', 'U') IS NOT NULL 
  DROP TABLE dbo.Delete_this_employees_backup; 
</cfquery>
<cfquery name="drop_delete_this_crews_backup" datasource="jrgm">
IF OBJECT_ID('dbo.Delete_this_crews_backup', 'U') IS NOT NULL 
  DROP TABLE dbo.Delete_this_crews_backup; 
</cfquery>

<cfquery name="make_copy"   datasource="jrgm">
SELECT * INTO Delete_this_employees_backup  FROM app_employees
</cfquery>
<cfquery name="make_copy"   datasource="jrgm">
SELECT * INTO Delete_this_crews_backup  FROM app_crews
</cfquery>


<!---<cfquery name="drop_test" datasource="JRGM" >
DROP TABLE app_employees_test_backup;
</cfquery>
--->

<!---<CFSET checkdate = '02/10/2016'>--->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body bgcolor="#FFFFFF">
<!--- Convert file to XML document object --->
<CFSET currentdate = DateFormat(DateAdd('d', 0, Now()), 'yyyymmdd')>
<cfif IsDefined('url.currentdate')>
    <cfset currentdate = url.currentdate>
</cfif>
<cffile action="read" file="C:\inetpub\websites\test.jrgm.biz\SSL\admin\data_load\ADP_JRGM_#currentdate#.xml" variable="myxml">
<cfset mydoc = XmlParse(myxml)>
<!--- get an array of employees --->
<cfset emp = mydoc.ROWSET.XmlChildren>
<cfset size = ArrayLen(emp)>
<cfoutput> Number of employees = #size# <br>
</cfoutput>
<cfparam name="FILE_NUMBER" default="0">
<cfset orderquery = QueryNew("
FIRST_NAME, 
LAST_NAME,
FILE_NUMBER,
JOB_TITLE_DESCRIPTION,
POSITION_STATUS,
PERSONAL_CONTACT__HOME_PHONE
,PERSONAL_CELL,
LEGAL___PREFERRED_ADDRESS__ADDRESS_LINE_1,
LEGAL___PREFERRED_ADDRESS__CITY,
LEGAL___PREFERRED_ADDRESS__STATE___TERRITORY_CODE,
 LEGAL___PREFERRED_ADDRESS__ZIP___POSTAL_CODE, 
 MIDDLE_NAME,
JOB_TITLE_DESCRIPTION,
WORK_CONTACT__WORK_MOBILE,
REPORTS_TO_NAME,
WORK_CONTACT__WORK_EMAIL,
HOME_DEPARTMENT_CODE,
HIRE_DATE,
BIRTH_DATE,
POSITION_EFFECTIVE_DATE,
STATUS_EFFECTIVE_DATE,
REHIRE_DATE,
CUSTOM_AREA_2,
REGULAR_PAY_RATE_AMOUNT"
, "
varchar,
varchar,
Integer,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
varchar,
date,
date,
date,
date,
date,
varchar,
varchar
"

) >
<cfset temp = QueryAddRow(orderquery, #size#)>
<cfloop index="i" from = "1" to = "#size#">
  <cfset  QuerySetCell(orderquery, "FIRST_NAME",mydoc.rowset.ROW[i].FIRST_NAME.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LAST_NAME",mydoc.rowset.ROW[i].LAST_NAME.XmlText, i)>
  <cfif Len(mydoc.rowset.ROW[i].FILE_NUMBER.XmlText)>
    <cfset QuerySetCell(orderquery, "FILE_NUMBER", mydoc.rowset.ROW[i].FILE_NUMBER.XmlText,i)>
  </cfif>
  <cfset  QuerySetCell(orderquery, "JOB_TITLE_DESCRIPTION",mydoc.rowset.ROW[i].JOB_TITLE_DESCRIPTION.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "POSITION_STATUS",mydoc.rowset.ROW[i].POSITION_STATUS.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "PERSONAL_CONTACT__HOME_PHONE",mydoc.rowset.ROW[i].PERSONAL_CONTACT__HOME_PHONE.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "PERSONAL_CELL",mydoc.rowset.ROW[i].PERSONAL_CELL.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LEGAL___PREFERRED_ADDRESS__ADDRESS_LINE_1",mydoc.rowset.ROW[i].LEGAL___PREFERRED_ADDRESS__ADDRESS_LINE_1.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LEGAL___PREFERRED_ADDRESS__CITY",mydoc.rowset.ROW[i].LEGAL___PREFERRED_ADDRESS__CITY.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LEGAL___PREFERRED_ADDRESS__STATE___TERRITORY_CODE",mydoc.rowset.ROW[i].LEGAL___PREFERRED_ADDRESS__STATE___TERRITORY_CODE.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "LEGAL___PREFERRED_ADDRESS__ZIP___POSTAL_CODE",mydoc.rowset.ROW[i].LEGAL___PREFERRED_ADDRESS__ZIP___POSTAL_CODE.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "MIDDLE_NAME",mydoc.rowset.ROW[i].MIDDLE_NAME.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "JOB_TITLE_DESCRIPTION",mydoc.rowset.ROW[i].JOB_TITLE_DESCRIPTION.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "WORK_CONTACT__WORK_MOBILE",mydoc.rowset.ROW[i].WORK_CONTACT__WORK_MOBILE.XmlText, i)>
  <cfset  QuerySetCell(orderquery, "WORK_CONTACT__WORK_EMAIL",mydoc.rowset.row[ i ].WORK_CONTACT__WORK_EMAIL.XMLText, i)>
  <cfset  QuerySetCell(orderquery, "REPORTS_TO_NAME",mydoc.rowset.ROW[i].REPORTS_TO_NAME.XmlText, i)>
  <cfif Len(mydoc.rowset.ROW[i].HOME_DEPARTMENT_CODE.XmlText)>
    <cfset QuerySetCell(orderquery, "HOME_DEPARTMENT_CODE", mydoc.rowset.ROW[i].HOME_DEPARTMENT_CODE.XmlText,i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].HIRE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "HIRE_DATE",mydoc.rowset.ROW[i].HIRE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].BIRTH_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "BIRTH_DATE",mydoc.rowset.ROW[i].BIRTH_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].REHIRE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "REHIRE_DATE",mydoc.rowset.ROW[i].REHIRE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].REGULAR_PAY_RATE_AMOUNT.XmlText)>
    <cfset  QuerySetCell(orderquery, "REGULAR_PAY_RATE_AMOUNT",mydoc.rowset.ROW[i].REGULAR_PAY_RATE_AMOUNT.XmlText, i)>
  </cfif>
  <cfif StructKeyExists(mydoc.rowset.ROW[i], 'CUSTOM_AREA_2')>
        <cfif Len(mydoc.rowset.ROW[i].CUSTOM_AREA_2.XmlText)>
            <cfset  QuerySetCell(orderquery, "CUSTOM_AREA_2",mydoc.rowset.ROW[i].CUSTOM_AREA_2.XmlText, i)>
        </cfif>
      </cfif>
</cfloop>
<!--- <cfdump var=#orderquery#> ---> 
<!---Modified this query 3/16/2016--->

<cfquery name="get_all_employees_in_app_employees" datasource="JRGM" >
 SELECT  [Employee ID] AS employee_ID FROM app_employees     
  </cfquery>
<CFSET mylist ="0">
<cfloop query="get_all_employees_in_app_employees">
  <cfset myList = ListAppend(mylist,employee_ID)>
</cfloop>
<cfquery name="get_all_records"   dbtype="query"  >
 SELECT * FROM orderquery WHERE FILE_NUMBER NOT IN (#myList#)   
 </cfquery>
<!---<cfdump var="#get_all_records#">
<cfabort>--->
<cfloop query="get_all_records">
  <cfparam name="FILE_NUMBER" default="0">
  <cfparam name="branchid" default="00">
  <cfif FILE_NUMBER EQ ''>
    <CFSET FILE_NUMBER = 0>
  </cfif>
  <cfset fullname = first_name & " " & last_name>
  <cfif POSITION_STATUS EQ 'active'>
    <cfset active_record = 1>
    <cfelse>
    <cfset active_record = 0>
  </cfif>
  <cfset branchid = #LEFT(HOME_DEPARTMENT_CODE,2)#>
  <cfif branchid EQ '10' >
    <CFSET branchname ='Richmond'>
    <cfelseif branchid EQ '01' >
    <CFSET branchname ='Richmond'>
    <cfelseif branchid EQ '20' >
    <CFSET branchname ='Portsmouth'>
    <cfelseif   branchid EQ '02'>
    <CFSET branchname ='Portsmouth'>
    <cfelseif branchid EQ '30'  >
    <CFSET branchname ='Charlottesville'>
    <cfelseif   branchid EQ '03'>
    <CFSET branchname ='Charlottesville'>
    <cfelseif branchid EQ '70'  >
    <CFSET branchname ='Williamsburg'>
    <cfelseif  branchid EQ '07'>
    <CFSET branchname ='Williamsburg'>
    <cfelseif branchid EQ '80'  >
    <CFSET branchname ='Chesterfield'>
    <cfelseif   branchid EQ '08'>
    <CFSET branchname ='Chesterfield'>
    <cfelseif branchid EQ '90' >
    <CFSET branchname ='Newport News'>
    <cfelseif  branchid EQ '09'>
    <CFSET branchname ='Newport News'>
    <cfelseif branchid EQ '12'  >
    <CFSET branchname ='Corporate'>
    <cfelseif  branchid EQ '21'>
    <CFSET branchname ='Corporate'>
    <cfelseif  branchid EQ '00'>
    <CFSET branchname ='Unknown'>
    <cfelseif branchid EQ '' >
    <CFSET branchname ='Unknown'>
    <cfelse>
    <CFSET branchname ='Unknown'>
  </cfif>
  <cfif CUSTOM_AREA_2 EQ 'FWW'>
    <cfset fww = 1>
    <cfelse>
    <cfset fww = 0>
  </cfif>
  <cfif REGULAR_PAY_RATE_AMOUNT EQ ''>
    <cfset REGULAR_PAY_RATE_AMOUNT1  = 0>
    <cfset REGULAR_PAY_RATE_AMOUNT2 = 0>
    <cfelse>
    <cfset REGULAR_PAY_RATE_AMOUNT1  = RemoveChars(REGULAR_PAY_RATE_AMOUNT, 1, 2)>
    <cfset REGULAR_PAY_RATE_AMOUNT2 = replace(REGULAR_PAY_RATE_AMOUNT1,",","","all")>
  </cfif>
  <cfquery name="insert_into_SQL" datasource="JRGM">
 Insert INTO app_employees ([Employee ID],first_name,last_name,employee_address, employee_city, employee_state, 
 employee_zip_code,  employee_phone,MIDDLE_NAME,position,[Ph Cell],phone_cell,[Ph Home],[Direct Supervisor],[Name FirstLast],email,active_record,branch, export_date,employee_hire_date,employee_dob,employee_rehire_date,fww,regular_pay_rate)
 VALUES ('#FILE_NUMBER#','#get_all_records.first_name#','#get_all_records.last_name#','#get_all_records.LEGAL___PREFERRED_ADDRESS__ADDRESS_LINE_1#','#get_all_records.LEGAL___PREFERRED_ADDRESS__CITY#',	'#get_all_records.LEGAL___PREFERRED_ADDRESS__STATE___TERRITORY_CODE#', '#get_all_records.LEGAL___PREFERRED_ADDRESS__ZIP___POSTAL_CODE#', '#get_all_records.PERSONAL_CONTACT__HOME_PHONE#',
'#get_all_records.MIDDLE_NAME#','#get_all_records.JOB_TITLE_DESCRIPTION#','#get_all_records.PERSONAL_CELL#','#get_all_records.WORK_CONTACT__WORK_MOBILE#','#get_all_records.PERSONAL_CONTACT__HOME_PHONE#','#get_all_records.REPORTS_TO_NAME#','#fullname#','#get_all_records.WORK_CONTACT__WORK_EMAIL#'
,#active_record#,'#branchname#',CURRENT_TIMESTAMP,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.HIRE_DATE#">,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.BIRTH_DATE#">,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.REHIRE_DATE#">,'#FWW#',#REGULAR_PAY_RATE_AMOUNT2#)
 </cfquery>
</cfloop>
<!--- Get Supervisors ID for Crew Leaders & Supervisors --->
<cfquery name="get_all_CL_records"   datasource="jrgm">
   SELECT [Employee ID], [Direct Supervisor] AS DirectSupervisor, [Name FirstLast] AS employee_name ,ID, last_name,first_name FROM app_employees 
   WHERE  Position IN ('Crew Leader','Maintenance Supervisor','Production Manager','Account Manager')
  </cfquery>
<cfloop query="get_all_CL_records">
  <CFSET supervisor_last_name = ListFirst(get_all_CL_records.DirectSupervisor) >
  <CFSET supervisor_first_name = ListLast(get_all_CL_records.DirectSupervisor)>
  <cfset fullname_crew_leader =  '#get_all_CL_records.last_name#, #get_all_CL_records.first_name#' >
  <cfset fullname_supervisor2 =  '#supervisor_first_name# #supervisor_last_name#' >
  <cfset fullname_supervisor  =  '#TRIM(fullname_supervisor2)#' >
  <cfquery name="get_supervisor_id"   datasource="jrgm">
  SELECT [Employee ID] AS empid FROM app_employees 
  WHERE   [Name FirstLast] =  '#fullname_Supervisor#'  
  </cfquery>
  <cfquery name="update_supervisor_id"   datasource="jrgm">
  UPDATE app_employees SET  Direct_Supervisor_ID = '#get_supervisor_id.empid#'
  WHERE  ID =#get_all_CL_records.ID#
  </cfquery>
</cfloop>
<!-----------------  This is the end of step 1 ----------------------> 
<!-----------------  This is the end of step 1 ----------------------> 
<!-----------------  This is the end of step 1 ---------------------->
<cfquery name="get_modified_records"   datasource="jrgm" >
  SELECT [Employee ID] AS employee_id, branch,active_record,[Name FirstLast] AS employee_name,employee_rehire_date,fww,regular_pay_rate FROM app_employees_test 
  WHERE   POSITION_EFFECTIVE_DATE > '#checkdate#' AND  [Employee ID] > 0
  </cfquery>
<cfloop query="get_modified_records">
  <cfquery name="get_modified_records_was"   datasource="jrgm">
  SELECT [Employee ID] AS employee_id, branch,active_record,[Name FirstLast] AS employee_name  FROM app_employees 
  WHERE  [Employee ID] =#get_modified_records.employee_id#
  </cfquery>
  <cfif get_modified_records_was.recordcount GT 0>
    <br>
    Modified: <cfoutput>#employee_id#</cfoutput>
    <cfquery name="update_records"   datasource="jrgm">
  UPDATE app_employees SET  active_record = '#get_modified_records.active_record#',
  branch = '#get_modified_records.branch#', last_modified_date =CURRENT_TIMESTAMP,  employee_rehire_date = <cfqueryparam cfsqltype="cf_sql_date" value="#get_modified_records.employee_rehire_date#"> ,fww='#get_modified_records.fww#',regular_pay_rate =#regular_pay_rate#
  WHERE  [Employee ID] =#get_modified_records.employee_id#
  </cfquery>
    <cfif (get_modified_records_was.active_record NEQ get_modified_records.active_record) OR (get_modified_records_was.branch NEQ get_modified_records.branch)>
      <cfoutput> #get_modified_records.employee_name# (#employee_id#) ACTIVE_RECORD WAS #get_modified_records_was.active_record# IS NOW #get_modified_records.active_record#. <br>
        #get_modified_records.employee_name# (#employee_id#) BRANCH WAS #get_modified_records_was.branch# IS NOW #get_modified_records.branch# <br>
      </cfoutput>
    </cfif>
    <cfelse>
    <cfoutput> I need to insert this employee (#employee_name#) (#employee_id#) into the app_employees_db</cfoutput><br>
  </cfif>
</cfloop>
<!-----------------  This is the end of step 2 ----------------------> 
<!-----------------   This is the end of step 2 ----------------------> 
<!-----------------    This is the end of step 2 ---------------------->
<cfquery name="getrecords_Inactivate"   datasource="jrgm">
SELECT [Employee ID] AS empid,  [Name FirstLast] AS empname,branch
FROM app_employees
WHERE active_record = 1 AND  [Employee ID] < 9500 AND   [Employee ID]  NOT IN (SELECT [Employee ID] FROM app_employees_test)
ORDER by branch
</cfquery>
<br>
<br>
<cfloop query="getrecords_Inactivate">
  Employees that are not in the ADP active file and Inactivated : <cfoutput>#empid#</cfoutput>
  <cfquery name="update_app_employees"   datasource="jrgm">
UPDATE app_employees SET active_record = 0,last_modified_date =CURRENT_TIMESTAMP
WHERE [Employee ID] = #getrecords_Inactivate.empid#
</cfquery>
  <cfquery name="delete_from_crews"   datasource="jrgm">
DELETE FROM app_crews
WHERE employee_id = #getrecords_Inactivate.empid#
</cfquery>
  <!--- Do this Inactivate Password  ---> 
  <!--- Do this Check for Crew_leader_id and supervisor_id in APP_CREWS ---> 
  <cfoutput>(#getrecords_Inactivate.empname#) (#getrecords_Inactivate.empid#) have been inactivated in app_employees table</cfoutput><br>
  
  
</cfloop>
<!-----------------  This is the end of step 3 ----------------------> 
<!-----------------    This is the end of step 3 ----------------------> 
<!-----------------    This is the end of step 3 ----------------------> 
Data Updated
<cfabort>

</body>
</html>
