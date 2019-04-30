using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class StudentIndex : System.Web.UI.Page
{
    private string ConnectionString = "Data Source=LZHGEDREWEN\\LZHSQL;Initial Catalog=Library;Integrated Security=True";
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConnectionString);
        string CommandString;      
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
            name.Text = dr["Sname"].ToString();
        else
            name.Text = "????";
        dr.Close();
    }
    protected void Borrow_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentBoorrow.aspx");
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
    protected void Boorrow_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentBoorrow.aspx");
    }
    protected void Index_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentIndex.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text == "已被借阅")
        {
            Label8.Text = this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text + "已被借阅";
        }
        else
        {
            string CommandString;
            SqlCommand com;
            CommandString = "Insert Into Borrow(BSid,Bid,Bname,Sid) VALUES((select count(*) from borrow)+1,'" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "','" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text + "','" + Session["Sid"].ToString() + "')";
            com = new SqlCommand(CommandString, conn);
            com.ExecuteNonQuery();
            this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text = "已被借阅";
            Label8.Text = "你已成功借阅" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        }
    }
    protected void Search_Click(object sender, EventArgs e)
    {
        string com = "Select * from book where Bname='" + SearchBook.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(com, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "book");
        //GridView1.DataSource = 
        DataRow[] dr =  ds.Tables["book"].Select("Bname='" + SearchBook.Text.ToString() + "'");
        if (dr.Count() == 0)
        {
            Label8.Text = "没有找到你所需要的书籍";
        }
        else
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = ds.Tables["book"].DefaultView;
            GridView1.DataBind();
        }
        
       // Response.Redirect("StudentIndex.aspx");
    }
    protected void BookBorrow_Click(object sender, EventArgs e)
    {

    }
}