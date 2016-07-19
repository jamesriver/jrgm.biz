<!--- HANDLE POST REQUEST HERE --->
<cfset SKIP_AUTHENTICATION = 1>
<cfinclude template="#APPLICATION.basePath#include/init.cfm">
<cfinclude template="#APPLICATION.basePath#controller/global_controller.cfm">

<cfif IsDefined('FORM.formAction')>
    <cfswitch expression="#FORM.formAction#">
        <!--- LOG INTO BIZ --->
        <cfcase value="login">
            <cfset query_name = 'query_login'>
            <cfset query_login_username = FORM.username>
            <cfset query_login_password = FORM.password>
            <cfinclude template="#APPLICATION.basePath#model/global_model.cfm">

            <cfif query_login.recordCount EQ 1 AND TRIM(query_login.username) NEQ ''>
                <!--- SUCCESSFUL LOGIN --->
                <cfoutput query="query_login">
                    <cfset SESSION.loginid = 1>
                    <cfset SESSION.userid = query_login.Employee_ID>
                    <cfset SESSION.branch = query_login.employee_branch>
                    <cfset SESSION.allowin = "true">
                    <cfset SESSION.access_role = query_login.access_role>
                    <cfset SESSION.screenname = query_login.firstname & " " & query_login.lastname>
                    <cfset SESSION.todaytoken = dateformat(now(), "mmddyyyy") & "T" & TimeFormat(now(), "HHmmss")>
                    <cfset SESSION.logindate = DateFormat(Now(),"mm/dd/yyyy")>

                    <cfif query_login.Employee_ID EQ EMPLOYEEID_MARIACANDLER>
                        <cfset SESSION.screenname_always = query_login.firstname & " " & query_login.lastname>
                        <cfset SESSION.userid = EMPLOYEEID_MARIACANDLER>
                    </cfif>

                    <cfif query_login.Employee_ID EQ EMPLOYEEID_JASONKNIGHT>
                        <cfset SESSION.screenname_always = query_login.firstname & " " & query_login.lastname>
                        <cfset SESSION.userid = EMPLOYEEID_JASONKNIGHT>
                    </cfif>

                    <cfcookie name="employee_ID" value="#SESSION.userid#" expires="7">
                    <cfcookie name="employee_name" value="#SESSION.screenname#" expires="7">
                    <cfcookie name="employee_position_ID" value="#SESSION.access_role#" expires="7">
                </cfoutput>

                <cfcookie name="employee_position" value="#query_login.access_role_name#" expires="7">
                <cfset SESSION.employee_position = query_login.access_role_name>
                 
                <cfset query_name = 'query_get_supervisor_id'>
                <cfset query_employee_id = SESSION.userid>
                <cfinclude template="#APPLICATION.basePath#model/global_model.cfm">
                <cfset SESSION.supervisor_id = query_get_supervisor_id.supervisor_id>

                 <cfif SESSION.access_role EQ ACCESSROLE_PRODUCTIONMANAGER>
                    <cflocation   url="/ssl/supervisors-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_SUPERVISORCREWLEADER>
                    <cflocation   url="/"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_IRRIGATIONTECH>
                    <cflocation   url="/ssl/itech-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_SPRAYTECH>
                    <cflocation   url="/ssl/stech-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_MECHANIC>
                    <cflocation   url="/ssl/mechanic-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_BRANCHMANAGER>
                    <cflocation   url="/ssl/branch-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_REGIONALMANAGER>
                    <cflocation url="/ssl/regional-new/index.cfm"  addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_BUSINESSDEVELOPMENTGROUP>
                    <cflocation   url="/ssl/admin/default.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_ADMIN95>
                    <cflocation   url="/ssl/admin/bgarrett.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_ADMINISTRATIVEASSISTANT>
                    <cflocation   url="/ssl/admin/payroll/payrollbetty.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_ESTIMATOR>
                    <cflocation   url="/ssl/quoting-new/default.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_REGIONALADMIN>
                    <cflocation   url="/ssl/regional_admin-new/index.cfm"   addtoken="no"  >
                 <cfelseif SESSION.access_role EQ ACCESSROLE_ADMIN>
                    <cflocation   url="#APPLICATION.basePath#index.cfm"   addtoken="no"  >
                 </cfif>
            <cfelse>
                <!--- FAILED LOGIN --->
                <cfset error_login = ERRORMESSAGE_LOGIN_BADCREDENTIALS>
                <cfinclude template="#APPLICATION.basePath#view/login.cfm">
            </cfif>
        </cfcase>
        <!--- UNKNOWN FORMACTION --->
        <cfdefaultcase>
            <cfset errorMessage = ERRORMESSAGE_FORMACTION>
            <cfinclude template="#APPLICATION.basePath#view/error_post.cfm">
        </cfdefaultcase>
    </cfswitch>
</cfif>

<!--- HANDLE GET REQUESTS HERE --->
<cfif IsDefined('URL.login')>
    <cfinclude template="#APPLICATION.basePath#view/login.cfm">
</cfif>

<!--- MAIN ROUTING LOGIC HERE, ASSUMING NO GET OR POST VARIABLES --->
<cfif !IsDefined('SESSION.userid')>
    <cflocation url="#APPLICATION.basePath#index.cfm?login" addtoken="no">
</cfif>

<!--- FIGURE OUT HOME PAGE BY ACCESS_ROLE --->
<cfif SESSION.access_role EQ ACCESSROLE_ADMIN>
    <cfinclude template="#APPLICATION.basePath#view/home_admin.cfm">
<cfelse>
    <cfinclude template="#APPLICATION.basePath#view/home_dashboard.cfm">
</cfif>