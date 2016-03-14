<!--- just define dataources and connector paths --->
<cfset request.dhtmlxConnectors = StructNew()>
<cfset request.dhtmlxConnectors["datasource"] = "jrgm">
<cfset request.dhtmlxConnectors["datasource_mssql"] = "MSSQL">
<cfset request.dhtmlxConnectors["datasource_msAccess"] = "sampleDB_MSAccess">
<!--- here are the Full Mappings to the directoy with connectors. Later the <path>.<cfcName> must be accessed --->
<cfset request.dhtmlxConnectors["combo"] = "codebase.cfcComboConnector">
<cfset request.dhtmlxConnectors["tree"] = "codebase.cfcTreeConnector">
<cfset request.dhtmlxConnectors["options"] = "codebase.cfcOptionsConnector">
<cfset request.dhtmlxConnectors["grid"] = "codebase.cfcGridConnector">
<cfset request.dhtmlxConnectors["treegrid"] = "codebase.cfcTreeGridConnector">
<cfset request.dhtmlxConnectors["scheduler"] = "codebase.cfc.SchedulerConnector">


