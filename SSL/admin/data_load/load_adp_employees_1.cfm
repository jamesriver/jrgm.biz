

<CFSET checkdate = '#DateFormat(DateAdd('d', -30,Now()),'mm/dd/yyyy')#'>

<!---<cfabort>--->

<cfquery name="make_copy"   datasource="jrgm">
SELECT * INTO app_employees_test_backup  FROM app_employees_test
</cfquery>
<cfquery name="delete_old_records"   datasource="jrgm">
DELETE FROM   app_employees_test  
 </cfquery>
<cfquery name="drop_test1" datasource="JRGM" >
DROP TABLE Delete_this_employees_backup;
</cfquery>
<cfquery name="drop_test2" datasource="JRGM" >
DROP TABLE Delete_this_crews_backup;
</cfquery>

 

<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body bgcolor="#FFFFFF">
<!--- Convert file to XML document object --->
<cffile action="read" file="C:\inetpub\websites\jrgm.biz\SSL\admin\data_load\ADP_JRGM.xml" variable="myxml">
<cfset mydoc = XmlParse(myxml)>
<!--- get an array of employees --->
<cfset emp = mydoc.ROWSET.XmlChildren>
<cfset size = ArrayLen(emp)>
<cfoutput> Number of employees = #size# <br>
</cfoutput> 
<!--- <cfabort> --->
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
  <cfif Len(mydoc.rowset.ROW[i].POSITION_EFFECTIVE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "POSITION_EFFECTIVE_DATE",mydoc.rowset.ROW[i].POSITION_EFFECTIVE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].STATUS_EFFECTIVE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "STATUS_EFFECTIVE_DATE",mydoc.rowset.ROW[i].STATUS_EFFECTIVE_DATE.XmlText, i)>
  </cfif>
  <cfif Len(mydoc.rowset.ROW[i].REHIRE_DATE.XmlText)>
    <cfset  QuerySetCell(orderquery, "REHIRE_DATE",mydoc.rowset.ROW[i].REHIRE_DATE.XmlText, i)>
  </cfif>
  <cfset  QuerySetCell(orderquery, "CUSTOM_AREA_2",mydoc.rowset.ROW[i].CUSTOM_AREA_2.XmlText, i)>
  <cfif Len(mydoc.rowset.ROW[i].REGULAR_PAY_RATE_AMOUNT.XmlText)>
    <cfset  QuerySetCell(orderquery, "REGULAR_PAY_RATE_AMOUNT",mydoc.rowset.ROW[i].REGULAR_PAY_RATE_AMOUNT.XmlText, i)>
  </cfif>
</cfloop>
<cfquery name="get_all_records"   dbtype="query"  >
   SELECT * FROM orderquery    
  </cfquery>
<!---   <cfdump var=#get_all_records#>    --->
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
 Insert INTO   app_employees_test ([Employee ID],first_name,last_name,employee_address, employee_city, employee_state, 
 employee_zip_code, employee_phone,MIDDLE_NAME,position,[Ph Cell],phone_cell,[Ph Home],[Direct Supervisor],[Name FirstLast],email,active_record,branch, export_date,employee_hire_date,employee_dob,POSITION_EFFECTIVE_DATE,STATUS_EFFECTIVE_DATE , employee_rehire_date,fww ,regular_pay_rate )
  VALUES ('#FILE_NUMBER#','#get_all_records.first_name#','#get_all_records.last_name#','#get_all_records.LEGAL___PREFERRED_ADDRESS__ADDRESS_LINE_1#','#get_all_records.LEGAL___PREFERRED_ADDRESS__CITY#',	'#get_all_records.LEGAL___PREFERRED_ADDRESS__STATE___TERRITORY_CODE#','#get_all_records.LEGAL___PREFERRED_ADDRESS__ZIP___POSTAL_CODE#', 
 '#get_all_records.PERSONAL_CONTACT__HOME_PHONE#',
'#get_all_records.MIDDLE_NAME#','#get_all_records.JOB_TITLE_DESCRIPTION#','#get_all_records.PERSONAL_CELL#','#get_all_records.WORK_CONTACT__WORK_MOBILE#','#get_all_records.PERSONAL_CONTACT__HOME_PHONE#',
'#get_all_records.REPORTS_TO_NAME#','#fullname#' ,'#get_all_records.WORK_CONTACT__WORK_EMAIL#'
,#active_record#,'#branchname#',CURRENT_TIMESTAMP,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.HIRE_DATE#">,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.BIRTH_DATE#">,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.POSITION_EFFECTIVE_DATE#">,<cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.STATUS_EFFECTIVE_DATE#">, <cfqueryparam cfsqltype="cf_sql_date" value="#get_all_records.REHIRE_DATE#">, '#FWW#' ,#REGULAR_PAY_RATE_AMOUNT2#)
 </cfquery>
</cfloop>
Done -Data loaded in app_employees_test
</body>
</html>
