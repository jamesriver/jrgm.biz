<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

<table border="10" style="margin-top:200px; margin-left:200px;">
<tr>
<td>Image 1</td><td>Image 2</td>
</tr>
</table>


	
<cfquery name="q" datasource="jrgm">
SELECT image1 <!--- This column is a longblob --->
from      app_notes  where id  = 158
</cfquery>

<!--- View the data from the DB call --->
<cfdump var="#q#">

<!--- Create a way to view the binary object 
<cfset myImg1 = ImageNew(q.image1)>--->
<!--cfimage action="WRITETOBROWSER" source="#myImg1#"----->


<cfcontent file="#ExpandPath( 'samplepng.png' )#" variable="#ToBinary(q.image1)#"  type="image/png" reset="yes">



<!--- This example shows how to create a ColdFusion image from a Base64 string with headers 
    (used for display in HTML). ---> 
<cfimage source="data:image/PNG;base64,#q.image1#" 
    destination="test_my64.PNG" action="write" isBase64="yes"> 
 
<!--- This example shows how to use the cfimage tag to write a Base64 string without headers. ---> 
<cfimage source="#q.image1#" destination="test_my64.png" 
    action="write" isBase64="yes">
	
<cfimage source="#q.image1#" action="write" destination="new_image.png" isBase64="yes" overwrite="true">


<cfset myImage = ImageReadBase64("data:image/png;base64,/9j/#q.image1#")> 
<cfimage source="#myImage#" destination="test_my64.png" action="write">




</body>
</html>