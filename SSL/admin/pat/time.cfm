<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="../js/sorttable.js"></script>
<script src="../js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent">
<!--centre content goes here -->
<div class="centrecontent_inner">
  <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out)   where ds_ID > 15000
      </cfquery>
  <cfquery name="update_employee_time" datasource="jrgm">
    UPDATE APP_Employee_Payroll_Clock SET time_worked = DATEDIFF(mi,time_in,time_out), in_out_status=2    
    WHERE time_out IS NOT NULL  AND ds_ID > 15000
     </cfquery>
  <cfquery name="update_job_clock" datasource="jrgm">
    UPDATE APP_Job_Clock SET job_time_worked = DATEDIFF(mi,job_time_in,job_time_out), in_out_status=2     
    WHERE job_time_out IS NOT NULL AND ds_ID > 15000
     </cfquery>
  <cfquery name="update_job_services_clock" datasource="jrgm">
    UPDATE   APP_Job_Services_Clock SET service_time = DATEDIFF(mi,service_time_in,service_time_out)   
    WHERE service_time_out IS NOT NULL AND Service_Time IS NULL  AND ds_ID > 15000
     </cfquery>
  <cfquery name="update_job_services_actual_employee__clock" datasource="jrgm">
    UPDATE APP_Job_Services_Actual_Employee SET total_time = DATEDIFF(mi,service_time_in,service_time_out)   
    WHERE  service_time_out IS NOT NULL  AND Total_Time IS NULL AND ds_ID > 15000
     </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_job_services_clock  WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE  FROM  app_employee_payroll_clock WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE  FROM  app_lunch WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_job_clock WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM   APP_job_materials_actual WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_Lunch WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_job_services_actual_employee WHERE job_clock_id NOT IN (SELECT ID FROM app_job_clock)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_Job_Services_Clock WHERE job_clock_id NOT IN (SELECT ID FROM app_job_clock)
    </cfquery>
  <cfquery name="insert_job" datasource="jrgm">
   DELETE   FROM APP_GPS WHERE DS_ID NOT IN (SELECT ID FROM APP_daily_sheets)
    </cfquery>
  Done! </div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
