<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "admin page";
    </script>
    <br />
    <br />
    <br />
    <div style="direction:ltr; text-align:left; float:left; font-size:30px;  color:#D9C21D; line-height: 1.0;  word-spacing: 3.5px;">
    <p style="font-size:50px"><b><u> Hello admin:</u></b></p>
    <br />
    <br />
<p ><a href="AdminShowUsers.aspx" style="color:#fff; font-size:40px;">Show users</a></p>
    <br />
    <br />
<p><a href="AdminsDetails.aspx" style="color:#fff; font-size:40px;">Show admin details</a></p>
    
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

