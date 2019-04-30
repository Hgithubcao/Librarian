<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LibrarianIndex.aspx.cs" Inherits="LibrarianIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
    
        <font size = "10" color = "black"><asp:Label ID="Label5" runat="server" Text="图书管理系统" BackColor="#3366FF" style="position:absolute;top:10px;left:350px;font-family:黑体"></asp:Label></font>
    
        
        <font size = "1" color = "black"><asp:Label ID="Label6" runat="server" Text="Copyright 计科1202-李振华-2012014327" style="position:absolute;top:510px;left:350px;font-family:宋体"></asp:Label></font>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" style="position:absolute;top:100px;left:120px;font-family:楷体" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Sid" HeaderText="Sid" ReadOnly="True" SortExpression="Sid" />
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Ssex" HeaderText="Ssex" SortExpression="Ssex" />
                <asp:BoundField DataField="Sdep" HeaderText="Sdep" SortExpression="Sdep" />
                <asp:BoundField DataField="Skind" HeaderText="Skind" SortExpression="Skind" />
                <asp:BoundField DataField="Sgrade" HeaderText="Sgrade" SortExpression="Sgrade" />
                <asp:BoundField DataField="Spassword" HeaderText="Spassword" SortExpression="Spassword" />
                <asp:BoundField DataField="Sbmost" HeaderText="Sbmost" SortExpression="Sbmost" />
                <asp:BoundField DataField="Sbnow" HeaderText="Sbnow" SortExpression="Sbnow" />
                <asp:BoundField DataField="Sbmiss" HeaderText="Sbmiss" SortExpression="Sbmiss" />
                <asp:BoundField DataField="Sbdelay" HeaderText="Sbdelay" SortExpression="Sbdelay" />
                <asp:BoundField DataField="Sbreturn" HeaderText="Sbreturn" SortExpression="Sbreturn" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Borrow]"></asp:SqlDataSource>
        
            
        
    
        

        <div style="position:absolute;top:100px;left:900px">
            <asp:Label ID="Sid" runat="server" Text="学号："></asp:Label>
        <asp:TextBox ID="id" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Sname" runat="server" Text="姓名："></asp:Label>
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Ssex" runat="server" Text="性别："></asp:Label>
        <asp:TextBox ID="sex" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Sdep" runat="server" Text="部门："></asp:Label>
        <asp:TextBox ID="dep" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Sgrade" runat="server" Text="年级："></asp:Label>
    
        
        <asp:TextBox ID="grade" runat="server"></asp:TextBox>
            <br />
            <font size = "10" color = "black">
            <asp:Button ID="add" runat="server" Text="确认" OnClick="add_Click" />
    
        
            
    
        
        </font>
            <asp:Label ID="Label7" runat="server" Text="添加成功" Visible="False"></asp:Label>
            <br />
                </div>
    
    </div>
    </form>
</body>
</html>
