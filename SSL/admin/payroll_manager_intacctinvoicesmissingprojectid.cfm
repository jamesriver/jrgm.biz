<cfinclude template="#APPLICATION.basePath#include/init.cfm">

<CFIF IsDefined("url.work_date")>
  <cfset todayDate1 = #url.work_date#>
  <cfset todaydate =#DateFormat("#todayDate1#", "yyyy-mm-dd")#>
  <cfelse>
  <cfset todayDate1 = Now()>
  <cfset todaydate =#DateFormat("#todayDate1#", "yyyy-mm-dd")#>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset pay_period_number_visible = pay_period_number>
<cfif IsDefined('url.pay_period')>
    <cfset pay_period_number_visible = url.pay_period>
</cfif>

<cfset intacct_url = 'http://' & CONFIG_APISERVER_URL & 'external_api/intacct.php?auth=jrgmAPI!&type=invoicelineitems_missing_projectid&contract'>
<cfif IsDefined('url.all')>
    <cfset intacct_url &= '&all'>
</cfif>
<cfhttp url="#intacct_url#" method="get" result="httpResp" timeout="30">
    <cfhttpparam type="header" name="Content-Type" value="application/json" />
</cfhttp>
<cfset intacct_response=DeserializeJSON(httpResp.filecontent)>

<cfset lineitems = ArrayNew(1)>
<!---cfdump var="#intacct_response#">
<cfabort--->

<cfif IsDefined('intacct_response.data')>
    <cfloop from="1" to="#arrayLen(intacct_response.data)#" index="i">
      <cfset ArrayAppend(lineitems, [intacct_response.data[i].intacct_entrydate, intacct_response.data[i].intacct_recordid, intacct_response.data[i].intacct_lineno, intacct_response.data[i].intacct_itemname, intacct_response.data[i].name, intacct_response.data[i].intacct_branch])>
    </cfloop>
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
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.arialfontbold {
	font: normal 1.2em Arial, Helvetica, sans-serif;
}
.redarial {
	padding-top: 20px;
	font: normal Arial, Helvetica, sans-serif;
	color: red;
}
td {
  padding-right: 10px;
  padding-left: 10px;
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
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="header">
            <cfoutput>
            Intacct Invoices Missing Project ID assigned to Contract
            </cfoutput>
          </td>
        </tr>
      </table>
<a href="payroll_manager_intacctinvoices.cfm"><input type="button" value="Click to switch to all departments outside of Contract"></a>
<br /><br />
<i>Log into Intacct.com, go to Order Entry > Sales Invoices, enter Document Number and click Go, click Edit, click Line Item, click Show Details blue tab, under Dimensions choose Project</i>
<br />
<br />
<b>Criteria</b>: Entry Date is within the last 30 days, Contract (Department ID=1), no Project ID associated with line item
<br />
<br />
<font color="#0000AA">NOTE: Changes may take up to 30 minutes to update in this report.</font>
<br />
<br />
<table class="sortable" border="0" cellspacing="0" cellpadding="0"   width="80%">
        <tr height="40" >
          <td><strong>Entry Date</strong></td>
          <td><strong>Document Number</strong></td>
          <td><strong>Invoice Line Number</strong></td>
          <td><strong>Description</strong></td>
          <td><strong>Customer/Project</strong></td>
          <td><strong>Branch</strong></td>
        </tr>
        <cfloop from="1" to="#arrayLen(lineitems)#" index="i">
          <cfoutput>
          <tr>
            <td>#lineitems[i][1]#</td>
            <td>#lineitems[i][2]#</td>
            <td>#lineitems[i][3]#</td>
            <td>#lineitems[i][4]#</td>
            <td>#lineitems[i][5]#</td>
            <td>#lineitems[i][6]#</td>
          </tr>
          </cfoutput>
        </cfloop>
      </table>
      <br>
      <br />
      <br />
      <br />
      <br />
      <br />
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
