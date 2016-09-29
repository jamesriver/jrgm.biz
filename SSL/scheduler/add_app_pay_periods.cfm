<cfquery name="get_latest_app_pay_period" datasource="jrgm">
    SELECT CASE WHEN MAX(pay_period_start) < DATEADD(month, 2, GETUTCDATE()) THEN 1 ELSE 0 END as insert_new_pay_period
    , CASE WHEN MAX(pay_period_start) < DATEADD(month, 2, GETUTCDATE()) THEN DATEADD(day, 7, MAX(pay_period_start)) ELSE NULL END as insert_pay_period_start
    , CASE WHEN MAX(pay_period_start) < DATEADD(month, 2, GETUTCDATE()) THEN DATEADD(day, 7, MAX(pay_period_end)) ELSE NULL END as insert_pay_period_end
    , CASE WHEN MAX(pay_period_start) < DATEADD(month, 2, GETUTCDATE()) THEN MAX(pay_period_number)+1 ELSE NULL END as insert_pay_period_number
    , CASE WHEN MAX(pay_period_start) < DATEADD(month, 2, GETUTCDATE()) THEN MAX(pay_period_week)+1 ELSE NULL END as insert_pay_period_week
    FROM app_pay_periods
</cfquery>
<cfif get_latest_app_pay_period.insert_new_pay_period EQ 1>
    <cfquery name="insert_app_pay_period" datasource="jrgm">
        INSERT INTO app_pay_periods
        (pay_period_number, pay_period_week, pay_period_start, pay_period_end)
        VALUES (
            #get_latest_app_pay_period.insert_pay_period_number#,
            #get_latest_app_pay_period.insert_pay_period_week#,
            '#get_latest_app_pay_period.insert_pay_period_start#',
            '#get_latest_app_pay_period.insert_pay_period_end#'
        ), (
            #get_latest_app_pay_period.insert_pay_period_number#,
            #(get_latest_app_pay_period.insert_pay_period_week+1)#,
            DATEADD(day, 7, '#get_latest_app_pay_period.insert_pay_period_start#'),
            DATEADD(day, 7, '#get_latest_app_pay_period.insert_pay_period_end#')
        )
    </cfquery>
    <cfoutput>
    Added pay_period_number=#get_latest_app_pay_period.insert_pay_period_number#
    </cfoutput>
</cfif>