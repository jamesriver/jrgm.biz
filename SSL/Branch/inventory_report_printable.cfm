 <cfparam name="session.Categorysearch" default="All">
<cfparam name="session.branchsearch" default="All">
<cfparam name="session.yearsearch" default="All">
<cfparam name="session.inventory_status" default="1">
<cfparam name="session.crew_assignment_last" default="All">
 <CFSET session.crew_assignment_last = 0>

 <cfif IsDefined("form.submitted")>
 <CFSET session.branchsearch = session.BRANCH>
 <CFSET session.inventory_status = form.inventory_status>
<CFSET session.crew_assignment_last = form.crew_assignment_last>
  </cfif>
 

<cfquery name="get_employees" datasource="jrgm">
SELECT DISTINCT Employee_ID, crew_name AS employee_name,supervisor_id,Employee_Position_ID FROM APP_crews 
WHERE Employee_branch = '#SESSION.branch#' AND Employee_Position_ID
 IN (1) AND active_record =1
 ORDER by  Employee_Position_ID ASC
</cfquery>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" MEDIA="print" HREF="css/printinventory.css">

<link rel="stylesheet" media="all and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" href="css/ipad-landscape.css" />

<script src="js/sorttable.js"></script>
<script src="js/sorttable_v1.js"></script>
<script>
$(document).ready(function(){

    var MaxHeight = 200;
    var RunningHeight = 0;
    var PageNo = 1;

    $('table.splitForPrint>tbody>tr').each(function () {

        if (RunningHeight + $(this).height() > MaxHeight) {
            RunningHeight = 0;
            PageNo += 1;
        }

        RunningHeight += $(this).height();

        $(this).attr("data-page-no", PageNo);

    });

    for(i = 1; i <= PageNo; i++){

        $('table.splitForPrint').parent().append("<div class='tablePage'><hr /><table id='Table" + i + "'><tbody></tbody></table><hr /></div>");

        var rows = $('table tr[data-page-no="' + i + '"]');

        $('#Table' + i).find("tbody").append(rows);
    }
    $('table.splitForPrint').remove();

});</script>
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body>
<div id="outerfull">
  <div id="centrecontent">
  <div class="centrecontent_innerleftright">

       <cfquery name="getequipment" datasource="jrgm">
SELECT inventory_status ,ID,Product_description,Product_name,Serial_Number,Equipment_ID,category,License_Plate,Equipment_Year, engine_cycle, mileage_eq,hours_eq,BRANCH_NAME,ISNULL(CREW_ASSIGNMENT_LAST,0)
  FROM equipment WHERE 0=0 AND branch_name ='#Session.branch#'
<cfif IsDefined("form.criteria")  AND form.criteria NEQ "" >
AND Product_description LIKE '%#form.criteria#%' OR Product_name LIKE '%#form.criteria#%' OR Serial_Number LIKE '%#form.criteria#%' 
 OR Branch_name LIKE '%#form.criteria#%'  OR Equipment_ID LIKE '%#form.criteria#%'   OR category LIKE '%#form.criteria#%'  OR License_Plate LIKE '%#form.criteria#%'
</cfif> <cfif IsDefined("form.category") AND form.category NEQ "All" > AND category ='#form.category#'</cfif> <cfif IsDefined("form.Equipment_year") AND form.Equipment_year NEQ "All" > AND Equipment_year =#form.Equipment_year#</cfif>  <cfif IsDefined("form.BRANCH_NAME") AND form.BRANCH_NAME NEQ "All" > AND BRANCH_NAME ='#form.BRANCH_NAME#'</cfif>  <!--- <cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status")  > AND inventory_status ='#form.inventory_status#'</cfif> --->
<cfif NOT IsDefined("form.inventory_status")  > AND inventory_status =1</cfif> <cfif IsDefined("form.inventory_status") AND form.inventory_status EQ 4 > AND inventory_status > 0</cfif>
<cfif IsDefined("form.inventory_status") AND form.inventory_status LT 4 > AND inventory_status ='#form.inventory_status#'</cfif>

 <cfif IsDefined("form.crew_assignment_last") AND form.crew_assignment_last NEQ "All" > AND crew_assignment_last ='#form.crew_assignment_last#'</cfif>
 ORDER by  ID ASC
</cfquery>

