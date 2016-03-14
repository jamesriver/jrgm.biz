<cfif IsDefined("form.continue") >
  <cfset todaysdate = #Now()#>
  <cfquery name="insert_ds" datasource="jrgm">
   INSERT INTO daily_sheets 
   (Supervisor_ID,Crew_Leader_ID,DS_Date,record_created) 
   VALUES 
   (#Session.userid#,#form.CREW_LEADER_ID#,#CreateODBCDateTime(form.ds_date)#,#CreateODBCDateTime(todaysdate)#)
   </cfquery>
  <cfquery name="get_max" datasource="jrgm">
 Select ID FROM app_daily_sheets where id=IDENT_CURRENT('daily_sheets') 
 </cfquery>
  <cflocation url="post_daily_time.cfm?DS_ID= #get_max.ID#&mylist=#SELECTED_EMPLOYEE_ID#&CREW_LEADER_ID=#CREW_LEADER_ID#&ds_date=#ds_date#">
</cfif>
<cfscript>
/**
 * Removes values from a list by string pattern.
 * Mods by RCamden
 * 
 * @param list      The list to modify. (Required)
 * @param str      The string to look for. (Required)
 * @param mode      If true, removes matches. If false, keeps matches. The default is true. (Optional)
 * @param delim      The delimiter to use. Default is comma. (Optional)
 * @return Returns a string. 
 * @author Markus Schneebeli (markus.schneebeli@inm.ch) 
 * @version 2, June 21, 2002 
 */
function ListRemoveByString(list, str) {
    var i = listLen(list);
    var mode = true;
    var delim = ",";
    
    if(arrayLen(arguments) gte 3) mode = arguments[3];
    if(arrayLen(arguments) gte 4) delim = arguments[4];
    
    for (i=ListLen(list, delim); i gte 1 ; i=i-1) {
        if(  (mode and findNoCase(str,listGetAt(list,i,delim))) or (not mode and not findNoCase(str,listGetAt(list,i,delim)))) list = listDeleteAt(list,i,delim);
    }
    return list;
}
</cfscript>
<cfparam name="form.SELECTED_EMPLOYEE_ID"   default="99999999">
<cfif IsDefined("form.SUBMIT")  AND form.SUBMIT EQ 'Add to Crew'>
  <cfset url.Employee_ID = form.crew_leader_id>
  <cfset myliststarter = form.GET_ALL_EMPLOYEES_SELECT>
</cfif>
<cfif IsDefined("form.submit")  AND form.SUBMIT EQ 'Delete'   >
  <cfset url.Employee_ID = form.crew_leader_id>
  <cfset myliststarter = #ListRemoveByString(form.mylist,form.SELECTED_EMPLOYEE_ID)#>
</cfif>
<CFIF IsDefined("form.ds_date")>
  <cfset todayDate = #form.ds_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfif todayDate_dow EQ 2>
  <CFSET todayDate_dow_v = "Mon">
  <cfelseif   todayDate_dow EQ 3>
  <CFSET todayDate_dow_v = "Tues">
  <cfelseif   todayDate_dow EQ 4>
  <CFSET todayDate_dow_v = "Wed">
  <cfelseif   todayDate_dow EQ 5>
  <CFSET todayDate_dow_v = "Thur">
  <cfelseif   todayDate_dow EQ 6>
  <CFSET todayDate_dow_v = "Fri">
  <cfelseif   todayDate_dow EQ 7>
  <CFSET todayDate_dow_v = "Sat">
  <cfelseif   todayDate_dow EQ 1>
  <CFSET todayDate_dow_v = "Sun">
</cfif>
<cfquery name="get_this_crew_leader" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM app_employees WHERE [Employee ID] = #FORM.CREW_LEADER_ID#
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
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="5" class="header">Daily Sheet
        <!--- <div class="subheadersp"><cfoutput>#get_this_crew_leader.EMPLOYEE_NAME#</cfoutput></div> ---></td>
    </tr>
    <tr>
      <td class="dailysheet_header">Crew Leader : </td>
      <td><div class="job_data_header"><cfoutput>#get_this_crew_leader.EMPLOYEE_NAME#</cfoutput></div></td>
      <td width="40"></td>
      <td class="dailysheet_header">Work Date : </td>
      <td><div class="job_data_header"><cfoutput>#form.ds_date#</cfoutput></div></td>
    </tr>
  </table>
    
   
      <form class="css_form" action="dailysheet_select_crew.cfm" method="post">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="dailysheet_header">Set Crew :</span><br />
  <cfquery name="get_employees_crew" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM app_employees WHERE Direct_Supervisor_ID = #FORM.CREW_LEADER_ID# OR   [Employee ID] = #FORM.CREW_LEADER_ID#
</cfquery>
              <cfif IsDefined("myliststarter") AND   form.SUBMIT EQ 'Add to Crew'>
                <CFSET mylist ="#myliststarter#,#form.mylist#">
                <cfelseif IsDefined("myliststarter") AND   form.SUBMIT EQ 'Delete'  >
                <CFSET mylist ="#myliststarter#">
                <cfelse>
                <CFSET mylist ="#FORM.CREW_LEADER_ID#">
              </cfif>
              <cfif NOT ISDefined("form.submit")>
                <cfloop query="get_employees_crew">
                  <cfset myList = ListAppend(mylist,Employee_ID)>
                </cfloop>
              </cfif>
              <cfquery name="get_employees_crew_1" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM app_employees WHERE   [Employee ID] IN (#mylist#)
</cfquery>
              <div class="subheadersp">
                <ul class="crew">
                  <cfoutput query="get_employees_crew_1">
                    <li>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><input name="SELECTED_EMPLOYEE_ID" type="checkbox" id="crew#currentrow#" value="#Employee_ID#"  checked="checked" /></td>
                          <td width="75%" nowrap="nowrap">#EMPLOYEE_NAME# </td>
                          <td nowrap="nowrap" class="timeIn"></td>
                          <td align="right" class="rtarrow"><input name="submit"   type="submit"      value="Delete" class="bluebutton"  /></td>
                        </tr>
                      </table>
                    </li>
                  </cfoutput>
                </ul>
              </div></td>
            <td width="50"></td>
            <td>&nbsp;</td>
            <td valign="top">
            <cfquery name="get_all_employees_select" datasource="jrgm">
				SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM app_employees WHERE branch = '#SESSION.branch#' AND  [Name FirstLast] IS NOT NULL ORDER by EMPLOYEE_NAME
				</cfquery>
                
               
              <fieldset>
              <div class="select_element">
                <select name="get_all_employees_select">
                  <option value="00000" selected="selected">Add Additional Crew</option>
                  <CFOUTPUT QUERY="get_all_employees_select">
                    <option value="#Employee_ID#">#EMPLOYEE_NAME#</option>
                  </CFOUTPUT>
                </select>
              </div>
              </fieldset></td>
            <td valign="top"><input type="submit" name="submit" id="button" value="Add to Crew" class="bluebutton" />
           </tr>
          <cfoutput>
            <input type="hidden" name="myList" value="#myList#" />
            <input type="hidden" name="crew_leader_id" value="#FORM.CREW_LEADER_ID#" />
            <input type="hidden" name="ds_date" value="#FORM.ds_date#" />
          </cfoutput>
          <tr>
            <td><div class="spacer10"></div>
              <input type="submit" name="continue" id="button" value="Select Crew & Continue" class="bluebutton" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
