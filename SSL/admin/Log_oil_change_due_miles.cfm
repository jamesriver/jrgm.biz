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
      <cfquery name="get_equipment" datasource="jrgm">
SELECT     ID,   Category, Product_description, Product_name,   Equipment_ID, 
   hours_mileage, mileage_eq, hours_eq, oil_change_date_due, 
                      oil_change_hours_due, oil_change_mileage_due, last_oil_change_date, last_oil_change_hours, last_oil_change_miles, last_oil_change_employee_id, 
                        last_inspection_date,  oil_change_criteria , Branch_code,BRANCH_NAME,CREW_ASSIGNMENT_LAST
FROM         equipment where hours_mileage = 2  AND inventory_status > 0 <!---AND oil_change_mileage_due > 0--->  AND BRANCH_NAME <> 'Test'
ORDER BY ID DESC
</cfquery>
      <div class="header">Oil Change&nbsp;Due - Miles</div>
      <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
            <th align="left">ID</th>
            <th align="left">Branch</th>
            <th align="left">Allocated</th>
            <th align="left">Category</th>
            <th align="left">Equipment ID</th>
            <th align="right">Last Oil <br />
              Change Date</th>
            <th align="right">Last<br />
              Oil Change<br />
              Miles</th>
            <th align="right">Next<br />
              Oil Change<br />
              Miles Due</th>
            <th align="right">Current<br />
              Miles</th>
            <th align="center">Late</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput  query="get_equipment"  >
            <tr>
              <td>#ID#</td>
              <cfif BRANCH_NAME EQ 'Newport News'>
                <CFSET branchnew = "NEWP" >
                <cfelseif BRANCH_NAME EQ 'Charlottesville'>
                <CFSET branchnew = "CHAR" >
                <cfelseif BRANCH_NAME EQ 'Williamsburg'>
                <CFSET branchnew = "WMBG" >
                <cfelseif BRANCH_NAME EQ 'Richmond'>
                <CFSET branchnew = "RICH" >
                <cfelseif BRANCH_NAME EQ 'Portsmouth'>
                <CFSET branchnew = "PORT" >
                <cfelseif  BRANCH_NAME EQ 'Chesterfield'>
                <CFSET branchnew = "CHES" >
                <cfelseif BRANCH_NAME EQ 'Corporate'>
                <CFSET branchnew = "CORP" >
                <cfelse>
                <CFSET branchnew = #Left(BRANCH_NAME,4)# >
              </cfif>
              <td align="left" nowrap="nowrap">#branchnew#</td>
              <cfif  Crew_assignment_last NEQ "">
                <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                <td align="left">#get_branch_employees_cache.fullname#</td>
                <cfelse>
                <td align="left">-</td>
              </cfif>
              <td>#Category#</td>
              <td  align="left"><a href="history_allocation.cfm?ID=#ID#">#equipment_id#</a></td>
              <td align="right" nowrap="nowrap">#dateformat(last_oil_change_date,"mm/dd/yy")#</td>
              <td align="right" nowrap="nowrap">#NumberFormat(last_oil_change_miles,"999,999")#</td>
              <td align="right" nowrap="nowrap">#NumberFormat(oil_change_mileage_due,"999,999")#</td>
              <td align="right" nowrap="nowrap">#NumberFormat(mileage_eq,"999,999")#</td>
              <td align="center" nowrap="nowrap"><cfif  mileage_eq GT oil_change_mileage_due>
                  <span class="redtype">Late</span>
                </cfif>
                &nbsp;</td>
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
