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
 
  <CFSET begin_date = '04/27/2014'>
  <CFSET end_date = '05/10/2014'>
 
 <cfparam name="employee_total" default="0">
 
 
 <!---  <cfif IsDefined("form.SUBMIT") AND IsDefined("form.employee_ID") >
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = NULL, approved_by = NULL WHERE   Employee_ID = #form.Employee_ID#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'
 </cfquery>
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = 1, approved_by = #SESSION.userid#  WHERE ds_id  IN (#form.ds_id#)  AND  Employee_ID = #form.Employee_ID#
 </cfquery>
 <CFSET flag = 'uncheck'>
 
  <CFSET message = 'These pay periods have been approved'>
 </cfif> --->
 
 
<!--- <cfparam name="message" default="">

 <cfif IsDefined("form.ds_id")><CFSET Session.mydsidlist = #form.ds_id#></cfif>
   

 
 <cfif IsDefined("form.empid")>
  <CFSET Employee_ID= form.empid>
  <cfelseif IsDefined("url.empid")>
  <CFSET Employee_ID= url.empid>
</cfif>

<cfif IsDefined("form.SUBMIT") AND IsDefined("form.ds_id") >
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = NULL, approved_by = NULL WHERE   Employee_ID = #form.Employee_ID#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'
 </cfquery>
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = 1, approved_by = #SESSION.userid#  WHERE ds_id  IN (#form.ds_id#)  AND  Employee_ID = #form.Employee_ID#
 </cfquery>
 <CFSET flag = 'uncheck'>
 
  <CFSET message = 'These pay periods have been approved'>
 </cfif>
 
<cfif IsDefined("form.SUBMIT") AND  NOT IsDefined("form.ds_id")>
 <CFSET form.ds_id =Session.mydsidlist>
  <cfquery name="update_time" datasource="jrgm">
 UPDATE App_Employee_Payroll_Clock SET payroll_approved = NULL, approved_by = NULL WHERE   Employee_ID = #form.Employee_ID#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'
 </cfquery>
 </cfif>

 <cfquery name="get_employees_name" datasource="jrgm">
SELECT  first_name ,  last_name,branch    FROM 
app_employees WHERE [Employee ID] = #empid#
 </cfquery> --->

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" language="javascript"></script>
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
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}

.arialfontbold{
	font: bold .80em Arial, Helvetica, sans-serif;
	background-color: #EFEFEF;
	text-align: center;
}
   .search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;	
}
.alertsh {
	
	margin-left: 40px;
	padding: 4px 10px;
	border: 1px solid #000000;
	font: bold .9em Arial, Helvetica, sans-serif;
	color: #ffffff;
	background-color: #999999;
	text-align: center;
}

.arialfontboldy{
	font: bold .90em Arial, Helvetica, sans-serif;
 	text-align: center;
}

</style>

<body>
<div id="outerfull">
  <div id="centrecontent">
   <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
     <!--centre content goes here -->
    <div class="centrecontent_inner">

<form action="payroll_view_employee_detail3.cfm" method="post">
<table width="100%" border="1" cellspacing="0" cellpadding="3">
        <tr class="alertsh">
          <td>Name</td>
          <td>Day 1</td>
          <td>Day 2</td>
          <td>Day 3</td>
         <td>Day 4</td>
         <td>Day 5</td>
           <td>Day 6</td>
            <td>Day 7</td>
           <td>Day 8</td>
           <td>Day 9</td>
           <td>Day 10</td>
          <td>Day 11</td>
           <td>Day 12</td>
        <td>Day 13</td>
           <td>Day 14</td>
            <td>&nbsp;</td>
             <td>&nbsp;</td>
        </tr>
  <!--- <cfquery name="app_payroll_periods" datasource="jrgm">
       SELECT  begin_date
       FROM app_payroll_periods
          </cfquery> --->
          <CFSET begin_date = '04/27/2014'>
          <CFSET end_date = '05/10/2014'>
      <cfoutput>
         <tr class="arialfontbold">
    <td>Name</td>
 <td>#DateFormat("#begin_date#", "ddd mm/dd/yyyy")#</td>
   <CFSET current_date = '#begin_date#' +1>
          <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
        <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
        <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
     <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
       <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
        <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
       <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
      <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
       <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
       <CFSET current_date = '#current_date#' +1>
        <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
       <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
      <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
    <CFSET current_date = '#current_date#' +1>
         <td align="center">#DateFormat("#current_date#", "ddd mm/dd/yy")#</td>
          <td align="center"  bgcolor="##FFFFE8"  width="75"  >Total</td>
         <td align="center">Approve</td>
        </tr>
         </cfoutput>
 <cfquery name="get_employees_with_time" datasource="jrgm"   maxrows="7" >
