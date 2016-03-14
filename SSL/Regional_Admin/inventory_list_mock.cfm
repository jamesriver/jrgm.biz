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
<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  
  <style>
 .arialfont {
	font: normal .9em Arial, Helvetica, sans-serif;
}

.alertbox {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d17e85), color-stop(1, #b92723) );
	background:-moz-linear-gradient( center top, #d17e85 5%, #b92723 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d17e85', endColorstr='#b92723');
	background-color:#F3F3F3;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #4a0c0d;
	display:inline-block;
	color:#FFFFFF;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:5px 5px;
	margin-top:4px;
	text-decoration:none;
	text-shadow:1px 1px 0px #000000;

 }

table.sortable tbody td {
	padding: 8px;
	font: normal .75em Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #c0c0c0;
	}
	
	table.sortable tbody td:a {
	font: bold 1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	}
	
	table.sortable tbody td:a:hover {
	font: bold 1em Arial, Helvetica, sans-serif;
	color: #006fa7;
	border-bottom: 1px solid #c0c0c0;
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
 
  <!--centre content goes here -->
  <div class="centrecontent_inner">  
   <form action="inventory_list.cfm" method="post"><table border="1" cellspacing="0" cellpadding="7"  bgcolor="#FFFFFF" bordercolor="#c0c0c0"  bordercolorlight="White" align="right"> 
  <tr>
    <td bgcolor="#F2F7F5"><input type="text" name="criteria"  size="75"/>&nbsp;
      <input type="submit"  class="eqbutton" value="Search Equipment" />  
       </td>
    </tr>
</table>
</form><br />
   

    <div class="header">Inventory List&#8212;6 Records</div>
   <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
 <thead> 
<tr> 
   <th align="center">ID</th> 
   <th align="left">Category</th>
   <th align="left">Equip. ID</th> 
   <th align="left">Product Name</th> 
    <th align="center">Serial #</th>  
    <th align="center">Year</th>  
     <th align="left">Description</th>
      <th align="left">Allocate</th>
      <th align="left">Status</th>
      <th align="center"> Compl. Date</th>
      <th align="center">Repair Notes</th>
 </tr> 
</thead> 
  
     <tbody>  


  <tr>
    <td align="center">3946</td>
        <td nowrap="nowrap">Equipment</td>
        <td align="left" >A-14</td>
<td align="left"><a href="inventory_view.cfm?ID=3925">AERATOR - 3PT HITCH E-8 42</a><a href="inventory_edit.cfm?ID=#ID#"></a></td>
    <td align="center">123456</td>    

    <td align="center">2006</td>  
        <td align="left">PULL BEHIND AERATOR</td>
       <td align="left"><a href="allocate_ouk.cfm" onclick="javascript:void window.open('allocate_ouk.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Bon Ouk</a></td>
       <td align="left">Working</td>
       <td align="center">&nbsp;</td>
  <td align="center"><a href="note_aerator.cfm" onclick="javascript:void window.open('note_aerator.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Note</a></td>

  </tr>
  <tr>
    <td align="center">3947</td>
    <td nowrap="nowrap">Equipment</td>
    <td align="left" >S-12</td>
    <td align="left" ><a href="inventory_view.cfm?ID=3929">REDMAX CHAINSAW G3100T</a></td>
    <td align="center">987654</td>
    <td align="center">2010</td>
    <td align="left">1 1/8, 1 1/2, BUD SOCKET</td>
    <td align="left"><a href="allocate_walton.cfm" onclick="javascript:void window.open('allocate_walton.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Lewis Walton</a></td>
    <td align="left">In Repair</td>
    <td align="center">11/30/13</td>
  <td align="center"><a href="note_addnote.cfm" class="addnote" onclick="javascript:void window.open('note_addnote.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
  </tr>
  <tr>
    <td align="center">3948</td>
    <td nowrap="nowrap">Equipment</td>
    <td align="left" >S-23</td>
    <td align="left" ><a href="inventory_view.cfm?ID=3930">CIRCULAR SAW</a></td>
    <td align="center">234567</td>
    <td align="center">2008</td>
    <td align="left">&nbsp;</td>
    <td align="left"><a href="allocate_bailey.cfm" onclick="javascript:void window.open('allocate_bailey.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Robert Bailey</a></td>
    <td align="left">Working</td>
    <td align="center">&nbsp;</td>
  <td align="center"><a href="note_addnote.cfm" class="addnote" onclick="javascript:void window.open('note_addnote.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
  </tr>
  <tr>
    <td align="center">3949</td>
    <td nowrap="nowrap">Equipment</td>
    <td align="left" >E-55</td>
    <td align="left" ><a href="inventory_view.cfm?ID=3934">JOHN DEERE EDGER WALK</a></td>
    <td align="center">876543</td>
    <td align="center">2009</td>
    <td align="left">&nbsp;</td>
    <td align="left"><a href="allocate_almoite.cfm" onclick="javascript:void window.open('allocate_almoite.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Rogelio Almoite</a></td>
    <td align="left">In Repair</td>
    <td align="center">11/28/13</td>
  <td align="center"><a href="note_addnote.cfm" class="addnote" onclick="javascript:void window.open('note_addnote.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
  </tr>
  <tr>
    <td align="center">3950</td>
    <td nowrap="nowrap">Equipment</td>
    <td align="left" >H-01</td>
    <td align="left" ><a href="inventory_view.cfm?ID=3936">WOODS- 3PT HITCH PL-60</a></td>
    <td align="center">345678</td>
    <td align="center">2013</td>
    <td align="left">PULL BEHIND AERATOR</td>
    <td align="left"><a href="allocate_walton2.cfm" onclick="javascript:void window.open('allocate_walton2.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Lewis Walton</a></td>
    <td align="left">Inactive</td>
    <td align="center">&nbsp;</td>
  <td align="center"><a href="note_addnote.cfm" class="addnote" onclick="javascript:void window.open('note_addnote.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
  </tr>
  <tr>
    <td align="center">3951</td>
    <td nowrap="nowrap">Equipment</td>
    <td align="left" >G-67</td>
    <td align="left" ><a href="inventory_view.cfm?ID=3965">VERMEER STUMP GRINDER SC252</a></td>
    <td align="center">765432</td>
    <td align="center">2013</td>
    <td align="left">&nbsp;</td>
    <td align="left"><a href="allocate_singleton.cfm" onclick="javascript:void window.open('allocate_singleton.cfm','1384819222444','width=800,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">Ryland Singleton</a></td>
    <td align="left">Working</td>
    <td align="center">&nbsp;</td>
  <td align="center"><a href="note_addnote.cfm" class="addnote" onclick="javascript:void window.open('note_addnote.cfm','1384819222444','width=800,height=700,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=300,top=20');return false;">+</a></td>
  </tr>
     </tbody>
</table>
   
  </div>  </div>
  <!-- to clear footer -->
</div>
<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
