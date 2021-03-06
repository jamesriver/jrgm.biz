 
   <cfif SESSION.branch EQ 'Richmond' >
    <CFSET branchcode =10>
     <cfelseif SESSION.branch EQ 'Portsmouth' >
    <CFSET branchcode =20>
      <cfelseif SESSION.branch EQ 'Charlottesville' >
    <CFSET branchcode =30>
      <cfelseif SESSION.branch EQ 'Williamsburg' >
    <CFSET branchcode =70>
      <cfelseif SESSION.branch EQ 'Chesterfield' >
    <CFSET branchcode =80>
      <cfelseif SESSION.branch EQ 'Newport News' >
    <CFSET branchcode =90>
     <cfelse>
    <CFSET branchcode ='Unknown'>
  </cfif>
 
  <cfquery name="get_employee_pto_time" datasource="jrgm" >
SELECT     ID, employee_id, branch_code, userid, pto_hours, date_entered, pto_date
FROM         payroll_pto  WHERE branch_code  = #branchcode#
ORDER by pto_date desc
</cfquery> 
 
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="javascript"></script>
     <style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
   .search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;	
}
</style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
 <body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="header"> PTO Report</span> </td>
    <td align="right"> <a href="payroll_main.cfm"  class="bluebutton"> Go to  Main Payroll Page </a></td>
  </tr>
</table>
  <br />
 <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
  <thead> 
         <tr>
         <th align="left">Branch</th> 
          <th align="left">First Name</th>
           <th align="left">Last Name</th>
          <th align="left">Employee ID</th>
          <th align="left">PTO Date</th>
          <th align="left">PTO Hours</th>
          </tr>
        </thead>
        <tbody>  
 <cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT      ID, [Employee ID] AS employeeid, [Name FirstLast], First_name, Last_name FROM app_employees  
</cfquery>
 <cfoutput query="get_employee_pto_time">
 <tr>
 <cfif branch_code EQ '10' >
    <CFSET branchname ='Richmond'>
    <cfelseif branch_code EQ '20' >
    <CFSET branchname ='Portsmouth'>
    <cfelseif branch_code EQ '30'  >
    <CFSET branchname ='Charlottesville'>
    <cfelseif branch_code EQ '70'  >
    <CFSET branchname ='Williamsburg'>
    <cfelseif branch_code EQ '80'  >
    <CFSET branchname ='Chesterfield'>
    <cfelseif branch_code EQ '90' >
    <CFSET branchname ='Newport News'>
    <cfelseif  branch_code EQ '21'>
    <CFSET branchname ='Corporate'>
    <cfelseif  branch_code EQ '00'>
    <CFSET branchname ='Unknown'>
    <cfelseif branch_code EQ '' >
    <CFSET branchname ='Unknown'>
    <cfelse>
    <CFSET branchname ='Unknown'>
  </cfif>
 <td>#branchname#</td> 
 <cfquery name="get_employee_name"   dbtype="query" maxrows="1">
SELECT First_name, Last_name FROM  get_all_employee_info WHERE employeeid =#get_employee_pto_time.employee_id#
 </cfquery>
 <td>#get_employee_name.First_name#</td>
 <td>#get_employee_name.LAst_name#</td>
 <td align="left">#employee_id#</td>
 <td align="left">#DateFormat(pto_date, "mm/dd/yyyy")#</td>
 <td align="left">#pto_hours#</td>
 </tr>  
 </cfoutput>
 </tbody>
</table>
     </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
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
