<cfquery name="get_inactive_equipment_not_allocated_to_spare" datasource="jrgm">
    SELECT * FROM equipment WHERE inventory_status=0 AND crew_assignment_last!=3
</cfquery>
<cfloop query="get_inactive_equipment_not_allocated_to_spare">
    <cfquery name="allocate_to_spare" datasource="jrgm">
        UPDATE equipment SET crew_assignment_last=3
        WHERE ID=#ID#
    </cfquery>
    <cfquery name="update_allocation_history" datasource="jrgm">
        INSERT INTO equipment_allocation_history
        (equipment_id, assign_date, employee_id, modified_by_employee_id)
        VALUES
        (#ID#, GetUTCDate(), 3, 0)
    </cfquery>
</cfloop>
allocated inactive equipment to spare
