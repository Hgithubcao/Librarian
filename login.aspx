<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
        <div style="position:absolute;top:80px;left:180px;font-family:黑体"><font size = "5" color = "black"><asp:Label ID="Label1" runat="server" Text="登陆"></asp:Label></font></div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        <br />

        <div style="position:absolute;top:124px; left:99px; font-family:楷体; height: 183px; width: 270px;" title="登陆">
        <asp:Label ID="Label2" runat="server" Text="帐号："></asp:Label>
        <asp:TextBox ID="no" runat="server"></asp:TextBox>
        
        <br /><br />

        <asp:Label ID="Label3" runat="server" Text="密码："></asp:Label>
        <asp:TextBox Type="Password" name="Password" id="password" runat="server"></asp:TextBox>
            <br /><br />
        <asp:Label ID="Label4" runat="server" Text="类型： "></asp:Label>
        <asp:DropDownList ID="LorS" runat="server">
            <asp:ListItem>Student</asp:ListItem>
            <asp:ListItem>Librarian</asp:ListItem>
        </asp:DropDownList>
            <br />
            <font size = "3" color = "red"><asp:Label ID="wrong" runat="server" style="font-family:黑体"></asp:Label></font>
            <br />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="dl.jpg" OnClick="ImageButton1_Click" />
       
        </div>


        <div style="position:absolute;top:81px; left:382px; height: 378px; width: 650px;">
        <asp:Image ID="Image1" runat="server"  ImageUrl="图书馆.jpg"/>
        </div>
    
        
        <font size = "1" color = "black"><asp:Label ID="Label6" runat="server" Text="Copyright 计科1202-李振华-2012014327" style="position:absolute;top:510px;left:350px;font-family:宋体"></asp:Label></font>
    
        
    </div>
        
    </form>
</body>
</html>
