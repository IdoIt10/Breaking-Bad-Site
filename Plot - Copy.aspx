<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Characters.aspx.cs" Inherits="more_information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />
    <br />
    <br />
    <br />
    
     <h1 style="color:#D9C21D; font-size:45px;">
                    plot:
                </h1>
    <br />
    <br />
                <p style="color:#D9C21D; font-size:40px;">
                    The show tells the story of Walter White, an underpaid and dispirited high school chemistry teacher,
                    <br />who is struggling with a recent diagnosis of stage-three lung cancer.
                    <br />White turns to a life of crime, partnering with his former student Jesse Pinkman, 
                    <br />by producing and distributing crystal meth to secure his family's financial future before he dies, while navigating the dangers of the criminal underworld.
                </p>
                <center>
                        <br />
    <br />
                    <br />
    <br />
                    <p style="color:#D9C21D; font-size:40px;">
                       
                        <a href="s1.aspx" style="color:#fff; font-size:40px;">S1:</a>
                        <br />  <a href="s2.aspx" style="color:#fff; font-size:40px;">S2:</a>
                        <br /> <a href="s3.aspx" style="color:#fff; font-size:40px;">S3:</a>
                        <br /> <a href="s4.aspx" style="color:#fff; font-size:40px;">S4:</a>
                        <br /> <a href="s5.aspx" style="color:#fff; font-size:40px;">S5:</a>

                    </p>
                </center>

     <script type="text/javascript">
        document.getElementById("label1").innerHTML ="plot";
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>