using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UserDetails : System.Web.UI.Page
{
    protected string userColumnsTable = "";
    protected string userDetailsTable = "";
    protected string fullName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string cmdString = "";
        SqlCommand cmd;
        if (Session["Login"].ToString()== "guest")
        {
            Session["ErrorText"] = " The guest doesn't have data";
            Response.Redirect("ErrorPage-.aspx");
        }

        userColumnsTable += "<table><tr><td>Username:</td></tr><tr><td>Password:</td></tr><tr><td>Email:</td></tr><tr><td>Firstname:</td></tr><tr><td> Lastname:</td></tr><tr><td> Phone:</td></tr>";
        if (Session["Admin"].ToString() == "N")
        {   //format for regular user


            string connString = Session["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            cmdString = string.Format("SELECT * FROM TbUsers WHERE (userName = N'{0}')", Session["Login"]);
            cmd = new SqlCommand(cmdString, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmdString, connString);
            DataSet ds = new DataSet();
            da.Fill(ds);
            
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                userDetailsTable += "<table><tr><td>" + ds.Tables[0].Rows[i]["userName"] + "</td></tr>" + "<tr><td>" + ds.Tables[0].Rows[i]["password"] + "</td></tr>" + "<tr><td>" + ds.Tables[0].Rows[i]["email"] + "</td></tr>" + "<tr><td>" + ds.Tables[0].Rows[i]["firstName"] + "</td></tr>" + "<tr><td>" + ds.Tables[0].Rows[i]["lastName"] + "</td></tr>" + "<tr><td>" + "<tr><td>" + ds.Tables[0].Rows[i]["phone"] + "</td></tr>";
                fullName += ds.Tables[0].Rows[i]["firstName"] + " " + ds.Tables[0].Rows[i]["lastName"];
            }
            conn.Close();
        }
        else  // format for admin
        {
            DataSet ds = new DataSet();
            ds.ReadXml(MapPath("XMLFile.xml"));
            foreach (DataRow rw in ds.Tables[0].Rows)
            {
                if (rw["UserName"].ToString() == Session["Login"].ToString())
                {
                    userDetailsTable += ("<table><tr><td>" + rw["UserName"] + "</td></tr><tr><td>" + rw["Password"] + "</td></tr><tr><td>" + rw["Email"] + "</td></tr><tr><td>" + rw["FirstName"] + "</td></tr><tr><td>" + rw["LastName"] + "</td></tr><tr><td>" + rw["Phone"] + "</td>");
                    userDetailsTable += "</tr>";
                    fullName += rw["FirstName"] + " " + rw["LastName"];
                }
            }
        }
        userDetailsTable += "</table>";
        userColumnsTable += "</table>";
        
    }
    public string PageTitle()
    {
        if (Session["Admin"].ToString()== "Y")
        {
            return "Admin data";
        }
        return "User data";
    }
   
}