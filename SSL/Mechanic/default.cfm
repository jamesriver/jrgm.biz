 
<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>



<cfset Session.acceptDate =  "">
 <cfset Session.repair_description ="" > 
 <cfset Session.estimated_comp_Date = "" > 
 <cfset Session.vendorName  = "" > 
 <cfset Session.laborHours = "0" > 
 <cfset Session.totalLabor  ="0" > 
 <cfset Session.totalParts  =  "0" > 
  <cfset Session.completionDate  = "" > 
  <cfset Session.repair_log_ip  = "1" > 
  
 <cfset Session.parts1  = "" >
 <cfset Session.parts2   = "" >
 <cfset Session.parts3   = "" >
 <cfset Session.parts4   = "" >
 <cfset Session.parts5   = "" >
 <cfset Session.parts6   = "" >
 <cfset Session.parts7   = "" >
 <cfset Session.parts8   = "" >
 

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
.statusTD {
	padding-right: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	font: bold .8em Arial, Helvetica, sans-serif;
	color: #333333;	
	border-bottom: 1px solid #ded8da;
	text-align: left;

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
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top" width="75%">
            <div class="header"><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></div>
  <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3  AND BRANCH_NAME IN   (#PreserveSingleQuotes(branchlist)#) 
 </cfquery>
  <div class="subheader">Equipment In Repair for<br />
<cfoutput><span class="statusTD">#branchlistalt#</cfoutput> - <cfoutput>#get_this_equipment_in_repair.recordcount#</cfoutput> Items</div>
    <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
 <thead> 
<tr> 
   <th align="center">ID</th>
       <th align="left">Date Sent <br />
    to Mechanic</th>
   <th align="left">Category</th>
   <th align="left" class="sorttable_alpha">Equip<br />
     ID</th> 
   <th align="left">Product Name</th> 
   <th align="left" class="sorttable_alpha">Serial Number</th>  
   <th align="center">Year</th>
    <th align="center">Branch</th>
    <th align="left">Status</th>
    <th align="left">Allocated To</th>
  <th align="center">Repair Log</th> 
     <th align="center">Add Notes</th>
     <th align="center">Repair History</th>
      </tr> 
</thead> 
      <tbody>  
  <cfoutput query="get_this_equipment_in_repair">
   <tr>
    <td align="center">#ID#<!--- <a href="inventory_edit.cfm?ID=#ID#">#ID#</a> ---></td>
    <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
    <td>#Category#</td>
    <td align="left" >#Equipment_ID#</td>
  <td align="left" ><a href="inventory_view.cfm?ID=#ID#">#Product_Name#</a></td>
   <td align="left">#Serial_Number#</td>    
     <td align="center">#Equipment_Year#</td>
    <cfif get_this_equipment_in_repair.BRANCH_NAME EQ 'Newport News'>
      <CFSET branchnew = "NEWP" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Charlottesville'>
      <CFSET branchnew = "CHAR" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Williamsburg'>
      <CFSET branchnew = "WMBG" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Richmond'>
      <CFSET branchnew = "RICH" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Portsmouth'>  
      <CFSET branchnew = "PORT" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Chesterfield'> 
      <CFSET branchnew = "CHES" >
      <cfelseif get_this_equipment_in_repair.BRANCH_NAME EQ 'Corporate'> 
      <CFSET branchnew = "CORP" >
      <cfelse>
      <CFSET branchnew = #Left(get_this_equipment_in_repair.BRANCH_NAME,4)# >
    </cfif>
    <td align="center" nowrap="nowrap">#branchnew#</td>
    <td align="left"><cfif inventory_status EQ 1>
                Active
                <cfelseif inventory_status EQ 2>
				Pending Repair
                <cfelseif inventory_status EQ 3>
				In Repair
                <cfelseif inventory_status EQ 0>
				Inactive
                   <cfelseif inventory_status EQ 5>
			Completed Repair
				<cfelse>Active
                </cfif>
      </td>
  <!--- <cfif get_this_equipment_in_repair.crew_assignment_last NEQ "">
 <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] = #get_this_equipment_in_repair.crew_assignment_last#
 </cfquery>

       <td align="left">#get_branch_employees_allocated.fullname#</td>
       <cfelse>
         <td align="left">-</td>
 </cfif> --->
<!---  <td align="center"><a href="repairLog.cfm?ID=#get_this_equipment_in_repair.ID#" >Log</a></td>
 ---> 
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
  <cfif repair_log_ip EQ 1> 
  <td align="center"><a href="repairLog.cfm?ID=#get_this_equipment_in_repair.ID#" >Open Log</a></td>
 <cfelse>
 <td align="center"><a href="repairLog.cfm?ID=#get_this_equipment_in_repair.ID#" >Start New Log</a></td>
 </cfif>
      <td align="center"><a href="note_addnote.cfm?ID=#ID#" class="addnote" onclick="javascript:void window.open('note_addnote.cfm?ID=#ID#','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td> 
      <td align="center"><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td>
   </tr>
  </cfoutput></tbody>
</table><br />
<br />
     <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="10">
SELECT * FROM equipment WHERE     repair_last_completed_date IS NOT NULL
AND    Branch_name  IN   (#PreserveSingleQuotes(branchlist)#)
ORDER by repair_last_completed_date DESC
 </cfquery>
 
   <div class="subheader">Equipment Recently Repaired for<br />
<cfoutput><span class="statusTD">#branchlistalt#</span></cfoutput><span class="statusTD"> - <cfoutput>#get_this_equipment_in_repair_recent.recordcount#</cfoutput> Items</span></div>
  <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="100%">
 <thead> 
<tr> 
   <th align="center">ID</th> 
       <th align="left">Date Sent <br />
    to Mechanic</th>
   <th align="left">Category</th>
   <th align="left" class="sorttable_alpha">Equip<br />
     ID</th> 
   <th align="left">Product Name</th> 
   <th align="left" class="sorttable_alpha">Serial Number</th>  
   <th align="center">Year</th>
    <th align="center">Branch</th>
    <th align="left">Status</th>
    <th align="left">Allocated To</th>
  <th align="center">Repair Log</th> 
     <th align="center">Add Notes</th>
     <th align="center">Repair History</th>
      </tr> 
</thead> 
      <tbody>  
  <cfoutput query="get_this_equipment_in_repair_recent">
   <tr>
    <td align="center">#ID#<!--- <a href="inventory_edit.cfm?ID=#ID#">#ID#</a> ---></td>
  <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
    <td>#Category#</td>
    <td align="left" >#Equipment_ID#</td>
  <td align="left" ><a href="inventory_view.cfm?ID=#ID#">#Product_Name#</a></td>
   <td align="left">#Serial_Number#</td>    
     <td align="center">#Equipment_Year#</td>
    <cfif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Newport News'>
      <CFSET branchnew = "NEWP" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Charlottesville'>
      <CFSET branchnew = "CHAR" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Williamsburg'>
      <CFSET branchnew = "WMBG" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Richmond'>
      <CFSET branchnew = "RICH" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Portsmouth'>  
      <CFSET branchnew = "PORT" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Chesterfield'> 
      <CFSET branchnew = "CHES" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Corporate'> 
      <CFSET branchnew = "CORP" >
      <cfelse>
      <CFSET branchnew = #Left(get_this_equipment_in_repair_recent.BRANCH_NAME,4)# >
    </cfif>
    <td align="center" nowrap="nowrap">#branchnew#</td>
    <td align="left"><cfif inventory_status EQ 1>
                Active
                <cfelseif inventory_status EQ 2>
				Pending Repair
                <cfelseif inventory_status EQ 3>
				In Repair
                <cfelseif inventory_status EQ 0>
				Inactive
			      <cfelseif inventory_status EQ 5>
			Completed Repair
				<cfelse>Active
                </cfif>
      </td>
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
<!---   <cfif get_this_equipment_in_repair_recent.crew_assignment_last NEQ "">
 <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] = #get_this_equipment_in_repair_recent.crew_assignment_last#
 </cfquery>

       <td align="left">#get_branch_employees_allocated.fullname#</td>
       <cfelse>
         <td align="left">-</td>
 </cfif> --->
<cfquery name="get_accept_date2"    datasource="jrgm"  maxrows="1" >
SELECT   ID,acceptdate  FROM equipment_repair_log
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                       <td align="center"><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td> 
                             <td align="center"><a href="note_addnote.cfm?ID=#ID#" class="addnote" onclick="javascript:void window.open('note_addnote.cfm?ID=#ID#','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td> 
      <td align="center"><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td>
   </tr>
  </cfoutput></tbody>
</table>

<!--- 

  <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="10">
SELECT * FROM equipment WHERE     repair_last_completed_date IS NOT NULL
AND    Branch_name  IN   (#PreserveSingleQuotes(branchlist)#)
ORDER by repair_last_completed_date DESC
 </cfquery>

    <div class="subheader">&nbsp;Equipment Recently Repaired for <cfoutput>#branchlistalt#</cfoutput> - <cfoutput>#get_this_equipment_in_repair_recent.recordcount#</cfoutput> Items</div><!--- <cfabort>
 --->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                      <tr>
                             <th align="left">Branch</th>   
                          <th align="left">Date Given <br />
                          to Mechanic</th>
                      <th align="left">Date&nbsp; Repair <br />
                      Completed</th>
                      <th align="left">Repair Log ID</th>       
                       <th align="left">Category</th>
                           <th align="left" class="sorttable_alpha">Equip<br />
                                  ID</th> 
                      <th align="left">Equipment Name</th>
                      <th align="left">Allocated To</th>
                      <th align="center">History</th>
                     </tr>
                  </thead>
                  <tbody>
                   <cfoutput query="get_this_equipment_in_repair_recent">
                    <tr>
  <cfif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Newport News'>
      <CFSET branchnew = "NEWP" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Charlottesville'>
      <CFSET branchnew = "CHAR" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Williamsburg'>
      <CFSET branchnew = "WMBG" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Richmond'>
      <CFSET branchnew = "RICH" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Portsmouth'>  
      <CFSET branchnew = "PORT" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Chesterfield'> 
      <CFSET branchnew = "CHES" >
      <cfelseif get_this_equipment_in_repair_recent.BRANCH_NAME EQ 'Corporate'> 
      <CFSET branchnew = "CORP" >
      <cfelse>
      <CFSET branchnew = #Left(get_this_equipment_in_repair_recent.BRANCH_NAME,4)# >
    </cfif>
  <td>#branchnew#</td> 
    <td>-</td> 
    <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
 <cfquery name="get_accept_date2"    datasource="jrgm"  maxrows="1" >
SELECT   ID,acceptdate  FROM equipment_repair_log
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                       <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td> 
                        <td>#Category#</td>
  <td align="left" >#Equipment_ID#</td>
                      <td> #Product_name#</td>
 <cfif get_this_equipment_in_repair_recent.crew_assignment_last NEQ "">
 <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] = #get_this_equipment_in_repair_recent.crew_assignment_last#
 </cfquery>

       <td align="left">#get_branch_employees_allocated.fullname#</td>
       <cfelse>
         <td align="left">-</td>
 </cfif>
                      <td align="center"><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td> 
                      </tr>
					</cfoutput>
                  </tbody>
                </table> --->
 
         </tr>
      </table><br />
<br /> 

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
</body>
</html>
