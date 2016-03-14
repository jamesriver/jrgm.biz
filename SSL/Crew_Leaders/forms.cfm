<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset Now_Time = Now()>
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
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
<style>
textarea {
	width: 600px;
	padding:10px;
}
</style>
<script type="text/javascript">

        $(document).ready(function() {

  if (navigator.userAgent.match(/Android/i)) {
    window.scrollTo(0,0); // reset in case prev not scrolled  
    var nPageH = $(document).height();
    var nViewH = window.outerHeight;
    if (nViewH > nPageH) {
      nViewH -= 150;
      $('BODY').css('height',nViewH + 'px');
    }
    window.scrollTo(0,1);
  }

});

</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">Forms</td>
        </tr>
      </table>
      <ul class="list">
        <li><a title="Leadership Behaviors" href="http://garden.jrgm.com/wp-content/uploads/2012/11/James-River-Leadership-Behaviors.pdf" target="_blank">JRGM Leadership Behaviors 2</a></li>
        <li><a title="JRGM Phone List" href="http://garden.jrgm.com/wp-content/uploads/2012/08/phoneList.pdf" target="_blank">JRGM Phone List</a></li>
      </ul>
      <div class="subheader">Account Manager Best Practices</div>
      <ul class="list">
        <li><a title="Account Manager Crew Communication Checklist" href="http://garden.jrgm.com/wp-content/uploads/2011/06/AMcrewLeaderComCheck.pdf" target="_blank">Account Manager Crew Leader Communication Checklist</a></li>
        <li><a title="Branch Leadership Team Weekly Meeting Agenda" href="http://garden.jrgm.com/wp-content/uploads/2011/06/BranchLeadershipTeamWeeklyMeetingAgenda.pdf" target="_blank">Branch Leadership Team Weekly Meeting Agenda</a></li>
        <li><a title="High Pay Off Activities" href="http://garden.jrgm.com/wp-content/uploads/2011/07/Account-Manager-High-Pay-Off-Activities.pdf" target="_blank">High Pay Off Activities</a></li>
        <li><a title="Landscape Audit Best Practices" href="http://garden.jrgm.com/wp-content/uploads/2011/06/JRGM-LANDSCAPE-AUDIT-BEST-PRACTICES.pdf" target="_blank">Landscape Audit Best Practices</a></li>
        <li><a title="Monthly Crew Leader Meeting Agenda" href="http://garden.jrgm.com/wp-content/uploads/2011/06/MonthlyCrewLeaderMeetingAgenda.pdf" target="_blank">Monthly Crew Leader Meeting Agenda</a></li>
        <li><a title="Production Paperwork" href="http://garden.jrgm.com/wp-content/uploads/2011/06/BestPracticesForProductionPaperwork.pdf" target="_blank">Production Paperwork</a></li>
        <li><a title="Scheduling" href="http://garden.jrgm.com/wp-content/uploads/2011/06/BestPracticesForScheduling.pdf" target="_blank">Scheduling</a></li>
      </ul>
      <div class="subheader">Manuals</div>
      <ul class="list">
        <li><a title="Employee Handbook (2012)" href="http://garden.jrgm.com/wp-content/uploads/2012/06/Employee-Handbook-2012.pdf" target="_blank">Employee Handbook</a></li>
        <li><a title="Employee Handbook - Spanish (2012)" href="http://garden.jrgm.com/wp-content/uploads/2012/06/Employee-Handbook-Spanish-2012.pdf" target="_blank">Employee Handbook &#8212; Spanish</a></li>
        <li><a rel="attachment wp-att-869" href="http://garden.jrgm.com/documents/safetyhandbook/">SafetyHandbook</a></li>
        <li><a rel="attachment wp-att-870" href="http://garden.jrgm.com/documents/safetyhandbook-spanish/">SafetyHandBook-Spanish</a></li>
        <li><a title="Spray Technician Manual - 2012" href="http://garden.jrgm.com/wp-content/uploads/2012/03/SprayTechnicianManual201220120214085608.pdf" target="_blank">Spray Technician Manual &#8212; 2012</a></li>
      </ul>
      <br />
    </div>
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
