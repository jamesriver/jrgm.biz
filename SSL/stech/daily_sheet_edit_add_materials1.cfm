 

 <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit")>
 <cfif  form.QUANTITY_USED  IS ""> 
 <cfoutput>  
 <cflocation url="daily_sheet_edit_add_materials1.cfm?dsid=#ds_id#&job_clock_id=#form.job_clock_id#&error=qty">
</cfoutput>  
</cfif>
 
 
<cfquery name="insert_job" datasource="jrgm">
   INSERT INTO app_job_materials_actual 
   (Job_ID,ds_id, Item_ID,Quantity_used,Unit_used,crew_leader,job_clock_id,Service_Date) 
   VALUES 
   ('#form.job_ID#',#form.ds_id#,'#form.item_id#',#form.quantity_used#,'#form.unit_used#',#form.CREW_LEADER#,#form.job_clock_id#,#form.ds_date#)
   </cfquery>
<cfoutput>  <cflocation url="daily_sheet_edit.cfm?dsid=#ds_id#">
</cfoutput>  
  </cfif>
 
 <!--- <cfif Not IsDefined("url.error")> --->
 
 <CFQUERY name="get_all_units" datasource="#request.dsn#">
 SELECT DISTINCT unit_used  AS unit_used FROM app_job_materials_actual  
 </CFQUERY>
<!---  </cfif> --->
   
   <cfif IsDefined("form.dsid")>
  <CFSET ds_id= form.dsid>
  
 <cfelseif IsDefined("url.dsid")>
  <CFSET ds_id= url.dsid>
</cfif>



<cfif IsDefined("form.job_clock_id")>
  <CFSET job_clock_id= form.job_clock_id>
  <cfelseif IsDefined("url.job_clock_id")>
  <CFSET job_clock_id= url.job_clock_id>
</cfif>

   
   
<CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT * FROM app_job_clock WHERE ID = #job_clock_id#
   </CFQUERY>
<cfquery name="get_this_job_name" datasource="jrgm">
 SELECT [Wk Location Name] AS event_name,branch FROM app_jobs
 WHERE [Job ID] ='#get_this_job.job_id#'
 </cfquery>
<cfquery name="get_ds_info" datasource="jrgm">
SELECT  * FROM app_daily_sheets 
WHERE  ID = #ds_id#
 </cfquery>
<cfquery name="get_employee" datasource="jrgm">
SELECT   [Employee ID], [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #Employee_ID#    
</cfquery>
<cfquery name="get_supervisor" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] as empid,[Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=   #get_ds_info.supervisor_id#    
</cfquery>
<cfquery name="get_crew_leader" datasource="jrgm">
SELECT   [Employee ID], [Employee ID] as empid, [Name FirstLast] AS employeename FROM app_employees WHERE [Employee ID]=    #get_ds_info.crew_leader_id#  
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
    	input { text-align:right; }
 		.arialfont {font: normal .9em Arial, Helvetica, sans-serif;}
 .redarial {font: normal .9em Arial, Helvetica, sans-serif;color: red;}
</style>

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">      <div class="header">Materials Editor </div>
        <cfif IsDefined("form.ds_id") AND  IsDefined("form.submit") >
         <table   border="0" cellpadding="3" cellspacing="0" class="arialfont" >
        <tr>
          <td align="left" nowrap="nowrap" >The materials has been aded to the daiy sheet.<br />
         <br />
          <cfoutput> <a href="daily_sheet_edit.cfm?DSID=#form.ds_id#">Go to daily sheet. </a></cfoutput></td>
         </tr>
        </table>
        <cfabort>
      </cfif>
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
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job Name:&nbsp;<cfoutput></cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#get_this_job_name.event_name#</cfoutput></td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" >Job ID:&nbsp;</td>
          <td align="left" nowrap="nowrap" class="dailysheetEditTop" ><cfoutput>#get_this_job.Job_ID#</cfoutput></td>
        </tr>
     
      </table>
       
      <form   method="post" action="daily_sheet_edit_add_materials1.cfm" >
  <cfquery name="get_all_materials" datasource="jrgm">
SELECT *  FROM app_materials_list order by sortid
</cfquery>
        <table width="70%" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td nowrap="nowrap" class="dailysheetEditTop">Select Materials</td>
            <td class="dailysheetEditTop"><div class="stylededit-select">
                <select name="item_id" >
                  <cfoutput query="get_all_materials">
                    <option value="#item_id#">#item_id#</option>
                  </cfoutput>
                </select>
              </div></td>
          </tr>
          <tr>
            <td class="dailysheetEditTop">Select Unit</td>
            <td class="dailysheetEditTop">
            <div class="stylededit-select">
             <select name="unit_used" >
 			<cfoutput query="get_all_units"> 
             <option value="#unit_used#">#unit_used#</option>
              </cfoutput>
            </select> </div></td>
          </tr>
          <tr>
            <td class="dailysheetEditTop">Select Quantity </td>
            <td class="dailysheetEditTop">
			 
                <input type="text" value="" name="quantity_used"  maxlength="5"  size="5" />   
<cfif IsDefined("url.error")>
	  <span class="redarial">You need to enter a quantity used!</span>
</cfif>
            </td>
          </tr>
          <tr>
            <td align="left" nowrap="nowrap"  class="dailysheetEditTop">&nbsp;</td>
            <td align="center"><input type="submit" name="submit" class="materialsbutton" id="submit" value="Submit" /></td>
          </tr>
         
          <cfoutput>
            <input type="hidden" name="ds_date"   value="#get_ds_info.ds_date#" />
            <input type="hidden" name="ds_id"   value="#DS_ID#" />
             <input type="hidden" name="crew_leader"  value="#get_crew_leader.empid#"  />
                  <input type="hidden" name="supervisor"   value="#get_supervisor.empid#" />
                  <input type="hidden" name="job_clock_id"   value="#job_clock_id#" />
                     <input type="hidden" name="job_id"   value="#get_this_job.job_id#" />
           </cfoutput>
        </table>
      </form>
     
      <cfoutput>
        <p><a href="daily_sheet_edit.cfm?dsid=#ds_id#"  class="dssbutton">Back to Daily Sheet</a> </p>
      </cfoutput> 
      </div>
  </div>
  <!-- to clear footer -->
</div>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
