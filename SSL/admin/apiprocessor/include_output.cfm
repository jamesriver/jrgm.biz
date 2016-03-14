<cfif !IsDefined('output_str')>
    <cfoutput>Invalid output</cfoutput>
    <cfabort>
</cfif>

<!--- add multi_delimiter at the end of the output because of legacy issue in old apiprocessor.aspx that caused the final element to have garbage HTML tags in it --->
<cfif IsDefined('url.test')>
    <cfoutput>IN TEST MODE<br /></cfoutput>
</cfif>

<cfoutput>
    #output_str##multi_delimiter#
</cfoutput>