epair LogsR<CFIF IsDefined("url.work_date")>
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
      <cfquery name="get_repair_logs" datasource="jrgm">
SELECT   ID, Equipment_ID, acceptDate, repair_description, estimated_comp_date, outside_repair,  laborHours, totalLabor, totalParts, totalCost, 
     completionDate, recommend_replace, repair_log_ip, repair_log_user, date_sent_to_mechanic
FROM         equipment_repair_log
ORDER BY ID DESC
</cfquery>
      <div class="header">Repair Logs - <cfoutput>#get_repair_logs.recordcount#</cfoutput> Repair Logs</div>
      <table class="sortable" cellpadding="0" cellspacing="0" width="95%">
        <thead>
          <tr>
          <td class="dstable_headersm">Repair ID</td>
              <td class="dstable_headersm">Accept Date</td>
              <td class="dstable_headersm">Complete Date</td>
               <td class="dstable_headersm">DBID</td>
                <td class="dstable_headersm">Branch</td>
                 <td class="dstable_headersm">Mechanic</td>
                  <td class="dstable_headersm">Equipment ID</td>
          <td class="dstable_headersm">Category</td>
               <td class="dstable_headersm">Repair Type</td>
          </tr>
        </thead>
        <tbody>
      <cfoutput query="get_repair_logs"> <tr>
              <td class="dstable"><a href="repairLog_view.cfm?ID=#ID#&EQUIPMENTID=#Equipment_ID#">#get_repair_logs.ID#</a></td>
              <td class="dstable">#DateFormat(get_repair_logs.acceptdate, "mm/dd/yyyy")#</td>
              <td class="dstable">#DateFormat(get_repair_logs.completionDate, "mm/dd/yyyy")#</td>
                  <td class="dstable">#Equipment_ID#</td>
                   <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #repair_log_user# 
                   </cfquery>
               <td align="left"  nowrap="nowrap"  class="dstable">#get_branch_employees_cache.branch#</td>
                 <td align="left" nowrap="nowrap" class="dstable">#get_branch_employees_cache.fullname#</td>
   <cfquery name="get_equipment_info_cache"   dbtype="query">
SELECT   ID, Equipment_ID , Category FROM get_all_equipment_info
WHERE  ID =  #equipment_id# 
   </cfquery>
    <td class="dstable"><a href="history_allocation.cfm?ID=#get_equipment_info_cache.ID#">#get_equipment_info_cache.equipment_id#</a></td>
     <td class="dstable">#get_equipment_info_cache.Category#</td>
     <CFSET cutString = LEFT(get_repair_logs.repair_description, 50)>
       <cfif LEN(get_repair_logs.repair_description) GT 50>
            <td class="dstable" >#cutString#... </td>
            <cfelse>
                 <td class="dstable" >#cutString#</td>
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
