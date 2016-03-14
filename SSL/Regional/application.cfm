

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

  <cfif SESSION.userid EQ 2785>
 <cfset branchlist = "'Portsmouth', 'Newport News'">
 <cfset regionname= "Eastern">
  <cfset SESSION.regionname= "Eastern">
   <cfset branchcodelist = "20,90">
  <cfset branchlist2 = "Portsmouth,Newport News">

 </cfif>

<cfif SESSION.userid EQ 10441>
<cfset branchlist = "'Richmond','Chesterfield','Charlottesville'">
<cfset regionname= "Western">
 <cfset branchlist2 = "Richmond,Chesterfield,Charlottesville">
  <cfset branchcodelist = "10,30,80">
<cfset SESSION.regionname= "Western">
</cfif>
 
 
<!---  <cfoutput>#userid#</cfoutput> --->
 
<cfif NOT IsDefined("Session.USERID")>
  <cflocation url="http://www.jrgm.biz/">
</cfif>

<!--- <cfset theDate = #Now()#>
 
 <cfif theDate GTE createdatetime(2014,5,31,15,0,1) AND theDate LTE createdatetime(2014,6,7,15,0,0)>
<CFSET pay_period_number = "3">  
<CFSET pay_period_week = "6"> 
<cfelseif theDate GTE createdatetime(2014,6,7,15,0,1) AND theDate LTE createdatetime(2014,6,14,15,0,0)>
<CFSET pay_period_number = "4">  
<CFSET pay_period_week = "7"> 
<cfelseif theDate GTE createdatetime(2014,6,14,15,0,1) AND theDate LTE createdatetime(2014,6,21,15,0,0)>
<CFSET pay_period_number = "4">  
<CFSET pay_period_week = "8"> 
<cfelseif theDate GTE createdatetime(2014,6,21,15,0,1) AND theDate LTE createdatetime(2014,6,28,15,0,0)>
<CFSET pay_period_number = "5">  
<CFSET pay_period_week = "9"> 
<cfelseif theDate GTE createdatetime(2014,6,28,15,0,1) AND theDate LTE createdatetime(2014,7,5,15,0,0)>
<CFSET pay_period_number = "5">  
<CFSET pay_period_week = "10"> 
<cfelseif theDate GTE createdatetime(2014,7,5,15,0,1) AND theDate LTE createdatetime(2014,7,12,15,0,0)>
<CFSET pay_period_number = "6">  
<CFSET pay_period_week = "11"> 
<cfelseif theDate GTE createdatetime(2014,7,12,15,0,1) AND theDate LTE createdatetime(2014,7,19,15,0,0)>
<CFSET pay_period_number = "6">  
<CFSET pay_period_week = "12"> 

<cfelseif theDate GTE createdatetime(2014,7,19,15,0,1) AND theDate LTE createdatetime(2014,7,26,15,0,0)>
<CFSET pay_period_number = "7">  
<CFSET pay_period_week = "13"> 

 <cfelseif theDate GTE createdatetime(2014,7,26,15,0,1) AND theDate LTE createdatetime(2014,8,2,15,0,0)>
<CFSET pay_period_number = "7">  
<CFSET pay_period_week = "14"> 

 <cfelseif theDate GTE createdatetime(2014,8,2,15,0,1) AND theDate LTE createdatetime(2014,8,9,15,0,0)>
<CFSET pay_period_number = "8">  
<CFSET pay_period_week = "15"> 
 <cfelseif theDate GTE createdatetime(2014,8,9,15,0,1) AND theDate LTE createdatetime(2014,8,16,15,0,0)>
<CFSET pay_period_number = "8">  
<CFSET pay_period_week = "16"> 

<cfelseif theDate GTE createdatetime(2014,8,16,15,0,1) AND theDate LTE createdatetime(2014,8,23,15,0,0)>
<CFSET pay_period_number = "9">  
<CFSET pay_period_week = "17"> 
 <cfelseif theDate GTE createdatetime(2014,8,23,15,0,1) AND theDate LTE createdatetime(2014,8,30,15,0,0)>
<CFSET pay_period_number = "9">  
<CFSET pay_period_week = "18"> 

<cfelseif theDate GTE createdatetime(2014,8,30,15,0,1) AND theDate LTE createdatetime(2014,9,6,15,0,0)>
<CFSET pay_period_number = "10">  
<CFSET pay_period_week = "19"> 
 <cfelseif theDate GTE createdatetime(2014,9,6,15,0,1) AND theDate LTE createdatetime(2014,9,13,15,0,0)>
