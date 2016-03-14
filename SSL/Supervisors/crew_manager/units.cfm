
 
<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID ,crew_name AS employee_name,supervisor_id, Employee_Position_ID  FROM app_crews WHERE (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) AND export_id =1 AND Employee_Position_ID
 IN (1,2)  AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>JRGM Scheduler</title>
<script src="dhtmlxscheduler.js?v=3.5" type="text/javascript" charset="utf-8"></script>
<script src="ext/dhtmlxscheduler_dhx_terrace.js?v=3.5" type="text/javascript" charset="utf-8"></script>
<script src="ext/dhtmlxscheduler_year_view.js?v=3.5" type="text/javascript" charset="utf-8"></script>
 
<script src="ext/dhtmlxscheduler_multisource.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script src="ext/dhtmlxscheduler_map_view.js" type="text/javascript" charset="utf-8"></script>
<script src="ext/dhtmlxscheduler_recurring.js" type="text/javascript" charset="utf-8"></script>
<script src="ext/dhtmlxscheduler_units.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="dhtmlxscheduler_dhx_terrace.css?v=3.5" type="text/css" media="screen" title="no title" charset="utf-8" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<style type="text/css" media="screen">
html, body {
	margin:0px;
	padding:0px;
	height:100%;
	overflow:hidden;
}
.dhx_cal_event_line.custom, .dhx_cal_event.custom div {
	background-color:#fd7;
	border-color:#da6;
	color:#444;
}
.dhx_cal_event.colored div.dhx_title, .dhx_cal_event.colored div.dhx_header {
	background-color:#1796b0 !important;
	color:#1796b0 !important;
}
</style>
<script type="text/javascript" charset="utf-8">
		function init() {
			//window.resizeTo(950,700)
			modSchedHeight();
			scheduler.config.xml_date="%Y-%m-%d %H:%i";
			scheduler.config.drag_create =true;
			scheduler.config.first_hour = 0;
			scheduler.config.last_hour = 24;
			scheduler.xy.scale_width = 2;
			//scheduler.config.icons_select = [
			////"icon_details",
		//	"icon_delete",
		//	];
			
			 // ------------------NEW CODE----------------------
		    scheduler.xy.min_event_height = 14;

             scheduler.renderEvent = function(container, ev) {
                 var container_width = container.style.width; // e.g. "105px"
                 var container_height = container.style.height;

                // move section
                 var html = "<div class='dhx_event_move dhx_header' style='width: " + (parseFloat(container_width) - 2) + 'px' + ";'></div>";

                // container for event contents
                 html += "<div class='dhx_event_move dhx_body' style='cursor:pointer;padding-top:0px;padding-bottom:0px;height: " + container_height + ";width: " + (parseFloat(container_width) - 10) + 'px' + "'>";

                // displaying event text
                 html += scheduler.templates.event_text(ev.start_date, ev.end_date, ev) + "</div>";

                // resize section
                html += "<div class='dhx_event_resize dhx_footer' style='width: " + (parseFloat(container_width) - 4) + 'px' + ";'></div>";

                container.innerHTML = html;
                return true; // required, true - we've created custom form; false - display default one instead
             };
			 // ------------------END NEW CODE----------------------
			
			scheduler.config.date_step = 5;
			//scheduler.config.month_date = "%l %m-%d-%Y";
			scheduler.config.day_date= "%l %m-%d-%Y";
			scheduler.config.separate_short_events = true;
			scheduler.config.multi_day = true;
		
     
            scheduler.date.add_map = function(date, inc) {
              return scheduler.date.add(date, inc, "month");
           };
			
	       //scheduler.config.cascade_event_display = true; // to enable cascade rendering
          // scheduler.config.cascade_event_count = 20; // how many levels (maximum) should be used
          // scheduler.config.cascade_event_margin = 0; // margin in px between levels
 		   scheduler.config.update_render  = true;
		   scheduler.config.touch = true;
 
			var sections=[
				<cfoutput query="get_employees">{key:#EMPLOYEE_ID#, label:"#EMPLOYEE_NAME#"},</cfoutput>
						];
		
			scheduler.locale.labels.unit_tab = "Crews"
			scheduler.createUnitsView({
				name:"unit",
				property:"crew_leader_id",
				list:sections
			});
          scheduler.templates.unit_date = function(date){
          return scheduler.date.date_to_str("%l %F %j, %Y")(date);
           };
		   scheduler.templates.day_date = function(date){
          return scheduler.date.date_to_str("%l %F %j, %Y")(date);
           };
		 //   scheduler.templates.week_date = function(date){
         // return scheduler.date.date_to_str("%l %F %j, %Y")(date);
         //  };
		   
		 
		   
		   //scheduler.xy.max_event_height = 20; 		   
		  	scheduler.init('scheduler_here',new Date(),"unit");
			scheduler.templates.event_class=function(s,e,ev){ return ev.custom?"custom":""; };
			scheduler.load("data.cfm");
			var DP = new dataProcessor("data.cfm");
			DP.init(scheduler);
		}
	</script>
</head>
<body onload="init();" onresize="modSchedHeight()">
<script>
	function modSchedHeight(){
		var headHeight = 100;
		var sch = document.getElementById("scheduler_here");
		sch.style.height = (parseInt(document.body.offsetHeight)-headHeight)+"px";
		var contbox = document.getElementById("contbox");
		contbox.style.width = (parseInt(document.body.offsetWidth)-300)+"px";
	}
</script>
<div id="contbox" style="float:left;color:white;margin:0px 75px 0 75px; overflow:hidden;font: 16px Arial,Helvetica;color:white"> </div>
<div id="centrecontent">
 
   <cfinclude template="includes/topbar.cfm">
   <cfinclude template="includes/subbar.cfm">  
 
  <div class="centrecontent_inner">
    <!-- end. info block -->
    <div id="scheduler_here" class="dhx_cal_container" style='width:100%;height:100%;'>
      <div class="dhx_cal_navline">
        <div class="dhx_cal_prev_button">&nbsp;</div>
        <div class="dhx_cal_next_button">&nbsp;</div>
        <div class="dhx_cal_today_button"></div>
        <div class="dhx_cal_date"></div>
        <div class="dhx_cal_tab" name="unit_tab" style="right:382px;"></div>
        <div class="dhx_cal_tab" name="day_tab" style="right:332px;"></div>
        <div class="dhx_cal_tab" name="week_tab" style="right:268px;"></div>
        <div class="dhx_cal_tab" name="month_tab" style="right:204px;"></div>
        <!--- <div class="dhx_cal_tab" name="year_tab" style="right:140px;"></div> --->
     <!---    <div class="dhx_cal_tab" name="map_tab" style="right:280px;"></div> --->
      </div>
      <div class="dhx_cal_header"> </div>
      <div class="dhx_cal_data"> </div>
    </div>
  </div>
  </div>
<div id="footer">
  <div class="footerlogo"><!--- <a href="../default.cfm"><img src="images/logo.png" width="281" height="66" /></a> ---></div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>


 