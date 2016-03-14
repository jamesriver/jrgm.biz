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
<link href="assets/admin/layout3/css/custom-pat.css" rel="stylesheet" type="text/css" />
<!--<link href="css/styles.css" rel="stylesheet" type="text/css">  -->
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<style>
.bigfont {
	padding: 5px;
	background-color: #ffffff;
	border-bottom: 1px solid #c0c0c0;
	color: #000;
	font: bold .95em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .8em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: bold .9em Arial, Helvetica, sans-serif;
}
.dashboardHeader {
	margin-top: 10px;
	color: #333;
	font: bold 16px Arial, Helvetica, sans-serif;
}
ul.dashboard {
	margin-top: 4px;
	margin-left: -40px;
	margin-right: 2px;
	list-style: none; /* this removes the list marker */
}
ul.dashboard li {
	color: #006fa7;
	font: normal 14px Arial, Helvetica, sans-serif;
	padding: 4px 5px 4px 1px;
}
a {
	color: #006fa7;
	text-decoration: none;
}
a:hover {
	color: #000;
	text-decoration: none;
}
.search-td {
	padding: 10px;
	font: normal .90em Arial, Helvetica, sans-serif;
	color: #333333;
}
form {
	margin: 0 auto;
}
.search {
	padding: 7px 10px 9px 10px;
	margin: 3px;
}
input[type=text] {
	color: #333;
}
input[type=submit], input[type=submit]:hover {
	padding: 8px 20px 10px 10px;
	position: relative;
	left: -10px;
	border: 1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #16705a), color-stop(100%, #00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%, #00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%, #d5e7f3 100%); /* W3C */
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3', GradientType=0 ); /* IE6-9 */
	color: #fff;
	cursor: pointer;
}
.red {
	color: red;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
<cfif IsDefined('form.submitted')>
    <cfset row_iterator = StructNew()>
    <cfloop collection=#form# item="field">
        <cfset val = form[field]>
        <cfif val EQ ''>
            <cfset val = 'NULL'>
        <cfelse>
            <cfif !IsNumeric(val)>
                <cfset val = "'" & val & "'">
            </cfif>
        </cfif>
        <cfset splitter = field.split('_')>
        <cfset row_iterator_key = splitter[1]>
        <cfif IsNumeric(row_iterator_key)>
            <cfset row_iterator_field = ''>
            <cfloop from="2" to="#arrayLen(splitter)#" index="i">
                <cfif row_iterator_field NEQ ''>
                    <cfset row_iterator_field = row_iterator_field & '_'>
                </cfif>
                <cfset row_iterator_field = row_iterator_field & splitter[i]>
            </cfloop>
            <cfif !structKeyExists(row_iterator, row_iterator_key)>
                <cfset row_iterator[row_iterator_key] = StructNew()>
            </cfif>
            <cfif !structKeyExists(row_iterator[row_iterator_key], row_iterator_field)>
                <cfset row_iterator[row_iterator_key][row_iterator_field] = val>
            </cfif>
            <!---<cfoutput>ID #row_iterator_key#: #row_iterator_field# = #row_iterator[row_iterator_key][row_iterator_field]#</cfoutput><br />--->
        </cfif>
        <!---<cfoutput>#field# = #val#</cfoutput><br />--->
    </cfloop>

    <cfloop collection=#row_iterator# item="row">
        <cfset query_string = 'UPDATE quote_data_entry_row SET '>
        <cfset count = 0>
        <cfloop collection=#row_iterator[row]# item="field">
            <cfif count NEQ 0>
                <cfset query_string = query_string & ', '>
            </cfif>
            <cfset query_string = query_string & field & ' = ' & row_iterator[row][field]>
            <cfset count++>
        </cfloop>
        <cfset query_string = query_string & ' WHERE ID = ' & row>
        <cfquery name="update_quote_data_entry_row" datasource="jrgm">
            #preserveSingleQuotes(query_string)#
        </cfquery>
    </cfloop>
    <cflocation url="quote_data_entry_row_admin.cfm">
</cfif>

<!--- HELPER FUNCTION TO CONVERT QUERY TO STRUCT FOR EASIER USE IN HTML OUTPUT --->
<cffunction name="QueryToStruct" access="public" returntype="any" output="false"
    hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">

    <!--- Define arguments. --->
    <cfargument name="Query" type="query" required="true" />
    <cfargument name="Row" type="numeric" required="false" default="0" />

    <cfscript>
        // Define the local scope.
        var LOCAL = StructNew();
        // Determine the indexes that we will need to loop over.
        // To do so, check to see if we are working with a given row,
        // or the whole record set.
        if (ARGUMENTS.Row){
            // We are only looping over one row.
            LOCAL.FromIndex = ARGUMENTS.Row;
            LOCAL.ToIndex = ARGUMENTS.Row;
        } else {
            // We are looping over the entire query.
            LOCAL.FromIndex = 1;
            LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
        }
        // Get the list of columns as an array and the column count.
        LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
        LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
        // Create an array to keep all the objects.
        LOCAL.DataArray = ArrayNew( 1 );
        // Loop over the rows to create a structure for each row.
        for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
            // Create a new structure for this row.
            ArrayAppend( LOCAL.DataArray, StructNew() );
            // Get the index of the current data array object.
            LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
            // Loop over the columns to set the structure values.
            for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
                // Get the column value.
                LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
                // Set column value into the structure.
                LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
            }
        }
        // At this point, we have an array of structure objects that
        // represent the rows in the query over the indexes that we
        // wanted to convert. If we did not want to convert a specific
        // record, return the array. If we wanted to convert a single
        // row, then return the just that STRUCTURE, not the array.
        if (ARGUMENTS.Row){
            // Return the first array item.
            return( LOCAL.DataArray[ 1 ] );
        } else {
            // Return the entire array.
            return( LOCAL.DataArray );
        }
    </cfscript>
