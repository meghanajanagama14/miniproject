<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html>

<head>
	<meta charset="utf-8">
	<title>Daily UI - Day 1 Sign In</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <form id="Form1" runat="server">
	<div class="container" style="margin-left:140px;">
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Sign Up</h2>
			</div>
            <div>
                <br /><br />
			<label for="username">UserName</label>
			<br/>
            <asp:TextBox ID="txtuname" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>

            <label for="username">Password</label>
			<br/>
            <asp:TextBox ID="txtpwd" TextMode="Password" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>

                  <label for="username">Mobile No</label>
			<br/>
            <asp:TextBox ID="txtmob" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>

                  <label for="username">EmailID</label>
			<br/>
            <asp:TextBox ID="txtemail" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>
                <label for="username">Gender</label>
			<br/>
                &nbsp;
                <div style="margin-left:90px">
        <asp:RadioButtonList ID="RadioButtonList1"  runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                
                    </div>

                  <label for="username">dob</label>
			<br/>
            <asp:TextBox ID="txtdob"   style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>

                 <label for="username">Address</label>
			<br/>
            <asp:TextBox ID="txtAddress" style="text-align:center;border-color:green;" runat="server"></asp:TextBox>
			<br/>

            <asp:Button ID="btnForgot" BackColor="#FF5252" ForeColor="White" runat="server" Text="Submit" OnClick="btnSignup_Click" />
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

