<cfcomponent
    displayname="dateadd"
    output="false">

    <!--- Set method access pointers. --->
    <cfset THIS.dateadd = $dateadd />

    <cffunction
        name="$dateadd"
        access="private"
        returntype="boolean"
        output="false"
        hint="Reformat date before returning it (to mimic CF9 old behavior)">

        <cfargument name="type" type="string" required="true" />
        <cfargument name="inc" type="numeric" required="true" />
        <cfargument name="datestr" type="string" required="true" />
        <cfargument name="strformat" type="string" required="false" default="yyyy-mm-dd" />
        <cfscript>
            return dateTimeFormat(dateadd(type, inc, datestr), strformat);
        </cfscript>
    </cffunction>

</cfcomponent>