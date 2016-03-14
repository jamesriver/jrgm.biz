<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">

 
 
 
 
<cfif NOT IsDefined("Session.USERID")>
  <cflocation url="http://www.jrgm.biz/">
</cfif>


 