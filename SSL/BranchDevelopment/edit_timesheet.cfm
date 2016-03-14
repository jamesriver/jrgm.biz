<cfquery name="get_employee_name" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name  FROM APP_employees WHERE Employee_ID = #url.Employee_ID#
</cfquery>
<CFSET pay_period_number = 5>
<cfquery name="get_pay_period_info" datasource="jrgm">
SELECT * FROM APP_pay_periods WHERE pay_period_number = #pay_period_number#
</cfquery>
<!--- <cfdump var="#get_pay_period_info#">
<cfabort> --->
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="outer">
<!--- <div id="left"><div class="topbarl"><div class="leftcolh"> </div></div>
		<ul class="nav">
   <!---    <li><a href="../Crew_Leaders/job_list.cfm">The Bexley Association</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Union First Market Bank - Genito</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Property #5912 Harbour Pointe</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Victorian Square</a></li>
      <li><a href="../Crew_Leaders/job_list.cfm">Rosemont Homeowner's Association</a></li> --->
    </ul>
	</div> --->
<div id="centrecontent">
<div class="topbarr">
  <div align="right"><a href="../Crew_Leaders/forms.cfm" class="formsb">Forms</a></div>
</div>
<!--centre content goes here -->
<div class="centrecontent_inner">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="header">Supervisors - Edit /Approve Payroll</td>
      <td align="right" class="header"><table border="0" cellspacing="0" cellpadding="0">
          <!---  <tr>
              <td><a href="../Crew_Leaders/default.cfm"><img src="../Crew_Leaders/images/minus.gif" width="36" height="36" /></a></td>
              <td class="date">Friday, February 15, 2013</td>
              <td><a href="../Crew_Leaders/default.cfm"><img src="../Crew_Leaders/images/plus.gif" width="36" height="36" /></a></td>
            </tr> --->
        </table></td>
    </tr>
  </table>
  <br />
  <cfoutput>#get_employee_name.employee_name#</cfoutput>
  </h3>
  <br />
  <br />
  <form action="edit_timesheet2.cfm" method="post">
    <table width="90%" border="0" align="center" cellpadding="0">
      <tr>
        <td><table width="100%" border="1" cellpadding="2" cellspacing="0">
            <cfoutput>
              <tr class="ui-btn-down-b">
                <td><strong>Date</strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_1,"ddd")#<br />
                  #DateFormat(pay_period_day_1,"mmm")#<br />
                  #DateFormat(pay_period_day_1,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_2,"ddd")#<br />
                  #DateFormat(pay_period_day_2,"mmm")#<br />
                  #DateFormat(pay_period_day_2,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_3,"ddd")#<br />
                  #DateFormat(pay_period_day_3,"mmm")#<br />
                  #DateFormat(pay_period_day_3,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_4,"ddd")#<br />
                  #DateFormat(pay_period_day_4,"mmm")#<br />
                  #DateFormat(pay_period_day_4,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_5,"ddd")#<br />
                  #DateFormat(pay_period_day_5,"mmm")#<br />
                  #DateFormat(pay_period_day_5,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_6,"ddd")#<br />
                  #DateFormat(pay_period_day_6,"mmm")#<br />
                  #DateFormat(pay_period_day_6,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_7,"ddd")#<br />
                  #DateFormat(pay_period_day_7,"mmm")#<br />
                  #DateFormat(pay_period_day_7,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_8,"ddd")#<br />
                  #DateFormat(pay_period_day_8,"mmm")#<br />
                  #DateFormat(pay_period_day_8,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_9,"ddd")#<br />
                  #DateFormat(pay_period_day_9,"mmm")#<br />
                  #DateFormat(pay_period_day_9,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_10,"ddd")#<br />
                  #DateFormat(pay_period_day_10,"mmm")#<br />
                  #DateFormat(pay_period_day_10,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_11,"ddd")#<br />
                  #DateFormat(pay_period_day_11,"mmm")#<br />
                  #DateFormat(pay_period_day_11,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_12,"ddd")#<br />
                  #DateFormat(pay_period_day_12,"mmm")#<br />
                  #DateFormat(pay_period_day_12,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_13,"ddd")#<br />
                  #DateFormat(pay_period_day_13,"mmm")#<br />
                  #DateFormat(pay_period_day_13,"dd")# </strong></td>
                <td align="center"><strong>#DateFormat(pay_period_day_14,"ddd")#<br />
                  #DateFormat(pay_period_day_14,"mmm")#<br />
                  #DateFormat(pay_period_day_14,"dd")# </strong></td>
              </tr>
            </cfoutput> <cfoutput>
              <tr>
                <td><strong>Time In</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_1#" align="right" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in1_#pay_period_day_14#" /></td>
              </tr>
              <tr>
                <td><strong>Time Out</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_1#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out1_#pay_period_day_14#" /></td>
              </tr>
              <tr>
                <td><strong>Time In</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_1#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in2_#pay_period_day_14#" /></td>
              </tr>
              <tr>
                <td><strong>Time Out</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_1#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out2_#pay_period_day_14#" /></td>
              </tr>
              <tr>
                <td><strong>Time In</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_1#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="in3_#pay_period_day_14#" /></td>
              </tr>
              <tr>
                <td><strong>Time Out</strong></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_1#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_2#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_3#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_4#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_5#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_6#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_7#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_8#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_9#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_10#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_11#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_12#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_13#" /></td>
                <td align="center"><input type="text" size="5" maxlength="5" name="out3_#pay_period_day_14#" /></td>
              </tr>
            </cfoutput>
            <tr>
              <td><strong>Total Hours</strong></td>
              <td align="center">&nbsp;</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">8.00</td>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Supervisor<br />
                Adjustment</strong></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield" id="textfield" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield2" id="textfield2" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield3" id="textfield3" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield4" id="textfield4" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield5" id="textfield5" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield6" id="textfield6" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield7" id="textfield7" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield8" id="textfield8" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield9" id="textfield9" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield10" id="textfield10" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield11" id="textfield11" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield12" id="textfield12" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield13" id="textfield13" /></td>
              <td align="center"><input type="text" size="5" maxlength="5" name="textfield14" id="textfield14" /></td>
            </tr>
            <tr>
              <td><strong>Net Hours</strong></td>
              <td align="center">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Approved</strong></td>
              <td align="center">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table></td>
      </tr>
    </table>
    <div class="clock">
      <input type="submit" name="save"  value="Save Changes" />
    </div>
    <!---   <input  type="submit" value="Time In" name="time_in"   /> --->
    </p>
  </form>
  <br />
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="includes/footer.cfm">
</body>
</html>
