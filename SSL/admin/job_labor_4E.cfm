<!---<cfsetting requesttimeout="3600">--->
 
<!---<cfsetting enablecfoutputonly="Yes"> 

<!--- Set content type. ---> 
<cfcontent type="application/vnd.ms-excel"> 
 --->
<!--- Suggest default name for XLS file. ---> 
<!--- "Content-Disposition" in cfheader also ensures  
relatively correct Internet Explorer behavior. ---> 


<cfsetting enablecfoutputonly="Yes">
<cfsetting showdebugoutput="false" />
<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=test.xls">
 
 
<cfquery name="get_all_jobs_info" datasource="jrgm"  cachedwithin="#createTimespan(0,0,0,0)#"  maxrows="10">
SELECT   [Wk Location Name] AS jobname,  [Job ID]  AS jobid,branch FROM app_jobs  
</cfquery>
 <cfquery name="get_all_job_labor" datasource="jrgm"   cachedwithin="#createTimespan(0,0,0,0)#">
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  app_job_services_actual_employee <!---WHERE   service_time_out < '#todayDate#'---> order by  Service_Time_In DESC
  </cfquery>
   <cfquery name="get_employee_info" datasource="jrgm"   cachedwithin="#createTimespan(0,8,0,0)#">
SELECT [Employee ID] AS Employee_ID , [Name FirstLast] AS report_name, First_name, Last_name, Position
 FROM APP_employees
</cfquery>
<!-- BEGIN PAGE CONTENT -->
 
 <cfquery name="get_branch_jobs"  dbtype="query"  maxrows="10">
SELECT  JOBID, jobname, branch
 FROM get_all_jobs_info WHERE branch='#url.branch_name#'
 order by jobname
</cfquery> 
 
      <!-- to clear footer --> 
      <span class="dailysheet_header"> Job Labor <cfoutput>#url.branch_name#</cfoutput> Branch</span><br />
      Showing Job Labor Information for 2015 - 
       <cfoutput>#get_branch_jobs.recordcount#</cfoutput> Jobs<br />
     
    
      <CFSET branchjobslist ="">
      <cfloop query="get_branch_jobs">
        <cfset branchjobslist = ListAppend(branchjobslist,JOBID)>
      </cfloop>
      
    <table class="table table-striped table-bordered sortable" >
      <thead>
        <tr>
          <th align="left">Branch</th>
          <th align="left">Job Name</th>
          <th align="left">Job ID</th>
          <th align="left">Date</th>
          <th align="left">DSID</th>
          <th align="left">Employee ID</th>
          <th align="left">Employee Name</th>
          <th align="left">Service ID</th>
          <th align="left">Time Worked<br />
            Minutes</th>
          <th align="left">Time Worked<br />
            Hours</th>
          <th align="left">Labor Cost<br />
            @ 11.50/hr</th>
          <th align="left">CLID</th>
          <th align="left">Crew Leader Name</th>
          <th align="left">Job Clock ID</th>
        </tr>
      </thead>
      <CFLOOP INDEX="ListElement"
LIST="#branchjobslist#"
DELIMITERS=",">
        <cfquery name="get_job_labor"   dbtype="query" cachedwithin="#createTimespan(0,0,0,0)#"  >
 SELECT       ID, Job_ID, Service_ID, Employee_ID, Total_Time, Service_Time_In, Service_Time_Out, job_clock_id, ds_id, crew_leader   
 FROM  get_all_job_labor   WHERE job_id = '#ListElement#'  <!--- AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_out IS NOT NULL--->  order by  Service_Time_In DESC
  </cfquery>
       <!--- <CFSET mylist ="0">
        <cfloop query="get_job_labor">
          <cfset myList = ListAppend(mylist,ds_id)>
        </cfloop>--->
        <tbody>
          <cfoutput query="get_job_labor">
            <tr>
              <td>#url.BRANCH_NAME#</td>
   <cfquery name="get_branch_job_name"  dbtype="query">
SELECT  JOBID,  jobname 
 FROM get_branch_jobs WHERE JOBID = '#ListElement#'
