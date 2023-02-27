<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateUD1.aspx.cs" Inherits="UpdateUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>document.getElementById("label1").innerHTML = "update user info";</script>
    <form action="UpdateUD1.aspx" dir="ltr" method="post" onsubmit="return chkform()">
        <br /><br />
        <br />
        <br />
        <h2 style="font-size:45px; color:#D9C21D">Update</h2>
        <br />

        <table dir="ltr" style="font-size:40px; color:#D9C21D">
            <tr>
                <td>Firstname</td>
                <td><input type="text" id="name" name="name" value="<%=fname %>"/></td>
                <td id="nickname-error" class="error"></td>
            </tr>
            <tr>
                <td>Lastname</td>
                <td><input type="text" id="lname" name="lname" value="<%=lname %>"/></td>
                <td id="name-error" class="error"></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" id="user" name="user" value="<%=user %>" disabled="disabled"/></td>
                <td id="password-error" class="error"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" maxlength="16" id="pass" name="password1" value="<%=password %>" /></td>
                <td id="ver_pass-error" class="error"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" size="30" id="email" name="email" value="<%=email %>" /></td>
                <td id="email-error" class="error"></td>
            </tr>
           <tr>
                <td>Phone</td>
                <td><input type="text" size="10" id="phone" name="phone" value="<%=phone %>" /></td>
                <td id="phone-error" class="error"></td>
            </tr>
            
            <tr>
                <td style="text-align:left; color:white">
                    <input type="submit" name="btn" value="Update"/>
                    <input type="reset" value="Reset"/>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>