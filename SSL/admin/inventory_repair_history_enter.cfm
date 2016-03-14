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


 <CFSET next = (#ID#+1)>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management Inventory</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/accordion-a/accordion-a.css" rel="stylesheet" />
<link href="css/accordion-a/themes/minimal.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style>
textarea {
	width: 600px;
	padding:10px;
}
.dstableno {
	padding: 8px;
	color: #000;
	font: normal .8em Arial, Helvetica, sans-serif;
}
.arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}

.arialfont2 {
	font: normal .7em Arial, Helvetica, sans-serif;
}
li {
	font: normal .9em Arial, Helvetica, sans-serif;
	line-height: 24px;
}
.jobstart {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #449e2d), color-stop(1, #27661f) );
	background:-moz-linear-gradient( center top, #449e2d 5%, #27661f 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#449e2d', endColorstr='#27661f');
	background-color:#449e2d;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #143d0b;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	padding:5px 10px;
	margin-top:4px;
	margin-right: 30px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}.jobstart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #27661f), color-stop(1, #449e2d) );
	background:-moz-linear-gradient( center top, #27661f 5%, #449e2d 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#27661f', endColorstr='#449e2d');
	background-color:#27661f;
}.jobstart:active {
	position:relative;
	top:1px;
}

.jobstop {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#b92723;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:20px;
	font-weight:bold;
	padding:5px 10px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;
}.jobstop:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background:-moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color:#d17e85;
}.jobstop:active {
	position:relative;
	top:1px;
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
}.eqbutton:active {
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
 

  <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="header">Enter Repair Information</div> </td>
            <td>&nbsp;</td>
           <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Equipment List</a> </strong></td>
          </tr>
        </table>
      <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
    <cfoutput  query="get_this_equipment">
     
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="lgaddress">#PRODUCT_NAME#</div> </td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <br />
        
       
       <form method="post" action="">
        <table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="##F3F3F3" bordercolorlight="White">
          <tbody>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">ID</td>
              <td><strong><span class="dstableno"> #ID# </span></strong></td>
              <td align="right" class="dstableno">*Date Created</td>
              <td colspan="2" class="dstableno">#DateFormat(DATE_CREATED, "mm/dd/yyyy")#
                <!---   <input name="DATE_CREATED" type="text"   tabindex="5" value="#DateFormat(DATE_CREATED, "mm/dd/yyyy")#" size="12" maxlength="12" />  --->
              </td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Product Name</td>
              <td colspan="4"><span class="dstableno">
               #PRODUCT_NAME# 
                </span> </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Description</td>
              <td colspan="4"><strong><span class="dstableno">
                #PRODUCT_DESCRIPTION# 
                </span></strong></td>
               
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Branch Name</td>
              <td><span class="dstableno">
               #BRANCH_NAME# 
                </span> 
         </td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Repair Date</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED" type="text"    tabindex="4" size="12" maxlength="12"   />
  &nbsp;</span></strong><span class="dstableno">(mm/dd/yyyy)</span></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Repair Location</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED5" type="text"    tabindex="4" size="12" maxlength="12"    />
              </span></strong><span class="dstableno"><strong> </strong></span></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Estimated Days To Repair</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED5" type="text"    tabindex="4" size="12" maxlength="12"  />
              </span></strong></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Repair Actual Time</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED2" type="text"    tabindex="4" size="12" maxlength="12"   />
              </span></strong><span class="dstableno"><strong> </strong></span></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Repair Cost</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED3" type="text"    tabindex="4" size="12" maxlength="12"   />
              </span></strong><span class="dstableno"><strong> </strong></span></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Parts Cost</td>
              <td><strong><span class="dstableno">
                <input name="DATE_PURCHASED4" type="text"    tabindex="4" size="12" maxlength="12"  />
              </span></strong><span class="dstableno"><strong> </strong></span></td>
              <td colspan="3" align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Date Modified </td>
              <td><strong><span class="dstableno"> #DateFormat(DATE_MODIFIED, "mm/dd/yyyy")# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Modified By</td>
              <td class="dstableno">
                #MODIFIED_BY# 
                </td>
              <td nowrap="nowrap"><input type="submit" name="submit" id="submit" value="Submit" /></td>
            </tr>
        </table>
        <input type="hidden"  name="ID" value="#ID#"/>
          <input type="hidden"  name="MODIFIED_BY" value="#SESSION.screenname#"/>
      </form>
    </cfoutput>
    <p>
      <!-- to clear footer --></p>
    <p><span class="arialfont">This information gets added to equipment_history table.</span><span class="crewjob_header"></span></p>
    <p>&nbsp;</p>
  </div>
</div>
<!-- end outer div -->
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>