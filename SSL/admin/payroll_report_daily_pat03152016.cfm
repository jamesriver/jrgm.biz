 
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 
<cfset Now_Time = Now()>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfoutput>#todayDate#</cfoutput>


<!------------------- Get in progress time ---------------------->
<cfquery name="calculate_time" datasource="jrgm">
    SELECT ID,DATEDIFF(mi,time_in,#Now_Time#) AS 'Duration'  
    FROM app_employee_payroll_clock 
    WHERE in_out_status = 1  
    </cfquery>
<cfif calculate_time.recordcount GT 0>
  <cfoutput query="calculate_time">
    <cfquery name="update_time" datasource="jrgm">
    UPDATE App_Employee_Payroll_Clock SET time_worked_current = #calculate_time.Duration#  WHERE ID =#calculate_time.ID#
    </cfquery>
  </cfoutput>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
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

table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
	}
	
	table.sortable tbody td:a {
	font:   1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	}
	
	table.sortable tbody td:a:hover {
	font:   1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	border-bottom: 1px solid #c0c0c0;
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
 
 
.eqbutton1 {	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
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
 </style>
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<!--<div id="outerfull">
-->
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm">
   <!--centre content goes here -->
  <div class="centrecontent_inner"> 
     
     <cfparam name="Form.DateRequested" default="#DateFormat(Now(), "mm/dd/yyyy")#">
    <!---  <CFSET DateRequested = #DateFormat(Now(), "mm/dd/yyyy")#> --->
       <form action="payroll_report_daily.cfm" method="post">
   <table width="100%" border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor="#07482f"  bordercolorlight="White"> 
   <cfquery name="get_daily_sheets_dates" datasource="jrgm"   >
SELECT  DISTINCT ds_date FROM app_daily_sheets   ORDER by ds_date DESC 
 </cfquery>

  <tr class="arialfont">
    <td align="left" bgcolor="#F8FAF9">Date :
      <select name="DateRequested"   tabindex="5">
 
      
      <cfoutput> <cfif IsDefined("form.DATEREQUESTED")> <option value="#DateFormat(form.DATEREQUESTED, "mm/dd/yyyy")#"  >#DateFormat(form.DATEREQUESTED, "mm/dd/yyyy")#</option></cfif></cfoutput>
       <cfoutput query="get_daily_sheets_dates">  
       
       <option value="#ds_date#"  >#DateFormat(ds_date, "mm/dd/yyyy")#</option></cfoutput> 
         </select>
       &nbsp; &nbsp;&nbsp; &nbsp;  
      <input type="submit"  class="eqbutton1" value="Get Employees" /></td>
    </tr>
   </table>
</form>     <br />
<br />
<div class="header">Todays Employee List </div>

  <cfif IsDefined("form.DATEREQUESTED")>
  <CFSET DateRequested = (#form.DATEREQUESTED#)> 
  </cfif>
  <cfquery name="get_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT employee_ID FROM app_employee_payroll_clock   WHERE ds_date = '#form.DateRequested#'
 </cfquery>


<CFSET myliste ="">
<cfloop query="get_daily_sheets">
  <cfset myListe = ListAppend(myliste,Employee_ID)>
</cfloop>

 
 
   <cfquery name="get_number_daily_sheets" datasource="jrgm"   >
SELECT  DISTINCT ID FROM app_daily_sheets   WHERE ds_date = '#DateRequested#'
 </cfquery>
 
 
   <strong><cfoutput>  <span class="arialfont">#get_daily_sheets.recordcount# </span></cfoutput><span class="arialfont"> employees working on <cfoutput>  #get_number_daily_sheets.recordcount#</cfoutput> crews on <cfoutput>  #DateFormat(form.DATEREQUESTED, "mm/dd/yyyy")#</cfoutput> as of <cfoutput>#TimeFormat(Now_Time, "hh:mm tt")#</cfoutput></span></span></strong><br />
     <br />
<!---   <cfoutput><span class="arialfont">#get_daily_sheets.recordcount#</span></cfoutput><span class="arialfont"> Employees working <cfoutput>  #DateFormat(form.DATEREQUESTED, "mm/dd/yyyy")#</cfoutput></span><br /> --->
  
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="sortable" >
            <tr>
              <td class="dstable_header">Name</td>
               <td align="left" class="dstable_header">Branch</td>
               <td align="center" class="dstable_header">DSID</td>
              
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Start</td>
              <td align="center" class="dstable_header">End</td>
              <td align="center" class="dstable_header">Total  (H:M)</td>
            </tr>
            <cfquery name="get_employees_for_today" datasource="jrgm">
			SELECT DISTINCT [Employee ID] As employee_id,[Name FirstLast] AS employee_name, position,branch  FROM APP_employees
			WHERE [Employee ID] IN 
			(#myListe# ) 
 			 ORDER by [Employee ID] ASC
			</cfquery>
            
            
             <cfquery name="get_all_employee_time_for_period" datasource="jrgm"      >
	SELECT  in_out_status,time_worked_current,time_worked ,ds_date,ds_id,Employee_ID,ID,time_In, time_Out FROM  app_employee_payroll_clock 
 WHERE Employee_ID  IN (#myListe#)
 				AND ds_date ='#form.DATEREQUESTED#' <!---  AND ds_id =#get_employee_dsid.ds_id# --->
  </cfquery> 
            <!--- <cfdump var="#get_employees_for_today#">
 --->
            <cfoutput query="get_employees_for_today">
              <tr>
                <td class="dstable">#employee_name# -#Employee_ID#</td> 
                   <td align="left"  class="dstable">#get_employees_for_today.branch#</td>
                   <cfquery name="get_employee_dsid" datasource="jrgm"  >
 					SELECT  ds_id FROM  app_employee_payroll_clock 
					WHERE Employee_ID =#get_employees_for_today.Employee_ID# 
					 AND ds_date ='#form.DATEREQUESTED#'
					ORDER by ID ASC
                </cfquery>
                
                <cfif get_employee_dsid.recordcount EQ 1>
          <td align="center"  class="dstable"><a href="daily_sheet.cfm?dsid=#get_employee_dsid.ds_id#">#get_employee_dsid.ds_id#</a></td>
                <cfelse>
 <td align="center"  class="dstable"  bgcolor="##FFFF00"><a href="daily_sheet.cfm?dsid=#get_employee_dsid.ds_id#">		#get_employee_dsid.ds_id#</a></td>
                </cfif>
             
                <cfquery name="get_employee_time_am" dbtype="query" maxrows="1">
				SELECT  ID,time_In,   time_Out FROM  get_all_employee_time_for_period 
				WHERE Employee_ID =#get_employees_for_today.Employee_ID# 
 				AND ds_date ='#form.DATEREQUESTED#'  AND ds_id =#get_employee_dsid.ds_id#
				ORDER by ID ASC
                </cfquery>
                 <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_In, "hh:mm tt")#</td>
                 <cfif get_employee_time_am.time_Out IS "">
                  <td align="center"  class="dstable">-
                 </td>
                 <cfelse>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_am.time_Out, "hh:mm tt")#
                 </td>
                 </cfif>
                <cfquery name="get_employee_time_pm" dbtype="query" maxrows="1">
						SELECT time_In,  time_Out FROM  get_all_employee_time_for_period 
						WHERE Employee_ID =#get_employees_for_today.Employee_ID# 
						AND ID  <> #get_employee_time_am.ID#  
 						AND ds_date ='#form.DATEREQUESTED#'  AND ds_id =#get_employee_dsid.ds_id#
						ORDER by ID DESC
                </cfquery>
                
                      <cfif get_employee_time_pm.time_In IS "">
                  <td align="center"  class="dstable">-
                 </td>
                 <cfelse>
             <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_In, "hh:mm tt")#</td>
             </cfif>
			 <cfif get_employee_time_pm.time_Out IS "">
                  <td align="center"  class="dstable">-
                 </td>
                 <cfelse>
                <td align="center"  class="dstable">#TimeFormat(get_employee_time_pm.time_Out, "hh:mm tt")#
                </td>
                </cfif>
                <cfquery name="get_employee_minutes_for_day" dbtype="query" maxrows="1">
				SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_for_period WHERE Employee_ID =#get_employees_for_today.Employee_ID#  
			 AND ds_date ='#form.DATEREQUESTED#'  AND ds_id =#get_employee_dsid.ds_id#
                </cfquery>
                <!---  <cfdump var="#get_employee_minutes_for_day#"> --->
                <cfif #form.DATEREQUESTED# GT  yesterday>
              <cfquery name="get_employee_minutes_for_day_inprogress" dbtype="query" maxrows="1">
SELECT Sum(time_worked_current) AS  minutes_worked_day_inprogress FROM  get_all_employee_time_for_period WHERE Employee_ID =#get_employees_for_today.Employee_ID# AND in_out_status =1    AND ds_date ='#form.DATEREQUESTED#' AND ds_id =#get_employee_dsid.ds_id#
                </cfquery>
                <cfelse>
                <CFSET get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress =0>
                </cfif>
                
                <!---  <cfdump var="#get_employee_minutes_for_day_inprogress#"> --->
                <cfif get_employee_minutes_for_day.minutes_worked_day EQ "" AND get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress EQ "">
                  <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                <cfif get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress NEQ "">
                  <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                    <CFSET get_employee_minutes_for_day.minutes_worked_day =0>
                  </cfif>
                  <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day#+#get_employee_minutes_for_day_inprogress.minutes_worked_day_inprogress# >
                  <cfelse>
                  <cfset totalminutes= #get_employee_minutes_for_day.minutes_worked_day# >
                </cfif>
                <cfset hours = int(totalminutes\60)>
                <cfset minutes = int(totalminutes mod 60)>
                <td  class="dstable" align="center">#hours#:#NumberFormat(minutes,"09")#</td>
                <cfparam  name="totalcompanyminutes" default="0">
                <CFSET totalcompanyminutes = totalcompanyminutes+totalminutes>
              </tr>    </cfoutput>
                  
                      </table>
        <cfoutput> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="sortable" >
                <tr>
                <td colspan="6" align="right" class="dstable"><strong>Total Employee Time</strong></td>
                <cfset hourstc = int(totalcompanyminutes\60)>
                <cfset minutestc = int(totalcompanyminutes mod 60)>
                <td  class="dstable" align="center"><strong>#hourstc#:#NumberFormat(minutestc,"09")#</strong></td>
              </tr>  
          
          </table>  </cfoutput>
          
        <!---   <cfoutput>#todayDate#</cfoutput> --->
 </div></div></div>
<br />
<br />

<div id="clearfooter"></div>
<!-- to clear footer -->
<!--</div>-->
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
