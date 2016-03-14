 
 
 
  
   <cfif isDefined("damagepix1") AND    Len(damagepix1) GT 1  > 
     <cffile action = "upload"  
        fileField = "damagepix1"  
        destination = "C:\inetpub\websites\jrgm.biz\forms\photos\1000_1.jpg" 
        nameConflict = "MakeUnique"> 
</cfif>

File Uploaded Successfully
 <cfabort>
 <!--- <cfif isDefined("damagepix2") AND    Len(damagepix2) GT 1  > 
     <cffile action = "upload"  
        fileField = "damagepix2"  
        destination = "C:\inetpub\websites\jrgm.biz\SSL\admin\damagepix\#new_ID#_2.jpg" 
        nameConflict = "MakeUnique"> 
</cfif>


 <cfif isDefined("damagepix3") AND    Len(damagepix3) GT 1  > 
     <cffile action = "upload"  
        fileField = "damagepix3"  
        destination = "C:\inetpub\websites\jrgm.biz\SSL\admin\damagepix\#new_ID#_3.jpg" 
        nameConflict = "MakeUnique"> 
</cfif>

 <cfif isDefined("damagepix4") AND    Len(damagepix4) GT 1  > 
     <cffile action = "upload"  
        fileField = "damagepix4"  
        destination = "C:\inetpub\websites\jrgm.biz\SSL\admin\damagepix\#new_ID#_4.jpg" 
        nameConflict = "MakeUnique"> 
</cfif>

 <cfif isDefined("damagepix5") AND    Len(damagepix5) GT 1  > 
     <cffile action = "upload"  
        fileField = "damagepix5"  
        destination = "C:\inetpub\websites\jrgm.biz\SSL\admin\damagepix\#new_ID#_5.jpg" 
        nameConflict = "MakeUnique"> 
</cfif> --->
 

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


<!---  <CFSET next = (#ID#+1)> --->

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
  
  <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #form.ID#
 </cfquery> 
  <!--centre content goes here -->
  <div class="centrecontent_inner">
   <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td><div class="header"> <cfoutput>#get_this_equipment.PRODUCT_NAME#</cfoutput> Damage Information</div></td>
            <td align="center" nowrap="nowrap"><strong> <!--- <a href="inventory_edit.cfm?ID=#new_ID#" class="jobstop">Edit this Record</a> ---></strong></td>
            <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Inventory List</a></strong></td>
          </tr>
        </table>
      <cfquery name="get_this_equipment_history" datasource="jrgm">
SELECT * FROM equipment_history WHERE ID = #new_ID#
      </cfquery>
   
         <table width="95%" border="1" cellpadding="4" cellspacing="0"    bordercolor="#F3F3F3" bordercolorlight="White">
          <tbody> 
		  <cfoutput  query="get_this_equipment">
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Inventory ID</td>
              <td><strong><span class="dstableno"> #ID# </span></strong></td>
              <td align="right" class="dstableno"><!--- *Date Created ---></td>
              <td colspan="2" class="dstableno"><!--- #DateFormat(DATE_CREATED, "mm/dd/yyyy")# --->
              
              </td>
              </tr>
 
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Product Name</td>
              <td colspan="4"><span class="dstableno">
               #get_this_equipment.PRODUCT_NAME# 
                </span> </td>
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Description</td>
              <td colspan="4"> <span class="dstableno">
                #get_this_equipment.PRODUCT_DESCRIPTION# 
                </span> </td>
               
            </tr>
            <tr>
              <td align="right" nowrap="nowrap" class="dstableno">Branch Name</td>
              <td colspan="4"><span class="dstableno">
                #get_this_equipment.BRANCH_NAME# 
                </span> 
              </td>
              </tr>
            <tr>
              <td align="right" valign="top" nowrap="nowrap" class="dstableno">Damage ID</td>
              <td colspan="4" valign="top"><span class="dstableno">
              #new_ID#
                </span> </td>
            </tr>
            <tr>
              <td align="right" valign="top" nowrap="nowrap" class="dstableno">Damage Date</td>
              <td colspan="4" valign="top"> <span class="dstableno">
              #DateFormat(get_this_equipment_history.damage_date, "mm/dd/yyyy")#
                </span></td>
            </tr>
            <tr>
              <td align="right" valign="top" nowrap="nowrap" class="dstableno">Damage Notes</td>
              <td colspan="4" valign="top"> 
            <span class="dstableno">
                #get_this_equipment_history.equipment_notes# 
                </span> </td>
              </tr>   </cfoutput>
            <tr>
              <td height="34" align="right" nowrap="nowrap" class="dstableno">Uploaded Pictures</td>
     <cfdirectory action="list" directory="C:\inetpub\websites\jrgm.biz\SSL\admin\damagepix\" name="damagepix" recurse="true">

<cfquery name="damagepix2" dbtype="query">
    select * 
    from damagepix
   WHERE name LIKE '#new_ID#%';
</cfquery>
<!---     
    <cfdump  var="#damagepix2#"> --->
    
              <td colspan="4" class="dstableno"><cfoutput query="damagepix2" ><a href="https://www.jrgm.biz/ssl/admin/damagepix/#damagepix.name#">#damagepix.name#</a><br />
</cfoutput></td>
              </tr>
         </table>
   </div>
</div>
<!-- end outer div -->
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
 <footer><a href="http://www.jrgm.biz/"><img src="http://www.jrgm.biz/images/logo.png" width="281" height="66" /></a></footer>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>