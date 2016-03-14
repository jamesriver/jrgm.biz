<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>


<!--- This is the code to force cl to enter services --->
<cfif   IsDefined("Session.job_services_entered") AND  Session.job_services_entered EQ 0>
  <cfquery name="get_job_without_services" datasource="jrgm" maxrows="1">
SELECT * FROM job_clock WHERE Crew_Leader_ID = #Session.userid#  
ORDER by ID DESC 
</cfquery>
  <cflocation url="services.cfm?work_date=#todayDate_DS#&job_id=#get_job_without_services.job_id#&ID=#get_job_without_services.ID#">
</cfif>
<!--- END This is the code to force cl to enter services --->
<cfset Now_Time = Now()>
<CFSET allchecked ='No'>
<!--- <cfquery name="get_employees" datasource="jrgm">
SELECT   DISTINCT Employee_ID,Crew_Leader_ID, crew_name AS employee_name,Employee_Position_ID  FROM crews WHERE 
(Crew_Leader_ID = #SESSION.userid#  OR Employee_ID = #SESSION.userid#  OR crew_leader_id = #SESSION.userid#  ) 
  AND (start_date  >=  (#today#) AND start_date < (#tomorrow#)) 
AND active_record =1  
</cfquery>
 --->
 <cfquery name="get_employees" datasource="jrgm">
SELECT   DISTINCT Employee_ID, crew_name AS employee_name,Employee_Position_ID  FROM crews WHERE 
  Employee_ID = #SESSION.userid#  OR (Crew_Leader_ID = #SESSION.userid#  
  AND (start_date  >=  (#today#) AND start_date < (#tomorrow#))) OR  (Crew_Leader_ID = #SESSION.userid#  
     AND end_date > (#tomorrow#))
AND active_record =1  
ORDER by Employee_Position_ID DESC 
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
<cfset todayDate_mmddyyyy= DateFormat(Now(),"mm/dd/yyyy")>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND Crew_Leader_ID = #Session.userid#  <!--- AND export_id =1  --->
ORDER by start_date,event_name
</cfquery>
<!---     <cfdump var="#get_todays_jobs#"> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="google-translate-customization" content="9053ae079ac2729a-ad4ef03839af0d1d-ge61bf7fdb3c1afd2-c" />
</meta>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
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
    
      .red {color:red; font-style:italic; font-size:14px; padding-left: 20px;
	    }
 	a.white:hover { color: white; }
	-->
</style>
</head>
<body>
      <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    
    <div id="content">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="70%" valign="middle"><span class="header">
            <!--Schedule for -->
            <cfoutput>#DateFormat(todayDate, "dddd, mmmm dd, yyyy")# <!--- -#SESSION.supervisor_id# ---></cfoutput></span></td>
          <td align="right"><cfset tomorrow = dateadd("d",1,somedate)>
      <table border="0" cellpadding="0" cellspacing="0">
        <tr><td><cfoutput><a href="default.cfm?work_date=#dateformat(yesterday,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tl','','images/today_lefto.png',0)"><img src="images/today_left.png" alt="Previous Day" width="42" height="39" id="tl" /></a></cfoutput></td>
          <td><cfoutput><a href="default.cfm?work_date=#dateformat(todayDate_button,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('today','','images/today_o.png',0)"><img src="images/today.png" alt="Today" width="96" height="39" id="today" /></a></cfoutput></td>
          <td><cfoutput><a href="default.cfm?work_date=#dateformat(tomorrow,"mm/dd/yyyy")#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tr','','images/today_rto.png',0)"><img src="images/today_rt.png" alt="Next Day" width="42" height="39" id="tr" /></a></cfoutput></td></tr></table></td>
        </tr>
      </table> <!---  <cfdump var="#get_employees#">   --->
<!--      <div class="subheader">Crew List</div>
-->      <form action="employee_time_logic.cfm"  method="post">
        <ul class="crew">
          <cfoutput query="get_employees">
            <li>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><input name="Employee_ID" type="checkbox" id="crew#currentrow#" value="#Employee_ID#"  <cfif allchecked EQ 'Yes'>checked </cfif> /></td>
                  <td align="left" width="98%"><a href="employee_details.cfm?Employee_ID=#Employee_ID#&work_date=#todayDate#">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="left" width="60%">#EMPLOYEE_NAME#
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
                 
                 
                 <cfset time_out_mmddyyy = #DateFormat(get_employee_timestamp.time_out, "mm/dd/yyyy")#>
                         <cfif get_employee_timestamp.in_out_status EQ 1>
                          <td align="left" nowrap="nowrap" class="timeIn">Time In : #TimeFormat(get_employee_timestamp.Time_In, "hh:mm tt")# </td>
                        </cfif> 
                        <!--- <cfoutput> #time_out_mmddyyy#  - #todayDate_mmddyyyy#</cfoutput> --->
						<cfif time_out_mmddyyy EQ  todayDate_mmddyyyy > 
                        <cfif get_employee_timestamp.in_out_status EQ 2>
                          <td align="left" nowrap="nowrap" class="timeOut">Time Out : #TimeFormat(get_employee_timestamp.Time_Out, "hh:mm tt")# </td>
                        </cfif>
                        </cfif>
                        <td align="right"><img src="images/icon_details.png" width="32" height="32" /></td>
                      </tr>
                    </table>
                    </a> </td>
                </tr>
              </table>
            </li>
          </cfoutput>
        </ul><br /><br />
        
    <cfset todaydate_mmddyy = DateFormat(Now(),"mm/dd/yyyy")>  
   <!---  <cfoutput>    #work_date#  -#todaydate_mmddyy#</cfoutput> --->
       
        <cfif todayDate EQ todaydate_mmddyy>
         <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><input type="image" src="images/icon_clockin.png" width="100" height="100" name="time_in" value="CLOCK IN" id="button"> <!--- <input type="submit" name="time_in" id="button" value="CLOCK IN" class="clockinb" />---></td>
            <td align="center"><input type="image" src="images/icon_clockout.png" width="100" height="100" name="time_out" value="CLOCK OUT" id="button"><!---<input type="submit" name="time_out" id="button" value="CLOCK OUT" class="clockoutb" />---></td>
          </tr>
        </table>
        </cfif>
        <cfoutput>
          <cfif IsDefined("url.work_date")>
            <input type="hidden" name="work_date" value="#url.work_date#" />
            <cfelse>
            <input type="hidden" name="work_date" value="#todayDate#" />
          </cfif>
        </cfoutput>
      </form>
      <cfoutput>DSID:#Session.DS_ID# - SID:#SESSION.supervisor_id#</cfoutput>
  </div></div>
  <!-- to clear footer -->
<!-- end outer div -->
    <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>


</body>
</html>
