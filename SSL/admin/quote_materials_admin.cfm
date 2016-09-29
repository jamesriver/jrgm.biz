<cfinclude template="../quoting-new/include_cffunctions.cfm">

<cfif IsDefined('form.delete_id') AND IsDefined('form.delete_name')>
    <cfquery name="get_quote_materials_cost" datasource="jrgm">
        DELETE FROM app_materials_list
        WHERE ID=#form.delete_id#
    </cfquery>
    <cfoutput>
        <script>alert('#Replace(form.delete_name, "'", "\'", "ALL")# was deleted.'); window.location='quote_materials_admin.cfm';</script>
    </cfoutput>
    <cfabort>
<cfelseif IsDefined('form.item_0_name') AND IsDefined('form.item_0_price')>
    <cfquery name="get_quote_materials_cost" datasource="jrgm">
        INSERT INTO quote_materials_cost
        (Item_ID, Item_Cost)
        VALUES ('#Replace(form.item_0_name, "'", "''", "ALL")#', '#form.item_0_price#')
    </cfquery>
    <cfoutput>
        <script>alert('#Replace(form.item_0_name, "'", "\'", "ALL")# @ $#form.item_0_price# was added.'); window.location='quote_materials_admin.cfm';</script>
    </cfoutput>
    <cfabort>
<cfelseif IsDefined('form.mat_0_name') AND IsDefined('form.mat_0_description') AND IsDefined('form.mat_0_sortorder')>
    <cfquery name="get_app_materials_list" datasource="jrgm">
      INSERT INTO app_materials_list
      (Item_ID, Item_description, sortid)
      VALUES ('#Replace(form.mat_0_name, "'", "''", "ALL")#', '#Replace(form.mat_0_description, "'", "''", "ALL")#', '#form.mat_0_sortorder#')
    </cfquery>
    <cfoutput>
      <script>alert('#Replace(form.mat_0_name, "'", "\'", "ALL")# was added.'); window.location='quote_materials_admin.cfm';</script>
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

<cfquery name="get_app_materials_list" datasource="jrgm">
    SELECT * FROM app_materials_list
    ORDER BY sortid
</cfquery>
<cfoutput query="get_app_materials_list">
    <cfset max_sortid = sortid>
</cfoutput>
<cfset max_sortid+=10>

<cfquery name="get_missing_materials_cost" datasource="jrgm">
    SELECT TOP 1 * FROM app_materials_list a
    LEFT JOIN quote_materials_cost q ON q.Item_ID=a.Item_ID
    WHERE q.Item_ID IS NULL
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

<form id="form_delete_material" method="post">
    <input type="hidden" id="delete_id" name="delete_id">
    <input type="hidden" id="delete_name" name="delete_name">
</form>

<cfoutput>
    <div style="float: left">
        <table cellspacing="0" cellpadding="3">
            <thead>
                <th>Material Item ID</th>
                <th>Cost per Unit</th>
            </thead>
            <tbody>
                <cfif get_missing_materials_cost.recordcount GT 0>
                    <form method="post">
                    <tr style="background-color: ##0000AA; color: ##FFFFFF">
                        <td style="pointer-events: none"><input id="item_0_name" name="item_0_name" style="width: 100%" value="<cfoutput>#Replace(get_missing_materials_cost.Item_ID, '"', '&quot;', "ALL")#</cfoutput>"></td>
                        <td>$<input id="item_0_price" name="item_0_price" size="4" placeholder="cost/unit">
                            <input type="submit" value="Add Material Cost">
                            &nbsp;<-- Fill this in as soon as possible so these materials will appear in Job Costing!
                        </td>
                    </tr>
                    </form>
                    <script>document.getElementById('item_0_price').focus()</script>
                </cfif>
                <cfset alternator = 0>
                <cfloop query="get_quote_materials_cost">
                    <cfset alternator = 1 - alternator>
                    <tr<cfif alternator EQ 1> bgcolor="##e5e5e5"</cfif><cfif Item_Cost EQ 0> style="color: ##AA0000"</cfif>>
                        <td>#Item_ID#</td>
                        <td>$<input id="item_#ID#_cost" size="4" value="#NumberFormat(Item_Cost, ".__")#" onChange="saveInput('item', 'Item_Cost', this.id, this.value)"></td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>

    <div style="float: right">
        <table cellspacing="0" cellpadding="3">
            <thead>
                <th>Material Item ID</th>
                <th>Description</th>
                <th>Order</th>
                <th>Action</th>
            </thead>
            <tbody>                
                <form method="post">
                <tr style="background-color: ##0000AA; color: ##FFFFFF">
                    <td><input id="mat_0_name" name="mat_0_name" style="width: 100%"></td>
                    <td width="350"><input id="mat_0_description" name="mat_0_description" style="width: 100%" placeholder="description here"></td>
                    <td><input id="mat_0_sortorder" name="mat_0_sortorder" size="5" placeholder="#max_sortid#"></td>
                    <td><input type="submit" value="Add Material to Daily Sheet"></td>
                </tr>
                </form>
                <script>document.getElementById('mat_0_name').focus()</script>
                <cfset alternator = 0>
                <cfloop query="get_app_materials_list">
                    <cfset alternator = 1 - alternator>
                    <tr<cfif alternator EQ 1> bgcolor="##e5e5e5"</cfif>>
                        <td>#Item_ID#</td>
                        <td><input id="mat_#ID#_description" style="width: 100%" value="#Replace(Item_description, '"', '\\"', "ALL")#" onChange="saveInput('mat', 'Item_Description', this.id, this.value)"></td>
                        <td><input id="mat_#ID#_sortorder" size="5" placeholder="#sortid#" onChange="saveInput('mat', 'sortid', this.id, this.value)">
                        <td><input type="button" value="DELETE" onClick="deleteMaterial('#Replace(Item_ID, '"', '\\"', "ALL")#', #ID#)"></td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</cfoutput>

<script>
    function saveInput(action, field, full_id, value)
    {
        var str = full_id.replace(action+'_', '');
        var spl = str.split('_');
        id = spl[0];

        $.ajax({
            url: 'quote_materials_admin_save.cfm',
            type: 'post',
            data: { 'action': action, 'field': field, 'id': id, 'value': value },
            success: function(data) {
            }
        });
    }

    function deleteMaterial(name, id)
    {
        if (!confirm('PERMANENTLY delete '+name+'?  (Job costing will still include it, but it will no longer appear as a material option.)'))
            return;

        document.getElementById('delete_id').value = id;
        document.getElementById('delete_name').value = name;
        document.getElementById('form_delete_material').submit();
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