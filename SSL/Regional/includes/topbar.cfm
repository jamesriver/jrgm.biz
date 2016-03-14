
<div class="topbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="jobbutton"> 
        <a href="https://www.jrgm.biz/ssl/regional/payroll_main.cfm"><img src="images/icon_payroll.png"  width="60" height="60"  class="icons"/></a> 
        
     <a href="https://www.jrgm.biz/ssl/regional/dailysheet_select.cfm"><img src="images/icon_dailysheet.png" width="60" height="60"  class="icons"/></a>
 <!---   <cfoutput>
  <!---  <a href="https://www.jrgm.biz/ssl/scheduler/schedulerevents.html"> --->
  <a href="do_login.cfm?employee_ID=#SESSION.userid#&schedchoice=jobs">
   <img src="images/icon_jobs.png" width="60" height="60" alt="Jobs" class="icons" /></a>
   </cfoutput>
    
	
	<cfoutput>
 	<!--- <a href="https://www.jrgm.biz/ssl/scheduler/scheduler.html"> --->
     <a href="do_login.cfm?employee_ID=#SESSION.userid#&schedchoice=crews">
    <img src="images/icon_crews.png" width="60" height="60" alt="Crews" class="icons" /></a>
	</cfoutput>  --->
	
	<cfoutput><a href="https://www.jrgm.biz/ssl/regional/inventory_list.cfm"><img src="images/icon_equipment.png" width="60" height="60" alt="Inventory" class="icons" /></a></cfoutput> 
    	<a href="https://www.jrgm.biz/ssl/regional/directory.cfm"><img src="images/directory_icon.png" width="60" height="60" alt="Inventory" class="icons" /></a>
                             <a href="https://www.jrgm.biz/ssl/regional/forms.cfm"><img src="images/icon_forms.png" width="60" height="60" alt="Forms" class="icons" /></a>

        </td>
      <!-- .btn-group -->
      <td align="right"><!--<a href="http://www.jrgm.biz/supervisors/proposal.cfm" class="btn btn-primary">Proposal Maker</a><a href="http://www.jrgm.biz/supervisors/forms.cfm" class="btn btn-primary">Forms</a> -->
        <a href="default.cfm"><img src="images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a> <a href="http://www.jrgm.biz/index.cfm"><img src="images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a> </td>
    </tr>
  </table>
</div>
