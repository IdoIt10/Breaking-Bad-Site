<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr; text-align:left; float:left; font-size:35px; color:#D9C21D">
    <script>
        document.getElementById("label1").innerHTML = "<%=PageTitle()%>";
    </script>
        <br />
        <br />

    <span id="UserDetails">
        <u style="color:#D9C21D">
        <%if (Session["Login"] != null)
        {
            Response.Write("Hello: " + fullName);   
        }
        %>
        </u>
        <br />
        <br />
        Data:
    </span>
    <table dir="ltr">
        <tr>
            <td><%=userColumnsTable %></td>
            <td><%=userDetailsTable %></td>
        </tr>
    </table>
    &nbsp&nbsp&nbsp&nbsp&nbsp
        <div style="text-align:left; color:white"><a href="DeleteUser.aspx" style="color:#fff; font-size:35px;">Delete user</a>
            <a style="color:transparent">/////</a>
        <a href="UpdateUD1.aspx" style="color:#fff; font-size:35px;">Update</a></div>
    
    </div>
</asp:Content>