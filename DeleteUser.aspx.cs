using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UserDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() == "guest")
        {
            Session["ErrorText"] = "The guest doesn't have data in the system";
            Response.Redirect("ErrorPage-.aspx");
        }
        
        
        string btn = Request.Form["Btn"];
        //string del = Request.Form["delete"];

        if (btn != null)
        {
            string connString = Session["connectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            string cmdString = string.Format("DELETE FROM TbUsers WHERE (userName = N'{0}')", Session["Login"]);
            SqlCommand cmd = new SqlCommand(cmdString, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Logout.aspx");
        }
    }
}