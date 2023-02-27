<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "quiz";
    </script>

    
     <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
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
                Response.Redirect("Sgame - Copy.aspx");

        %>
</asp:Content>