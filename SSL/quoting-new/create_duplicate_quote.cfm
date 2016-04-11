<!--- <cfset tempvariable = StructClear(session)>  
 --->
<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<cfset SQLToday = Mid(DateAdd('d', 0, Now()), 6, 10)>
<!---cfoutput>#Mid(DateAdd('d', 0, Now()), 1, 3)#</cfoutput><cfabort--->

<cfif IsDefined("form.duplicate") AND IsDefined("form.opportunity_name")>
    <cfinclude template="../quoting-new/include_cffunctions.cfm">
    <cfquery name="get_quote_start" datasource="jrgm">
        SELECT * FROM quote_start
        WHERE ID=#form.duplicate#
    </cfquery>
    <cfif get_quote_start.recordcount GT 0>
        <cfset original_ID = get_quote_start.ID>
        <cfset original_opportunity_id = get_quote_start.opportunity_id_original>
        <cfif original_opportunity_id EQ ''>
            <cfset original_opportunity_id = get_quote_start.opportunity_id>
        </cfif>
        <cfset quote_start_data = QueryToStruct(get_quote_start)>
        <cfset quote_start_data = quote_start_data[1]>
        <cfset quote_start_data.opportunity_id = ''>
        <cfset quote_start_data.opportunity_name = form.opportunity_name>
        <cfset quote_start_data.opportunity_state = 'OPEN'>
        <cfset quote_start_data.date_quote_started = SQLToday>
        <cfset quote_start_data.date_quote_updated = ''>
        <cfset quote_start_data.user_id = SESSION.userid>
        <cfset quote_start_data.duplicate_quote = 1>
        <cfset quote_start_data.quote_approved = ''>
        <cfset quote_start_data.biz_approved_date = ''>
        <cfset quote_start_data.quote_closed = ''>
        <cfset quote_start_data.opportunity_id_original = original_opportunity_id>
        <cfset quote_start_data.responsible_user_Employee_ID = ''>
        <cfset quote_start_data['Job ID'] = ''>
        <cfset quote_start_fields_raw = get_quote_start.getMetaData().getColumnLabels()>
        <cfset SQLOutput = getSQLToDuplicateRow('quote_start', quote_start_data, quote_start_fields_raw)>
        <!---cfoutput>
            #PreserveSingleQuotes(SQLOutput)#
        </cfoutput>
        <cfabort--->
        <cfquery name="insert_quote_start" datasource="jrgm" result="result_insert_quote_start">
            #PreserveSingleQuotes(SQLOutput)#
        </cfquery>
        <cfset new_opportunity_id = result_insert_quote_start["GENERATEDKEY"]>

        <cfquery name="update_quote_start" datasource="jrgm">
            UPDATE quote_start
            SET opportunity_id=ID
            WHERE ID=#new_opportunity_id#
        </cfquery>

        <cfquery name="get_quote_main" datasource="jrgm">
            SELECT * FROM quote_main
            WHERE opportunity_id=#get_quote_start.opportunity_id#
        </cfquery>
        <cfif get_quote_main.recordcount GT 0>
            <cfset quote_main_data = QueryToStruct(get_quote_main)>
            <cfset quote_main_data = quote_main_data[1]>
            <cfset quote_main_data.date_created = SQLToday>
            <cfset quote_main_data.date_updated = ''>
            <cfset quote_main_data.user_id = SESSION.userid>
            <cfset quote_main_data.opportunity_id = new_opportunity_id>
            <cfset quote_main_data.contract_start_date = ''>
            <cfset quote_main_data.contract_end_date = ''>
            <cfset quote_main_data.contract_installments = ''>
            <cfset quote_main_data.duplicate_quote = 1>
            <cfset quote_main_data.opportunity_id_original = original_opportunity_id>
            <cfset quote_main_data.quote_approved = ''>
            <cfset quote_main_fields_raw = get_quote_main.getMetaData().getColumnLabels()>
            <cfset SQLOutput = getSQLToDuplicateRow('quote_main', quote_main_data, quote_main_fields_raw)>
            <!---cfoutput>
                #SQLOutput#
            </cfoutput--->
            <cfquery name="insert_quote_main" datasource="jrgm">
                #PreserveSingleQuotes(SQLOutput)#
            </cfquery>
        </cfif>

        <cfquery name="get_quote_services" datasource="jrgm">
            SELECT * FROM quote_services
            WHERE opportunity_id=#get_quote_start.opportunity_id#
        </cfquery>
        <cfif get_quote_services.recordcount GT 0>
            <cfset quote_services_data = QueryToStruct(get_quote_services)>
            <cfset quote_services_data = quote_services_data[1]>
            <cfset quote_services_data.quote_id = ''>
            <cfset quote_services_data.opportunity_id = new_opportunity_id>
            <cfset quote_services_data.contract_start_date = ''>
            <cfset quote_services_data.contract_end_date = ''>
            <cfset quote_services_data.contract_installments = ''>
            <cfset quote_services_fields_raw = get_quote_services.getMetaData().getColumnLabels()>
            <cfset SQLOutput = getSQLToDuplicateRow('quote_services', quote_services_data, quote_services_fields_raw)>
            <!---cfoutput>
                #SQLOutput#
            </cfoutput--->
            <cfquery name="insert_quote_services" datasource="jrgm">
                #PreserveSingleQuotes(SQLOutput)#
            </cfquery>
        </cfif>
        
        <cfquery name="get_quote_materials" datasource="jrgm">
            SELECT * FROM quote_materials
            WHERE opportunity_id=#get_quote_start.opportunity_id#
        </cfquery>
        <cfif get_quote_materials.recordcount GT 0>
            <cfset quote_materials_data = QueryToStruct(get_quote_materials)>
            <cfset quote_materials_data = quote_materials_data[1]>
            <cfset quote_materials_data.quote_id = ''>
            <cfset quote_materials_data.opportunity_id = new_opportunity_id>
            <cfset quote_materials_data.user_id = SESSION.userid>
            <cfset quote_materials_fields_raw = get_quote_materials.getMetaData().getColumnLabels()>
            <cfset SQLOutput = getSQLToDuplicateRow('quote_materials', quote_materials_data, quote_materials_fields_raw)>
            <!---cfoutput>
                #SQLOutput#
            </cfoutput--->
            <cfquery name="insert_quote_materials" datasource="jrgm">
                #PreserveSingleQuotes(SQLOutput)#
            </cfquery>
        </cfif>

        <cfquery name="get_quote_services_dimensions" datasource="jrgm">
            SELECT * FROM quote_services_dimensions
            WHERE quote_start_id=#get_quote_start.ID#
        </cfquery>
        <cfif get_quote_services_dimensions.recordcount GT 0>
            <cfset quote_services_dimensions_data = QueryToStruct(get_quote_services_dimensions)>
            <cfset quote_services_dimensions_data = quote_services_dimensions_data[1]>
            <cfset quote_services_dimensions_data.date_created = SQLToday>
            <cfset quote_services_dimensions_data.quote_start_id = new_opportunity_id>
            <cfset quote_services_dimensions_data.date_updated = ''>
            <cfset quote_services_dimensions_fields_raw = get_quote_services_dimensions.getMetaData().getColumnLabels()>
            <cfset SQLOutput = getSQLToDuplicateRow('quote_services_dimensions', quote_services_dimensions_data, quote_services_dimensions_fields_raw)>
            <!---cfoutput>
                #SQLOutput#
            </cfoutput--->
            <cfquery name="insert_quote_services_dimensions" datasource="jrgm">
                #PreserveSingleQuotes(SQLOutput)#
            </cfquery>
        </cfif>
        <cflocation url="quote_data_entry.cfm?ID=#new_opportunity_id#">
        <cfabort>
    <cfelse>
        Oops, could not duplicate Quote where ID=<cfoutput>#form.duplicate#</cfoutput>!
        <cfabort>
    </cfif>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/glyphicons.css" rel="stylesheet" />
