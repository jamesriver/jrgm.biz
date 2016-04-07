<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">
<cfinclude template="../../application.cfm">

<!---   <cfset SESSION.regionname= "Eastern">
<cfset regionname= "Eastern">
<cfset branchlist = "'Richmond','Chesterfield','Charlottesville'">
<cfset regionname= "Western">
 <cfset branchlist2 = "Richmond,Chesterfield,Charlottesville">  
 --->

<cfif SESSION.userid EQ 3557>
  <!---10441--->
  <cfset branchlist = "'Portsmouth', 'Newport News'">
  <cfset regionname= "Eastern">
  <cfset SESSION.regionname= "Eastern">
  <cfset branchcodelist = "20,90">
  <cfset branchlist2 = "Portsmouth,Newport News">
</cfif>
<cfif SESSION.userid EQ 10441>
  <!---3557--->
  <cfset branchlist = "'Richmond','Chesterfield','Charlottesville'">
  <cfset regionname= "Western">
  <cfset branchlist2 = "Richmond,Chesterfield,Charlottesville">
  <cfset branchcodelist = "10,30,80">
  <cfset SESSION.regionname= "Western">
</cfif>

<!---  <cfoutput>#userid#</cfoutput> --->

<cfif NOT IsDefined("Session.USERID")>
  <cflocation url="/">
</cfif>
