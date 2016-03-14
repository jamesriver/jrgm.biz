<!--- <cfif  NOT IsDefined("form.BRANCH_NAME")>
  <cfparam name=" form.BRANCH_NAME" default="choose" >
</cfif> --->
 
  <cfif IsDefined("SESSION.BRANCH") AND   IsDefined("form.Job_ID") >
 <cflocation url="job_labor_materials.cfm?job_id=#form.Job_ID#">
 </cfif>
<cfif IsDefined("SESSION.BRANCH")  >
  <cfquery name="get_branch_jobs" datasource="jrgm"  >
SELECT [Job ID] AS job_id, [Wk Loc ID], [Wk Location Name] AS job_name, [Service Address], [Service Address2], [Service City], [Service State], [Service Zip],  
                  active_record,  branch
FROM         app_jobs_all
WHERE branch =  '#SESSION.BRANCH#'   
 ORDER by  job_name ASC
</cfquery>
</cfif>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
$('#selectElementId').change(
    function(){
         $(this).closest('form').trigger('submit');
         /* or:
         $('#formElementId').trigger('submit');
            or:
         $('#formElementId').submit();
         */
    });</script>
 <style type="text/css">
input {
	text-align:left;
	font: bold 18px Arial, Helvetica, sans-serif;
	color: #333333;
	padding: 4px 6px 3px 6px;
}
input2 {
	text-align:right;
	font: bold 16px Arial, Helvetica, sans-serif;
	color: #333333;
	padding: 4px 3px 3px 3px;
}
.arialfont {
	font: normal 1.0em Arial, Helvetica, sans-serif;
}
.arialfontb {
	font: bold 1.5em Arial, Helvetica, sans-serif;
}
.arialfontc {
	font: normal 1em Arial, Helvetica, sans-serif;
	color: #333333;
}
.arialfontd {
	font: normal 20px Arial, Helvetica, sans-serif;
	color: #333333;
}
.arialfontred {
	font: italic .7em Arial, Helvetica, sans-serif;
	color: red;
}
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
       <table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap="nowrap"><span class="header">Job Materials &amp; Labor Detail</span></td>
 <td align="right"><img src="images/clear.png" width="100" height="1" />
  <!---    <a href="select_branch_j.cfm" class="bluebutton">Choose Another Branch or Job</a> ---></td>  </tr>
</table>
         <form class="css_form"  action="select_branch_j.cfm"  method="post">
          <table border="0" cellpadding="0" cellspacing="0">
        
            <!---  <cfif IsDefined("SESSION.BRANCH")  AND  form.BRANCH_NAME EQ 'Choose' > 
             <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right">Choose Branch&nbsp;:</td>
              <td class="statusTD_right"><div class="stylededit-select">
                  <select name="BRANCH_NAME"   onchange='this.form.submit()'>
                    <option value="Choose"   
<cfif  form.BRANCH_NAME EQ 'Choose'> selected="selected"</cfif>>Choose Branch</option>
                    <option value="Charlottesville"   
<cfif  form.BRANCH_NAME EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <option value="Chesterfield"   
<cfif  form.BRANCH_NAME EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <option value="Newport News"   
<cfif  form.BRANCH_NAME EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth"   
<cfif  form.BRANCH_NAME EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond"   
<cfif  form.BRANCH_NAME EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                    <option value="Williamsburg"   
<cfif  form.BRANCH_NAME EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
                  </select>
                </div></td>
            </tr> --->
     <!---    <cfelse> --->
             <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right">Branch :  </td>
              <td class="statusTD_right"><cfoutput># SESSION.BRANCH#</cfoutput></td>
            </tr>
     <!---        </cfif> --->
          
            
            <cfif IsDefined("SESSION.BRANCH")  >
              <tr>
                <td nowrap="nowrap" class="statusTD_right" align="right">Choose Job : </td>
                <td class="statusTD_right"><div class="stylededit-select">
                    <select name="Job_ID" >
                      <cfoutput query="get_branch_jobs">
                        <option value="#Job_ID#" 
		   <cfif IsDefined("form.Job_ID") AND form.Job_ID EQ #Job_ID#>selected="selected"</cfif>>#job_name# </option>
                      </cfoutput>
                    </select>
                  </div></td>
              </tr>
               <tr>
                <td>&nbsp;</td>
                <td align="right"><br />
                  <input type="hidden"  name="submitted" value="yes"/>
      <input type="submit" value="Get Job Information" name="submit" class="bluebutton">
                 </td>
              </tr>
            </cfif>
          </table>
        </form>
     </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
