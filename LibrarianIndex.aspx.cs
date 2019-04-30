using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LibrarianIndex : System.Web.UI.Page
{
    private string ConnectionString = "Data Source=LZHGEDREWEN\\LZHSQL;Initial Catalog=Library;Integrated Security=True";
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConnectionString);
        conn.Open();
    }
    protected void Index_Click(object sender, EventArgs e)
    {
        Response.Redirect("LibrarianIndex.aspx");
    }
    protected void Exit_Click(object sender, EventArgs e)
    {
        Session["Lid"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void BookBorrow_Click(object sender, EventArgs e)
    {
        Response.Redirect("LibrarianBookBorrow.aspx");
    }
    protected void AddBook_Click(object sender, EventArgs e)
    {
        Response.Redirect("LibrarianAddBook.aspx");
    }
    protected void AddLibrarian_Click(object sender, EventArgs e)
    {
        Response.Redirect("LibrarianAddLibrarian.aspx");
    }
    protected void add_Click(object sender, EventArgs e)
    {
        if (id.Text == "" || name.Text == "" || sex.Text == "" || dep.Text == "" || grade.Text == "")
        {
            Label7.Visible = true;
            Label7.Text = "不能为空";
            return;
        }
        string CommandString;
        SqlCommand com;
        CommandString = "Insert Into Student(Sid,Sname,Ssex,Sdep,Sgrade) VALUES('" + id.Text + "','" + name.Text + "','" + sex.Text + "','" + dep.Text + "','" + grade.Text + "')";
        com = new SqlCommand(CommandString, conn);
        com.ExecuteNonQuery();
        Response.Redirect("LibrarianIndex.aspx");
        Label7.Visible = true;
        //this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text = "已被借阅";
        //Label8.Text = "你已成功借阅" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}