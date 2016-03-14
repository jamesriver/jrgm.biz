<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset employee_name = Firstname &" "& Lastname>
<cfquery name="insert_user_pwtable" datasource="#request.dsn#">
 INSERT INTO  app_employee_passwords (Employee_ID, username, password, employee_name, access_role, employee_active, firstname, lastname, date_added, employee_branch,password_date,app_language,email) VALUES ( #Employee_ID#, '#username#', '#password#', '#employee_name#', #access_role#, #employee_active#, '#firstname#', '#lastname#', #todayDate#, '#employee_branch#',#todayDate#,'#app_language#','#email#' )
  </cfquery>
<!--- email, app_language, --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <div class="header"> Administrative &#8212; Log In Credentials&nbsp; &nbsp;&#8212; Add User&nbsp; </div>
    <div id="maincontent"> <span class="lgaddress"><br />
      The user has been added. Go <a href="credentials.cfm">here</a> to view the employee password list </span><br />
      <br />
    </div>
  </div>
</div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
