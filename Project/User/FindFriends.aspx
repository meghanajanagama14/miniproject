<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="FindFriends.aspx.cs" Inherits="User_FindFriends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html>

<head>
	<meta charset="utf-8">
	<title>Daily UI - Day 1 Sign In</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="../css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="../css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <form id="Form1" runat="server">
	<div class="container" style="margin-left:120px;height:1000px">
		<div class="login-box animated fadeInUp">
            <table class="auto-style1">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 23px">
                        Name</td>
                    <td style="height: 23px">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
			<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False">
                <Columns>
                   <asp:BoundField DataField="UserName" HeaderText="Name" />
                    <asp:TemplateField HeaderText="Photo" HeaderStyle-Width="100px">
            <ItemTemplate>

                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Photo") %>'
                     Height="80px" Width="100px" />
            </ItemTemplate>
        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Status">
        <ItemTemplate>
       <asp:LinkButton runat="server"  ID="lnkView" Text='<%# Bind("Status") %>'  OnClick="lnkView_Click"></asp:LinkButton>
         </ItemTemplate>
       </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
                       </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
		</div>
	</div>
        </form>
</body>


</html>
</asp:Content>
