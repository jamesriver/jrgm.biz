
<CFSET todaydate_DS =  DateFormat(now(), "mm/dd/yyyy")>
<cfset y = year(now())>
<cfset m = month(now())>
<cfset d = day(now())>
<cfset today_3PM = createDatetime(y,m,d,15,0,0)>
<cfset timenow = Now()>


<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>

<cfquery name="get_supers" datasource="jrgm">
SELECT [Employee ID] AS Employee_ID,position,[Name FirstLast] AS Employee_Name FROM 
APP_employees WHERE Branch = '#session.branch#'
</cfquery>
 <CFSET mylist ="">
<cfloop query="get_supers">
  <cfset myList = ListAppend(mylist,Employee_ID)>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
 
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<style type="text/css">
 
  .arialfont {font: normal .9em Arial, Helvetica, sans-serif;}
 .redarial {font: normal .9em Arial, Helvetica, sans-serif;color: red;}
  .greenarial {font: normal .9em Arial, Helvetica, sans-serif;color: green;}

 input {
	text-align:left;
}
 .redarial {
	padding-top: 20px;
	font: normal .9em Arial, Helvetica, sans-serif;
	color: red;
}
.redtype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: bold 1em Arial, Helvetica, sans-serif;
	color: red;
}
.greentype {
	padding-top: 10px;
	padding-bottom: 10px;
	font: normal 1em Arial, Helvetica, sans-serif;
	color: #00573d;
}
.notesh2 {
	margin-left: 20px;
	padding: 20px;
	border: 1px solid #dce9e5;
	font: bold 14px Arial, Helvetica, sans-serif;
	color: #00573d;
	background-color: #dce9e5;
}
form{
	margin:0 auto;
}
.search { 
	padding:7px 5px 9px 10px;
	margin:3px; 
}
input[type=text]{
	color:#333;
}
input[type=submit], input[type=submit]:hover {
	padding:8px 10px 10px 10px;
	position:relative; 
	left:-10px;
	border:1px solid #adc5cf;
	background: #333; /* Old browsers */
	background: -moz-linear-gradient(top, #16705a 0%, #00573d 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#16705a), color-stop(100%,#00573d)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #16705a 0%,#00573d 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* IE10+ */
	background: linear-gradient(top, #e4f1f9 0%,#d5e7f3 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f1f9', endColorstr='#d5e7f3',GradientType=0 ); /* IE6-9 */
	color:#fff;
	cursor: pointer;
}

</style>
 </head>
<body>
<!--<div id="outerfull">-->
<div id="centrecontent">
 <cfinclude template="includes/subbar.cfm">  
  <cfinclude template="includes/topbar.cfm">  
<!--centre content goes here -->
<div class="centrecontent_inner">
   <cfset somedate = todayDate>
      <cfset yesterday = dateadd("d",-1,somedate)>
      <cfset tomorrow = dateadd("d",1,somedate)>  

   <form action="daily_sheet_listing_time_compare.cfm" method="post"> 
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap="nowrap"><div class="header">Daily Sheets for <cfoutput>#SESSION.screenname#</cfoutput></div></td>
         <td   align="left" nowrap="nowrap"><input type="text" name="dsid" class="search square" placeholder="Search..."><input type="submit" value="Daily Sheets"> 
         </td>
         </tr>
      </table>
     <input type="hidden"  name="submitted" value="yes"/>
</form> <br />
  
  
<!---   <cfif SESSION.userid EQ 2516>
   <cfquery name="get_daily_sheets" datasource="jrgm"  > 
  <cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >SELECT  * FROM app_daily_sheets  WHERE      ID = #form.dsid#
  <cfelse>
  SELECT    ID, Supervisor_ID, Crew_Leader_ID, DS_Date,ds_approved FROM app_daily_sheets  WHERE      ID  IN (13235,13163,13239,13223,13128,13073,13083,13234,13139,13076,13068,13077,13144,13181,13162,12999,12989,13238,13125,13066,12990,12979,12984,12986,12981,13122,13022,13133,13101,13003,12987,12906,13119,12932,12895,12901,13062,13096,13089,12899,13130,12898,12903,12970,12897,13065,13026,12900,12815,12974,12820,13111,13105,12817,12893,12805,13132,12891,12829,12811,12887,13116,12905,12809,12723,12715,12709,12945,12714,12729,12733,12721,12711,12708,13129,13126,13123,12878,12702,12688,12698,12689,12701,12625,12614,12783,12612,12627,12623,12616,12678,12626,12534,12789,12697,12529,12536,12606,12542,12523,12790,12784,12700,12635,12615,12532,12552,12525,12599,12591,12464,12452,12446,12512,12459,12513,12517,12479,12453,12587,12462,12531,12586,12449,12516,12376,12374,12356,12365,12498,12505,12440,12443,12352,12506,12465,12355,12360,12378,12442,12421,12341,12262,12332,12598,12507,12354,12320,12419,12251,12247,12345,12343,12340,12235,12240,12323,12310,12304,12244,12188,12184,12227,12234,12183,12308,12178,12181,12307,12185,12226,12213,12180,12302,12108,12089,12104,12095,12171,12098,12094,12091,12137,12206,12093,12126,12112,12157,12076,11994,12080,12019,12016,12001,12321,12327,11995,12083,12013,12079,12015,12000,12177,12099,11882,11893,11883,11875,12314,11892,12159,11978,12315,12078,11874,11876,11987,12053,12022,11890,11880,11797,11802,11989,11803,11787,11783,11799,11976,11785,11782,11977,11975,11974,11788,11793,11770,11775,11848,11792,11735,11718,11716,11773,11849,11776,11719,11767,11765,11645,11689,11772,11628,11717,11635,11853,11636,11629,11701,11624,11727,11723,11630,11646,11643,11648,11699,11540,11548,11542,11557,11551,11536,11698,11582,11605,11531,11700,11538,11709,11549,11539,11541,11755,11507,11474,11482,11463,11458,11493,11550,11620,11460,11753,11602,11454,11459,11461,11383,11372,11604,11374,11373,11357,11362,11376,11369,11515,11453,11365,11355,11406,11340,11341,11345,11519,11299,11295,11432,11290,11287,11332,11410,11360,11337,11283,11338,11301,11284,11296,11342,11297,11200,11216,11279,11211,11199,11294,11202,11275,11208,11193,11326,11318,11195,11205,11207,11196,11264,11122,11117,11278,11119,11105,11121,11120,11114,11292,11285,11217,11115,11024,11145,11023,11276,11094,11019,11171,11018,11020,11013,11108,11086,11022,11091,11027,10925,10924,10928,10916,11064,11012,10933,10917,11069,11084,10929,10921,10922,10903,10901,10841,10846,10844,10850,10849,10847,10867,10848,10842,10895,10979,10845,10781,10871,10777,10769,10780,10776,10840,10768,10803,10986,10981,10772,10773,10779,10770,10775,10745,10663,10744,10672,10666,10670,10836,10883,10671,10661,10667,10676,10833,10733,10696,10673,10566,10572,10743,10570,10562,10567,10574,10579,10602,10739,10568,10724,10722,10727,10732,10476,10630,10472,10483,10473,10740,10467,10485,10470,10477,10480,10741,10582,10701,10431,10442,10453,10469,10433,10528,10451,10534,10432,10531,10521,10518,10363,10361,10369,10430,10533,10450,10372,10364,10542,10365,10368,10366,10526,10408,10407,10424,10282,10285,10360,10287,10272,10273,10280,10277,10275,10281,10307,10274,10527,10334,10284,10279,10245,10204,10191,10190,10194,10188,10201,10195,10193,10197,10222,10250,10174,10086,10030,10028,10031,10032,10029,10039,10105,10060,9960,10057,9965,9969,9961,9956,9967,9962,9958,9966,9964,9959,10025,9963,10104,10065,10061,10024,9957,9878,9871,10020,9877,9870,9867,9882,9866,9936,9868,9872,9876,9923,9910,9784,9832,10017,9786,9847,9782,9783,9795,9790,9794,9817,9787,9789,9881,9918,9695,9741,9688,9678,9691,9686,9692,9680,9679,10016,9685,9684,9681,9814,9658,9655,9739,9748,9632,9620,9618,9617,9634,9623,9744,9661,9556,9545,9654,9551,9557,9547,9550,9543,9548,9549,9554,9552,9609,9558,9596,9594,9450,9452,9532,9448,9444,9520,9445,9540,9446,9443,9455,9449,9479,9447,9492,9454,9344,9353,9456,9347,9348,9354,9350,9349,9352,9355,9505,9478,9361,9508,9453,9417,9244,9351,9253,9246,9243,9241,9255,9248,9247,9245,9254,9216,9217,9218,9171,9169,9172,9215,9504,9507,9418,9123,9115,9159,9219,9121,9117,9111,9112,9113,9119,9114,9116,9143,9493,9419,9039,9035,9038,9050,9120,9083,9037,9040,9041,9044,9509,9086,9043,9046,9499,9494,9036,8976,9011,9085,8970,8972,8968,8974,8978,8969,8980,9511,9007,9082,8979,8971,8952,8838,9497,8825,8950,8824,8829,8827,9004,8828,8833,9512,8832,8826,8798,8797,8795,8792,8793,8794,8800,8912,8887,8744,8778,8733,8743,8745,8739,8740,8885,8735,8738,8737,8830,8742,8741,8762,8849,8665,8653,8663,8765,8658,8654,8725,8650,8664,8655,8657,8660,8659,8652,8727,8879,8864,8573,8569,8560,8571,8772,8561,8559,8582,8564,8633,8566,8567,8563,8562,8629,8580,8493,8543,8494,8497,8517,8570,9360,8903,8898,8470,8392,8512,8396,8382,8391,8388,8482,8380,8386,8387,8381,8390,8892,8435,8431,8883,8878,8358,8359,8362,8360,8361,8419,8363,8447,8356,8321,8342,8309,8314,8323,8310,8411,8448,8315,8319,8322,8311,8357,8478,8312,8320,8313,8218,8241,8345,8217,8203,8204,8207,8206,8212,8200,8244,8214,8249,8458,8226,8347,8225,8213,8122,8158,8284,8132,8120,8210,8179,8178,8161,8140,8248,8137,8169,8442,8436,8037,8047,8042,8046,8035,8289,8131,8036,8044,8110,8043,8040,8045,8108,8439,8072,7938,7941,7940,8048,7933,7934,7927,7943,7936,7932,8033,7939,7935,7913,7912,7907,7905,7906,7909,8007,7879,7876,7869,7877,7875,7868,7910,7866,7865,7872,7870,7884,7874,8006,7974,7806,7789,7787,7895,7798,7804,7792,7790,7805,7799,7793,7826,7809,7976,7840,7788,7844,7697,7701,7702,7707,7705,7695,7699,7698,7700,7727,7703,7980,7978,7713,7676,7601,7599,7606,7589,7594,7587,7596,7623,7982,7591,7706,7786,7526,7540,7517,7525,7522,7514,7519,7981,7520,7515,7598,7521,7518,7495,7494,7496,7565,7516,7487,7492,7490,7484,7493,7485,7489,7563,7486,7488,7564,7435,7472,7436,7427,7429,7434,7425,7428,7424,7430,7477,7426,7452,7431,7357,7351,7370,7352,7364,7353,7354,7346,7369,7350,7356,7368,7355,7361,7416,7569,7362,7348,7278,7286,7271,7279,7300,7276,7266,7270,7268,7272,7273,7277,7275,7406,7205,7203,7210,7202,7200,7209,7211,7195,7201,7208,7207,7206,7320,7319,7257,7245,7256,7255,7252,7181,7176,7180,7167,7150,7474,7179,7175,7174,7164,7178,7171,7159,9514,9513,9510,9506,9503,9416,9413,9411,9410,473,10740,10467,10485,10470,10477,10480,10741,10582,10701,10431,10442,10453,10469,10433,10528,10451,10534,10432,10531,10521,10518,10363,10361,10369,10430,10533,10450,10372,10364,10542,10365,10368,10366,10526,10408,10407,10424,10282,10285,10360,10287,10272,10273,10280,10277,10275,10281,10307,10274,10527,10334,10284,10279,10245,10204,10191,10190,10194,10188,10201,10195,10193,10197,10222,10250,10174,10086,10030,10028,10031,10032,10029,10039,10105,10060,9960,10057,9965,9969,9961,9956,9967,9962,9958,9966,9964,9959,10025,9963,10104,10065,10061,10024,9957,9878,9871,10020,9877,9870,9867,9882,9866,9936,9868,9872,9876,9923,9910,9784,9832,10017,9786,9847,9782,9783,9795,9790,9794,9817,9787,9789,9881,9918,9695,9741,9688,9678,9691,9686,9692,9680,9679,10016,9685,9684,9681,9814,9658,9655,9739,9748,9632,9620,9618,9617,9634,9623,9744,9661,9556,9545,9654,9551,9557,9547,9550,9543,9548,9549,9554,9552,9609,9558,9596,9594,9450,9452,9532,9448,9444,9520,9445,9540,9446,9443,9455,9449,9479,9447,9492,9454,9344,9353,9456,9347,9348,9354,9350,9349,9352,9355,9505,9478,9361,9508,9453,9417,9244,9351,9253,9246,9243,9241,9255,9248,9247,9245,9254,9216,9217,9218,9171,9169,9172,9215,9504,9507,9418,9123,9115,9159,9219,9121,9117,9111,9112,9113,9119,9114,9116,9143,9493,9419,9039,9035,9038,9050,9120,9083,9037,9040,9041,9044,9509,9086,9043,9046,9499,9494,9036,8976,9011,9085,8970,8972,8968,8974,8978,8969,8980,9511,9007,9082,8979,8971,8952,8838,9497,8825,8950,8824,8829,8827,9004,8828,8833,9512,8832,8826,8798,8797,8795,8792,8793,8794,8800,8912,8887,8744,8778,8733,8743,8745,8739,8740,8885,8735,8738,8737,8830,8742,8741,8762,8849,8665,8653,8663,8765,8658,8654,8725,8650,8664,8655,8657,8660,8659,8652,8727,8879,8864,8573,8569,8560,8571,8772,8561,8559,8582,8564,8633,8566,8567,8563,8562,8629,8580,8493,8543,8494,8497,8517,8570,9360,8903,8898,8470,8392,8512,8396,8382,8391,8388,8482,8380,8386,8387,8381,8390,8892,8435,8431,8883,8878,8358,8359,8362,8360,8361,8419,8363,8447,8356,8321,8342,8309,8314,8323,8310,8411,8448,8315,8319,8322,8311,8357,8478,8312,8320,8313,8218,8241,8345,8217,8203,8204,8207,8206,8212,8200,8244,8214,8249,8458,8226,8347,8225,8213,8122,8158,8284,8132,8120,8210,8179,8178,8161,8140,8248,8137,8169,8442,8436,8037,8047,8042,8046,8035,8289,8131,8036,8044,8110,8043,8040,8045,8108,8439,8072,7938,7941,7940,8048,7933,7934,7927,7943,7936,7932,8033,7939,7935,7913,7912,7907,7905,7906,7909,8007,7879,7876,7869,7877,7875,7868,7910,7866,7865,7872,7870,7884,7874,8006,7974,7806,7789,7787,7895,7798,7804,7792,7790,7805,7799,7793,7826,7809,7976,7840,7788,7844,7697,7701,7702,7707,7705,7695,7699,7698,7700,7727)
    </cfif>
  ORDER by ds_date DESC, ID DESC  </cfquery>
  <cfelse> --->
   <cfquery name="get_daily_sheets" datasource="jrgm"   >
 SELECT  ID, Supervisor_ID, Crew_Leader_ID, DS_Date,ds_approved FROM app_daily_sheets 
WHERE ds_date < '#todaydate_DS#'   AND    Supervisor_ID = #SESSION.userid#
<cfif IsDefined("form.submitted")  AND form.dsid NEQ "" >AND    ID = #form.dsid#</cfif>
ORDER by ID DESC
 </cfquery> 
<!---  </cfif> --->
 
 <cfif  get_daily_sheets.recordcount EQ 0>
 <span class="arialfont">No Daily Sheets Match Your Criteria.</span>
 <cfabort>
 </cfif>
 <cfset perpage = 50>
 <cfparam name="url.start" default="1">
<cfif not isNumeric(url.start) or url.start lt 1 or url.start gt get_daily_sheets.recordCount or round(url.start) neq url.start>
    <cfset url.start = 1>
</cfif>
 <cfset totalPages = ceiling(get_daily_sheets.recordCount / perpage)>
<cfset thisPage = ceiling(url.start / perpage)>
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
    <td>[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets  </a></cfoutput>
<cfelse>
 <!---   Newer Daily Sheets --->
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
   <!--- Older Daily Sheets --->
</cfif>
]
 </td> 
  <td><cfoutput>
 You are on page #thisPage# of #totalPages#.
 </cfoutput>
 </td>
  </tr>
</table> 
 <table class="sortable" cellpadding="0" cellspacing="0" width="90%">
    <thead>
       <tr>
        <th align="left">ID
          </td>        </th>
        <th align="left">Date
          </td>        </th>
        <th align="left">Branch
          </td>        </th>
        <th align="left">Supervisor
          </td>        </th>
        <th align="left">Crew Leader
          </td>        </th>
        <th align="left">View
          </td>        </th>
        <th align="right">Day <br />
         Time</th>
        <th align="right">Service <br />
         Time</th>
        <th align="right">Minute<br />
         Difference</th>
        <th align="right">%<br />
         Accounted<br />
         For</th>
        <th align="center">Type</th>
         <th align="left">Edit</th>
      </tr>
    </thead>
    <tbody>
    
 <CFSET startrow = #url.start#>
 <CFSET endrow = startrow+50>
 <CFSET mylist ="">
 <cfloop query="get_daily_sheets"  startrow="#startrow#" endrow="#endrow#">
  <cfset myList = ListAppend(mylist,ID)>
</cfloop>

<cfquery name="get_all_gps_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT ds_ID FROM app_gps WHERE   ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_time_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_employee_payroll_clock WHERE ds_ID IN (#mylist#) 
</cfquery>
<cfquery name="get_all_employee_service_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#">
SELECT * FROM app_job_services_actual_employee WHERE ds_ID IN (#mylist#) 
</cfquery>
       <cfoutput query="get_daily_sheets" startrow="#url.start#" maxrows="#perpage#">
        <cfquery name="get_info_CL" datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.crew_leader_id#
        </cfquery>
        <cfquery name="get_info_S" datasource="jrgm" cachedwithin="#createTimespan(0,8,0,0)#">
SELECT  [Name FirstLast] AS employee_name,branch
FROM   app_employees WHERE [Employee ID] =#get_daily_sheets.supervisor_id#
        </cfquery>
        <tr>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">#get_daily_sheets.ID#</a></td>
          <td nowrap="nowrap">#dateformat(ds_date,"mm/dd/yyyy")#</td>
          <td align="left">#get_info_S.branch#</td>
          <td>#get_info_S.employee_name#</td>
          <td>#get_info_CL.employee_name#</td>
          <td><a href="daily_sheet.cfm?dsid=#get_daily_sheets.ID#">View</a></td>
           <cfquery name="get_employee_minutes_for_day"   dbtype="query" maxrows="1">
SELECT Sum(time_worked) AS  minutes_worked_day FROM  get_all_employee_time_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                 <cfif get_employee_minutes_for_day.minutes_worked_day EQ "">
                <CFSET get_employee_minutes_for_day.minutes_worked_day = 0>
                </cfif>
                
                 <cfif get_employee_minutes_for_day.recordcount EQ 0>
                <CFSET minutes_worked_day = 0>
                <cfelse>
                <CFSET minutes_worked_day = #get_employee_minutes_for_day.minutes_worked_day#>
                </cfif>
           <td align="right">#minutes_worked_day#</td>
            <cfquery name="get_employee_service_minutes_for_day"  dbtype="query" maxrows="1">
SELECT Sum(total_time) AS  service_minutes_worked_day FROM  get_all_employee_service_info WHERE ds_id =#get_daily_sheets.ID#
                </cfquery>
                <cfif get_employee_service_minutes_for_day.recordcount EQ 0>
                <CFSET service_minutes_worked_day = 0>
                <cfelse>
                <CFSET service_minutes_worked_day = #get_employee_service_minutes_for_day.service_minutes_worked_day#>
                </cfif>
          <td align="right">#service_minutes_worked_day#</td>
          <cfset diff =service_minutes_worked_day- minutes_worked_day>
          <td align="right">#diff#</td>
          <cfif service_minutes_worked_day EQ 0 OR  minutes_worked_day EQ 0>
          <CFSET diffper = 0>
           <cfelse>
           <cfset diffper=100*get_employee_service_minutes_for_day.service_minutes_worked_day/get_employee_minutes_for_day.minutes_worked_day> </cfif>
        <cfif diffper GT 100  OR diffper LT 80>  
        <td align="right"  class="redarial">#NumberFormat(diffper,"09.9")#</td>
        <cfelse>
        <td align="right">#NumberFormat(diffper,"09.9")#</td>
        </cfif>
         <td align="center">
  <cfquery name="get_ds_edits" datasource="jrgm" maxrows="1" blockfactor="1">
SELECT   ds_id FROM app_employee_payroll_clock_backup WHERE ds_id =#get_daily_sheets.ID#
 </cfquery>  
  <cfquery name="nogps"   dbtype="query" maxrows="1" blockfactor="1">
SELECT     ds_ID
FROM        get_all_gps_info
WHERE     ds_id =  #get_daily_sheets.ID#
 </cfquery>
  <cfif get_ds_edits.recordcount GT 0  OR nogps.recordcount EQ 0 >
 Manual 
 <cfelse>
 APK
  </cfif>
 </td> 
     <cfif       ((ds_date LTE  yesterday) OR  ((ds_date EQ  todaydate_DS)  AND timenow GT today_3PM)) >
                <cfif get_daily_sheets.ds_approved EQ 1>
                  <td><a href="daily_sheet.cfm?dsid=#ID#" class="greenarial">Approved</a></td>
                  <cfelse>
                  <td><a href="daily_sheet.cfm?dsid=#ID#&email=yes">Edit</a> </td>
                </cfif>
                <cfelse>
                <td> -</td>
              </cfif>
     </tr>
      </cfoutput>
    </tbody>
  </table>
   <table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tr class="arialfont">
     <td> 
 </td><td align="right">[
<cfif url.start gt 1>
    <cfset link = cgi.script_name & "?start=" & (url.start - perpage)>
    <cfoutput><a href="#link#">Newer Daily Sheets</a></cfoutput>
<cfelse>
    Newer Daily Sheets
</cfif>
/
<cfif (url.start + perpage - 1) lt get_daily_sheets.recordCount>
    <cfset link = cgi.script_name & "?start=" & (url.start + perpage)>
    <cfoutput><a href="#link#">Older Daily Sheets</a></cfoutput>
<cfelse>
  Older Daily Sheets
</cfif>
]
 </td> 
 
  
  </tr>
</table> 
  
</div></div>
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
</body>
</html>
