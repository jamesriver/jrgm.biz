<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<style>
table {
	font-family: Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
	font-size: 16px;
	color: #000000;
}
td {
	vertical-align: top;
	color: #2D2D2D;
}
.redfont {
	color: #000000
}
.red2 {
	color: #F40A0A;
}
</style>
</head>

<body>
<table width="95%" border="2" align="center" cellpadding="5" cellspacing="1">
  <tbody>
    <tr>
      <td colspan="2" ><p><strong>These are the 4 tablet types we are currently using</strong></p>
        <p>We 
        need to make sure APP looks good on all of these</p>
        <p>•	Samsung Galaxy - Model Number SCH-i705<br>
          •	Verizon Ellipsis - Model Number QMV7B<br>
          •	Verizon Ellipsis -    QMV7A<br>
          •	LG G Pad - VK810<br>
        </p></td>
    </tr>
    <tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="center" ><strong style="color: #F40A0A; ">This is a critical error!!</strong></td>
    </tr>
    <tr>
      <td  width="450" ><p><strong>Issue 1:&nbsp; APP letting me by pass accounting for all service time.<br>
        </strong><br>
        I did just  re-create the same issue that I mentioned to you guys before.&nbsp; Here is  what I did...</p>
        <p>I was at the  apply service code screen.&nbsp; I applied time for 1/2 the crew and then  navigated away from the app (like I did accidentally before).&nbsp; It had me  log back in and it put me to the log in screen with no way of going back to  that job and allocating the rest of the time.&nbsp; It seems that we must have  it go right back to that same screen or we have a very big hole</p></td>
      <td ><ol>
        <li>Start Job</li>
        <li>End Job</li>
        <li>Enter time for some employees but not all or don't enter any time at all</li>
        <li>Leave the APP or Turn off the tablet</li>
        <li>Turn tablet back on and Log back in</li>
      </ol>
        <p>When I come back to the APP it lets me proceed without accounting for all of the service time. This must be a change in this version because I think in the current production version even if you log out or turn the APP off when you log back in it forces you to enter all service time for all employees before proceeding. We need to put in a check that makes sure that all time is accounted for</p>
        <p>&nbsp;</p></td>
    </tr>
    <tr>
      <td colspan="2" align="center" ><strong style="color: #F40A0A; ">This is a critical error!!</strong></td>
    </tr>
    <tr>
      <td width="450" ><strong>Issue 2: Employee Service info not being recorded in data tables</strong><br>
        <br>
        <br>
      See this <a href="Screenshots/JRGM _ Daily Sheet 32722.pdf">daily sheet </a></td>
      <td > On this daily sheet the crew leader worked 6 jobs and <strong>did enter service time for each job</strong> but somehow it wasn't recorded&nbsp;in the database.<br>
        <br>
        The jobs show up in the <strong>app_job_clock table</strong> but the service time he entered doesn't show up in the <strong>app_job_services_clock table</strong> or the <strong>app_job_services_actual_employee table.</strong></p>
        <p>How is this possible?</p>
        <p>Maybe if you get issue 1 resolved it will solve this issue.<br>
      </p></td>
    </tr>
    <tr>
     <td colspan="2" align="center" ><strong style="color: #F40A0A; ">This is a critical error!!</strong></td>
    </tr>
    <tr>
      <td width="450"><strong>Issue 3: The services are difficult to choose. <br>
        <br>
        Sometimes I need to tap several times before it selects. </strong> <br>
        <br>
        Is there somewhere special I need to tap on? Is there a way to make this easier to tap on/select?<br>
        <br>
        7000 Snow Services is particularly hard to select
     </td>
      <td><img src="Screenshots/Screenshots JRGM 10212015/1307 1308 reversed.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" align="center" ><strong style="color: #F40A0A; ">This is a critical error!!</strong></td>
    </tr>
    <tr>
      <td><p><strong>Issue 4:  Add another service under <br>
        2000 Enhancement named <br>
        <br>
        2003-Plant Replacement (Warranty)<br>
      </strong></p>
      <p><strong>I thought this was done??</strong></p></td>
      <td><img src="Screenshots/Screenshots JRGM 10212015/2003.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2"></td>
    </tr>
    <tr>
      <td   width="450"><p class="redfont"><strong>Change 3: Weekly equipment maintenance form needs to fit the screen</strong></p>
        <p>The  weekly equipment maintenance form on my tablet could be pulled in a bit on the  sides so that you can still see the equipment name / id while you are checking  boxes.&nbsp; I think that's a minor tweak and there seems to be enough space  between the columns to do this.</p>
