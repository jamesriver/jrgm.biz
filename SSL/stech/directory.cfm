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
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
 
</head>
<body >
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   

     <table width="100%" border="0" cellpadding="0">
      <tr>
        <td><div class="header">Directory</div>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"> <article class="accordion-a"> 
        <section>
          <header>
            <span class="subheader">&nbsp;<cfoutput>#SESSION.branch#</cfoutput> Branch Employees</span>
          </header>
          <div class="content">
          
  <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0">
   <thead> 
<tr>
    <th align="left">First Name</th>
    <th align="left">Last Name</th>
    <th align="left">Position</th>
    <th align="left">Cell Phone</th>
    <th align="left">Notes</th>
  <!---   <th align="left">Email</th> --->
  </tr>
  </thead>
  
  <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position, [Ph Cell] AS cellphone,[Employee ID] As employee_id,email FROM APP_employees
WHERE branch = '#SESSION.branch#'  AND    active_record = 1
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
 

   <tbody>
  <cfoutput query="get_branch_employees"> <tr>
    <td><a href="mailto:#email#">#first_name#</a></td>
    <td>#last_name#</td>
    <td>#Position#</td>
    <td>#cellphone#</td>
    <td><a href="employee_details.cfm?employee_id=#get_branch_employees.Employee_ID#&work_date=#todayDate#">Notes</a></td>
   <!---  <td><a href="mailto:#email#">#email#</a></td> --->
  </tr>
   </cfoutput>
    </tbody>
</table> 

          </div>
        </section></article></td></tr></table>
       </td></tr></table><br />
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"> <article class="accordion-a"> 
        <section>
          <header>
            <span class="subheader">&nbsp;<cfoutput>#SESSION.branch#</cfoutput> Branch Jobs </span>
          </header>
          <div class="content">
          
  <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0">
  <thead>
  <tr>
    <th align="left">Job ID</th>
    <th align="left">Job Name</th>
    <th align="left">Address</th>
    <th align="left">City</th>
    <th align="left">State</th>
    <th align="left">Notes</th>
  </tr>
  </thead>
  <cfquery name="get_branch_jobs" datasource="jrgm"     >
SELECT ID, [Job ID] as jobid, [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM APP_jobs
 WHERE branch = '#SESSION.branch#'  AND    active_record = 1
 ORDER by  locationname ASC
</cfquery>
<tbody>
  <cfoutput query="get_branch_jobs"> <tr>
    <td>#jobid#</td>
    <td>#locationname#</td>
    <td>#jobaddress1#</td>
    <td>#jobcity#</td>
    <td>VA</td>
    <td><a href="job_details.cfm?work_date=#todayDate#&job_id=#get_branch_jobs.jobid#">Notes</a></td>
  </tr>
  </cfoutput>
  </tbody>
</table>  

          </div>
        </section></article></td></tr></table>
          <br />
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"> <article class="accordion-a"> 
        <section>
          <header>
              <span class="subheader"> &nbsp;JRGM Materials</span>
          </header>
          <div class="content">
          
  <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0">
   <thead> 
<tr>
    <th align="left">Item ID</th>
    <th align="left">Item Description</th>
   </tr>
  </thead>
   <cfquery name="get_materials" datasource="jrgm"  >
SELECT   Item_ID, Item_grouping, Item_description 
FROM         app_materials_list
ORDER by  Item_ID ASC
</cfquery>
    <tbody>
  <cfoutput query="get_materials"> 
  <tr>
    <td>#Item_ID#</td>
    <td>#Item_description#</td>
   </tr>
   </cfoutput>
    </tbody>
</table> 
           </div>
        </section></article></td></tr></table><br />
    
         </td>
      </tr>
    </table>
  </div>  </div>
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
