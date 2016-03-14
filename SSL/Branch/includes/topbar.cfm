
<div class="topbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="jobbutton"> 
        <a href="https://www.jrgm.biz/ssl/branch/payroll_main.cfm"><img src="images/icon_payroll.png"  class="icons"/></a> 
        
     <a href="https://www.jrgm.biz/ssl/branch/dailysheet_select.cfm"><img src="images/icon_dailysheet.png" class="icons"/></a>
   <cfoutput>
  <!---  <a href="https://www.jrgm.biz/ssl/scheduler/schedulerevents.html"> --->
  <a href="do_login.cfm?employee_ID=#SESSION.userid#&schedchoice=jobs">
   <img src="images/icon_jobs.png" alt="Jobs" class="icons" /></a>
   </cfoutput>
    
	
	<cfoutput>
 	<!--- <a href="https://www.jrgm.biz/ssl/scheduler/scheduler.html"> --->
     <a href="do_login.cfm?employee_ID=#SESSION.userid#&schedchoice=crews">
    <img src="images/icon_crews.png" alt="Crews" class="icons" /></a>
	</cfoutput> 
	
	<cfoutput><a href="https://www.jrgm.biz/ssl/branch/inventory_list.cfm"><img src="images/icon_equipment.png" width="60" height="60" alt="Inventory" class="icons" /></a></cfoutput> 
    	<a href="https://www.jrgm.biz/ssl/branch/directory.cfm"><img src="images/directory_icon.png" alt="Directory" class="icons" /></a>
        <a href="https://www.jrgm.biz/ssl/branch/forms.cfm"><img src="images/icon_forms.png" alt="Forms" class="icons" /></a>
        </td>
      <!-- .btn-group -->
      <td align="right"><!--<a href="http://www.jrgm.biz/supervisors/proposal.cfm" class="btn btn-primary">Proposal Maker</a><a href="http://www.jrgm.biz/supervisors/forms.cfm" class="btn btn-primary">Forms</a> -->
        <a href="default.cfm"><img src="images/icon_home.png" alt="Home" class="icons" /></a> <a href="http://www.jrgm.biz/index.cfm"><img src="images/icon_logout.png" alt="Logout" class="icons" /></a> </td>
    </tr>
  </table>
</div>
