<cfinclude template="#APPLICATION.basePath#include/init.cfm">

<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<!DOCTYPE html>

<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.2
Version: 3.6.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>JRGM | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<style type="text/css">
.no-js body .page-container-fluid .page-content .container-fluid .row .col-md-12 table tr td a {
	font-size: 1.0em
}
</style>
<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" class="init">

$(document).ready(function() {
	$('table.display').dataTable();
} );

	</script>
<!-- END THEME STYLES -->
</head>
<body>
<!-- BEGIN HEADER SECTION  -->
<div class="page-header">
  <cfinclude template="../quoting-new/header-include.cfm">
  <cfinclude template="../quoting-new/header-menu.cfm">
</div>
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container-fluid"> 
  <!-- BEGIN PAGE HEAD -->
  <div class="page-head">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE TITLE -->
      <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>
      <div class="page-title">
        <h1>Edit Quote Information</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Edit Quote Information </li>
        </ul>
      </div>
      <!-- END PAGE TOOLBAR --> 
    </div>
  </div>
  <!-- END PAGE HEAD --> 
  <!-- BEGIN PAGE CONTENT -->
  <div class="page-content">
    <div class="container-fluid"> 
      <!-- BEGIN PAGE CONTENT INNER -->
      <div class="row">
        <div class="col-md-12"> 
          <!--- ======================= Created by Ben Chan starting on 12/10/2015 ======================= ---> 
          
          <!--- ======================= handle post logic here ======================== --->
          <cfif isDefined("form.submit_form_save_quote")>
            <!--- ========================= clean the variables before putting them into the SQL query ======================== --->
            <cfset opportunity_id = int(form.opportunity_id)>
            <cfset original_opportunity_id = opportunity_id>
            <cfset duplicate_quote = 'NULL'>
            <cfset opportunity_id_original = 'NULL'>
            <cfset query_parameters = "">
            <cfset query_keys = "">
            
            <!--- ====================== build SQL insert query based on form POST variables ======================= --->
            <cfloop collection=#form# item="form_element_name">
              <cfset field_name = LCase(form_element_name)>
              <cfif field_name neq "fieldnames" && field_name neq "submit_form_save_quote" && field_name neq "opportunity_id">
                <cfset field_value = Replace(form[form_element_name], "'", "''", "ALL")>
                <cfif field_name eq "bid_amount">
                  <cfset field_value = Replace(Replace(field_value, "$", "", "ALL"), ",", "", "ALL")>
                </cfif>
                <cfif field_value eq "">
                  <cfset query_parameters = query_parameters & field_name & "=NULL" & ", ">
                  <cfelse>
                  <cfset query_parameters = query_parameters & field_name & "='" & field_value & "'" & ", ">
                </cfif>
                <cfset query_keys = query_keys & field_name & ", ">
              </cfif>
            </cfloop>

            <!---
            <cfoutput>
                UPDATE quote_start
                SET #preserveSingleQuotes(query_parameters)#
                    opportunity_id=opportunity_id
                WHERE opportunity_id=#opportunity_id#
            </cfoutput>
            <cfabort>
            --->

            <!--- ===================== Save changes to Biz quote ====================== --->
            <cfquery name="update_quote_start" datasource="jrgm">
                UPDATE quote_start
                SET #preserveSingleQuotes(query_parameters)#
                    opportunity_id=opportunity_id
                WHERE opportunity_id=#opportunity_id#
            </cfquery>

            <!--- GET CURRENT QUOTE START --->
            <cfquery name="get_quote_start" datasource="jrgm">
                SELECT ID FROM quote_start
                WHERE opportunity_id=#opportunity_id#
            </cfquery>

            <!--- ==================== Sync changes up to Insightly ================== --->
            <cfhttp url="http://#CONFIG_APISERVER_URL#external_api/insightly.php?auth=jrgmAPI!&type=syncopportunity&quote_id=#get_quote_start.ID#" method="get" result="httpResp" timeout="30">
            </cfhttp>

            <!--- ===================== now redirect to quote main page to edit this quote ======================= --->
            <cflocation url="quote_edit_opportunity.cfm?ID=#opportunity_id#">

            <cfelse>
            <!--- ======================= initialize variables ======================= --->
            <cfset branches = ArrayNew(1)>
            <cfset categories = ArrayNew(1)>
            <cfset opportunities = ArrayNew(1)>
            <cfset form_elements = ArrayNew(1)>

            <!--- ================== Get list of employees for the dropdowns =================== --->
            <cfset employees = ArrayNew(1)>
            <cfset ArrayAppend(employees, [0, ''])>
            <cfquery name="get_employees" datasource="jrgm">
            SELECT  [Employee ID] as employee_id, [Name FirstLast] AS CL_Name FROM app_employees WHERE active_record=1 AND [Employee ID]<9999 ORDER BY [First_name]
            </cfquery>
            <cfloop query="get_employees">
                <cfset ArrayAppend(employees, [get_employees.employee_id, get_employees.CL_Name & ' - ' & get_employees.employee_id])>
            </cfloop>

            <!--- ======================= initialize form elements ======================= --->
            <cfset ArrayAppend(form_elements, ['Quote Name', 'opportunity_name'])>
            <cfset ArrayAppend(form_elements, ['Opportunity State', 'state', 'opportunity_state'])>
            <cfset ArrayAppend(form_elements, ['Total Quote Amount', 'bid_amount'])>
            <cfset ArrayAppend(form_elements, ['Branch', 'branch', 'opportunity_field_1'])>
            <cfset ArrayAppend(form_elements, ['Production Manager', 'responsible_user_employee_id', 'responsible_user_employee_id'])>
            <cfset ArrayAppend(form_elements, ['Category', 'category', 'category_id'])>
            <cfset ArrayAppend(form_elements, ['Physical Location Address 1', 'opportunity_field_2'])>
            <cfset ArrayAppend(form_elements, ['Physical Location Address 2', 'opportunity_field_3'])>
            <cfset ArrayAppend(form_elements, ['City', 'opportunity_field_4'])>
            <cfset ArrayAppend(form_elements, ['State', 'opportunity_field_5'])>
            <cfset ArrayAppend(form_elements, ['Zip', 'opportunity_field_6'])>
            <cfset ArrayAppend(form_elements, ['Physical Location Phone', 'opportunity_field_7'])>
            <cfset ArrayAppend(form_elements, ['Billing Contact Name', 'opportunity_field_20'])>
            <cfset ArrayAppend(form_elements, ['Billing Contact Phone', 'opportunity_field_21'])>
            <cfset ArrayAppend(form_elements, ['Billing Contact Email Address', 'opportunity_field_22'])>
            <cfset ArrayAppend(form_elements, ['Bill To Company Name', 'opportunity_field_23'])>
            <cfset ArrayAppend(form_elements, ['Billing Address 1', 'opportunity_field_8'])>
            <cfset ArrayAppend(form_elements, ['Billing Address 2', 'opportunity_field_9'])>
            <cfset ArrayAppend(form_elements, ['Billing City', 'opportunity_field_10'])>
            <cfset ArrayAppend(form_elements, ['Billing State', 'opportunity_field_11'])>
            <cfset ArrayAppend(form_elements, ['Billing Zip', 'opportunity_field_12'])>

            <!--- ======================== opportunity_states ==================== --->
            <cfset opportunity_states = ArrayNew(1)>
            <cfset ArrayAppend(opportunity_states, ['WON', 'WON'])>
            <cfset ArrayAppend(opportunity_states, ['OPEN', 'OPEN'])>
            <cfset ArrayAppend(opportunity_states, ['LOST', 'LOST'])>
            <cfset ArrayAppend(opportunity_states, ['SUSPENDED', 'SUSPENDED'])>
            <cfset ArrayAppend(opportunity_states, ['ABANDONED', 'ABANDONED'])>
            <cfset ArrayAppend(opportunity_states, ['', 'RENEWAL'])>
            
            <!--- ======================= build an array of all possible branches by grouping all app_jobs entries by branch and then reading those values into an array ========================= --->
            <cfquery name="get_all_branches" datasource="jrgm">
        SELECT [branch] as branch
        FROM app_jobs
        WHERE branch IS NOT NULL
          AND branch NOT IN ('Corporate', 'Williamsburg')
        GROUP BY [branch]
        ORDER BY [branch]
    </cfquery>
            <cfloop query="get_all_branches">
              <cfset ArrayAppend(branches, ["#branch#", "#branch#"])>
            </cfloop>
            
            <!--- ======================= build an array of all possible categories same way ======================= ---> 
            <!---
    <cfquery name="get_all_categories" datasource="jrgm">
        SELECT [opportunity_type] as category
        FROM app_jobs
        WHERE opportunity_type IS NOT NULL
        GROUP BY [opportunity_type]
        ORDER BY [opportunity_type]
    </cfquery>
    <cfloop query="get_all_categories">
        <cfset ArrayAppend(categories, "#category#")>
    </cfloop>
    --->
            <cfset ArrayAppend(categories, ['1416003', 'Apt/Condo/Townhome'])>
            <cfset ArrayAppend(categories, ['1310514', 'HOA'])>
            <cfset ArrayAppend(categories, ['1416011', 'Hotel'])>
            <cfset ArrayAppend(categories, ['1310516', 'Industrial'])>
            <cfset ArrayAppend(categories, ['1416004', 'Institutional'])>
            <cfset ArrayAppend(categories, ['1310518', 'Multifamily'])>
            <cfset ArrayAppend(categories, ['1310519', 'Municipal'])>
            <cfset ArrayAppend(categories, ['1310515', 'Office'])>
            <cfset ArrayAppend(categories, ['1310520', 'Other'])>
            <cfset ArrayAppend(categories, ['1416005', 'Residential'])>
            <cfset ArrayAppend(categories, ['1310517', 'Retail'])>

            <!---cfinclude template="../quoting-new/include_cffunctions.cfm"--->

            <!--- GET CURRENT QUOTE START --->
            <cfquery name="get_quote_start" datasource="jrgm">
                SELECT *
                FROM quote_start
                where opportunity_id=#url.id#
            </cfquery>
            <cfif !IsDefined('get_quote_start.ID')>
                <cfoutput>
                FAILED - could not resolve ID #url.ID#
                </cfoutput>
                <cfabort>
            </cfif>
            <cfif get_quote_start.ID EQ ''>
                <cfoutput>
                FAILED - could not resolve ID #url.ID#
                </cfoutput>
                <cfabort>
            </cfif>
            <cfset quote_start = QueryToStruct(get_quote_start)>
            
            <!--- ======================= BEGIN HEADER ======================= ---> 
            
            <!--- ======================= END HEADER ======================= ---> 
            
            <!--- ========================= START OUTPUT =========================== --->
            <style>
           
            .td_left
            {
                text-align: right;
                font-weight: bold;
			    font-size:12px
            }
            .td_right
            {
                text-align: left;
			 font-size:12px
            }
            .form_input_text
            {
                width: 300px;
				padding: 3px;
				font-size:12px
            }
			
			 

		.custom-dropdown--large {
			font-size: 1.1em;
		}
		
		

		.custom-dropdown--small {
			font-size: .7em;
		}

		.custom-dropdown__select{
			font-size: inherit; /* inherit size from .custom-dropdown */
			padding: .5em; /* add some space*/
			margin: 0; /* remove default margins */
		}

		.custom-dropdown__select--white {
			background-color: #fff;
			color: #444;    
		}	
			.custom-dropdown {
				position: relative;
				display: inline-block;
				vertical-align: middle;
			}

			.custom-dropdown__select {
				padding-right: 2.5em; /* accommodate with the pseudo elements for the dropdown arrow */				
				border: 0;
				border-radius: 3px;
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;    
			}

			.custom-dropdown::before,
			.custom-dropdown::after {
				content: "";
				position: absolute;
				pointer-events: none;
			}

			.custom-dropdown::after { /*  Custom dropdown arrow */
				content: "\25BC";
				height: 1em;
				font-size: .625em;
				line-height: 1;
				right: 1.2em;
				top: 50%; margin-top: -.5em;
			}

			.custom-dropdown::before { /*  Custom dropdown arrow cover */
				width: 2em;
				right: 0; top: 0; bottom: 0;
				border-radius: 0 3px 3px 0;
			}

			.custom-dropdown__select[disabled] {
				color: rgba(0,0,0,.3);
			}

			.custom-dropdown.custom-dropdown--disabled::after {
				color: rgba(0,0,0,.1);
			}

			/* White dropdown style */
			.custom-dropdown--white::before {
				background-color: #fff;
				border-left: 1px solid rgba(0,0,0,.1);
			}

			.custom-dropdown--white::after {
				color: rgba(0,0,0,.9);
			}					

			/* Emerald dropdown style */
			

			/* FF only temporary & ugly fixes */
			/* the "appearance: none" applied on select still shows a dropdown arrow on Firefox */
			/* https://bugzilla.mozilla.org/show_bug.cgi?id=649849 */
			@-moz-document url-prefix() {
				.custom-dropdown__select 						 { padding-right: .9em }
				.custom-dropdown--large .custom-dropdown__select { padding-right: 1.3em }
				.custom-dropdown--small .custom-dropdown__select { padding-right: .5em }
			}	

        .custom-dropdown {
            margin: 10px;
            display: inline-block;
        }     
	 .table {
	width: 95%;
	max-width: 95%;
	margin-bottom: 0px;
	padding-left: 5px;
   
  
}
 
 	
        </style>
            <cfif IsDefined("url.ID")>
              <cfset initial_opportunity = StructNew()>
              <cfif IsDefined('insightly_response.obj')>
                <cfset initial_opportunity = insightly_response.obj>
                <cfset initial_opportunity.job_id = ''>
                <cfset initial_opportunity.project_id = ''>
              </cfif>

              <form name="form_create_quote" method="post" onSubmit="return confirm('Save changes to this quote?')">
                <input type="hidden" name="opportunity_id" value="<cfoutput>#url.ID#</cfoutput>">
                <table class="table table-striped" border="1" cellpadding="1" cellspacing="0" bordercolor="#C0C0C0" bordercolorlight="White">
                  <tbody>
                    <cfloop from="1" to="#arrayLen(form_elements)#" index="i">
                      <cfset form_element = form_elements[i]>
                      <cfset form_label = form_element[1]>
                      <cfset form_input = form_element[2]>
                      <tr>
                        <td class="td_left"  style="font-size:12px"><cfoutput>#form_label#</cfoutput>: </td>
                        <td class="td_right"><cfset select_options = []>
                          <cfif form_input eq 'branch'>
                            <cfset select_options = branches>
                            <cfset form_input = form_element[3]>
                          </cfif>
                          <cfif form_input eq 'responsible_user_employee_id'>
                            <cfset select_options = employees>
                            <cfset form_input = form_element[3]>
                          </cfif>
                          <cfif form_input eq 'category'>
                            <cfset select_options = categories>
                            <cfset form_input = form_element[3]>
                          </cfif>
                          <cfif form_input eq 'state'>
                            <cfset select_options = opportunity_states>
                            <cfset form_input = form_element[3]>
                          </cfif>
                          <cfif arrayLen(select_options) neq 0>
                            <select id="<cfoutput>#form_input#</cfoutput>" name="<cfoutput>#form_input#</cfoutput>" style="font-size:12px">
                              <cfloop from="1" to="#arrayLen(select_options)#" index="i">
                                <cfset value = "">
                                <cfif structKeyExists(initial_opportunity, form_input) AND initial_opportunity[form_input] EQ select_options[i][1]>
                                  <cfset value = ' selected="selected"'>
                                </cfif>
                                <option value="<cfoutput>#select_options[i][1]#</cfoutput>"<cfoutput>#value#</cfoutput>> <cfoutput>#select_options[i][2]#</cfoutput> </option>
                              </cfloop>
                            </select>
                            <cfelse>
                            <cfset value = "">
                            <cfif structKeyExists(initial_opportunity, form_input)>
                              <cfset value = initial_opportunity[form_input]>
                              <cfif IsNull(initial_opportunity[form_input]) OR initial_opportunity[form_input] EQ 'null'>
                                <cfset value = ''>
                              </cfif>
                            </cfif>
                            <input id="<cfoutput>#form_input#</cfoutput>" name="<cfoutput>#form_input#</cfoutput>" class="form_input_text" value="<cfoutput>#value#</cfoutput>">
                          </cfif></td>
                      </tr>
                    </cfloop>
                  </tbody>
                </table>
                <br />
                <center>
                  <input name="submit_form_save_quote" type="submit" value="Save Quote"  class="btn btn-primary" >
                </center>
              </form>
            </cfif>

            <script>
                var initial_element;
                <cfloop from="1" to="#arrayLen(quote_start)#" index="i">
                    <cfloop collection=#quote_start[i]# item="field">
                        <cfset field_lowercase = LCase(field)>
                        <cfoutput>
                            initial_element = document.getElementById('#field_lowercase#');
                            if (initial_element)
                            {
                                initial_element.value = '#replace(quote_start[i][field], "'", "\'", 'ALL')#';
                            }
                        </cfoutput>
                    </cfloop>
                </cfloop>
            </script>
            <!--- ========================= END OUTPUT =========================== ---> 
            
            <!--- ======================= BEGIN FOOTER ======================= ---> 
            
            <!--- ======================= END FOOTER ======================= --->
          </cfif>
        </div>
      </div>
    </div>
    <!-- END PAGE CONTENT --> 
  </div>
  <!-- END PAGE CONTAINER --> 
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- BEGIN FOOTER -->
<cfinclude template="../quoting-new/footer-include.cfm">
<!-- END FOOTER -->
<div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
<!-- END FOOTER --> 
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 
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
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
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
<script src="assets/admin/pages/scripts/table-advanced2.js"></script> 
<script src="assets/admin/pages/scripts/dropdown-header-menu.js"></script> 
<script>
jQuery(document).ready(function() {       
   Metronic.init(); // init metronic core components
Layout.init(); // init current layout
   TableAdvanced.init();
});
</script>
</body>
<!-- END BODY -->
</html>