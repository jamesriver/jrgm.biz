<cfparam name="form.show"  default="active">
<cfparam name="form.active"  default="1">
<cfparam name="session.branch_code" default="All">
<cfparam name="session.yearsearch" default="All">
<cfparam name="session.activeinactive" default="1">
<CFSET session.Crew_LeaderID = 0>
<cfif IsDefined("form.submitted")>
  <CFSET session.branch_code = #form.branch_code#>
  <CFSET session.Crew_LeaderID = form.Crew_LeaderID>
</cfif>
<cfif IsDefined("form.inspection_date") >
  <CFSET todays_date = #form.inspection_date#>
</cfif>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, first_name ,  last_name,branch     
FROM app_employees 
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

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />

<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->

<body>
<div id="outerfull">
  <div id="centrecontent">
 
<cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
 
<!-- BEGIN PAGE CONTAINER -->
 <div class="centrecontent_inner">
      <!-- BEGIN PAGE TITLE -->
      
      <div class="header">
        Morning Inspection Form List 
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      
      <!-- END PAGE TOOLBAR --> 
   
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid"> 
      
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-12">
          <form action="morning_inspection_List.cfm" method="post">
            <table class="table large" >
              <tbody>
                <tr>
                  <td  nowrap="nowrap"><strong>By Date:<br>
                    <br>
                    <input type="text" name="inspection_date"  class="form-control input-inline input-medium" placeholder="Search by Date" size="2" />
                  </strong>
                  <td><strong>By Branch:<br>
                    <br>
                    <select name="branch_code"  class="bs-select form-control input-medium" onchange='this.form.submit()'>
                      <option value="All"   <cfif session.branch_code EQ 'All'> selected="selected"</cfif>>All</option>
                      <option value="30" <cfif session.branch_code EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                      <option value="80" <cfif session.branch_code EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                      <option value="12" <cfif session.branch_code EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                      <option value="90" <cfif session.branch_code EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                      <option value="20" <cfif session.branch_code EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                      <option value="10" <cfif session.branch_code EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                      <option value="70" <cfif session.branch_code EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
                    </select>
                    &nbsp; &nbsp;&nbsp; &nbsp;</strong></td>
                  <td></td>
                  <td><strong>By Crew Leader:
                      <br>
                      <br>
                      <cfquery name="get_crew_leaders" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name,Branch
FROM APP_employees
INNER JOIN app_Inspection_Master
ON APP_employees.[Employee ID]=app_Inspection_Master.Crew_LeaderID   
 
   ORDER by  Last_name ASC,first_name ASC
                      </cfquery>
                    <select name="Crew_LeaderID"  class="bs-select form-control input-medium"  onchange='this.form.submit()'>
                      <option value="All" <cfif session.Crew_LeaderID EQ 'All'> selected="selected"</cfif>>All</option>
                      <cfoutput query="get_crew_leaders">
                        <option value="#employee_id#" <cfif session.Crew_LeaderID EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
                      </cfoutput>
                    </select>
                  </strong></td>
                </tr>
                <tr>
                  <td colspan="4"><input type="submit" value="Search Morning Inspection Forms"  ></td>
                </tr>
              </tbody>
            </table>
            <input type="hidden"  name="submitted" value="yes"/>
          </form>
          <!-- BEGIN ACCORDION PORTLET-->
          <div class="portlet">
            <div class="portlet-body">
              <cfquery name="get_morning_inspections" datasource="jrgm"  maxrows="500">
SELECT      Inspection_ID, Crew_LeaderID, Inspection_Date, Inspection_Type, Problem, Created_By, Created_On, Current_Mileage, vehicleSatisfactory, 
                      InspectionMode,branch_code
FROM     app_Inspection_Master  WHERE Inspection_Type ='Evening'  <!---<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >AND Inspection_ID =#form.criteria#</cfif>--->  <cfif IsDefined("form.Crew_LeaderID") AND form.Crew_LeaderID NEQ "All" > AND Crew_LeaderID ='#form.Crew_LeaderID#'</cfif> <cfif IsDefined("form.branch_code") AND form.branch_code NEQ "All" > AND branch_code ='#form.branch_code#'</cfif>  <cfif IsDefined("form.inspection_date")  AND form.inspection_date NEQ "" > AND Inspection_Date ='#form.inspection_date#'</cfif>   

order by   Inspection_ID DESC,  Inspection_Date DESC
</cfquery>
             <br>
 
              <table class="table table-striped table-hover" id="sample_5">
                <thead>
                  <tr>
                    <th align="left">ID</th>
                    <th align="left">Date</th>
                    <th align="left">Branch</th>
                    <th align="left">Crew Leader</th>
                    <th align="left">View</th>
                  </tr>
                </thead>
                <tbody>
                  <cfoutput  query="get_morning_inspections"  >
                    <tr>
                      <td><a href="morning_inspection_Form.cfm?Inspection_ID=#Inspection_ID#" target="_blank">#Inspection_ID#</a></td>
                      <td nowrap="nowrap">#dateformat(Inspection_Date,"mm/dd/yy")#</td>
                      <cfquery name="get_branch_employees_cachec"   dbtype="query">
SELECT   fullname,branch  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_LeaderID# 
 </cfquery>
                      <cfif branch_code EQ '10' >
                        <CFSET branchname ='Richmond'>
                        <cfelseif branch_code EQ '20' >
                        <CFSET branchname ='Portsmouth'>
                        <cfelseif branch_code EQ '30'  >
                        <CFSET branchname ='Charlottesville'>
                        <cfelseif branch_code EQ '70'  >
                        <CFSET branchname ='Williamsburg'>
                        <cfelseif branch_code EQ '80'  >
                        <CFSET branchname ='Chesterfield'>
                        <cfelseif branch_code EQ '90' >
                        <CFSET branchname ='Newport News'>
                        <cfelseif  branch_code EQ '12'>
                        <CFSET branchname ='Corporate'>
                        <cfelseif  branch_code EQ '00'>
                        <CFSET branchname ='Unknown'>
                        <cfelseif branch_code EQ '' >
                        <CFSET branchname ='Unknown'>
                        <cfelse>
                        <CFSET branchname ='Unknown'>
                      </cfif>
                      <td align="left">#branchname#</td>
                      <td align="left">#get_branch_employees_cachec.fullname#</td>
                      <td><a href="morning_inspection_Form.cfm?Inspection_ID=#Inspection_ID#" target="_blank" >View</a></td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
          </div>
  </div>
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
