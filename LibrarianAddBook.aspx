<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LibrarianAddBook.aspx.cs" Inherits="数据库代码_LibrarianAddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <font size = "10" color = "black"><asp:Label ID="Label5" runat="server" Text="图书管理系统" BackColor="#3366FF" style="position:absolute;top:10px;left:350px;font-family:黑体"></asp:Label></font>
    
        
        <div style="position:absolute;top:100px;left:10px">
    
        <asp:Button ID="Index" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="增加用户" Width="103px" OnClick="Index_Click" />
    
        <br />
        <br />
        <asp:Button ID="BookBorrow" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="查看借阅情况" Width="103px" OnClick="BookBorrow_Click" />
    
        <br />
    
        <br />
        <asp:Button ID="AddBook" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="增加图书" Width="103px" OnClick="AddBook_Click" />
        <br />
        <br />
        <asp:Button ID="Exit" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="注销" Width="103px" OnClick="Exit_Click" />
        <br />
    </div>
    
            
        
    
        

        <div style="position:absolute;top:100px;left:850px">
            <asp:Label ID="Bid" runat="server" Text="书号："></asp:Label>
        <asp:TextBox ID="id" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Bname" runat="server" Text="书名："></asp:Label>
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Bauthor" runat="server" Text="作者："></asp:Label>
        <asp:TextBox ID="author" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Bprice" runat="server" Text="价格："></asp:Label>
        <asp:TextBox ID="price" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Spress" runat="server" Text="出版社："></asp:Label>
    
        
        <asp:TextBox ID="press" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="简介："></asp:Label>
        <asp:TextBox ID="summary" runat="server"></asp:TextBox>
            <br />
            <font size = "10" color = "black">
            <asp:Button ID="add" runat="server" Text="确认" OnClick="add_Click" />
    
        
            
    
        
        </font>
            <asp:Label ID="Label7" runat="server" Text="添加成功" Visible="False"></asp:Label>
            <br />
                </div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
    
    </div>
        <p>
    
        
        <font size = "1" color = "black"><asp:Label ID="Label6" runat="server" Text="Copyright 计科1202-李振华-2012014327" style="position:absolute;top:510px;left:350px;font-family:宋体"></asp:Label>
        
            </font>
        </p>
        <asp:GridView ID="GridView1" style="position:absolute;top:100px;left:120px;font-family:楷体" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Bid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Bid" HeaderText="Bid" ReadOnly="True" SortExpression="Bid" />
                <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                <asp:BoundField DataField="Bauthor" HeaderText="Bauthor" SortExpression="Bauthor" />
                <asp:BoundField DataField="Bprice" HeaderText="Bprice" SortExpression="Bprice" />
                <asp:BoundField DataField="Bpress" HeaderText="Bpress" SortExpression="Bpress" />
                <asp:BoundField DataField="Bsummary" HeaderText="Bsummary" SortExpression="Bsummary" />
                <asp:BoundField DataField="Bifborrow" HeaderText="Bifborrow" SortExpression="Bifborrow" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </form>
</body>
</html>
