<cfif IsDefined("form.SUBMIT") >
  <cfquery name="add_equipment_history_note_insert" datasource="#request.dsn#">
INSERT INTO equipment_history (EQUIPMENT_ID,enter_date, equipment_notes,entry_type,
MODIFIED_BY)   
VALUES 
('#form.ID#',CURRENT_TIMESTAMP,'#equipment_notes#', 'Note',
 '#SESSION.userid#')
   </cfquery>
 </cfif>
 
 <cfif IsDefined("form.id")>
  <CFSET id= form.id>
  <cfelseif IsDefined("url.id")>
  <CFSET id= url.id>
</cfif>

   <cfquery name="get_this_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE ID = #id#
 </cfquery>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" media="only screen and (max-device-width: 1024px)" href="css/ipad.css" type="text/css" />
</head>
<body>
<div id="outerfull">
<div id="centrecontent">
<cfinclude template="includes/subbar.cfm">
  <cfinclude template="includes/topbar.cfm"><br />
<br />
<br />
<br />
<br />
<br />

  <div class="centrecontent_inner_pop">  
    <cfif IsDefined("form.SUBMIT") >
 <span class="header">This note has been added for <cfoutput>#get_this_equipment.Product_name#</cfoutput></span><br />
<br />
 <cfoutput><span class="arialfont">#form.equipment_notes#</span></cfoutput><br />
 <br />
<cfoutput> <a href="history_allocation.cfm?ID=#id#" class="arialfont">Go Back to History & Allocate Screen</a></cfoutput>
    <cfabort>
 </cfif>
     <div class="header"> Notes for <cfoutput>#get_this_equipment.Product_name#</cfoutput></div>
   <form method="post"  action="note_addnote.cfm">
    <div class="statusTD">
         <textarea name="equipment_notes" id="textarea" cols="45" rows="5"></textarea>
       <p>
       <input  type="hidden"  name="ID" value="<cfoutput>#id#</cfoutput>" />
    <input name="submit" type="submit" class="bluebutton" id="submit" value="Submit">
       </p>
    </div>
    </form>
  </div>  </div>
 </div>
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
