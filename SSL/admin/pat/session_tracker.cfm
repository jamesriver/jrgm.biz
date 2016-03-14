<!---    <cflock timeout=20 scope="Session" type="Readonly"> 
    <cfoutput> #StructKeyList(Session)# </cfoutput> 
</cflock>
   xxxxxxxxxxxxxxxxxxxxxxxxxxxx
   
   <cflock timeout=20 scope="Session" type="Exclusive"> 
    <cfset StructDelete(Session, "ds_id")> 
</cflock>

XXXXXXXXXXXXXXXXXXXXXXXXXX --->
<!--- define the application --->
<cfapplication name="jrgm"  
                   sessionManagement="yes"  
                   sessiontimeout="#createtimespan(10,0,0,0)#">
<!--- application tracker object --->
<cfset appObj = createObject("java",  
                     "coldfusion.runtime.ApplicationScopeTracker")>
<!--- get the enumeration of application keys --->
<cfset apps = appObj.getApplicationKeys()>
<!--- session tracker object --->
<cfset tracker = createObject("java",  
                     "coldfusion.runtime.SessionTracker")>
<!--- while there are more applications in the enumeration --->
<cfloop condition="#apps.hasMoreElements()#">
  <!--- get the app name --->
  <cfset appname = apps.nextElement()>
  <!--- get the sessions for this app name --->
  <cfset sessions = tracker.getSessionCollection(appname)>
  <!--- dump the sessions out --->
  <cfdump var="#sessions#" label="#appname#">
</cfloop>
