
 <cfquery name="get_employees" datasource="jrgm">
SELECT * FROM employee_payroll_clock WHERE    In_Out_Status =1 AND Crew_Leader =#SESSION.userid#
 </cfquery>
<!---   <cfdump var="#get_employees#">  ---> 
 <CFSET mylunchlist =""> 
<cfloop query="get_employees">
  <cfset mylunchlist = ListAppend(mylunchlist,Employee_ID)>
</cfloop>

<!---  <cfdump var="#mylunchlist#">  --->
 
<cfif cgi.HTTP_REFERER DOES NOT CONTAIN "lunch.cfm"><!--- <cfabort> --->
   <cfquery name="get_max_ds" datasource="jrgm">
     SELECT MAX(ID) AS ds_id FROM DAILY_SHEETS 
     WHERE crew_leader_id =#Session.userid#   
       </cfquery>
  <CFSET SESSION.DS_ID=get_max_ds.ds_id>
  <!--- Time out employees --->
  <CFSET dte = #DateFormat(now(),"mm/dd/yyyy")#>
  <CFSET tim = #TimeFormat(Now())#>
  <CFSET newtime = #parsedatetime(dte&tim)#>
  <cfquery name="jrgm_time" datasource="jrgm">  
    UPDATE Employee_Payroll_Clock 
    SET time_out =#newtime#
   WHERE DS_ID = #SESSION.DS_ID#  AND  In_Out_Status=1
    </cfquery>
  <cfquery name="update_time" datasource="jrgm">
    UPDATE Employee_Payroll_Clock SET time_worked =   DATEDIFF(mi,time_in,time_out),In_Out_Status=2    
    WHERE DS_ID = #SESSION.DS_ID#  AND  In_Out_Status=1
    </cfquery>
  <cfquery name="get_last_time" datasource="jrgm">
    SELECT MAX(time_out) AS maxtime FROM Employee_Payroll_Clock       
    WHERE DS_ID = #SESSION.DS_ID#   
         </cfquery>
  <cfquery name="get_employee_ids" datasource="jrgm">
    SELECT employee_ID FROM Employee_Payroll_Clock       
    WHERE DS_ID = #SESSION.DS_ID#  AND    time_out = '#get_last_time.maxtime#'
         </cfquery>
  <CFSET mylist ="">
  <cfloop query="get_employee_ids">
    <cfset myList = ListAppend(mylist,Employee_ID)>
  </cfloop>
</cfif>

<!--- <CFSET SESSION.lunchtimeout =#newtime#> --->

<CFIF IsDefined("active_job_ID_to_Update")>
 <cfquery name="update_time" datasource="jrgm">
     UPDATE job_clock SET Lunch_Time=1,Lunch_time_out =CURRENT_TIMESTAMP
      WHERE ID =#active_job_ID_to_Update#
  </cfquery>
 </CFIF>


<!--- END This is the code to force cl to enter services --->
<cfset Now_Time = Now()>
<CFSET allchecked ='No'>
<cfquery name="get_employees" datasource="jrgm">
SELECT Employee_ID,Crew_Leader_ID, crew_name AS employee_name,Employee_Position_ID  FROM crews WHERE (Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) <!--- AND export_id =1  --->
</cfquery>
<!--- <cfdump var="#get_employees#"> --->
<CFSET mylist ="#SESSION.userid#">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<!--------------- See if employees are ALL in or are ALL out --->
<cfquery name="get_employee_all_in" datasource="jrgm" maxrows="#get_employees.recordcount#">
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_employee_all_in#"> --->
<cfquery name="get_employee_all_out" datasource="jrgm"  maxrows="#get_employees.recordcount#">
SELECT * FROM employee_payroll_clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =2
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_employee_all_out#"> --->
<cfif get_employee_all_out.recordcount EQ get_employee_all_in.recordcount>
  <CFSET allchecked ='Yes'>
  <cfelse>
  <CFSET allchecked ='No'>
</cfif>
<cfif  get_employee_all_in.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>
<cfif  get_employee_all_out.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>
<!--- <cfoutput>#allchecked#</cfoutput>  --->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<!--- <cfset todayDate_dow = DayOfWeek(todayDate)> --->
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  <!--- AND export_id =1 ---> 
ORDER by start_date,event_name
</cfquery>
<!---     <cfdump var="#get_todays_jobs#"> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="google-translate-customization" content="9053ae079ac2729a-ad4ef03839af0d1d-ge61bf7fdb3c1afd2-c" />
</meta>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles_lunch.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap_lunch.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
<script type="text/javascript">

        $(document).ready(function() {

  if (navigator.userAgent.match(/Android/i)) {
    window.scrollTo(0,0); // reset in case prev not scrolled  
    var nPageH = $(document).height();
    var nViewH = window.outerHeight;
    if (nViewH > nPageH) {
      nViewH -= 150;
      $('BODY').css('height',nViewH + 'px');
    }
    window.scrollTo(0,1);
  }

});

</script>
<style>
.red {
	color:red;
	font-style:italic;
	font-size:14px;
	padding-left: 20px;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar_lunch.cfm">
    <cfinclude template="includes/subbar_lunch.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="middle"><span class="header">
            <!--Schedule for -->
            <cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")#</cfoutput></span></td>
          <td><img src="images/clear.gif" width="40" height="1" /></td>
        </tr>
      </table>
    <!---   <div class="subheader">Crew List</div> --->
      
      <!--- <ul class="crew">
        <cfoutput query="get_employees">
          <li>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><input name="Employee_ID" type="checkbox" id="crew#currentrow#" value="#Employee_ID#"  <cfif allchecked EQ 'Yes'>checked </cfif> /></td>
                <td align="left" width="95%"><a href="">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left" width="75%">#EMPLOYEE_NAME#
                        <cfif Employee_Position_ID EQ 2>
                          (Crew Leader)
                          <cfif IsDefined("url.warn")>
                            <span class="red">The Crew Leader may not time out until all jobs are clocked out</span>
                          </cfif>
                        </cfif>
                      </td>
                      <cfquery name="get_employee_timestamp" datasource="jrgm" maxrows="1">
                    SELECT * FROM employee_payroll_clock WHERE Employee_ID = #Employee_ID# 
                    ORDER by ID DESC
                 </cfquery>
                      <cfif get_employee_timestamp.in_out_status EQ 1>
                        <td align="left" nowrap="nowrap" class="timeIn">Time In : #TimeFormat(get_employee_timestamp.Time_In, "hh:mm tt")# </td>
                      </cfif>
                      <cfif get_employee_timestamp.in_out_status EQ 2>
                        <td align="left" nowrap="nowrap" class="timeOut">Time Out : #TimeFormat(get_employee_timestamp.Time_Out, "hh:mm tt")# </td>
                      </cfif>
                      <td align="right" class="rtarrow">&gt;</td>
                    </tr>
                  </table>
                  </a> </td>
              </tr>
            </table>
          </li>
        </cfoutput>
      </ul> --->
     <!---  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><a  href="" class="clockinb">CLOCK IN</a></td>
          <td align="center"><a  href="" class="clockoutb">CLOCK OUT</a></td>
        </tr>
      </table> --->
      <!--- <cfoutput>
        <cfif IsDefined("url.work_date")>
          <input type="hidden" name="work_date" value="#url.work_date#" />
          <cfelse>
          <input type="hidden" name="work_date" value="#todayDate#" />
        </cfif>
      </cfoutput> --->
    
      <br />
      <br />
      <br />
      <br />
      <br />
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="includes/footer_lunch.cfm">
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
