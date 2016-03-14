<!--- <cfquery name="get_job_services" datasource="jrgm" >
SELECT t1.*, t2.service_name FROM job_services_clock AS T1 INNER JOIN services_list_short AS T2 ON T1.service_ID = T2.service_ID WHERE T1.job_ID = '#job_ID#'    <CFIF IsDefined("url.ID")>
    AND T1.Job_clock_ID =#url.id#
   </CFIF>
 <!---   <cfdump  var="#get_job_services#"> --->
</CFQUERY>

<cfif get_job_services.recordcount GT 0>
  <div class="topbar">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="jobbutton"><div class="btn-group">
         <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">Job List </button>
          <ul class="dropdown-menuts">
           <!---  <cfif get_todays_jobs.recordcount GT 0> --->
              <cfoutput query="get_todays_jobs">
                <li><a href="https://www.jrgm.biz/ssl/crew_leaders/job_list.cfm?Job_ID=#Job_ID#&work_date=#todayDate#">#event_name#</a></li>
              </cfoutput>
             <!---  <cfelse> --->
              <li><cfoutput><a href="https://www.jrgm.biz/ssl/crew_leaders/default.cfm?Job_ID=9999&work_date=#todayDate#"></cfoutput> 
                See All Branch Jobs</a> </li>
          <!---   </cfif> --->
          </ul>
        </div></td>
        <td align="right"><a href="https://www.jrgm.biz/ssl/crew_leaders/daily_sheet.cfm" class="formsb">Daily Sheet</a>
          <!--  <a href="https://www.jrgm.biz/ssl/crew_leaders/forms.cfm" class="formsb">Forms</a>
-->
          <a  href="https://www.jrgm.biz/ssl/crew_leaders/default.cfm"class="formsb">Home</a> <a  href="http://www.jrgm.biz/index.cfm"class="formsb">Log Out</a> </td>
        <td><img src="images/clear.gif" width="10" height="1" /></td>
        <!---   <td><div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'es,pt', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script></td> --->
      </tr>
    </table>
  </div>
  --->
  <div class="topbar">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="subheader" align="center">You must enter Services before leaving this page.</td>
        <td><img src="images/clear.gif" width="10" height="1" /></td>
      </tr>
    </table>
  </div>
 
