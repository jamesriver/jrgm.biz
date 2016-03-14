 <cfsetting requesttimeout="7200">
 <!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

 

  <cfquery name="get_cl_dsid" datasource="jrgm"   maxrows="1000">
SELECT    Inspection_ID, Crew_LeaderID ,
 branch_code 
FROM         app_Inspection_Master WHERE  branch_code IS NULL
ORDER by Inspection_ID DESC
  </cfquery>
  
   <!---<cfdump  var="#get_cl_dsid#">
  <cfabort>--->
  <cfloop query="get_cl_dsid" >
 <cfquery name="get_cl_empid" datasource="jrgm">
SELECT [Employee ID], Branch
 FROM         app_employees
WHERE  [Employee ID] =  #get_cl_dsid.Crew_LeaderID# 
  </cfquery>
     <cfif  get_cl_empid.BRANCH EQ 'Richmond' >
    <CFSET branchcode =10>
     <cfelseif get_cl_empid.BRANCH EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif get_cl_empid.BRANCH EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif get_cl_empid.BRANCH EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif get_cl_empid.BRANCH EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif get_cl_empid.BRANCH EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
   <CFSET branchcode =0>
  </cfif>
    <cfquery name="update" datasource="jrgm">
UPDATE app_Inspection_Master SET  branch_code = #branchcode# WHERE Inspection_ID = #get_cl_dsid.Inspection_ID#
  </cfquery>
  </cfloop>



<!--- END --->
<cfabort> --->

<cfquery name="get_cl_dsid" datasource="jrgm"   maxrows="500">
SELECT    ID, Supervisor_ID, Crew_Leader_ID, DS_Date 
 branch_code
FROM         app_daily_sheets WHERE branch_code IS NULL
ORDER by ID DESC
  </cfquery>
  <cfdump  var="#get_cl_dsid#">
  <cfabort>
  <cfloop query="get_cl_dsid" >
 <cfquery name="get_cl_empid" datasource="jrgm">
SELECT [Employee ID], Branch
 FROM         app_employees
WHERE  [Employee ID] =  #get_cl_dsid.Supervisor_ID# 
  </cfquery>
     <cfif  get_cl_empid.BRANCH EQ 'Richmond' >
    <CFSET branchcode =10>
     <cfelseif get_cl_empid.BRANCH EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif get_cl_empid.BRANCH EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif get_cl_empid.BRANCH EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif get_cl_empid.BRANCH EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif get_cl_empid.BRANCH EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
   <CFSET branchcode =0>
  </cfif>
    <cfquery name="update" datasource="jrgm">
UPDATE app_daily_sheets SET  branch_code = #branchcode# WHERE ID = #get_cl_dsid.ID#
  </cfquery>
  </cfloop>
 
 
 

</body>
</html>