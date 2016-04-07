<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE <!--- (supervisor_id = #SESSION.userid#  OR Employee_ID = #SESSION.userid#) --->Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
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
<title>James River Grounds Management Equipment</title>
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
}
.jobstart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #27661f), color-stop(1, #449e2d) );
	background:-moz-linear-gradient( center top, #27661f 5%, #449e2d 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#27661f', endColorstr='#449e2d');
	background-color:#27661f;
}
.jobstart:active {
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
}
.jobstop:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background:-moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color:#d17e85;
}
.jobstop:active {
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
      <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #url.id#
 </cfquery>
      <cfoutput  query="get_this_equipment">
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="header">#PRODUCT_NAME#</div></td>
            <td>&nbsp;</td>
            <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Inventory List</a> </strong></td>
          </tr>
        </table>
        <br />
        <form method="post" action="inventory_edit2.cfm">
        <table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="##F3F3F3" bordercolorlight="White">
          <tbody>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">ID</td>
              <td><strong><span class="dstableno"> #ID# </span></strong></td>
              <td align="right" class="dstableno">*Date Created</td>
              <td class="dstableno">#DateFormat(DATE_CREATED, "mm/dd/yyyy")#
                <!---   <input name="DATE_CREATED" type="text"   tabindex="5" value="#DateFormat(DATE_CREATED, "mm/dd/yyyy")#" size="12" maxlength="12" />  --->
              </td>
              <td align="right" nowrap="nowrap" class="dstableno">Category</td>
              <td colspan="2" class="dstableno">#Category#
                <!---  <select name="Category"   tabindex="5">
                 <option value="None" <cfif Category EQ ''> selected="selected"</cfif>>Please Choose</option>
               <option value="Aerators" <cfif Category EQ 'Aerators'> selected="selected"</cfif>>Aerators</option>
 <option value="Blowers" <cfif Category EQ 'Blowers'> selected="selected"</cfif>>Blowers</option>
 <option value="Chainsaws" <cfif Category EQ 'Chainsaws'> selected="selected"</cfif>>Chainsaws</option>
 <option value="Construction Equipment" <cfif Category EQ 'Construction Equipment'> selected="selected"</cfif>>Construction Equipment</option>
 <option value="Edgers" <cfif Category EQ 'Edgers'> selected="selected"</cfif>>Edgers</option>
 <option value="Leaf Vaccuums" <cfif Category EQ 'Leaf Vaccuums'> selected="selected"</cfif>>Leaf Vacuums</option>
 <option value="Misc. Equipment" <cfif Category EQ 'Misc. Equipment'> selected="selected"</cfif>>Misc. Equipment</option>
 <option value="Mowers" <cfif Category EQ 'Mowers'> selected="selected"</cfif>>Mowers</option>
 <option value="Pruners" <cfif Category EQ 'Pruners'> selected="selected"</cfif>>Pruners</option>
 <option value="Snow Equipment" <cfif Category EQ 'Snow Equipment'> selected="selected"</cfif>>Snow Equipment</option>
 <option value="Spray Equipment" <cfif Category EQ 'Spray Equipment'> selected="selected"</cfif>>Spray Equipment</option>
 <option value="Spreaders" <cfif Category EQ 'Spreaders'> selected="selected"</cfif>>Spreaders</option>
 <option value="Tools" <cfif Category EQ 'Tools'> selected="selected"</cfif>>Tools</option>
 <option value="Trailers" <cfif Category EQ 'Trailers'> selected="selected"</cfif>>Trailers</option>
 <option value="Vehicles" <cfif Category EQ 'Vehicles'> selected="selected"</cfif>>Vehicles</option>
 <option value="Weedeaters" <cfif Category EQ 'Weedeaters'> selected="selected"</cfif>>Weedeaters</option>
 </select> --->
              </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Product Name</td>
              <td colspan="6"><span class="dstableno"> #PRODUCT_NAME# </span> </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Description</td>
              <td colspan="6"><strong><span class="dstableno"> #PRODUCT_DESCRIPTION# </span></strong></td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">* Date Purchased</td>
              <td><strong><span class="dstableno"> #DateFormat(DATE_PURCHASED, "mm/dd/yyyy")# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Year</td>
              <td class="dstableno">#EQUIPMENT_YEAR# </td>
              <td align="right" nowrap="nowrap" class="dstableno">Cost</td>
              <td colspan="2" class="dstableno">#COST# </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Equipment ID</td>
              <td><strong><span class="dstableno"> #EQUIPMENT_ID# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Serial Number</td>
              <td colspan="4" class="dstableno">#SERIAL_NUMBER# </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Color</td>
              <td><strong><span class="dstableno"> #COLOR# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Measurement</td>
              <td class="dstableno">#MEASUREMENT# </td>
              <td align="right" nowrap="nowrap" class="dstableno">Snow</td>
              <td colspan="2"><strong><span class="dstableno">#snow#
                
                </span></strong></td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">* Inspection Date</td>
              <td><strong><span class="dstableno"> #DateFormat(INSPECTION_DUE, "mm/dd/yyyy")# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">License Plate</td>
              <td class="dstableno">#LICENSE_PLATE# </td>
              <td align="right" nowrap="nowrap" class="dstableno">* Tags Expire</td>
              <td colspan="2" class="dstableno">#DateFormat(TAGS_EXPIRE, "mm/dd/yyyy")# </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Quantity</td>
              <td><strong><span class="dstableno"> #QUANTITY_START# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Quantity on Hand</td>
              <td class="dstableno">#QUANTITY_ON_HAND# </td>
              <td align="right" nowrap="nowrap"><span class="dstableno">Engine Cycle:</span></td>
              <td><strong><span class="dstableno"> #engine_cycle#
                <cfif engine_cycle NEQ ''>
                  cycle
                </cfif>
              </span></strong></td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Branch Name</td>
              <td><strong><span class="dstableno">#BRANCH_NAME#
                <!---  <select name="BRANCH_NAME"   tabindex="5">
                  <option value="None"  <cfif BRANCH_NAME EQ '' OR  BRANCH_NAME EQ 'None'> selected="selected"</cfif>>Please choose</option>
                  <option value="Charlottesville"  <cfif BRANCH_NAME EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                  <option value="Chesin"   <cfif BRANCH_NAME EQ 'Chesin'> selected="selected"</cfif>>Chesin</option>
                  <option value="Chesterfield"   <cfif BRANCH_NAME EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                  <option value="CHSN"   <cfif BRANCH_NAME EQ 'CHSN'> selected="selected"</cfif>>CHSN</option>
                  <option value="Corporate"  <cfif BRANCH_NAME EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                  <option value="Irrigation"   <cfif BRANCH_NAME EQ 'Irrigation'> selected="selected"</cfif>>Irrigation</option>
                  <option value="Landscape"   <cfif BRANCH_NAME EQ 'Landscape'> selected="selected"</cfif>>Landscape</option>
                  <option value="Newport News"   <cfif BRANCH_NAME EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                  <option value="Portsmouth"   <cfif BRANCH_NAME EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                  <option value="Richmond"   <cfif BRANCH_NAME EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                  <option value="SAUDE"   <cfif BRANCH_NAME EQ 'SAUDE'> selected="selected"</cfif>>SAUDE</option>
                  <option value="Williamsburg">Williamsburg</option>
                </select> --->
                </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Crew Assignment</td>
              <td colspan="4" class="dstableno"><!---   <input name="CREW_ASSIGNMENT" type="text"   tabindex="5" maxlength="50" value="#CREW_ASSIGNMENT#"/> --->
             &nbsp; </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Supplier Company</td>
              <td><span class="dstableno">#SUPPLIER_COMPANY#</span></td>
              <td align="right" nowrap="nowrap" class="dstableno">&nbsp;</td>
              <td colspan="4" class="dstableno">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Date Modified </td>
              <td><strong><span class="dstableno"> #DateFormat(DATE_MODIFIED, "mm/dd/yyyy")# </span></strong></td>
              <td align="right" nowrap="nowrap" class="dstableno">Modified By</td>
              <td colspan="4" class="dstableno">#MODIFIED_BY# </td>
            </tr>
        </tbody>
        </table>
      </cfoutput>
      <!-- to clear footer -->
      <br />
    </div>
  </div>
  <!-- end outer div -->
  <!-- to clear footer -->
</div>
<!-- end outer div -->
<!---  <footer><a href="/"><img src="/images/logo.png" width="281" height="66" /></a></footer>
 --->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
