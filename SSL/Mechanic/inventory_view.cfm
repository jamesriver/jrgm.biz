<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE <!--- (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) --->Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management Equipment</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<style type="text/css">
.dstableno {	padding: 8px;
	color: #000;
	font: normal .8em Arial, Helvetica, sans-serif;
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
    
      <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
      <cfoutput  query="get_this_equipment">
        <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div class="header">#PRODUCT_NAME#</div></td>
            <td align="right"><a href="javascript:history.back()" class="bluebutton"> Back to Inventory List</a></td>
          </tr>
        </table>
        <div class="spacer20"></div>
        <form method="post" action="inventory_edit2.cfm">
        <table border="0" cellpadding="0" cellspacing="0" >
          <tbody>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable_header">ID</td>
              <td class="dstable_header"> #ID# </td>
              <td align="left" class="dstable_header">Date Created</td>
              <td class="dstable_header">#DateFormat(DATE_CREATED, "mm/dd/yyyy")#</td>
              <td align="left" nowrap="nowrap" class="dstable_header">Category</td>
              <td colspan="2" class="dstable_header">#Category#</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Product Name</td>
              <td class="dstable"> #PRODUCT_NAME#</td>
             <td align="left" nowrap="nowrap" class="dstable">Status</td>
                
              <td class="dstable"><cfif inventory_status EQ 1>Active </cfif>
				 <cfif inventory_status EQ 0>Inactive</cfif>
				 <cfif inventory_status EQ 2>Pending Repair</cfif> 
				 <cfif inventory_status EQ 3>In Repair</cfif> </td>
              <td class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Description</td>
              <td colspan="5" class="dstable"> #PRODUCT_DESCRIPTION#</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Date Purchased</td>
              <td class="dstable">#DateFormat(DATE_PURCHASED, "mm/dd/yyyy")# </td>
              <td align="left" nowrap="nowrap" class="dstable">Year</td>
              <td class="dstable">#EQUIPMENT_YEAR#</td>
              <td align="left" nowrap="nowrap" class="dstable">Cost</td>
              <td class="dstable">#COST# </td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Equipment ID</td>
              <td class="dstable">#EQUIPMENT_ID#</td>
              <td align="left" nowrap="nowrap" class="dstable">Serial Number</td>
              <td class="dstable">#SERIAL_NUMBER#</td>
              <td class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Color</td>
              <td class="dstable">#COLOR#</td>
              <td align="left" nowrap="nowrap" class="dstable">Measurement</td>
              <td class="dstable">#MEASUREMENT#</td>
              <td align="left" nowrap="nowrap" class="dstable">Snow</td>
              <td class="dstable">#snow#</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Inspection Date</td>
              <td class="dstable">#DateFormat(INSPECTION_DUE, "mm/dd/yyyy")#</td>
              <td align="left" nowrap="nowrap" class="dstable">License Plate</td>
              <td class="dstable">#LICENSE_PLATE#</td>
              <td align="left" nowrap="nowrap" class="dstable">Tags Expire</td>
              <td class="dstable">#DateFormat(TAGS_EXPIRE, "mm/dd/yyyy")# </td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Quantity</td>
              <td class="dstable">#QUANTITY_START#</td>
              <td align="left" nowrap="nowrap" class="dstable">Quantity on Hand</td>
              <td class="dstable">#QUANTITY_ON_HAND# </td>
              <td align="left" nowrap="nowrap" class="dstable">Engine Cycle</td>
              <td class="dstable">#engine_cycle#
                <cfif engine_cycle NEQ ''>
                  cycle
                </cfif>
              </td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Branch Name</td>
              <td class="dstable">#BRANCH_NAME#</td>
              <td align="left" nowrap="nowrap" class="dstable">Crew Assignment</td>
              
               
            <td class="dstable">
			<CFIF  get_this_equipment.Crew_assignment_last EQ ""> -
            <cfelse>
              <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
             SELECT  [Name FirstLast] AS fullname  FROM APP_employees
            WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
           </cfquery>
              #get_branch_employees_allocated.fullname#
              </CFIF>
            </td>
            <td class="dstable"> Last Oil Change Date </td>
            <td class="dstable">#DateFormat(last_oil_change_date, "mm/dd/yyyy")#</td></tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Supplier Company</td>
              <td class="dstable">#SUPPLIER_COMPANY#</td>
              <td align="left" nowrap="nowrap" class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Date Modified </td>
              <td class="dstable">#DateFormat(DATE_MODIFIED, "mm/dd/yyyy")#</td>
              <td align="left" nowrap="nowrap" class="dstable">Modified By</td>
              <td class="dstable">#MODIFIED_BY# </td>
              <td class="dstable">&nbsp;</td>
              <td class="dstable">&nbsp;</td>
            </tr>
        </tbody>
        </table>
      </cfoutput>
      <!-- to clear footer -->
    </div>
  </div>
  <!-- end outer div -->
  <!-- to clear footer -->
</div>
<!-- end outer div -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
