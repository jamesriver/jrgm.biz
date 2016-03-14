

<cfapplication name="jrgm"
 ClientManagement="No"
  SessionManagement="Yes"
      SessionTimeout="#CreateTimeSpan(0,14,0,0)#"
  SetClientCookies="Yes">
<cfset request.dsn="jrgm" />
 <cfinclude template="../../application.cfm">
<cfparam name="SESSION.loginid" default="0">
<cfparam name="Session.job_id" default="0000">

<cfparam name="branchlist" default="Corporate">
<cfparam name="branchlistalt" default="Corporate">

<!--- <cfset Session.userid =  2992>
<cfset Session.SCREENNAME  =  2992> --->


   
   <!--- Jones --->
<cfif SESSION.userid EQ 3252>
 <cfset branchlist = "'Newport News">
  <cfset branchlistalt = "Newport News">
   </cfif>
  
<!--- Michael Gray --->
 <cfif SESSION.userid EQ 2992>
 <cfset branchlist = "'Portsmouth'">
  <cfset branchlistalt = "Portsmouth">
  </cfif>
  
  <!--- Tyler Lloyd   --->
 <cfif SESSION.userid EQ 3280>
 <cfset branchlist = "'Newport News'">
  <cfset branchlistalt = "Newport News">
  </cfif>

<!--- Luis Lara  & Scott Bowers --->
<cfif SESSION.userid EQ 1035 OR SESSION.userid EQ 1032>
<cfset branchlist = "'Richmond','Chesterfield','Charlottesville','Newport News','Corporate','Portsmouth','Test'">
<cfset branchlistalt = "All Branches">
  </cfif>
  
 <!--- Bruce Garrett --->
 <cfif SESSION.userid EQ 1033>
 <cfset branchlist = "'Portsmouth','Richmond','Chesterfield','Charlottesville','Williamsburg','Newport News','Corporate'">
 <cfset branchlistalt = "All Branches">
 </cfif>
 
   <!--- James Corp Mechanic   --->
 <cfif SESSION.userid EQ 1002>
 <cfset branchlist = "'Corporate'">
  <cfset branchlistalt = "Corporate">
  </cfif>

 
 
<cfif NOT IsDefined("Session.USERID")>
  <cflocation url="http://www.jrgm.biz/">
</cfif>
