<cftry>
    <cfinclude template="#APPLICATION.basePath#model/#query_name#.cfm">
    <cfcatch>
        <cfset error_message = ERRORMESSAGE_QUERY>
        <cfset error_description = cfcatch.message>
        <cfinclude template="#APPLICATION.basePath#view/error_query.cfm">
    </cfcatch>
</cftry>