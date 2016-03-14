<cfparam name="yes_list" default="0">
<cfparam name="no_list" default="0">
<cfparam name="notes_list" default="0">
<cfparam name="session.crew_assignment_last" default="All">
 <CFSET session.crew_assignment_last = 0>

 <CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>


<cfif NOT IsDefined("Form.Submit")  AND NOT IsDefined("Form.Pend")  AND NOT IsDefined("url.Inventory_Report_ID")>
 <cfquery name="insert_new_report" datasource="jrgm">
  INSERT INTO inventory_report_list 
  (inventory_date,inventory_branch,inventory_user ) VALUES ('#todayDate#','#SESSION.branch#',#SESSION.userid#)
</cfquery>
   <cfquery name="getmaxid" datasource="jrgm">
 SELECT MAX(ID) AS newid FROM inventory_report_list  
</cfquery>
 <CFSET  Inventory_Report_ID = getmaxid.newid>
</cfif>


<cfif   IsDefined("Form.Submit")  OR   IsDefined("Form.Pend")>
 <CFSET  Inventory_Report_ID = form.Inventory_Report_ID>
  <cfquery name="delete_report" datasource="jrgm">
  DELETE FROM inventory_report_results 
  WHERE  Inventory_Report_ID =#Inventory_Report_ID#
</cfquery>

<cfif   IsDefined("Form.CHECKBOX1")>
<cfloop index="i" list="#Form.CHECKBOX1#" delimiters=",">
 <cfquery name="insert_yes_info" datasource="jrgm">
  INSERT INTO inventory_report_results 
  (inventory_report_id,equipment_db_id,equipment_yn) VALUES (#inventory_report_id#, #i#, 1)
</cfquery>
</cfloop>
 <CFSET yes_list = form.CHECKBOX1>
</cfif>

<cfif   IsDefined("Form.CHECKBOX0")>
<cfloop index="i" list="#Form.CHECKBOX0#" delimiters=",">
 <cfquery name="insert_yes_info" datasource="jrgm">
  INSERT INTO inventory_report_results 
  (inventory_report_id,equipment_db_id,equipment_yn) VALUES (#inventory_report_id#, #i#, 0)
</cfquery>
</cfloop>
<CFSET no_list = form.CHECKBOX0>
</cfif>

<cfloop list="#form.fieldnames#" index="field"> 
<cfif left(field,7) EQ "COMMENT" > 
 <cfset equipment_db_id = ListLast("#field#","COMMENT_") />
 <cfif evaluate("COMMENT_#equipment_db_id#") NEQ ""> 
<CFSET notes =evaluate("COMMENT_#equipment_db_id#")>
  <cfquery name="update_notes" datasource="jrgm">
  UPDATE   inventory_report_results  set  equipment_notes = '#notes#' WHERE equipment_db_id =#equipment_db_id#  AND
  inventory_report_id = #inventory_report_id#
  </cfquery>
   <cfset notes_list = ListAppend(notes_list,equipment_db_id)>
  </cfif> 
  </cfif>
</cfloop>
   </cfif>
  
  <cfquery name="get_report_info_notes" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_notes IS NOT NULL
</cfquery>
<cfloop query="get_report_info_notes">
<cfset notes_list = ListAppend(notes_list,equipment_db_id)>
</cfloop>

   
 <cfif   IsDefined("Form.Submit")  >
 <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_status = 1  WHERE ID =#Inventory_Report_ID#
 </cfquery>
 </cfif>
   <cfif   IsDefined("Form.Pend")  >
  <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_status = 0  WHERE ID =#Inventory_Report_ID#
 </cfquery>
 </cfif>
 
  <cfif  IsDefined("form.filter")  AND CREW_ASSIGNMENT_LAST NEQ 'All'>
   <cfquery name="update_status" datasource="jrgm">
  UPDATE   inventory_report_list  set  inventory_filter = #form.CREW_ASSIGNMENT_LAST# WHERE ID =#Inventory_Report_ID#
 </cfquery>
  </cfif>
 
 
 <cfif   IsDefined("url.Inventory_Report_ID")  >
   <CFSET  Inventory_Report_ID = #url.Inventory_Report_ID#>
<cfquery name="get_report_info1" datasource="jrgm">
  SELECT * FROM inventory_report_list 
  WHERE ID = #Inventory_Report_ID#
</cfquery>

<cfif  get_report_info1.inventory_filter NEQ "">
<CFSET form.crew_assignment_last = get_report_info1.inventory_filter>
</cfif>

<cfquery name="get_report_info_yes" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_yn =1
</cfquery>


<cfloop query="get_report_info_yes">
  <cfset yes_list = ListAppend(yes_list,equipment_db_id)>
</cfloop>

<cfquery name="get_report_info_no" datasource="jrgm">
  SELECT * FROM inventory_report_results 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_yn =0
</cfquery>

<cfloop query="get_report_info_no">
  <cfset no_list = ListAppend(no_list,equipment_db_id)>
</cfloop>
 </cfif>
<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>


  <cfif  IsDefined("form.filter")  AND CREW_ASSIGNMENT_LAST NEQ 'All'>
 <cfquery name="get_filter_employee" datasource="jrgm">
SELECT   [Employee ID],  [Name FirstLast]  AS employee_name FROM app_employees
WHERE    [Employee ID] = #form.crew_assignment_last#
 </cfquery>
    </cfif>
  
   <cfif  IsDefined("CREW_ASSIGNMENT_LAST") AND CREW_ASSIGNMENT_LAST NEQ 'All'>
 <cfquery name="get_filter_employee" datasource="jrgm">
SELECT   [Employee ID],  [Name FirstLast]  AS employee_name FROm app_employees
WHERE  [Employee ID] = #form.crew_assignment_last#
 </cfquery>
    </cfif>
<!---      OR IsDefined("CREW_ASSIGNMENT_LAST")> --->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" MEDIA="print" HREF="css/printinventory.css">

<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<script>
$(document).ready(function(){

    var MaxHeight = 200;
    var RunningHeight = 0;
    var PageNo = 1;

    $('table.splitForPrint>tbody>tr').each(function () {

        if (RunningHeight + $(this).height() > MaxHeight) {
            RunningHeight = 0;
            PageNo += 1;
        }

        RunningHeight += $(this).height();

        $(this).attr("data-page-no", PageNo);

    });

    for(i = 1; i <= PageNo; i++){

        $('table.splitForPrint').parent().append("<div class='tablePage'><hr /><table id='Table" + i + "'><tbody></tbody></table><hr /></div>");

        var rows = $('table tr[data-page-no="' + i + '"]');

        $('#Table' + i).find("tbody").append(rows);
    }
    $('table.splitForPrint').remove();

});</script>


<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
  <div class="centrecontent_innerleftright">

       <cfquery name="getequipment" datasource="jrgm"  >
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 4 > AND inventory_status ='#form.inventory_status#'</cfif>
 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>
 ORDER by  ID ASC
</cfquery>


   <cfif   IsDefined("Form.Pend")  >
 <div class="inventory-message">Your Inventory Report is Pended.<br />
<a href="default.cfm" class="bluebutton">Go to Home Screen</a>  <a href="inventory_report_printable_eversion1.cfm?Inventory_Report_ID=<cfoutput>#Inventory_Report_ID#</cfoutput>" class="bluebutton">Continue With the Report</a></div>
 <cfabort>
 </cfif>
 
    <cfif   IsDefined("Form.submit")  >
 <div class="inventory-message">Your Inventory Report is Submitted.
<br />
<a href="default.cfm" class="bluebutton">Go to Home Screen</a></div>
 <cfabort>
 </cfif>
 <div class="header">Equipment Inventory Report</div> 
<div class="inventory-header"> 
<div class="inventory-third">
Branch:  <cfoutput>#session.BRANCH#</cfoutput><br />
Date:  <cfoutput>#todayDate#</cfoutput></div>

<div class="inventory-third">
Report ID:  <cfoutput>#Inventory_Report_ID#</cfoutput><br />
User:  <cfoutput>#SESSION.screenname#</cfoutput>
  <cfif  IsDefined("form.filter")  AND (IsDefined("CREW_ASSIGNMENT_LAST")  AND CREW_ASSIGNMENT_LAST NEQ 'All')> <br />
 Filter: <cfoutput>#get_filter_employee.employee_name#</cfoutput>
  </cfif></div>

<div class="inventory-third-last">
   <cfif NOT IsDefined("form.filter") AND     NOT IsDefined("CREW_ASSIGNMENT_LAST")>
         <form action="inventory_report_printable_eversion1.cfm" method="post"> 
        Filter:
                <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name,Crew_assignment_last
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   WHERE  branch = '#SESSION.branch#'
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
  <select name="crew_assignment_last"   tabindex="5" onchange='this.form.submit()'>
        <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
        <option   value ="3"  <cfif get_allocations.Crew_assignment_last  EQ 3> selected="selected"</cfif>>Spare</option>
    <option   value ="5"  <cfif get_allocations.Crew_assignment_last  EQ 5> selected="selected"</cfif>>Seasonal</option>
  
	  <cfoutput query="get_allocations">
   <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
   </cfoutput> </select> 
              
         <input type="hidden"  name="filter" value="yes"/>
     </form>
     </cfif>
</div></div>

 
        <form action="inventory_report_printable_eversion1.cfm" method="post"> 
       <table class="sortable" border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th>
            <th align="left">EQ ID</th>
            <th align="left">Product Name</th>
            <th align="left">Serial #</th>
            <th align="left">Status</th>
            <th align="left">Allocated To</th>
            <th align="center">In Inventory</th>
            <th align="center" width="200">Notes</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="getequipment">
            <tr>
              <td align="center">#ID#</td>
              <td>#Category#</td>
              <td align="left" >&nbsp;  #Equipment_ID#</td>
              <td align="left" >&nbsp;  #Product_Name#</td>
              <td align="left">&nbsp;  #Serial_Number#</td>
              <td align="left">&nbsp;  
                <cfif inventory_status EQ 1>
                  Active
                  <cfelseif inventory_status EQ 2>
                  Pending Repair
                  <cfelseif inventory_status EQ 3>
                  In Repair
                  <cfelseif inventory_status EQ 0>
                  Inactive
                  <cfelse>Active
                </cfif> 
              </td>
              <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14#
 </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center" nowrap="nowrap">Yes 
              <input type="checkbox" name="checkbox1"  value="#ID#"   
			  <cfif listFindNoCase(yes_list, ID)>checked="checked"</cfif> />
             &nbsp;   No&nbsp; 
                <input type="checkbox" name="checkbox0"   value="#ID#"    
				<cfif listFindNoCase(no_list, ID)>checked="checked"</cfif> />
              </td>
              <td align="center">
                  <cfif listFindNoCase(notes_list, ID)> 
                  <cfquery name="get_report_info_notesA" dbtype="query">
  SELECT * FROM get_report_info_notes 
  WHERE Inventory_Report_ID = #Inventory_Report_ID# AND equipment_db_id  =#getequipment.ID#
</cfquery><textarea name="comment_#ID#" id="styled" class="textbox">#get_report_info_notesA.equipment_notes#</textarea>
               <cfelse>
               	  <textarea name="comment_#ID#" id="styled" class="textbox"></textarea>
                </cfif>
	 </td>
            </tr>     
			</cfoutput>
        <input type="hidden" name="Inventory_Report_ID"  value="<cfoutput>#Inventory_Report_ID#</cfoutput>" />
            <tr>
              <td colspan="8" align="right" class="redtype">Pending the Report will allow you to come back later and make changes and then make final submission.</td>
              <td align="center"><input type="submit"  name="pend"   value="Pend Report" /></td>
            </tr>
               <tr>
              <td colspan="8" align="right" class="redtype">Submitting the Report is FINAL. No changes can be made after clicking the submit report button.</td>
              <td align="center">
              <input type="submit" name="submit"  value="Submit Report" />
              </td>
            </tr>
        </tbody>
      </table>
      </form>
     
    </div>
  </div>
</div>


</body>
</html>
