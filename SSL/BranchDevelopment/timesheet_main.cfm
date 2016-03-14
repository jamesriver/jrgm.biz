<CFSET allchecked ='Yes'>
<cfquery name="get_this_employee" datasource="jrgm">
SELECT * FROM employee_general_info WHERE Employee_ID = #url.Employee_ID# AND active_record =1
</cfquery>
<CFSET pay_period_number = 5>
<cfquery name="get_pay_period_info" datasource="jrgm">
SELECT * FROM APP_pay_periods WHERE pay_period_number = #pay_period_number#
</cfquery>
<cfset pay_period_start = get_pay_period_info.pay_period_start>
<cfset pay_period_end = get_pay_period_info.pay_period_end>
<cfset pay_period_day_1 = dateadd("d",0,pay_period_start)>
<cfset pay_period_day_2 = dateadd("d",1,pay_period_start)>
<cfset pay_period_day_3 = dateadd("d",2,pay_period_start)>
<cfset pay_period_day_4 = dateadd("d",3,pay_period_start)>
<cfset pay_period_day_5 = dateadd("d",4,pay_period_start)>
<cfset pay_period_day_6 = dateadd("d",5,pay_period_start)>
<cfset pay_period_day_7 = dateadd("d",6,pay_period_start)>
<cfset pay_period_day_8 = dateadd("d",7,pay_period_start)>
<cfset pay_period_day_9 = dateadd("d",8,pay_period_start)>
<cfset pay_period_day_10 = dateadd("d",9,pay_period_start)>
<cfset pay_period_day_11 = dateadd("d",10,pay_period_start)>
<cfset pay_period_day_12 = dateadd("d",11,pay_period_start)>
<cfset pay_period_day_13 = dateadd("d",12,pay_period_start)>
<cfset pay_period_day_14 = dateadd("d",13,pay_period_start)>
<!--- <CFSET mylist ="">
<cfloop query="get_employees">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>
<!--------------- See if employees are ALL in or are ALL out --->
<cfquery name="get_employee_all_in" datasource="jrgm" maxrows="#get_employees.recordcount#">
SELECT * from APP_Employee_Payroll_Clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =1
ORDER by ID DESC
</cfquery>
<cfquery name="get_employee_all_out" datasource="jrgm"  maxrows="#get_employees.recordcount#">
SELECT * from APP_Employee_Payroll_Clock WHERE Employee_ID IN (#mylist#)  AND  In_Out_Status =2
ORDER by ID DESC
</cfquery>
<cfif get_employee_all_out.recordcount EQ get_employee_all_in.recordcount>
  <CFSET allchecked ='Yes'>
  <cfelse>
  <CFSET allchecked ='No'>
</cfif>
<cfif  get_employee_all_in.recordcount EQ 0>
  <CFSET allchecked ='Yes'>
</cfif>



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
<cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM job_general_info WHERE Service_Day = '#todayDate_dow_v#'  AND Crew_Leader_ID = #Session.userid#
</cfquery> --->
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
<!--- <script type="text/javascript">
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
 --->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
  <cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <cfset somedate = todayDate>
    <cfset yesterday = dateadd("d",-1,somedate)>
    <cfset tomorrow = dateadd("d",1,somedate)>
    <div class="subheader"><span class="header">Timesheet Management</span>
      <!---  for <cfoutput>#get_this_employee.employee_name#</cfoutput> --->
    </div>
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="subheader" width="150">Timesheet</td>
          <td  class="subheader"><cfoutput><span class="subheader">#get_this_employee.employee_name#</span></cfoutput></td>
          <td align="right"><span class="notapproved">Not Approved</span><span class="totalhours">Total Hours: 80</span></td>
        </tr>
      </table>
      <form action="edit_timesheet2.cfm" method="post">
        <table width="90%" border="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <cfoutput>
                  <tr>
                    <td class="timesheet_left">Date</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_1,"ddd")#<br />
                      03/#DateFormat(pay_period_day_1,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_2,"ddd")#<br />
                      03/#DateFormat(pay_period_day_2,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_3,"ddd")#<br />
                      03/#DateFormat(pay_period_day_3,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_4,"ddd")#<br />
                      03/#DateFormat(pay_period_day_4,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_5,"ddd")#<br />
                      03/#DateFormat(pay_period_day_5,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_6,"ddd")#<br />
                      03/#DateFormat(pay_period_day_6,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_7,"ddd")#<br />
                      03/#DateFormat(pay_period_day_7,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_8,"ddd")#<br />
                      03/#DateFormat(pay_period_day_8,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_9,"ddd")#<br />
                      03/#DateFormat(pay_period_day_9,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_10,"ddd")#<br />
                      03/#DateFormat(pay_period_day_10,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_11,"ddd")#<br />
                      03/#DateFormat(pay_period_day_11,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_12,"ddd")#<br />
                      03/#DateFormat(pay_period_day_12,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_13,"ddd")#<br />
                      03/#DateFormat(pay_period_day_13,"dd")#</td>
                    <td class="timesheet_date">#DateFormat(pay_period_day_14,"ddd")#<br />
                      03/#DateFormat(pay_period_day_14,"dd")#</td>
                  </tr>
                </cfoutput> <cfoutput>
                  <tr>
                    <td class="timesheet_left">Time In</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">08:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="timesheet_left">Time Out</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">12:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="timesheet_left">Time In</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">13:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="timesheet_left">Time Out</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">&nbsp;</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">16:00</td>
                    <td class="timesheet_data">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="timesheet_left">Time In Adj</td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_1#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_2#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_3#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_4#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_5#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_6#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_7#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_8#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_9#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_10#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_11#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_12#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_13#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_14#" /></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap" class="timesheet_left">Time Out Adj</td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_1#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_2#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_3#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_4#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_5#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_6#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_7#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_8#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_9#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_10#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_11#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_12#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_13#" /></td>
                    <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_14#" /></td>
                  </tr>
                </cfoutput>
                <tr>
                  <td class="timesheet_left">Total Hours</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">8.00</td>
                  <td class="timesheet_data">&nbsp;</td>
                </tr>
                <tr>
                  <td class="timesheet_left">Hours Adj</td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield" id="textfield" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield2" id="textfield2" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield3" id="textfield3" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield4" id="textfield4" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield5" id="textfield5" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield6" id="textfield6" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield7" id="textfield7" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield8" id="textfield8" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield9" id="textfield9" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield10" id="textfield10" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield11" id="textfield11" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield12" id="textfield12" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield13" id="textfield13" /></td>
                  <td class="timesheet_data"><input type="text" size="5" maxlength="5" name="textfield14" id="textfield14" /></td>
                </tr>
                <tr>
                  <td class="timesheet_left">Net Hours</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                  <td class="timesheet_data">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="15" align="right"><a href="" class="bluebutton">Calculate</a><a href="" class="bluebutton">Save Changes</a><a href="" class="bluebuttonfade">Approve</a></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </form>
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
