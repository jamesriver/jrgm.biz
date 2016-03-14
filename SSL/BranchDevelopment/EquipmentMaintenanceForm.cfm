<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment Maintenance Form</title>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;" />
    <title>James River Grounds Management</title>

    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/stylesweekly.css" rel="stylesheet" />
    <link href="css/formweekly.css" rel="stylesheet" />
 	<link href="css/styles.css" rel="stylesheet" />
    <link href="css/form.css" rel="stylesheet" />
    <style>
	.centrecontent_inner {
	margin-top: 10px;
	margin-left: 20px;
	margin-right: 20px;
	padding: 20px;
}
</style>
  
    <script type="text/javascript">
        $(function () {
            $("#date").datepicker();
            $("#Inspectiondue").datepicker();
            $("#Oilchangedue").datepicker();

        });
    </script>
     

</head>
<body style="margin-top:0">
    <form action="" method="post" id="myform" class="vehicle_inventory" >
        <div id="outerfull">
            <div id="centrecontent">
                <!--centre content goes here -->
                <div class="centrecontent_inner">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><div class="header">Equipment Maintenance Form</div></td>
                          <td align="right"> <a href="javascript:window.close()"><i class="fa-red2x fa-times-circle"></i></a><div class="closewindow">Close Window</div></td>
                        </tr>
                  </table>
               


                    <div class="spacer20"></div>
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="top"><p class="performance">Today's Date:&nbsp;&nbsp;&nbsp;&nbsp;
                          06/30/2014
                        </p>
                          <p class="performance">Vehicle Number: 506</p>
                          <p class="performance">Trailer Number: T40</p></td>
                        <td valign="top"><img src="images/clear.gif" width="200" height="1" /></td>
                        <td valign="top"><p class="performance">Driver's Phone Number: (804) 555-1212</p>
                          <p class="performance">Driver's Name: John Smith</p></td>
                      </tr>
                  </table>
                    <div class="spacer20"></div>
                   <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" class="vehicle_inventory"><strong>Enter "P" for Pass, "F" for Fail or "NA" for Not Available</strong></td>
                        </tr>
                    </table>-->
                    <div class="subheader">Equipment&#8212;2 Cycle</div>
                    <div class="spacer10"></div>
                      <table border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="performance_header_nl">INVENTORY</td>
                          <td nowrap="nowrap" class="performance_header_nl">EQ ID</td>
                          <td align="center" nowrap="nowrap" class="performance_header_nl">Air Filters Cleaned<br>
                            / Replaced<br></td>
                          <td align="center" nowrap="nowrap" class="performance_header_nl">Grease<br>
                            Fittings<br></td>
                        </tr>
                        <tr>
                          <td class="performanceDate">&nbsp;</td>
                          <td nowrap="nowrap" class="performanceDate">&nbsp;</td>
                          <td align="center" nowrap="nowrap" class="performanceDate">Yes or NA</td>
                          <td align="center" nowrap="nowrap" class="performanceDate">Yes or NA</td>
                        </tr>
                        <tr>
                          <td class="performance">Edger</td>
                          <td nowrap class="performance">BE102</td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="StanderAir_Y2" type="radio"  name="StanderAir_Y" value="Y"/>
                            <label for="StanderAir_Y2">Y</label>
                            <input id="StanderAir_NA2" type="radio" name="StanderAir_NA" value="NA"/>
                            <label for="StanderAir_NA2">N</label>
                          </div></td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="StanderGrease_Y2" type="radio"  name="StanderGrease_Y" value="Y"/>
                            <label for="StanderGrease_Y2">Y</label>
                            <input id="StanderGrease_NA2" type="radio" name="StanderGrease_NA" value="NA"/>
                            <label for="StanderGrease_NA2">N</label>
                          </div></td>
                        </tr>
                        <tr>
                          <td class="performance">Pruners</td>
                          <td class="performance">H116</td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                        </tr>
                        <tr>
                          <td class="performance">Pruners</td>
                          <td class="performance">H305</td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                        </tr>
                        <tr>
                          <td class="performance">Weedeater</td>
                          <td class="performance">W141</td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                        </tr>
                        <tr>
                          <td class="performance">Weedeater</td>
                          <td class="performance">W113</td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                          <td align="center" class="performance"><div class="radio2">
                            <input id="OilFilter_Y2" type="radio"  name="mower" value="Y"/>
                            <label for="OilFilter_Y2">Y</label>
                            <input id="OilFilter_NA2" type="radio" name="mower" value="NA"/>
                            <label for="OilFilter_NA2">N</label>
                          </div></td>
                        </tr>
                      </table>
                     <div class="spacer20"></div>
                  <div class="subheader">Equipment&#8212;4 Cycle</div>
                  <div class="spacer10"></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td rowspan="2" class="performance_header">INVENTORY</td>
                        <td rowspan="2" nowrap="nowrap" class="performance_header">EQ ID</td>
                        <td rowspan="2" align="center" nowrap="nowrap" class="performance_header_4cycle_l">Current <br>
                        Hours</td>
                        <td rowspan="2" align="center" nowrap="nowrap" class="performance_header_4cycle">Oil Change <br>
                        Today</td>
                        <td rowspan="2" align="center" nowrap="nowrap" class="performance_header_4cycle_r">Oil Change <br>
                        Due</td>
                        <td align="center" nowrap="nowrap" class="performance_header_nl">Air Filters Cleaned<br>
                        / Replaced</td>
                        <td align="center" nowrap="nowrap" class="performance_header_nl">Blades Sharpened<br>
                        / Balanced</td>
                        <td align="center" nowrap="nowrap" class="performance_header_nl">Grease<br>
                        Fittings</td>
                        <td align="center" nowrap="nowrap" class="performance_header_nl">Clean /<br>
                        Powerwash</td>
                      </tr>
                      <tr>
  						<td align="center" class="performanceDate">Yes or NA</td>
                        <td align="center" class="performanceDate">Yes or NA</td>
                        <td align="center" class="performanceDate">Yes or NA</td>
                        <td align="center" class="performanceDate">Yes or NA</td>
                      </tr>
                      <tr>
                        <td class="performance">Aerator</td>
                        <td nowrap class="performance">A-09</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>
                        <td align="center" class="performance_4cycle_r">08/15/2014</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Blower</td>
                        <td class="performance">B135</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>
                        <td align="center" class="performance_4cycle_r">08/30/2014</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance">Blower</td>
                        <td class="performance">B816</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"><div class="checkbox">
                        <input id="check11" type="checkbox" name="checkpolice" value="check">
                        <label for="check11">
                    &nbsp;&nbsp;
                     </label>
                        </div></td>
                        <td align="center" class="performance_4cycle_r">08/25/2014</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Edger</td>
                        <td class="performance">BE101</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>                        <td align="center" class="performance_4cycle_r">08/20/2014</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Edger</td>
                        <td class="performance">BE102</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>                        <td align="center" class="performance_4cycle_r">08/24/2014</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance">Leaf Vaccuum</td>
                        <td class="performance">None</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>                        <td align="center" class="performance_4cycle_r">08/20/2014</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance">Stick Edger</td>
                        <td class="performance">X-610</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>                        <td align="center" class="performance_4cycle_r">08/15/2014</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance"> Mower</td>
                        <td class="performance">V903</td>
                        <td align="center" class="performance_4cycle_l"><input name="textfield3" type="text" id="textfield3" size="4"></td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>
                        <td align="center" class="performance_4cycle_r">220 hours</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance">Mower</td>
                        <td class="performance">R121</td>
                      <td align="center" class="performance_4cycle_l"><input name="textfield4" type="text" id="textfield4" size="4"></td>
                        <td align="center" class="performance_4cycle"><div class="checkbox">
                        <input id="check11" type="checkbox" name="checkpolice" value="check">
                        <label for="check11">
                    &nbsp;&nbsp;
                     </label>
                        </div></td>
                        <td align="center" class="performance_4cycle_r">125 hours</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Mower</td>
                        <td class="performance">R230</td>
                       <td align="center" class="performance_4cycle_l"><input name="textfield4" type="text" id="textfield4" size="4"></td>
                        <td align="center" class="performance_4cycle"><div class="checkbox">
                        <input id="check11" type="checkbox" name="checkpolice" value="check">
                        <label for="check11">
                    &nbsp;&nbsp;
                     </label>
                        </div></td>
                        <td align="center" class="performance_4cycle_r">75 hours</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        
                      </tr>
                      <tr>
                        <td class="performance">Pruners</td>
                        <td class="performance">H804</td>
                        <td align="center" class="performance_4cycle_l">&nbsp;</td>
                        <td align="center" class="performance_4cycle"> <div class="checkbox">
                        <input id="check12" type="checkbox" name="checkoil" value="check">
                        <label for="check12">
                    &nbsp;&nbsp;
                     </label>
                        </div>
                        </td>                        <td align="center" class="performance_4cycle_r">08/18/2014</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="StanderAir_Y" type="radio"  name="StanderAir_Y" value="Y"/>
                          <label for="StanderAir_Y">Y</label>
                          <input id="StanderAir_NA" type="radio" name="StanderAir_NA" value="NA"/>
                          <label for="StanderAir_NA">N</label>
                        </div></td>
                      </tr>
                    </table>
                             
               
                  <div class="spacer40"></div>                  <table border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="performance_header"> <div class="subheader">Vehicle ID 506</div></td>
                        <td align="center" nowrap="nowrap" class="performanceDate">Complete or NA</td>
                        <td align="center" nowrap="nowrap" class="performanceDate">&nbsp;</td>
                        <td align="center" nowrap="nowrap" class="performanceDate">&nbsp;</td>
                        <td align="center" nowrap="nowrap" class="performanceDate">Complete or NA</td>
                      </tr>
                      <tr>
                        <td class="performance">Current Mileage</td>
                        <td align="center" class="performance"><input name="textfield2" type="text" id="textfield2" value="120,000" size="12"></td>
                        <td align="center" class="performance">&nbsp;</td>
                        <td class="performance">Rear vision mirrors</td>
  <td align="center" class="performance"><div class="radio2">
                          <input id="OilFilter_Y" type="radio"  name="mower" value="Y"/>
                          <label for="OilFilter_Y">C</label>
                          <input id="OilFilter_NA" type="radio" name="mower" value="NA"/>
                          <label for="OilFilter_NA">N</label>
                        </div></td>                      </tr>
                      <tr>
                        <td class="performance">Oil Change Due</td>
                        <td align="center" class="performance">125,000</td>
                        <td align="left" class="performance"><img src="images/clear.gif" width="40" height="1" /></td>
                           <td class="performance">Windshield wipers</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="WindshieldWipers_Y" type="radio"  name="WindshieldWipers" value="Y"/>
                          <label for="WindshieldWipers_Y">C</label>
                          <input id="WindshieldWipers_NA" type="radio" name="WindshieldWipers" value="NA"/>
                          <label for="WindshieldWipers_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">ATF Level Engine Hot</td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="ATFLevel_Y" type="radio"  name="ATFLevel" value="Y"/>
                          <label for="ATFLevel_Y">C</label>
                          <input id="ATFLevel_NA" type="radio" name="ATFLevel" value="NA"/>
                          <label for="ATFLevel_NA">N</label>
                        </div></td>
                        <td align="left" class="performance">&nbsp;</td>
                        <td align="left" class="performance">Parking brake</td>
                        <td align="center" class="performance"><div class="radio2">
                          <input id="ParkingBrake_Y" type="radio"  name="ParkingBrake" value="Y"/>
                          <label for="ParkingBrake_Y">C</label>
                          <input id="ParkingBrake_NA" type="radio" name="ParkingBrake" value="NA"/>
                          <label for="ParkingBrake_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                         <td class="performance">Inspect Seat Belts</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="SeatBelts_Y" type="radio"  name="SeatBelts" value="Y"/>
                          <label for="SeatBelts_Y">C</label>
                          <input id="SeatBelts_NA" type="radio" name="SeatBelts" value="NA"/>
                          <label for="SeatBelts_NA">N</label>
                        </div></td>
                        <td align="left" class="performance">&nbsp;</td>
                         <td align="left" class="performance">Check power steering fluid level, condition of hoses</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="PowerSteering_Y" type="radio"  name="PowerSteering" value="Y"/>
                          <label for="PowerSteering_Y">C</label>
                          <input id="PowerSteering_NA" type="radio" name="PowerSteering" value="NA"/>
                          <label for="PowerSteering_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Clean Glass, Check for breakage</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="CleanGlass_Y" type="radio"  name="CleanGlass" value="Y"/>
                          <label for="CleanGlass_Y">C</label>
                          <input id="CleanGlass_NA" type="radio" name="CleanGlass" value="NA"/>
                          <label for="CleanGlass_NA">N</label>
                        </div></td>
                        <td align="left" class="performance">&nbsp;</td>
                         <td align="left" class="performance">Grease / axle dump body</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="Grease_Y" type="radio"  name="Grease" value="Y"/>
                          <label for="Grease_Y">C</label>
                          <input id="Grease_NA" type="radio" name="Grease" value="NA"/>
                          <label for="Grease_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                        <td class="performance">Inside cab free garbage</td>
                         <td align="center" class="performance"><div class="radio2">
                          <input id="InsideCab_Y" type="radio"  name="InsideCab" value="Y"/>
                          <label for="InsideCab_Y">C</label>
                          <input id="InsideCab_NA" type="radio" name="InsideCab" value="NA"/>
                          <label for="InsideCab_NA">N</label>
                        </div></td>
                        <td align="left" class="performance">&nbsp;</td>
                        <td align="left" class="performance">Check for current registration</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="CurrentRegistration_Y" type="radio"  name="CurrentRegistration" value="Y"/>
                          <label for="CurrentRegistration_Y">C</label>
                          <input id="CurrentRegistration_NA" type="radio" name="CurrentRegistration" value="NA"/>
                          <label for="CurrentRegistration_NA">N</label>
                        </div></td>
                      </tr>
                      <tr>
                         <td class="performance">Wash Vehicle</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="WashVehicle_Y" type="radio"  name="WashVehicle" value="Y"/>
                          <label for="WashVehicle_Y">C</label>
                          <input id="WashVehicle_NA" type="radio" name="WashVehicle" value="NA"/>
                          <label for="WashVehicle_NA">N</label>
                        </div></td>
                        <td align="left" class="performance">&nbsp;</td>
 <td align="left" class="performance">&nbsp;</td>
                         <td align="center" class="performance">&nbsp;</td>                        <td align="center" class="performance">&nbsp;</td>
                      </tr>
                    </table>
                             
                    <div class="spacer20"></div>
                    
                  
                    <table border="0" width="60%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="performance_header"><div class="subheader">Trailer ID T40</div></td>
                        <td align="center" nowrap="nowrap" class="performanceDate">Complete or NA</td>
                      </tr>
                      <tr>
                        <td width="80%" class="performance">Grease / axle Dump Body</td>
                          <td align="center" class="performance"><div class="radio2">
                          <input id="GreaseTrailer_Y" type="radio"  name="GreaseTrailer" value="Y"/>
                          <label for="GreaseTrailer_Y">C</label>
                          <input id="GreaseTrailer_NA" type="radio" name="GreaseTrailer" value="NA"/>
                          <label for="GreaseTrailer_NA">N</label>
                        </div></td>
                      </tr>
                    </table>
                             
              </div>
            </div>
            <!-- to clear footer -->
        </div>

    </form>
</body>
</html>
