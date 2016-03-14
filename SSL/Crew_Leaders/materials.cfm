<cfparam name="Session.job_id" default="0000">

 

 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/mobiscroll.core-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.core-2.4.4.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.select-2.4.2.js" type="text/javascript"></script>
<script src="js/mobiscroll.datetime-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.list-2.4.4.js" type="text/javascript"></script>
<script src="js/mobiscroll.jqm-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.jqm-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.ios-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.ios-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-ics-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-ics-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.android-2.4.2.js" type="text/javascript"></script>
<link href="css/mobiscroll.android-2.4.2.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.sense-ui-2.4.2.css" rel="stylesheet" type="text/css" />
<script src="js/mobiscroll.wp-2.4.4.js" type="text/javascript"></script>
<link href="css/mobiscroll.wp-2.4.4.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.animation-2.4.2.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<link href="js/betterCheckbox.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/betterCheckbox.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){ 
		$('#crew1').betterCheckbox();
		$('#crew2').betterCheckbox();
		$('#crew3').betterCheckbox();
		$('#crew4').betterCheckbox();
		$('#crew5').betterCheckbox();
		$('#crew6').betterCheckbox();
		$('#crew7').betterCheckbox();
		$('#crew8').betterCheckbox();
		$('#crew9').betterCheckbox();
		$('#crew10').betterCheckbox();
	});
	</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/topbar.cfm">
    <cfinclude template="includes/subbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
    
        <div class="subheader">Ironbridge Medical</div>
   
      <div class="spacer10"></div>
      <form class="css_form" action="job_materials_logic.cfm"  method="post">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="dailysheet_header">Material Name</td>
            <td class="dailysheet_header"><img src="images/clear.gif" width="60" height="1" /></td>
            <td class="dailysheet_header">Quantity</td>
          </tr>
          <tr>
            <td valign="top"><cfquery name="get_materials_list" datasource="jrgm">
				SELECT *  FROM app_materials_list order by sortid
				</cfquery>
              <fieldset>
              <div class="select_element">
                <SELECT name="materials_name_used">
                  <CFOUTPUT QUERY="get_materials_list">
                    <OPTION value="#Item_ID#">#Item_ID#</OPTION>
                  </CFOUTPUT>
                </SELECT>
              </div>
              </fieldset></td>
            <td align="center">&nbsp;</td>
            <td valign="top"><input name="materials_quantity_used" type="text" class="textbox"    size="5"  style="text-align: right"  maxlength="4"  />
              <div class="spacer20"></div>
              <div class="dailysheet_header">Unit</div>
              <fieldset>
              <div class="select_element_date">
                <SELECT name="materials_unit">
                  <OPTION value="Bags">Bags</OPTION>
                  <OPTION value="Cubic Yards">Cubic Yards</OPTION>
                  <OPTION value="Gallons">Gallons</OPTION>
                  <OPTION value="Ounces">Ounces</OPTION>
                  <OPTION value="Pots">Pots</OPTION>
                  <OPTION value="Pounds">Pounds</OPTION>
                  <OPTION value="Yards">Yards</OPTION>
                </SELECT>
              </div>
              </fieldset>
              <div class="spacer40"></div>
              <input type="submit" name="materials_used"   value="SUBMIT" class="bluebutton" /></td>
          </tr>
        </table>
   
          
      </form>
      <div class="spacer20"></div>
      <div class="subheader">Materials Used</div>
      <table border="0" cellspacing="0" cellpadding="0">
    
       
      </table>
      <p>&nbsp;</p>
      <p><a href="services.htm">Go back to beginning of demo</a></p>
    </div>
  </div>
  <div id="clearfooter"></div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
 <script src="js/jquery.pageslide.min.js"></script>
    <script>
        /* Default pageslide, moves to the right */
        $(".first").pageslide();
        
        /* Slide to the left, and make it model (you'll have to call $.pageslide.close() to close) */
        $(".second").pageslide({ direction: "left", modal: true });
    </script>
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
 