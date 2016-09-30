<cfif CGI.HTTP_HOST CONTAINS "staging.jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm_staging">
    <cfset CONFIG_APISERVER_URL="">
    <font color="purple"><b>STAGING MODE - DATA CAN BE TESTED SAFELY</b></font>
    <br />
<cfelseif CGI.HTTP_HOST CONTAINS "jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm">
<cfelse>
    <cfoutput>
        Config failed!  Unknown HTTP_HOST #CGI.HTTP_HOST#
    </cfoutput>
    <cfabort>
</cfif>