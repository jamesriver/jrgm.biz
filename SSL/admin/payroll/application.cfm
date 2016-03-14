<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(10,0,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
 <cfinclude template="../../../application.cfm">
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
 <cfif  IsDefined("Session.USERID")  AND Session.USERID EQ  '3298' >
  <cflocation url="http://www.jrgm.biz/">
</cfif>

 
  

 