<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentselfImformation.aspx.cs" Inherits="StudentselfImformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <font size = "10" color = "black"><asp:Label ID="Label5" runat="server" Text="图书管理系统" BackColor="#3366FF" style="position:absolute;top:10px;left:350px;font-family:黑体"></asp:Label>
    <font size = "1" color = "black"><asp:Label ID="Label6" runat="server" Text="Copyright 计科1202-李振华-2012014327" style="position:absolute;top:510px;left:350px;font-family:宋体"></asp:Label></font>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        </font>
            <div style="position:absolute;top:140px;left:120px">
            <asp:Label ID="Sid" runat="server" Text="卡号："></asp:Label>
                <asp:Label ID="id" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sname" runat="server" Text="姓名："></asp:Label>
                <asp:Label ID="myname" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Ssex" runat="server" Text="性别："></asp:Label>
                <asp:Label ID="sex" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sdep" runat="server" Text="部门："></asp:Label>
                <asp:Label ID="dep" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sgrade" runat="server" Text="年级："></asp:Label>
                <asp:Label ID="grade" runat="server"></asp:Label>
                <br />
            </div>
        <br />
        
    

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
    
            <div style="position:absolute;top:140px; left:300px">
            <asp:Label ID="Sking" runat="server" Text="读者类型："></asp:Label>
                <asp:Label ID="kind" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sbmost" runat="server" Text="最多借阅："></asp:Label>
                <asp:Label ID="most" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sbnow" runat="server" Text="正在借阅："></asp:Label>
                <asp:Label ID="now" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sbreturn" runat="server" Text="归还次数："></asp:Label>
                <asp:Label ID="sreturn" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sbmiss" runat="server" Text="超时次数："></asp:Label>
                <asp:Label ID="miss" runat="server"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Sbdelay" runat="server" Text="延时次数："></asp:Label>
                <asp:Label ID="delay" runat="server"></asp:Label>
                <br />
            </div>
    
    </div>
    </form>
</body>
</html>
