<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>

<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees 
</cfquery>

<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>

 
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>
 <!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

 <cfquery name="get_clid_branch_ds" datasource="jrgm">
SELECT Crew_Leader_ID FROM 
APP_daily_sheets WHERE supervisor_id IN (#mylist#)
</cfquery>

<CFSET mylist2 ="0">
<cfloop query="get_clid_branch_ds">
  <cfset myList2= ListAppend(mylist2,Crew_Leader_ID)>
</cfloop>
 

 
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   
   <cfquery name="get_morning_inspections" datasource="jrgm">
SELECT      Inspection_ID, Crew_LeaderID, Inspection_Date, Inspection_Type, Problem, Created_By, Created_On, Current_Mileage, vehicleSatisfactory, 
                      InspectionMode
FROM     app_Inspection_Master  WHERE Inspection_Type ='Morning'  AND  Crew_LeaderID IN  (#myList2#)
order by  Inspection_Date DESC, Inspection_ID DESC
</cfquery>
    <div class="header">Morning Inspection Form List</div>
    <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
            <th align="left">ID</th>
            <th align="left">Date</th>
            <th align="left">Branch</th>
            <th align="left">Supervisor</th>
            <th align="left">Crew Leader</th>
            <th align="left">View</th>
          </tr>
        </thead>
    <tbody>
     <cfoutput  query="get_morning_inspections"  >
        <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_LeaderID# 
 </cfquery>
          <tr>
              <td><a href="Morning_Inspection_Form.cfm?Inspection_ID=#Inspection_ID#">#Inspection_ID#</a></td>
              <td nowrap="nowrap">#dateformat(Inspection_Date,"mm/dd/yy")#</td>
               <td align="left">#get_branch_employees_cache.branch#</td>
              <td>-</td>
              <td align="left">#get_branch_employees_cache.fullname#</td>
               <td><a href="Morning_Inspection_Form.cfm?Inspection_ID=#Inspection_ID#" >View</a></td>
            </tr></cfoutput>
         </tbody>
      </table>
          
  </div>  </div>
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
