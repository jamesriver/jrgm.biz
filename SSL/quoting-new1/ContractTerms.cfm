<cfquery name="get_quote_info" datasource="jrgm">
 SELECT    ID, opportunity_id, opportunity_name, opportunity_state, bid_amount, 
 opportunity_field_1 AS q_branch, 
 opportunity_field_18 AS q_start_date ,
 opportunity_field_19 AS q_end_date, 
 stage_id, 
 date_created_utc, 
 bid_currency, 
 bid_type, 
 bid_duration, 
 pipeline_id, 
 opportunity_field_2 AS q_address1, 
 opportunity_field_3 AS q_address2, 
 opportunity_field_4 AS q_city, 
 opportunity_field_5  AS q_address_state, 
 opportunity_field_6 AS q_address_zip, 
 opportunity_field_14 AS q_opportunity_type  ,
 OPPORTUNITY_status ,date_updated_utc, 
 date_due_utc,user_id,
 OPPORTUNITY_FIELD_20  AS   Billing_Contact_Name,
OPPORTUNITY_FIELD_21 AS  Billing_Contact_Phone,
OPPORTUNITY_FIELD_22 AS Billing_Contact_Email_Address,
OPPORTUNITY_FIELD_23 As Bill_To_Company_Name,
OPPORTUNITY_FIELD_8  AS  Billing_Address_1,
OPPORTUNITY_FIELD_9  AS  Billing_Address_2,
OPPORTUNITY_FIELD_10  AS  Billing_City,
OPPORTUNITY_FIELD_11  AS  Billing_State,
OPPORTUNITY_FIELD_12  AS  Billing_Zip
 FROM         quote_start
where opportunity_id  =#url.id#
</cfquery>
<cfquery name="get_quote_info_date" datasource="jrgm">
SELECT    contract_start_date, contract_end_date, 
  contract_installments
FROM         quote_main
where opportunity_id  =#url.id#
</cfquery>
<cfif  get_quote_info.user_id NEQ "">
  <cfquery name="get_estimator" datasource="jrgm">
 SELECT  [Employee ID] AS Employee_ID,[Name FirstLast] AS employee_name, first_name ,  last_name,branch     
 FROM app_employees  
where  [Employee ID]   =#get_quote_info.user_id#
</cfquery>
</cfif>
<cfquery name="get_quote_dollars" datasource="jrgm">
SELECT     ID, date_created, gross_margin, opportunity_id, date_updated, user_id,  total_contract_price,contract_installments, adjusted_contract_price
FROM         quote_main 
where opportunity_id  =#url.id#
</cfquery>
<cfif  get_quote_dollars.adjusted_contract_price NEQ ""  AND  get_quote_dollars.adjusted_contract_price NEQ "0.00"  AND   get_quote_dollars.contract_installments NEQ "0.00">
  <CFSET monthly_price =  get_quote_dollars.adjusted_contract_price/get_quote_info_date.contract_installments>
  <cfelse>
  <CFSET monthly_price = "">
</cfif>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>James River Grounds Management -<cfoutput>#get_quote_info.opportunity_name#</cfoutput>Contract Terms</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;target-densitydpi=low-dpi;"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />
<!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<style type="text/css">
.centrecontent_inner_estimate {
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	padding: 20px;
}
.fa-red {
	color: #cc0000;
}
 
 
.caps7 {
	
 	font:  9.5px   medium "Helvetica Neue", Helvetica, sans-serif;
	line-height: 13px;
  
}
 
