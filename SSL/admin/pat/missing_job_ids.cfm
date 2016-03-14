<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>
<cfquery name="missing_job_ids" datasource="jrgm">
SELECT DISTINCT  job_id
FROM app_job_services_actual_employee
WHERE job_id NOT IN
(SELECT [Job ID] FROM app_jobs)
 </cfquery>
<cfdump  var="#missing_job_ids#">
<cfquery name="missing_job_ids_JC" datasource="jrgm">
 SELECT  DISTINCT  job_id
FROM app_job_clock
WHERE (job_id NOT IN
(SELECT  [Job ID]   FROM app_jobs))
 </cfquery>
<cfdump  var="#missing_job_ids_JC#">
<cfquery name="missing_job_ids_JC1" datasource="jrgm">
 SELECT  DISTINCT  job_id
FROM app_job_services_clock
WHERE (job_id NOT IN
(SELECT  [Job ID]   FROM app_jobs))
 </cfquery>
<cfdump  var="#missing_job_ids_JC1#">
</body>
</html>
