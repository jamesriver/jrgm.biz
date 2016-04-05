<cfinclude template="../quoting-new/include_cffunctions.cfm">
<cfinclude template="../admin/include_sql_quote_data_entry_row.cfm">
<cfset columnList = "1,3,4,6,8,9,10,18,23">

<!--- BEGIN OUTPUT --->
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
<cfoutput>
    <center>
        <b>NOTE:</b>&nbsp;Changes made to this page are saved every time you click outside of an input box after editing it.<br />
        However, the Quoting system will not create a new Version until you click the button below.
        <br /><br />
        <a href="quote_data_entry_row_maria_preview.cfm"><input type="button" value="Preview New Version of Quoting Calculations"></a>
        <br /><br />
        <i>Last version created is ID #version_ID# on #dateformat(version_date_created, "mm/dd/yyyy")#</i>
        <br /><br />
    </center>
</cfoutput>
<form method="post">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
          <thead>
            <tr>
                <cfloop from="1" to="#arrayLen(quote_column_headers_temp)#" index="i">
                    <cfif ListFind(columnList, quote_column_headers_temp[i].ID) NEQ 0>
                        <cfoutput>
                            <th align="left">(#quote_column_headers_temp[i].ID#) #quote_column_headers_temp[i].column_name#</th>
                        </cfoutput>
                    </cfif>
                </cfloop>
            </tr>
          </thead>
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array_temp)#" index="wrapi">
                <cfset quote_row_index = row_order_array_temp[wrapi]>
                <tr>
                    <cfloop from="1" to="#arrayLen(quote_rows_temp[quote_row_index])#" index="i">
                        <cfset current_row = quote_rows_temp[quote_row_index][i]>
                        <cfset current_column = quote_column_headers_temp[quote_column_ID_index_temp[current_row.quote_data_entry_headers_ID]]>
                        <cfif ListFind(columnList, current_column.ID) NEQ 0>
                            <td>
                                <table border="1">
                                <cfloop collection=#current_row# item="quote_row_field">
                                    <cfif quote_row_field EQ 'quote_services_field' OR quote_row_field EQ 'row_formula' OR quote_row_field EQ 'row_defaultvalue'>
                                        <cfoutput>
                                        <tr>
                                            <td>#quote_row_field#</td>
                                            <td><input<cfif quote_row_field EQ 'quote_services_field' OR ((quote_row_field EQ 'row_formula' OR quote_row_field EQ 'row_defaultvalue') AND current_row[quote_row_field] EQ '')> disabled="true"</cfif> name="#current_row.ID#_#quote_row_field#" value="#htmlEditFormat(current_row[quote_row_field])#" onChange="saveInput(#current_row.ID#, '#quote_row_field#', this.value)"></td>
                                        </tr>
                                        </cfoutput>
                                    </cfif>
                                </cfloop>
                                </table>
                            </td>
                        </cfif>
                    </cfloop>
                </tr>
            </cfloop>
          </tbody>
        </table>
      </td>
    </tr>
  </table>
<!---input type="hidden" name="submitted" value="1">
<input type="submit" value="Save Changes"--->
</form>

  <script>
    function saveInput(id, field, value)
    {
        $.ajax({
            url: 'quote_data_entry_row_admin_save.cfm',
            type: 'post',
            data: { 'id': id, 'field': field, 'value': value },
            success: function(data) {
            }
        });
    }
  </script>
<!--- END OUTPUT --->

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