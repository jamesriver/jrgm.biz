<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

 


<cfquery name="q" datasource="jrgm">
SELECT image1 <!--- This column is a longblob --->
from      app_notes  where id  = 158
</cfquery>

<!--- View the data from the DB call --->
<cfdump var="#q#">

<!--- Create a way to view the binary object 
<cfset myImg1 = ImageNew(q.image1)>--->
<!--cfimage action="WRITETOBROWSER" source="#myImg1#"----->

<cfcontent variable="#ToBinary(q.image1)#" type="image/png">

<!--- Now convert the binary object from the DB to a base64 string --->
<cfset doc = tobase64(q.document)>
<!--- Display the base64 string --->
<cfoutput>#doc#</cfoutput>

<!--- Convert the base64 string to a binary object --->
<cfset doc = toBinary(doc)>

<!--- Dump the converted base64 to a binary object to view it --->
<cfdump var="#doc#">

<!--- Create a way to view the binary object --->
<cfset myImg2 = ImageNew(doc)>
<cfimage action="WRITETOBROWSER" source="#myImg2#">






 
<!--- <cfimage action="writetobrowser" source="#selectQuery.image1#" />
 
<cfimage action="rotate" angle="180" source="#selectQuery.image1#" name="rotatedImage" />
 
<cfimage action="writetobrowser" source="#rotatedImage#" />
 
 ---> 
 
 
 
          
  <!---         <cffile
action="READBINARY"
file="#ExpandPath( '1.jpg' )#"
variable="getpix.myimage"
/>
  --->
<!---
Read in the Base64 image data. To get Base64 image
data, we can convert the binary read we did above.
--->
<!--- <cfimage
action="INFO"
source="#ToBase64( binImage )#"
structname="objImageInfo"
isbase64="true"
/> --->
          
          
          
        <!---   <cfcontent variable="#toBinary(toBase64(myimage))#" type="image/png" reset="true" /> --->
          
<!---           <cfcontent type="image/jpeg; charset=8859_1">
<cfscript>
writeOutput(toString(getBLOB.file));
</cfscript> --->
           
          
          
          
       <!---    <cfcontent type="application/unknown">

<cfquery name="GetBlob" datasource="jrgm">
SELECT image1 AS myimage,LEN(image1) AS myimage2 FROM 
       app_notes where ID =151
       ORDER by ID desc
</cfquery>

<cfoutput>#ToBinary(GetBlob.file)#</cfoutput>

 --->


<!---           
          
          <!--- Get image --->
 <cfquery datasource="jrgm" name="image">
 SELECT image1 AS myimage,LEN(image1) AS myimage2 FROM 
       app_notes where ID =151
       ORDER by ID desc
 </cfquery>
 <!--- Set MIME type to GIF or JPEG or ... --->
  <cfcontent variable="image.myimage" type="image/jpeg" > --->
          
 

<!--- <<!--- !------------------ RETRIEVE IMAGE --------------------> 
<CFQUERY NAME="getImage" DATASOURCE="jrgm"> 
SELECT image1 AS myimage,LEN(image1) AS myimage2
FROM app_notes 
WHERE id = 151
</CFQUERY> 

<!--- Output binary object to JPEG format for viewing. ---> 
<cffile action="write" file = "C:\ColdFusion9\wwwroot\JRGM\SSL\notespictures\somewhereB.jpg" output ="#getImage.myimage#"> 

<!--- HTML to view image. ---> 
<img src="C:\ColdFusion9\wwwroot\JRGM\SSL\notespictures\somewhereB.jpg">  --->

 
</body>
</html>