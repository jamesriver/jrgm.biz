<cfquery name="getequipment" datasource="jrgm">
SELECT * FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#' AND in_repair ='Yes'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif>
ORDER by  ID ASC
</cfquery>
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = DateFormat(Now(),"mmm-dd-yyyy")>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>
<cfset today = dateadd("d",0,somedate)>
<cfset recur = dateadd("d",50,somedate)>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfset todayDate_button = DateFormat(Now(),"mmm-dd-yyyy")>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}
.alertbox {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#F3F3F3;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#FFFFFF;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:5px 5px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}
table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
}
 table.sortable tbody td:a {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
}
 table.sortable tbody td:a:hover {
 font: bold 1em Arial, Helvetica, sans-serif;
 color: #006fa7;
 border-bottom: 1px solid #c0c0c0;
}
.eqbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:32px;
	-moz-border-radius-topleft:32px;
	border-top-left-radius:32px;
	-webkit-border-top-right-radius:32px;
	-moz-border-radius-topright:32px;
	border-top-right-radius:32px;
	-webkit-border-bottom-right-radius:32px;
	-moz-border-radius-bottomright:32px;
	border-bottom-right-radius:32px;
	-webkit-border-bottom-left-radius:32px;
	-moz-border-radius-bottomleft:32px;
	border-bottom-left-radius:32px;
	text-indent:9px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#07482f;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:168px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.eqbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}
.eqbutton:active {
	position:relative;
	top:1px;
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
      <form action="inventory_list.cfm" method="post">
        <table width="100%" border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor="#07482f"  bordercolorlight="White">
          <tr>
            <td bgcolor="#F2F7F5"><input type="text" name="criteria"  size="100"/>
              &nbsp;
              <input type="submit"  class="eqbutton" value="Search Equipment" />
            </td>
          </tr>
        </table>
      </form>
      <br />
      <div class="header"><cfoutput>#Session.branch#</cfoutput> Inventory Repair List-<cfoutput>#getequipment.recordcount#</cfoutput> Records</div>
      <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
        <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th>
            <th width="75" align="left">Equip. ID</th>
            <th width="250" align="left">Product Name</th>
            <th align="left">Color</th>
            <th align="left">Serial Number</th>
            <th align="center">Year</th>
            <th align="left">Branch</th>
            <th width="150" align="left">Description</th>
            <th align="left" nowrap="nowrap">Mechanic</th>
            <th align="right" nowrap="nowrap">Date Out</th>
            <th align="right" nowrap="nowrap">Date Exp. In</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="getequipment">
            <tr>
              <td align="center">#ID#</td>
              <td nowrap="nowrap">#Category#</td>
              <td width="75" align="left" >#Equipment_ID#</td>
              <td align="left"  width="250" ><a href="inventory_view.cfm?ID=#ID#">#Product_Name#</a></td>
              <td align="left" >#Color#</td>
              <td align="left">#Serial_Number#</td>
              <td align="center">#Equipment_Year#</td>
              <td nowrap="nowrap">#Branch_name#</td>
              <td width="150" align="left">#product_Description#</td>
              <cfif currentrow  EQ 1>
                <td align="left" nowrap="nowrap"><a href="">ABC Company</a></td>
              </cfif>
              <cfif currentrow  EQ 3>
                <td align="left" nowrap="nowrap"><a href="">In House</a></td>
              </cfif>
              <cfif currentrow  EQ 2>
                <td  align="left" nowrap="nowrap"><a href="">Richmond Ford</a></td>
              </cfif>
              <td align="right" nowrap="nowrap">11/13/2013</td>
              <td align="right" nowrap="nowrap">11/13/2013</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <br />
      <br />
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<cfinclude template="includes/footer.cfm">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
<script src="js/jquery.pageslide.min.js"></script>
<script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
