<cfquery name="get_app_job_materials_actual" datasource="jrgm">
    SELECT ajma.ID, ds_date FROM app_job_materials_actual ajma
    INNER JOIN app_daily_sheets ads ON ads.id=ajma.ds_id
    WHERE service_date<'2000-01-01 00:00:00.000'
</cfquery>
<cfloop query="get_app_job_materials_actual">
    <cfquery name="fix_app_job_materials_actual" datasource="jrgm">
        UPDATE app_job_materials_actual
        SET Service_Date='#ds_date# 00:00:00.000'
        WHERE ID=#ID#
    </cfquery>
</cfloop>
fixed app_job_materials_actual

