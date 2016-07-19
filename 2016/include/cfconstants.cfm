<!--- ERROR MESSAGE CONSTANTS: GLOBAL --->
<cfset ERRORMESSAGE_FORMACTION = 'Sorry, "|FORMACTION|" is an invalid POST call.  Please try again.'>
<cfset ERRORMESSAGE_QUERY = 'Sorry, "model/|QUERYNAME|.cfm" threw the following error: |ERRORDESCRIPTION|'>

<!--- ERROR MESSAGE CONSTANTS: SITUATIONAL --->
<cfset ERRORMESSAGE_LOGIN_BADCREDENTIALS = 'Username / password combination failed.  Please try again.'>

<!--- ACCESS ROLE IDS (hardcoded here but also contained in dbo.access_roles) --->
<cfset ACCESSROLE_CREWMEMBER = 0>
<cfset ACCESSROLE_PRODUCTIONMANAGER = 1>
<cfset ACCESSROLE_SUPERVISORCREWLEADER = 2>
<cfset ACCESSROLE_IRRIGATIONTECH = 6>
<cfset ACCESSROLE_SPRAYTECH = 7>
<cfset ACCESSROLE_MECHANIC = 8>
<cfset ACCESSROLE_BRANCHMANAGER = 9>
<cfset ACCESSROLE_REGIONALMANAGER = 10>
<cfset ACCESSROLE_BUSINESSDEVELOPMENTGROUP = 94>
<cfset ACCESSROLE_ADMIN95 = 95>
<cfset ACCESSROLE_ADMINISTRATIVEASSISTANT = 96>
<cfset ACCESSROLE_ESTIMATOR = 97>
<cfset ACCESSROLE_REGIONALADMIN = 98>
<cfset ACCESSROLE_ADMIN = 99>

<!--- EMPLOYEE IDS (special access locked to these users only) --->
<cfset EMPLOYEEID_MARIACANDLER = 1001>
<cfset EMPLOYEEID_JASONKNIGHT = 1003>
<cfset EMPLOYEEID_BENCHAN = 9993>
<cfset EMPLOYEEID_MICHAELSANDT = 9994>

<!--- LEGACY VARIABLES FROM PAT'S ORIGINAL CODE THAT HE USED THROUGHOUT THE SYSTEM --->
<CFIF IsDefined("url.work_date")>
  <cfset todayDate = #url.work_date#>
  <cfelse>
  <cfset todayDate = Now()>
</CFIF>
<cfset somedate = todayDate>
<cfset yesterday = dateadd("d",-1,somedate)>
<cfset tomorrow = dateadd("d",1,somedate)>