<cfif  NOT IsDefined("form.BRANCH_NAME")>
  <cfparam name=" form.BRANCH_NAME" default="choose" >
</cfif>
<cfparam  name="Session.PTO_Date" default=""  >
<cfparam  name="form.PTO_Date" default=""  >
<cfparam  name="Session.pto_hours" default=""  >
<cfparam  name="form.pto_hours" default=""  >
<cfif IsDefined("form.BRANCH_NAME") AND  form.BRANCH_NAME NEQ 'Choose'  AND pto_date NEQ "">
  <cfquery name="get_branch_employees" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE branch IN ('#form.BRANCH_NAME#')  AND    active_record = 1  
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
</cfif>
<cfif IsDefined("form.submitted")  AND  NOT  IsDefined("form.review")>
  <cfif BRANCH_NAME EQ 'Richmond' >
    <CFSET branchcode =10>
    <cfelseif BRANCH_NAME EQ 'Portsmouth' >
    <CFSET branchcode =20>
    <cfelseif BRANCH_NAME EQ 'Charlottesville' >
    <CFSET branchcode =30>
    <cfelseif BRANCH_NAME EQ 'Williamsburg' >
    <CFSET branchcode =70>
    <cfelseif BRANCH_NAME EQ 'Chesterfield' >
    <CFSET branchcode =80>
    <cfelseif BRANCH_NAME EQ 'Newport News' >
    <CFSET branchcode =90>
    <cfelse>
    <CFSET branchcode =00>
  </cfif>
  <cfquery name="insert_pto" datasource="jrgm">
   INSERT INTO payroll_pto (  employee_id,branch_code,userid,pto_hours,date_entered,pto_date)
      VALUES       ( #form.employee_id#,#branchcode#,#SESSION.userid#,#form.pto_hours#,CURRENT_TIMESTAMP, '#form.pto_date#')
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
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
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
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="header">Add PTO Time</span> </td>
    <td align="right"> <a href="payroll/payrollBetty.cfm"  class="bluebutton"> Go to  Main Payroll Page </a></td>
  </tr>
</table>

       <cfif IsDefined("form.submitted")   AND  NOT  IsDefined("form.review")>
<cfquery name="get_this_employee" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID]= #form.EMPLOYEE_ID#
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="arialfontd"><cfoutput>Your information has been submitted.<br />
                You have submitted #PTO_HOURS# PTO hours for #BRANCH_NAME# Employee #get_this_employee.fullname# (#EMPLOYEE_ID#)  for work date #DateFormat(PTO_DATE, "mmmm dd, yyyy")#.<br />
                <a href="pto_add.cfm">Go here to add more PTO time.</a></cfoutput></td>
          </tr>
        </table>
        <cfelseif IsDefined("form.submitted")   AND   IsDefined("form.review") AND pto_hours NEQ "">
        <cfquery name="get_this_employee" datasource="jrgm"  >
SELECT first_name,last_name,branch,position,[Employee ID] As employee_id,  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID]= #form.EMPLOYEE_ID#
 ORDER by  Last_name ASC,first_name ASC
</cfquery>
        <form class="css_form" action="pto_add.cfm" method="post">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right"  class="statusTD_right">PTO Date</span> : <cfoutput> #form.pto_date#</cfoutput></td>
            </tr>
            <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right"> Branch : <cfoutput> #form.BRANCH_NAME#</cfoutput></td>
            </tr>
            <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right"> Employee : <cfoutput> #get_this_employee.fullname# </cfoutput> </td>
            </tr>
            <tr>
              <td nowrap="nowrap" class="statusTD_right" align="right">PTO Hours : <cfoutput> #form.pto_hours# </cfoutput> </td>
            </tr>
            <tr>
              <td align="right"></td>
              <td align="right"><br />
                <input type="hidden"  name="submitted" value="yes"/>
                <input type="submit" name="submit"   value="SUBMIT" class="bluebutton" />
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left"><br />
                Please review and submit your information if it is correct.<br />
                If it is not correct either <a href = "javascript:history.back()">go back</a> to edit this record or <a href="pto_add.cfm">go here to start over</a>.</td>
            </tr>
          </table>
          <cfoutput>
            <input type="hidden"  name="BRANCH_NAME" value="#form.BRANCH_NAME#"/>
            <input type="hidden"  name="EMPLOYEE_ID" value="#form.EMPLOYEE_ID#"/>
            <input type="hidden"  name="PTO_DATE" value="#form.PTO_DATE#"/>
            <input type="hidden"  name="PTO_HOURS" value="#form.PTO_HOURS#"/>
          </cfoutput>
        </form>
        <cfelse>
        <form class="css_form" action="pto_add.cfm" method="post">
          <table border="0" cellpadding="0" cellspacing="0">
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME EQ 'Choose' AND pto_date EQ "">
            <tr >
              <td colspan="2" align="left"  class="arialfontred" height="30">Please choose a date and a branch to proceed</td>
            </tr>
            </cfif>
            <tr>
              <td align="right"  class="statusTD_right">Enter PTO Date</span> :</td>
              <td class="statusTD_right"><cfif  Session.pto_date EQ ""  AND form.pto_date EQ "">
                  <input type="text" id="datepicker" name="pto_date" />
                  <cfelse>
                  <input name="pto_date" type="text"    tabindex="4" size="12" maxlength="12"  <cfoutput>value="#form.pto_date#"</cfoutput> />
                </cfif>
              </td>
            </tr>
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
            <cfif IsDefined("form.BRANCH_NAME")  AND  form.BRANCH_NAME NEQ 'Choose' AND pto_date NEQ "">
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
                <td nowrap="nowrap" class="statusTD_right" align="right">PTO Hours : </td>
                <td class="statusTD_right"><div class="stylededit-select">
                    <cfif  Session.pto_hours EQ "" AND form.pto_hours EQ "">
                      <input name="pto_hours" type="text"    tabindex="4" size="4" maxlength="4"   class="input2" <cfoutput>value="#Session.pto_hours#"</cfoutput> />
                      <cfelse>
                      <input name="pto_hours" type="text"    tabindex="4" size="4" maxlength="4"    class="input2" <cfoutput>value="#form.pto_hours#"</cfoutput> />
                    </cfif>
                  </div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td align="right"><br />
                  <input type="hidden"  name="submitted" value="yes"/>
                  <cfif  NOT IsDefined("form.review") OR pto_hours EQ "">
                    <input type="submit" name="Review"   value="Review" class="bluebutton" />
                  </cfif>
                </td>
              </tr>
            </cfif>
          </table>
        </form>
      </cfif>
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
