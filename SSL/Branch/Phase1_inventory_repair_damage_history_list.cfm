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

<CFSET ID=3955>
<CFSET url.ID=3955>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management Inventory</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
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
 

  <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div class="header">Repair History Information</div> </td>
           <td align="right"> <a href="inventory_list.cfm"  class="bluebutton">Back to Inventory List</a></td> 
          </tr>
        </table>
          <div class="spacer20"></div>
  <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
    <cfoutput  query="get_this_equipment">
     <div class="job_data_header">#PRODUCT_NAME#</div>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr><td valign="top">
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">ID</td>
              <td class="dstable">#ID#</td>
              <td align="left" class="dstable">Date Created</td>
              <td class="dstable">#DateFormat(DATE_CREATED, "mm/dd/yyyy")#</td>
              </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Product Name</td>
              <td colspan="3" class="dstable">#PRODUCT_NAME#</td>
            </tr>
            <tr>
              <td align="left" nowrap="nowrap" class="dstable">Description</td>
              <td colspan="3" class="dstable">#PRODUCT_DESCRIPTION#</td>
            </tr>
            </table>
            </cfoutput>
            <div class="spacer20"></div>
            
             <cfquery name="get_this_equipment_history_notes" datasource="jrgm">
SELECT * FROM equipment_history WHERE equipment_ID = #ID#  AND entry_type='Note'
order by id desc
      </cfquery>
            <div class="job_data_header">Notes</div>
             <table width="100%" border="0" cellpadding="0" cellspacing="0">
 <cfif get_this_equipment_history_notes.recordcount EQ 0>
       <tr>
              <td colspan="2" class="dstable">No Notes</td>
             </tr> 
       <cfelse>
      <cfoutput query="get_this_equipment_history_notes">   
        <tr>
              <td class="dstable">#DateFormat(get_this_equipment_history_notes.enter_date, "mm/dd/yyyy")# -
#get_this_equipment_history_notes.equipment_notes#</td></tr></cfoutput>
               </cfif>
            </table>
             </td>
             <td><img src="images/clear.gif" width="60" height="1" /></td>
            <td valign="top" width="60%">
             <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr>
              <td align="left" nowrap="nowrap" class="dstable_header" colspan="3">Repair History</td>
            
              </tr>
            <tr>
              <td class="dstable_headersm">Repair ID</td>
              <td class="dstable_headersm">Repair Date</td>
               <td class="dstable_headersm">Repair Type</td>
            </tr>
             <cfquery name="get_this_equipment_history_r" datasource="jrgm">
SELECT * FROM equipment_repair_log WHERE equipment_ID = #ID#   
order by id desc
             </cfquery>
      
      <cfif get_this_equipment_history_r.recordcount EQ 0>
       <tr>
              <td colspan="3" class="dstable">No Repairs</td>
             </tr> 
       <cfelse>
          <cfoutput query="get_this_equipment_history_r"> <tr>
              <td class="dstable"><a href="repairLog.cfm?ID=#ID#">#get_this_equipment_history_r.ID#</a></td>
              <td class="dstable">#DateFormat(get_this_equipment_history_r.acceptdate, "mm/dd/yyyy")#</td>
               <td class="dstable">#get_this_equipment_history_r.repair_description#</td>
            </tr>
             </cfoutput>
                   </cfif></table>
                  <div class="spacer20"></div>
      <cfquery name="get_this_equipment_history_damage" datasource="jrgm">
SELECT * FROM equipment_history WHERE equipment_ID = #ID#  AND entry_type='damage'
order by id desc
      </cfquery>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
              <td align="left" nowrap="nowrap" class="dstable_header" colspan="3" >Damage History</td>
              
              </tr> 
            <tr>
              <td class="dstable_headersm">Damage ID </td>
              <td class="dstable_headersm">Damage Date</td>
              <td class="dstable_headersm">Damage Type</td>
            </tr>
              <cfif get_this_equipment_history_damage.recordcount EQ 0>
       <tr>
              <td colspan="3" class="dstable">No Damage Reports</td>
             </tr> 
       <cfelse>
        <cfoutput query="get_this_equipment_history_damage">  
        <tr >
  <td class="dstable"> #get_this_equipment_history_damage.ID#</td>
  <td class="dstable">#DateFormat(get_this_equipment_history_damage.damage_date, "mm/dd/yyyy")#</td>
   <td class="dstable">#get_this_equipment_history_damage.equipment_notes#</td>
            </tr> 
			</cfoutput>
            </cfif>
          </table>
       
    
    </td>
   </tr></table>
     <p>
      <!-- to clear footer --></p>
    
  </div>
</div>
<!-- end outer div -->
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>