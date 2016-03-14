<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="subbartxt">Welcome:<cfoutput> #SESSION.screenname#</cfoutput></td>
      <td class="subbartxt" align="right"><cfif get_active_jobs.recordcount GT 0>
          Job Started: <cfoutput><a href=""> #get_this_job.active_job_name#</cfoutput></a>
        </cfif></td>
    </tr>
  </table>
</div>
