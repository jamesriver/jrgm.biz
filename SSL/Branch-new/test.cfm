<cfquery name="get_daily_sheets" datasource="jrgm"  maxrows="50"> 
 SELECT  * FROM app_daily_sheets 
ORDER by ID DESC
  </cfquery>
  <div>hello</div>
  <cfsetting showdebugoutput="false">