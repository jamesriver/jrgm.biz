  <cfquery name="app_payroll_periods" datasource="jrgm">
 SELECT  *
 FROM app_pay_periods WHERE pay_period_week = #url.pay_period_week#
 </cfquery>  
 
 <CFSET pay_period_start = #app_payroll_periods.pay_period_start#>
 <CFSET pay_period_end = #app_payroll_periods.pay_period_end#>
 <CFSET pay_period_end_week =  dateadd("d",6,app_payroll_periods.pay_period_start)>
 <CFSET pay_period_end_week_plusone =  dateadd("d",7,app_payroll_periods.pay_period_start)>
 <cfset end_date_plus1 = pay_period_end_week_plusone>
 
 <CFSET pay_period_end_week_L  =  pay_period_number-1>
 
 
 <CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset Now_Time = Now()>
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>

 <cfquery name="get_employees_with_time" datasource="jrgm"  >
		SELECT DISTINCT "Employee_ID", APP_employees.last_name, APP_employees.first_name FROM 
		app_employee_payroll_clock  
		INNER JOIN APP_employees
		ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
		WHERE branch = '#SESSION.branch#'  AND (app_employee_payroll_clock.Time_In > '#DateFormat(ds_date, "yyyy-mm-dd")# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)   <!--- AND employee_id =2714  --->
		ORDER by APP_employees.last_name
 	</cfquery>
<CFSET employeelist ="">
<cfloop query="get_employees_with_time">
  <cfset employeelist = ListAppend(employeelist,Employee_ID)>
</cfloop>

 
<cfparam name="employee_total" default="0">
 <cfif IsDefined("form.SUBMIT") AND IsDefined("form.employee_ID") > 
 <cfquery name="update_time_null" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = NULL, approved_by = NULL WHERE   Employee_ID IN (#employeelist#)  AND (app_employee_payroll_clock.Time_In > '#DateFormat(ds_date, "yyyy-mm-dd")# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)
 </cfquery>
 <CFSET mylist = #Form.EMPLOYEE_ID#>
<cfloop  list = "#mylist#"   index = "i" >
 
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = 1, approved_by = #SESSION.userid#  WHERE   Employee_ID = #i# AND (app_employee_payroll_clock.Time_In > '#DateFormat(ds_date, "yyyy-mm-dd")# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)
 </cfquery></cfloop>
 <CFSET flag = 'uncheck'>
   <CFSET message = 'These pay periods have been approved'>
 </cfif> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<LINK rel="stylesheet" type"text/css" href="css/print.css" media="print">
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="JavaScript"></script>
<!--- <script type="text/javascript" language="javascript">
		$( function() {
			$( '.checkAll' ).live( 'change', function() {
				$( '.cb-element' ).attr( 'checked', $( this ).is( ':checked' ) ? 'checked' : '' );
				$( this ).next().text( $( this ).is( ':checked' ) ? 'Uncheck All' : 'Check All' );
			});
			$( '.invertSelection' ).live( 'click', function() {
				$( '.cb-element' ).each( function() {
					$( this ).attr( 'checked', $( this ).is( ':checked' ) ? '' : 'checked' );
				}).trigger( 'change' );

			});
			$( '.cb-element' ).live( 'change', function() {
				$( '.cb-element' ).length == $( '.cb-element:checked' ).length ? $( '.checkAll' ).attr( 'checked', 'checked' ).next().text( 'Uncheck All' ) : $( '.checkAll' ).attr( 'checked', '' ).next().text( 'Check All' );

			});
		});
	</script> --->
    
      <style>

	table.sortable tbody .yellowalt {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #FFFFE8;
	border: 1px solid #c0c0c0;
	border-top: none;
	}
	
	table.sortable tbody .yellowalt:hover {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #cde3fc;
	border: 1px solid #c0c0c0;
	border-top: none;
	}
	
	table.sortable tbody .yellowaltrt {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #FFFFE8;
	border: 1px solid #c0c0c0;
	border-top: none;
	border-right: none;
	}
	
	table.sortable tbody .yellowaltrt:hover {
	font: normal .85em Arial, Helvetica, sans-serif;
	background-color: #cde3fc;
	border: 1px solid #c0c0c0;
	border-top: none;
	border-right: none;
	}
	
	.datesm {
		font: bold 12px Arial, Helvetica, sans-serif;
	}


</style>

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
     <table width="100%"  border="0" cellpadding="2" cellspacing="0">
 <cfoutput query="app_payroll_periods"> <tr class="job_data">
    <td><strong>Payroll Period Week ###app_payroll_periods.pay_period_week#&nbsp; #DateFormat("#pay_period_start#", "mm/dd/yyyy")#-
     #DateFormat("#pay_period_end#", "mm/dd/yyyy")#</strong></td>
     <td> <cfif IsDefined("flag") AND IsDefined("form.SUBMIT") AND IsDefined("form.employee_ID") > 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="details_title"><em>These pay periods have been approved</em></td>
  </tr>
</table>

 </cfif></td>
    </tr>
  </cfoutput>
  </table>
  
    <br />
    
<!---  <cfif IsDefined("flag") AND IsDefined("form.SUBMIT") AND IsDefined("form.employee_ID") > 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>These pay periods have been approved</td>
  </tr>
</table>

 </cfif> --->

      <form action="payroll_view_employee_detail_1week.cfm?PAY_PERIOD_WEEK=<cfoutput>#url.pay_period_week#</cfoutput>" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sortable" >
         <thead> 
          <tr>
            <th align="left">Name</td>
            <th>Day 1</th>
            <th>Day 2</th>
            <th>Day 3</th>
            <th>Day 4</th>
            <th>Day 5</th>
            <th>Day 6</th>
            <th>Day 7</th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
          </tr>
          </thead>
          
           <tbody> 
          <cfoutput>
            <tr>
              <td align="left">&nbsp;</td>
              <td align="center"><span class="datesm">#DateFormat("#pay_period_start#", "ddd mm/dd/yyyy")#</span></td>
              <CFSET current_date = #pay_period_start# +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <CFSET current_date = '#current_date#' +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <CFSET current_date = '#current_date#' +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <CFSET current_date = '#current_date#' +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <CFSET current_date = '#current_date#' +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <CFSET current_date = '#current_date#' +1>
              <td align="center"><span class="datesm">#DateFormat("#current_date#", "ddd mm/dd/yy")#</span></td>
              <td align="center" class="yellowalt"><span class="datesm">Total</span></td>
              <td align="center"><span class="datesm">Approve</span></td>
            </tr>
          </cfoutput>
<cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
SELECT Employee_ID,  time_worked, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID IN (#employeelist#) AND app_employee_payroll_clock.Time_In > '#DateFormat(ds_date, "yyyy-mm-dd")# 00:00:00.000' AND  app_employee_payroll_clock.Time_In < #end_date_plus1#
 AND in_out_status =2
  </cfquery> 
          <cfparam name="current_date" default="1">
          <cfloop query="get_employees_with_time" >
             <cfoutput><tr>
                <td nowrap="nowrap"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#&pay_period_number=<cfoutput>#pay_period_end_week_L#</cfoutput>">#get_employees_with_time.first_name# #get_employees_with_time.last_name# </a></td>
              </cfoutput>
             
              <CFSET employee_total = 0>
              <cfloop from="#pay_period_start#" to="#pay_period_end_week#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
 <cfquery name="get_employee_time_by_day" dbtype="query">
SELECT  Employee_ID , SUM(time_worked) As sumdailytime, in_out_status,ds_date 
 FROM get_all_employee_time_for_period
 WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND ds_date = '#DateFormat(i, "mm/dd/yyyy")#'
  AND in_out_status =2
 GROUP by Employee_ID, ds_date, in_out_status
 </cfquery>
  
                 <cfif  get_employee_time_by_day.recordcount EQ 0>
                  <td align="center">-</td>
                  <cfelse>
                  <cfoutput query="get_employee_time_by_day" >
                    <cfset hours = int(sumdailytime\60)>
                    <cfset minutes = int(sumdailytime mod 60)>
                    <cfset employee_total = sumdailytime +employee_total>
                    <cfif (get_employee_time_by_day.ds_date EQ i) >
                      <td align="center">#hours#:#NumberFormat(minutes,"09")# </td>
                    </cfif>
                  </cfoutput>
                </cfif>
              </cfloop>
              <cfoutput>
                <cfset hourst = int(employee_total\60)>
                <cfset minutest = int(employee_total mod 60)>
                <td align="center"  class="yellowalt">#hourst#:#NumberFormat(minutest,"09")# </td>
              </cfoutput>
               <cfquery name="is_already_approved" datasource="jrgm">
       SELECT  *
       FROM app_employee_payroll_clock
       WHERE Employee_ID  =#get_employees_with_time.Employee_ID# AND (app_employee_payroll_clock.Time_In > '#DateFormat(ds_date, "yyyy-mm-dd")# 00:00:00.000' AND app_employee_payroll_clock.Time_Out < #pay_period_end_week_plusone#)
       AND payroll_approved IS NULL
         </cfquery> 
         <td align="center"     <cfif is_already_approved.recordcount  GT 0> bgcolor="##FFFFE8" </cfif>>
                 <cfif is_already_approved.recordcount  EQ 0>
                  <cfoutput>
                    <input type="checkbox"    name="Employee_ID" value="#Employee_ID#" checked="checked" class="cb-element" />
                  </cfoutput>
                  <cfelse>
                  <cfoutput>
                    <input type="checkbox"    name="Employee_ID" value="#Employee_ID#" class="cb-element" />
                  </cfoutput>
                </cfif></td>
           
            </tr>
          </cfloop>
          </tbody>
        </table>
        <div class="spacer20"></div>
            <div align="right"><input  name="Submit" type="submit" class="formsb" value="Submit" /></div>
          
      </form>
      <p>&nbsp;</p>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
  