<div class="header">Printable Inventory Sheet - <cfoutput>#session.BRANCH#</cfoutput></div>

      
     <div class="searchbar">
     <form action="inventory_report_printable.cfm" method="post">
        <table border="0" cellspacing="0" cellpadding="0" align="center" width="95%">
            <tr>
              <td>
        <span>
        <input type="text" name="criteria" class="form-control input-inline input-large" placeholder="Search" />
        <input type="submit" value="Search" class="btn btn-primary" />
        </span></td>
        <td>
          <table border="0" class="searchtable" cellspacing="0" cellpadding="0">
            <tr>
              <td>
               Status:
<select name="inventory_status"   tabindex="5" onchange='this.form.submit()'>  
       <option value="4"  <cfif session.inventory_status EQ '4'> selected="selected"</cfif> >All</option>	 
                <option value="1" <cfif session.inventory_status EQ '1'> selected="selected"</cfif> >Active</option>
                <option value="0" <cfif session.inventory_status EQ '0'> selected="selected"</cfif> >Inactive</option>
                <option value="2" <cfif session.inventory_status EQ '2'> selected="selected"</cfif> >Pending Repair</option>
                <option value="3" <cfif session.inventory_status EQ '3'> selected="selected"</cfif> >In Repair</option>
             <!---     <option value="5" <cfif session.inventory_status EQ '5'> selected="selected"</cfif> >Completed Repair</option> --->
         </select>
         
         Allocation:
         
  <cfquery name="get_allocations" datasource="jrgm"  >
  SELECT DISTINCT [Employee ID],[Employee ID] AS employee_id , [Name FirstLast] As fullname,Last_name,first_name
FROM APP_employees  
INNER JOIN equipment
ON APP_employees.[Employee ID]=equipment.Crew_assignment_last    WHERE branch ='#SESSION.branch#'
   ORDER by  Last_name ASC,first_name ASC
 </cfquery>
   <select name="crew_assignment_last"   tabindex="5" onchange='this.form.submit()'>
      <option value="All" <cfif session.Crew_assignment_last EQ 'All'> selected="selected"</cfif>>All</option>
	  <cfoutput query="get_allocations">
   <option value="#employee_id#" <cfif session.Crew_assignment_last EQ #employee_id#> selected="selected"</cfif>>#fullname#</option>
  
  </cfoutput> </select>  </td>
            </tr>
          </table></td></tr></table>
        <input type="hidden"  name="submitted" value="yes"/>
      </form> </div>
      
      
      
      
      
      
      
      
      <table class="sortable" border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th align="center">ID</th>
            <th align="left">Category</th>
         <th align="left" class="sorttable_alpha">Equip ID</th>
            <th align="left">Product Name</th>
            <th align="left">Serial #</th>
            <th align="left">Status</th>
            <th align="left">Allocated To</th>
            <th align="center">In Inventory</th>
            <th align="center" width="200">Notes</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="getequipment">
            <tr>
              <td align="center">#ID#</td>
              <td>#Category#</td>
              <td align="left" >#Equipment_ID#</td>
              <td align="left" >#Product_Name#</td>
              <td align="left">#Serial_Number#</td>
              <td align="left">&nbsp;  
                <cfif inventory_status EQ 1>
                  Active
                  <cfelseif inventory_status EQ 2>
                  Pending Repair
                  <cfelseif inventory_status EQ 3>
                  In Repair
                  <cfelseif inventory_status EQ 0>
                  Inactive
                  <cfelse>Active
                </cfif> 
              </td>
              <cfquery name="get_branch_employees_cache" datasource="jrgm" cachedWithin = "#CreateTimeSpan(0, 8, 0, 0)#">
SELECT  [Name FirstLast] AS fullname  FROM APP_employees
WHERE  [Employee ID] =  #COMPUTED_COLUMN_14#
 </cfquery>
              <td align="left">#get_branch_employees_cache.fullname#</td>
              <td align="center" nowrap="nowrap">Yes 
              <input type="checkbox" name="checkbox" id="checkbox" />
              <label for="checkbox">&nbsp;   No&nbsp; 
                <input type="checkbox" name="checkbox2" id="checkbox2" />
              </label>
              </td>
              <td align="center">&nbsp;</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
     
    </div>
  </div>
</div>

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>


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
