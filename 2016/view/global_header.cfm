<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/ssl/admin/css/styles.css" rel="stylesheet" type="text/css" />
<link href="/ssl/admin/css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
.red {
	font: 13px;
	color: red;
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: bold
}
.black {
	font: 13px;
	color: black;
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: bold
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
<div id="centrecontent">

<cfoutput>
    <!--- from SSL/admin/includes/subbar.cfm --->
    <div class="subbar">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="57"><img src="/ssl/admin/images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></td>
          <td class="subbartxt">Welcome: #SESSION.screenname# (#SESSION.employee_position#)</td>
          <td ><!--<a href="supervisors/setting.cfm" class="first"><img src="/ssl/admin/images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
         <td class="subbartxt" width="200" align="right">  
         	<cfif SESSION.userid NEQ 1009 AND  SESSION.userid NEQ 3085>
         		<a href="#APPLICATION.basePath#index.cfm">Home</a>
         		<img src="/ssl/admin/images/clear.gif" width="20" height="2" alt="" />
         	</cfif>
         </td>
        </tr>
      </table>
    </div>
    
    <!--- from SSL/admin/includes/topbar.cfm --->
    <cfif  IsDefined("SESSION.access_role")  AND SESSION.access_role NEQ  '97' AND SESSION.access_role NEQ  '1'   AND SESSION.access_role NEQ  '94' >
    	<div class="topbar">
       		<cfif SESSION.userid NEQ 1033><td class="jobbutton"    >
         		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
				        <td class="jobbutton"  align="left">
				            <a href="/ssl/admin/payroll_main.cfm"><img src="/ssl/admin/images/icon_payroll.png"  width="60" height="60"  class="icons"/></a> <a href="/ssl/admin/daily_sheet_listing.cfm"><img src="/ssl/admin/images/icon_dailysheet.png" width="60" height="60"  class="icons"/></a> <a href="/ssl/admin/scheduler_select-new.cfm"><img src="/ssl/admin/images/icon_jobs.png" width="60" height="60" alt="Jobs" class="icons" /></a> <a href="/ssl/admin/scheduler_select-new.cfm"><img src="/ssl/admin/images/icon_crews.png" width="60" height="60" alt="Crews" class="icons" /></a><a href="/ssl/admin/inventory.cfm"><img src="/ssl/admin/images/icon_equipment.png" width="60" height="60" alt="icon"  class="icons"   /></a>
				            <a href="/ssl/admin/directory.cfm"><img src="/ssl/admin/images/directory_icon.png"  alt="Employee Directory" class="icons" /></a>
				            <a href="/ssl/admin/reports.cfm"><img src="/ssl/admin/images/icon_reports.png" alt="icon" class="icons" /></a>
			            </td>
		                <td align="right"><a href="#APPLICATION.basePath#index.cfm">
		                	<img src="/ssl/admin/images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a><a href="#APPLICATION.basePath#index.cfm?logout"><img src="/ssl/admin/images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a>
		                </td>
			         </tr>
      			</table>
            </cfif>
         	<cfif SESSION.userid EQ 1033>    
          		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        			<tr>
        				<td class="jobbutton"  align="left"> <a href="/ssl/admin/inventory.cfm"><img src="/ssl/admin/images/icon_equipment.png" width="60" height="60" alt="icon"  class="icons"   /></a> </td>
          				<td align="right">
          					<a href="bgarrett.cfm"><img src="/ssl/admin/images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a>
          					<a href="#APPLICATION.basePath#index.cfm?logout"><img src="/ssl/admin/images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a>
          				</td>
          			</tr>
          		</table>
         	</cfif>              
    	</div>
    </cfif>
</cfoutput>

<!--centre content goes here -->
<div class="centrecontent_inner">