<cfif CGI.HTTP_HOST CONTAINS "test.jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm">
<cfelseif CGI.HTTP_HOST CONTAINS "staging.jrgm.biz">
    <cfset CONFIG_DATABASENAME="jrgm_staging">
    <font color="purple"><b>STAGING MODE - DATA CAN BE TESTED SAFELY</b></font>
    <br />
<cfelse>
    Config failed!  Unknown HTTP_HOST #CGI.HTTP_HOST#
    <cfabort>
</cfif>