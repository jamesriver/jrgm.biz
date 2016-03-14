<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

 


<cfquery name="q" datasource="jrgm">
SELECT image1  
from      app_notes  where id  = 151
</cfquery>

<!--- View the data from the DB call --->
<!--- <cfdump var="#q#"> --->

<cfcontent variable="#ToBinary(q.image1)#" type="image/png">

<!--- Now convert the binary object from the DB to a base64 string --->
<cfset doc = tobase64(q.document)>
<!--- Display the base64 string --->
<!--- <cfoutput>#doc#</cfoutput> --->

<!--- Convert the base64 string to a binary object --->
<cfset doc = toBinary(doc)>

<!--- Dump the converted base64 to a binary object to view it --->
<!--- <cfdump var="#doc#"> --->

<!--- Create a way to view the binary object --->
<cfset myImg2 = ImageNew(doc)>



 <cfimage
action="CONVERT"
source="#myImg2#"
destination="myimage.png"
overwrite="true"
name="objImage"
/>
 
 





 <cfimage  action="WRITETOBROWSER" source="#myImg2#" format ="png"    >
 
  <cfimage  action="WRITETOBROWSER" source="#myImg2#" format ="png"    >
   <cfimage  action="WRITETOBROWSER" source="#myImg2#" format ="png"    >
 
 <!--- <cfimage
action="WRITE"
source="#myImg2#"
destination="funny.gif"
overwrite="true"
/>   --->
  
</body>
</html>