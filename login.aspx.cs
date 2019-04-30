using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
  
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
    protected void RememberMe_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Blogin_Click(object sender, EventArgs e)
    {
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //int WrongKind = 1;//0成功 1有空 2账号错 3密码
        if (no.Text == "")
        {
            wrong.Text = "请完整输入账号";
            return;
        }
        if(password.Text == "")
        {
            wrong.Text = "请完整输入密码";
            return;
        }
        string ConnectionString = "Data Source=LZHGEDREWEN\\LZHSQL;Initial Catalog=Library;Integrated Security=True";
        string CommandString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        SqlCommand com;
        SqlDataReader dr;
        conn.Open();       
        if (LorS.SelectedValue == "Student")
        {
            CommandString = "Select * from Student Where Sid='" + no.Text +"'";
            com = new SqlCommand(CommandString,conn);
            dr = com.ExecuteReader();
            if (!dr.Read())
            {
                wrong.Text = "账号不存在";
                return;
            }
            else
            {
                if (dr["Spassword"].ToString() != password.Text.ToString())
                {
                    wrong.Text = "密码错误";
                    return;
                }
                Session["Sid"] = dr["Sid"].ToString();
                Response.Redirect("StudentIndex.aspx");
                return;
            }
        }
        else
        {
            CommandString = "Select * from Librarian Where Lid='" + no.Text + "'";
            com = new SqlCommand(CommandString, conn);
            dr = com.ExecuteReader();
            if (!dr.Read())
            {
                wrong.Text = "你不是管理员，无权登陆";
                return;
            }
            else
            {
                if (dr["Lpassword"].ToString() != password.Text.ToString())
                {
                    wrong.Text = "密码错误";
                    return;
                }
                Session["Lid"] = dr["Lid"].ToString();
                Response.Redirect("LibrarianIndex.aspx");
            }
        }
    }
}