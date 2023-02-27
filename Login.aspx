<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <br />
    <br />
    <br />
    <br />
    <br />
    <div style="direction:ltr; text-align:center; float:left; font-size:35px; background-color:transparent; color:#D9C21D">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "login page";
        
        function ValidateForm() {

            return CheckUserName() && CheckPassword();
        }

        function CheckUserName() {
            var x = document.getElementById("userName").value;
            if (x == "" || x.length < 2) {
                document.getElementById("ErrorUserName").innerHTML = "The name is invalid";admin
                return false;
            }
            document.getElementById("ErrorUserName").innerHTML = "";
            return true;
        }

        function CheckPassword() {
            var x = document.getElementById("password").value;
            if (x == "" || x.length < 6) {
                document.getElementById("ErrorPassword").innerHTML = "the password is invalid"
                return false;
            }
            document.getElementById("ErrorPassword").innerHTML = " ";
            return true;
        }

    </script>
    <form action="Login.aspx" method="post" style="background-color:transparent; text-align: center; font-size:35px; direction:ltr">
        <h1 style="color:#D9C21D; text-align:center">Login</h1>
        <br />
        <table style="direction:ltr">
            <tr>
                <td>user name</td>
                <td><input type="text" name="userName" id="userName"/></td>
                <td style="color:Red;" id="ErrorUserName"></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input type="password" name="password" id="password"/></td>
                <td style="color:Red;" id="ErrorPassword"></td>
            </tr>
        </table>
        <p style="text-align:center">    
        <input type="submit" name="submit" value="enter" onclick="return ValidateForm()" />
        <input type="reset" value="clear"/></p>
    </form>
        </div>
</asp:Content>


