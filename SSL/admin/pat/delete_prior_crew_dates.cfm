<cfset todayDate = Now()>
<CFSET todayDate = #DateFormat(todayDate, "mm/dd/yyyy")#>
<cfset yesterday = dateadd("d",-1,todayDate)>
<cfoutput>#todayDate#-#yesterday#</cfoutput>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>

<cfquery name="get_cl_with_CLID" datasource="jrgm">
DELETE FROM app_crews  WHERE end_date < '#todayDate#'
</cfquery>
FIXED
</body>
</html>
