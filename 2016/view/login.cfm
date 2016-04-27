<cfinclude template="#APPLICATION.basePath#view/global_header_login.cfm">

<style>
    .loginClass {
    }
    .loginClass td {
        padding: 3px;
    }
    .loginClass td:first-child {
        text-align: right;
        font-weight: bold;
    }
</style>

<cfif IsDefined('error_login')>
    <cfoutput>
        <font color="##AA0000">#error_login#</font>
        <br /><br />
    </cfoutput>
</cfif>

<form method="post" onSubmit="return validateForm()">
    <input type="hidden" name="formAction" value="login">

    <table class="loginClass">
        <tbody>
            <tr>
                <td><label for="username">Username:</label></td>
                <td><input id="username" name="username" /></td>
            </tr>
            <tr>
                <td><label for="username">Password:</label></td>
                <td><input id="password" name="password" type="password" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"></td>
            </tr>
        </tbody>
    </table>
</form>

<script>
    var elements = ['username', 'password'];

    function validateForm() {
        for(var i=0; i<elements.length; i++) {
            var element = elements[i];
            if (document.getElementById(element).value == '') {
                document.getElementById(element).focus();
                return false;
            }
        }
        return true;
    }

    window.onload = function() {
        document.getElementById('username').focus();
    }

</script>

<cfinclude template="#APPLICATION.basePath#view/global_footer.cfm">