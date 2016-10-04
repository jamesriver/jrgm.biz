<cfif CGI.HTTP_HOST CONTAINS "staging.jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm_staging">
    <cfset CONFIG_APISERVER_URL="api.jrgm.com/staging/">
    <!---font color="purple"><b>STAGING MODE - DATA CAN BE TESTED SAFELY</b></font>
    <br /--->
<cfelseif CGI.HTTP_HOST CONTAINS "jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm">
    <cfset CONFIG_APISERVER_URL="api.jrgm.com/">
<cfelse>
    <cfoutput>
        Config failed!  Unknown HTTP_HOST #CGI.HTTP_HOST#
    </cfoutput>
    <cfabort>
</cfif>