<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminShowUsers.aspx.cs" Inherits="AdminShowUsers" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    void Button1_Click (object sender, EventArgs e)
    {
        if (Request.Form["demo"] != "()")
            deleteWhere = Request.Form["demo"];
        else
            deleteWhere = "";
        if (deleteWhere != "")
        {
            string connString = Session["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            string cmdString = string.Format("DELETE FROM TbUsers WHERE userName in {0}", deleteWhere);
            SqlCommand cmd = new SqlCommand(cmdString, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            cmdString = string.Format("DELETE FROM TbHistory WHERE userName in {0}", deleteWhere);
            cmd = new SqlCommand(cmdString, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("AdminPage.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr; float:left; font-size:20px; color:#D9C21D">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "user info";
        function check() {
            var n1 = document.getElementsByName["where1"].value;
            var n2 = document.getElementsByName["where2"].value;
            if (n1 == n2) {
                document.getElementById("err_where").innerHTML = "The two incisions must be different";
                return false;
            }
            document.getElementById("err_where").innerHTML = "";
            return true;
        }
    </script>
          
    <form name="AdminShowUsers" action="AdminShowUsers.aspx" method="post" runat="server">
        
        <table>
            <tr><td>
                <span>Choose by</span>
                    <select name="where1">
                        <option value="firstName">Firstname</option>
                        <option  value="lastName">Lastname</option>
                        <option value="userName">Username</option>
                        <option value="email">Email</option>
                        <option  value="phone">Phone</option>
                    </select>
                <span> = </span>
                <input type="text" id="txt1" name="txt1" placeholder="enter value" />
            </td></tr>
            <tr><td>
                 <span>Choose by</span>
                    <select name="where2">
                        <option value="firstName">Firstname</option>
                        <option  value="lastName">Lastname</option>
                        <option value="userName">Username</option>
                        <option value="email">Email</option>
                        <option  value="phone">Phone</option>
                    </select>
                <span> = </span>
                <input type="text" id="txt2" name="txt2" placeholder="enter value" />
                <input type="submit" value="Choose" name="sub" id="sub" />
            </td></tr>
            <tr><td id="err_where" style="color:red; font-weight:bold"> </td></tr>
        </table>
        <br />

        <div runat="server" style="font-size:20px">
            <%=str %>
            <p id="SqlWhere" style="visibility:hidden">X</p>
        </div>
        <asp:button id="Button1"
       text="Delete users"
       onclientclick="Navigate()"
       runat="server" onclick="Button1_Click" style="font-size:20px"/>
           
        <p><input type="text" id="demo" name="demo" size="25" style="visibility:hidden" /></p>
        
    </form>
    <script type="text/javascript">
      function Navigate()
      {
          var length = document.getElementById("tbl1").rows.length;
          var chkStr = "chk";
          var temp = ""
          var flag = true;
          var users = [];
          var counter = 0;

          for (var i = 1; i < length; i++) {
              temp = chkStr + (i - 1);
              flag = document.getElementById(temp).checked;
              if (flag) {
                  users[counter] = document.getElementById("tbl1").rows[i].cells[2].innerHTML;
                  counter++;
              }
          }
          sqlStr = "(";
          for (var i = 0; i < counter; i++) {
              sqlStr += "N'" + users[i] + "'";
              if (i < counter - 1) {
                  sqlStr += ", ";
              }
          }
          sqlStr += ")";

          document.getElementById("SqlWhere").innerHTML = sqlStr;
          var s = "p: " + document.getElementById("SqlWhere").innerHTML;

          document.getElementById("demo").value = sqlStr;

      }    

    </script>
    </div>
</asp:Content>