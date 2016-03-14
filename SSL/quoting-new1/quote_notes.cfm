<!--- <cfset tempvariable = StructClear(session)>  
 --->
 
<!--- Fix the edit
 output to print page
 
 <cfabort>--->


 <cfif IsDefined("deleteme")  AND deleteme  EQ 'yes'>
  <cfquery name="delete_quote_notes" datasource="jrgm">
DELETE  FROM quote_notes WHERE   ID =#url.note_id#
 </cfquery>
</cfif>

 <cfif IsDefined("form.addanewnote")>
   <cfquery name="add_quote_notes" datasource="jrgm">
 INSERT INTO quote_notes (opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date) 
 VALUES (#form.opportunity_id_original#,'#form.opportunity_id#','#form.duplicate_quote#',#SESSION.userid#,'#form.note_body#',CURRENT_TIMESTAMP)
 </cfquery>
  </cfif>
  
   <cfif IsDefined("form.editanote")>
     <cfquery name="add_quote_notes" datasource="jrgm">
   DELETE  FROM quote_notes WHERE   ID =#form.note_id#
    </cfquery>
   <cfquery name="add_quote_notes" datasource="jrgm">
 INSERT INTO quote_notes (opportunity_id, opportunity_id_original, duplicate_quote, user_id, note_body, note_date) 
 VALUES (#form.opportunity_id_original#,'#form.opportunity_id#','#form.duplicate_quote#',#SESSION.userid#,'#form.note_body#',CURRENT_TIMESTAMP)
 </cfquery>
  </cfif>
  
  
<cfset todayDate = DateFormat(Now(),"mm/dd/yyyy")>
<cfquery name="get_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  opportunity_id_original=#url.opportunity_id_original#
 </cfquery>
 
 
<cfquery name="get_quote_info" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount, 
opportunity_field_1 AS q_branch, 
opportunity_field_18 AS q_start_date ,
opportunity_field_19 AS q_end_date, 
stage_id, 
date_created_utc, 
bid_currency, 
bid_type, 
bid_duration, 
pipeline_id, 
opportunity_field_2 AS q_address1, 
opportunity_field_3 AS q_address2, 
opportunity_field_4 AS q_city, 
opportunity_field_5  AS q_address_state, 
opportunity_field_6 AS q_address_zip, 
opportunity_field_14 AS q_opportunity_type  ,
OPPORTUNITY_status ,
date_updated_utc, 
date_due_utc,
date_quote_started,
date_quote_updated
FROM         quote_start
where opportunity_id  =#url.opportunity_id#
</cfquery>
<cfquery name="get_quote_main" datasource="jrgm">
SELECT    ID, date_created, gross_margin, opportunity_id, date_updated,  contract_start_date, contract_end_date, contract_installments, 
 duplicate_quote, opportunity_id_original, quote_approved, total_contract_price
FROM         quote_main
where opportunity_id  =#url.opportunity_id#
</cfquery>
<!--- <cfdump var="#get_quote_start#">
 --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
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
      <h1>JRGM Quote Notes</h1>
    </div>
    <!-- END PAGE TITLE -->
    <!-- BEGIN PAGE TOOLBAR -->
    <div class="page-toolbar">
      <ul class="page-breadcrumb breadcrumb">
        <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
        <li class="active">JRGM Quote Notes</li>
      </ul>
    </div>
    <!-- END PAGE TOOLBAR -->
  </div>
</div>
<div class="page-content">
<div class="container-fluid">


<cfif IsDefined("url.newnote") >
 <div class="note note-info">
<h2>Add a note for <cfoutput>#get_quote_info.opportunity_name#</cfoutput></h2>
<br />
<form  action="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#</cfoutput>"  method="post">
   <textarea id="textarea" class="form-control"   rows="10"  name="note_body" placeholder=""></textarea>
       <br />
<br />
<cfoutput>
<input type="hidden"  name="opportunity_id" value="#url.opportunity_id#"/>
  <input type="hidden"  name="opportunity_id_original" value="#url.opportunity_id_original#"/>
  <input type="hidden"  name="duplicate_quote" value="0"/>
</cfoutput>
 <input type="hidden"  name="addanewnote" value="yes"/>
<input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" />
 </form>
</div>
      <cfabort>
    </cfif>
    
<cfif IsDefined("url.editme") >
  <cfquery name="get_this_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  ID = #url.note_id#
 </cfquery>
 <div class="note note-info">
<h2>Edit a note for <cfoutput>#get_quote_info.opportunity_name#</cfoutput></h2>
<br />
<form  action="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#</cfoutput>"  method="post">
  <cfoutput>
    <textarea id="note_body" class="form-control"   rows="10"  name="note_body" placeholder="">#get_this_quote_notes.note_body#</textarea>
  </cfoutput><br />
<br />
<cfoutput>
<input type="hidden"  name="opportunity_id" value="#url.opportunity_id#"/>
  <input type="hidden"  name="opportunity_id_original" value="#url.opportunity_id_original#"/>
  <input type="hidden"  name="duplicate_quote" value="0"/>
  <input type="hidden"  name="note_id" value="#url.note_id#"/>
</cfoutput>
 <input type="hidden"  name="editanote" value="yes"/>
<input type="submit" name="submit"   value="SUBMIT" class="btn btn-primary" />
 </form>
</div>
      <cfabort>
    </cfif>
 <cfif IsDefined("deleteme") AND deleteme EQ 'notsure' >
<div class="portlet-body">
	<div class="note note-info">
<p>
 	<h4>Are you sure you want to delete this note?</h4></p> <br />
  <cfquery name="get_this_quote_notes" datasource="jrgm">
 SELECT     *  
 FROM         quote_notes WHERE  ID = #url.note_id#
 </cfquery>
  <cfoutput><i> #get_this_quote_notes.note_body#</i></cfoutput><br />
<br />
<br />

<cfoutput> <a href="quote_notes.cfm?deleteme=yes&opportunity_id_original=#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#&note_id=#get_quote_notes.id#" class="btn btn-primary">Yes</a>&nbsp;&nbsp; &nbsp; <a href="quote_notes.cfm?opportunity_id_original=#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#"  class="btn btn-primary">No</a></cfoutput></span>
</div>
 		</div>
 <cfabort>
    </cfif> 
    
  <cfif IsDefined("deleteme")  AND deleteme  EQ 'yes'>
  <div class="alert alert-danger">
	<strong>The note has been deleted!</strong>
	</div>
</cfif>
 
    <div class="container-table">
    <!---  <div class="left-table">--->
      <cfoutput query="get_quote_info">
        <table class="table"   width="95%">
          <tr>
            <td><strong>Quote ID : #opportunity_id# 
            &nbsp;&nbsp;&nbsp;Branch : #q_branch#</strong></td>
           
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
           <td  nowrap="nowrap"><strong>Date Opportunty Created : #dateformat(date_created_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Date Opportunty Modified : #dateformat(date_updated_utc,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
         
          </tr>
          <tr>
              <td  nowrap="nowrap"><strong>Customer : #opportunity_name#</strong></td>
           
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          <td><strong>Date Quote Created : #dateformat(date_quote_started,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td><strong>Date Quote Modified : #dateformat(date_quote_updated,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
          
          </tr>
          <tr>
            <td  nowrap="nowrap"><strong>Job Location :  #q_address1#, #q_city#, #q_address_state#, #q_address_zip#</strong></td>
           
            <td>&nbsp;</td>
          
            <td>&nbsp;</td>
            <td  nowrap="nowrap"><strong>Annual Contract Price :  $#NumberFormat(get_quote_main.total_contract_price,"99,999,999")#</strong></td>
            <td>&nbsp;</td>
            <cfif  get_quote_main.contract_installments GT  0>
              <cfset  total_contract_price_monthly =  get_quote_main.total_contract_price/get_quote_main.contract_installments>
              <cfelse>
              <cfset  total_contract_price_monthly =  "">
            </cfif>
            <td nowrap="nowrap"><strong>Monthly Contract Price :  $#NumberFormat(total_contract_price_monthly,"99,999,999.99")#</strong></td>
            <td>&nbsp;</td>
              
          </tr>
          <tr>
            <td> <strong>Estimator : #SESSION.screenname#</strong></td>
             <td>&nbsp;</td> 
            <td>&nbsp;</td>
        <td  nowrap="nowrap"><strong>Contract Start Date : #dateformat(get_quote_main.contract_start_date,"mm/dd/yyyy")#</strong></td>
            <td>&nbsp;</td>
            <td nowrap="nowrap"   colspan="2"  align="left"><strong>Contract End Date : #dateformat(get_quote_main.contract_end_date,"mm/dd/yyyy")# &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Installments : #get_quote_main.contract_installments#</strong></td>
          </tr>
          <tr>
            <td><strong>Quote Status : #opportunity_state# </strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            
          
            <td></td>
          </tr>
        </table>
        </cfoutput>
     <!---   </div>--->
        </div>
      <div class="clearfix"></div>
      
     <a href="quote_notes.cfm?opportunity_id_original=<cfoutput>#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#</cfoutput>&newnote=yes" class="btn btn-primary">Add Notes</a>
      <a href="quote_data_entry.cfm?ID=<cfoutput>#url.opportunity_id#</cfoutput>" class="btn btn-primary green">Go back to Quote</a>
      <h1>Quote Notes</h1>  
      <br />
      <CFIF get_quote_notes.recordcount EQ 0>There are not any notes for this quote.
      <cfelse>
   <table class="table">
  <tbody>
    <tr>
      <td>Date</td>
      <td>Note</td>
      <td>Edit</td>
      <td>Delete</td>
    </tr>
    <cfoutput query="get_quote_notes"> 
    <tr>
      <td><span class="date">#dateformat(Note_Date,"mm/dd/yy")#</span></td>
      <td>#note_body#</td>
      <td><a href="quote_notes.cfm?note_id=#get_quote_notes.id#&editme=yes&opportunity_id_original=#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#">Edit</a></td>
      <td> <a href="quote_notes.cfm?note_id=#get_quote_notes.id#&deleteme=notsure&opportunity_id_original=#url.opportunity_id_original#&opportunity_id=#url.opportunity_id#">Delete</a></td>
    </tr>
	</cfoutput>
  </tbody>
</table> 



  
</CFIF>

        <!-- end outer div -->
      </div>
</div>
  </div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<cfinclude template="footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<p><!-- END FOOTER -->
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
     UIToastr.init();
   
   
});
</script>
 
</body>
<!-- END BODY -->
</html>


 