<link href="assets/global/plugins/bootstrap/css/glyphicons-bootstrap.css" rel="stylesheet" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css" />
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css" />
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
</div>
<!-- END HEADER SECTION -->
<div class="page-head">
  <div class="container-fluid">
    <!-- BEGIN PAGE TITLE -->
    <div class="page-title">
      <h1>JRGM Duplicate Quote </h1>
    </div>
    <!-- END PAGE TITLE -->
    <!-- BEGIN PAGE TOOLBAR -->
    <div class="page-toolbar">
      <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">JRGM Duplicate Quote </li>
      </ul>
    </div>
    <!-- END PAGE TOOLBAR -->
  </div>
</div>
<div class="page-content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
<cfquery name="get_quote_ids_started" datasource="jrgm">
SELECT     opportunity_id 
FROM  quote_services WHERE  opportunity_id =#url.ID#
</cfquery>
<cfquery name="get_quote_start" datasource="jrgm">
SELECT    ID, opportunity_id, opportunity_name, quote_data_entry_versions_ID
 FROM         quote_start  WHERE  opportunity_id =#url.ID#
ORDER by ID DESC
</cfquery>
<!--- <cfdump var="#get_quote_start#">


 --->

<form id="form_duplicate" method="post">
<input type="hidden" name="duplicate" value="<cfoutput>#get_quote_start.ID#</cfoutput>">
<table  align="center"  width="95%">
<thead>
  <tr>
    <td>&nbsp;</td>
    <!---td>Please indicate your preferences for duplicating this quote: <b><cfoutput>#get_quote_start.opportunity_name#</cfoutput></b><br /--->
    <td>Please enter the name of this quote (originally <b><cfoutput>#get_quote_start.opportunity_name#</cfoutput></b>):
    <br />
    <br />
    <input style="width: 300px" name="opportunity_name" value="<cfoutput>#htmlEditFormat(get_quote_start.opportunity_name)#</cfoutput>">
<br />
<br />
<a href="javascript:if(confirm('Duplicate this quote?')) document.getElementById('form_duplicate').submit();" class="btn btn-success" >Duplicate Quote</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="quote_data_entry.cfm?ID=<cfoutput>#url.id#</cfoutput>" class="btn btn-success" >Cancel and Go Back</a>
</td>
  </tr>
  </thead>
</table>        <!-- end outer div -->
</form>

</div>
    </div>
  </div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
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
<script src="assets/admin/pages/scripts/table-advanced2.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script>
jQuery(document).ready(function() {

   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
Demo.init(); // init demo features
   TableAdvanced.init();
   
   
});
</script>
</body>
<!-- END BODY -->
</html>
