<cfquery name="get_all_employee_info" datasource="jrgm"  >
SELECT   [Employee ID] AS employee_ID,[Name FirstLast] AS fullname, [Name FirstLast] AS  [employee_name], first_name ,  last_name,branch     
FROM app_employees WHERE Branch IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>

<cfquery name="get_accept_date_all" datasource="jrgm">
SELECT   ID,acceptdate,Equipment_ID,completionDate  FROM equipment_repair_log ORDER by ID DESC
</cfquery>

<cfquery name="get_all_equipment" datasource="jrgm">
SELECT * FROM equipment WHERE    Branch_name IN   (#PreserveSingleQuotes(branchlist)#)
</cfquery>



	      <!--   PENDING REPAIR  -->

                <cfquery name="get_this_equipment_in_repair_pending"   dbtype="query">
SELECT * FROM get_all_equipment WHERE  inventory_status = 2  
</cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair_pending.recordcount#</cfoutput></span> Pending Repair</h4>
                <div class="table-scrollable table-scrollable-borderless">
                  <cfif get_this_equipment_in_repair_pending.recordcount EQ  0 >
                    There is no equipment pending repair
                    <cfelse>
                    <table class="table table-hover table-light">
                      <thead>
                        <tr class="uppercase">
                          <th>Branch</th>
                          <th> date pended repair</th>
                          <th> category </th>
                          <th> eqid </th>
                          <th> equip name</th>
                          <th>allocated to</th>
                          <th>history</th>
                        </tr>
                      </thead>
                      <cfoutput query="get_this_equipment_in_repair_pending">
                        <tr>
                          <cfif BRANCH_NAME EQ 'Richmond' >
                            <CFSET branchnew = "RIC" >
                            <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                            <CFSET branchnew = "POR" >
                            <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                            <CFSET branchnew = "CVL" >
                            <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                            <CFSET branchnew = "WMB" >
                            <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                            <CFSET branchnew = "CHE" >
                            <cfelseif BRANCH_NAME EQ 'Newport News' >
                            <CFSET branchnew = "NEW" >
                            <cfelse>
                            <CFSET branchcode =00>
                          </cfif>
                          <td>#branchnew#</td>
                          <td>#dateformat(pended_repair_date,"mm/dd/yy")#</td>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair_pending.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair_pending.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query"  cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href= "history_allocation.cfm?ID=#ID#">History</a></td>
                        </tr>
                      </cfoutput>
                    </table>
                  </cfif>
                </div>
                <!--   END PENDING REPAIR  -->
                
                <div class="spacer40"></div>
                
                <!--  CURRENTLY IN REPAIR  -->
                <cfquery name="get_this_equipment_in_repair"  dbtype="query">
SELECT * FROM get_all_equipment WHERE  inventory_status = 3  
ORDER by ID DESC
 </cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair.recordcount#</cfoutput></span> Currently in Repair</h4>
                <div class="table-scrollable table-scrollable-borderless"> 
                  <!---  <cfdump var="#get_this_equipment_in_repair#"> --->
                  <cfif get_this_equipment_in_repair.recordcount EQ 0 >
                    There is no equipment currently in repair
                    <cfelse>
                    <table class="table table-hover table-light">
                      <thead>
                        <tr class="uppercase">
                          <th>Branch</th>
                          <th> date given<br>
                            to mechanic</th>
                          <th> date repair<br>
                            log started</th>
                          <th> repair<br>
                            log id</th>
                          <th>category</th>
                          <th>eQid</th>
                          <th>Equipment Name</th>
                          <th>Allocated to</th>
                          <th>history</th>
                        </tr>
                      </thead>
                      <cfoutput query="get_this_equipment_in_repair">
                        
                          <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                          <cfquery name="get_accept_date"        dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_accept_date_all
 WHERE  Equipment_ID =  #get_this_equipment_in_repair.ID#  AND   completionDate IS NULL
 ORDER by ID DESC
 </cfquery>
                          <cfif  get_accept_date.recordcount EQ 0>
                            <cfif BRANCH_NAME EQ 'Richmond' >
                              <CFSET branchnew = "RIC" >
                              <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                              <CFSET branchnew = "POR" >
                              <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                              <CFSET branchnew = "CVL" >
                              <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                              <CFSET branchnew = "WMB" >
                              <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                              <CFSET branchnew = "CHE" >
                              <cfelseif BRANCH_NAME EQ 'Newport News' >
                              <CFSET branchnew = "NEW" >
                              <cfelse>
                              <CFSET branchcode =00>
                            </cfif>
                            <td>#branchnew#</td>
                            <td>Not Started</td>
                            <td>-</td>
                            <cfelse>
                            <cfif BRANCH_NAME EQ 'Richmond' >
                              <CFSET branchnew = "RIC" >
                              <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                              <CFSET branchnew = "POR" >
                              <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                              <CFSET branchnew = "CVL" >
                              <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                              <CFSET branchnew = "WMB" >
                              <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                              <CFSET branchnew = "CHE" >
                              <cfelseif BRANCH_NAME EQ 'Newport News' >
                              <CFSET branchnew = "NEW" >
                              <cfelse>
                              <CFSET branchcode =00>
                            </cfif>
                            <td>#branchnew#</td>
                            <td>#dateformat(get_accept_date.acceptdate,"mm/dd/yy")#</td>
                            <td><a href="repairLog_view.cfm?ID=#get_accept_date.id#&equipmentid=#ID#"  target="_blank">#ID#</a></td>
                          </cfif>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                        </tr>
                      </cfoutput>
                        </tbody>
                      
                    </table>
                  </cfif>
                </div>
                <!--  END CURRENTLY IN REPAIR  -->
                <div class="spacer40"></div>
                
                <!--   RECENTLY COMPLETED REPAIRS  -->
                <cfquery name="get_this_equipment_in_repair_recent"   dbtype="query">
SELECT * FROM get_all_equipment WHERE   inventory_status = 5
  ORDER by repair_last_completed_date DESC
 </cfquery>
                <h4><span class="badge badge-default"><cfoutput>#get_this_equipment_in_repair_recent.recordcount#</cfoutput></span> Recently Completed Repairs with Status "Completed Repair" <span class="message">These Need a Status Change</span> </h4>
                <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                  There is no equipment with recently completed repairs that needs a status change.
                  <cfelse>
                  <div class="table-scrollable table-scrollable-borderless">
                  <table class="table table-hover table-light">
                    <thead>
                      <tr class="uppercase">
                        <th>Branch</th>
                        <th> date given<br>
                          to mechanic</th>
                        <th>date repair<br>
                          completed</th>
                        <th>repair<br>
                          log id</th>
                        <th>category</th>
                        <th>eQid</th>
                        <th>Equipment Name</th>
                        <th>Allocated to</th>
                        <th>change status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <cfoutput query="get_this_equipment_in_repair_recent">
                        <tr>
                          <cfif BRANCH_NAME EQ 'Richmond' >
                            <CFSET branchnew = "RIC" >
                            <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                            <CFSET branchnew = "POR" >
                            <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                            <CFSET branchnew = "CVL" >
                            <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                            <CFSET branchnew = "WMB" >
                            <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                            <CFSET branchnew = "CHE" >
                            <cfelseif BRANCH_NAME EQ 'Newport News' >
                            <CFSET branchnew = "NEW" >
                            <cfelse>
                            <CFSET branchcode =00>
                          </cfif>
                          <td>#branchnew#</td>
                          <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                          <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                          <cfquery name="get_accept_date2"       dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_accept_date_all
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                          <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td>
                          <td>#Category#</td>
                          <td>#Equipment_ID#</td>
                          <td>#Product_name#</td>
                          <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
                            <td>Unallocated</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                            <td>Spare</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                            <td>Inactive</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                            <td>Seasonal</td>
                            <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                            <td>Lost</td>
                            <cfelse>
                            <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                            <td>#get_branch_employees_cache.employee_name#</td>
                          </cfif>
                          <td><a href="history_allocation.cfm?ID=#ID#">Change Status</a></td>
                        </tr>
                      </cfoutput>
                    </tbody>
                  </table>
                </cfif>
              </div>
              <!--   END RECENTLY COMPLETED REPAIRS  -->
              
              <div class="spacer40"></div>
              
              <!--  RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  -->
              <cfquery name="get_this_equipment_in_repair_recent"  dbtype="query" maxrows="20">
SELECT * FROM get_all_equipment WHERE   inventory_status = 1  AND repair_last_completed_date IS NOT NULL
  ORDER by repair_last_completed_date DESC
 </cfquery>
              <cfif get_this_equipment_in_repair_recent.recordcount EQ 0 >
                There is no equipment with recently completed repairs
                <cfelse>
                <h4>Recently Completed Repairs with Status "Active" (Showing last 20) <span class="message">These Do Not Need a Status Change</span> </h4>
                <div class="table-scrollable table-scrollable-borderless">
                <table class="table table-hover table-light">
                  <thead>
                    <tr class="uppercase">
                      <th>Branch</th>
                      <th> date given<br>
                        to mechanic</th>
                      <th>date repair<br>
                        completed</th>
                      <th>repair<br>
                        log id</th>
                      <th>category</th>
                      <th>eQid</th>
                      <th>Equipment Name</th>
                      <th>Allocated to</th>
                      <th>history</th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput query="get_this_equipment_in_repair_recent">
                      <tr>
                        <cfif BRANCH_NAME EQ 'Richmond' >
                          <CFSET branchnew = "RIC" >
                          <cfelseif BRANCH_NAME EQ 'Portsmouth' >
                          <CFSET branchnew = "POR" >
                          <cfelseif BRANCH_NAME EQ 'Charlottesville' >
                          <CFSET branchnew = "CVL" >
                          <cfelseif BRANCH_NAME EQ 'Williamsburg' >
                          <CFSET branchnew = "WMB" >
                          <cfelseif BRANCH_NAME EQ 'Chesterfield' >
                          <CFSET branchnew = "CHE" >
                          <cfelseif BRANCH_NAME EQ 'Newport News' >
                          <CFSET branchnew = "NEW" >
                          <cfelse>
                          <CFSET branchcode =00>
                        </cfif>
                        <td>#branchnew#</td>
                        <td>#dateformat(date_sent_to_mechanic,"mm/dd/yy")#</td>
                        <td>#dateformat(repair_last_completed_date,"mm/dd/yy")#</td>
                        <cfquery name="get_accept_date2"        dbtype="query" maxrows="1" >
SELECT   ID,acceptdate  FROM get_accept_date_all
 WHERE  Equipment_ID =  #ID# 
 ORDER by ID DESC
 </cfquery>
                        <td><a href="repairLog_view.cfm?ID=#get_accept_date2.id#&equipmentid=#ID#">#ID#</a></td>
                        <td>#Category#</td>
                        <td>#Equipment_ID#</td>
                        <td>#Product_name#</td>
                        <cfif  get_this_equipment_in_repair_recent.Crew_assignment_last  EQ "">
                          <td>Unallocated</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 3>
                          <td>Spare</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 4>
                          <td>Inactive</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 5>
                          <td>Seasonal</td>
                          <cfelseif get_this_equipment_in_repair_recent.Crew_assignment_last  EQ 6>
                          <td>Lost</td>
                          <cfelse>
                          <cfquery name="get_branch_employees_cache"   dbtype="query">
SELECT   employee_name  FROM get_all_employee_info
WHERE  employee_ID =  #Crew_assignment_last# 
 </cfquery>
                          <td>#get_branch_employees_cache.employee_name#</td>
                        </cfif>
                        <td><a href="history_allocation.cfm?ID=#ID#">History</a></td>
                      </tr>
                    </cfoutput>
                  </tbody>
                </table>
              </cfif>

            <!--  END RECENTLY COMPLETED REPAIRS WITH STATUS ACTIVE  --> 
