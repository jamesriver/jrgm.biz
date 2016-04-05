<cfinclude template="include_authorization.cfm">
<cfset multi_delimiter = ''>

<!--- ======= create app_events record based on app_jobs record automatically (used to be done manually by Pat for a little while) ======= --->
<cfif IsDefined('form.cron')>
    <cfset Job_IDs_string = ''>
    <cfset ok = 0>
    <cfif IsDefined('url.output')>
        <cfoutput>
            SELECT aj.[Job ID], aj.[Wk Location Name], COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) as count FROM app_jobs aj
            LEFT JOIN app_events ae ON ae.[job_id] = aj.[Job ID]
            WHERE aj.active_record=1
            AND aj.Status='IN PROGRESS'
            AND aj.[Wk Location Name] NOT LIKE 'ben %'
            GROUP BY aj.[Job ID], aj.[Wk Location Name]
            HAVING COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) = 0
            <br /><br />
        </cfoutput>
        <cfquery name="main_query" datasource="jrgm">
            SELECT aj.[Job ID] as Job_ID, aj.[Wk Location Name] as Wk_Location_Name, COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) as count FROM app_jobs aj
            LEFT JOIN app_events ae ON ae.[job_id] = aj.[Job ID]
            WHERE aj.active_record=1
            AND aj.Status='IN PROGRESS'
            AND aj.[Wk Location Name] LIKE 'ben %'
            GROUP BY aj.[Job ID], aj.[Wk Location Name]
            HAVING COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) = 0
        </cfquery>
        <cfloop query="main_query">
            <cfif Job_IDs_string NEQ ''>
                Job_IDs_string = Job_IDs_string & ',';
            </cfif>
            <cfset Job_IDs_string = Job_IDs_string & "'" & Job_ID & "'">
            <cfset output_str = output_str & '[' & Job_ID & '] ' & Wk_Location_Name & '|'>
        </cfloop>

        <cfoutput>
            SELECT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,CONVERT(varchar, [project_start_date], 121) AS project_start_date,CONVERT(varchar, [project_end_date], 121) AS project_end_date,
            Location = STUFF(
                COALESCE(', ' + RTRIM([Service Address]),'')
                 + COALESCE(', ' + RTRIM([Service Address2]),'')
                 + COALESCE(', ' + RTRIM([Service City]), '')
                 + COALESCE(', ' + RTRIM([Service State]), '')
                 + COALESCE(', ' + RTRIM([Service Zip]),  '')
                 , 1, 2, '')
                 FROM app_jobs WHERE [Job ID] IN (#PreserveSingleQuotes(Job_IDs_string)#)
        </cfoutput>
        <cfquery name="sub_query" datasource="jrgm">
            SELECT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,CONVERT(varchar, [project_start_date], 121) AS project_start_date,CONVERT(varchar, [project_end_date], 121) AS project_end_date,
            Location = STUFF(
                COALESCE(', ' + RTRIM([Service Address]),'')
                 + COALESCE(', ' + RTRIM([Service Address2]),'')
                 + COALESCE(', ' + RTRIM([Service City]), '')
                 + COALESCE(', ' + RTRIM([Service State]), '')
                 + COALESCE(', ' + RTRIM([Service Zip]),  '')
                 , 1, 2, '')
                 FROM app_jobs WHERE [Job ID] IN (#PreserveSingleQuotes(Job_IDs_string)#)
        </cfquery>
        <cfloop query="sub_query">
            <cfoutput>
                INSERT INTO app_events
                 (Job_ID,event_name, branch,event_location,start_date,end_date,active_record)
                 VALUES
                 ('#job_id#','#work_location_name#','#branch#','#Location#','#project_start_date#','#project_end_date#',1 )
            </cfoutput>
        </cfloop>
        <cfabort>
    <cfelse>
        <cfquery name="main_query" datasource="jrgm">
            SELECT aj.[Job ID] as Job_ID, aj.[Wk Location Name] as Wk_Location_Name, COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) as count FROM app_jobs aj
            LEFT JOIN app_events ae ON ae.[job_id] = aj.[Job ID]
            WHERE aj.active_record=1
            AND aj.Status='IN PROGRESS'
            AND aj.[Wk Location Name] NOT LIKE 'ben %'
            GROUP BY aj.[Job ID], aj.[Wk Location Name]
            HAVING COUNT(CASE WHEN ae.job_id IS NOT NULL THEN 1 ELSE NULL END) = 0
        </cfquery>
        <cfloop query="main_query">
            <cfif Job_IDs_string NEQ ''>
                <cfset Job_IDs_string = Job_IDs_string & ",">
            </cfif>
            <cfset Job_IDs_string = Job_IDs_string & "'" & Job_ID & "'">
            <cfset output_str = output_str & '[' & Job_ID & '] ' & Wk_Location_Name & '|'>
        </cfloop>
        <cfif Job_IDs_string NEQ ''>
            <!---cfoutput>
                SELECT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,CONVERT(varchar, [project_start_date], 121) AS project_start_date,CONVERT(varchar, [project_end_date], 121) AS project_end_date,
                Location = STUFF(
                    COALESCE(', ' + RTRIM([Service Address]),'')
                     + COALESCE(', ' + RTRIM([Service Address2]),'')
                     + COALESCE(', ' + RTRIM([Service City]), '')
                     + COALESCE(', ' + RTRIM([Service State]), '')
                     + COALESCE(', ' + RTRIM([Service Zip]),  '')
                     , 1, 2, '')
                     FROM app_jobs WHERE [Job ID] IN (#PreserveSingleQuotes(Job_IDs_string)#)
            </cfoutput--->
            <cfquery name="sub_query" datasource="jrgm">
                SELECT [Job ID] AS job_id,[Wk Location Name] AS work_location_name,branch,CONVERT(varchar, [project_start_date], 121) AS project_start_date,CONVERT(varchar, [project_end_date], 121) AS project_end_date,
                Location = STUFF(
                    COALESCE(', ' + RTRIM([Service Address]),'')
                     + COALESCE(', ' + RTRIM([Service Address2]),'')
                     + COALESCE(', ' + RTRIM([Service City]), '')
                     + COALESCE(', ' + RTRIM([Service State]), '')
                     + COALESCE(', ' + RTRIM([Service Zip]),  '')
                     , 1, 2, '')
                     FROM app_jobs WHERE [Job ID] IN (#PreserveSingleQuotes(Job_IDs_string)#)
            </cfquery>
            <cfloop query="sub_query">
                <!---cfoutput>
                    INSERT INTO app_events
                     (Job_ID,event_name, branch,event_location,start_date,end_date,active_record)
                     VALUES
                     ('#job_id#','#work_location_name#','#branch#','#Location#','#project_start_date#','#project_end_date#',1 )
                </cfoutput--->
                <cfquery name="update_query" datasource="jrgm">
                    INSERT INTO app_events
                     (Job_ID,event_name, branch,event_location,start_date,end_date,active_record)
                     VALUES
                     ('#job_id#','#work_location_name#','#branch#','#Location#','#project_start_date#','#project_end_date#',1 )
                </cfquery>
            </cfloop>
        </cfif>
    </cfif>
</cfif>
<cfinclude template="include_output.cfm">