<cfquery name="get_all_jobs" datasource="jrgm">
SELECT * FROM app_jobs 
WHERE   active_record =1
<!--- WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid# --->
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfquery name="get_this_crew_leader" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM app_employees
WHERE [Employee ID] = #CREW_LEADER_ID#   
</cfquery>
      <cfquery name="get_this_job" datasource="jrgm">
SELECT [Wk Location Name] AS work_loc_name ,[job id] AS job_id FROM app_jobs
WHERE  [job id] = '#url.job_ID#'   AND active_record =1
</cfquery>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="8" class="header">Daily Sheet</td>
        </tr>
        <tr>
          <td height="30" valign="bottom" nowrap="nowrap" class="dailysheet_header">Crew Leader : </td>
          <td height="30" valign="top" nowrap="nowrap"  class="subheadersp">&nbsp;<cfoutput>#get_this_crew_leader.EMPLOYEE_NAME#</cfoutput> </td>
          <td width="40" height="30" valign="bottom" nowrap="nowrap"></td>
          <td height="30" valign="bottom" nowrap="nowrap" class="dailysheet_header">Work Date : </td>
          <td height="30" valign="top" nowrap="nowrap"  class="subheadersp">&nbsp;<cfoutput>#url.ds_date#</cfoutput> </td>
          <td width="40" height="30" valign="bottom" nowrap="nowrap"  class="subheadersp">&nbsp;</td>
          <td height="30" valign="bottom" nowrap="nowrap" class="dailysheet_header">Property/Job : </td>
          <td height="30" valign="top" nowrap="nowrap"  class="subheadersp">&nbsp;<cfoutput>#get_this_job.Work_Loc_Name#</cfoutput></td>
        </tr>
      </table>
      <div class="spacer10"></div>
      <form class="css_form" action="job_materials_logic.cfm"  method="post">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr class="services">
            <td valign="top"></td>
            <td valign="top">Material Name</td>
            <td valign="top">Qty</td>
            <td valign="top"><img src="images/clear.png" width="40" height="1" /></td>
            <td valign="top">Unit</td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td valign="top"></td>
            <td valign="top"><cfquery name="get_materials_list" datasource="jrgm">
				SELECT * FROM materials_list WHERE (Time_Entry IS NOT NULL AND Time_Entry <> '') ORDER by Item_ID
				</cfquery>
              <fieldset>
              <div class="select_element">
                <select name="materials_name_used">
                  <CFOUTPUT QUERY="get_materials_list">
                    <option value="#Item_ID#">#Item_ID#</option>
                  </CFOUTPUT>
                </select>
              </div>
              </fieldset></td>
            <td ><!--- <input type="text" class="textbox"  name="materials_quantity_used"   /> --->
              <input name="materials_quantity_used" type="text" class="textbox"    size="5"  style="text-align: right"  maxlength="4"  />
            </td>
            <td valign="top"></td>
            <td valign="top"><fieldset>
              <div class="select_element_date">
                <select name="materials_unit">
                  <option value="Bags">Bags</option>
                  <option value="Cubic Yards">Cubic Yards</option>
                  <option value="Gallons">Gallons</option>
                  <option value="Ounces">Ounces</option>
                  <option value="Pots">Pots</option>
                  <option value="Pounds">Pounds</option>
                  <option value="Yards">Yards</option>
                </select>
              </div>
              </fieldset></td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td><input type="submit" name="materials_used"   value="SUBMIT" class="bluebutton" /></td>
            <td>&nbsp;</td>
            <td><input type="submit" name="add_another_job"   value="Add Another Job" class="materialsbuttonwider" /></td>
          </tr>
        </table>
        <cfoutput>
          <cfif IsDefined("url.ds_date")>
            <input type="hidden" name="ds_date" value="#url.ds_date#" />
            <cfelse>
            <input type="hidden" name="ds_date" value="#ds_date#" />
          </cfif>
          <!--- <input type="hidden" name="job_id" value="#job_id#" /> --->
          <input type="hidden" name="ds_id" value="#url.ds_id#" />
          <input type="hidden" name="crew_leader_id" value="#url.crew_leader_id#" />
          <input type="hidden" name="job_id" value="#url.job_id#" />
        </cfoutput>
      </form>
      <div class="spacer20"></div>
      <cfquery name="get_this_job_materials" datasource="jrgm" >
SELECT * FROM app_job_materials_actual   WHERE  job_ID = '#job_ID#' AND ds_id = #url.ds_id#
</CFQUERY>
      <cfif IsDefined("url.materialq")>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div class="subheader">Materials Used</div>
              <br />
              <table border="0" cellspacing="0" cellpadding="0">
                <cfoutput query="get_this_job_materials">
                  <tr>
                    <td class="services">#Item_ID# - #Quantity_used# #Unit_used# <img src="images/minus.gif" alt="" width="24" height="24" /> </td>
                  </tr>
                </cfoutput>
              </table></td>
            <td></td>
          </tr>
        </table>
        <!--- <table width="60%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" nowrap="nowrap"><div class="subheader">Materials Used</div></td>
    <td valign="top" nowrap="nowrap">&nbsp;</td>
    <td align="center" valign="top" nowrap="nowrap"><span class="subheader">Qty</span></td>
    <td valign="top" nowrap="nowrap">&nbsp;</td>
    <td valign="top" nowrap="nowrap"><span class="subheader">Unit</span></td>
    <td valign="top" nowrap="nowrap">&nbsp;</td>
       <td align="center" valign="top" nowrap="nowrap"><span class="subheader">X</span></td>
  </tr>
   <cfoutput query="get_this_job_materials">  <tr>
                  <td nowrap="nowrap" class="services">#Item_ID#</td>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td align="center" nowrap="nowrap"> <span class="services">#Quantity_used#</span></td>
                  <td nowrap="nowrap">&nbsp;</td>
                  <td nowrap="nowrap">  <span class="services">#Unit_used# </span></td>
                  <td>&nbsp;</td>
                  <td align="center">  <img src="images/minus.gif" alt="" width="36" height="36" /> </td>
                </tr>
  
  <tr>
    <td class="services_list">&nbsp;</td>
    <td class="services_list">&nbsp;</td>
    <td class="services_list">&nbsp;</td>
    <td class="services_list">&nbsp;</td>
    <td class="services_list">&nbsp;</td>
  </tr></cfoutput>
</table> --->
      </cfif>
      <p>&nbsp;</p>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
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