SELECT DISTINCT Employee_ID, APP_employees.last_name, APP_employees.first_name FROM 
app_employee_payroll_clock  
INNER JOIN APP_employees
ON app_employee_payroll_clock.Employee_ID=APP_employees.[Employee ID]  
WHERE supervisor = #SESSION.userid#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'
ORDER by APP_employees.last_name
 </cfquery>    
 <cfparam name="current_date" default="1">
 <cfloop query="get_employees_with_time" >
    <!---  <CFSET current_date = '04/28/2014'> --->
 <tr>
  <cfoutput><td nowrap="nowrap"><span class="arialfont"><a href="payroll_view_employee_detail2.cfm?empid=#get_employees_with_time.Employee_ID#" target="_blank">#get_employees_with_time.first_name# #get_employees_with_time.last_name# </a></span></td>
  </cfoutput>
  <CFSET current_date = '04/28/2014'>
  <CFSET employee_total = 0>
  
   <cfloop from="#begin_date#" to="#end_Date#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
   <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#get_employees_with_time.Employee_ID#  AND ds_date = '#DateFormat(i, "mm/dd/yyyy")#'
  AND in_out_status =2
 GROUP by Employee_ID, ds_date, in_out_status
 ORDER by ds_date DESC 
</cfquery>
        <cfif  get_employee_time_by_day.recordcount EQ 0>
         <td align="center"><span class="arialfont">-</span></td>
        <cfelse>
             <cfoutput query="get_employee_time_by_day" > 
 			<cfset hours = int(sumdailytime\60)>
            <cfset minutes = int(sumdailytime mod 60)> 
			<cfset employee_total = sumdailytime +employee_total>
            <cfif (get_employee_time_by_day.ds_date EQ i) >
             <td align="center"><span class="arialfont">#hours#:#NumberFormat(minutes,"09")#<!---  -#get_employee_time_by_day.ds_date# - #DateFormat(i, "mm/dd/yyyy")# --->
             </span></td>
 		   </cfif> 
		   </cfoutput></cfif>
            </cfloop>   
           
          <cfoutput> 
          
          <cfset hourst = int(employee_total\60)>
            <cfset minutest = int(employee_total mod 60)> 
          
           <td align="center"  bgcolor="##FFFFE8" class="arialfontboldy">#hourst#:#NumberFormat(minutest,"09")# </td></cfoutput>
         <td align="center">
          <cfquery name="is_already_approved" datasource="jrgm">
      SELECT  payroll_approved
       FROM app_employee_payroll_clock
     WHERE Employee_ID =#get_employees_with_time.Employee_ID# 
         </cfquery>
 			 <cfif is_already_approved.payroll_approved  EQ 1> 
          <cfoutput>   <input type="checkbox"    name="Employee_ID" value="#Employee_ID#" checked="checked" class="cb-element" ></cfoutput>
    <cfelse> <cfoutput><input type="checkbox"    name="Employee_ID" value="#Employee_ID#" class="cb-element" /></cfoutput></cfif>
          </td> 
           </tr>
     
        </cfloop>
        
        <tr><td colspan="17" height="50" align="center"><input type="submit"  name="Submit" value="Submit" /></td></tr>
      </table>
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
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script><script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>

<!---     <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td nowrap="nowrap" class="header">Payroll Detail<br />
<cfoutput query="get_employees_name">#get_employees_name.first_name# #get_employees_name.last_name#  since <cfoutput>#DateFormat("#payroll_start_date#", "mm/dd/yyyy")#</cfoutput><br />
 Branch:#get_employees_name.branch#  &nbsp;&nbsp;   Employee ID : #empid# </cfoutput></td>
          <td nowrap="nowrap" class="header" width="300">&nbsp;</td>
  <td nowrap="nowrap"  align="right"><a href="payroll_employee_list2.cfm" class="btn-info">Back to List</a></td>
        </tr>
      </table> 
      <table class="sortable" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
        <tr>
          <th align="left">Pay Period Totals</th>
          <th align="left">Hours</th>
         
        </tr>
        </thead>
        <tbody>
         <cfif   timenow GT today_7PM>
          <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'   AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         
         <cfelse>
        <cfquery name="get_employee_time_sum" datasource="jrgm" >