<p class="redfont">&nbsp;</p></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/Screenshot_eq maintenance form.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont"  width="450"><strong>Change 4: Lengthen materials select list</strong>.<br>
        <span style="color: #000000">See how the material name gets cut off? <br>
        <br>
        Can we lengthen this so that the entire material name shows?</span></td>
      <td >&nbsp;<img src="Screenshots/Screenshots JRGM 10212015/Screenshot_materials.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" ><p><strong>Change 5:&nbsp;What is this message?</strong><br>
        I get it when I enter more time than is available. <br>
        <br>
        Can you make this message say this?<br>
        <br>
        Employee Name incorrect time entered.</p>
        <p>So in this case it would&nbsp; say Matthew Davis incorrect time entered.</p>
        <p>&nbsp;</p></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/sufficien_time.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" nowrap ><p><strong>Change 6:&nbsp;<br>
        Make 1500-MISCELLANEOUS SERVICES not break.</strong></p>
      <p> Is should read <br>
     1500-MISCELLANEOUS SERVICES  </p>
      <p>not<br>
        1500-MISCELLANEOUS <br>
        SERVICES </p>
      <p></p>
      <p>&nbsp; </p></td>
      <td class="redfont" ><img src="Screenshots/screenshots 1012 PM/7.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" ><strong>Change 7:&nbsp;Make notes box wider</strong></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/notes box.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" ><p><strong>Change 8: Under 1300-Mulch Service <br>
        1307 and 1308 are not in the correct order.</strong> <br>
        <br>
        Is this something I can change in the app_services table or is it hard coded in the APP<strong><br>
          <br>
        </strong></p>
        <p><strong>I thought this was done??          <br>
      </strong></p></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/1307 1308 reversed.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" ><strong>Change 9: Version Number!!!&nbsp; </strong><br>
      <br>
      <ol>
        <li>Always make sure the version is updated in the AndroidManifest. xmlfile for each new version</li>
        <li>Make sure the version matches what is on the log in screen</li>
      </ol></td>
      <td ><img src="Screenshots/Screenshots JRGM 10212015/login screen.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td colspan="2" class="redfont" >&nbsp;</td>
    </tr>
    <tr>
      <td class="redfont" ><strong>Question 1: I noticed app_services_catg table in  your database. </strong></td>
      <td ><ol>
        <li>What is this table? </li>
        <li>Do I need to add it to my database.? </li>
        <li>Are there any other tables I need to add?</li>
      </ol>      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p>
<cfabort>
<table width="95%" border="2" align="center" cellpadding="5" cellspacing="1">
  <tr>
    <td width="450" ><p><strong>Step 1 : Job Ends</strong></p>
      <p>13 minutes of time to allocate for each employee</p></td>
    <td><img src="Screenshots/screenshots 1012 PM/1.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td><p style="color: #000000"><strong>Step 2 : After they select &quot;Add Services&quot; they go here</strong></p></td>
    <td><img src="Screenshots/screenshots 1012 PM/2.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="450"  ><p><strong>Step 3 : Add time for first service</strong>.</p>
      <p>&nbsp;</p>
      <p class="redfont" style="color: #F40A0A">I have noticed that sometimes its difficult to choose the service and sub-service. I click, double click. It takes a while is there anything that can be done about this?</p></td>
    <td><img src="Screenshots/screenshots 1012 PM/3.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="450"   ><p style="color: #000000"><strong>Step 4: After submitting they go to summary screen</strong></p></td>
    <td><img src="Screenshots/screenshots 1012 PM/4.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td  ><p><strong>Step 5 : <span style="color: #000000">After they select &quot;Add Services&quot; they go here</span></strong></p>
      <p class="redfont">This screen needs to be removed.</p>
      <p class="redfont">Its an extra step and is not needed.</p></td>
    <td  ><img src="Screenshots/screenshots 1012 PM/6.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2" >&nbsp; </td>
  </tr>
  <tr>
    <td ><p><strong>Step 6: <span style="color: #000000"> After they select &quot;Add Services&quot; <span class="redfont">they now need to go here.</span></span></strong><span style="color: #000000"><br>
        </span></p>
      <p><span style="color: #000000">They select 5 minutes</span><br>
        <br>
      <span class="redfont" style="color: #F40A0A">I have noticed that sometimes its difficult to choose the service and sub-service. I click, double click. It takes a while is there anything that can be done about this?</span>      </p></td>
    <td><img src="Screenshots/screenshots 1012 PM/7.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td ><span style="color: #000000"><strong>Step 7: After submitting they go to summary screen</strong></span></td>
    <td><img src="Screenshots/screenshots 1012 PM/8.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td ><p class="redfont"><strong>Step 8 : <span style="color: #F40A0A">After they select &quot;Add Services&quot; they go here</span></strong></p>
      <p class="redfont">This screen needs to be removed.</p>
      <p class="redfont">Its an extra step and is not needed.</p></td>
    <td ><img src="Screenshots/screenshots 1012 PM/9.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td ><p><strong>Step 9: <span style="color: #000000"> After they select &quot;Add Services&quot; <span class="redfont">they now need to go here.</span></span></strong><span style="color: #000000"><br>
        </span></p>
      <p><span style="color: #000000">They select 1 minutes</span><br>
        <br>
      <span class="redfont" style="color: #F40A0A">I have noticed that sometimes its difficult to choose the service and sub-service. I click, double click. It takes a while is there anything that can be done about this?</span>      </p></td>
    <td><img src="Screenshots/screenshots 1012 PM/11.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td ><p style="color: #000000"><strong>Step 10: After submitting they go to summary screen</strong></p>
      <p style="color: #000000"><span style="color: #000000">They either edit these services, add materials or start another job.</span></p></td>
    <td><img src="Screenshots/screenshots 1012 PM/12.png" width="512" height="300" alt=""/></td>
  </tr>
  <tr>
    <td colspan="2"  height="40" >&nbsp;</td>
  </tr>
</table>
<br>
<br>
<br>
<br>
<table width="95%" border="2" align="center" cellpadding="5" cellspacing="1">
  <tbody>
    <tr>
      <td   width="450"><p class="redfont"><strong>Change 2: Remove the Units.</strong></p>
        <p class="redfont">Remove the word Unit and the drop down box we will not be capturing this info any more.</p></td>
      <td ><img src="Screenshots/materials 10152015.png" width="512" height="300" alt=""/></td>
    </tr>
    <tr>
      <td class="redfont"  width="450"><strong>Change 3: Need to put horizontal lines between each employee.</strong><br>
        Its hard to tell where one employee ends and another starts.</td>
      <td ><img src="Screenshots/Summary page 10 15 2015.png" width="512" height="300" alt=""/></td>
    </tr>
  </tbody>
</table>
</body>
</html>
