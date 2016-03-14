<cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
  <cfquery name="update_job_services_clock" datasource="jrgm">
  UPDATE app_job_materials_actual SET item_id = '#form.item_id#',QUANTITY_USED=#form.QUANTITY_USED#,UNIT_USED ='#form.UNIT_USED#'
   WHERE ID =#form.matid# AND DS_ID =#form.ds_id#
  </cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<cfif IsDefined("url.deleteme")>
  <cfquery name="update_job_services_clock" datasource="jrgm">
  DELETE FROM app_job_materials_actual  
   WHERE ID =#url.matid# AND DS_ID =#url.ds_id#
  </cfquery>
  <cfoutput>
    <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
  </cfoutput>
</cfif>
<cfif IsDefined("form.matid")>
  <CFSET matid= form.matid>
  <cfelseif IsDefined("url.matid")>
  <CFSET matid= url.matid>
</cfif>
<CFQUERY name="get_all_units" datasource="#request.dsn#">
 SELECT DISTINCT unit_used  AS unit_used FROM app_job_materials_actual  
 </CFQUERY>
<CFQUERY name="get_this_material" datasource="#request.dsn#">
 SELECT * FROM app_job_materials_actual WHERE ID = #matid#
   </CFQUERY>
<CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM app_job_clock WHERE ID = #get_this_material.job_clock_id#
   </CFQUERY>
<cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
<cfif IsDefined("form.ds_id")>
  <CFSET ds_id= form.ds_id>
  <cfelseif IsDefined("url.ds_id")>
  <CFSET ds_id= url.ds_id>
</cfif>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<style type="text/css">
input {
	text-align:right;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.redarial {
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
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
      <div class="header">Materials Editor </div>
      <table border="0" cellpadding="0" cellspacing="0" class="dailysheet_table_top" >
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Date : </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#DateFormat(get_ds_info.ds_date, "mmmm dd, yyyy")#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;&nbsp; &nbsp; </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >DSID:</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#DS_ID#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" class="dailysheetEditTop">Supervisor : </td>
          <td align="left" class="dailysheetEditTop"><cfoutput>#get_supervisor.employeename#</cfoutput></td>
          <td align="left" class="dailysheetEditTop">&nbsp;</td>
          <td align="left" class="dailysheetEditTop" >Crew Leader : </td>
          <td align="left" class="dailysheetEditTop" ><cfoutput>#get_crew_leader.employeename#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job Name:&nbsp; </td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#get_this_job_name.event_name#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job ID:&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#get_this_job.Job_ID#</cfoutput></td>
        </tr>
        <tr>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong>Materials:&nbsp;</strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><strong><cfoutput>#get_this_material.item_id#</cfoutput></strong></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
        </tr>
      </table>
      <cfif IsDefined("url.delete")>
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><p  class="arialfont">Are you sure you want to delete this material from this daily sheet? <br />
              </p>
              <p  class="arialfont">
              <cfoutput><a href="daily_sheet_edit_materials1.cfm?ID=#url.matid#&deleteme=yes&matid=#url.matid#&ds_id=#ds_id#" class="YesNoButton"> Yes</a> &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="daily_sheet_edit_materials1.cfm?ID=#url.matid#&matid=#url.matid#&ds_id=#ds_id#" class="YesNoButton">No</a> </strong>
                </p>
                <p  class="redarial"> Choosing yes will delete the material from this daily sheet. </p>
              </cfoutput> </td>
          </tr>
        </table>
        <cfabort>
      </cfif>
      <form   method="post" action="daily_sheet_edit_materials1.cfm" >
        <cfquery name="get_all_materials" datasource="jrgm">
SELECT *  FROM app_materials_list order by item_id
</cfquery>
        <table width="70%" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td align="right" nowrap="nowrap" class="dailysheetEditTop">Select Materials</td>
            <td class="dailysheetEditTop"><div class="stylededit-select">
                <select name="item_id" >
                  <cfoutput query="get_all_materials">
                    <option value="#item_id#" 
		  <cfif get_this_material.item_id  EQ get_all_materials.item_id>selected="selected"</cfif>>#item_id#</option>
                  </cfoutput>
                </select>
              </div></td>
          </tr>
          <tr>
            <td align="right" class="dailysheetEditTop">Select Unit</td>
            <td class="dailysheetEditTop"><div class="stylededit-select">
                <select name="unit_used" >
                  <cfoutput query="get_all_units">
                    <option value="#unit_used#" 
               <cfif get_this_material.unit_used  EQ get_all_units.unit_used>selected="selected"</cfif>>#unit_used#</option>
                  </cfoutput>
                </select>
              </div></td>
          </tr>
          <tr>
            <td align="right" class="dailysheetEditTop">Select Quantity </td>
            <td class="dailysheetEditTop"><cfoutput query="get_this_material">
                <input type="text" value="#get_this_material.quantity_used#" name="quantity_used"  maxlength="5"  size="5" />
              </cfoutput></td>
          </tr>
          <tr>
            <td align="left" nowrap="nowrap"  class="dailysheetEditTop">&nbsp;</td>
            <td align="center"><input type="submit" name="submit" class="materialsbutton" id="submit" value="Submit" /></td>
          </tr>
           
          <tr>
            <td><td colspan="2" align="left" nowrap="nowrap"  class="dailysheetEditTop"></td>
            <cfoutput> <a href="daily_sheet_edit.cfm?dsid=#ds_id#"  class="dssbutton">Back to Daily Sheet</a> <a href="daily_sheet_edit_materials1.cfm?ds_id=#ds_id#&MATID=#get_this_material.ID#&delete=yes"  id="deleteme" class="deletebutton">Delete this material</a>
              <td></td></td>
            </cfoutput> </tr>
          <cfoutput>
            <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
            <input type="hidden" name="ID"   value="#matid#" />
            <input type="hidden" name="matid"   value="#matid#" />
          </cfoutput>
        </table>
      </form>
      
    </div>
  </div>
  <!-- to clear footer -->
</div>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
