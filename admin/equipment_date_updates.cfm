    
  <!---   Code 1  (hours +100) --->
      <cfquery name="update_oil_change_due_hours_code1" datasource="jrgm" >
    UPDATE equipment
    SET   oil_change_hours_due =(last_oil_change_hours+100) 
    WHERE oil_change_criteria =1   AND last_oil_change_hours IS NOT NULL  AND last_oil_change_hours > 0
      </cfquery>
      
        <!---   Code 5 (hours +100) --->
      <cfquery name="update_oil_change_due_hours_code5" datasource="jrgm" >
    UPDATE equipment
    SET   oil_change_hours_due =(last_oil_change_hours+200) 
    WHERE oil_change_criteria =5   AND last_oil_change_hours IS NOT NULL AND last_oil_change_hours > 0
      </cfquery>
      <!---   Code 2 (miles+5000) --->
     <cfquery name="update_oil_change_due_mileage_code2" datasource="jrgm" >
    UPDATE equipment
    SET   oil_change_mileage_due =(last_oil_change_miles+5000) 
    WHERE oil_change_criteria =2   AND last_oil_change_miles IS NOT NULL AND last_oil_change_miles > 0
      </cfquery>
      
       <!---   Code 3 (miles+10000) --->
     <cfquery name="update_oil_change_due_mileage_code3" datasource="jrgm" >
    UPDATE equipment
    SET   oil_change_mileage_due =(last_oil_change_miles+10000) 
    WHERE oil_change_criteria =3   AND last_oil_change_miles IS NOT NULL AND last_oil_change_miles > 0
      </cfquery>
      
            <!---   Code 4 (Date+30days) --->
     <cfquery name="update_oil_change_due_date_code4" datasource="jrgm" >
    UPDATE equipment
    SET    oil_change_date_due =<!--- (last_oil_change_date,30)  ---> DATEADD(dd,30,last_oil_change_date)
    WHERE oil_change_criteria =4   AND  last_oil_change_date IS NOT NULL
      </cfquery>
      
        <cfquery name="update_state_inspection" datasource="jrgm" >
    UPDATE equipment
    SET      Inspection_Due =(DATEADD(yyyy,1,last_inspection_date))
      WHERE engine_cycle = 4 AND CATEGORY ='Vehicles'  AND CATEGORY ='Trailers'  AND  last_inspection_date IS NOT NULL
      </cfquery>
  <!---   SI:    <cfoutput> #update_state_inspection.recordcount#</cfoutput> --->
      
 <strong> Equipment Oil Change Due Dates Updated</strong><br>
<br>

<a href="javascript: history.go(-1)">Go Back</a>