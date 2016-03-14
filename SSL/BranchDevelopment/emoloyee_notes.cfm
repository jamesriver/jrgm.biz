<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE  Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
<!------------------- Get in progress time ---------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/print.css" rel="stylesheet" media="print" type="text/css" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
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
<style>
 
.dstable_header {
	padding: 10px;
	background-color: #cde3fc;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: bold .9em Arial, Helvetica, sans-serif;
}
.dstable_top {
	padding-right: 10px;
	color: #000;
	font: bold 1.0em Arial, Helvetica, sans-serif;
}
 
.redtype {
	color: #F00;
}
.greentype {
	color: #588302;
}
red {
	color: #F00;
}
.dstable_headersm1 {
	padding: 8px;
	background-color: #cde3fc;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: bold .85em Arial, Helvetica, sans-serif;
	line-height:  18px;
}
.greentype1 {	color: #588302;
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
  
    <div class="header">Employee Notes</div>
    <cfquery name="get_employees_notes" datasource="jrgm">
SELECT  ID,note_content,employee_id,Note_Author_ID FROM app_notes WHERE Employee_ID  
 IN (SELECT Employee_ID FROM app_crews WHERE  Employee_branch = '#SESSION.branch#')
 ORDER by  Note_Date ASC
            </cfquery>
            <!--- <cfdump var="#get_employees_notes#"> --->
      
            <div class="notes">
              <p>
              <cfif get_employees_notes.recordcount EQ 0>
                No Employee Notes for today
                <cfelse>
                </p>
                <ul>
                  <cfoutput query="get_employees_notes">
                    <cfquery name="get_employees_name" datasource="jrgm">
SELECT  [Name FirstLast] AS empname FROM app_employees  WHERE [Employee ID]  =
 #get_employees_notes.employee_id#
</cfquery>
                    <li><a href="employee_details.cfm?employee_id=#employee_id#&work_date=#todayDate#">#get_employees_name.empname#</a> : #note_content#</li>
                  </cfoutput>
                </ul>
              </cfif>
              </div>
  </div>  </div>
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
<!---  This is the good join query
 <CFQUERY name="get_this_job" datasource="#request.dsn#">
  SELECT t1.*, t2.*  FROM APP_job_services_actual_employee AS T1 INNER JOIN job_clock AS T2 ON T1.Job_ID = T2.Job_ID WHERE crew_leader =#crew_leader_id#
  ORDER by t2.ID ASC
    </CFQUERY> --->
