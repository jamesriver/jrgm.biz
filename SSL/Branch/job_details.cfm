<cfif IsDefined("deleteme")  AND deleteme  EQ 'yes'>
  <cfquery name="delete_job_notes" datasource="jrgm">
DELETE  FROM APP_notes WHERE   ID  = #url.noteid# 
 </cfquery>
</cfif>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfquery name="get_job_info" datasource="jrgm" maxrows="1">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader,branch
 FROM APP_jobs WHERE [Job ID] =  '#url.Job_ID#'
</cfquery>
<!--- <cfdump var="#get_job_info#"> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
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
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <!---    <div class="header">Job Details</div> --->
      <cfoutput query="get_job_info">
        <div class="subheader">#locationname#</div>
        <ul class="crew">
             <li>Job Branch&##8212;#branch#</li>
          <li class="crewtop">Job ID&##8212;#ID# </li>
          <li>James River ID&##8212;#Job_ID#</li>
          <li>Job Location&##8212;#locationname#</li>
          <li>Address&##8212;#jobaddress1#</li>
          <li>City&##8212;#jobcity#, #jobstate# #jobzip#</li>
          <!---   <li>Account Manager&##8212;#acctmgr#</li>
        <li class="crewbot">Crew Leader&##8212;#CrewLeader#</li> --->
        </ul>
      </cfoutput> <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0"  >
        <tr>
          <td><span class="header">All Notes for <cfoutput>#get_job_info.locationname#</cfoutput></span>
            <cfif IsDefined("deleteme") AND deleteme EQ 'notsure' >
              <br />
              <br />
              <span class="dstable_top">Are you sure you want to delete this note?<br />
              <br />
              <cfoutput> <a href="job_details.cfm?deleteme=yes&amp;job_id=#job_id#&amp;work_date=#url.work_date#&amp;noteid=#url.noteid#">Yes</a>&nbsp;&nbsp; &nbsp; <a href="job_details.cfm?work_date=#url.work_date#&amp;job_id=#job_id#">No</a></cfoutput></span>
              <cfabort>
          </cfif>          </td>
          <td align="right"><cfoutput> <a href="notes.cfm?work_date=#url.work_date#&amp;job_id=#job_id#" class="bluebutton">Add Notes</a></cfoutput></td>
        </tr>
      </table>
      <div class="spacer10"></div>
      <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
        <thead>
          <tr>
            <th align="left">Date</th>
            <th align="left">Reported by</th>
            <th align="left" class="sorttable_alpha">Note</th>
            <th align="center" class="sorttable_alpha">Pictures</th>
            <th align="center" class="sorttable_alpha">Remove</th>
          </tr>
        </thead>
        <cfquery name="get_job_notes" datasource="jrgm">
SELECT * FROM APP_notes WHERE  job_ID = '#job_ID#' 
ORDER by Note_Date DESC
</cfquery>
        <tbody>
          <cfoutput query="get_job_notes">
            <tr>
              <td align="left">#dateformat(Note_Date,"mm/dd/yyyy")#</td>
              <cfquery name="get_auth_info" datasource="jrgm"  maxrows="1">
SELECT [Employee ID] AS EmployeeID,position,[Name FirstLast] AS employeename  FROM APP_employees WHERE [Employee ID]=  #get_job_notes.Note_Author_ID#  
</cfquery>
              <td nowrap="nowrap">#ID#- #get_auth_info.employeename# </td>
              <td align="left" >#note_content#</td>
              <cfdirectory action="list" directory="C:\inetpub\websites\webservice.jrgm.biz\NotesImg\" name="Job_note_pix" recurse="true">
              <cfquery name="Job_note_pix" dbtype="query">
    select *
    from Job_note_pix
  WHERE name LIKE '#ID#%'
</cfquery>
              <!---  <cfdump  var="#Job_note_pix#">  --->
              <td align="center" ><cfloop query="Job_note_pix"  startRow = "1" endRow = "5">
                  <a href="http://webservice.jrgm.biz/NotesImg/#name#" target="_blank"><img src="http://webservice.jrgm.biz/NotesImg/#name#" width="20" height="20" /></a>&nbsp;
              </cfloop></td>
              <td align="center" ><a href="job_details.cfm?deleteme=notsure&job_id=#job_id#&work_date=#url.work_date#&noteid=#get_job_notes.ID#"><img src="images/del.png" width="12" height="12" /></a></td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
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
