<!--- AUTHENTICATE USER SESSION --->
<cfset APPLICATION.homepage = "index.cfm">
<cftry>
<cfif SESSION.access_role EQ ACCESSROLE_PRODUCTIONMANAGER>
    <cfset APPLICATION.homedirectory = "/ssl/supervisors-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_SUPERVISORCREWLEADER>
    <cfset APPLICATION.homedirectory = "/">
<cfelseif SESSION.access_role EQ ACCESSROLE_IRRIGATIONTECH>
    <cfset APPLICATION.homedirectory = "/ssl/itech-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_SPRAYTECH>
    <cfset APPLICATION.homedirectory = "/ssl/stech-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_MECHANIC>
    <cfset APPLICATION.homedirectory = "/ssl/mechanic-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_BRANCHMANAGER>
    <cfset APPLICATION.homedirectory = "/ssl/branch-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_REGIONALMANAGER>
    <cfset APPLICATION.homedirectory = "/ssl/regional-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_BUSINESSDEVELOPMENTGROUP>
    <cfset APPLICATION.homedirectory = "/ssl/admin/">
    <cfset APPLICATION.homepage = "default.cfm">
<cfelseif SESSION.access_role EQ ACCESSROLE_ADMIN95>
    <cfset APPLICATION.homedirectory = "/ssl/admin/">
    <cfset APPLICATION.homepage = "bgarrett.cfm">
<cfelseif SESSION.access_role EQ ACCESSROLE_ADMINISTRATIVEASSISTANT>
    <cfset APPLICATION.homedirectory = "/ssl/admin/">
    <cfset APPLICATION.homepage = "payroll/payrollbetty.cfm">
<cfelseif SESSION.access_role EQ ACCESSROLE_ESTIMATOR>
    <cfset APPLICATION.homedirectory = "/ssl/quoting-new/">
    <cfset APPLICATION.homepage = "default.cfm">
<cfelseif SESSION.access_role EQ ACCESSROLE_REGIONALADMIN>
    <cfset APPLICATION.homedirectory = "/ssl/regional_admin-new/">
<cfelseif SESSION.access_role EQ ACCESSROLE_ADMIN>
    <cfset APPLICATION.homedirectory = "/ssl/admin/">
    <cfset APPLICATION.homepage = "default.cfm">
</cfif>
<cfcatch>
</cfcatch>
</cftry>