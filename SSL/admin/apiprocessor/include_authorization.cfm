<cfif !IsDefined('isauthorized')>
    <cfoutput>NOT AUTHORIZED</cfoutput>
    <cfabort>
</cfif>
<cfset output_str = ''>
<cfset multi_delimiter = '`'>