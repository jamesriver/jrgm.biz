<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>

<cfset Now_Time = Now()>


 
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
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
.dstable_l1 {
	padding: 10px;
	background-color: #aac9c1;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: bold 1.05em Arial, Helvetica, sans-serif;
}
  </style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
   
    <!--centre content goes here -->
    <div class="centrecontent_inner">
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap" class="header">Employees that answered &quot;I do not agree&quot; to hours signout question</td>
        </tr>
      </table>
      <table   border="0" cellspacing="0" cellpadding="0" class="sortable">
        <thead>
         <tr>
            <td class="dstable_l1">Date</span></td>
             <td class="dstable_l1">Employee Name</td>  
            <td class="dstable_l1">Branch</td>
            <td class="dstable_l1">Supervisor</span></td>
             <td class="dstable_l1">Crew Leader</span></td>
             <td align="center" class="dstable_l1">DSID</span></td>
        </tr>
         </thead>
    <tbody>
        <cfquery name="get_employees_CompleteHours" datasource="jrgm">
        SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0
       ORDER by ds_date desc
          </cfquery>
       
        <cfoutput query="get_employees_CompleteHours">   
        <cfquery name="get_employees_name" datasource="jrgm">
        SELECT  first_name ,  last_name,branch , [Name FirstLast]AS fullname   FROM 
        app_employees WHERE [Employee ID] = #get_employees_CompleteHours.employee_ID#
        </cfquery>
          <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_employees_CompleteHours.crew_leader#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_employees_CompleteHours.supervisor#
        </cfquery>
          <tr>
            <td nowrap="nowrap">#DateFormat(ds_date,"mm/dd/yyyy")# </td> 
            <td nowrap="nowrap">#get_employees_name.fullname#</td>
           <td nowrap="nowrap">#get_employees_name.branch#</td>
           <td nowrap="nowrap">#get_info_S.employee_name#</td>
          <td nowrap="nowrap">#get_info_CL.employee_name#</td>
          <td align="center" nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#get_employees_CompleteHours.ds_id#" target="_blank">#ds_id#</a></td>
          </tr>
        </cfoutput>
          </tbody>
      </table>
      <br />
      <br />
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
