<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<title>James River Grounds Management</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/styles_dl.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

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
<script type="text/javascript">

        $(document).ready(function() {

  if (navigator.userAgent.match(/Android/i)) {
    window.scrollTo(0,0); // reset in case prev not scrolled  
    var nPageH = $(document).height();
    var nViewH = window.outerHeight;
    if (nViewH > nPageH) {
      nViewH -= 150;
      $('BODY').css('height',nViewH + 'px');
    }
    window.scrollTo(0,1);
  }

});

</script>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
  
  
<div class="subbar">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="57"><a href="default.cfm"><img src="images/logosm.png" width="57" height="36" alt="James River Grounds Management" /></a></td>
      <td width="45%" class="subbartxt">Welcome: Crew Leader</td>
          <td width="50%" align="right"><div class="subbarjobname">Job Started: <a href="" class="white"> Test Job</div>
        </td>

         <td width="20"><img src="images/clear.gif" width="20" height="2" alt="" /></td>
    </tr>
  </table>
</div>


<div class="topbar">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="subheader" align="center">You must enter Services before leaving this page.</td>
        <td><img src="images/clear.gif" width="10" height="1" /></td>
      </tr>
    </table>
  </div>

    
    <!--centre content goes here -->
    <div class="centrecontent_inner">
        <div class="subheader">Job Name</div>
      <form class="css_form" action="job_services_logic.cfm" method="post">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%" class="dailysheet_header">Employee Time Allotment</td>
          </tr>
          <tr>
            <td width="60%" valign="top">
  
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>&nbsp;</td>
                        <td align="left">
                          <table class="table table-striped">
                            <tr>
                              <td><input name="Employee_ID" type="checkbox" class="big-checkbox" id="" value=""  /></td>
                              <td>Neftali Alvarado -3446</td>
                              <td>32 Minutes</td>
                            </tr>
                             <tr>
                              <td><input name="Employee_ID" type="checkbox" id="" value=""  /></td>
                              <td>Micah Nunnally -2937</td>
                              <td>32 Minutes</td>
                            </tr>
                            <tr>
                              <td><input name="Employee_ID" type="checkbox" id="" value=""  /></td>
                              <td>Rafael Osornio -1291</td>
                              <td>32 Minutes</td>
                            </tr>
                            <tr>
                              <td><input name="Employee_ID" type="checkbox" id="" value=""  /></td>
                              <td>Aristides Valladares -3439</td>
                              <td>32 Minutes</td>
                            </tr>
                          </table>
                          <!---    </a>  --->
                      </td>
                      </tr>
                    </table>
             </td>
          </tr>
        </table>
      <a id="top"></a><div class="spacer40"></div>
        <div class="subheader">Services</div>
        <table class="table table-hover">
        <thead>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
            <th><div align="center">Add Minutes</div></th>
          </thead>
          <tbody>
          <tr>
            <td><a href="seasonal.htm#top">1000 - SEASONAL SERVICE</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td class="table-select"><a href="turf.htm#top">1100 - TURF CARE</a></td>
            <td >1101 - Turf Pre (G)</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td >1102 - Turf Pre (L)</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td >1103 - Turf Post</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td class="table-select">1104 - Turf Fert</td>
            <td class="table-select"><div align="center"> <input name="textfield" type="text" class="textbox" id="textfield" size="4" /></div></td>
          </tr>
          <tr>
            <td></td>
            <td >1105 - Turf Lime</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td >1106 - Turf Aeration (Hand)</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td >1107 - Turf Aeration (Tractor)</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td >1108 - Turf Seed</td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td >1109 - Turf Inscecticide</td>
            <td></td>
          </tr>
          <tr>
            <td><a href="tree.htm#top">1200 - TREE &amp; SHRUB   CARE</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="mulch.htm#top">1300 - MULCH SERVICE</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="seasonal-color.htm#top">1400 - SEASONAL COLOR</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="miscellaneous.htm#top">1500 - MISCELLANEOUS   SERVICES</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="day-porter.htm#top">1600 - DAY PORTER</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="off-season.htm#top">1700 - OFF SEASON SERVICE</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="enhancement.htm#top">2000 - ENHANCEMENT</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="irrigation.htm#top">3000 - IRRIGATION SERVICE</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td><a href="snow.htm#top">7000 - SNOW SERVICES</a></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td></td>
            <td><div align="center"><button type="button" class="btn btn-primary"  onclick="window.location.href='/services-summary.htm'">Submit</button></div></td>
          </tr>
          </tbody>
        </table>
       
      </form>
  
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div -->
   
<script scr="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>

</body>
</html>