.caps1 {	
	font:  "Helvetica Neue", Helvetica, sans-serif; 
}
h4 {font:  18px  medium Helvetica, sans-serif; }
</style>
</head>
<body>
<div id="outerfull">
  <div id="centrecontent"> 
    
    <!--centre content goes here -->
    <div class="centrecontent_inner_estimate">
      <div class="contractTerms">
        <div align="center"><img src="images/logo_2016_CT.png" />  
          <h4>CONTRACT TERMS</h4>
      <!---  </div>--->
        <cfif  get_quote_info.q_branch EQ 'Chesterfield'>
          <CFSET street_address = '11551 Deerhill Lane'>
          <CFSET city_state_zip= 'Midlothian, VA 23112'>
          <CFSET Phone= '804-598-2725'>
          <CFSET Fax= '804-639-1742'>
          <cfelseif get_quote_info.q_branch EQ 'Richmond'>
          <CFSET street_address = '11008 Washington Hwy'>
          <CFSET city_state_zip= 'Glen Allen, VA 23059'>
          <CFSET Phone= '804-550-3500'>
          <CFSET Fax= '804-550-9610'>
          <cfelseif get_quote_info.q_branch EQ 'Charlottesville'>
          <CFSET street_address = '395 Reas Ford Road, Suite 180'>
          <CFSET city_state_zip= 'Earlysville, VA 22936'>
          <CFSET Phone= '434-973-0358'>
          <CFSET Fax= '434-973-2577'>
          <cfelseif get_quote_info.q_branch EQ 'Portsmouth'>
          <CFSET street_address = '3127 Ballard Ave.'>
          <CFSET city_state_zip= 'Portsmouth, VA 23701'>
          <CFSET Phone= '757-488-8600'>
          <CFSET Fax= '757-488-9310'>
          <cfelseif get_quote_info.q_branch EQ 'Portstmouth'>
          <CFSET street_address = '3127 Ballard Ave.'>
          <CFSET city_state_zip= 'Portsmouth, VA 23701'>
          <CFSET Phone= '757-488-8600'>
          <CFSET Fax= '757-488-9310'>
          <cfelseif get_quote_info.q_branch EQ 'Newport News'>
          <CFSET street_address = '5 Elmhurst St'>
          <CFSET city_state_zip= 'Newport News, VA 23603'>
          <CFSET Phone= '757-820-3781'>
          <CFSET Fax= '757-820-3784'>
          <cfelseif get_quote_info.q_branch EQ 'Williamsburg'>
          <CFSET street_address = ''>
          <CFSET city_state_zip= ''>
          <CFSET Phone= ''>
          <CFSET Fax= ''>
          <cfelseif get_quote_info.q_branch EQ ''>
          <CFSET street_address = '-'>
          <CFSET city_state_zip= '-'>
          <CFSET Phone= '-'>
          <CFSET Fax= '-'>
        </cfif>
        <cfoutput  query="get_quote_info">
          <table border="0" cellspacing="0" cellpadding="8" class="caps7">
            <tr>
              <td valign="top">CONTRACTOR:</td>
              <td valign="top">JAMES RIVER GROUNDS MANAGEMENT, INC.<br />
                <cfoutput> #street_address#<br />
                  #city_state_zip# <br />
                  Phone: #Phone# Fax: #Fax#</cfoutput> <br /></td>
              </tr>
            <cfoutput>
              <tr>
                <td valign="top">CLIENT:</td>
                <td valign="top">#Bill_To_Company_Name#<br />
                  #Billing_Contact_Name#<br />
                  #Billing_Address_1#<br />
                  
                  <!---<cfif Billing_Address_2 NEQ ' '>#Billing_Address_2#</cfif><br />---> 
                  <!---  <cfif NOT IsNull(Billing_Address_2)>#Billing_Address_2#</cfif><br />--->
                  
                  <cfif len(Billing_Address_2)>
                    #Billing_Address_2#<br />
                  </cfif>
                  #Billing_City#, #Billing_State# #Billing_Zip#<br /></td>
              </tr>
            </cfoutput>
            <tr>
              <td valign="top">WORK LOCATION:</td>
              <td valign="top">#opportunity_name#<br />
                #q_address1#<br />
                #q_city#, #q_address_state# #q_address_zip#<br /></td>
            </tr>
          </table>
        </cfoutput>
        </div>
        <p align="justify"><span class="caps7">I. JAMES RIVER GROUNDS MANAGEMENT, INC SHALL PROVIDE THE SERVICES LISTED ON THE 'MAINTENANCE SERVICES SUMMARY' (Attachment A), AS DETAILED WITHIN THE 'DEFINITION OF SERVICES' (Attachment B)' AT <cfoutput><strong><u>#get_quote_info.opportunity_name#</u></strong></cfoutput> FOR THE TOTAL FEE OF<strong> $<cfoutput><u>#NumberFormat(get_quote_dollars.adjusted_contract_price,"999,999.99")#</u></cfoutput></strong>, PAYABLE IN <cfoutput>#get_quote_info_date.contract_installments#</cfoutput> EQUAL INSTALLMENTS OF <strong>$<cfoutput><u>#NumberFormat(monthly_price,"999,999.99")#</u></cfoutput></strong> WITH SERVICE AND BILLING BEGINNING <strong><u><cfoutput>#dateformat(get_quote_info_date.contract_start_date,"mmmm dd,yyyy")#</cfoutput></u></strong> AND ENDING <strong><u><cfoutput>#dateformat(get_quote_info_date.contract_end_date,"mmmm dd,yyyy")#</cfoutput></u>.</strong></span></p>
        <p align="justify"><span class="caps7">II. PAYMENT FOR SERVICES WILL BE BILLED MONTHLY WITH PAYMENT DUE ON THE FIFTEENTH DAY 
          FOLLOWING RECEIPT OF INVOICE. A LATE FEE OF ONE AND A HALF PERCENT (1.5%) WILL BE APPLIED 
          TO ALL INVOICES NOT PAID WITHIN THIRTY (30) DAYS. IF THIS CONTRACT IS REFERRED FOR 
          COLLECTION, THE CLIENT AGREES TO PAY ALL COSTS OF THE COLLECTION INCLUDING ATTORNEY'S 
          FEES.</span></p>
        <p align="justify"><span class="caps7">III. THIS AGREEMENT WILL AUTOMATICALLY RENEW WITH A 2.5% INCREASE IF THE CONTRACTOR IS NOT
          MADE AWARE OF TERMINATION IN WRITING WITHIN THIRTY (30) DAYS OF EXPIRATION. CONTRACTOR
          WILL NOTIFY CLIENT WITHIN 30 DAYS OF EXPIRATION IF THE TERMS OF THIS AGREEMENT ARE TO BE
          CHANGED AT TIME OF RENEWAL.</span></p>
        <p align="justify"><span class="caps7">IV. CONTRACTOR OR CLIENT MAY CANCEL THIS CONTRACT WITH THIRTY (30) DAYS WRITTEN NOTICE.
          PLEASE NOTE THAT THE MONTHLY CHARGE FOR THIS CONTRACT IS AN AVERAGE OF THE TOTAL
          CHARGE FOR ALL SERVICES TO BE PERFORMED UNDER THIS AGREEMENT AND BECAUSE SUBSTANTIAL
          PORTIONS OF THE WORK MAY BE PERFORMED AT THE BEGINNING OF THE CONTRACT TERM, THE
          CONTRACTOR IS ENTITLED TO RECOVER COSTS INCURRED THROUGH THE DATE OF CANCELLATION,
          INCLUDING A REASONABLE AMOUNT OF OVERHEAD AND PROFIT.</span></p>
        <p align="justify"><span class="caps7">V. JAMES RIVER GROUNDS CANNOT BE HELD LIABLE FOR DAMAGE DONE TO PRIVATE OR TEMPORARY
          UTILITIES AND VINYL SIDING INSTALLED WITHIN 6&quot; OF TURF.</span></p>
        <p align="justify"><span class="caps7">VI. IF CONTRACT START DATE COINCIDES WITH SPRING MULCH SEASON, JOB WILL BE MULCHED WITHIN
          90 DAYS OF START DATE.</span></p>
        <p align="justify"><span class="caps7">VII. JOBS THAT HAVE NOT BEEN MAINTAINED  CLOSE TO SCOPE SPECIFIED WITHIN CONTRACT SPECIFICATIONS MAY NEED ADDITIONAL  WORK TO BRING JOB UP TO A MAINTAINABLE STANDARD. ANY ADDITIONAL COSTS WILL BE IDENTIFIED PRIOR  TO COMMENCEMENT OF WORK.</span></p>
        <p align="justify"><span class="caps7">VIII. ANY COSTS THAT ARE INCURRED FROM AUTOMATED OR  THIRD PARTY INVOICE PROCESSING MANDATED BY CLIENT, NOT NEGOTIATED AT THE TIME  OF THIS AGREEMENT, WILL BE ADDED TO THE MONTHLY INVOICE.</a></span></p>
        <p align="justify"><span class="caps7">IX. BY SIGNING BELOW, CLIENT  ACKNOWLEDGES THAT HE/SHE HAS READ AND INITIALED BOTH ATTACHMENT A, DETAILING  THE SERVICES QUOTED SPECIFIC TO THIS CONTRACT AND ATTACHMENT B, A DETAIL OF  SERVICES OFFERED AND EXCLUSIONS TO THE CONTRACT. </span></p>
        <p align="justify"><span class="caps7">X.  ACCEPTANCE </span></p>
        <p align="left"><span class="caps7">FOR CONTRACTOR:________________________________________________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE:___________________________</span></p>
        <p align="left"><span class="caps7">PRINTED NAME AND TITLE:_____________________________________________________________________________________________________________</span></p>
        <p align="left"><span class="caps7">FOR CLIENT:_______________________________________________________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE:___________________________ </span></p>
       <p align="left"><span class="caps7">PRINTED NAME AND TITLE:______________________________________________________________________________________________________________</span></p>
      </div>
    </div>
  </div>
  <!-- to clear footer --> 
</div>
</body>
</html>
