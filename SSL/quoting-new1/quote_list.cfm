<!--- <cfset tempvariable = StructClear(session)>  
 --->
 
<!--- Changed var table = $('#sample_3'); in <script src="assets/admin/pages/scripts/table-advanced2.js"></script> to chnage default sort--->
<cfif IsDefined('form.delete_quote_ids')>
    <cfquery name="get_quote_start" datasource="jrgm">
     UPDATE quote_start
     SET date_quote_deleted=GETUTCDATE()
     WHERE ID IN (#form.delete_quote_ids#)
       AND date_quote_deleted IS NULL
    </cfquery>
     <cflocation url="quote_list.cfm" />
</cfif>

<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<cfquery name="get_quote_ids_started" datasource="jrgm">
 SELECT     opportunity_id 
 FROM         quote_services
 </cfquery>
<cfquery name="get_quote_start" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount,
 opportunity_field_1 AS q_branch, 
 opportunity_field_18 AS q_start_date ,
 opportunity_field_19 AS q_end_date,
 date_quote_started,
 date_quote_updated,
 quote_approved,biz_approved_date
 FROM         quote_start
 WHERE (
        ((stage_id >= 554741 OR stage_id IS NULL) AND (opportunity_state IN ('OPEN', '') OR opportunity_state IS NULL))
        OR (date_quote_started IS NOT NULL AND (opportunity_state IN ('OPEN', 'WON', '') OR opportunity_state IS NULL))
   )
   AND opportunity_name IS NOT NULL
   AND date_quote_deleted IS NULL
ORDER by opportunity_name ASC
</cfquery>
<!--- <cfdump var="#get_quote_start#">
 --->
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
	<style type="text/css">
.yui-tt {
	color: #444;
	font-size: 110%;
	border: 2px solid green;
	background-color: #FFF;
	padding: 10px;
	width: 250px;
}
.red {
	color: red;
	font-size: 100%;
}
.green {
	color: green;
	font-size: 100%;
}
</style>
	<!---<script type="text/javascript" language="javascript" class="init">

$(document).ready(function() {
	$('#sample_3').dataTable( {
		"order": [[ 0, "asc" ]]
	} );
} );

	</script>--->
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
          <h1>JRGM Quote List</h1>
        </div>
    <!-- END PAGE TITLE --> 
    <!-- BEGIN PAGE TOOLBAR -->
    <div class="page-toolbar">
          <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">JRGM Quote List</li>
      </ul>
        </div>
    <!-- END PAGE TOOLBAR --> 
  </div>
    </div>
<div class="page-content">
      <div class="container-fluid">
    <div class="row">
          <div class="col-md-12">
          <form id="theform" method="post" onSubmit="return validateCheckBoxes()">
        <table class="table2 table-striped table-hover" id="sample_3">
              <thead>
            <tr>
                <th  align="center">Delete?</th>
                  <th  align="left">Opportunity Name</th>
                  <th align="left">Insightly<br />
                Status</th>
                  <th align="left">Biz<br />
                Approved</th>
                  <th align="left">Start<br />
                Cont</th>
                  <th>Branch</th>
                  <th>Bid Amount</th>
                  <th><div align="center">Date <br />
                      Quote <br />
                      Created</div></th>
                  <th><div align="center">Date <br />
                      Quote <br />
                      Updated</div></th>
                  <th><div align="center">SVCS<br />
                      SUM</div></th>
                  <th><div align="center">CONTR<br />
                      TERMS</div></th>
                  <th><div align="center">DEF<br />
                      SVCS</div></th>
                  <th><div align="center">PRICE<br />
                      SHEET</div></th>
                </tr>
          </thead>
              <tbody>
            <cfoutput query="get_quote_start">

                  <tr >
                  <td align="center" nowrap="nowrap"><input type="checkbox" value="#ID#"></td>
                <td  align="left" nowrap="nowrap"  ><cftooltip
    autoDismissDelay="3000"
    hideDelay="250"
     showDelay="200"
      style="yui-tt"
    tooltip="#OPPORTUNITY_NAME# "> #opportunity_name# </cftooltip></td>
                <cfif  OPPORTUNITY_state EQ 'SUSPENDED' >
                      <CFSET OPPORTUNITY_stateX = "SUSP" >
                      <cfelse>
                      <CFSET OPPORTUNITY_stateX = "#OPPORTUNITY_state#" >
                    </cfif>
                    <cfif opportunity_state eq "">
                        <cfset OPPORTUNITY_stateX = "RENEWAL">
                    </cfif>

                <td  align="left">#OPPORTUNITY_stateX#</td>
                <td  align="left" ><div class="red">#dateformat(biz_approved_date,"mm/dd/yy")#</div></td>
                <cfif  quote_approved EQ '1'  AND OPPORTUNITY_state EQ 'Won' >
                  <td>WON</td>
                  <cfelseif   date_quote_started EQ "">
                  <td align="left"><a href="quote_data_entry1.cfm?ID=#opportunity_id#">Start</a></td>
                  <cfelse>
                  <td align="left"><a href="quote_data_entry1.cfm?ID=#opportunity_id#"  class="red">Cont &gt;</a></td>
                </cfif>
                <td align="center">#q_branch#</td>
                <cfset bid_amount_formatted = "">
                <cfif bid_amount neq "">
                    <cfset bid_amount_formatted = NumberFormat(bid_amount, "$999,999,999.99")>
                </cfif>
                <td align="center">#bid_amount_formatted#</td>
                <td align="center">#dateformat(date_quote_started,"mm/dd/yy")#</td>
                <td align="center">#dateformat(date_quote_updated,"mm/dd/yy")#</td>
                <td align="center"><a href="ServicesSummary.cfm?ID=#opportunity_id#"  target="_blank"><i class="fa fa-file-text"></i></a></td>
                <td align="center"><a href="ContractTerms.cfm?ID=#opportunity_id#"  target="_blank"><i class="fa fa-file-text"></i></a></td>
                <td align="center"><a href="definition_of_services.cfm?ID=#opportunity_id#"  target="_blank"><i class="fa fa-file-text"></i></a></td>
                <td align="center"><a href="quote_data_entry_print.cfm?ID=#opportunity_id#"  target="_blank"><i class="fa fa-file-text"></i></a></td>
              </tr>
                </cfoutput>
          </tbody>
            </table>
            <input type="submit" value="Deleted All Checked Quotes">
            <input type="hidden" id="delete_quote_ids" name="delete_quote_ids" value="">
            </form>
        <!-- end outer div -->

         <script>
            function countCheckedQuotes()
            {
                var form = document.getElementById('theform');
                var count = 0;
                for (var i = 0; i < form.elements.length; i++ ) {
                    if (form.elements[i].type == 'checkbox') {
                        if (form.elements[i].checked == true) {
                            count++;
                        }
                    }
                }
                return count;
            }

            function getQuoteIds()
            {
                var form = document.getElementById('theform');
                var arr = [];
                for (var i = 0; i < form.elements.length; i++ ) {
                    if (form.elements[i].type == 'checkbox') {
                        if (form.elements[i].checked == true) {
                            arr.push(form.elements[i].value);
                        }
                    }
                }
                return arr.join(',');
            }

            function validateCheckBoxes()
            {
                var count = countCheckedQuotes();
                if (count == 0)
                {
                    alert('Please check off at least one quote above to delete.');
                    return false;
                }

                if (confirm('Delete '+count+' checked quotes?'))
                {
                    document.getElementById('delete_quote_ids').value = getQuoteIds();
                    return true;
                }
                return false;
            }
         </script>
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
