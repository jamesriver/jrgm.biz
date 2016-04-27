<cfinclude template="#APPLICATION.basePath#include/cfconfig.cfm">
<cfinclude template="#APPLICATION.basePath#include/cfconstants.cfm">
<cfinclude template="#APPLICATION.basePath#include/cffunctions.cfm">

<!--- MAKE SURE THIS USER IS LOGGED IN! --->
<cfif !IsDefined('SKIP_AUTHENTICATION')>
    <cfinclude template="#APPLICATION.basePath#include/cfauthentication.cfm">
</cfif>