   <cfif  IsDefined("SESSION.access_role")  AND SESSION.access_role NEQ  '97' AND SESSION.access_role NEQ  '1'   AND SESSION.access_role NEQ  '94' >
<div class="topbar">
   <cfif SESSION.userid NEQ 1033><td class="jobbutton"    >
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
    <td class="jobbutton"  align="left">
  	    <a href="https://www.jrgm.biz/ssl/admin/payroll_main.cfm"><img src="images/icon_payroll.png"  width="60" height="60"  class="icons"/></a> <a href="https://www.jrgm.biz/ssl/admin/daily_sheet_listing.cfm"><img src="images/icon_dailysheet.png" width="60" height="60"  class="icons"/></a> <cfoutput><a href="https://www.jrgm.biz/ssl/admin/scheduler_select.cfm"><img src="images/icon_jobs.png" width="60" height="60" alt="Jobs" class="icons" /></a></cfoutput> <cfoutput><a href="https://www.jrgm.biz/ssl/admin/scheduler_select.cfm"><img src="images/icon_crews.png" width="60" height="60" alt="Crews" class="icons" /></a></cfoutput><cfoutput><a href="https://www.jrgm.biz/ssl/admin/inventory.cfm"><img src="images/icon_equipment.png" width="60" height="60" alt="icon"  class="icons"   /></a></cfoutput> 
        <cfoutput><a href="https://www.jrgm.biz/ssl/admin/directory.cfm"><img src="images/directory_icon.png"  alt="Employee Directory" class="icons" /></a></cfoutput>
        <a href="https://www.jrgm.biz/ssl/admin/reports.cfm"><img src="images/icon_reports.png" alt="icon" class="icons" /></a> 
        </td>
            <td align="right"><a href="https://www.jrgm.biz/ssl/admin/default.cfm"><img src="images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a><a href="http://www.jrgm.biz/index.cfm"><img src="images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a> </td>
     </tr>
  </table>
        </cfif>
     <cfif SESSION.userid EQ 1033>    
     
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
    <td class="jobbutton"  align="left"> <cfoutput><a href="https://www.jrgm.biz/ssl/admin/inventory.cfm"><img src="images/icon_equipment.png" width="60" height="60" alt="icon"  class="icons"   /></a></cfoutput> </td>
      <td align="right"><a href="bgarrett.cfm"><img src="images/icon_home.png" alt="Home" width="60" height="60" class="icons" /></a>
     <a href="http://www.jrgm.biz/index.cfm"><img src="images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a> </td>
     </cfif>
    </tr>
  </table>
</div>
</cfif>