<cfif  NOT IsDefined("form.BRANCH_NAME")>
  <cfparam name=" form.BRANCH_NAME" default="choose" >
</cfif>
 
  <cfif IsDefined("form.BRANCH_NAME") AND   IsDefined("form.EMPLOYEE_ID") >
 <cflocation url="payroll_view_employee_detail_all_select_dates.cfm?BRANCH=#form.BRANCH_NAME#&empid=#form.EMPLOYEE_ID#">
 </cfif>
<cfif IsDefined("form.BRANCH_NAME") AND  form.BRANCH_NAME NEQ 'Choose' >
  <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch IN ('#form.BRANCH_NAME#')  <!--- AND    active_record = 1   --->
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
</cfif>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
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
    <cfinclude template="../includes/subbar.cfm">
    <cfinclude template="../includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="header">Employee Payroll Detail</span> </td>
    <td align="right"> <a href="payrollBetty.cfm"  class="bluebutton"> Go to  Main Payroll Page </a></td>
  </tr>
</table>
         <form class="css_form"  action="select_branch.cfm"  method="post">
          <table border="0" cellpadding="0" cellspacing="0">
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME EQ 'Choose' >
            <tr >
              <td colspan="2" align="left"  class="arialfontred" height="30">Please choose a branch to proceed</td>
            </tr>
            </cfif>
          
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
            </tr>
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME NEQ 'Choose' >
              <tr>
                <td nowrap="nowrap" class="statusTD_right" align="right">Choose Employee : </td>
                <td class="statusTD_right"><div class="stylededit-select">
                    <select name="employee_id" >
                      <cfoutput query="get_branch_employees">
                        <option value="#employee_id#" 
		   <cfif IsDefined("form.employee_id") AND form.employee_id EQ #employee_id#>selected="selected"</cfif>>#fullname# </option>
                      </cfoutput>
                    </select>
                  </div></td>
              </tr>
               <tr>
                <td>&nbsp;</td>
                <td align="right"><br />
                  <input type="hidden"  name="submitted" value="yes"/>
                 <input type="submit" name="submit"   value="SUBMIT" class="bluebutton" />
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
<script src="../js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
