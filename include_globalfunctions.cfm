<cffunction
    name="datetimeformatadd"
    access="public"
    returntype="string"
    output="false"
    hint="Reformat date before returning it (to mimic CF9 old behavior)">

    <cfargument name="type" type="string" required="true" />
    <cfargument name="inc" type="numeric" required="true" />
    <cfargument name="datestr" type="string" required="true" />
    <cfargument name="strformat" type="string" required="false" default="yyyy-mm-dd" />
    <cfscript>
        return dateFormat(dateadd(type, inc, datestr), strformat);
    </cfscript>
</cffunction>

<cffunction
    name="dateformatnow"
    access="public"
    returntype="string"
    output="false"
    hint="Reformat date before returning it (to mimic CF9 old behavior)">

    <cfargument name="strformat" type="string" required="false" default="yyyy-mm-dd HH:mm:ss" />
    <cfscript>
        return dateFormat(Now(), strformat);
    </cfscript>
</cffunction>