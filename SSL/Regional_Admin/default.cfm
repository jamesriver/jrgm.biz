<CFSET pay_period_week1 =APPLICATION.pay_period_week1 >
<CFSET pay_period_week2 =APPLICATION.pay_period_week2>

<CFSET PAY_PERIOD_WEEK1_DATE =APPLICATION.pay_period_week1_date >
<CFSET PAY_PERIOD_WEEK2_DATE =APPLICATION.pay_period_week2_date >    

<CFSET PAY_PERIOD_NUMBER =APPLICATION.pay_period_number >

<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>
    
    <cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>

 <cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>
<CFSET mylistgs ="">
<cfloop query="get_supers">
  <cfset myListgs = ListAppend(mylistgs,Employee_ID)>
</cfloop>

    <cfquery name="get_accept_date_all"    datasource="jrgm"   >
SELECT   ID,acceptdate,Equipment_ID,completionDate,date_sent_to_mechanic
  FROM equipment_repair_log
  ORDER by ID DESC
 </cfquery>
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
 <cfset todaydate = now() />
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; target-densitydpi=low-dpi;"/>
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="js/jquery-ui.css" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>

<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .7em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
 
 .notes2 li {
	padding-bottom: 6px;
	font: normal 13px/140% Arial, Helvetica, sans-serif;
	color: #323232;
	list-style: none;
}

.notes2 li a {
	font-weight: bold;
	color: #006699;	
	text-decoration: none;
}

