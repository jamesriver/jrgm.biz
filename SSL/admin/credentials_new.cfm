<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!---<div id="outerfull">
--->
<div id="centrecontent">
<cfinclude template="includes/topbar.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<div class="header"> Administrative - Log In Credentials </div>
<div id="maincontent">
  <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Username</th>
        <th>Password</th>
        <th>Position</th>
      </tr>
    </thead>
    <tbody>
      <cfquery name="get_un_pw" datasource="jrgm"  > 
SELECT  * FROM app_employee_passwords   ORDER by lastname,firstname
      </cfquery>
      <cfoutput query="get_un_pw">
        <tr>
          <td>#firstname#</td>
          <td>#lastname#</td>
          <td>#Username#</td>
          <td>#Password#</td>
          <cfif access_role EQ 1>
            <CFSET position = 'Supervisor'>
          </cfif>
          <cfif access_role EQ 2>
            <CFSET position = 'Crew Leader'>
          </cfif>
          <td>#position#</td>
        </tr>
      </cfoutput>
    </tbody>
  </table>
  <p>&nbsp;</p>
</div>
<div id="clearfooter"></div>
<!-- to clear footer -->
<!---</div>--->
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
