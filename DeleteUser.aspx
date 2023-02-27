<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="UserDelete" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script> document.getElementById("label1").innerHTML = "delete user";
         document.getElementById("ManagerPageRef")
     </script>
    <br />
    <br />
    <br />
    <br />
    <center>
    <form id="frm" method="post" action="DeleteUser.aspx">
        <table style="color:white; background-color: red; font-size:60px; position:center; text-align:center">
            <tr><td><%=Session["Login"] %> Are you sure you want to delete the user?
                <br />
                <br />
                -you can't delete the admin, it will still remain-
                </td></tr>
            <tr><td><input type="submit" value="Delete" name="Btn" /></td></tr>
        </table>
    </form></center>
</asp:Content>


