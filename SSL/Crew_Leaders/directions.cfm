<!--- This is the code to force cl to enter services --->
<cfif   IsDefined("Session.job_services_entered") AND  Session.job_services_entered EQ 0>
  <cfquery name="get_job_without_services" datasource="jrgm" maxrows="1">
SELECT * FROM job_clock WHERE Crew_Leader_ID = #Session.userid#  
ORDER by ID DESC 
</cfquery>
  <cflocation url="services.cfm?work_date=#todayDate_DS#&job_id=#get_job_without_services.job_id#&ID=#get_job_without_services.ID#">
</cfif>
<!--- END This is the code to force cl to enter services --->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(todayDate,"mmm-dd-yyyy")>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfquery name="get_job_info" datasource="jrgm">
SELECT * FROM jobs WHERE [Job ID] =  '#url.Job_ID#' <!--- AND export_id =1 --->  AND active_record= 1 
</cfquery>
<cfquery name="get_this_job_map" datasource="jrgm">
SELECT lat,lng,event_name,event_location FROM events WHERE Job_ID=  '#url.Job_ID#' <!--- AND export_id =1 --->
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style type="text/css">
html {
	height: 100%
}
body {
	height: 100%;
	margin: 0;
	padding: 0
}
.header {
	padding-right: 20px;
	padding-top:20px;
	padding-bottom: 0px;
	font: 22px Arial, Helvetica, sans-serif;
	color: #00573d;
}
</style>
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBA6r9NJexfGOxVYdzhfygNBFvguLR2TeM&sensor=true">
    </script>
<script type="text/javascript" language="JavaScript">
    <cfoutput>
        var #toScript(get_this_job_map.lng, "lng")#
    </cfoutput>
</script>
<script type="text/javascript" language="JavaScript">
    <cfoutput>
        var #toScript(get_this_job_map.lat, "lat")#
    </cfoutput>
</script>
<script type="text/javascript">
      // Enable the visual refresh
google.maps.visualRefresh = true;

var map;


function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(lat, lng),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var marker = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    title: 'Click to zoom'
  });

  google.maps.event.addListener(map, 'center_changed', function() {
    // 3 seconds after the center of the map has changed, pan back to the
    // marker.
    window.setTimeout(function() {
      map.panTo(marker.getPosition());
    }, 3000);
  });

  google.maps.event.addListener(marker, 'mousedown', function() {
    map.setZoom(12);
    map.setCenter(marker.getPosition());
  });
}

google.maps.event.addDomListener(window, 'load', initialize);


    </script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
    <div class="centrecontent_inner">
   <!---  <cfdump var="#get_this_job_map#"> --->
      <div class="header"><cfoutput>#get_this_job_map.event_name#<br />
          #get_this_job_map.event_location#</cfoutput></div>
      <div id="map-canvas"> </div>
    </div>
  </div>
</div>
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
