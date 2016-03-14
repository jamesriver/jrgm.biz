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
<cfquery name="get_all_equipment_info" datasource="jrgm"  >
SELECT  ID, Branch_name, Category, Product_description, Product_name, Color, Cost, Date_Created,    
                      Equipment_ID, Inspection_Due,     Serial_number,  Tags_expire, 
                      Equipment_Year, engine_cycle, Crew_assignment_last,    hours_mileage, mileage_eq, hours_eq, 
                      oil_change_date_due, oil_change_hours_due, oil_change_mileage_due, last_oil_change_date, last_oil_change_hours, last_oil_change_miles, 
                      last_oil_change_employee_id ,
                      Branch_code, Crew_assignment
FROM equipment
</cfquery>

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
      <cfquery name="get_oil_changes" datasource="jrgm">
SELECT      ID, equipment_id, oil_change_date, last_oil_change_employee_id, last_oil_change_mileage, last_oil_change_hours, enter_date, entered_by
FROM         equipment_oil_changes
ORDER BY ID DESC
</cfquery>
      <div class="header">Oil Change Log - <cfoutput>#get_oil_changes.recordcount#</cfoutput> Oil Changes </div>
      <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
            <th align="left">ID</th>
            <th align="left">Oil Change Date</th>
            <th align="left">Branch</th>
             <th align="left">DBID</th>
            <th align="left">Equipment ID</th>
            <th align="left">Category</th>
            <th align="left">Oil Change By</th>
            <th align="left">Hours/Miles</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput  query="get_oil_changes"  >
           <cfif last_oil_change_employee_id  EQ 0>
   <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #entered_by# 
 </cfquery>
           <cfelse>
   <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #last_oil_change_employee_id# 
 </cfquery>
 </cfif>
            <tr>
              <td> #ID#</td>
              <td nowrap="nowrap">#dateformat(oil_change_date,"mm/dd/yy")#</td>
              <td align="left">#get_branch_employees_cache.branch#</td>
               <td>#equipment_id#</td>
      <cfquery name="get_equipment_info_cache"   dbtype="query">
SELECT   Equipment_ID , Category FROM get_all_equipment_info
WHERE  ID =  #equipment_id#
 </cfquery>
    <td><a href="history_allocation.cfm?ID=#equipment_id#">#get_equipment_info_cache.equipment_id#</a></td>
     <td>#get_equipment_info_cache.Category#</td>
              <td align="left">#get_branch_employees_cache.fullname#</td>
               <cfif  get_equipment_info_cache.Category EQ  'Vehicles'>
              <td align="left">#dateformat(oil_change_date,"mm/dd/yy")#</td>
              <cfelse>
              <td align="left">#last_oil_change_hours#</td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
    </div>
  </div>
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
