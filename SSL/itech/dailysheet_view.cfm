<CFSET allchecked ='Yes'>
<cfquery name="get_employees" datasource="jrgm">
SELECT * FROM app_employees WHERE Direct_Supervisor_ID = #SESSION.userid# AND active_record =1
</cfquery>
<CFSET mylist ="">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
</cfif>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM app_jobs WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid#  AND active_record =1
</cfquery>
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
 
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="header">View Daily Sheets</div>
    <form class="css_form">
      <table border="0" cellpadding="0">
        <tr>
          <td class="dailysheet_header">Select Crew Leader</td>
          <td class="dailysheet_header">&nbsp;</td>
          <td class="dailysheet_header">Select Date</td>
        </tr>
        <tr>
          <td><cfquery name="get_employees" datasource="jrgm">
SELECT * FROM app_employees WHERE Direct_Supervisor_ID = #SESSION.userid#  AND active_record =1
</cfquery>
            <fieldset>
            <div class="select_element">
              <select name="ds_crew_leader">
                <CFOUTPUT QUERY="get_employees">
                  <option value="#Employee_ID#">#Employee_Name#</option>
                </CFOUTPUT>
              </select>
            </div>
            </fieldset></td>
          <td>&nbsp;</td>
          <cfset dtStart = "03/01/2013" />
          <cfset dtEnd = "12/31/2013" />
          <td><fieldset>
            <div class="select_element">
              <select name="ds_date">
                <cfloop index="date" from="#dtStart#" to="#dtEnd#" step="1">
                  <cfoutput>
                    <option value="#DateFormat(date, "mm/dd/yyyy")#">#DateFormat(date, "dddd, mmmm dd, yyyy")#
                    <!--- #date# --->
                    </option>
                  </cfoutput>
                </cfloop>
              </select>
            </div>
            </fieldset></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><div class="spacer10"></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><input type="submit" name="submit" id="submit" value="Submit" class="bluebutton" /></td>
        </tr>
      </table>
    </form>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
