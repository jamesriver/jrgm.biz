<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfif job_id EQ "9999">
  

<div class="topbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><a href="dl.cfm" class="first"><img src="images/icon_jobs.png" alt="Logout" width="60" height="60" border="0" /></a></td>
      <td><a href="lunch.cfm"><img src="images/icon_lunch.png" alt="Logout" width="60" height="60" /></a></td>
     <td align="right"><a href="daily_sheet.cfm"><img src="images/icon_dailysheet.png" alt="Daily Sheet" width="60" height="60" /></a>
 <a href="forms.cfm"><img src="images/icon_forms.png" alt="Daily Sheet" width="60" height="60" /></a>

      <a  href="default.cfm"><img src="images/icon_home.png" alt="Home" width="60" height="60" /></a> <a  href="/index.cfm"><img src="images/icon_logout.png" alt="Logout" width="60" height="60" /></a> </td>
      <td><img src="images/clear.gif" width="10" height="1" /></td>
      <!---   <td><div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'es,pt', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script></td> --->
    </tr>
  </table>
</div>
