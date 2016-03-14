<cfquery name="get_quote_start" datasource="jrgm">
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
 opportunity_field_14 AS q_opportunity_type  
 FROM         quote_start
ORDER by ID ASC
</cfquery>

<!--- <cfdump var="#get_quote_start#">
 --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
    
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>


    <style type="text/css">
.dstable_l4 {
	padding: 5px;
	background-color: #fff;
	border-bottom: 1px solid #c0c0c0;	
	color: #000;
	font: normal  .75em Arial, Helvetica, sans-serif;
}
 
</style>


</head>

<body>

      <table  class="sortable" width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
         <thead>
 				<tr>
<!--- 				<td class="dstable_l4">&nbsp;</td>
 --->				
<th class="dstable_l4">ID</th>
				<th class="dstable_l4"> OPPORTUNITY ID</th>
				<th class="dstable_l4">OPPORTUNITY NAME</th>
				<th class="dstable_l4">OPPORTUNITY<br />
				  STATE</th>
				<th class="dstable_l4">ADDRESS</th>
				<th class="dstable_l4">CITY</th>
				<th class="dstable_l4">STATE</th>
				<th class="dstable_l4">ZIP</th>
				<th class="dstable_l4">BRANCH</th>
				<th class="dstable_l4">OPPORTUNITY<br />
				  TYPE</th>
				<th class="dstable_l4">START DATE</th>
				<th class="dstable_l4">END DATE</th>
				<th class="dstable_l4">STAGE_ID</th>
				<th class="dstable_l4">PIPELINE ID</th>
				<th class="dstable_l4">BID <br />
				  AMOUNT</th>
				<th class="dstable_l4">BID <br />
				  CURRENCY</th>
				<th class="dstable_l4">BID <br />
				  DURATION</th>
				<th class="dstable_l4">BID <br />
				  TYPE</th>
				<th class="dstable_l4">DATE CREATED </th>
				</tr>
                </thead>
    <tbody>
				
			<cfoutput query="get_quote_start">	
				<tr >
				<!--- <td class="query"   style="cursor:pointer;" title="click to collapse" onClick="cfdump_toggleRow_qry(this);">&nbsp;#</td> --->
 				<td class="dstable_l4">#ID#</td>
 				<td class="dstable_l4" align="center">#OPPORTUNITY_ID#</td>
 				<td class="dstable_l4">#OPPORTUNITY_NAME#</td>
 				<td class="dstable_l4" align="center">#OPPORTUNITY_STATE#</td>
 				<td class="dstable_l4">#Q_ADDRESS1#</td>
 				<td class="dstable_l4">#Q_CITY#</td>
 				<td class="dstable_l4">#Q_ADDRESS_STATE#</td>
 				<td class="dstable_l4">#Q_ADDRESS_ZIP#</td>
 				<td class="dstable_l4">#Q_BRANCH#</td>
 				<td class="dstable_l4">#Q_OPPORTUNITY_TYPE#</td>
 				<td class="dstable_l4">#dateformat(Q_START_DATE,"mm/dd/yy")#</td>
 				<td class="dstable_l4">#dateformat(Q_END_DATE,"mm/dd/yy")#</td>
 				<td class="dstable_l4" align="center">#STAGE_ID#</td>
 				<td class="dstable_l4">#PIPELINE_ID#</td>
 				<td class="dstable_l4">#BID_AMOUNT#</td>
 				<td class="dstable_l4">#BID_CURRENCY#</td>
 				<td class="dstable_l4">#BID_DURATION#</td>
 				<td class="dstable_l4">#BID_TYPE#</td>
 				<td class="dstable_l4">#dateformat(DATE_CREATED_UTC,"mm/dd/yy")#</td>
 				</tr>
			</cfoutput>
				</tbody>
</table>

<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
