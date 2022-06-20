﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <form runat="server">
	<div class="container" style="margin-left:140px">
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Admin</h2>
			</div>
            <div>
                <br /><br />
			<label for="username">Username</label>
			<br/>
            <asp:TextBox ID="txtname" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>
            <label for="username">Password</label>
            <br />
            <asp:TextBox ID="txtpwd" style="text-align:center;border-color:green" TextMode="Password" runat="server"></asp:TextBox>
			<br/>
			<br/>
            <asp:Button ID="btnLogin" BackColor="#FF5252" ForeColor="White" runat="server" Text="Sign In" OnClick="btnLogin_Click" />
			<br/>
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

</html>
</asp:Content>

