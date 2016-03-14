<!---<cfquery name="get_allocations_pend" datasource="jrgm"  >
  SELECT COUNT(ID) As numberpieces,Crew_assignment_last FROM equipment
  WHERE  Crew_assignment_last  =2
  GROUP by Crew_assignment_last
 </cfquery>
<cfquery name="get_allocations_ia" datasource="jrgm"  >
  SELECT COUNT(ID) As numberpieces,Crew_assignment_last FROM equipment
  WHERE  Crew_assignment_last  =0
  GROUP by Crew_assignment_last
 </cfquery>--->
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
<title>James River Grounds Management Inventory</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
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
          <td class="header">Equipment Pieces by Crew</td>
        </tr>
      </table>
      <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last   
   ORDER by  Last_name ASC,first_name ASC
     </cfquery>
      <!--- <cfdump var="#get_allocations#">---> 
      <!--- Pending : <cfoutput>#get_allocations_pend.numberpieces#</cfoutput> -  Inactive : <cfoutput>#get_allocations_ia.numberpieces#</cfoutput></p>--->
     
      <table class="sortable" width="100%" border="0" cellspacing="0" cellpadding="0"  >
        <thead>
        </thead>
        <tbody>
          <tr>
            <td><strong>Employee ID</strong></td>
            <td><strong>First</strong></td>
            <td><strong>Last</strong></td>
            <td><strong>Pieces</strong></td>
          </tr>
          <cfloop query="get_allocations">
            <cfquery name="get_allocations2" datasource="jrgm"  >
  SELECT COUNT(ID) As numberpieces,Crew_assignment_last FROM equipment
  WHERE equipment.Crew_assignment_last  =#get_allocations.employee_id#
  
    GROUP by Crew_assignment_last
      ORDER by  Crew_assignment_last
 </cfquery>
            <cfoutput>
              <tr>
                <td>#get_allocations.employee_id#</td>
                <td><cfif get_allocations.employee_id EQ 3>
                    In Repair
                    <cfelseif get_allocations.employee_id EQ  5>
                    Completed Repair
                    <cfelse>
                    #get_allocations.first_name#
                  </cfif></td>
                <td>#get_allocations.Last_name#</td>
                <td><a href="inventory_list_crew_assignment_results.cfm?crew_assignment_last=#get_allocations.employee_id#"  target="_blank">#get_allocations2.numberpieces#</td>
              </tr>
            </cfoutput>
          </cfloop>
        </tbody>
      </table><br />
<br />
<br />
<br />
<br />

    </div>
  </div>
  <!-- to clear footer --> 
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> 

<!-- end outer div --><script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- // <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.min.js"></script> --> 
<script scr="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/js/bootstrap.min.js"></script> 
<script src="js/twitter-bootstrap-hover-dropdown.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> 
<script src="js/jquery-ui-1.8.20.custom.min.js"></script> 
 
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
