<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

 <cfquery name="get_cl_with_CLID" datasource="jrgm">
 UPDATE app_crews set crew_leader_id = NULL WHERE employee_position_id IN (2) AND active_record=1  AND crew_leader_id IS NOT NULL
 </cfquery><br>
 <cfquery name="get_cl_with_CLID" datasource="jrgm">
 UPDATE app_crews set crew_leader_id = NULL WHERE employee_position_id IN (7) AND active_record=1  AND crew_leader_id IS NOT NULL
 </cfquery>
  <cfquery name="get_cl_with_CLID" datasource="jrgm">
 UPDATE app_crews set crew_leader_id = NULL WHERE employee_position_id IN (6) AND active_record=1  AND crew_leader_id IS NOT NULL
 </cfquery>
 
 FIXED

</body>
</html>