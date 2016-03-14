<cfparam  name="Session.firstname" default="">
<cfparam  name="Session.lastname" default=""  >
<cfparam  name="Session.employee_branch" default=""  >
<cfparam  name="Session.access_role" default=""  >
<cfparam  name="Session.username" default=""  >
<cfparam  name="Session.password" default=""  >
<cfparam  name="Session.email" default=""  >
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
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<div class="header"> Administrative &#8212; Log In Credentials&nbsp; &nbsp;&#8212; Add User&nbsp; </div>
<div id="maincontent">
  <form action="credentials_add2.cfm" method="post"   name="form1" id="form1">
    <table  border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td class="services_table">Employee ID</td>
        <td class="services_table"><input name="Employee_ID" type="text" id="Employee_ID" tabindex="1" size="10" maxlength="10"  /></td>
      </tr>
      <tr>
        <td class="services_table">First Name</td>
        <td class="services_table"><input name="firstname" type="text" class="formdata" tabindex="2" size="40" maxlength="40"  <cfoutput>value="#Session.firstname#"</cfoutput>/>
        </td>
      </tr>
      <tr>
        <td class="services_table">Last Name</td>
        <td class="services_table"><input name="lastname" type="text" class="formdata" tabindex="3" size="40" maxlength="40"  <cfoutput>value="#Session.lastname#"</cfoutput>/>
        </td>
      </tr>
      <tr>
        <td class="services_table">Branch</td>
        <td class="services_table"><select name="employee_branch" tabindex="4">
            <option value="Charlottesville">Charlottesville</option>
            <option value="Chesterfield">Chesterfield</option>
            <option value="Newport News">Newport News</option>
            <option value="Portsmouth">Portsmouth</option>
            <option value="Richmond">Richmond</option>
            <option value="Williamsburg">Williamsburg</option>
          </select></td>
      </tr>
      <tr>
        <td class="services_table">Position</td>
        <td class="services_table"><select name="access_role" tabindex="5">
            <option value="9">Branch Manager</option>
            <option value="2">Crew Leader</option>
            <option value="99">Regional Manager</option>
            <option value="1">Supervisor</option>
          </select></td>
      </tr>
      <tr>
        <td class="services_table">Email</td>
        <td class="services_table"><input name="email" type="text" class="formdata" id="email" tabindex="6" size="40" maxlength="50"  <cfoutput>value="#Session.username#"</cfoutput>/></td>
      </tr>
      <tr>
        <td class="services_table">Username</td>
        <td class="services_table"><input name="username" class="formdata" type="text" tabindex="7" maxlength="50"  <cfoutput>value="#Session.username#"</cfoutput>/></td>
      </tr>
      <tr>
        <td class="services_table">Password</td>
        <td class="services_table"><input name="password" class="formdata" type="text" tabindex="8" maxlength="50"  <cfoutput>value="#Session.password#"</cfoutput>/></td>
      </tr>
      <tr>
        <td class="services_table">Active</td>
        <td class="services_table"><select name="employee_active" tabindex="9">
            <option value="1">Active</option>
            <option value="0">Inactive</option>
          </select></td>
      </tr>
      <tr>
        <td class="services_table">Language</td>
        <td class="services_table"><select name="app_language" tabindex="10">
            <option value="1">English</option>
            <option value="0">Spanish</option>
          </select></td>
      </tr>
      <tr>
        <td class="services_table">&nbsp;</td>
        <td class="services_table"><input type="submit" name="submit"   value="Submit" /></td>
      </tr>
    </table>
  </form>
  <br />
  <br />
</div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
