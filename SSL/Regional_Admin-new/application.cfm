<!--- 10 - Richmond
12 - Corporate
20 - Portsmouth
30 - Charlottesville
70 - Williamsburg
80 - Chesterfield
90 - Newport News --->

<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
 SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">
<cfinclude template="../../application.cfm">

<!--- <cfset  SESSION.userid = 2785>
 <cfset  SESSION.screenname = 'Gale'>
 <cfset  SESSION.ACCESS_ROLE = '98'>   --->

<!--- Christy East--->
<cfif SESSION.userid EQ 10031>
  <cfset branchlist = " 'Portsmouth', 'Newport News'">
  <cfset branchlist2 = "Portsmouth,Newport News">
  <cfset branchcodelist = "20,90">
  <cfset SESSION.regionname= "All">
  <cfset regionname= "All">
</cfif>

<!--- Jason East--->
<cfif SESSION.userid EQ 10291>
  <cfset branchlist = " 'Portsmouth', 'Newport News'">
  <cfset branchlist2 = "Portsmouth,Newport News">
  <cfset branchcodelist = "20,90">
  <cfset SESSION.regionname= "All">
  <cfset regionname= "All">
</cfif>

<!--- Gale--->
<cfif SESSION.userid EQ 1548>
  <cfset branchlist = " 'Portsmouth', 'Newport News'">
  <cfset branchlist2 = "Portsmouth,Newport News">
  <cfset branchcodelist = "20,90">
  <cfset SESSION.regionname= "Eastern">
  <cfset regionname= "Eastern">
</cfif>

<!--- Stacy --->
<cfif SESSION.userid EQ 1030>
  <cfset branchlist = "'Richmond','Chesterfield','Charlottesville'">
  <cfset branchlist2  = "Richmond,Chesterfield,Charlottesville">
  <cfset branchcodelist = "10,80,30">
  <cfset SESSION.regionname= "Western">
  <cfset regionname= "Western">
</cfif>

<!--- Caridad --->
<cfif SESSION.userid EQ 1020>
  <cfset branchlist = "'Portsmouth'">
  <cfset branchlist2 = "Portsmouth">
  <cfset branchcodelist = "20">
  <cfset SESSION.regionname= "Portsmouth">
  <cfset regionname= "Portsmouth">
</cfif>

<!---Erin--->
<cfif SESSION.userid EQ 4086>
  <cfset branchlist = "'Richmond','Chesterfield','Charlottesville'">
  <cfset branchlist2  = "Richmond,Chesterfield,Charlottesville">
  <cfset branchcodelist = "10,80,30">
  <cfset SESSION.regionname= "Western">
  <cfset regionname= "Western">
</cfif>
<cfif NOT IsDefined("Session.USERID")>
  <cflocation url="http://www.jrgm.biz/">
</cfif>
