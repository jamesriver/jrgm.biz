<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
 
 <cfquery name="get_job_info" datasource="jrgm">
SELECT ID, [Job ID], [Wk Loc ID], [Wk Location Name] AS locationname, [Service Address] AS jobaddress1, [Service Address2] AS jobaddress2, [Service City] AS jobcity, [Service State] AS jobstate, [Service Zip] AS jobzip, [Acct Mgr] AS acctmgr, [Crew Leader] AS crewleader
 FROM jobs WHERE [Job ID] =  '#url.Job_ID#' AND active_record= 1
</cfquery>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="centrecontent">
  <cfinclude template="includes/topbar.cfm">
  <cfinclude template="includes/subbar.cfm">
  <div class="topbarr">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <cfoutput>
        <tr>
          <td align="left"><a href="job_list.cfm?Job_ID=#Job_ID#&work_date=#url.work_date#" class="formsb">Back</a></td>
          <td align="right"><a href="forms.cfm" class="formsb">Forms</a> &nbsp;&nbsp;<a href="default.cfm?work_date=#url.work_date#" class="formsb">Home</a>&nbsp;&nbsp; <a  href="../index.cfm"class="formsb">Log Out</a></td>
          <td><img src="images/clear.gif" width="40" height="1" /></td>
          <!---   <td><div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'es,pt', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script></td> --->
        </tr>
      </cfoutput>
    </table>
  </div>
  <!--centre content goes here -->
  <div class="centrecontent_inner">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="header">Job Details</td>
      </tr>
    </table>
   <cfoutput query="get_job_info">
      <div class="subheader">#locationname#</div>
      <ul class="crew">
        <li class="crewtop">Job ID&##8212; #ID# </li>
        <li>James River ID&##8212;#Job_ID#</li>
        <li>Job Location&##8212;#locationname#</li>
        <li>Address&##8212;#jobaddress1#</li>
        <li>City&##8212;#jobcity#, #jobstate#  #jobzip#</li>
        <li>Account Manager&##8212;#acctmgr#</li>
        <li class="crewbot">Crew Leader&##8212;#CrewLeader#</li>
      </ul>
    </cfoutput>
    
    <cfoutput> <a href="notes.cfm?Job_ID=#Job_ID#&work_date=#url.work_date#" class="bluebutton">Notes</a></cfoutput> </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
