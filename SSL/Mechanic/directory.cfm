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
<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.alertbox {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#F3F3F3;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#FFFFFF;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:5px 5px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}

.eqbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:32px;
	-moz-border-radius-topleft:32px;
	border-top-left-radius:32px;
	-webkit-border-top-right-radius:32px;
	-moz-border-radius-topright:32px;
	border-top-right-radius:32px;
	-webkit-border-bottom-right-radius:32px;
	-moz-border-radius-bottomright:32px;
	border-bottom-right-radius:32px;
	-webkit-border-bottom-left-radius:32px;
	-moz-border-radius-bottomleft:32px;
	border-bottom-left-radius:32px;
	text-indent:9px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#07482f;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:168px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.eqbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}
.eqbutton:active {
	position:relative;
	top:1px;
}
</style>
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
        
        <br />
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
