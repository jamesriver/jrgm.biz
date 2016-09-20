<cfinclude template="../quoting-new/include_cffunctions.cfm">

<cfif IsDefined('form.item_0_name') AND IsDefined('form.item_0_price')>
    <cfquery name="get_quote_materials_cost" datasource="jrgm">
        INSERT INTO quote_materials_cost
        (Item_ID, Item_Cost)
        VALUES ('#Replace(form.item_0_name, "'", "''", "ALL")#', '#form.item_0_price#')
    </cfquery>
    <cfoutput>
        <script>alert('#Replace(form.item_0_name, "'", "\'", "ALL")# @ $#form.item_0_price# was added.'); window.location='quote_materials_admin.cfm';</script>
    </cfoutput>
    <cfabort>
</cfif>

<cfquery name="get_quote_data_entry_row" datasource="jrgm">
    SELECT row_defaultvalue FROM quote_data_entry_row WHERE quote_data_entry_headers_ID=8 AND row_defaultvalue IS NOT NULL
</cfquery>

<cfset materials_in_quoting = StructNew()>
<cfloop query="get_quote_data_entry_row">
    <cfset materials_in_quoting[row_defaultvalue] = 1>
</cfloop>

<cfquery name="get_quote_materials_cost" datasource="jrgm">
    SELECT * FROM quote_materials_cost
    ORDER BY Item_ID
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#SESSION.access_role#</cfoutput></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
.red {
	font: 13px;
	color: red;
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: bold
}
.black {
	font: 13px;
	color: black;
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: bold
}
</style>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<b>INSTRUCTIONS</b>: Change a value, then click outside the box to tell the system to save it.  Refresh the screen periodically to make sure changes have been saved.<br /><br />
<i>NOTE: Job Costing calculations will immediately be affected as soon as any values are changed here.</i><br /><br />

<cfoutput>
    <table cellspacing="0" cellpadding="3">
        <thead>
            <th>Material Item ID</th>
            <th>Cost per Unit</th>
        </thead>
        <tbody>
            <form method="post">
            <tr style="background-color: ##0000AA; color: ##FFFFFF">
                <td><input id="item_0_name" name="item_0_name" style="width: 100%" placeholder="Spelling must be EXACT"></td>
                <td>$<input id="item_0_price" name="item_0_price" size="4" placeholder="X.XX">
                    <input type="submit" value="Add Material">
                </td>
            </tr>
            </form>
            <cfset alternator = 0>
            <cfloop query="get_quote_materials_cost">
                <cfset alternator = 1 - alternator>
                <tr<cfif alternator EQ 1> bgcolor="##e5e5e5"</cfif><cfif Item_Cost EQ 0> style="color: ##AA0000"</cfif>>
                    <td>#Item_ID#</td>
                    <td>$<input id="item_#ID#" size="4" value="#NumberFormat(Item_Cost, ".__")#" onChange="saveInput(this.id, this.value)"></td>
                </tr>
            </cfloop>
        </tbody>
    </table>
</cfoutput>

<script>
    function saveInput(full_id, value)
    {
        var id = full_id.replace('item_', '');
        $.ajax({
            url: 'quote_materials_admin_save.cfm',
            type: 'post',
            data: { 'id': id, 'value': value },
            success: function(data) {
            }
        });
    }
  </script>

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
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>