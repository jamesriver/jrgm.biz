<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset todayDate_dow = DayOfWeek(todayDate)>
<cfif todayDate_dow EQ 2>
  <CFSET todayDate_dow_v = "Mon">
  <cfelseif   todayDate_dow EQ 3>
  <CFSET todayDate_dow_v = "Tues">
  <cfelseif   todayDate_dow EQ 4>
  <CFSET todayDate_dow_v = "Wed">
  <cfelseif   todayDate_dow EQ 5>
  <CFSET todayDate_dow_v = "Thur">
  <cfelseif   todayDate_dow EQ 6>
  <CFSET todayDate_dow_v = "Fri">
  <cfelseif   todayDate_dow EQ 7>
  <CFSET todayDate_dow_v = "Sat">
  <cfelseif   todayDate_dow EQ 1>
  <CFSET todayDate_dow_v = "Sun">
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
<script type="text/javascript">
       $(function(){
    var now = new Date();

    $('#timein1').mobiscroll().datetime({
        minDate: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
		timeFormat: 'H:ii',
        theme: 'ios',
        display: 'inline',
        mode: 'scroller'
    });    
});

          
    </script>
<script type="text/javascript">
       $(function(){
    var now = new Date();

    $('#timeout1').mobiscroll().datetime({
        minDate: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
		timeFormat: 'H:ii',
        theme: 'ios',
        display: 'inline',
        mode: 'scroller'
    });    
});

          
    </script>
<script type="text/javascript">
       $(function(){
    var now = new Date();

    $('#timein2').mobiscroll().datetime({
        minDate: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
		timeFormat: 'H:ii',
        theme: 'ios',
        display: 'inline',
        mode: 'scroller'
    });    
});

          
    </script>
<script type="text/javascript">
       $(function(){
    var now = new Date();

    $('#timeout2').mobiscroll().datetime({
        minDate: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
		timeFormat: 'H:ii',
        theme: 'ios',
        display: 'inline',
        mode: 'scroller'
    });    
});

          
    </script>
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
          <td class="header">Create a Daily Sheet</td>
        </tr>
      </table>
      <form class="css_form" action="dailysheet_select_crew.cfm" method="post">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr class="header2">
            <td class="dailysheet_header">Select Crew Leader </td>
            <td class="dailysheet_header">Select Date</td>
          </tr>
          <tr>
            <td align="left"><cfquery name="get_employees" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name,[Ph Home] AS homephone,[Ph Cell] As cellphone FROM APP_employees WHERE Direct_Supervisor_ID = #SESSION.userid# AND active_record =1
</cfquery>
              <fieldset>
              <div class="select_element">
                <select name="CREW_LEADER_ID">
                  <CFOUTPUT QUERY="get_employees">
                    <option value="#Employee_ID#">#Employee_Name#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                  </CFOUTPUT>
                </select>
              </div>
              </fieldset></td>
            <cfset dtStart = "06/01/2013" />
            <cfset dtEnd = "12/31/2013" />
            <td><fieldset>
              <div class="select_element">
                <select name="ds_date">
                  <cfloop index="date" from="#dtStart#" to="#dtEnd#" step="1">
                    <cfoutput>
                      <option value="#DateFormat(date, "mm/dd/yyyy")#">#DateFormat(date, "dddd, mmmm dd, yyyy")#
                      <!--- #date# --->
                      </option>
                    </cfoutput>
                  </cfloop>
                </select>
              </div>
              </fieldset>
              <!--<label for="text_field" class="left_element"><span class="required">*</span></label>-->
            </td>
          </tr>
          <tr>
            <td></td>
            <td><div class="spacer20"></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td align="right"><input type="submit" name="submit"   value="SUBMIT" class="bluebutton" /></td>
          </tr>
        </table>
      </form>
    </div>
    <!--Html-->
  </div>
</div>
<!-- to clear footer -->
</div>
<!-- end outer div -->
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
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
