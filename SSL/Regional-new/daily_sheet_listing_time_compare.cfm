
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>


<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>


 <cfquery name="get_all_employee_info" datasource="jrgm">
SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
 </cfquery>
 
 

<cfquery name="get_daily_sheets" datasource="jrgm"    maxrows="500">
 SELECT  * FROM app_daily_sheets 
WHERE <!---ds_date < '#todaydate_DS#'   AND---> branch_code IN (#branchcodelist#) 
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
<cfif IsDefined("form.submitted2")  AND CREW_LEADER_ID NEQ 'All'   >AND    Crew_Leader_ID = #form.Crew_Leader_ID#</cfif>
<cfif IsDefined("form.submitted2")  AND CREW_LEADER_ID EQ 'All'   >AND    0=0</cfif>
 ORDER by ds_date DESC
 </cfquery>  

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet">
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->

<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION --> 

<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      
      <div class="page-title">
       <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>  

        <h1>Daily Sheets for <cfoutput>#regionname#</cfoutput> Region</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="index.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active">Daily Sheets</li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid">
    
     
    
    <!-- BEGIN PAGE CONTENT INNER -->
   <div class="row">
				<div class="col-md-12">
					<div class="portlet light ">
        <div class="portlet-body">
        <div class="spacerneg20"></div>
         <div class="row">
        <div class="col-md-12">
          <div class="row">
        
 
   
 <table class="table table-striped table-hover" id="sample_1">
    <thead>
       <tr>
      
        <th><div align="left">Date</div></th>
         <th><div align="left">ID</div></th>
            <th><div align="left">Branch</div></th>
         <th><div align="left">Supervisor</div></th>
        <th><div align="left">Crew Leader</div></th>
        <th><div align="left">View</div></th>
        <th><div align="right">Day<br />Time</div></th>
        <th><div align="right">SVC<br />
            Time</div></th>
        <th><div align="right">MIN<br />
            Diff</div></th>
        <th><div align="right">% Acct<br>For</div></th>
        <th><div align="center">Type</div></th>
         <th><div align="center">Edit</div></th>
      </tr>
    </thead>
    <tbody>
    
 <!--- <CFSET startrow = #url.start#>
 <CFSET endrow = startrow+500> --->
 <CFSET mylist ="0">
 <cfloop query="get_daily_sheets"  >
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>

<cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT ds_ID FROM app_gps WHERE   ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_time_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_employee_payroll_clock WHERE ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_service_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_job_services_actual_employee WHERE ds_ID IN (#mylist#) 
</cfquery>
       <cfoutput query="get_daily_sheets" >
      <cfquery name="get_info_S"  dbtype="query" cachedWithin="#createTimeSpan( 0, 0, 0, 0 )#">
SELECT  last_name AS employee_name,branch
FROM get_all_employee_info WHERE employee_ID =#get_daily_sheets.supervisor_id#
        </cfquery>
                    <cfquery name="get_info_CL" dbtype="query" cachedWithin="#createTimeSpan( 0, 0, 0, 0 )#">
SELECT   last_name AS employee_name,branch
FROM   get_all_employee_info WHERE employee_ID =#get_daily_sheets.Crew_Leader_ID#
    </cfquery>
        <tr>
         
          <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">#get_daily_sheets.ID#</a></td>
            <td align="left">#get_info_S.branch#</td>
           <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">View</a></td>
           <cfquery name="get_employee_minutes_for_day"   dbtype="query" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                 <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                
                 <cfif get_employee_minutes_for_day.recordcount EQ 0>
                <CFSET minutes_worked_day = 0>
                <cfelse>
                <CFSET minutes_worked_day = #get_employee_minutes_for_day.minutes_worked_day#>
                </cfif>
                
                
          <td align="right">#minutes_worked_day#</td>
            <cfquery name="get_employee_service_minutes_for_day"  dbtype="query" maxrows="1">
SELECT Sum(total_time) AS  service_minutes_worked_day FROM  get_all_employee_service_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                <cfif get_employee_service_minutes_for_day.recordcount EQ 0>
                <CFSET service_minutes_worked_day = 0>
                <cfelse>
                <CFSET service_minutes_worked_day = #get_employee_service_minutes_for_day.service_minutes_worked_day#>
                </cfif>
          <td align="right">#service_minutes_worked_day#</td>
          <cfset diff =service_minutes_worked_day- minutes_worked_day>
          <td align="right">#diff#</td>
          <cfif service_minutes_worked_day EQ 0 OR  minutes_worked_day EQ 0>
          <CFSET diffper = 0>
           <cfelse>
           <cfset diffper=100*get_employee_service_minutes_for_day.service_minutes_worked_day/get_employee_minutes_for_day.minutes_worked_day> </cfif>
        <cfif diffper GT 100  OR diffper LT 80>  
        <td align="right"  class="redarial">#NumberFormat(diffper,"09.9")#</td>
        <cfelse>
        <td align="right">#NumberFormat(diffper,"09.9")#</td>
        </cfif>
         <td align="center">
  <cfquery name="get_ds_edits" datasource="jrgm" maxrows="1" blockfactor="1">
SELECT   ds_id FROM app_employee_payroll_clock_backup WHERE ds_id =#get_daily_sheets.ID#
 </cfquery>  
  <cfquery name="nogps"   dbtype="query" maxrows="1" blockfactor="1">
SELECT     ds_ID
FROM        get_all_gps_info
WHERE     ds_id =  #get_daily_sheets.ID#
 </cfquery>
  <cfif get_ds_edits.recordcount GT 0  OR nogps.recordcount EQ 0 >
 Manual 
 <cfelse>
 APK
  </cfif>
 </td> 
      <cfif       ((ds_date LTE  yesterday) ) >
                <cfif get_daily_sheets.ds_approved EQ 1>
                  <td><div align="center"><a href="daily_sheet.cfm?dsid=#ID#" class="greenarial">Approved</a></div></td>
                  <cfelse>
                  <td><div align="center"><a href="daily_sheet.cfm?dsid=#ID#&email=yes">Edit</a></div></td>
                </cfif>
                <cfelse>
                <td><div align="center"> - </div></td>
              </cfif>
      </tr>
      </cfoutput>
    </tbody>
  </table>
  
  
            </div>
        </div> 
      </div>
    </div>
    <!-- END PAGE CONTENT INNER --> 
  </div>
</div>
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->

<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) --> 
<!-- BEGIN CORE PLUGINS --> 
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]--> 
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script> 
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script> 
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> 
<!-- END CORE PLUGINS --> 
<!-- BEGIN PAGE LEVEL PLUGINS --> 
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script> 
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script> 
<!-- END PAGE LEVEL PLUGINS --> 
<!-- BEGIN PAGE LEVEL SCRIPTS --> 
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script> 
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script> 
<script src="assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {   
    
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
});
</script>

</body>
<!-- END BODY -->
</html>