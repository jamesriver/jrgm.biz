<cfset today = #Now()#>
<cfparam name="session.pay_period_week_now" default="#pay_period_week#">
<cfparam name="form.pay_period_week" default="#pay_period_week#">
<cfset session.pay_period_week = session.pay_period_week_now -1>
<!--- <cfparam name="session.pay_period_week" default="#pay_period_week#"> --->
<cfif IsDefined("form.submit") AND  IsDefined("form.pay_period_week")>
  <CFSET pay_period_week= #form.pay_period_week#>
  <cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT   pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week# 
 </cfquery>
  <CFSET pay_period_week_start= #app_payroll_periods_L.pay_period_start#>
  <CFSET pay_period_week_end= #app_payroll_periods_L.pay_period_end#>
  <cfelse>
  <CFSET pay_period_week= #session.pay_period_week#>
  <cfquery name="app_payroll_periods_L" datasource="jrgm">
 SELECT   pay_period_start  as pay_period_start,  pay_period_end  AS pay_period_end
 FROM app_pay_periods WHERE pay_period_week = #pay_period_week#
 </cfquery>
</cfif>
<CFSET pay_period_end_week_plusone =  dateadd("d",1,app_payroll_periods_L.pay_period_end)>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
</style>
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
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
    <cfquery name="get_app_payroll_periods" datasource="jrgm">
 SELECT  * FROM app_pay_periods WHERE pay_period_end < #today#
 ORDER by ID DESC
 </cfquery>
    <form   action="payroll_unapproved.cfm" method="post"  name="form1" id="form1">
      <table width="100%" border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor= "#6a9182"  bordercolorlight="White">
        <tr>
          <td class="search-td" bgcolor="#F2F7F5" >Select Pay Period Week : 
            &nbsp;
            <select name="pay_period_week" >
              <cfoutput query="get_app_payroll_periods">
                <option value="#pay_period_week#" <cfif get_app_payroll_periods.pay_period_week EQ #form.pay_period_week#> selected="selected"</cfif>>#DateFormat(pay_period_start, "mm/dd/yyyy")# - #DateFormat(pay_period_end, "mm/dd/yyyy")#</option>
              </cfoutput>
            </select>
            <input type="submit" name="submit"  value="Submit" />
          </td>
        </tr>
      </table>
    </form>
    <br />
    <div class="header"> Unaproved Payroll - 
      For Period <cfoutput>#DateFormat(app_payroll_periods_L.pay_period_start, "mm/dd/yyyy")# -#DateFormat(app_payroll_periods_L.pay_period_end, "mm/dd/yyyy")#</cfoutput></div>
    <br />
    <cfloop index = "branch" list = "Charlottesville,Chesterfield,Newport News,Portsmouth,Richmond">
      <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT  Employee_ID , APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#branch#'  AND
        (app_employee_payroll_clock.Time_In > '#DateFormat(app_payroll_periods_L.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')# 00:00:00.000')
		ORDER by APP_employees.last_name
 	</cfquery>
      <CFSET employeelist ="">
      <cfloop query="get_employees_with_time">
        <cfset employeelist = ListAppend(employeelist,Employee_ID)>
      </cfloop>
      <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date,ds_id 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > '#DateFormat(app_payroll_periods_L.pay_period_start, 'yyyy-mm-dd')# 00:00:00.000' AND  app_employee_payroll_clock.Time_Out < '#DateFormat(pay_period_end_week_plusone, 'yyyy-mm-dd')# 00:00:00.000'
 AND in_out_status =2 AND payroll_approved IS NULL
  </cfquery>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><article class="accordion-a">
              <section>
                <header> <span class="subheader">&nbsp;<cfoutput>#branch# - #get_all_employee_time_for_period.recordcount#</cfoutput></span> </header>
                <div class="content">
                  <table class="sortable"  border="0" cellspacing="0" cellpadding="1"  width="600" >
                    <thead>
                      <tr>
                        <th align="left">Branch</th>
                        <th align="center">Employee<br />
                          ID</th>
                        <th align="left">DS Date</th>
                        <th align="center">DSID</th>
                        <th align="right">Time <br />
                          Worked</th>
                      </tr>
                    </thead>
                    <cfoutput query="get_all_employee_time_for_period">
                      <tr>
                        <td>#BRANCH#</td>
                        <td align="center">#Employee_ID#</td>
                        <td align="left">#DateFormat(ds_date, "mm/dd/yyyy")#</td>
                        <td align="center"><a href="../daily_sheet.cfm?DSID=#ds_id#">#ds_id#</a></td>
                        <td align="right">#time_worked#</td>
                      </tr>
                    </cfoutput>
                  </table>
                </div>
              </section>
          </article></td>
        </tr>
      </table>
      <br />
    </cfloop>
  </div>
  <!-- to clear footer -->
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
