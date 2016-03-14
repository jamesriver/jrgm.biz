<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(10,0,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
 <cfinclude template="../../application.cfm">
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<!--- <cfif NOT IsDefined("Session.USERID")>
  <cflocation url="http://www.jrgm.biz/">
</cfif>
 --->
 
 <cfif   IsDefined("SESSION.screenname_always")  AND SESSION.userid EQ 1001>
 <cfset SESSION.screenname = 'Maria Candler'>
 <cfset SESSION.userid = 1001>
 </cfif>
 
  <cfif   IsDefined("SESSION.screenname_always") AND SESSION.userid  EQ 1003>
 <cfset SESSION.screenname = 'Jason Knight'>
 <cfset SESSION.userid = 1003>
 </cfif>
 
 
 <cfif  IsDefined("SESSION.userid") AND  SESSION.userid EQ 1010>
<cfset branchlist = "'Chesterfield'">
<cfset branchlist2 = "Chesterfield">
<cfset SESSION.regionname= "Chesterfield">
<cfset regionname= "Chesterfield">
</cfif>

 