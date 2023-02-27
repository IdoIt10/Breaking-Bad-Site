using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminsDetails : System.Web.UI.Page
{
    public string str = "<table border='1'><tr><td>Username</td><td>Firstname</td><td>Lastname</td><td>Email</td><td>Phone</td><tr>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"].ToString() != "Y")
        {
            Session["ErrorText"] = "Only admin can access this page";
            Response.Redirect("ErrorPage-.aspx");
        }
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("XMLFile.xml"));
        foreach (DataRow rw in ds.Tables[0].Rows)
        {
            str += ("<td>" + rw["UserName"] + "</td><td>" + rw["FirstName"] + "</td><td>" + rw["LastName"] + "</td><td>" + rw["Email"] + "</td><td>" + rw["Phone"] + "</td>");
            str += "</tr>";
        }
    }
}