<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminsDetails.aspx.cs" Inherits="AdminsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr; text-align:left; float:left; font-size:35px; color:#D9C21D; line-height: 1.8;">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "admin info";
    </script>
        <br />
        <br />
    <table><%=str %></table>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>