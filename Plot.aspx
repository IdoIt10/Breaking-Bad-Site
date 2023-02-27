<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Characters.aspx.cs" Inherits="more_information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <%if (Session["Player"] == null)
        {
                Response.Redirect("Error-.aspx");
        }
          else
                Response.Redirect("Plot - Copy.aspx");

        %>
   

     <script type="text/javascript">
        document.getElementById("label1").innerHTML ="plot";
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>