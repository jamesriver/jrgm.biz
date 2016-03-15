<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfif job_id EQ "9999">
  <cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE branch = '#Session.branch#'  <!--- AND export_id =1  --->
ORDER by event_name,start_date
</cfquery>
  <cfelse>
  <cfquery name="get_todays_jobs" datasource="jrgm">
SELECT * FROM events WHERE start_date  >=  (#today#) AND start_date < (#tomorrow#)   AND crew_leader_id = #Session.userid#  <!--- AND export_id =1 ---> 
ORDER by start_date,event_name
</cfquery>
</cfif>

<div class="topbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="jobbutton"><!--- <a href="" class="formsb">Job List</a> ---></td>
        <td><a href="/ssl/crew_leaders/lunchin.cfm?mylunchlist=<cfoutput>#mylunchlist#</cfoutput>" class="lunchb">End Lunch</a></td>
    <td align="right"><!--- <a href="" class="formsb">Daily Sheet</a> --->
       
        <!--- <a  href="" class="formsb">Home</a> <a  href=""class="formsb">Log Out</a> ---> </td>
      <td><img src="images/clear.gif" width="10" height="1" /></td>
      <!---   <td><div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'es,pt', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script></td> --->
    </tr>
  </table>
</div>
