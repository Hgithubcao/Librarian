using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class StudentselfImformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ConnectionString = "Data Source=LZHGEDREWEN\\LZHSQL;Initial Catalog=Library;Integrated Security=True";
        string CommandString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        SqlCommand com;
        SqlDataReader dr;
        conn.Open();
        if (Session["Sid"] == null)
        {
            Session["Sid"] = "2012014327";
        }
        CommandString = "Select * from Student Where Sid='" + Session["Sid"].ToString() + "'";
        com = new SqlCommand(CommandString, conn);
        dr = com.ExecuteReader();
        if (dr.Read())
        {
            name.Text = dr["Sname"].ToString();
            id.Text = dr["Sid"].ToString();
            myname.Text = dr["Sname"].ToString();
            sex.Text = dr["Ssex"].ToString();
            dep.Text = dr["Sdep"].ToString();
            grade.Text = dr["Sgrade"].ToString();
            name.Text = dr["Sname"].ToString();
            string Skind = dr["Skind"].ToString();
            if (Skind == "U")
                kind.Text = "易超时读者";
            if (Skind == "D")
                kind.Text = "多延时读者";
            if (Skind == "N")
                kind.Text = "新读者";
            if (Skind == "B")
                kind.Text = "可信读者";
            most.Text = dr["Sbmost"].ToString();
            now.Text = dr["Sbnow"].ToString();
            sreturn.Text = dr["Sbreturn"].ToString();
            miss.Text = dr["Sbmiss"].ToString();
            delay.Text = dr["Sbdelay"].ToString();
        }
        else
            name.Text = "????";
    }
    protected void Exit_Click(object sender, EventArgs e)
    {
        Session["Sid"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void Information_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentselfImformation.aspx");
    }
    protected void Index_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentIndex.aspx");
    }
    protected void Boorrow_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentBoorrow.aspx");
    }
}