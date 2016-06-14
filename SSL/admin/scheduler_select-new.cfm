<cflocation url="/SSL/scheduler/crew_assignments.cfm">
<cfabort>

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />
<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<!--- <cfinclude template="includes/subbar.cfm"> --->
<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="57"><a href="default.cfm"><img src="images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a></td>
      <td class="subbartxt">Welcome: Admin</td>
      <td width="42"><!--<a href="supervisors/setting.cfm" class="first"><img src="images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
      <td width="20"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
    </tr>
  </table>
</div>

<cfinclude template="includes/topbar.cfm">
<!--centre content goes here -->
<div class="centrecontent_inner">
  <cfset somedate = todayDate>
  <cfset yesterday = dateadd("d",-1,somedate)>
  <cfset tomorrow = dateadd("d",1,somedate)>
  <div class="subheader"></div>
  <table width="100%" border="0" cellspacing="5" cellpadding="0">
    <tr>
      <td valign="top"><div class="dailysheet_header">Admin</div>
        <cfquery name="get_admin" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role IN (95, 96,99) AND employee_active =1
Order by lastname
</cfquery>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_admin">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_admin.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
       <br />
       
       <div class="dailysheet_header">Business Development Group</div>
       <cfquery name="get_bdg" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 94 AND employee_active =1
Order by lastname
</cfquery>
       <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_bdg">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_bdg.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table><br />

       <div class="dailysheet_header">Regional Manager</div>
       <cfquery name="get_regional_managers" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 10 AND employee_active =1
Order by lastname
</cfquery>
       <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_regional_managers">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_regional_managers.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
       <br />

<div class="dailysheet_header">Branch Manager</div>
        <cfquery name="get_branch_managers" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 9 AND active_record =1
ORDER by  last_name
</cfquery>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   			<th align="left">#</th>
            <th align="left">Name</th>
            <th align="left">Branch</th>
            <th align="left">Home</th>
            <th align="left">Crews</th>
            <th align="left">Jobs</th>
          </tr>
          </thead>
          <tbody>
          <cfoutput query="get_branch_managers">
            <tr>
              <td>#employee_ID#</td>
              <td>#crew_name#</td>
              <td>#employee_branch#</td>
              <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
              <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=crews" target="_blank">Crews</a></td>
              <td><a href="do_loginnew.cfm?employee_ID=#get_branch_managers.employee_ID#&schedchoice=jobs" target="_blank">Jobs</a></td>
            </tr>
          </cfoutput>
          </tbody>
        </table>
       <br />

<div class="dailysheet_header">Regional Admin</div>
        <cfquery name="get_reg_admin" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 98 AND employee_active =1
Order by lastname
</cfquery>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Branch</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_reg_admin">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td>#employee_branch#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_reg_admin.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
        <br />
        <div class="dailysheet_header">Mechanics</div>
        <cfquery name="get_mechanics" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 8 AND employee_active =1
Order by lastname
</cfquery>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_mechanics">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_mechanics.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
        <br />
        <br />
         <div class="dailysheet_header">Quoting</div>
        <cfquery name="get_quote" datasource="jrgm">
SELECT * FROM   app_employee_passwords   WHERE  access_role= 97 AND employee_active =1
Order by lastname
</cfquery>
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
              <thead>
                <tr>
                  <th align="left">#</th>
                  <th align="left">Name</th>
                  <th align="left">Home</th>
                </tr>
              </thead>
              <tbody>
                <cfoutput query="get_quote">
                  <tr>
                    <td>#employee_ID#</td>
                    <td>#employee_name#</td>
                    <td><a href="do_loginnew.cfm?employee_ID=#get_quote.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
                  </tr>
                </cfoutput>
              </tbody>
            </table>
        <br />
        <br /></td>
      <td>&nbsp;</td>  
 <cfquery name="get_supervisors" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 1 AND active_record =1
