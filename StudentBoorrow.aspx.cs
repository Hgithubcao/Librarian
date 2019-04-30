using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class StudentBoorrow : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        string ConnectionString = "Data Source=LZHGEDREWEN\\LZHSQL;Initial Catalog=Library;Integrated Security=True";
        string CommandString;
        conn = new SqlConnection(ConnectionString);
        SqlCommand com;
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
        }
        else
            name.Text = "李振华";
        dr.Close();

        CommandString = "Select * from borrow where Sid='" + Session["Sid"].ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter(CommandString, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "borrow");
        DataRow[] drr = ds.Tables["borrow"].Select("Sid='" + Session["Sid"].ToString() + "'");
        if (drr.Count() == 0)
        {
            GridView1.DataSourceID = null;
        }
        else
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = ds.Tables["borrow"].DefaultView;
            GridView1.DataBind();
        }
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

        BookReturn.Enabled = true;
        BookDelay.Enabled = true;
          //  CommandString = "Insert Into Borrow(Bid,Bname,Sid) VALUES('" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "','" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text + "','" + Session["Sid"].ToString() + "')";
       //     com = new SqlCommand(CommandString, conn);
          //  com.ExecuteNonQuery();
 //           this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text = "已被借阅";
   //         Label8.Text = "你已成功借阅" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;

    }
    protected void BookReturn_Click(object sender, EventArgs e)
    {
        //string CommandString;
        //SqlCommand com;
        if (this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text.Length > 6)
        {
            Label7.Text = "你已经还过了";//this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text +" " + GridView1.SelectedIndex.ToString();// 
            return;
        }
        SqlDataAdapter da = new SqlDataAdapter("select * from Borrow where bsid='" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text +"' AND BSid is not null", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "borrow");
        DataRow dr = ds.Tables["borrow"].Rows[0];
        //Label7.Text = dr["Bname"].ToString() + dr["Btime"].ToString() + dr["Ltime"].ToString();
        dr["Rtime"] = DateTime.Now.ToString("yyyy-MM-dd");
        //foreach (DataRow dr in Rows）
        //{
        //}
        /*for (int i = 0; i < ds.Table["borrow"].Row; i++)
        {
            DataRow dr = ds.Rows[i];
            //TODO
            //循环处理
        }*/
        SqlCommandBuilder cb = new SqlCommandBuilder(da);
        da.Update(ds, "borrow");
       // CommandString = "Update Borrow Set Rtime='" + DateTime.Now.ToString("yyyy-MM-dd") + "' Where BSid=" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        /*CommandString = "Update Borrow Set Rtime='" + DateTime.Now.ToString("yyyy-MM-dd") + "' Where BSid='" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "' AND RTIME=''";
        com = new SqlCommand(CommandString, conn);
        /*CommandString = "Select * from Borrow Where BSid='" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text +"'";
        com = new SqlCommand(CommandString, conn);
        dr = com.ExecuteReader();
        if (dr.Read())
        {
            Label7.Text = dr["Bid"].ToString() + dr["Bname"].ToString() + dr["Sid"].ToString() + dr["Rtime"].ToString();
        }*/
        //com.ExecuteNonQuery();
       // Label7.Text = this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;// 
        this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text = DateTime.Now.ToString("yyyy-MM-dd");
        Label7.Text = "你已成功还书";
    }
    protected void BookDelay_Click(object sender, EventArgs e)
    {
        if (this.GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text.Length > 6)
        {
            Label7.Text = "你已经还过了,不用延期";//this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text +" " + GridView1.SelectedIndex.ToString();// 
            return;
        }
        SqlDataAdapter da = new SqlDataAdapter("select * from Borrow where bsid='" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "' AND BSid is not null", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "borrow");
        DataRow dr = ds.Tables["borrow"].Rows[0];
        dr["Ltime"] = Convert.ToDateTime(this.GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text).AddMonths(1).ToString();
        SqlCommandBuilder cb = new SqlCommandBuilder(da);
        da.Update(ds, "borrow");
       /* //DateTime  dt = this.GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text.ToDateString().AddMonths(6);
        string CommandString;
        SqlCommand com;
        CommandString = "Update Borrow Set Ltime=(select dateadd(month,1,Borrow.Ltime)) Where SBid='" + this.GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "'";
        com = new SqlCommand(CommandString, conn);
        com.ExecuteNonQuery();*/
        this.GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text = dr["Ltime"].ToString();
        Label7.Text = "你已成功延时一个月";
    }
}