</cfquery>
              <td align="left">#get_branch_job_name.jobname#</td>
              <td>#ListElement#</td>
              <td>#DateFormat(Service_Time_In, "mm/dd/yyyy")#</td>
              <td><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></td>
              <td>#Employee_ID#</td>
      <cfquery name="get_employee_info2"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Employee_ID#
</cfquery>
              <td align="left">#get_employee_info2.report_name#</td>
              <td>#Service_ID#</td>
              <td>#Total_Time#</td>
              <cfset hours = int(Total_Time\60)>
              <cfset minutes = int(Total_Time mod 60)>
              <td>#hours#:#NumberFormat(minutes,"09")#</td>
              <cfset laborcost = .19166666*Total_Time>
              <td>#NumberFormat(laborcost,"999,999.99")#</td>
              <td>#crew_leader#</td>
              <cfquery name="get_employee_info3"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #crew_leader#
</cfquery>
              <td>#get_employee_info3.report_name#</td>
              <td>#job_clock_id#</td>
            </tr>
          </cfoutput>
         <!---  <cfquery name="get_job_labor2"    datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT     ds_id
 FROM  app_job_services_actual_employee
   WHERE job_id = '#ListElement#' <!--- AND service_time_in  > = '01/01/2015 00:00:00' AND   service_time_out IS NOT NULL--->  
  </cfquery>
        <CFSET mylist ="0">
        <cfloop query="get_job_labor2">
          <cfset myList = ListAppend(mylist,ds_id)>
        </cfloop>
          <cfquery name="get_job_labor_missing"  datasource="jrgm"  cachedwithin="#createTimespan(0,8,0,0)#">
 SELECT    ds_id, job_id,job_Time_In,Job_Time_worked, Crew_Leader_ID, ID
 FROM  app_job_clock  WHERE  job_id =   '#ListElement#' AND ds_id NOT IN  (#myList#)  AND   job_Time_In  > = '01/01/2015 00:00:00' 
 job_time_out < '#todayDate#' 
 order by  job_Time_In DESC
   </cfquery>
          <cfif  get_job_labor_missing.recordcount EQ 0>
          
            <cfelse>
          
            <cfoutput query="get_job_labor_missing">
              <tr>
                <td><strong>#url.BRANCH_NAME#</strong></td>
                <cfquery name="get_branch_job_name"  dbtype="query">
SELECT  JOBID,  jobname 
 FROM get_branch_jobs WHERE JOBID = '#ListElement#'
</cfquery>
                <td align="left"><strong>#get_branch_job_name.jobname#</strong></td>
                <td><strong>#ListElement#</strong></td>
                <td><strong>#DateFormat(job_Time_In, "mm/dd/yyyy")#</strong></td>
                <td><strong><a href="daily_sheet.cfm?dsid=#ds_id#" target="_blank">#ds_id#</a></strong></td>
                <td  align="left"><strong>No Information</strong></td>
                <td><strong>No Information</strong></td>
                <td><strong>No Information</strong></td>
                <td><strong>#Job_Time_worked#</strong></td>
                <cfset hours = int(Job_Time_worked\60)>
                <cfset minutes = int(Job_Time_worked mod 60)>
                <td><strong>#hours#:#NumberFormat(minutes,"09")#</strong></td>
                <cfset laborcost = .19166666*Job_Time_worked>
                <td><strong>#NumberFormat(laborcost,"999,999.99")#</strong></td>
                <td><strong>#Crew_Leader_ID#</strong></td>
                <cfquery name="get_employee_info4"  dbtype="query"   >
SELECT  report_name 
 FROM get_employee_info  WHERE Employee_ID  =  #Crew_Leader_ID#
</cfquery>
                <td><strong>#get_employee_info4.report_name#</strong></td>
                <td><strong>#ID#</strong></td>
              </tr>
            </cfoutput>
          </cfif>--->
            <CFSET mylist ="0">
      </cfloop>
    </table>
    </cfcontent>
    
 