<CFSET pay_period_number = "10">  
<CFSET pay_period_week = "20"> 

<cfelseif theDate GTE createdatetime(2014,9,13,15,0,1) AND theDate LTE createdatetime(2014,9,20,15,0,0)>
<CFSET pay_period_number = "11">  
<CFSET pay_period_week = "21"> 
 <cfelseif theDate GTE createdatetime(2014,9,20,15,0,1) AND theDate LTE createdatetime(2014,9,27,15,0,0)>
<CFSET pay_period_number = "11">  
<CFSET pay_period_week = "22"> 


<cfelseif theDate GTE createdatetime(2014,9,27,15,0,1) AND theDate LTE createdatetime(2014,10,4,15,0,0)>
<CFSET pay_period_number = "12">  
<CFSET pay_period_week = "23"> 
 <cfelseif theDate GTE createdatetime(2014,10,4,15,0,1) AND theDate LTE createdatetime(2014,10,11,15,0,0)>
<CFSET pay_period_number = "12">  
<CFSET pay_period_week = "24"> 

<cfelseif theDate GTE createdatetime(2014,10,11,15,0,1) AND theDate LTE createdatetime(2014,10,18,15,0,0)>
<CFSET pay_period_number = "13">  
<CFSET pay_period_week = "25"> 
 <cfelseif theDate GTE createdatetime(2014,10,18,15,0,1) AND theDate LTE createdatetime(2014,10,25,15,0,0)>
<CFSET pay_period_number = "13">  
<CFSET pay_period_week = "26"> 

<cfelseif theDate GTE createdatetime(2014,10,25,15,0,1) AND theDate LTE createdatetime(2014,11,01,15,0,0)>
<CFSET pay_period_number = "14">  
<CFSET pay_period_week = "27"> 
 <cfelseif theDate GTE createdatetime(2014,11,01,15,0,1) AND theDate LTE createdatetime(2014,11,08,15,0,0)>
<CFSET pay_period_number = "14">  
<CFSET pay_period_week = "28"> 

<cfelseif theDate GTE createdatetime(2014,11,08,15,0,1) AND theDate LTE createdatetime(2014,11,15,15,0,0)>
<CFSET pay_period_number = "15">  
<CFSET pay_period_week = "29"> 
 <cfelseif theDate GTE createdatetime(2014,11,15,15,0,1) AND theDate LTE createdatetime(2014,11,22,15,0,0)>
<CFSET pay_period_number = "15">  
<CFSET pay_period_week = "30"> 


<cfelseif theDate GTE createdatetime(2014,11,22,15,0,1) AND theDate LTE createdatetime(2014,11,29,15,0,0)>
<CFSET pay_period_number = "16">  
<CFSET pay_period_week = "31"> 
 <cfelseif theDate GTE createdatetime(2014,11,29,15,0,1) AND theDate LTE createdatetime(2014,12,06,15,0,0)>
<CFSET pay_period_number = "16">  
<CFSET pay_period_week = "32"> 


<cfelseif theDate GTE createdatetime(2014,12,06,15,0,1) AND theDate LTE createdatetime(2014,12,13,15,0,0)>
<CFSET pay_period_number = "17">  
<CFSET pay_period_week = "33"> 
 <cfelseif theDate GTE createdatetime(2014,12,13,15,0,1) AND theDate LTE createdatetime(2014,12,20,15,0,0)>
<CFSET pay_period_number = "17">  
<CFSET pay_period_week = "34"> 


<cfelseif theDate GTE createdatetime(2014,12,20,15,0,1) AND theDate LTE createdatetime(2014,12,27,15,0,0)>
<CFSET pay_period_number = "18">  
<CFSET pay_period_week = "35"> 
 <cfelseif theDate GTE createdatetime(2014,12,27,15,0,1) AND theDate LTE createdatetime(2015,01,03,15,0,0)>
<CFSET pay_period_number = "18">  
<CFSET pay_period_week = "36"> 

<cfelseif theDate GTE createdatetime(2015,01,03,15,0,1) AND theDate LTE createdatetime(2015,01,10,15,0,0)>
<CFSET pay_period_number = "19">  
<CFSET pay_period_week = "37"> 
 <cfelseif theDate GTE createdatetime(2015,01,10,15,0,1) AND theDate LTE createdatetime(2015,01,17,15,0,0)>
<CFSET pay_period_number = "19">  
<CFSET pay_period_week = "38"> 

</cfif>  --->
