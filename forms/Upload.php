<?php
$allowedExts = array("gif", "jpeg", "jpg", "png");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);
if ((($_FILES["file"]["type"] == "image/gif")
|| ($_FILES["file"]["type"] == "image/jpeg")
|| ($_FILES["file"]["type"] == "image/jpg")
|| ($_FILES["file"]["type"] == "image/pjpeg")
|| ($_FILES["file"]["type"] == "image/x-png")
|| ($_FILES["file"]["type"] == "image/png"))
&& in_array($extension, $allowedExts))
  {
	  if ($_FILES["file"]["error"] > 0)
		{
			echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
		}
	  else
		{
			echo "Upload: " . $_FILES["file"]["name"] . "<br>";
			echo "Type: " . $_FILES["file"]["type"] . "<br>";
			echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
			echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";

			// Where the file is going to be placed 
			$target_path = '\photos';
$target_path = "photos/".$_FILES['file']['name'];
			//$target_path = $target_path. basename( $_FILES['file']['name']); 

			if(move_uploaded_file($_FILES['file']['tmp_name'], $target_path)) 
			{
				 echo "The file ".  basename( $_FILES['file']['name']). 
				 " has been uploaded";
			} 
			else
			{
				 echo "There was an error uploading the file, please try again!";
				 echo print_r($_FILES);
			}
		}
	}
else
  {
  echo "Invalid file";
  }
?>

<html>
<body>

<form action="upload.php" method="post" enctype="multipart/form-data">
<label for="file">Filename:</label>
<input type="file" name="file" id="file"><br>
<input type="submit" name="submit" value="Submit">
</form>

</body>
</html>