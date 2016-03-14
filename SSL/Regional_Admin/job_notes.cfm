
<cfquery name="get_RM_Name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,Last_name AS Employee_Name FROM 
APP_employees WHERE [Employee ID] ='#SESSION.userid#' 
</cfquery>

 
<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<!--- <cfdump  var="#get_crew_leaders#"> --->
<CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>


<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<!------------------- Get in progress time ---------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" /><link href="js/jquery-ui.css" rel="stylesheet">
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
  
    <div class="header">Job Notes</div>
      <cfquery name="get_job_notes" datasource="jrgm" >
SELECT  ID,note_content, job_id,Note_Date FROM app_notes WHERE job_ID  
 IN (SELECT  [Job ID] FROM app_jobs WHERE   branch   IN   (#PreserveSingleQuotes(branchlist)#))
 ORDER by  Note_Date DESC
</cfquery>
 <!--- <cfdump var="#get_job_notes#"> --->

               <cfif get_job_notes.recordcount EQ 0>
                 <p>No Job Notes</p>
                <cfelse>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortablenotes">
              
                 <tbody>
                   <cfoutput query="get_job_notes">
                    <cfquery name="get_jobs_name" datasource="jrgm">
SELECT   [Wk Location Name] AS jobname,branch FROM app_jobs WHERE  [Job ID]  =
 '#get_job_notes.job_id#'
</cfquery>
                   <tr>
     <cfif get_jobs_name.branch EQ 'Newport News'>
          <CFSET branchnew = "NEWP" >
          <cfelseif get_jobs_name.branch EQ 'Charlottesville'>
          <CFSET branchnew = "CHAR" >
           <cfelseif get_jobs_name.branch EQ 'Williamsburg'>
          <CFSET branchnew = "WMBG" >
          <cfelseif get_jobs_name.branch EQ 'Richmond'>
          <CFSET branchnew = "RICH" >
           <cfelseif get_jobs_name.branch EQ 'Portsmouth'>  
          <CFSET branchnew = "PORT" >
            <cfelseif get_jobs_name.branch EQ 'Chesterfield'> 
          <CFSET branchnew = "CHES" >
           <cfelseif get_jobs_name.branch EQ 'Corporate'> 
          <CFSET branchnew = "CORP" >
          <cfelse>
         <CFSET branchnew = #Left(get_jobs_name.branch,4)# >
         </cfif>
                       <td>#branchnew#</td>
                   <td>#dateformat(Note_Date,"mm/dd/yy")#</td>
                   <td><a href="job_details.cfm?job_id=#job_id#&work_date=#todayDate#">#get_jobs_name.jobname#</a> : #note_content#</td>
                   <td><a href=""><i class="fa fa-times-circle"></i></a></td>
                   </tr> 
                  </cfoutput>
                </tbody></table>
               
              </cfif>
  </div>  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->

<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
 
