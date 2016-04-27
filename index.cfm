<cfif CGI.HTTP_HOST CONTAINS "test.jrgm.biz">
    <cflocation url="http://test.jrgm.biz/2016/index.cfm" addtoken="no">
<cfelseif CGI.HTTP_HOST CONTAINS "staging.jrgm.biz">
    <cflocation url="http://staging.jrgm.biz/2016/index.cfm" addtoken="no">
</cfif>

<cflocation url="indexnew.cfm">
<cfabort>

<cfset tempvariable = StructClear(session)>

<!DOCTYPE html>
<html>
        <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes">
        <meta name="google-site-verification" content="vcwAfxQqdRo6b_Q9JEQXcU304aJyV_VAPGOEiNNyCEM" />
        <title>James River Grounds Management Timetracker</title>
        <link rel="apple-touch-icon" href="crew_leaders/assets/images/apple-touch-icon.png"/>

        <!-- css -->
        <link rel="stylesheet" href="css/styles.css">
        <link href="jr57.png" rel="apple-touch-icon-precomposed" />
        <link href="jr72.png" rel="apple-touch-icon-precomposed" sizes="72x72" />
        <link href="jr114.png" rel="apple-touch-icon-precomposed" sizes="114x114" />
        <link href="jr144.png" rel="apple-touch-icon-precomposed" sizes="144x144" />
        <style type="text/css">
html {
	position: relative;
	min-height: 100%;
}
body {
	margin: 0 0 100px; /* bottom = footer height */
}

</style>
        </head>
        <body>
<div id="outerfull">
<div id="centrecontent">
  <div class="topbarr"><img src="images/logosm.png" width="57" height="36" /></div>
</div>
<div class="centrecontent_inner">
  <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><div class="spacer20"></div>
        <div class="header">James River Grounds Management Log In</div>
        <form action="dologin.cfm" method="post">
          <table border="0" cellpadding="5" cellspacing="0">
<tr>
<td>Username</td>
<td><input name="username" type="text" class="textbox" id="username" size="20" maxlength="20"></td>
</tr>
<tr>
<td>Password</td>
<td><input  name="password" type="password" class="textbox" id="password" size="20" maxlength="20"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="Submit" class="notesb"></td>
</tr>
</table>
</form>
        <cfif IsDefined("message")>
<br>
<div class="error-box"> <strong>Login Error</strong><br />
Invalid Username or Password. </div>
</cfif></td>
</tr>
</table>
  <br>
</div>
<br>
<footer><a href="http://www.jrgm.biz/"><img src="http://www.jrgm.biz/images/logo.png" width="281" height="66" /></a></footer>
<!-- end outer div --> <!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> <script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> <script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
