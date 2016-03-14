
<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees 
</cfquery>

<cfquery name="get_accept_date_all"    datasource="jrgm"   >
SELECT   ID,acceptdate,Equipment_ID,completionDate,date_sent_to_mechanic  FROM equipment_repair_log
  ORDER by ID DESC
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="js/jquery-ui.css" rel="stylesheet" />
<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
html {
	position: relative;
	min-height: 100%;
}
body {
	margin: 0 0 100px; /* bottom = footer height */
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 100px;
	width: 100%;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
li {
	font: normal .9em Arial, Helvetica, sans-serif;
	line-height: 24px;
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>

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
      <div class="header"><!--- Equipment ---><img src="images/clear.gif" width="200" height="1" />
        <div class="bluebuttonRT"><a href="inventory_list.cfm"  class="bluebuttonNR">Equipment List</a></div></div>
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><div class="alertsh">Equipment Alerts</div>
             <div id="tabs-3">
      <!---   <cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE  0=0
      </cfquery>
        <CFSET myemployeelist ="0">
      
      <cfloop query="get_employees">
        <cfset myemployeelist = ListAppend(myemployeelist,Employee_ID)>
              </cfloop> --->
                <cfquery name="get_this_equipment_in_repair_pending" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 2  
 </cfquery>  
 <div class="alertsSub">Pending Repair &nbsp;&nbsp; (<cfoutput>#get_this_equipment_in_repair_pending.recordcount#</cfoutput>) Pieces</div>
          
              <cfif get_this_equipment_in_repair_pending.recordcount EQ  0 >
                There is no equipment pending repair
                <cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                     <th align="left">Date <br />
                       Pended Repair</th>   
                      <th align="left">Branch</th>       
                       <th align="left">Category</th>
 <th align="left" class="sorttable_alpha">Equip<br />
     ID</th> 
                      <th align="left">Equipment Name</th>
                      <th align="left">Allocated To</th>
                      <th align="center">History</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="get_this_equipment_in_repair_pending">
                      <tr>
                 <td>#dateformat(pended_repair_date,"mm/dd/yy")#</td>
                     <cfif BRANCH_NAME EQ 'Richmond' >
   <CFSET branchnew = "RIC" >
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
   <CFSET branchnew = "POR" >
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
       <CFSET branchnew = "CVL" >
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
     <CFSET branchnew = "WMB" >
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchnew = "CHE" >
    <cfelseif BRANCH_NAME EQ 'Newport News' >
     <CFSET branchnew = "NEW" >
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
                         <td>#branchnew#</td>
                         <td>#Category#</td>
  <td align="left" >#Equipment_ID#</td>
                        <td>#Product_name#</td>
  <cfif  get_this_equipment_in_repair_pending.Crew_assignment_last  EQ "">
         <td align="left">Unallocated</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td align="left">#get_branch_employees_cache.fullname#-#Crew_assignment_last#</td>
                        </cfif>
                        <td align="center"><a href= "history_allocation.cfm?ID=#ID#">History</a></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>
                    <!------------------------------Currently In Repair------------------------------------->
                    <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3   
ORDER by ID DESC
 </cfquery>  <div class="alertsSub">Currently In Repair&nbsp;&nbsp; (<cfoutput>#get_this_equipment_in_repair.recordcount#</cfoutput>) Pieces</div>
      
              <cfif get_this_equipment_in_repair.recordcount EQ 0 >
                There is no equipment currently in repair
                <cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                       <th align="left" nowrap="nowrap">Date Given <br />
to Mechanic</th>
                      <th align="left" nowrap="nowrap">Date Repair <br />
Log Started</th>
                      <th align="left"> Repair Log ID</th>
                      <th align="left">Branch</th>       
                       <th align="left">Category</th>
 <th align="left" class="sorttable_alpha">Equip<br />
     ID</th> 
                      <th align="left">Equipment Name</th>
                      <th align="left">Allocated To</th>
                      <th align="center">History</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="get_this_equipment_in_repair">
                      <tr>
  <!--- <cfquery name="get_accept_date"   dbtype="query"  maxrows="1" >
SELECT   ID,acceptdate  FROM get_accept_date_all
 WHERE  Equipment_ID =  #get_this_equipment_in_repair.ID#   AND   completionDate IS NULL
 ORDER by ID DESC
 </cfquery> --->
 <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td> 
  <!--- <cfif  get_accept_date.recordcount EQ 0><td>Not Started</td><td>-</td>
    <cfelse>
   <td>#dateformat(get_accept_date.acceptdate,"mm/dd/yy")#</td>  --->
   
      <cfquery name="get_accept_date"   dbtype="query"  maxrows="1" >
SELECT   ID,acceptdate  FROM get_accept_date_all
 WHERE  Equipment_ID =  #get_this_equipment_in_repair.ID#   AND   completionDate IS NULL
 ORDER by ID DESC
 </cfquery>
                        <cfif  get_accept_date.recordcount EQ 0>
                          <td>Not Started</td>
                          <td>-</td>
                          <cfelse>
                          <td>#dateformat(get_accept_date.acceptdate,"mm/dd/yy")#</td>
    <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&equipmentid=#ID#"  target="_blank">#ID#</a></td>
    </cfif>  
    <cfif BRANCH_NAME EQ 'Richmond' >
   <CFSET branchnew = "RIC" >
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
   <CFSET branchnew = "POR" >
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
       <CFSET branchnew = "CVL" >
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
     <CFSET branchnew = "WMB" >
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchnew = "CHE" >
    <cfelseif BRANCH_NAME EQ 'Newport News' >
     <CFSET branchnew = "NEW" >
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
                         <td>#branchnew#</td>
   
                         <td>#Category#</td>
  <td align="left" >#Equipment_ID#</td>
                        <td>#Product_name#</td>
     
                        <cfif  get_this_equipment_in_repair.Crew_assignment_last  EQ "">
         <td align="left">Unallocated</td> 
            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 3>
                  <td align="left">Spare</td> 
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 4>
                  <td align="left">Inactive</td> 
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 5>
                  <td align="left">Seasonal</td>
                   <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 6>
                  <td align="left">Lost</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td align="left">#get_branch_employees_cache.fullname#</td>
                        </cfif>
                        <td align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>
              
                 <!--- -----------------------------Recently Completed Repairs-----NEED STATUS CHANGE------------------------------ --->              
          
 <div class="alertsSub">Recently Completed Repairs with Status &quot;Completed Repair&quot; -&nbsp; These Need a Status Change </div>
<cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="10">
SELECT * FROM equipment WHERE   inventory_status = 5
ORDER by repair_last_completed_date DESC
 </cfquery>
  <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
 There is no equipment with recently completed repairs that needs a status change.
<cfelse>
               <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                            <th align="left" nowrap="nowrap">Date Given <br />
to Mechanic</th>
                      <th align="left" nowrap="nowrap">Date Repair <br />
Completed</th>
                <th align="left"> Repair Log ID</th>
                      <th align="left">Branch</th>
                       <th align="left">Category</th>
                           <th align="left" class="sorttable_alpha">Equip<br />
                                  ID</th> 
                      <th align="left">Equipment Name</th>
                      <th align="left">Allocated To</th>
                      <th align="center">Change Status</th>
                
                    </tr>
                  </thead>
                  <tbody>
                   <cfoutput query="get_this_equipment_in_repair_recent">
                    <tr>
<!---  <cfquery name="get_accept_date2"    datasource="jrgm"  maxrows="1" >
SELECT   ID,acceptdate ,date_sent_to_mechanic FROM equipment_repair_log
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery> --->
   <cfquery name="get_accept_date2"   dbtype="query"  maxrows="1" >
SELECT   ID,acceptdate ,date_sent_to_mechanic FROM get_accept_date_all
 WHERE  Equipment_ID =  #get_this_equipment_in_repair_recent.ID#   <!--- AND   completionDate IS NULL --->
 ORDER by ID DESC
 </cfquery>
 
 
 
  <td>#dateformat(get_accept_date2.date_sent_to_mechanic,"mm/dd/yy")#</td> 
 <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                       <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#"  target="_blank">#ID#</a></td> 
                         <cfif BRANCH_NAME EQ 'Richmond' >
   <CFSET branchnew = "RIC" >
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
   <CFSET branchnew = "POR" >
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
       <CFSET branchnew = "CVL" >
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
     <CFSET branchnew = "WMB" >
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchnew = "CHE" >
    <cfelseif BRANCH_NAME EQ 'Newport News' >
     <CFSET branchnew = "NEW" >
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
                         <td>#branchnew#</td>
                        <td>#Category#</td>
  <td align="left" >#Equipment_ID#</td>
                      <td> #Product_name#</td>
   <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
         <td align="left">Unallocated</td> 
             <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                  <td align="left">Spare</td> 
                    <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                  <td align="left">Inactive</td> 
                   <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                  <td align="left">Seasonal</td> 
                     <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                  <td align="left">Lost</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td align="left">#get_branch_employees_cache.fullname#</td>
                      </cfif>
                      <td align="center"><a href="history_allocation.cfm?ID=#ID#">Change Status</a></td>
                      </tr>
					</cfoutput>
                  </tbody>
                </table> 
  </cfif> 
   <!--- -----------------------------Recently Completed Repairs----------------------------------- --->              
  <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="50">
SELECT * FROM equipment WHERE    repair_last_completed_date IS NOT NULL AND  inventory_status = 1 
ORDER by repair_last_completed_date DESC
 </cfquery>
   <div class="alertsSub">Recently Completed Repairs with Status &quot;Active&quot; -&nbsp; These Do NOT Need a Status Change  -Showing Last 50</div>
   <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
 There is no equipment with recently completed repairs
<cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                      <th align="left" nowrap="nowrap">Date Given <br />
                        to Mechanic</th>
                      <th align="left" nowrap="nowrap">Date Repair <br />
                        Completed</th>
                      <th align="left">Repair Log ID</th>       
                               <th align="left">Branch</th>
                       <th align="left">Category</th>
                           <th align="left" class="sorttable_alpha">Equip<br />
                                  ID</th> 
                      <th align="left">Equipment Name</th>
                      <th align="left">Allocated To</th>
                      <th align="center">History</th>
                <!---       <th align="center">Activate</th> --->
                    </tr>
                  </thead>
                  <tbody>
                   <cfoutput query="get_this_equipment_in_repair_recent">
                    <tr>
       <cfquery name="get_accept_date"  dbtype="query"  maxrows="1" >
SELECT   ID,acceptdate,date_sent_to_mechanic  FROM get_accept_date_all
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
 <td>#dateformat(get_accept_date.date_sent_to_mechanic,"mm/dd/yy")#</td> 
   <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
             
  <cfif  get_accept_date.recordcount EQ 0><td>Not Started</td><cfelse>
  <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&equipmentid=#ID#"  target="_blank">#ID#</a></td></cfif>    
    <cfif BRANCH_NAME EQ 'Richmond' >
   <CFSET branchnew = "RIC" >
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
   <CFSET branchnew = "POR" >
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
       <CFSET branchnew = "CVL" >
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
     <CFSET branchnew = "WMB" >
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchnew = "CHE" >
    <cfelseif BRANCH_NAME EQ 'Newport News' >
     <CFSET branchnew = "NEW" >
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
                         <td>#branchnew#</td>
                        <td>#Category#</td>
  <td align="left" >#Equipment_ID#</td>
                      <td> #Product_name#</td>
   <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
         <td align="left">Unallocated</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td align="left">#get_branch_employees_cache.fullname#</td>
                      </cfif>
                      <td align="center"><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                      </tr>
					</cfoutput>
                  </tbody>
                </table><br />
<br /> </cfif> 
    </div>
    <br />
    <br />
    <br />
    <br />
    <!-- to clear footer -->
 
 </td>
        </tr>
      </table>
    </div>
  </div>
  <!-- to clear footer -->
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
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
$( "#tabs" ).tabs();


</script>
</body>
</html>
