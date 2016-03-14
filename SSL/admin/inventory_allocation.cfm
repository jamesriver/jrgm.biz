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
<title>James River Grounds Management</title>
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
</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
    <cfinclude template="includes/subbar.cfm">
    <cfinclude template="includes/topbar.cfm">
    <!--centre content goes here -->
    <div class="centrecontent_inner">
      <div class="header">Inventory&nbsp;&nbsp;&nbsp;&nbsp;</div>
      <article class="accordion-a">
        <section>
          <header>
            <h1>Aerators</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">AERATOR LESCO WALK 26&quot;</td>
                <td align="center" valign="top" class="vehicle_inventory">23-12</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">AERATOR LESCO WALK 26&quot;</td>
                <td align="center" valign="top" class="vehicle_inventory">23-13</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">AERATOR LESCO WALK 26&quot;</td>
                <td align="center" valign="top" class="vehicle_inventory">23014</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN 60TOW AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-15</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN 60TOW AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-16</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN TA-19D AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-17</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN TA-25D AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-18</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option selected="selected">Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not in Repair</option>
                      <option selected="selected">ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">11/12/13</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN TA-25D AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-19</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CLASSEN TA-25D AERATOR</td>
                <td align="center" valign="top" class="vehicle_inventory">23-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Blowers</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7100 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12345</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7100 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12346</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7100 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12347</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7100 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12348</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option selected="selected">Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not in Repair</option>
                      <option selected="selected">ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory"><em>Pending</em></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7150 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12349</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7150 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12350</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7150 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12351</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7500 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12352</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 7500 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12353</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HBZ 2601 BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12354</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">EBZ 8001  BLOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">12355</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Chainsaws</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX CHAINSAW 3500</td>
                <td align="center" valign="top" class="vehicle_inventory">C-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX CHAINSAW 5300</td>
                <td align="center" valign="top" class="vehicle_inventory">C-21</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX CHAINSAW 5300</td>
                <td align="center" valign="top" class="vehicle_inventory">C-22</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX CHAINSAW G3100T</td>
                <td align="center" valign="top" class="vehicle_inventory">C-23</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX CHAINSAW G3100T</td>
                <td align="center" valign="top" class="vehicle_inventory">C-24</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Edgers</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HE225F EDGER </td>
                <td align="center" valign="top" class="vehicle_inventory">E-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HEZ2460F EDGER </td>
                <td align="center" valign="top" class="vehicle_inventory">E-21</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HEZ2460F EDGER </td>
                <td align="center" valign="top" class="vehicle_inventory">E-22</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HEZ2460F EDGER </td>
                <td align="center" valign="top" class="vehicle_inventory">E-23</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> HE225F EDGER</td>
                <td align="center" valign="top" class="vehicle_inventory">E-24</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> HEZ2602 EDGER</td>
                <td align="center" valign="top" class="vehicle_inventory">E-25</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> HEZ2602 EDGER JESUS</td>
                <td align="center" valign="top" class="vehicle_inventory">E-26</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HE225F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-27</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HE225F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-28</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option selected="selected">Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option selected="selected">Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">11/15/13</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HE225F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-29</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HE225F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-30</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HEZ2460F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-31</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX  EDGER HEZ2601F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-32</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX EDGER HEZ2460F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-33</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX EDGER HEZ2460F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-34</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory"> REDMAX EDGER HEZ2460F</td>
                <td align="center" valign="top" class="vehicle_inventory">E-35</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Mowers</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-21</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-22</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-23</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-24</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-25</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-26</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-27</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">HONDA HRC2163HXA 21&quot; MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-28</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">KUBOTA  ZD331LP-72 MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-29</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">WRIGHT 3615 HYDRO MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-30</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">WRIGHT 3617 HYDRO MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-31</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option selected="selected">Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option selected="selected">Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">11/06/13</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">WRIGHT 48&quot; VELKE MOWER</td>
                <td align="center" valign="top" class="vehicle_inventory">M-32</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Shears</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">CHT2200 SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX SRTZ2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-21</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401 SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-22</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-23</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-24</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-25</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-26</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-27</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option selected="selected">Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not in Repair</option>
                      <option selected="selected">ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">11/05/13</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-28</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ2401F LONG SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-29</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ2401F LONG SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-30</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-31</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">SRTZ 2401F SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-32</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">STRZ2460F  SHEARS</td>
                <td align="center" valign="top" class="vehicle_inventory">S-33</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
        <section>
          <header>
            <h1>Weedeaters</h1>
          </header>
          <div class="content">
            <table width="100%" border="0" cellpadding="0"cellspacing="0">
              <tr>
                <td valign="top" class="vehicle_inventory"><strong>Name</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>ID</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>Assigned To</strong></td>
                <td valign="top" class="vehicle_inventory"><strong>In Repair</strong></td>
                <td align="center" valign="top" class="vehicle_inventory"><strong>Repair Comp. Date</strong></td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2401S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-20</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2401S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-21</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2401S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-22</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2401S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-23</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option selected="selected">Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-24</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-25</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option selected="selected">Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-26</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option selected="selected">Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-27</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option selected="selected">Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-28</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option>Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option selected="selected">Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-29</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" class="vehicle_inventory">REDMAX BCZ2460S WEEDEATER</td>
                <td align="center" valign="top" class="vehicle_inventory">W-30</td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not Assigned</option>
                      <option>Out for Repair</option>
                      <option>Bon Ouk</option>
                      <option>Ovidio Lemus</option>
                      <option>Robert Bailey</option>
                      <option>Rogelio Almoite</option>
                      <option>Ryland Singleton</option>
                    </select>
                  </div></td>
                <td valign="top" class="vehicle_inventory"><div class="styled-select2">
                    <select name="select" class="styled-select2" id="select">
                      <option selected="selected">Not in Repair</option>
                      <option>ABC Equipment Repair</option>
                      <option>Lawn Equipment Repair</option>
                      <option>Machine Repair</option>
                    </select>
                  </div></td>
                <td align="center" valign="top" class="vehicle_inventory">&nbsp;</td>
              </tr>
            </table>
          </div>
        </section>
      </article>
    </div>
  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div --><!-- end outer div -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> -->
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script>
<script src="js/twitter-bootstrap-hover-dropdown.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script src="js/jquery.accordion-a-1.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.accordion-a').accordionA();
	});
	</script>
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
