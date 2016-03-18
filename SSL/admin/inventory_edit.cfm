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
<cfparam name="session.inventory_status" default="1">
<cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="All">
<cfparam name="session.HOURS_MILEAGE" default="All">
<cfparam name="session.YEARSEARCH " default="All">
<cfparam name="session.crew_assignment_last" default="All">
<cfparam name="session.oil_change_criteria" default="All">
<cfif IsDefined("form.submitted")>
  <CFSET session.branchsearch = form.BRANCH_NAME>
  <CFSET session.Categorysearch = form.Category>
  <CFSET session.inventory_status = form.inventory_status>
  <CFSET session.hours_mileage = form.hours_mileage>
  <CFSET session.crew_assignment_last = form.crew_assignment_last>
  <CFSET session.oil_change_criteria = form.oil_change_criteria>
   <CFSET session.YEARSEARCH = form.YEARSEARCH>
</cfif>

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
	padding: 10px;
}
.dstableno {
	padding: 8px;
	color: #000;
	font: normal .9em Arial, Helvetica, sans-serif;
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
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #449e2d), color-stop(1, #27661f) );
	background: -moz-linear-gradient( center top, #449e2d 5%, #27661f 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#449e2d', endColorstr='#27661f');
	background-color: #449e2d;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #143d0b;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 20px;
	font-weight: bold;
	padding: 5px 10px;
	margin-top: 4px;
	margin-right: 30px;
	text-decoration: none;
	text-shadow: 1px 1px 0px #000000;
}
.jobstart:hover {
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #27661f), color-stop(1, #449e2d) );
	background: -moz-linear-gradient( center top, #27661f 5%, #449e2d 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#27661f', endColorstr='#449e2d');
	background-color: #27661f;
}
.jobstart:active {
	position: relative;
	top: 1px;
}
.jobstop {
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background: -moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color: #b92723;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #4a0c0d;
	display: inline-block;
	color: #ffffff;
	font-family: arial;
	font-size: 20px;
	font-weight: bold;
	padding: 5px 10px;
	margin-top: 4px;
	text-decoration: none;
	text-shadow: 1px 1px 0px #000000;
}
.jobstop:hover {
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b92723), color-stop(1, #d17e85) );
	background: -moz-linear-gradient( center top, #b92723 5%, #d17e85 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b92723', endColorstr='#d17e85');
	background-color: #d17e85;
}
.jobstop:active {
	position: relative;
	top: 1px;
}
.eqbutton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background: -moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color: #f9f9f9;
	-webkit-border-top-left-radius: 32px;
	-moz-border-radius-topleft: 32px;
	border-top-left-radius: 32px;
	-webkit-border-top-right-radius: 32px;
	-moz-border-radius-topright: 32px;
	border-top-right-radius: 32px;
	-webkit-border-bottom-right-radius: 32px;
	-moz-border-radius-bottomright: 32px;
	border-bottom-right-radius: 32px;
	-webkit-border-bottom-left-radius: 32px;
	-moz-border-radius-bottomleft: 32px;
	border-bottom-left-radius: 32px;
	text-indent: 9px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #07482f;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 40px;
	line-height: 40px;
	width: 168px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ffffff;
}
.eqbutton:hover {
	background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background: -moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color: #e9e9e9;
}
.eqbutton:active {
	position: relative;
	top: 1px;
}
.redtype2 {
	color: red;
	font: normal .9em Arial, Helvetica, sans-serif;
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
            <td bgcolor="#F2F7F5"><input type="text" name="criteria"  size="50"/>
              &nbsp;
              <input type="submit"  class="eqbutton" value="Search Equipment" /></td>
          </tr>
          <tr class="arialfont">
            <td height="50" align="left" bgcolor="#F8FAF9">Category :
              <select name="Category"   tabindex="5" onchange='this.form.submit()'>
                <option value="All" <cfif session.categorysearch EQ 'All'> selected="selected"</cfif>>All</option>
                <option value="Aerators"  <cfif session.categorysearch EQ 'Aerators'> selected="selected"</cfif>>Aerators</option>
                <option value="Blowers"  <cfif session.categorysearch EQ 'Blowers'> selected="selected"</cfif>>Blowers</option>
                <option value="Chainsaws"  <cfif session.categorysearch EQ 'Chainsaws'> selected="selected"</cfif>>Chainsaws</option>
                <option value="Construction Equipment"  <cfif session.categorysearch EQ 'Construction Equipment'> selected="selected"</cfif>>Construction Equipment</option>
                <option value="Edgers"  <cfif session.categorysearch EQ 'Edgers'> selected="selected"</cfif>>Edgers</option>
                <option value="Leaf Vaccuums"  <cfif session.categorysearch EQ 'Leaf Vacuums'> selected="selected"</cfif>>Leaf Vacuums</option>
                <option value="Misc. Equipment"  <cfif session.categorysearch EQ 'Misc. Equipment'> selected="selected"</cfif>>Misc. Equipment</option>
                <option value="Mowers"  <cfif session.categorysearch EQ 'Mowers'> selected="selected"</cfif>>Mowers</option>
                <option value="Pruners"  <cfif session.categorysearch EQ 'Pruners'> selected="selected"</cfif>> Pruners</option>
                <option value="Snow Equipment"  <cfif session.categorysearch EQ 'Snow Equipment'> selected="selected"</cfif>> Snow Equipment</option>
                <option value="Spray Equipment"  <cfif session.categorysearch EQ 'Spray Equipment'> selected="selected"</cfif>>Spray Equipment</option>
                <option value="Spreaders"  <cfif session.categorysearch EQ 'Spreaders'> selected="selected"</cfif>>Spreaders</option>
                <option value="Tools"  <cfif session.categorysearch EQ 'Tools'> selected="selected"</cfif>>Tools</option>
                <option value="Trailers"  <cfif session.categorysearch EQ 'Trailers'> selected="selected"</cfif>>Trailers</option>
                <option value="Vehicles"  <cfif session.categorysearch EQ 'Vehicles'> selected="selected"</cfif>>Vehicles</option>
                <option value="Weedeaters"  <cfif session.categorysearch EQ 'Weedeaters'> selected="selected"</cfif>>Weedeaters</option>
              </select>
              &nbsp; &nbsp;&nbsp; &nbsp; Branch:
              <select name="BRANCH_NAME"   tabindex="5" onchange='this.form.submit()'>
                <option value="All"   <cfif session.branchsearch EQ 'All'> selected="selected"</cfif>>All</option>
                <option value="Charlottesville" <cfif session.branchsearch EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                <option value="Chesterfield" <cfif session.branchsearch EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                <option value="Corporate" <cfif session.branchsearch EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                <option value="Irrigation" <cfif session.branchsearch EQ 'Irrigation'> selected="selected"</cfif>>Irrigation</option>
                <option value="Landscape" <cfif session.branchsearch EQ 'Landscape'> selected="selected"</cfif>>Landscape</option>
                <option value="Newport News" <cfif session.branchsearch EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                <option value="Portsmouth" <cfif session.branchsearch EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                <option value="Richmond" <cfif session.branchsearch EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                <option value="SAUDE" <cfif session.branchsearch EQ 'SAUDE'> selected="selected"</cfif>>SAUDE</option>
                <option value="Williamsburg" <cfif session.branchsearch EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
              </select>
              &nbsp; &nbsp;&nbsp; &nbsp; Year:
              <select name="Equipment_year" onchange='this.form.submit()'>
                <option value="All"  <cfif session.yearsearch EQ 'All'> selected="selected"</cfif>>All</option>
                <option value="2016"  <cfif session.yearsearch EQ '2016'> selected="selected"</cfif>>2016</option>
                <option value="2015"  <cfif session.yearsearch EQ '2015'> selected="selected"</cfif>>2015</option>
                <option value="2014"  <cfif session.yearsearch EQ '2014'> selected="selected"</cfif>>2014</option>
                <option value="2013"  <cfif session.yearsearch EQ '2013'> selected="selected"</cfif>>2013</option>
                <option value="2012"  <cfif session.yearsearch EQ '2012'> selected="selected"</cfif>>2012</option>
                <option value="2011"  <cfif session.yearsearch EQ '2011'> selected="selected"</cfif>>2011</option>
                <option value="2010"  <cfif session.yearsearch EQ '2010'> selected="selected"</cfif>>2010</option>
                <option value="2009"  <cfif session.yearsearch EQ '2009'> selected="selected"</cfif>>2009</option>
                <option value="2008"  <cfif session.yearsearch EQ '2008'> selected="selected"</cfif>>2008</option>
                <option value="2007"  <cfif session.yearsearch EQ '2007'> selected="selected"</cfif>>2007</option>
                <option value="2006"  <cfif session.yearsearch EQ '2006'> selected="selected"</cfif>>2006</option>
                <option value="2005"  <cfif session.yearsearch EQ '2005'> selected="selected"</cfif>>2005</option>
                <option value="2004"  <cfif session.yearsearch EQ '2004'> selected="selected"</cfif>>2004</option>
                <option value="2003"  <cfif session.yearsearch EQ '2003'> selected="selected"</cfif>>2003</option>
                <option value="2002"  <cfif session.yearsearch EQ '2002'> selected="selected"</cfif>>2002</option>
                <option value="2001"  <cfif session.yearsearch EQ '2001'> selected="selected"</cfif>>2001</option>
                <option value="2000"  <cfif session.yearsearch EQ '2000'> selected="selected"</cfif>>2000</option>
                <option value="1999"  <cfif session.yearsearch EQ '1999'> selected="selected"</cfif>>1999</option>
                <option value="1998"  <cfif session.yearsearch EQ '1998'> selected="selected"</cfif>>1998</option>
                <option value="1997"  <cfif session.yearsearch EQ '1997'> selected="selected"</cfif>>1997</option>
                <option value="1996"  <cfif session.yearsearch EQ '1996'> selected="selected"</cfif>>1996</option>
                <option value="1995"  <cfif session.yearsearch EQ '1995'> selected="selected"</cfif>>1995</option>
                <option value="1994"  <cfif session.yearsearch EQ '1994'> selected="selected"</cfif>>1994</option>
              </select>
              &nbsp; &nbsp;&nbsp; &nbsp; Status:
              <select name="inventory_status"   tabindex="5"  onchange='this.form.submit()'>
                <option value="1"  <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
                <option value="2"<cfif session.inventory_status EQ '2'> selected="selected"</cfif>>Pending Repair</option>
                <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
              </select>
              <br />
              <br />
              Allocation:
              <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
              <select name="crew_assignment_last"   tabindex="5" onchange='this.form.submit()'>
                <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
                <cfoutput query="get_allocations">
                  <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
                </cfoutput>
              </select>
              &nbsp; &nbsp;&nbsp; &nbsp; Oil Change Criteria:
              <select name="oil_change_criteria"   tabindex="6"  onchange='this.form.submit()'>
                <option value="All" <cfif session.oil_change_criteria EQ 'All'> selected="selected"</cfif>>All</option>
                <option value="0"  <cfif  session.oil_change_criteria EQ ''> selected="selected"</cfif>>N/A</option>
                <option value="0"  <cfif session.oil_change_criteria EQ '0'> selected="selected"</cfif>>N/A</option>
                <option value="1"  <cfif session.oil_change_criteria EQ '1'> selected="selected"</cfif>>Hours+100 Hours</option>
                <option value="5"   <cfif session.oil_change_criteria EQ '5' > selected="selected"</cfif>>Hours+200 Hours</option>
                <option value="2"   <cfif session.oil_change_criteria EQ '2' > selected="selected"</cfif>>Mileage+5000 Miles</option>
                <option value="3"   <cfif session.oil_change_criteria EQ '3' > selected="selected"</cfif>>Mileage+10000 Miles</option>
                <option value="4"   <cfif session.oil_change_criteria EQ '4' > selected="selected"</cfif>>Date+30 Days</option>
              </select></td>
          </tr>
        </table>
        <input type="hidden"  name="submitted" value="yes"/>
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
            <td align="center" nowrap="nowrap"><strong> <a href="inventory_edit.cfm?ID=#next#" class="jobstop">Edit Next Record</a> </strong></td>
            <td align="center"><strong> <a href="inventory_list.cfm" class="jobstart">Back to Inv. List</a> </strong></td>
            <td align="center" valign="middle"  class="dstableno"><!--- <a href="inventory_damage_history_enter.cfm?ID=#ID#" ><img src="images/damage.gif" alt="Damage information" width="35" height="35" />Enter Damage Info</a> ---></td>
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
                <td colspan="6" class="dstableno">#DateFormat(DATE_CREATED, "mm/dd/yyyy")#</td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Category</td>
                <td><select name="Category"   tabindex="5">
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
                  </select></td>
                <td align="right"><span class="dstableno">Status</span></td>
                <td colspan="6" align="left" class="dstableno"><select name="inventory_status" id="inventory_status"   tabindex="5">
                    <option value="1"  <cfif inventory_status EQ 1> selected="selected"</cfif>>Active</option>
                    <option value="0"  <cfif inventory_status EQ 0> selected="selected"</cfif>>Inactive</option>
                    <option value="2"  <cfif inventory_status EQ 2> selected="selected"</cfif>>Pending Repair</option>
                    <option value="3"  <cfif inventory_status EQ 3> selected="selected"</cfif>>In Repair</option>
                  </select></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Product Name</td>
                <td colspan="8"><span class="dstableno">
                  <input name="PRODUCT_NAME" type="text"   tabindex="5" value="#PRODUCT_NAME#" size="75" maxlength="100" />
                  </span></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Description</td>
                <td colspan="8"><strong><span class="dstableno">
                  <input name="PRODUCT_DESCRIPTION" type="text"    tabindex="5" value="#PRODUCT_DESCRIPTION#" size="100" maxlength="120"/>
                  </span></strong></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">* Date Purchased</td>
                <td><strong><span class="dstableno">
                  <input name="DATE_PURCHASED" type="text"   tabindex="5" value="#DateFormat(DATE_PURCHASED, "mm/dd/yyyy")#" size="12" maxlength="12" />
                  </span></strong><span class="arialfont2"> (mm/dd/yyyy)</span></td>
                <td align="right" nowrap="nowrap" class="dstableno">Year</td>
                <td><strong><span class="dstableno">
                  <input name="EQUIPMENT_YEAR" type="text"   tabindex="5" value="#EQUIPMENT_YEAR#" size="10" maxlength="10" />
                  </span></strong>&nbsp;<span class="arialfont2"> (integer) </span></td>
                <td align="right" nowrap="nowrap" class="dstableno">Cost</td>
                <td colspan="4" class="dstableno"><input name="COST" type="text"   tabindex="5" value="#COST#" size="12" maxlength="12" /></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Equipment ID</td>
                <td><strong><span class="dstableno">
                  <input name="EQUIPMENT_ID" type="text"   tabindex="5" maxlength="50" value="#EQUIPMENT_ID#" />
                  </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Serial Number</td>
                <td colspan="6" class="dstableno"><input name="SERIAL_NUMBER" type="text"   tabindex="5" value="#SERIAL_NUMBER#" size="25" maxlength="50" /></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Color</td>
                <td><strong><span class="dstableno">
                  <input name="COLOR" type="text"   tabindex="5" maxlength="50" value="#COLOR#" />
                  </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Measurement</td>
                <td class="dstableno"><input name="MEASUREMENT" type="text"   tabindex="5" maxlength="50" value="#MEASUREMENT#" /></td>
                <td align="right" nowrap="nowrap" class="dstableno">Snow</td>
                <td colspan="4"><strong><span class="dstableno">
                  <select name="SNOW"   tabindex="5">
                    <option value="Yes"  <cfif SNOW EQ 'Yes'> selected="selected"</cfif>>Yes</option>
                    <option value="No"   <cfif SNOW EQ 'No'  > selected="selected"</cfif>>No</option>
                  </select>
                  </span></strong></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap"   bgcolor="##FFDECE"><span class="arialfont"> Inspection Date</span></td>
                <td  bgcolor="##FFDECE">&nbsp;<strong>
                  <input name="INSPECTION_DUE" type="text"   tabindex="5" value="#DateFormat(INSPECTION_DUE, "mm/dd/yyyy")#" size="12" maxlength="12" />
                  </span><span class="arialfont2">(mm/dd/yyyy)</span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">License Plate</td>
                <td class="dstableno"><input name="LICENSE_PLATE" type="text"   tabindex="5" maxlength="50" value="#LICENSE_PLATE#" /></td>
                <td align="right" nowrap="nowrap" class="dstableno">* Tags Expire</td>
                <td colspan="4" ><strong><span class="dstableno">
                  <input name="TAGS_EXPIRE" type="text"   tabindex="5" value="#DateFormat(TAGS_EXPIRE, "mm/dd/yyyy")#" size="12" maxlength="12" />
                  </span></strong> <span class="arialfont2"> (mm/dd/yyyy)</span></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Quantity</td>
                <td><strong><span class="dstableno">
                  <input name="QUANTITY_START" type="text"   tabindex="5" value="#QUANTITY_START#" size="6" maxlength="6"/>
                  </span></strong> &nbsp;<span class="arialfont2"> (integer)</span></td>
                <td align="right" nowrap="nowrap" class="dstableno">Quantity on Hand</td>
                <td><strong><span class="dstableno">
                  <input name="QUANTITY_ON_HAND" type="text"   tabindex="5" value="#QUANTITY_ON_HAND#" size="6" maxlength="6"/>
                  </span></strong> &nbsp;<span class="arialfont2"> (integer)</span></td>
                <td align="right" nowrap="nowrap"   bgcolor="##FFDECE"><span class="arialfont">Last Oil Change Date</span></td>
                <!---      <td colspan="4" align="left" nowrap="nowrap" ><strong><span class="dstableno">
                <input name="last_oil_change_date" type="text"   tabindex="5" value="#DateFormat(last_oil_change_date, "mm/dd/yyyy")#"  size="12" maxlength="12"/>
               </span><span class="arialfont2">(mm/dd/yyyy)-</span></strong></td> --->
                
                <td    colspan="4" bgcolor="##FFDECE">&nbsp;<strong>
                  <input name="last_oil_change_date" type="text"   tabindex="5" value="#DateFormat(last_oil_change_date, "mm/dd/yyyy")#"  size="12" maxlength="12"/>
                  </span><span class="arialfont2">(mm/dd/yyyy)</span></strong></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Hours / Mileage / Date:</td>
                <td><strong><span class="dstableno">
                  <select name="oil_change_criteria"   tabindex="5">
                    <option value="0"  <cfif oil_change_criteria EQ ''> selected="selected"</cfif>>N/A</option>
                    <option value="0"  <cfif oil_change_criteria EQ '0'> selected="selected"</cfif>>N/A</option>
                    <option value="1"  <cfif oil_change_criteria EQ '1'> selected="selected"</cfif>>Hours+100 Hours</option>
                    <option value="5"   <cfif oil_change_criteria EQ '5' > selected="selected"</cfif>>Hours+200 Hours</option>
                    <option value="2"   <cfif oil_change_criteria EQ '2' > selected="selected"</cfif>>Mileage+5000 Miles</option>
                    <option value="3"   <cfif oil_change_criteria EQ '3' > selected="selected"</cfif>>Mileage+10000 Miles</option>
                    <option value="4"   <cfif oil_change_criteria EQ '4' > selected="selected"</cfif>>Date+30 Days</option>
                  </select>
                  </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Hours</td>
                <td><strong><span class="dstableno">
                  <input name="hours_eq" type="text"   tabindex="5" value="#hours_eq#" size="6" maxlength="6"/>
                  </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Mileage</td>
                <td colspan="4"><strong><span class="dstableno">
                  <input name="mileage_eq" type="text"   tabindex="5" value="#mileage_eq#" size="8" maxlength="8"/>
                  </span></strong></td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Branch Name</td>
                <td><strong><span class="dstableno">
                  <select name="BRANCH_NAME"   tabindex="5">
                    <option value="None"  <cfif BRANCH_NAME EQ '' OR  BRANCH_NAME EQ 'None'> selected="selected"</cfif>>Please choose</option>
                    <option value="Charlottesville"  <cfif BRANCH_NAME EQ 'Charlottesville'> selected="selected"</cfif>>Charlottesville</option>
                    <!---     <option value="Chesin"   <cfif BRANCH_NAME EQ 'Chesin'> selected="selected"</cfif>>Chesin</option> --->
                    <option value="Chesterfield"   <cfif BRANCH_NAME EQ 'Chesterfield'> selected="selected"</cfif>>Chesterfield</option>
                    <!---    <option value="CHSN"   <cfif BRANCH_NAME EQ 'CHSN'> selected="selected"</cfif>>CHSN</option> --->
                    <option value="Corporate"  <cfif BRANCH_NAME EQ 'Corporate'> selected="selected"</cfif>>Corporate</option>
                    <!---    <option value="Disposed Of"  <cfif BRANCH_NAME EQ 'Disposed Of'> selected="selected"</cfif>>Disposed Of</option> --->
                    <option value="Irrigation"   <cfif BRANCH_NAME EQ 'Irrigation'> selected="selected"</cfif>>Irrigation</option>
                    <option value="Landscape"   <cfif BRANCH_NAME EQ 'Landscape'> selected="selected"</cfif>>Landscape</option>
                    <option value="Newport News"   <cfif BRANCH_NAME EQ 'Newport News'> selected="selected"</cfif>>Newport News</option>
                    <option value="Portsmouth"   <cfif BRANCH_NAME EQ 'Portsmouth'> selected="selected"</cfif>>Portsmouth</option>
                    <option value="Richmond"   <cfif BRANCH_NAME EQ 'Richmond'> selected="selected"</cfif>>Richmond</option>
                    <option value="SAUDE"   <cfif BRANCH_NAME EQ 'SAUDE'> selected="selected"</cfif>>SAUDE</option>
                    <option value="Williamsburg"  <cfif BRANCH_NAME EQ 'Williamsburg'> selected="selected"</cfif>>Williamsburg</option>
                  </select>
                  </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Crew Assignment</td>
                <CFIF  get_this_equipment.Crew_assignment_last EQ "">
                  <td colspan="6" class="dstableno"> -</td>
                  <cfelse>
                  <cfquery name="get_branch_employees_allocated" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 0, 0, 0)#">
        SELECT  [Name FirstLast] AS fullname  FROM APP_employees
        WHERE  [Employee ID] =  #get_this_equipment.Crew_assignment_last# 
         </cfquery>
                  <td colspan="6" class="dstableno">#get_branch_employees_allocated.fullname#</td>
                </CFIF>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Supplier Company</td>
                <td class="dstableno"><input name="SUPPLIER_COMPANY" type="text"   tabindex="5" value="#SUPPLIER_COMPANY#" size="30" maxlength="50"/></td>
                <td align="right" nowrap="nowrap" class="dstableno">Engine Cycle</td>
                <td><strong><span class="dstableno">
                  <select name="engine_cycle"   tabindex="5">
                    <option value="0"  <cfif engine_cycle EQ ''> selected="selected"</cfif>>N/A</option>
                    <option value="2"  <cfif engine_cycle EQ '2'> selected="selected"</cfif>>2 Cycle</option>
                    <option value="4"   <cfif engine_cycle EQ '4' > selected="selected"</cfif>>4 Cycle</option>
                  </select>
                  </span></strong></td>
                <td colspan="5" align="left" valign="middle" class="dstableno">&nbsp;</td>
              </tr>
              <tr>
                <td align="right" nowrap="nowrap" class="dstableno">Date Modified </td>
                <td><strong><span class="dstableno"> #DateFormat(DATE_MODIFIED, "mm/dd/yyyy")# </span></strong></td>
                <td align="right" nowrap="nowrap" class="dstableno">Modified By</td>
                <td colspan="3" class="dstableno">#MODIFIED_BY#</td>
                <td colspan="3" nowrap="nowrap"><!--- <input type="submit" name="submit" id="submit" value="Submit" /> --->
                  
                  <input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
              </tr>
          </table>
          <input type="hidden"  name="ID" value="#ID#"/>
          <input type="hidden"  name="MODIFIED_BY" value="#SESSION.screenname#"/>
        </form>
      </cfoutput> 
      <!-- to clear footer --><span class="crewjob_header"><br />
      Notes</span> :
      </p>
      <ul>
        <li> *These Dates: Inspection Date, Tags Expire, Date Purchased  must be in mm/dd/yyyy&nbsp;format.</li>
        <li>The equipment manager is optimized for the Safari browser and works well on an IPAD in landscape orientation.</li>
      </ul>
      <form method="post" action="inventory_delete.cfm">
        <p  align="center"  >
          <input type="submit" value="             Delete This Record               " class="clockoutb"  />
        </p>
        <p> <cfoutput>
            <input type="hidden"  name="ID" value="#ID#"/>
          </cfoutput>
      </form>
    </div>
  </div>
  <br />
  <br />
  <br />
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