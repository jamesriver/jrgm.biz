<cfquery name="get_employee_info" datasource="jrgm" maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename,[Ph Home] AS homephone,[Ph Cell] As cellphone,branch FROM app_employees WHERE [Employee ID]=  #url.Employee_ID#  
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
 </head>
<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Employee Detail</td>
        </tr>
      </table>
      <cfoutput query="get_employee_info">
        <div class="subheader">#employeename#</div>
        <ul class="crew">
         <li>Employee Branch&##8212;#branch#</li>
        <li>Employee ID&##8212;#EmployeeID#</li>
        <li>Position&##8212;#position#</li>
        <li>Phone Home&##8212; #homephone#</li>
        <li>Phone Cell&##8212;#cellphone#</li>
       </ul>
       </cfoutput>
       <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0"  >
      <tr>
    <td><span class="header">All Notes for <cfoutput>#get_employee_info.employeename#</cfoutput></span></td>
    <td align="right"><cfoutput> <a href="notes.cfm?work_date=#url.work_date#&employee_id=#employee_id#" class="bluebutton">Add Notes</a></cfoutput></td></tr></table>    
<div class="spacer10"></div>
 <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="left">Date</th> 
   <th align="left">Reported by</th>
   <th align="left" class="sorttable_alpha">Note</th>
   </tr> 
</thead> 

 <cfquery name="get_employee_notes" datasource="jrgm">
SELECT * FROM APP_notes WHERE   Employee_ID = #Employee_ID# 
ORDER by Note_Date DESC
</cfquery>
      <tbody>  
 <cfoutput query="get_employee_notes"> <tr>
    <td align="left">#dateformat(Note_Date,"mm/dd/yyyy")#</td>
   <cfquery name="get_auth_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename  FROM APP_employees WHERE [Employee ID]=  #get_employee_notes.Note_Author_ID#  
</cfquery>
     <td nowrap="nowrap">#get_auth_info.employeename# </td>
    <td align="left" >#note_content#</td>
    
  </tr></cfoutput>
 </tbody>
</table>  
  <br />
      
      </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
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
