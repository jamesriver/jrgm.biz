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
  <cfinclude template="header-include.cfm">
  <cfinclude template="header-menu.cfm">
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
        <h1>Create Quote From Opportunity</h1>
      </div>
      <!-- END PAGE TITLE --> 
      <!-- BEGIN PAGE TOOLBAR -->
      <div class="page-toolbar">
        <ul class="page-breadcrumb breadcrumb">
          <li> <a href="default.cfm">Home</a><i class="fa fa-circle"></i> </li>
          <li class="active"> Create Quote From Opportunity </li>
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
          <cfif isDefined("form.submit_form_create_quote")>
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
              <cfif field_name neq "fieldnames" && field_name neq "submit_form_create_quote" && field_name neq "opportunity_id">
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
            <cfoutput>#query_parameters#</cfoutput>
            <cfabort>
            --->

            <!--- ===================== check if this opportunity_id is already in use - if so, turn this into a duplicate quote ==================== --->
            <cfquery name="get_opportunity" datasource="jrgm">
                SELECT opportunity_id FROM quote_start
                WHERE opportunity_id=#opportunity_id#
                   OR opportunity_id_original=#opportunity_id#
                ORDER BY ID
            </cfquery>
            <cfloop query="get_opportunity">
              <cfset duplicate_quote = '1'>
              <cfset opportunity_id_original = original_opportunity_id>
              <cfset opportunity_id = 'NULL'>
            </cfloop>

            <!--- ===================== insert a new quote_start entry =================== --->
            <cfquery name="insert_quote_start" datasource="jrgm" result="result_insert_quote_start">
                INSERT INTO quote_start
                (opportunity_id, opportunity_id_original, duplicate_quote, opportunity_state)
                VALUES (#opportunity_id#, #opportunity_id_original#, #duplicate_quote#, 'OPEN')
            </cfquery>

            <!--- ===================== if this opportunity has already been converted at least once before, make this a duplicate quote with the original opportunity_id as the parent and give this an opportunity_id equal to the next available auto inc for quote_start.ID ====================== --->
            <cfquery name="update_quote_start" datasource="jrgm">
                UPDATE quote_start
                SET opportunity_id=ID
                WHERE ID=#result_insert_quote_start["GENERATEDKEY"]#
                  AND opportunity_id IS NULL AND opportunity_id_original IS NOT NULL
            </cfquery>

            <cfquery name="update_quote_start_remaining_data" datasource="jrgm">
                UPDATE quote_start
                SET #preserveSingleQuotes(query_parameters)#
                    opportunity_id=opportunity_id
                WHERE ID=#result_insert_quote_start["GENERATEDKEY"]#
            </cfquery>

            <cfquery name="get_quote_again" datasource="jrgm">
                SELECT opportunity_id FROM quote_start
                WHERE ID=#result_insert_quote_start["GENERATEDKEY"]#
            </cfquery>
            <cfloop query="get_quote_again">
                <!--- ===================== now redirect to quote main page to edit this quote ======================= --->
                <cflocation url="../quoting-new/quote_data_entry.cfm?ID=#get_quote_again.opportunity_id#">
            </cfloop>

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
            
            <!--- ====================== build an array of opportunities to be used in a dropdown later on ========================= --->
            <cfset current_opportunity_id = ''>
            <cfif IsDefined('form.opportunity_id')>
                <cfset current_opportunity_id = form.opportunity_id>
            </cfif>
            <cfhttp url="http://api.jrgm.com/external_api/insightly.php?auth=jrgmAPI!&type=opportunity&opportunity_id=#current_opportunity_id#&lowercasevariables=1" method="get" result="httpResp" timeout="30">
                <cfhttpparam type="header" name="Content-Type" value="application/json" />
            </cfhttp>
            <cfset insightly_response=DeserializeJSON(httpResp.filecontent)>

            <cfif IsDefined('insightly_response.data')>
                <cfloop from="1" to="#arrayLen(insightly_response.data)#" index="i">
                  <cfset ArrayAppend(opportunities, [insightly_response.data[i].OPPORTUNITY_ID, insightly_response.data[i].BRANCH, insightly_response.data[i].OPPORTUNITY_NAME])>
                </cfloop>
            </cfif>
            
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
            <form id="form_opportunity_select" method="post">
              <strong> Choose an initial opportunity for this quote:<br>

              <datalist id="opportunity_id_list">
                  <option value="">[ Choose Opportunity ]</option>
                  <option value="-1">[ Blank Quote ]</option>
                  <cfloop from="1" to="#arrayLen(opportunities)#" index="i">
                    <cfset opportunity = opportunities[i]>
                    <option value="<cfoutput>#opportunity[3]# [#opportunity[2]#] | Insightly ID: #opportunity[1]#</cfoutput>">
                  </cfloop>
              </datalist>

              <input type="hidden" id="opportunity_id" name="opportunity_id" value="#form.opportunity_id#">
              <input id="opportunity_id_input" name="opportunity_id_input" list="opportunity_id_list" style="width: 300px" value="" oninput="select_opportunity()" onClick="this.value='';">
              <!--
              &nbsp;&nbsp;OR&nbsp;&nbsp;
              <input type="button" value="Start with a Blank Quote instead" onClick="document.getElementById('opportunity_id').value = '-1'; document.getElementById('form_opportunity_select').submit()">
              -->
            </form>
            <br />
            <br />
            
            <!--- page stops here until the user chooses a opportunity from the dropdown --->
            <cfif IsDefined("form.opportunity_id")>
              <cfset initial_opportunity = StructNew()>
              <cfif IsDefined('insightly_response.obj')>
                <cfset initial_opportunity = insightly_response.obj>
                <cfset initial_opportunity.job_id = ''>
                <cfset initial_opportunity.project_id = ''>
              </cfif>

              <form name="form_create_quote" method="post" onSubmit="return confirm('Create this quote now?')">
                <input type="hidden" name="opportunity_id" value="<cfoutput>#form.opportunity_id#</cfoutput>">
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
                  <input name="submit_form_create_quote" type="submit" value="Create Quote"  class="btn btn-primary" >
                </center>
              </form>
            </cfif>

            <script>
                window.onload = function(){
                    document.getElementById('opportunity_id_input').focus();
                }

                function select_opportunity()
                {
                    var str = document.getElementById('opportunity_id_input').value;
                    var spl = str.split('| Insightly ID: ');
                    var id = spl[1];
                    if (id)
                    {
                        document.getElementById('opportunity_id').value = id;
                        document.getElementById('form_opportunity_select').submit();
                    }
                }
            </script>
            <!--- ========================= END OUTPUT =========================== ---> 
            
            <!--- ======================= BEGIN FOOTER ======================= ---> 
            
            <!--- ======================= END FOOTER ======================= ---> 
            
            <!---
    <cfhttp
        method="Get"
        url="http://api.jrgm.com"
        resolveurl="Yes">
    <cfoutput>
        #cfhttp.FileContent# <br>
    </cfoutput>
    --->
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
<cfinclude template="footer-include.cfm">
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