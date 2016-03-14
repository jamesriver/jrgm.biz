<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="57"><!--- <a href="default.cfm"> ---><img src="images/logosm.png" width="57" height="36" alt="James River Grounds Management" /><!--- </a> ---></td>
      <td class="subbartxt">Welcome:<cfoutput> #SESSION.screenname#</cfoutput></td>
      <td ><!--<a href="supervisors/setting.cfm" class="first"><img src="images/icon_settings.png" width="42" height="36" alt="Settings" /></a>--></td>
     <td class="subbartxt" width="200" align="right">  <cfif SESSION.userid NEQ 1009 AND  SESSION.userid NEQ 3085><a href="default.cfm">Home</a><img src="images/clear.gif" width="20" height="2" alt="" /></cfif></td>
    </tr>
  </table>
</div>