ORDER by employee_branch, last_name
</cfquery>
      <td valign="top"><div class="dailysheet_header">Production Managers (<cfoutput>#get_supervisors.recordcount#</cfoutput>)</div>
      
         <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   			<th align="left">#</th>
            <th align="left">Name</th>
            <th align="left">Branch</th>
            <th align="left">Home</th>
            <th align="left">Crews</th>
            <th align="left">Jobs</th>
          </tr>
          </thead>
          <tbody>
          <cfoutput query="get_supervisors">
            <tr>
              <td align="left">#employee_ID#</td>
              <td align="left">#crew_name#</td>
              <td align="left">#employee_branch#</td>
               <td><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
              <td align="left"><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=crews" target="_blank">Crews</a></td>
              <td align="left"><a href="do_loginnew.cfm?employee_ID=#get_supervisors.employee_ID#&schedchoice=jobs" target="_blank">Jobs</a></td>
            </tr>
          </cfoutput>
          </tbody>
        </table><br />
 
   <cfquery name="get_tech" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 6 AND active_record =1 AND employee_branch <>'Test'
ORDER by employee_branch, last_name
   </cfquery>
    <cfquery name="get_techD" datasource="jrgm">
SELECT DISTINCT  employee_ID FROM   app_crews   WHERE  Employee_Position_ID= 6 AND active_record =1 AND employee_branch <>'Test'
    </cfquery>
   <div class="dailysheet_header">Irrigation Techs (<cfoutput>#get_tech.recordcount#-#get_techD.recordcount#</cfoutput>)</div> 
 
  <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   			<th align="left">#</th>
            <th align="left">Name</th>
            <th align="left">Branch</th>
            <th align="left">Home</th>
            </tr>
          </thead>
          <tbody>
          <cfoutput query="get_tech">
            <tr>
              <td  align="left">#employee_ID#</td>
              <td align="left">#crew_name#</td>
              <td align="left">#employee_branch#</td>
             <td><a href="do_loginnew.cfm?employee_ID=#get_tech.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
              </tr>
          </cfoutput>
          </tbody>
        </table>
        <br />
 
   <cfquery name="get_tech" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 7 AND active_record =1 AND employee_branch <>'Test'
ORDER by employee_branch, last_name
        </cfquery>
   <div class="dailysheet_header">Spray Techs (<cfoutput>#get_tech.recordcount#</cfoutput>)</div> 
 
  <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   			<th align="left">#</th>
            <th align="left">Name</th>
            <th align="left">Branch</th>
            <th align="left">Home</th>
            </tr>
          </thead>
          <tbody>
          <cfoutput query="get_tech">
            <tr>
              <td  align="left">#employee_ID#</td>
              <td align="left">#crew_name#</td>
              <td align="left">#employee_branch#</td>
                <td><a href="do_loginnew.cfm?employee_ID=#get_tech.employee_ID#&schedchoice=home" target="_blank">Home</a></td>
              </tr>
          </cfoutput>
          </tbody>
        </table></td>
      <td>&nbsp;</td>   
      <cfquery name="get_CL" datasource="jrgm">
SELECT * FROM   app_crews   WHERE  Employee_Position_ID= 2 AND active_record =1 AND employee_branch <>'Test'
ORDER by employee_branch, last_name
        </cfquery>
     <cfquery name="get_techCLD" datasource="jrgm">
SELECT DISTINCT  employee_ID FROM   app_crews   WHERE  Employee_Position_ID= 2 AND active_record =1 AND employee_branch <>'Test'
    </cfquery>
      <td valign="top"><div class="dailysheet_header">Supervisors /Crew Leaders  (<cfoutput>#get_CL.recordcount#-#get_techCLD.recordcount#</cfoutput>)</div>
     
        <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   			<th align="left">#</th>
            <th align="left">Name</th>
            <th align="left">Branch</th>
            </tr>
          </thead>
          <tbody>
          <cfoutput query="get_CL">
            <tr>
              <td  align="left">#employee_ID#</td>
              <td align="left">#crew_name#</td>
              <td align="left">#employee_branch#</td>
              </tr>
          </cfoutput>
          </tbody>
        </table><br />
</td>
    </tr>
  </table>
  <!-- to clear footer -->
</div></div></div>
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
