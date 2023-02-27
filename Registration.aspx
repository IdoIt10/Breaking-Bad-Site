<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="direction:ltr; text-align:left; float:left; font-size:35px; background-color:transparent; color:#D9C21D">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "registration page";
        

   function ValidateForm() {
        var b = "";
        if (!CheckUserName()) {
            b = "Error";
        }
        if (!CheckPassword()) {
            b = "Error";
        }
        if (!CheckPassword1()) {
            b = "Error";
        }
        if (!CheckMail()) {
            b = "Error"
        }
        if (!CheckFirstName()) {
            b = "Error";
        }
        if (!CheckLastName()) {
            b = "Error";
        }
        if (!CheckPhone()) {
            b = "Error";
        }
        return b=="";
    }
    function CheckUserName() {
        var x = document.getElementById("userName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorUserName").innerHTML = "not a proper username";
            return false;
        }
        for (var s = 0; s < x.length; s++) {
            if (!('a' <= x.charAt(s) && x.charAt(s) <= 'z') && !('A' <= x.charAt(s) && x.charAt(s) <= 'Z')
                && !('0' <= x.charAt(s) && x.charAt(s) <= '9')) {
                document.getElementById("errorUserName").innerHTML =
                    "<span style='color:Red'>username can only contain 0-9 and a-z characters </span>";
                return false;
            }
        }
        document.getElementById("errorUserName").innerHTML = " ";
        return true;
    }
    
   
    function CheckPassword() {
        var x = document.getElementById("password").value;
        if (x == "" || x.length < 6) {
            document.getElementById("errorPassword").innerHTML = "not a proper password"
            return false;
        }
        document.getElementById("errorPassword").innerHTML = " ";
        return true;
    }
    function CheckPassword1() {
        var x = document.getElementById("password").value;
        var y = document.getElementById("password1").value;
        if (x != y) {
            document.getElementById("errorPassword1").innerHTML = "the password aren't identical"
            return false;

        }

        document.getElementById("errorPassword1").innerHTML = " ";
        return true;
    }
    function CheckMail() {
        var x = document.getElementById("email").value;
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x)) {
            document.getElementById("errorMail").innerHTML = "";
            return true;

        }
        document.getElementById("errorMail").innerHTML = "not a proper e-mail";
        return false;

    }
    function CheckFirstName() {
        var x = document.getElementById("firstName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorFirstName").innerHTML = "not a proper name";
            return false;
        }
        var n = document.getElementById("firstName").value;
        var string = "!@#$%^&*()_+=|\}]{[?/.><,`~/";
        if (n.length == 0) {
            document.getElementById("errorFirstName").innerHTML =
                "<span style='color:Red'>username required</span>";
            return false;
        }
        for (var i = 0; i < n.length; i++) {
            for (var j = 0; j < string.length; j++) {
                if (n.charAt(i) == string.charAt(j)) {
                    document.getElementById("errorFirstName").innerHTML =
                        "<span style='color:Red'>invalid characters</span>";
                    return false;
                }
            }
        }
        for (var s = 0; s < n.length; s++) {
            if ('0' <= n.charAt(s) && n.charAt(s) <= '9') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>first name must not contain numbers</span>";
                return false;
            }
            if ('a' <= n.charAt(s) && n.charAt(s) <= 'z') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>first name can only contain Hebrew letters</span>";
                return false;
            }
            if ('A' <= n.charAt(s) && n.charAt(s) <= 'Z') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>first name can only contain Hebrew letters</span>";
                return false;
            }
        }
        document.getElementById("errorFirstName").innerHTML = "";
        return true;
    }
    function CheckLastName() {
        var x = document.getElementById("lastName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorLastName").innerHTML = "not a proper lastname";
            return false;
        }

        var n = document.getElementById("lastName").value;
        var string = "!@#$%^&*()_+=|\}]{[?/.><,`~/";
        if (n == "") {
            document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>lastname required</span>";
            return false;
        }
        for (var i = 0; i < n.length; i++) {
            for (var j = 0; j < string.length; j++) {
                if (n.charAt(i) == string.charAt(j)) {
                    document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>invalid characters</span>";
                    return false;
                }
            }
        }
        for (var s = 0; s < n.length; s++) {
            if ('0' <= n.charAt(s) && n.charAt(s) <= '9') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>firstname must not contain numbers</span>";
                return false;
            }
            if ('a' <= n.charAt(s) && n.charAt(s) <= 'z') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>first name can only contain Hebrew letters</span>";
                return false;
            }
            if ('A' <= n.charAt(s) && n.charAt(s) <= 'Z') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>first name can only contain Hebrew letters</span>";
                return false;
            }
        }
        document.getElementById("errorLastName").innerHTML = "";
        return true;
    }
        function CheckPhone() {
            var x = document.getElementById("phone").value;
            if (x == "" || x.length < 10) {
            document.getElementById("errorPhone").innerHTML = "<span style='color:Red'>the phone number should include 9 digits</span>";
                return false;
            }
            document.getElementById("errorPhone").innerHTML = "";
            return true;
    }


</script>

        <h1 style="color:#D9C21D; text-align:center">Registration</h1>
        <br />
    <form name="Registration" action="Registration.aspx" method="post" >
        <table>
            <tr>
                <td>username</td>
                <td><input type="text" name="userName" id="userName" size="30" /></td>
                <td style="color:Red; " id="errorUserName"></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input type="password" name="password" id="password" size="30" /></td>
                <td style="color:Red; " id="errorPassword"></td>
            </tr>
            <tr>
                <td>password verify&nbsp;</td>
                <td><input type="password" name="password1" id="password1" size="30"/></td>
                <td style="color:Red; " id="errorPassword1"></td>
            </tr>
            <tr>
                <td>e-mail</td>
                <td><input type="text" name="email" id="email" size="30" /></td>
                <td style="color:Red; " id="errorMail"></td>
            </tr>
            <tr>
                <td>first name</td>
                <td><input type="text" name="firstName" id="firstName" size="30" /></td> 
                    <td style="color:Red; " id="errorFirstName"></td>
            </tr>
            <tr>
                <td>last name</td>
                <td><input type="text" name="lastName" id="lastName" size="30" /></td>
                <td style="color:Red; " id="errorLastName"></td>
            </tr>
            <tr>
                <td>phone number</td>
                <td><input type="text" name="phone" id="phone" size="30" /></td>
                <td style="color:Red; " id="errorPhone"></td>
            </tr>

</table>
    <br />
        <p style="text-align:center">
    <input type="submit" name="submit" value="submit" onclick="return ValidateForm()"/>
    <input type="reset" value="clear" onclick="return ResetForm()"/> &nbsp  &nbsp</p>
</form>
        </div>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

