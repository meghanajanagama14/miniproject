<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="StatusUpdate.aspx.cs" Inherits="User_StatusUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
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
	<div class="container" style="margin-left:140px;min-height:500px;margin-top:-150px">
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Update Status</h2>
			</div>
            <div>
                <br /><br />
			<label for="username">What's on your mind..!!</label>
			<br/>
            <asp:TextBox ID="txtnamestatus" height="100px" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>
                <br />
            <asp:Button ID="btnstatus" BackColor="#FF5252"  ForeColor="White" runat="server" 
                    Text="Post" OnClick="btnstatus_Click" />
                <center>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                     <Columns>
                         <asp:BoundField DataField="uname" HeaderText="Posted By" />
                         <asp:BoundField DataField="StatusUpdate" HeaderText="Status" />
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
                    </center>
                </div>
		</div>
	</div>
       
        </form>
</body>

<script>
    $(document).ready(function () {
        $('#logo').addClass('animated fadeInDown');
        $("input:text:visible:first").focus();
    });
    $('#username').focus(function () {
        $('label[for="username"]').addClass('selected');
    });
    $('#username').blur(function () {
        $('label[for="username"]').removeClass('selected');
    });
    $('#password').focus(function () {
        $('label[for="password"]').addClass('selected');
    });
    $('#password').blur(function () {
        $('label[for="password"]').removeClass('selected');
    });
</script>

</asp:Content>

