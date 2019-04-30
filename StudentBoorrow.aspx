<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentBoorrow.aspx.cs" Inherits="StudentBoorrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
    
    </div>
    
        <div style="position:absolute;top:100px;left:10px">
        <asp:Label ID="welcome" runat="server" Text="欢迎你,"></asp:Label>
        <asp:Label ID="name" runat="server" style="font-family:仿宋"></asp:Label>
    
        <br />
        <br />
        <asp:Button ID="Index" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="首页" Width="103px" OnClick="Index_Click" />
    
        <br />
    
        <br />
        <asp:Button ID="Information" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="个人信息" Width="103px" OnClick="Information_Click" />
        <br />
        <br />
        <asp:Button ID="Boorrow" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="借阅情况" Width="103px" OnClick="Boorrow_Click" />
        <br />
        <br />
        <asp:Button ID="Exit" runat="server" BackColor="#993333" BorderStyle="None" Font-Overline="False" Font-Underline="False" ForeColor="White" Height="36px" Text="注销" Width="103px" OnClick="Exit_Click" />
        <br />
    </div>
        <font size = "10" color = "black"><asp:Label ID="Label5" runat="server" Text="图书管理系统" BackColor="#3366FF" style="position:absolute;top:10px;left:350px;font-family:黑体"></asp:Label>
    <font size = "1" color = "black"><asp:Label ID="Label6" runat="server" Text="Copyright 计科1202-李振华-2012014327" style="position:absolute;top:510px;left:350px;font-family:宋体"></asp:Label></font>
        </font>
        <asp:SqlDataSource ID="BorrowSQL" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Borrow]"></asp:SqlDataSource>
        
        
        
        <div style="position:absolute;top:100px;left:300px">
        <asp:Button ID="BookReturn" runat="server" Text="还书" OnClick="BookReturn_Click" Enabled="False" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="BookDelay" runat="server" Text="延期一个月" Enabled="False" OnClick="BookDelay_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server"></asp:Label>
        </div>
        <asp:GridView style="position:absolute;top:140px;left:120px;font-family:楷体" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Bid" DataSourceID="BorrowSQL" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BSid" HeaderText="BSid" ReadOnly="True" SortExpression="BSid" />
                <asp:BoundField DataField="Bid" HeaderText="Bid" ReadOnly="True" SortExpression="Bid" />
                <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                <asp:BoundField DataField="Sid" HeaderText="Sid" SortExpression="Sid" />
                <asp:BoundField DataField="Btime" HeaderText="Btime" SortExpression="Btime" />
                <asp:BoundField DataField="Ltime" HeaderText="Ltime" SortExpression="Ltime" />
                <asp:BoundField DataField="Rtime" HeaderText="Rtime" SortExpression="Rtime" />
                <asp:BoundField DataField="Finemoney" HeaderText="Finemoney" SortExpression="Finemoney" />
                <asp:CommandField ShowSelectButton="True" />
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