.notes2 li a:hover {
	font-weight: bold;
	color: #c9742b;	
	text-decoration: none;
}
.alertnofields {	
	padding-bottom: 10px;
	color: #000;
	font: 600 14px Arial, Helvetica, sans-serif;
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
        <div class="header"><cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></div> 
    <div class="spacer20"></div>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
 <div class="alertsh">Alerts</div> 
 
  <div id="tabs">
	<ul>
		<li><a href="#tabs-1">Daily Sheets</a></li>
		<li><a href="#tabs-2">Payroll</a></li>
                <li><a href="#tabs-3">Equipment</a></li> 
        <li><a href="#tabs-4">Sign Out</a></li>
        <li><a href="#tabs-5">Reports</a></li>
	</ul>
	<div id="tabs-1">
    <cfquery name="get_UA_daily_sheets_for_RM" datasource="jrgm"  > 
SELECT  * FROM APP_daily_sheets  WHERE   (Supervisor_ID IN (#mylistgs#)  OR  Supervisor_ID = #SESSION.userid#) AND ds_approved IS NULL AND ds_date > '12/31/2014' ORDER by ds_date DESC
  </cfquery>
    <span class="alertnofields">The following Daily Sheets have NOT been approved.</span><br />
       <div class="spacer10"></div> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
               <thead>
                <tr>
                  <th align="left">DSID</th>
                  <th align="left">Date</th>
                  <th align="left">Branch</th>
                  <th align="left">Supervisor</th>
                </tr>
                </thead>
                 <tbody>
                <cfoutput query="get_UA_daily_sheets_for_RM">
                  <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  last_name AS employee_name,branch
FROM APP_employees WHERE [Employee ID] =#get_UA_daily_sheets_for_RM.supervisor_id#
        </cfquery>
                  <tr>
                    <td><a href="daily_sheet.cfm?dsid=#ID#">#ID#</a></td>
                    <td>#dateformat(ds_date,"mm/dd/yy")#</td>
                    <td align="left">#get_info_S.branch#</td>
                    <td>#get_info_S.employee_name#</td>
                  </tr>
                </cfoutput>
              </tbody>
              </table></div>
	<div id="tabs-2"> 
   <!---   Check Pay Period 1 --->
<cfquery name="app_payroll_periods1" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week1#
 </cfquery>  
 <CFSET pay_period_end_week1 =  dateadd("d",7,app_payroll_periods1.pay_period_start)>
   
 <cfquery name="get_employees_with_time_Week1" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)
      AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
		ORDER by APP_employees.last_name
  </cfquery>
  <CFSET mylist ="0">
<cfloop query="get_employees_with_time_Week1">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
   <cfquery name="get_employees_with_time_unapproved_Week1" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
	WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods1.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week1, "yyyy-mm-dd")# 00:00:00.000')
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL    
		ORDER by APP_employees.last_name
 </cfquery>
 <br />
  <div class="alertnofields">
  <cfif  todaydate GT APPLICATION.week1_date_available  AND get_employees_with_time_unapproved_Week1.recordcount GT 0>
    You have unapproved Week 1 payroll. 
 <br />
 <a href="payroll_main.cfm?pay_period_week=<cfoutput>#pay_period_week1#</cfoutput>&pay_period_week1=yes">Go here to  approve week 1  payroll</a> 
   <cfelse>
  All Week 1 payroll is approved
  </cfif> </div> 
  <!---   Check Pay Period 2 --->
 <cfquery name="app_payroll_periods2" datasource="jrgm">
 SELECT  MIN(pay_period_start) as pay_period_start, MAX(pay_period_end) AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week2#
 </cfquery>  
 <CFSET pay_period_end_week2=  dateadd("d",7,app_payroll_periods2.pay_period_start)>
  <cfquery name="get_employees_with_time_Week2" datasource="jrgm" >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch IN   (#PreserveSingleQuotes(branchlist)#)
      AND 
        (app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week2, "yyyy-mm-dd")# 00:00:00.000')
		ORDER by APP_employees.last_name
  </cfquery>
  <CFSET mylist ="0">
<cfloop query="get_employees_with_time_Week2">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
    <cfquery name="get_employees_with_time_unapproved_Week2" datasource="jrgm"     >
		SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name,APP_employees.branch,ds_id,ds_date FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
	WHERE    
         ( app_employee_payroll_clock.Time_In > '#app_payroll_periods2.pay_period_start# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week2, "yyyy-mm-dd")# 00:00:00.000')
   AND Employee_ID IN (#mylist#)  AND payroll_approved IS NULL    
		ORDER by APP_employees.last_name
 </cfquery> 
 <cfset todaydate = now() />
 
<div class="alertnofields">

 <cfif  todaydate GT APPLICATION.week2_date_available  AND get_employees_with_time_unapproved_Week2.recordcount GT 0>
     You have unapproved Week 2 payroll. <br />
     <a href="payroll_main.cfm?pay_period_week=<cfoutput>#pay_period_week2#</cfoutput>">Go here to approve week 2 payroll</a>
         <cfelse>
   All Week 2 payroll is approved
     </cfif>             
      </div> 
             
            </div>
	
  <!-------------------------------------------- --->
    
    <div id="tabs-3">
              <!--- -----------------------------Pending Repair----------------------------------- --->
         
              <div class="alertsSub">Pending Repair</div>
              <cfquery name="get_this_equipment_in_repair_pending" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 2  AND Branch_name IN   (#PreserveSingleQuotes(branchlist)#)
 </cfquery>
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
            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 3>
                  <td align="left">Spare</td> 
                   <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 4>
                  <td align="left">Inactive</td> 
                   <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 5>
                  <td align="left">Seasonal</td>
                   <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 6>
                  <td align="left">Lost</td> 
          <cfelse>
    <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   fullname  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
  <td align="left">#get_branch_employees_cache.fullname#</td>
                        </cfif>
                   
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>
                    <!------------------------------Currently In Repair------------------------------------->
              <div class="alertsSub">Currently In Repair</div>
              <cfquery name="get_this_equipment_in_repair" datasource="jrgm">
SELECT * FROM equipment WHERE  inventory_status = 3  AND
Branch_name IN   (#PreserveSingleQuotes(branchlist)#)
ORDER by ID DESC
 </cfquery>
              <cfif get_this_equipment_in_repair.recordcount EQ 0 >
                There is no equipment currently in repair
                <cfelse>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                    <tr>
                      <th align="left">Branch</th>
                      <th align="left" nowrap="nowrap">Date Given <br />
                        to Mechanic</th>
                      <th align="left" nowrap="nowrap">Date Repair <br />
                        Log Started</th>
                      <th align="left"> Repair <br />
                      Log ID</th>
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
                        <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
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
                          <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&equipmentid=#ID#">#ID#</a></td>
                        </cfif>
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
                        <td align="center"><a href="history_allocation.cfm?ID=#ID#&amp;branch=#BRANCH_NAME#">History</a></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>
   <!--- -----------------------------Recently Completed Repairs----------------------------------- --->              
              <div class="alertsSub">Recently Completed Repairs</div>
    <cfquery name="get_this_equipment_in_repair_recent" datasource="jrgm" maxrows="10">
SELECT * FROM equipment WHERE     repair_last_completed_date IS NOT NULL
AND    Branch_name  IN   (#PreserveSingleQuotes(branchlist)#)
ORDER by repair_last_completed_date DESC
 </cfquery>
  <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
 There is no equipment with recently completed repairs
<cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
                  <thead>
                      <tr>
                            <th align="left">Branch</th>   
                          <th align="left" nowrap="nowrap">Date Given <br />
                          to Mechanic</th>
                      <th align="left"  >Date&nbsp; Repair <br />
                      Completed</th>
                      <th align="left">Repair <br />
                        Log ID</th>       
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
  <cfquery name="get_accept_date2"  dbtype="query"  maxrows="1" >
SELECT   ID,acceptdate,DATE_SENT_TO_MECHANIC  FROM get_accept_date_all
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
 <td>#dateformat(get_accept_date2.date_sent_to_mechanic,"mm/dd/yy")#</td> 
          <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                        <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td> 
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
                      <td align="center"><a href="history_allocation.cfm?ID=#ID#&branch=#BRANCH_NAME#">History</a></td> 
                      </tr>
					</cfoutput>
                  </tbody>
                </table><br />
<br /> </cfif> 
             </div>
    
    
    
 <!-------------------------------------------------------------->
    
    <div id="tabs-4"> 
      <div class="alertsSub">Hours&nbsp; </div>
      <span class="alertnofields">Employees that answered "I do not agree" to hours signout question</span>&nbsp; (Showing last 20)<br />
       <div class="spacer10"></div> 
      
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
  <thead>
                <tr>
				 <th align="left">DSID</th>
 				<th align="left">Date</th>
				 <th align="left">Branch</th>
                  <th align="left">Employee Name</th>
                  <th align="left">Supervisor</th>
                  <th align="left">Crew Leader</th>
                </tr>
                </thead>
    <tbody>
      <cfquery name="get_daily_sheets" datasource="jrgm">
    SELECT  * FROM APP_daily_sheets  WHERE  (Supervisor_ID IN (#mylistgs#)  OR  Supervisor_ID = #SESSION.userid#)  AND ds_date > '12/31/2014' ORDER by ds_date DESC
    </cfquery>
       <CFSET mylistds ="">
<cfloop query="get_daily_sheets">
  <cfset mylistds = ListAppend(mylistds,ID)>
</cfloop>
         <cfquery name="get_employees_CompleteHours" datasource="jrgm" maxrows="20">
        SELECT * FROM 
       app_employee_payroll_clock WHERE CompleteHours =0 AND ds_id In (#mylistds#)  
       ORDER by ds_date desc
          </cfquery>
       
        <cfoutput query="get_employees_CompleteHours">   
           <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  fullname   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_CompleteHours.employee_ID#
        </cfquery>
                    <cfquery name="get_info_CL"  dbtype="query">
SELECT fullname,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.crew_leader#
        </cfquery>
                    <cfquery name="get_info_S"  dbtype="query">
SELECT fullname,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_CompleteHours.supervisor#
        </cfquery>
          <tr>
    <td nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#get_employees_CompleteHours.ds_id#" target="_blank">#ds_id#</a></td>
<td nowrap="nowrap" align="left">#dateformat(ds_date,"mm/dd/yy")# </td> 

  <cfif get_employees_name.branch EQ 'Newport News'>
          <CFSET branchnew = "NEW" >
          <cfelseif get_employees_name.branch EQ 'Charlottesville'>
          <CFSET branchnew = "CVL" >
           <cfelseif get_employees_name.branch EQ 'Williamsburg'>
          <CFSET branchnew = "WMB" >
          <cfelseif get_employees_name.branch EQ 'Richmond'>
          <CFSET branchnew = "RIC" >
           <cfelseif get_employees_name.branch EQ 'Portsmouth'>  
          <CFSET branchnew = "POR" >
            <cfelseif get_employees_name.branch EQ 'Chesterfield'> 
          <CFSET branchnew = "CHE" >
           <cfelseif get_employees_name.branch EQ 'Corporate'> 
          <CFSET branchnew = "CORP" >
          <cfelse>
         <CFSET branchnew = #Left(get_employees_name.branch,4)# >
         </cfif>
           <td nowrap="nowrap">#branchnew#</td>    
            <td nowrap="nowrap">#get_employees_name.last_name#</td>
            <td nowrap="nowrap">#get_info_S.last_name#</td>
          <td nowrap="nowrap">#get_info_CL.last_name#</td>
          </tr>
        </cfoutput>
           <tr>
    <td colspan="5" nowrap="nowrap" ><a href="report_signout_questions_hours.cfm"  class="notes2"><strong>Show All ></strong> </a></td>
           </tr>
          </tbody>
</table>
              <div class="alertsSub">Injury</div> 
                  <span class="alertnofields">Employees that answered "I do not agree" to injury signout question</span>&nbsp; (Showing last 20)<br />
               <div class="spacer10"></div> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable">
       <thead>
                <tr>
             <th align="left">DSID</th>
                         <th align="left">Date</th>
                 <th align="left">Branch</th>
                  <th align="left">Employee Name</th>
                  <th align="left">Supervisor</th>
                  <th align="left">Crew Leader</th>
                </tr>
                </thead>
    <tbody>
          <cfquery name="get_employees_injury" datasource="jrgm" maxrows="20">
        SELECT * FROM 
       app_employee_payroll_clock WHERE IsEmpInjury =0 AND ds_id In (#mylistds#)
       ORDER by ds_date desc
          </cfquery>
       
        <cfoutput query="get_employees_injury">   
          <cfquery name="get_employees_name"  dbtype="query">
        SELECT  first_name ,  last_name,branch ,  fullname   FROM 
        get_all_employee_info WHERE employee_ID = #get_employees_injury.employee_ID#
        </cfquery>
                    <cfquery name="get_info_CL"  dbtype="query">
SELECT fullname,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.crew_leader#
        </cfquery>
                    <cfquery name="get_info_S"  dbtype="query">
SELECT fullname,branch,last_name
FROM   get_all_employee_info WHERE employee_ID =#get_employees_injury.supervisor#
        </cfquery>
          <tr>         
           <td  nowrap="nowrap"><a href="daily_sheet.cfm?dsid=#get_employees_injury.ds_id#" target="_blank">#ds_id#</a></td>
             <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yy")# </td> 
            
  <cfif get_employees_name.branch EQ 'Newport News'>
          <CFSET branchnew = "NEW" >
          <cfelseif get_employees_name.branch EQ 'Charlottesville'>
          <CFSET branchnew = "CVL" >
           <cfelseif get_employees_name.branch EQ 'Williamsburg'>
          <CFSET branchnew = "WMB" >
          <cfelseif get_employees_name.branch EQ 'Richmond'>
          <CFSET branchnew = "RIC" >
           <cfelseif get_employees_name.branch EQ 'Portsmouth'>  
          <CFSET branchnew = "POR" >
            <cfelseif get_employees_name.branch EQ 'Chesterfield'> 
          <CFSET branchnew = "CHE" >
           <cfelseif get_employees_name.branch EQ 'Corporate'> 
          <CFSET branchnew = "CORP" >
          <cfelse>
         <CFSET branchnew = #Left(get_employees_name.branch,4)# >
         </cfif>
           <td nowrap="nowrap">#branchnew#</td>  
         <td nowrap="nowrap" align="left">#get_employees_name.last_name#</td>
            <td nowrap="nowrap">#get_info_S.last_name#</td>
          <td nowrap="nowrap">#get_info_CL.last_name#</td>
          </tr>
        </cfoutput>
            <tr>
    <td colspan="5" nowrap="nowrap" ><a href="report_signout_questions_injury.cfm"  class="notes2"><strong>Show All ></strong> </a></td>
           </tr>
          </tbody>
      </table>
</div>
   <div id="tabs-5"> 
      <div class="alertsSub">Reports</div>
       <p><a href="daily_sheet_listing_time_compare.cfm">Daily Sheet Time Compare</a
 > 
       </p>
       <p><a href="select_branch_j.cfm">Job Labor &amp; Materials Detail Report</a></p>
   </div>
           </td>
          <td valign="top" >
		<!---   <cfif SESSION.branch EQ 'test'>
              <div class="blueAlignment"><a href="manage_crew_leaders.cfm" class="bluebutton">Manage Crew Leaders</a> </div>
            </cfif> --->
            <cfquery name="get_employees_notes" datasource="jrgm"  maxrows="10">
SELECT  ID,note_content,employee_id,Note_Author_ID, Note_Date FROM app_notes WHERE Employee_ID  
 IN (SELECT  [Employee ID] FROM app_employees WHERE  branch IN   (#PreserveSingleQuotes(branchlist)#))
 ORDER by  Note_Date DESC
            </cfquery>
             <!--- <cfdump var="#get_employees_notes#">  --->
           <div class="noteshtop">
  <div class="notestitle">Employee Notes</div> <span class="arialfont"> (Showing last 10)</span>
 </div>
            <div class="notes">
              
              <cfif get_employees_notes.recordcount EQ 0>
                <p>No Employee Notes</p>
                <cfelse>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortablenotes">
                  <tbody>
                   <cfoutput query="get_employees_notes">
                    <cfquery name="get_employees_name" datasource="jrgm" >
SELECT  [Name FirstLast] AS empname FROM app_employees  WHERE [Employee ID]  =
 #get_employees_notes.employee_id#
</cfquery>
                    <tr>
                   <td>#dateformat(Note_Date,"mm/dd/yy")#</td>
                   <td><a href="employee_details.cfm?employee_id=#employee_id#&work_date=#todayDate#">#get_employees_name.empname#</a> : #note_content#</td>
                   <td><a href=""><i class="fa fa-times-circle"></i></a></td>
                   </tr> 
                  </cfoutput>
                </tbody></table>
               </cfif>
              <p><a href="employee_notes.cfm">
              View all employee notes >
              </a></p></div>
            <cfquery name="get_job_notes" datasource="jrgm" maxrows="10">
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID] FROM app_jobs WHERE  branch  IN   (#PreserveSingleQuotes(branchlist)#))
 ORDER by  Note_Date DESC
</cfquery>
            <!--- <cfdump var="#get_job_notes#"> --->
           <div class="notesh">
<div class="notestitle">Job Notes</div>
<span class="arialfont"> (Showing last 10)</span></div>
            <div class="notes">
               <cfif get_job_notes.recordcount EQ 0>
                 <p>No Job Notes</p>
                <cfelse>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortablenotes">
                  <tbody>
                  <cfoutput query="get_job_notes">
                    <cfquery name="get_jobs_name" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname FROM app_jobs WHERE  [Job ID]  =
 '#get_job_notes.job_id#'
</cfquery>
                    <tr>
                   <td>#dateformat(Note_Date,"mm/dd/yy")#</td>
                   <td><a href="job_details.cfm?job_id=#job_id#&work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                   <td><a href=""><i class="fa fa-times-circle"></i></a></td>
                   </tr> 
                  </cfoutput>
                </tbody></table>
              </cfif>
               <p><a href="job_notes.cfm">
              View all job notes >
              </a></p>
            </div>                 
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