SELECT Employee_ID,SUM(time_worked) AS sumtime FROM 
app_employee_payroll_clock WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#' AND    ds_date < '#todaydate_DS#' AND in_out_status =2
GROUP by Employee_ID
         </cfquery>
         </cfif>
        <cfoutput query="get_employee_time_sum">
          <tr>
          <td>Regular</td>
            <cfset hourssum = int(sumtime\60)>
            <cfset minutessum = int(sumtime mod 60)>
            <td align="left">#hourssum#:#NumberFormat(minutessum,"09")#</td>
           </tr>
        </cfoutput>
        </tbody>
      </table>
      <br /> <cfif   timenow GT today_7PM>
       <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'  AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
      
      <cfelse>
 <cfquery name="get_employee_time_by_day" datasource="jrgm">
SELECT Employee_ID, SUM(time_worked) As sumdailytime, ds_id ,in_out_status,ds_date 
 FROM app_employee_payroll_clock
 WHERE Employee_ID =#empid#  AND app_employee_payroll_clock.Time_In > '#payroll_start_date#'  AND    ds_date < '#todaydate_DS#' AND in_out_status =2
 GROUP by Employee_ID, ds_date, ds_id ,in_out_status
 ORDER by ds_date DESC ,ds_id DESC
        </cfquery>
        </cfif>
 <form id="form1" name="form1" method="post" action="payroll_view_employee_detail2.cfm">
     <table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="800">
    <thead> 
         <tr>
         <th align="left">Day</th>
          <th align="left">Date</th> 
          <th align="left">DSID</th>
          <th align="left">Time<br />Worked</th>
          <th align="left">Time<br />Worked  </th>
          <th align="center" nowrap="nowrap"><cfif IsDefined("flag")>Uncheck<cfelse>Check</cfif> All   &nbsp;<input type="checkbox" class="checkAll" />
 <!---  <a onclick="javascript:checkAll('form1', true);" href="javascript:void();">Check all</a><br />
 <a onclick="javascript:checkAll('form1', false);" href="javascript:void();">Uncheck all</a> --->
  </th></tr>
        </thead>
        <tbody>
        <cfoutput query="get_employee_time_by_day">
          <tr>
           <td>#DateFormat(ds_date, "dddd")#</td>
            <td>#DateFormat(ds_date, "mm/dd/yyyy")#</td> 
            <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a> </td>
              <td>#sumdailytime#</td>
            <cfset hours = int(sumdailytime\60)>

            <cfset minutes = int(sumdailytime mod 60)>
            <td align="left">#hours#:#NumberFormat(minutes,"09")#</td>
      <cfquery name="is_already_approved" datasource="jrgm">
      SELECT  payroll_approved
       FROM app_employee_payroll_clock
     WHERE Employee_ID =#empid#  AND ds_id = #ds_id#
         </cfquery>
         <td align="center">
 			 <cfif is_already_approved.payroll_approved  EQ 1> <input type="checkbox"    name="ds_id" value="#ds_id#" checked="checked" class="cb-element" >
             <cfelse> <input type="checkbox"    name="ds_id" value="#ds_id#" class="cb-element" /></cfif>
          </td> 
          
          </tr>  
		  </cfoutput>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="center"><input type="submit"  name="Submit" value="Submit" /></td>
          </tr>
        </tbody>
      </table>
        <cfoutput> <input type="hidden" name="Employee_ID"   value="#Employee_ID#" />
        <input type="hidden" name="empid"   value="#Employee_ID#" />
       
        <!---    <input type="hidden" name="ds_id"   value="#ds_id#" /> --->
 		</cfoutput>
      </form>
      
      <table width="800" border="0" cellspacing="3" cellpadding="0">
  <tr>
    <td align="right" height="40"> <cfoutput> <span class="arialfont"><strong>#message#</strong></span></cfoutput> </td>
  </tr>
</table> --->