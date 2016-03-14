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
   <cfquery name="get_report_info" datasource="jrgm"  >     
  SELECT   ID, inventory_date, inventory_branch, inventory_user, inventory_status, inventory_filter
FROM         inventory_report_list  WHERE id= #url.id#
</cfquery>
 <div class="header">Equipment Inventory Report</div> 
 <div class="inventory-header"> 
<div class="inventory-left"> 

     <table  width="90%" border="0" cellpadding="3" cellspacing="0" class="dailysheetEditTop">
  <tr>
    <td>Branch:  <cfoutput>#session.BRANCH#</cfoutput></td>
  <td>Report ID:  <cfoutput> #url.id#</cfoutput></td>
   </tr>
  <tr>
    <td>Date:  <cfoutput>#todayDate#</cfoutput></td>
    <td><cfquery name="get_branch_employees1" datasource="jrgm" >
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_report_info.inventory_user#
 </cfquery>
  Inventory Taker: <cfoutput>#get_branch_employees1.fullname#</cfoutput> </td>
   </tr>
  <tr>
    <td></td>
    <td> <cfif get_report_info.inventory_filter  NEQ "">
   <cfquery name="get_branch_employees" datasource="jrgm" >
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_report_info.inventory_filter #
 </cfquery>
  Filter: <cfoutput>#get_branch_employees.fullname#</cfoutput>
  </cfif></td>
   </tr>
</table>

   <br />

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
     <cfquery name="get_report_results" datasource="jrgm"  >     
        SELECT     TOP (2000) ID, inventory_report_id, equipment_db_id, equipment_yn, equipment_notes
FROM         inventory_report_results WHERE  inventory_report_id= # url.id#
</cfquery>
          <cfoutput query="get_report_results">
            <tr>
              <td align="center">#ID#</td>
 <cfquery name="get_inventory_info" datasource="jrgm"  >     
   SELECT    *
FROM         equipment  WHERE ID  = #equipment_db_id#
</cfquery>
              <td>#get_inventory_info.Category#</td>
              <td align="left" >&nbsp;  #equipment_db_id#</td>
              <td align="left" >&nbsp;  #get_inventory_info.Product_Name#</td>
              <td align="left">&nbsp;  #get_inventory_info.Serial_Number#</td>
              <td align="left">&nbsp;  
                <cfif get_inventory_info.inventory_status EQ 1>
                  Active
                  <cfelseif  get_inventory_info.inventory_status EQ 2>
                  Pending Repair
                  <cfelseif get_inventory_info.inventory_status EQ 3>
                  In Repair
                  <cfelseif get_inventory_info.inventory_status EQ 0>
                  Inactive
                  <cfelse>Active
                </cfif> 
              </td>
 <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #get_inventory_info.crew_assignment_last#
 </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center" nowrap="nowrap"> 
              <cfif equipment_yn EQ 1>Yes</cfif> 
            <cfif equipment_yn EQ  0>No</cfif> 
              </td>
              <td align="center">#equipment_notes#
	 </td>
            </tr>     
			</cfoutput>
         </tbody>
      </table>
     
    </div>
  </div>
</div>
  </div>
</div>

</body>
</html>
