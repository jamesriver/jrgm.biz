
<cfquery name="get_equipment" datasource="jrgm"  >
SELECT e.ID as equipment_id, e.product_name as equipment_name, e.product_description as equipment_description, e.branch_name as branch, ae.[Name FirstLast] as allocated_to, mileage_eq, hours_eq, oil_change_criteria, oil_change_date_due, oil_change_hours_due, oil_change_mileage_due, DATEADD(year, 1, last_inspection_date) as state_inspection_due, Tags_expire,
CASE WHEN oil_change_criteria IN (1,5) AND oil_change_hours_due IS NOT NULL AND oil_change_hours_due < hours_eq THEN 1 ELSE 0 END as oil_change_hours_overdue,
CASE WHEN oil_change_criteria IN (2,3) AND oil_change_mileage_due IS NOT NULL AND oil_change_mileage_due < mileage_eq THEN 1 ELSE 0 END as oil_change_mileage_overdue,
CASE WHEN oil_change_criteria IN (4) AND oil_change_date_due IS NOT NULL AND oil_change_date_due < CONVERT(date, getDate()) THEN 1 ELSE 0 END as oil_change_date_overdue,
CASE WHEN last_inspection_date IS NOT NULL AND last_inspection_date < CONVERT(date, DATEADD(year,-1,getDate())) THEN 1 ELSE 0 END as state_inspection_overdue,
CASE WHEN tags_expire IS NOT NULL AND tags_expire < CONVERT(date, getDate()) THEN 1 ELSE 0 END as tags_overdue
FROM equipment e
LEFT JOIN app_employees ae ON ae.[Employee ID]=e.crew_assignment_last
WHERE ((oil_change_criteria IN (1,5) AND oil_change_hours_due IS NOT NULL AND oil_change_hours_due < hours_eq)
OR (oil_change_criteria IN (2,3) AND oil_change_mileage_due IS NOT NULL AND oil_change_mileage_due < mileage_eq)
OR (oil_change_criteria IN (4) AND oil_change_date_due IS NOT NULL AND oil_change_date_due < CONVERT(date, getDate()))
OR (last_inspection_date IS NOT NULL AND last_inspection_date < CONVERT(date, DATEADD(year,-1,getDate())))
OR (tags_expire IS NOT NULL AND tags_expire < CONVERT(date, getDate()))
)
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/styleshome.css" rel="stylesheet" type="text/css" />
<link href="css/ipad.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style type="text/css">
#centrecontent .centrecontent_inner p a {
	font-family: Arial;
}
html {
	position: relative;
	min-height: 100%;
}
body {
	margin: 0 0 100px; /* bottom = footer height */
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	height: 100px;
	width: 100%;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
li {
	font: normal .9em Arial, Helvetica, sans-serif;
	line-height: 24px;
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="header"></div>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
            <div class="alertsh" style="background-color: orange !important">Equipment Overdue</div>
          </td>
        </tr>
       </table>
       <table width="100%" class="table table-striped table-hover" id="sample_3">
        <thead>
         <tr>
           <th>ID</th>
           <th>Equipment</th>
           <th>Branch</th>
           <th>Allocated To</th>
           <th>Hours/Mileage</th>
           <th>Oil Change Due</th>
           <th>State Inspection Due</th>
           <th>Tags Expire</th>
         </tr>
        </thead>
        <tbody>
        <cfset class_alert_red = ' style="background-color: ##FF0000"'>
        <cfset class_alert_orange = ' style="background-color: orange"'>
         <cfoutput query="get_equipment">
         <cfset class_oil_change_due = ''>
         <cfset class_state_inspection_due = ''>
         <cfset class_tags_expire = ''>
         <cfif oil_change_criteria EQ 1 OR oil_change_criteria EQ 5>
            <cfset hours_mileage_eq = hours_eq>
            <cfset oil_change_due = oil_change_hours_due>
            <cfif oil_change_hours_overdue EQ 1>
                <cfset class_oil_change_due = class_alert_red>
            </cfif>
         <cfelseif oil_change_criteria EQ 2 OR oil_change_criteria EQ 3>
            <cfset hours_mileage_eq = mileage_eq>
            <cfset oil_change_due = oil_change_mileage_due>
            <cfif oil_change_mileage_overdue EQ 1>
                <cfset class_oil_change_due = class_alert_red>
            </cfif>
         <cfelse>
            <cfset hours_mileage_eq = '--'>
            <cfset oil_change_due = DateFormat(oil_change_date_due, 'mm/dd/yyyy')>
            <cfif oil_change_date_overdue EQ 1>
                <cfset class_oil_change_due = class_alert_red>
            </cfif>
         </cfif>

         <cfif class_oil_change_due EQ class_alert_red AND oil_change_due EQ ''>
            <cfset class_oil_change_due = class_alert_orange>
         </cfif>
         <cfif state_inspection_overdue EQ 1>
            <cfset class_state_inspection_due = class_alert_red>
         </cfif>
         <cfif tags_overdue EQ 1>
             <cfset class_tags_expire = class_alert_red>
          </cfif>

         <tr>
           <td><a href="/ssl/admin/inventory_edit.cfm?ID=#equipment_id#" target="_blank">#equipment_id#</a></td>
           <td>#equipment_name & '<br /><span style="font-size: 8pt"><i>' & equipment_description#</i></span></td>
           <td>#branch#</td>
           <td>#allocated_to#</td>
           <td>#hours_mileage_eq#</td>
           <td#class_oil_change_due#>#oil_change_due#</td>
           <td#class_state_inspection_due#>#DateFormat(state_inspection_due, 'mm/dd/yyyy')#</td>
           <td#class_tags_expire#>#DateFormat(tags_expire, 'mm/dd/yyyy')#</td>
         </tr>
         </cfoutput>
        </tbody>
       </table>
      </div>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
	$(document).ready(function() {
		
		Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
	});
	</script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script>
$( "#tabs" ).tabs();
$('#sample_3').DataTable({
    "iDisplayLength": 100,
    "columnDefs": [
        { "width": 20, "targets": 1 },
        { "width": 200, "targets": 5 },
        { "width": 200, "targets": 6 },
        { "width": 200, "targets": 7 }
    ]
});

</script>
</body>
</html>