</cffunction>

<!--- GET QUOTE COLUMN HEADERS --->
<cfset quote_column_headers = ArrayNew(1)>
<cfquery name="get_quote_column_headers" datasource="jrgm">
    SELECT * FROM quote_data_entry_headers
    WHERE column_active=1
    AND ID IN (1,3,4,6,9,10,18)
    ORDER BY column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_column_headers = QueryToStruct(get_quote_column_headers)>
<cfset quote_column_ID_index = StructNew()>
<cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
    <cfset StructInsert(quote_column_ID_index, quote_column_headers[i].ID, i)>
</cfloop>

<!--- GET QUOTE ROWS --->
<cfquery name="get_quote_rows" datasource="jrgm">
    SELECT qder.ID, qder.row_order, qder.quote_data_entry_headers_id, qder.quote_services_field, qder.row_formula, qder.row_defaultvalue FROM quote_data_entry_row qder
    INNER JOIN quote_data_entry_headers qdeh ON qdeh.ID=qder.quote_data_entry_headers_ID
    WHERE qdeh.column_active=1
    AND qdeh.ID IN (1,3,4,6,9,10,18)
    ORDER BY qder.row_order, qdeh.column_order
</cfquery>

<!--- CONVERT QUERY INTO ARRAY OF STRUCTS --->
<cfset quote_rows_raw = QueryToStruct(get_quote_rows)>
<cfset quote_rows = StructNew()>
<cfset row_order_array = ArrayNew(1)>
<cfloop from="1" to="#arrayLen(quote_rows_raw)#" index="i">
    <cfset row_ID = quote_rows_raw[i].row_order>
    <cfif !structKeyExists(quote_rows, row_ID)>
        <cfset quote_rows[row_ID] = ArrayNew(1)>
        <cfset ArrayAppend(row_order_array, row_ID)>
    </cfif>
    <cfset ArrayAppend(quote_rows[row_ID], quote_rows_raw[i])>
</cfloop>

<!--- BEGIN OUTPUT --->
<form method="post">
<!--- ' <table width="98%" border="0" cellspacing="0" cellpadding="0">--->
 <div class="row">
      <div class="col-md-12">
        <table class="table table-striped table-hover" >
    <tr>
      <td valign="top"> <table><!---<table class="table table-striped">--->
          <thead>
           <!--- <tr>
                <cfloop from="1" to="#arrayLen(quote_column_headers)#" index="i">
                    <cfoutput>
                        <th align="left">(#quote_column_headers[i].ID#) #quote_column_headers[i].column_name#</th>
                    </cfoutput>
                </cfloop>
            </tr>--->
          </thead>
          <tbody>
            <cfloop from="1" to="#arrayLen(row_order_array)#" index="wrapi">
                <cfset quote_row_index = row_order_array[wrapi]>
                <tr>
                    <cfloop from="1" to="#arrayLen(quote_rows[quote_row_index])#" index="i">
                        <td>
                            <cfset current_row = quote_rows[quote_row_index][i]>
                            <cfset current_column = quote_column_headers[quote_column_ID_index[current_row.quote_data_entry_headers_ID]]>
                            <table border="1">
                            <cfloop collection=#current_row# item="quote_row_field">
                                <cfif quote_row_field EQ 'quote_services_field' OR quote_row_field EQ 'row_formula'  OR quote_row_field EQ 'row_defaultvalue'>
                                    <cfoutput>
                                    <tr>
                                        <td><!---#quote_row_field#---></td>
                                        <td><input<cfif quote_row_field EQ 'quote_services_field' OR ((quote_row_field EQ 'row_formula' OR quote_row_field EQ 'row_defaultvalue') AND current_row[quote_row_field] EQ '')> disabled="true"</cfif> name="#current_row.ID#_#quote_row_field#" value="#current_row[quote_row_field]#" onChange="saveInput(#current_row.ID#, '#quote_row_field#', this.value)"></td>
                                    </tr>
                                    </cfoutput>
                                </cfif>
                            </cfloop>
                            </table>
                        </td>
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
</form><br />
<br />
<br />

 </div> </div>
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

  </div>
   
<!-- END PAGE CONTAINER --> 
<!-- BEGIN FOOTER -->
 
<!-- END FOOTER -->
 
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
