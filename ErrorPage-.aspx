<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ErrorPage-.aspx.cs" Inherits="ErrorPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
        <br />
    <br />
    <br />
    <h1 style="color:Red; text-align:center; font-size:80px;"><%=errorStr %></h1>
    <script style="color:Red; text-align:center; font-size:100px;">document.getElementById("label1").innerHTML = "error page";</script>

</asp:Content>


