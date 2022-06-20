<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Words.aspx.cs" Inherits="Admin_Words" %>

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
	<div class="container" style="margin-left:140px;height:400px">
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Add Words</h2>
			</div>
            <div>
                <br /><br />
			<label for="username">Words Category</label>
			<br/>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>---Select---</asp:ListItem>
                <asp:ListItem>Bad Words</asp:ListItem>
                <asp:ListItem>Illegal Words</asp:ListItem>
                <asp:ListItem>Restricted Words</asp:ListItem>
                </asp:DropDownList>
			<br/><br />
            <label for="username">Words</label>
            <br />
            <asp:TextBox ID="txtwords" style="text-align:center;border-color:green"  runat="server" ></asp:TextBox>
			<br/>
            <asp:Button ID="btnsubmit" BackColor="#FF5252" ForeColor="White" runat="server" Text="Sign In" OnClick="btnsubmit_Click" />
			
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


