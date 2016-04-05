<cfinclude template="../quoting-new/include_cffunctions.cfm">
<cfinclude template="../admin/include_sql_quote_data_entry_row.cfm">

<cfif IsDefined('form.submitted')>
    <cfquery name="create_new_version" datasource="jrgm">
        INSERT INTO quote_data_entry_versions
        (date_created, cache_quote_data_entry_headers, cache_quote_data_entry_row)
        VALUES (
            GETUTCDATE(),
            <cfqueryparam value="#ToBase64(SerializeJSON(quote_column_headers_temp))#"     CFSQLType="CF_SQL_TEXT">,
            <cfqueryparam value="#ToBase64(SerializeJSON(quote_rows_raw_temp))#"     CFSQLType="CF_SQL_TEXT">
        )
    </cfquery>
    <cflocation url="quote_data_entry_row_maria.cfm">
</cfif>

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
    <b>NOTE:</b>&nbsp;If published, the following changes will become effective for all future quotes.
    <br /><br />
</cfoutput>
<cfset foundonechange = 0>
<form method="post" onSubmit="return confirm('Create a new version?  All future quotes will start with these new values by default.')">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table class="table table-striped">
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfset foundone = 0>
                <cfset quote_row_index = row_order_array[wrapi]>
                <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                    <cfset current_row = quote_rows[quote_row_index][i]>
                    <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                    <cfloop collection=#current_row# item="quote_row_field">
                        <cftry>
                            <cfif current_row[quote_row_field] NEQ quote_rows_temp[quote_row_index][i][quote_row_field]>
                                <cfset foundone = 1>
                                <cfset foundonechange = 1>
                            </cfif>
                        <cfcatch>
                        </cfcatch>
                        </cftry>
                    </cfloop>
                </cfloop>

                <cfif foundone EQ 1>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <cfset current_row = quote_rows[quote_row_index][i]>
                        <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                        <cfset service_name_index = 1>
                        <cfset material_name_index = 8>
                        <cfset row_label = quote_rows[quote_row_index][service_name_index]['row_defaultvalue']>
                        <cfif i GT 7 AND quote_rows[quote_row_index][material_name_index]['row_defaultvalue'] NEQ ''>
                            <cfset row_label = row_label & ' > ' & quote_rows[quote_row_index][material_name_index]['row_defaultvalue']>
                        </cfif>
                        <cfset row_label = row_label & ' [' & current_column.column_name & ']'>
                        <cfloop collection=#current_row# item="quote_row_field">
                            <cftry>
                                <cfif current_row[quote_row_field] NEQ quote_rows_temp[quote_row_index][i][quote_row_field]>
                                    <cfoutput>
                                    <tr>
                                        <td align="right"><b>#row_label#</b>:</td>
                                        <td>
                                            #current_row[quote_row_field]# => #quote_rows_temp[quote_row_index][i][quote_row_field]#
                                        </td>
                                    </tr>
                                    </cfoutput>
                                </cfif>
                            <cfcatch>
                            </cfcatch>
                            </cftry>
                        </cfloop>
                    </cfloop>
                </cfif>
            </cfloop>
          </tbody>
        </table>
      </td>
    </tr>
  </table>
</br />
<cfif foundonechange EQ 1 OR IsDefined('url.force')>
    <input type="hidden" name="submitted" value="1">
    <input type="submit" value="Publish This Version">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</cfif>
<a href="quote_data_entry_row_maria.cfm"><input type="button" value="Cancel and Go Back"></a>
</form>
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