
<div class="topbar">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
   <!---     <td class="jobbutton">
    <div class="btn-group">
            <a data-toggle="dropdown" data-hover="dropdown"><img src="images/icon_payroll.png" width="60" height="60" /> </a>
             <ul class="dropdown-menu">
              <li><a href="">View Payroll Reports</a></li>
               <li><a href="">Approve Payroll</a></li>
            </ul>
          
          </div>
          <!-- .btn-group -->
          <div class="btn-group">
            <a data-toggle="dropdown" data-hover="dropdown"><img src="images/icon_dailysheet.png" width="60" height="60"  class="icons10"/></a>
            <ul class="dropdown-menu">
              <li><a href="dailysheet_select.cfm">View Daily Sheets</a></li>
               <li><a href="dailysheet_create.cfm">Create a Daily Sheet</a></li>
            </ul>
          </div> --->
              <a href=""><img src="images/icon_payroll.png"  width="60" height="60"  class="icons"/></a>
        <cfoutput><a href="scheduler/units.cfm?Employee_ID=#Session.userid#"><img src="images/icon_jobs.png" width="60" height="60" alt="Jobs" class="icons" /></a></cfoutput>
            <cfoutput><a target="_blank" href="../../../scheduler/scheduler.html"><img src="images/icon_crews.png" width="60" height="60" alt="Crews" class="icons" /></a></cfoutput>
        </td>
            
           
        
          <!-- .btn-group -->
        <td align="right"><!--<a href="/supervisors/proposal.cfm" class="btn btn-primary">Proposal Maker</a><a href="/supervisors/forms.cfm" class="btn btn-primary">Forms</a> -->
         <a href="default.cfm"><img src="images/icon_home.png" alt="Home" width="60" height="60" class="icons"></a> 
         <a href="/index.cfm"><img src="images/icon_logout.png" alt="Logout" width="60" height="60" class="icons" /></a>
      </td>
      </tr>
    </table>
  </div>