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
  
 <!--- <form action="inventory_list.cfm" method="post"><table width="100%" border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor="#07482f"  bordercolorlight="White"> 
  <tr>
    <td bgcolor="#F2F7F5"><input type="text" name="criteria"  size="100"/>&nbsp;
      <input type="submit"  class="eqbutton" value="Search Equipment" />  
       </td>
    </tr>
  <tr class="arialfont">
    <td align="left" bgcolor="#F8FAF9">Category :
      <select name="Category"   tabindex="5">
        <option value="All"  selected="selected">All</option>
        <option value="Aerators" >Aerators</option>
        <option value="Blowers" >Blowers</option>
        <option value="Chainsaws" >Chainsaws</option>
        <option value="Construction Equipment" >Construction Equipment</option>
        <option value="Edgers" >Edgers</option>
        <option value="Leaf Vaccuums" >Leaf Vacuums</option>
        <option value="Misc. Equipment" >Misc. Equipment</option>
        <option value="Mowers" >Mowers</option>
        <option value="Pruners" >Pruners</option>
        <option value="Snow Equipment" >Snow Equipment</option>
        <option value="Spray Equipment" >Spray Equipment</option>
        <option value="Spreaders" >Spreaders</option>
        <option value="Tools" >Tools</option>
        <option value="Trailers" >Trailers</option>
        <option value="Vehicles" >Vehicles</option>
        <option value="Weedeaters" >Weedeaters</option>
        </select>
      &nbsp; &nbsp;&nbsp; &nbsp; Branch:
      <select name="BRANCH_NAME"   tabindex="5">
        <option value="All"    selected="selected" >All</option>
        <option value="Charlottesville" >Charlottesville</option>
        <option value="Chesin">Chesin</option>
        <option value="Chesterfield">Chesterfield</option>
        <option value="CHSN" >CHSN</option>
        <option value="Corporate">Corporate</option>  <option value="Disposed Of" >Disposed Of</option>
  <option value="Irrigation">Irrigation</option>
        <option value="Landscape">Landscape</option>
        <option value="Newport News">Newport News</option>
        <option value="Portsmouth">Portsmouth</option>
        <option value="Richmond">Richmond</option>
        <option value="SAUDE">SAUDE</option>
        <option value="Williamsburg">Williamsburg</option>
        </select>
      &nbsp; &nbsp;&nbsp; &nbsp; Year:
      <select name="Equipment_year">
        
        <option value="All"  selected="selected">All</option>
        <option value="2013">2013</option>
        <option value="2012">2012</option>
        <option value="2011">2011</option>
        <option value="2010">2010</option>
        <option value="2009">2009</option>
        <option value="2008">2008</option>
        <option value="2007">2007</option>
        <option value="2006">2006</option>
        <option value="2005">2005</option>
        <option value="2004">2004</option>
        <option value="2003">2003</option>
        <option value="2002">2002</option>
        <option value="2001">2001</option>
        <option value="2000">2000</option>
        <option value="1999">1999</option>
        <option value="1998">1998</option>
        <option value="1997">1997</option>
        <option value="1996">1996</option>
        <option value="1995">1995</option>
        <option value="1994">1994</option>
        <option value="1993">1993</option>
        <option value="1992">1992</option>
        <option value="1991">1991</option>
        <option value="1990">1990</option>
        <option value="1989">1989</option>
  </select> </td>
    </tr>
   </table>
</form> --->

  <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="header">Repair History Information</div> </td>
            <td>&nbsp;</td>
           <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Inventory List</a> </strong></td>
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
              <td width="250" align="right" nowrap="nowrap" class="dstableno"><strong>ID</strong></td>
              <td><strong><span class="dstableno"> #ID# </span></strong></td>
              <td align="right" class="dstableno"><strong>*Date Created</strong></td>
              <td class="dstableno"><strong>#DateFormat(DATE_CREATED, "mm/dd/yyyy")#
                <!---   <input name="DATE_CREATED" type="text"   tabindex="5" value="#DateFormat(DATE_CREATED, "mm/dd/yyyy")#" size="12" maxlength="12" />  --->
              </strong></td>
              </tr>
            <tr>
              <td width="250" align="right" nowrap="nowrap" class="dstableno"><strong>Product Name</strong></td>
              <td colspan="3"><strong><span class="dstableno">
               #PRODUCT_NAME# 
                </span> </strong></td>
            </tr>
            <tr>
              <td width="250" align="right" nowrap="nowrap" class="dstableno"><strong>Description</strong></td>
              <td colspan="3"><strong><span class="dstableno">
                #PRODUCT_DESCRIPTION# 
                </span></strong></td>
               
            </tr>
            <tr class="date">
              <td width="250" align="right" nowrap="nowrap" bgcolor="##EEEEEE" ><strong>Repair History</strong></td>
              <td colspan="3" bgcolor="##EEEEEE">&nbsp;</td>
              </tr>
            <tr class="dstable">
              <td width="250" align="right" nowrap="nowrap">&nbsp;</td>
              <td><strong>Repair ID </strong></td>
              <td><strong>Repair Date</strong></td>
              <td>&nbsp;</td>
            </tr>
            <tr class="dstable">
              <td width="250" align="right" nowrap="nowrap">&nbsp;</td>
              <td>&nbsp;1234</td>
              <td>&nbsp;12/11/2013</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="dstable">
              <td width="250" align="right" nowrap="nowrap">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td width="250" align="right" nowrap="nowrap">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td width="250" align="right" nowrap="nowrap">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
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