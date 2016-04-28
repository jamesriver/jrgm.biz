<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE Employee_ID =#form.Employee_ID# 
AND ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) 
   VALUES 
   ('#form.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )
   </cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <!---  <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">  --->
  <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
    <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
  </cfif>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<!----------------Start Multiple----------------------------- --->
<cfif IsDefined("form.ds_id") AND  IsDefined("form.submitall")>
  <cfquery name="getallemployeesonthisjob" datasource="jrgm">
SELECT DISTINCT employee_id  FROM app_job_services_actual_employee
 WHERE  ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
  </cfquery>
  <cfquery name="delete_employee_time" datasource="jrgm">
DELETE  FROM app_job_services_actual_employee
 WHERE   ds_id = #form.ds_id#
AND JOB_clock_ID = #form.JOB_clock_ID#
    </cfquery>
  <cfloop query="getallemployeesonthisjob">
    <cfif IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1000,#SERVICE1000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1010,#SERVICE1010#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1020,#SERVICE1020#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1040,#SERVICE1040#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1070,#SERVICE1070#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1080,#SERVICE1080#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',1090,#SERVICE1090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2000,#SERVICE2000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2030,#SERVICE2030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2050,#SERVICE2050#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',2060,#SERVICE2060#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#form.employee_id#','#form.job_id_J#',2090,#SERVICE2090#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',3030,#SERVICE3030#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
    <cfif IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "">
      <cfquery name="insert_time" datasource="jrgm">
   INSERT INTO app_job_services_actual_employee 
   (Employee_ID,Job_ID,Service_ID,Total_Time,ds_id,crew_leader,job_clock_id,Service_Time_In) VALUES 
   ('#getallemployeesonthisjob.employee_id#','#form.job_id_J#',4000,#SERVICE4000#,#form.ds_id#,#form.crew_Leader_id#,'#form.job_clock_id#', '#DateFormat(form.ds_date, 'yyyy-mm-dd')# 00:00:00.000' )</cfquery>
    </cfif>
  </cfloop>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<!----------------------------End Multiple-------------------------------------- --->
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfif IsDefined("form.Employee_ID")>
  <CFSET Employee_ID= form.Employee_ID>
  <cfelseif IsDefined("url.Employee_ID")>
  <CFSET Employee_ID= url.Employee_ID>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
</cfquery>
<cfquery name="get_employee_service_time_main" datasource="jrgm">
SELECT  * FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID ASC
</cfquery>
<cfquery name="get_employee_service_time" datasource="jrgm">
SELECT  * FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID DESC 
</cfquery>
<!---  <cfquery name="get_employee_service_IDS" datasource="jrgm">
SELECT  service_id FROM app_job_services_actual_employee 
WHERE Employee_ID =#Employee_ID# 
AND ds_id = #ds_id#
AND JOB_clock_ID = #JOB_clock_ID#
ORDER by ID ASC
</cfquery>


<cfset serviceid_list = ValueList(get_employee_service_IDS.service_id)>
<cfoutput>#serviceid_list#</cfoutput> --->
<cfquery name="get_job_name" datasource="jrgm">
SELECT  ID, [Wk Location Name] AS jobname, [Job ID] AS job_ID FROM app_jobs 
WHERE   [Job ID] = '#get_employee_service_time.JOB_ID#'
ORDER by ID ASC
  </cfquery>
<CFSET getrowcount =#get_employee_service_time.recordcount#>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/dsicons.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
</head>
<body>

<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 


<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <div class="page-title">
        <h1>Employee Service Time Editor</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar"> 
        <ul class="page-breadcrumb breadcrumb">
        <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li> <a href="dailysheet_select.cfm">Daily Sheet</a><i class="fa fa-circle"></i> </li>
        <li> <a href="daily_sheet_edit.cfm">Edit Daily Sheet</a><i class="fa fa-circle"></i> </li>
        <li class="active">Employee Service Time Editor</li>
      </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
   <div class="page-content">
		<div class="container-fluid">
	
					<div class="row">
					  <div class="col-md-12">
                      
                    <table class="table large">
        <tr>
          <td><strong>Date: <cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></strong></td>
          <td><strong>DSID: <cfoutput>#DS_ID#</cfoutput></strong></td>
        </tr>
        <tr>
          <td><strong>Supervisor: <cfoutput>#get_supervisor.employeename#</cfoutput></strong></td>
          <td><strong>Crew Leader: <cfoutput>#get_crew_leader.employeename#</cfoutput></strong></td>
        </tr>
        <tr>
          <td><strong>Employee Name: <cfoutput>#get_employee.employeename#</cfoutput></strong></td>
          <td><strong>Job Name: <cfoutput>#get_job_name.jobname#</cfoutput></strong></td>
        </tr>
        <tr>
          <td colspan="2"><strong>Total Time to Account For: <cfoutput>#url.totalminutes#</cfoutput> minutes</strong></td>
        </tr>
      </table>
      <form  method="post" action="daily_sheet_edit_employee_service_time1.cfm"   >
      <div align="center">
        <p class="text-danger"><strong>Please enter time worked for each service in minutes.</strong></p></div>
        <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th><div align="center">1000<br />Compl</div></th>
            <th><div align="center">1010<br />Prune</div></th>
            <th><div align="center">1020<br /> Trash Rem</div></th>
            <th><div align="center">1040<br />Edge</div></th>
            <th><div align="center">1070<br />Turf Fert</div></th>
            <th><div align="center">1080<br />Aer</div></th>
            <th><div align="center">1090<br />Overseed</div></th>
            <th><div align="center">2000<br />Lime</div></th>
            <th><div align="center">2030<br />Seas Col</div></th>
            <th><div align="center">2050<br />Leaf Rem</div></th>
            <th><div align="center">2060<br />Misc.</div></th>
            <th><div align="center">2090<br />BdWeed</div></th>
            <th><div align="center">3030<br />BdMulch</div></th>
            <th><div align="center">4000<br />Extra</div></th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <cfloop index = "ListElement" list = "1000,1010,1020,1040,1070,1080,1090,2000,2030,2050,2060,2090,3030,4000">
              <td><div align="center"><CFSET service_ID =#ListElement#>
                <cfquery name="get_employee_service_time" datasource="jrgm">
            SELECT  total_time FROM app_job_services_actual_employee 
            WHERE Employee_ID =#Employee_ID# 
            AND ds_id = #ds_id#
            AND JOB_clock_ID = #JOB_clock_ID#
            AND service_ID = #service_ID#
           </cfquery>
                <cfif get_employee_service_time.recordcount GT 0>
                  <cfoutput query="get_employee_service_time">
                    <input type="text" value="#total_time#" name="service#service_ID#"  maxlength="5"  size="5" />
                  </cfoutput>
                  <cfelse>
                  <cfoutput>
                    <input type="text" value="" name="service#service_ID#"  maxlength="5"  size="5" />
                  </cfoutput>
                </cfif></div>
              </td>
            </cfloop>
          </tr>
          
          <tr>
            <td colspan="4">&nbsp;</td>
            <td colspan="6" align="right">&nbsp;</td>
            <td colspan="6" align="right">&nbsp;</td>
          </tr>
          <tr> <cfoutput>
              <td colspan="4"><a href="daily_sheet_edit.cfm?dsid=#ds_id#" class="btn btn-primary">Back to Daily Sheet</a></td>
            </cfoutput>
            <td colspan="6" align="right"><input type="submit" name="submit" id="submit" class="btn btn-primary" value="Use for this Employee Only" /></td>
            <td colspan="6" align="right"><input type="submit" name="submitall" id="submit" class="btn btn-primary" value="Use for ALL Employees on this Job" /></td>
          </tr>
          <tr>
            <td colspan="10" align="left" ><strong>
              <cfif   
			 IsDefined("form.SERVICE1000") AND form.SERVICE1000 NEQ ""  
			 OR
			  IsDefined("form.SERVICE1010") AND form.SERVICE1010 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1020") AND form.SERVICE1020 NEQ ""
			  OR
			 IsDefined("form.SERVICE1040") AND form.SERVICE1040 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1070") AND form.SERVICE1070 NEQ "" 
			  OR
			  IsDefined("form.SERVICE1080") AND form.SERVICE1080 NEQ "" 
			  OR
			 IsDefined("form.SERVICE1090") AND form.SERVICE1090 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2000") AND form.SERVICE2000 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2030") AND form.SERVICE2030 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2050") AND form.SERVICE2050 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2060") AND form.SERVICE2060 NEQ "" 
			  OR
			 IsDefined("form.SERVICE2090") AND form.SERVICE2090 NEQ "" 
			  OR
			 IsDefined("form.SERVICE3030") AND form.SERVICE3030 NEQ "" 
			 OR
			 IsDefined("form.SERVICE4000") AND form.SERVICE4000 NEQ "" 
			 >
                <span class="text-danger">The time has been addded</span>
              </cfif>
            </strong></td>
            <td colspan="4" align="right" class="dailysheetEditTop">&nbsp;</td>
          </tr></tbody>
          <cfoutput>
            <input type="hidden" name="crew_leader_id"   value="#get_employee_service_time_main.crew_leader#" />
            <input type="hidden" name="job_clock_id"   value="#get_employee_service_time_main.job_clock_id#" />
            <input type="hidden" name="job_id_J"   value="#get_employee_service_time_main.Job_ID#" />
            <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
          </cfoutput>
        </table>
      </form>

                       
					
		</div>
	  </div>
      <!-- END PAGE CONTENT INNER --> 
    </div>
  </div>
  <!-- END PAGE CONTENT --> 
</div>
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/clockface/js/clockface.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
        jQuery(document).ready(function() {       
           // initiate layout and plugins
           Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
           ComponentsPickers.init();
        });   
    </script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>