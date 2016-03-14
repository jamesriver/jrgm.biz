<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
textarea {
	width: 400px;
	padding: 10px;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="centrecontent_inner">
<table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="left">Date</th>
   <th align="left">Job/Employee</th> 
   <th align="left">Reported by</th>
   <th align="left" class="sorttable_alpha">Note</th>
   <th align="center" class="sorttable_alpha">Pictures</th>
   <th align="center" class="sorttable_alpha">Remove</th> 
</tr> 
</thead> 
 
 <cfquery name="get_job_notes" datasource="jrgm">
SELECT * FROM APP_notes 
ORDER by Note_Date DESC
</cfquery>
      <tbody>  
   <cfoutput query="get_job_notes"> <tr>
    <td align="left">#dateformat(Note_Date,"mm/dd/yyyy")#</td>
    <cfif get_job_notes.employee_ID IS ""> 
     <cfquery name="get_this_job_name" datasource="jrgm">
			SELECT [Wk Location Name] AS event_name FROM app_jobs
			WHERE [Job ID] ='#get_job_notes.job_id#'
			</cfquery>
            <td nowrap="nowrap">#job_id#-#get_this_job_name.event_name#</td><cfelse> 
    <cfquery name="get_this_employee" datasource="jrgm" maxrows="1" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Employee ID], [Name FirstLast] AS employeename FROM APP_employees WHERE  [Employee ID]=  #get_job_notes.Employee_ID#  
</cfquery><td nowrap="nowrap">#employee_id#-#get_this_employee.employeename#</td> </cfif>
    <cfquery name="get_auth_info" datasource="jrgm"  maxrows="1" cachedwithin="#createTimespan(0,8,0,0)#">
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
    <td align="center" ><cfloop query="Job_note_pix"  startRow = "1" endRow = "5"><a href="http://webservice.jrgm.biz/NotesImg/#name#" target="_blank"><img src="http://webservice.jrgm.biz/NotesImg/#name#" width="20" height="20" /></a>&nbsp;</cfloop></td>
     <td align="center" ><a href="job_details.cfm?deleteme=notsure&job_id=#job_id#&noteid=#get_job_notes.ID#"><img src="images/del.png" width="12" height="12" /></a></td>
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
