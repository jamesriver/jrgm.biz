<cfif IsDefined('url.test')>
    <cfset form = url>
</cfif>

<cfif !IsDefined('form.key')>
    <cfoutput>NOT ALLOWED</cfoutput>
    <cfabort>
</cfif>

<cfif form.key NEQ 'JRGM3ncrypt1oNk3Y'>
    <cfoutput>INVALID KEY</cfoutput>
    <cfabort>
</cfif>

<cfif !IsDefined('form.method')>
    <cfoutput>MISSING METHOD</cfoutput>
    <cfabort>
</cfif>

<cfset isauthorized=1>
<cfif IsDefined('form.forceerror')>
    <cfinclude template="apiprocessor/#form.method#.cfm">
<cfelse>
    <cftry>
        <cfinclude template="apiprocessor/#form.method#.cfm">
        <cfcatch>
            <cfif IsDefined('url.test')>
                <cfoutput>COULD NOT RESOLVE #form.method#: #cfcatch.message#</cfoutput>
            </cfif>
        </cfcatch>
    </cftry>
</cfif>