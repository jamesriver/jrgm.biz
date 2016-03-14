<CFSET allchecked ='Yes'>
<cfquery name="get_this_employee" datasource="jrgm">
SELECT * FROM app_employees WHERE Employee_ID = #url.Employee_ID# AND active_record =1
</cfquery>
<CFSET pay_period_number = 5>
<cfquery name="get_pay_period_info" datasource="jrgm">
SELECT * FROM app_pay_periods WHERE pay_period_number = #pay_period_number#
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
